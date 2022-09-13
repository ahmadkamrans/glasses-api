class V1::Lenses::Index < Grape::API
  resource :lenses do
    desc 'Statuses index' do
    end
    
    get do
      Lense.all
    end
  end

end
