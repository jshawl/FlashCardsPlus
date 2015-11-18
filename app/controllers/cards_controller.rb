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
    @deck = Deck.find(params[:deck_id])
    if @deck.published = false
      redirect_to decks_path
    else
      @leftarrow = "Previous Question"
      @rightarrow = "Next Question"
      if params[:id]
        @card = @deck.cards.find(params[:id])
        if @deck.cards.index(@card) == 0
          @cardprevious = @deck.cards.last
          @cardnext = @deck.cards[@deck.cards.index(@card)+1]
          @leftarrow = "Last Card"
        elsif @deck.cards.index(@card) == @deck.cards.length - 1
          @cardprevious = @deck.cards[@deck.cards.index(@card)-1]
          @cardnext = @deck.cards.first
          @rightarrow = "First Card"
        else
          @cardprevious = @deck.cards[@deck.cards.index(@card)-1]
          @cardnext = @deck.cards[@deck.cards.index(@card)+1]
        end
      else
      @card = @deck.first
      end
    end
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
