require "rails_helper"

RSpec.describe "GitHub Oauth", type: :request do
  it "returns user created by GitHub Oauth" do
    user_oauth_data = {
      uid: 97274592,
      name: "James P Sullivan",
      email: "jpsullivan@wahoo.com",
      access_token: "mikeismybff2001"
    }
    post api_v1_user_oauth_path(user_oauth_data[:uid]), params: user_oauth_data

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)
    
    expect(user[:data]).to be_a(Hash)
    
    expect(user[:data][:attributes][:uid]).to eq(user_oauth_data[:uid].to_s)
    expect(user[:data][:attributes][:email]).to eq(user_oauth_data[:email])
    expect(user[:data][:attributes][:oauth_token]).to eq(user_oauth_data[:access_token])
  end
end