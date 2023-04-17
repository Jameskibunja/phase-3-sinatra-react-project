class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add routes
  get "/messages" do
    messages = Message.all
    messages.to_json
  end

  get "/messages/:id" do
    message = Message.find(params[:id])
    message.to_json
  end

  post "/messages" do
    user = User.find_by(username: params[:username])
    new_message = Message.create(body: params[:body], user: user)
    new_message.to_json
  end

  patch "/messages/:id" do
    user = User.find_by(username: params[:username])
    updated_message = Message.find(params[:id])
    updated_message.update(body: params[:body], user: user)
    updated_message.to_json
  end

  delete "/messages/:id" do
    deleted_message = Message.find(params[:id])
    deleted_message.destroy
    deleted_message.to_json
  end

  get '/conversations' do
    conversations = Conversation.all
    conversations.to_json
  end

  get '/conversations/:id' do |id|
    conversation = Conversation.find(id)
    conversation.to_json
  end

  post '/conversations' do
    conversation = Conversation.new(JSON.parse(request.body.read))
    if conversation.save
      status 201
      conversation.to_json
    else
      status 422
      conversation.errors.to_json
    end
  end

  put '/conversations/:id' do |id|
    conversation = Conversation.find(id)
    updated_conversation = JSON.parse(request.body.read)

    if conversation.update(updated_conversation)
      status 200
      conversation.to_json
    else
      status 422
      conversation.errors.to_json
    end
  end

  delete '/conversations/:id' do |id|
    conversation = Conversation.find(id)
    conversation.destroy
    status 204
  end
  get "/login" do
    users = User.all
    users.to_json
  end
  
  post '/login' do
    content_type :json
    payload = JSON.parse(request.body.read)
  
    username = payload['username']
    password = payload['password']
  
    user = User.find_by(username: username)
  
    if user && user.authenticate(password)
      { success: true, message: 'Logged in successfully' }.to_json
    else
      status 400
      { success: false, message: 'Invalid username or password' }.to_json
    end
  rescue => e
    status 500
    { success: false, message: "Internal Server Error: #{e.message}" }.to_json
  end
  
  
  
end