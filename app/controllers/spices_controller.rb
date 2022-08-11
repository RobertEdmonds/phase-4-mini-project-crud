class SpicesController < ApplicationController
    def index
        render json: Spice.all 
    end

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     if spice
    #         render json: spice
    #     else
    #         render json: {error: "Spice Not Found"}, status: :not_found
    #     end
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        if spice 
            spice.update(spice_params)
            render json: spice
        else
            resource_not_found
        end
    end

    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else
            resource_not_found
        end
    end

    private

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def resource_not_found
        render json: {error: "Spice Not Found"}, status: :not_found
    end
end
