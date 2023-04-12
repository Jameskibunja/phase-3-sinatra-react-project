
require './config/environment'
require 'sinatra/base'
require 'sinatra/json'

class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  set :method_override, true

  get '/api/conversations' do
    conversations = Conversation.all
    conversations.to_json
  end
  get '/api/conversations/:id' do
    conversation = Conversation.find(params[:id])
    conversation.to_json
  end
  
  post '/api/conversations' do
    payload = JSON.parse(request.body.read)
    conversation = Conversation.create(title: payload['title'])
    conversation.to_json
  end
  
  get '/api/conversations/:id/messages' do
    messages = Message.where(conversation_id: params[:id])
    messages.to_json
  end
  
  post '/api/conversations/:id/messages' do
    payload = JSON.parse(request.body.read)
    message = Message.create(
      content: payload['content'],
      conversation_id: params[:id]
    )
    message.to_json
  end

  get '/' do
    "Hello, world!"
  end

end
