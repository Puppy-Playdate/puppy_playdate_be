require 'rails_helper'

describe "Socials API", type: :request do
  describe "Socials Index" do
    it "sends a list of socials" do
      user = create(:user)
      socials_list = create_list(:social, 5, user: user)

      get api_v1_user_socials_path(user.id, socials_list)
      expect(response).to be_successful

      socials = JSON.parse(response.body, symbolize_names: true)
      expect(socials[:data].count).to eq(5)
      
      socials[:data].each do |social|
        expect(social).to be_a(Hash)
        # require 'pry'; binding.pry
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
      
      get api_v1_user_socials_path(user.id, social.id)

      social_request = JSON.parse(response.body, symbolize_names: true) 

      expect(response).to be_successful
      expect(social_request).to be_a(Hash)
      require 'pry'; binding.pry
      expect(social_request[:data]).to have_key(:id)
      expect(social_request[:data][:id]).to be_an(String)
  
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

  describe "Social Create" do
    xit "can create a new Social" do
      user = create(:user)
      # social_params = create(:social, user: user)
      social_params = ({
                      name: 'Wine and Wags',
                      description: 'Wine and Wags is a social event for dog owners to meet and mingle with other dog owners.',
                      location: 'Denver, CO',
                      event_date: Date.today,
                      event_type: 'chill'
                    })
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_user_socials_path(user.id, social_params), headers: headers, params: JSON.generate(social: social_params)
      created_social = Social.last
      # require 'pry'; binding.pry

      expect(response).to be_successful
      expect(created_social.name).to eq(social_params[:name])
      expect(created_social.description).to eq(social_params[:description])
      expect(created_social.location).to eq(social_params[:location])
      expect(created_social.event_date).to eq(social_params[:event_date])
      expect(created_social.event_type).to eq(social_params[:event_type])
    end

    xit "sad path; will send an error if social is not created" do 
      user = create(:user)
      dog_params = ({
        name: "",
        breed: 'Pitbull',
        age: 3,
        size: "medium",
        neutered: true
      })
      headers = {"CONTENT_TYPE" => "application/json"}
  
      post api_v1_user_dogs_path(user.id, dog_params), headers: headers, params: JSON.generate(dog: dog_params)

      expect(response).to_not be_successful 
      expect(response).to have_http_status(401)
    end
  end

  describe "Social Update" do
    xit "can update an existing social" do
      user = create(:user)
      dog = create(:dog, user: user)
      previous_name = Dog.last.name
      dog_param = { name: "P. Sherman" }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch api_v1_user_dog_path(user.id, dog.id), params: dog_param
      up_dog = Dog.find_by(id: dog.id)
      expect(response).to be_successful
      expect(up_dog.name).to_not eq(previous_name)
      expect(up_dog.name).to eq("P. Sherman")
    end

    xit "sad path; will send an error if dog is not created" do 
      user = create(:user)
      dog = create(:dog, user: user)
      previous_name = Dog.last.name
      dog_param = { name: "" }
      headers = {"CONTENT_TYPE" => "application/json"}
  
      patch api_v1_user_dog_path(user.id, dog.id), params: dog_param
      expect(response).to_not be_successful 
      expect(response).to have_http_status(422)
    end
  end

  describe "Social Destroy" do
    xit "can destroy an Social" do
      user = create(:user)
      dog = create(:dog, user: user)
    
      expect(Dog.count).to eq(1)
    
      delete api_v1_user_dog_path(user.id, dog.id)
    
      expect(response).to be_successful
      expect(Dog.count).to eq(0)
      expect{Dog.find(dog.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end