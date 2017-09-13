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
    end 

    def destroy
    end

    private

    def load_words
        @word = current_user.words.find(params[:id])
    end

end
