class UserSerializer < Panko::Serializer
    attributes :id, :name, :is_admin, :email, :authentication_token
end