ActiveAdmin.register User do
  permit_params :name, :email, :role, :birth_date
end
