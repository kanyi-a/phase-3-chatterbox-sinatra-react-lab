class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  # Add routes
  get '/messages' do
    message = Message.all.order(:asc)
    message.to_json
  end

  post '/messages' do 
    new_message = Message.create(
      body: params[:body], username: params[:username]
    )
    new_message.to_json
  end

  patch '/messages/:id' do
    update_messages = Message.find(params[:id])
    update_messages.update(body: params[:body])
    update_messages.to_json 
  end

  delete '/messages/:id' do
    delete_message = Message.find(params[:id])
    delete_message.destroy
    delete_message.to_json  
  end
end
