require 'rails_helper'

RSpec.describe Plant, type: :model do
  let!(:plant) { Plant.new(name: "Aloe", image: "./images/aloe.jpg", price: 15.99, is_in_stock: true) }

  describe '#name' do
    it 'returns the plant\'s name' do
      expect(plant.name).to eq('Aloe')
    end
  end

  describe '#image' do
    it 'returns the plant\'s last name' do
      expect(plant.image).to eq('./images/aloe.jpg')
    end
  end

  describe '#price' do
    it 'returns the plant\'s price' do
      expect(plant.price).to eq(15.99)
    end
  end

  describe '#is_in_stock' do
    it 'returns whether or not the plant is in stock' do
      expect(plant.is_in_stock).to eq(true)
    end
  end
end
