class PostSerializer < Panko::Serializer
    attributes :id, :title, :user

    def user
        {name: object.user.name, email: object.user.email}
    end
end