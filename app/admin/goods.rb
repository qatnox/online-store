ActiveAdmin.register Good do
  permit_params :name, :description, :price, :weight, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :weight
    column :category
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :weight
  filter :category
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :weight
      f.input :category
    end
    f.actions
  end
end
