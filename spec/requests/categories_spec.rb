require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    CATEGORIES_NUMBER = 20
    before do
      for i in 1..CATEGORIES_NUMBER
        create(:category)
      end
    end

    context "not paginated" do
      before do
        get '/api/categories'
      end

      it "should return all categories in body" do
        expect(JSON.parse(response.body).size).to eq(CATEGORIES_NUMBER)
      end

      it "should return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end
    
    context "paginated, page 1, CATEGORIES_NUMBER/2+1 per page" do
      before do
        get '/api/categories', params: {
          per_page: (CATEGORIES_NUMBER)/2+1,
          page: 1
        }
      end

      it "should return half+1 categories in body" do
        expect(JSON.parse(response.body).size).to eq(CATEGORIES_NUMBER/2 + 1)
      end

      it "should return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "paginated, page 2, CATEGORIES_NUMBER/2+1 per page" do
      before do
        get '/api/categories', params: {
          per_page: (CATEGORIES_NUMBER)/2+1,
          page: 2
        }
      end

      it "should return half-1 categories in body" do
        expect(JSON.parse(response.body).size).to eq(CATEGORIES_NUMBER/2 - 1)
      end

      it "should return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "paginated, page 3, CATEGORIES_NUMBER/2+1 per page" do
      before do
        get '/api/categories', params: {
          per_page: (CATEGORIES_NUMBER)/2+1,
          page: 3
        }
      end

      it "should return half-1 categories in body" do
        expect(JSON.parse(response.body).size).to eq(0)
      end

      it "should return http status ok" do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
  let(:category) { create(:category) }
  describe "GET /show/:id" do
    context "when id exists" do
      before do
        get "/api/categories/#{category.id}"
      end

      it "should return category in body" do
        expect(JSON.parse(response.body)["id"]).to eq(category.id)
      end

      it "should return status ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when id does not exist" do
      before do
        get "/api/categories/-1"
      end

      it "should return status not found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
