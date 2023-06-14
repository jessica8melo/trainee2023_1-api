class CategoriesController < ApplicationController
    def index
        cats = Category.all
        render json: cats, status: :ok
    end

    def show
        cat = Category.find(params[:id])
        render json: cat, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        cat = Category.new(cat_params)
        cat.save!
        render json: cat, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def update
        cat = Category.find(params[:id])
        cat.update!(cat_params)
        render json: cat, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        cat = Category.find(params[:id])
        cat.destroy!
        render json: {message: "Destroyed object."}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def cat_params
        params.require(:category).permit(:name, :description)
    end
end
