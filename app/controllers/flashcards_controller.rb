class FlashcardsController < ApplicationController
  def index
    user = User.first
    @flashcards = user.flashcards
    @flashcard = user.flashcards.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flashcards }
    end
  end

  def show
    @flashcard = Flashcard.due

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flashcard }
    end
  end

  def correct
    flashcard = Flashcard.find(params[:id])
    if flashcard.level < 5
      flashcard.level = flashcard.level + 1
    end
    redirect_to @flashcard, notice: 'Right!'
  end
  
  def wrong
    flashcard = Flashcard.find(params[:id])
    if flashcard.level > 1
      flashcard.level = flashcard.level - 1
    end
    redirect_to @flashcard, notice: 'Wrong!'
  end

  def new
    user = User.first
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(params[:flashcard])

    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to @flashcard, notice: 'Flashcard was successfully created.' }
        format.json { render json: @flashcard, status: :created, location: @flashcard }
      else
        format.html { render action: "new" }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy

    respond_to do |format|
      format.html { redirect_to flashcards_url }
      format.json { head :no_content }
    end
  end
end
