ActiveAdmin.register Good do
  permit_params :name, :description, :price, :weight, :category_id
end
