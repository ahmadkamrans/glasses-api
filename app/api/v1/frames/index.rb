class V1::Frames::Index < Grape::API
  resource :frames do
    desc 'Get the list of frames' do
      success [V1::Entities::Frame]
      failure [
        [403, 'Forbidden', V1::Entities::Error]
      ]
    end

    get do
      frames = policy_scope(Frame).active if current_user.user?
      frames = policy_scope(Frame).all if current_user.admin?

      present frames, with: V1::Entities::Frame
    end
  end

end
