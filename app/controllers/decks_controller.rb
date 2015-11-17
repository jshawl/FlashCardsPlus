class DecksController < ApplicationController
  def index
    @decks = Deck.all
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      flash[:notice] = "#{@deck.title} was successfully created."
      redirect_to decks_path
    else
      redirect_to decks_path
    end
  end

  def new
    @deck = Deck.new
    @card = @deck.cards.new
  end

  def edit
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    @card = @deck.cards.new
  end

  def show
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
