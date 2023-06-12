require "rails_helper"

RSpec.describe "Health endpoint", type: :request do

  describe "GET /posts" do
    before { get '/posts' }

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end

  end

  describe "with data in the DB" do
    # Rspec and Factory bot used in the next line
    let!(:posts){ create_list(:post, 10, published: true) }

    before { get '/posts' }

    it "should return all the published posts" do
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/{id}" do
    let!(:post){ create(:post) }

    it "should return all the published posts" do
      get "/posts/#{post.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(post.id)
      expect(response).to have_http_status(200)
    end
  end

end