require 'rails_helper'

describe "Socials API", type: :request do
  describe "Socials Index" do
    it "sends a list of socials" do
      user = create(:user)
      socials_list = create_list(:social, 5, user: user)

      get api_v1_user_socials_path(user)

      expect(response).to be_successful

      socials = JSON.parse(response.body, symbolize_names: true)
      expect(socials[:data].count).to eq(5)

      socials[:data].each do |social|
        expect(social).to be_a(Hash)

        expect(socials[:data]).to be_an(Array)
        
        expect(social).to have_key(:id)
        expect(social[:id]).to be_an(String)
        
        expect(social).to have_key(:attributes)
        
        expect(social[:attributes]).to have_key(:name)
        expect(social[:attributes][:name]).to be_a(String)

        expect(social[:attributes]).to have_key(:description)
        expect(social[:attributes][:description]).to be_a(String)

        expect(social[:attributes]).to have_key(:location)
        expect(social[:attributes][:location]).to be_a(String)

        expect(social[:attributes]).to have_key(:event_date)
        expect(social[:attributes][:event_date]).to be_a(String)

        expect(social[:attributes]).to have_key(:event_type)
        expect(social[:attributes][:event_type]).to be_a(String)
      end
    end
  end

  describe "Socials Show" do
    it "can get one Social by its id" do
      user = create(:user)
      social = create(:social, user: user)
      
      get api_v1_user_social_path(user.id, social.id)

      social_request = JSON.parse(response.body, symbolize_names: true) 

      expect(response).to be_successful
      expect(social_request).to be_a(Hash)

      expect(social_request[:data]).to have_key(:id)
      expect(social_request[:data][:id]).to be_an(String)

      expect(social_request[:data][:attributes]).to have_key(:name)
        expect(social_request[:data][:attributes][:name]).to be_a(String)

        expect(social_request[:data][:attributes]).to have_key(:description)
        expect(social_request[:data][:attributes][:description]).to be_a(String)

        expect(social_request[:data][:attributes]).to have_key(:location)
        expect(social_request[:data][:attributes][:location]).to be_a(String)

        expect(social_request[:data][:attributes]).to have_key(:event_date)
        expect(social_request[:data][:attributes][:event_date]).to be_a(String)

        expect(social_request[:data][:attributes]).to have_key(:event_type)
        expect(social_request[:data][:attributes][:event_type]).to be_a(String)
    end
  end

  describe "Social Create" do
    it "can create a new Social" do
      user = User.create!(name: "James Sullivan", email: "sully@gmail.com", password: "password")

      social_params = ({
                      name: 'Wine and Wags',
                      description: 'Wine and Wags is a social event for dog owners to meet and mingle with other dog owners.',
                      location: 'Denver, CO',
                      event_date: Date.today,
                      event_type: 'chill'
                    })

      post api_v1_user_socials_path(user.id), params: social_params
      created_social = Social.last

      expect(response).to be_successful
      expect(created_social.name).to eq(social_params[:name])
      expect(created_social.description).to eq(social_params[:description])
      expect(created_social.location).to eq(social_params[:location])
      expect(created_social.event_date).to eq(social_params[:event_date])
      expect(created_social.event_type).to eq(social_params[:event_type])
    end

    it "sad path; will send an error if social is not created" do 
      user = create(:user)
      social_params = ({
                      name: '',
                      description: 'Wine and Wags is a social event for dog owners to meet and mingle with other dog owners.',
                      location: 'Denver, CO',
                      event_date: Date.today,
                      event_type: 'chill'
                    })

      post api_v1_user_socials_path(user.id), params: social_params

      expect(response).to_not be_successful 
      expect(response).to have_http_status(401)
    end
  end

  describe "Social Update" do
    it "can update an existing social" do
      user = create(:user)
      social = create(:social, user: user)
      previous_name = Social.last.name
      social_param = { name: "P. Sherman" }

      patch api_v1_user_social_path(user.id, social.id), params: social_param
      super_social = Social.find_by(id: social.id)

      expect(response).to be_successful
      expect(super_social.name).to_not eq(previous_name)
      expect(super_social.name).to eq("P. Sherman")
    end

    it "sad path; will send an error if social is not created" do 
      user = create(:user)
      social = create(:social, user: user)
      previous_name = Social.last.name
      social_param = { name: "" }
      headers = {"CONTENT_TYPE" => "application/json"}
  
      patch api_v1_user_social_path(user.id, social.id), params: social_param
      expect(response).to_not be_successful 
      expect(response).to have_http_status(422)
    end
  end

  describe "Social Destroy" do
    it "can destroy an Social" do
      user = create(:user)
      social = create(:social, user: user)
    
      expect(Social.count).to eq(1)
    
      delete api_v1_user_social_path(user.id, social.id) 
    
      expect(response).to be_successful
      expect(Social.count).to eq(0)
      expect{Social.find(social.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end