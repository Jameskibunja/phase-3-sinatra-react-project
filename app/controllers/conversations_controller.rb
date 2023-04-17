require 'sinatra/base'

class ConversationsController < ApplicationController
  set :views, proc { File.join(root, '../views/') }
  set :method_override, true
  set :default_content_type, "application/json"


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
end
