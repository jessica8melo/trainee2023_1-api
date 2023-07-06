require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    let(:user) {create(:user, email:"teste@teste", password:"123@ab", name:"teste")}
    before do 
        create(:post, id:1, title: "MELHOR FILME", user:user)
        create(:post, id:2, title: "MELHOR ANIME EVER AAAAAAA", user:user)
    end
    context " when index return " do 
        before do
            get "/api/posts"
        end
        it " return http status ok " do
            expect(response).to have_http_status(:ok)
        end
        it " return a json" do
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end
        it "return the created instances " do
            expect(JSON.parse(response.body)).to eq([{
                'id' => 1,
                'title' => 'MELHOR FILME',
                'user' => {
                  'email'=>'teste@teste',
                  'name'=>'teste'
                }
            },
            {
                'id' => 2,
                'title' => 'MELHOR ANIME EVER AAAAAAA',
                'user' => {
                  'email'=>'teste@teste',
                  'name'=>'teste'
                }
            }])
        end
    end
  end

  describe "GET /show/:id" do
    let(:user) {create(:user, email:"teste@teste", password:"123@ab", name:"teste")}
    let(:post) {create(:post, user:user)}
    let(:post_params) do
      attributes_for(:post)
    end
    context " post exist" do
      it " return http status ok" do
        get "/api/posts/#{post.id}", params: {post: post_params} 
        expect(response).to have_http_status(:ok)
      end
    end
    context " post not found" do
      it " return http status not found" do
        get "/api/posts/-1", params: {post: post_params}
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  
  describe "POST /create" do
    let(:user) {create(:user, email:"teste@teste", password:"123@ab", name:"teste")}
    let(:authentication_params) {{
      'X-User-Email': user.email,
      'X-User-Token': user.authentication_token
    }}
    let(:post_params) do
      attributes_for(:post, user_id: user.id)
    end
    context " params are ok" do
      it " return http status created" do
        post "/api/posts/create", params: {post: post_params}, headers: authentication_params
        expect(response).to have_http_status(:created)
      end
    end
    context " with bad params" do
      it " when params are nil" do
          post_params = nil
          post "/api/posts/create", params: {post: post_params}, headers: authentication_params
          expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "PATCH /update/:id" do
    let(:user) {create(:user, email:"teste@teste", password:"123@ab", name:"teste")}
    let(:post1) {create(:post, title: 'post1', user_id:user.id)}
    let(:post2) {create(:post, title: 'post2', user_id:user.id)}
    let(:post_params) do
        attributes_for(:post)
    end
    context " params are ok" do
        it " return http status" do
            patch "/api/posts/update/#{post1.id}", params: {post: {title: "Melhor post"}}, headers: {
                'X-User-Email': user.email,
                'X-User-Token': user.authentication_token
              }
            expect(response).to have_http_status(:ok)
        end
    end
    context " params are nil" do
        it " return http status bad_request" do
            patch "/api/posts/update/#{post1.id}", params: {post: {title:nil}}, headers: {
                'X-User-Email': user.email,
                'X-User-Token': user.authentication_token
              }
            expect(response).to have_http_status(:bad_request)
        end
    end
end
  
  describe "DELETE /delete/:id" do
    let(:user) {create(:user, email:"teste@teste", password:"123@ab", name:"teste")}
    let(:post) {create(:post, user:user)}
    context " post exists" do
        it " return http status ok" do
            delete "/api/posts/delete/#{post.id}", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:ok)
        end
    end
    context " post does not exists" do
        it " return http status bad_request" do
            delete "/api/posts/delete/-1", headers: {
              'X-User-Email': user.email,
              'X-User-Token': user.authentication_token
            }
            expect(response).to have_http_status(:not_found)
        end
    end
  end
end
