class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            render json: @band.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @band = Band.find(params[:id])

        if @band
            render :show
        else
            render json: "Not found", status: 404
        end
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])

        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render json: @band.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url

    end

    def band_params
        params.require(:band).permit(:name)
    end
end