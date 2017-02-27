json.extract! contact, :id, :first_name, :last_name, :number, :email, :created_at, :updated_at
json.url contact_url(contact, format: :json)
