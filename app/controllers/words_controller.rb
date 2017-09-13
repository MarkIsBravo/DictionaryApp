class WordsController < ApplicationController
    before_action :ensure_logged_in
    before_action :load_words, only: [:show, :edit, :update, :destroy]
    def index
        @words = current_user.words
    end
    
    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
        if @word.update(update_params)
            flash[:notice] = 'Updated successfully.'
            redirect_to words_path
        else
            flash[:error] = @word.errors.full_messages.join(', ')
            render :edit
        end
    end 

    def destroy
        @word.destroy!

        flash[:notice] = "#{@word.spell} deleted!"
        redirect_to words_path
    end

    private

    def update_params
        params.require(:word).permit(:definition)
    end

    def load_words
        @word = current_user.words.find(params[:id])
    end

end
