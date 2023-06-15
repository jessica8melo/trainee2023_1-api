class UserSerializer < Panko::Serializer
    attributes :id, :name, :is_admin, :email, :authentication_token, :profile_pictures_url

    def profile_pictures_url
        array = []
        if object.profile_pictures.attached?
            object.profile_pictures.each do |profile_picture|
                array.append Rails.application.routes.url_helpers.rails_blob_path(profile_picture, only_path: true)
            end
        end
        array
    end
end