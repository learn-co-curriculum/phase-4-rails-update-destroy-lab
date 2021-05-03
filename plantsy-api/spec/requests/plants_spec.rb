require 'rails_helper'

RSpec.describe "Plants", type: :request do

  describe "GET /plants" do
    before do
      Plant.create(name: 'Aloe', image: './images/aloe.jpg', price: 15.99, is_in_stock: true)
      Plant.create(name: 'ZZ Plant', image: './images/zz-plant.jpg', price: 25.98, is_in_stock: true)
    end
  
    it 'returns an array of all plants' do
      get '/plants'

      expect(response.body).to include_json([
        { id: a_kind_of(Integer), name: 'Aloe', image: './images/aloe.jpg', price: '15.99', is_in_stock: true },
        { id: a_kind_of(Integer), name: 'ZZ Plant', image: './images/zz-plant.jpg', price: '25.98', is_in_stock: true }
      ])
    end
  end

  describe "GET /plants/:id" do
    before do
      Plant.create(name: 'Aloe', image: './images/aloe.jpg', price: 15.99, is_in_stock: true)
      Plant.create(name: 'ZZ Plant', image: './images/zz-plant.jpg', price: 25.98, is_in_stock: true)
    end
  
    let!(:first_plant) { Plant.first }
    let!(:second_plant) { Plant.second }

    it 'returns the first plant' do
      get "/plants/#{first_plant.id}"

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        name: 'Aloe', 
        image: './images/aloe.jpg', 
        price: '15.99',
        is_in_stock: true
      })
    end

    it 'returns the second plant' do
      get "/plants/#{second_plant.id}"

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        name: 'ZZ Plant', 
        image: './images/zz-plant.jpg', 
        price: '25.98',
        is_in_stock: true
      })
    end
  end

  describe "POST /plants" do
    let!(:plant_params) { { name: 'Pilea peperomioides', image: './images/pilea.jpg', price: '5.99', is_in_stock: true } }

    it 'creates a new plant' do
      expect { post '/plants', params: plant_params }.to change(Plant, :count).by(1)
    end

    it 'returns the plant data' do
      post '/plants', params: plant_params

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        name: 'Pilea peperomioides', 
        image: './images/pilea.jpg', 
        price: '5.99'
      })
    end

    it 'returns a status code of 201 (created)' do
      post '/plants', params: plant_params

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /plants/:id" do
    let!(:plant) { Plant.create(name: 'Aloe', image: './images/aloe.jpg', price: 15.99, is_in_stock: true) }

    it 'updates the student with the matching id' do
      patch "/plants/#{plant.id}", params: { is_in_stock: false }
      
      expect(plant.reload.is_in_stock).to eq(false)
    end

    it 'returns the plant data' do
      patch "/plants/#{plant.id}", params: { is_in_stock: true }

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        name: 'Aloe',
        image: './images/aloe.jpg',
        price: 15.99,
        is_in_stock: true
      })
    end
  end

  describe 'DELETE /plants/:id' do
    let!(:plant) { Plant.create(name: 'Aloe', image: './images/aloe.jpg', price: 15.99, is_in_stock: true) }
    
    it 'deletes the plant with the matching id' do
      expect { delete "/plants/#{plant.id}" }.to change(Plant, :count).from(1).to(0)
    end

  end

end
