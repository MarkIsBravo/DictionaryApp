class WordsController < ApplicationController
    before_action :ensure_logged_in
    before_action :load_words, only: [:show, :edit, :update, :destroy]

    def new
        @word = Word.new
    end

    def create
        @word = Word.new(create_params)
        @word.user = current_user

        if @word.save
            flash[:notice] = 'New word saved.'
            redirect_to word_path(@word)
        else
            flash[:error] = @word.errors.full_messages.join(', ')
            render :new
        end
    end

    def edit
    end

    def update
        if @word.update(update_params)
            flash[:notice] = 'Updated successfully.'
            redirect_to word_path(@word)
        else
            flash[:error] = @word.errors.full_messages.join(', ')
            render :edit
        end
    end 

    def index
        @words = current_user.words
    end
    
    def show
    end

    def destroy
        @word.destroy!

        flash[:notice] = "#{@word.spell} deleted!"
        redirect_to words_path
    end

    private

    def create_params
        params.require(:word).permit(:spell, :part_of_speech, :definition)
    end

    def update_params
        params.require(:word).permit(:definition)
    end

    def load_words
        @word = current_user.words.find(params[:id])
    end

end
