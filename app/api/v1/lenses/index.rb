class V1::Lenses::Index < Grape::API
  resource :lenses do
    desc 'Get the list of lenses' do
      success [V1::Entities::Lense]
      failure [
        [403, 'Forbidden', V1::Entities::Error]
      ]
    end

    get do
      lenses = policy_scope(Lense).all

      present lenses, with: V1::Entities::Lense
    end
  end

end
