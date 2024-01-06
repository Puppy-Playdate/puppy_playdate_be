require 'rails_helper'

RSpec.describe UserSerializer, type: :request do
  describe "User Serializer" do
    it "serailizes data to JSON" do
      create_list(:user, 5)

      get api_v1_users_path

      expect(response).to be_successful

      data = JSON.parse(response.body)
      
      user = data["data"][0]

      expect(user).to have_key("id")
      expect(user["id"]).to be_a(String)

      expect(user).to have_key("type")
      expect(user["type"]).to eq("user")

      expect(user).to have_key("attributes")
      expect(user["attributes"]).to be_a(Hash)
      expect(user["attributes"]["name"]).to be_a(String)
      expect(user["attributes"]["email"]).to be_a(String)
      expect(user["attributes"]["dog_count"]).to be_an(Integer)

      expect(user).to have_key("relationships")
      expect(user["relationships"]).to be_a(Hash)
      expect(user["relationships"]["dogs"]).to be_a(Hash)
      expect(user["relationships"]["dogs"]["data"]).to be_an(Array)
    end
  end
end