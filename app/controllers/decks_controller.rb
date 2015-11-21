class DecksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index

    if params[:user_id]
      @user = current_user
      @decks = @user.decks.all
      @deck = @user.decks.new
      redirect_to new_user_deck_path
    else
      @decks = Deck.where(:published => true)
      @deck = Deck.new
    end
  end

  def create
    @user = current_user
    @deck = @user.decks.new(deck_params)
    @deck.last_touched = DateTime.now
    if @deck.save
      flash[:notice] = "#{@deck.title} was successfully created."
      @deck.last_touched = DateTime.now.to_date
      redirect_to user_decks_path
    else
      redirect_to user_decks_path
    end
  end

  def new
    if params[:user_id]
      @user = current_user
      @deck = @user.decks.new
      @card = @deck.cards.new
      @decks = @user.decks.all
    else
      flash[:alert] = "You must be signed in to create a deck"
      redirect_to root
    end
  end

  def edit
    @user = current_user
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    @card = @deck.cards.new
  end

  def show
    @deck = Deck.find(params[:id])
    @deck.last_touched = DateTime.now
    @deck.save
    if @deck.cards [] # == ? 
      @card = @deck.cards.first
    else
      @card = @deck.cards.new
    end
    redirect_to deck_card_path(@deck, @card)
  end

  def update
    @deck = Deck.find(params[:id])
    if params[:published] = true
      if @deck.cards.length >= 5 # this is a great candidate for a custom validation
	# check out http://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
        if @deck.update(deck_params)
          flash[:notice] = "Deck has been updated."
          redirect_to edit_deck_path(@deck.id)
        else
          redirect_to edit_deck_path(@deck.id)
        end
      else
          flash[:notice] = "You must have at least 5 cards before publishing."
          redirect_to edit_deck_path(@deck.id)
      end
    else
      if @deck.update(deck_params)
        flash[:notice] = "Deck has been updated."
        redirect_to edit_deck_path(@deck.id)
      end
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to user_decks_path(current_user.id)
  end

  private

  def deck_params
    params.require(:deck).permit(:title, :published, :last_touched)
  end

  def card_params
    params.require(:card).permit(:question, :answer)
  end

end
