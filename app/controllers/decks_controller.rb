class DecksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = current_user
      @decks = @user.decks.all
      @deck = @user.decks.new
      redirect_to new_user_deck_path
    else
      @decks = Deck.all
      @deck = Deck.new
    end
  end

  def create
    @user = current_user
    @deck = @user.decks.new(deck_params)
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
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    @card = @deck.cards.new
  end

  def show
    @deck = Deck.find(params[:id])
    if @deck.cards []
      @card = @deck.cards.first
    else
      @card = @deck.cards.new
    end
    @deck.last_touched = DateTime.now.to_date
    redirect_to deck_card_path(@deck, @card)
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update(deck_params)
      flash[:notice] = "Deck has been updated."
      redirect_to edit_deck_path(@deck.id)
    else
      redirect_to edit_deck_path(@deck.id)
    end
  end

  def destroy
  end

  private

  def deck_params
  params.require(:deck).permit(:title)
  end

  def card_params
  params.require(:card).permit(:question, :answer)
  end

end
