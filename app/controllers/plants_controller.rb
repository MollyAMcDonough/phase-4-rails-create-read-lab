class PlantsController < ApplicationController
    def index
        plants = Plant.all
        if plants.length == 0
            render json: {no_content: "No plants in db"}, status: :no_content
        else
            render json: plants, status: :ok
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Couldn't find plant"}, status: :not_found
        end

    end

    private
    def plant_params
        params.permit(:name,:image,:price)
    end
end
