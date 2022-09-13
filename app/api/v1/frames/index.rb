class V1::Frames::Index < Grape::API
  resource :frames do
    desc 'Statuses index' do
    end
    
    get do
      Frame.all
    end
  end

end
