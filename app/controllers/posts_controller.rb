class PostsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    def index
        posts = Post.all
        render json: array_serializer(posts), status: :ok
    end

    def show
        post = Post.find(params[:id])
        render json: serializer(post), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        post = Post.new(post_params)
        post.save!
        render json: post, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        post = Post.find(params[:id])
        post.update!(post_params)
        render json: serializer(post), status: :ok
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

    def array_serializer(posts)
        Panko::ArraySerializer.new(posts, each_serializer: PostSerializer).to_json
    end

    def serializer(post)
        PostSerializer.new.serialize_to_json(post)
    end
end
