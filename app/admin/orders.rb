ActiveAdmin.register Order do
  permit_params :user_id, :total_price, :status
end
