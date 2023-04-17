require 'sinatra'
require 'sinatra/activerecord'
require_relative './app/models/conversation'
require_relative './app/models/message'
require_relative './app/models/user'
require_relative './app/controllers/application_controller'
require_relative './app/controllers/conversations_controller'




post '/login' do
    content_type :json
    username = params['username']
    password = params['password']
  
    user = User.find_by(username: username)
  
    if user && user.password == password
      { success: true, message: 'Logged in successfully' }.to_json
    else
      { success: false, message: 'Invalid username or password' }.to_json
    end
  end
  
  # POST /conversations

  class App < Sinatra::Base
    use ConversationsController
  end
  post '/conversations' do
    content_type :json
    conversation = Conversation.new(params)
  
    if conversation.save
      conversation.to_json
    else
      { success: false, message: 'Unable to create conversation' }.to_json
    end
  end
  
  # GET /conversations/:id/messages
  get '/conversations/:id/messages' do
    content_type :json
    conversation = Conversation.find(params[:id])
  
    if conversation
      conversation.messages.to_json
    else
      { success: false, message: 'Conversation not found' }.to_json
    end
  end
  
  # POST /conversations/:id/messages
  post '/conversations/:id/messages' do
    content_type :json
    conversation = Conversation.find(params[:id])
  
    if conversation
      message = conversation.messages.build(params)
      if message.save
        message.to_json
      else
        { success: false, message: 'Unable to save message' }.to_json
      end
    else
      { success: false, message: 'Conversation not found' }.to_json
    end
  end


