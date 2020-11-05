class AddProducts < ActiveRecord::Migration[6.0]
  def change
  Product.create :title => 'Hawaiian', :description => 'This is a Hawaiian pizza.', :price => 700, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/hawaiian.jpg'
  Product.create :title => 'Pepperoni', :description => 'Nice Pepperoni pizza.', :price => 1100, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/pepperoni.jpg'
  Product.create :title => 'Vegaterian', :description => 'Amazing Vegaterian pizza.', :price => 900, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => false, :path_to_image => '/images/vega.jpg'
  end
end
