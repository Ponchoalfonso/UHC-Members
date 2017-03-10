json.extract! request, :id, :name, :age, :nickname, :minecraftUUID, :foundUs, :requestReason, :email, :status, :ip, :created_at, :updated_at
json.url request_url(request, format: :json)
