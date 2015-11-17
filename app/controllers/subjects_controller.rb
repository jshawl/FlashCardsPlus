class SubjectsController < ApplicationController

  def create

  end

  def new
    @deck = Deck.find(params[:deck_id])
    @subject = @deck.subjects.find(params[:subject_id])
  end
end
