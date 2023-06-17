class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :id, type: Integer
  field :image, type: String
  field :name, type: String
  field :description, type: String
  field :price, type: Float
  field :color, type: String
end
