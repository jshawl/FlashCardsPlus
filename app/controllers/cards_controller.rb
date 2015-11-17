class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def create
      @deck = Deck.find(params[:deck_id])
      @card = @deck.cards.new(card_params)
      @card.save
      redirect_to edit_deck_path(params[:deck_id])
  end

  def new
    @card = Card.new

  end

  def edit
  end

  def show
  end

  def update
    @card = Card.find(params[:id])
    @deck = @card.deck
    if @card.update(card_params)
      flash[:notice] = "Card has been updated."
      redirect_to edit_deck_path(@deck.id)
    else
      redirect_to edit_deck_path(@deck.id)
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to edit_deck_path(params[:deck_id])
  end

  private

  def deck_params
    params.require(:deck).permt(:title)
  end

  def card_params
    params.require(:card).permit(:question, :answer)
  end

end
