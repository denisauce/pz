class SportsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @sport = Sport.all
    end
  
    def show
      @sport = Sport.find(params[:id])
    end
  
    def new
      @sport = Sport.new
    end
  
    def create
      @sport = Sport.new(sport_params)
      @sport.user = current_user
      
      if @sport.save
        redirect_to @sport, notice: 'Тренировка успешно создана.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @sport = Sport.find(params[:id])
    end
  
    def update
      @sport = Sport.find(params[:id])
      
      if @sport.update(sport_params)
        redirect_to @sport, notice: 'Тренировка успешно загружена.'
      else
        render :edit
      end
    end
  
    def destroy
      @sport = Sport.find(params[:id])
      @sport.destroy
      
      redirect_to sports_url, notice: 'Тренировка успешно удалена.'
    end
  
    private
  
    def sport_params
      params.require(:sport).permit(:title, :picture, :description, :price, :total)
    end
  end