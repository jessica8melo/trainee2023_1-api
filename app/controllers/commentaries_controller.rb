class CommentariesController < ApplicationController
    def index
        comments = Commentary.all
        render json: comments, status: :ok
    end

    def show
        comment = Commentary.find(params[:id])
        render json: comment, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        comment = Commentary.new(comment_params)
        comment.save!
        render json: comment, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def update
        comment = Commentary.find(params[:id])
        comment.update!(comment_params)
        render json: comment, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        comment = Commentary.find(params[:id])
        comment.destroy!
        render json: {message: "Destroyed object."}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def comment_params
        params.require(:commentary).permit(:content, :post_id, :user_id)
    end
end
