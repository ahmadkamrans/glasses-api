class V1::Frames::Index < Grape::API
  resource :frames do
    desc 'Statuses index' do
    end
  end

  get '/frames' do
    frame = Frame.new()
    authorize(frame, :create?)
  end
end
