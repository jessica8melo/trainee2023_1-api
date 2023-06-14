class CategoriesController < ApplicationController
    def index
        should_paginate = !index_pagination_params[:per_page].nil? || !index_pagination_params[:page].nil?

        if should_paginate
            per_page = index_pagination_params[:per_page].to_i || 10
            page = index_pagination_params[:page].to_i || 1
            offset = per_page * (page-1)
            cats = Category.all.limit(per_page).offset(offset)
        else
            cats = Category.all
        end

        render json: cats, status: :ok
    end

    def show
        cat = Category.find(params[:id])
        render json: cat, status: :ok
    rescue StandardError
        render json: { message: "Not Found." }, status: :not_found
    end

    private

    def index_pagination_params
        params.permit(
            :page,
            :per_page
        )
    end
end
