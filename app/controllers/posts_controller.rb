class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts, status: :ok
    end

    def show
        post = Post.find(params[:id])
        render json: post, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        post = Post.new(post_params)
        post.save!
        render json: post, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def update
        post = Post.find(params[:id])
        post.update!(post_params)
        render json: post, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        post = Post.find(params[:id])
        post.destroy!
        render json: {message: "Destroyed object."}, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
