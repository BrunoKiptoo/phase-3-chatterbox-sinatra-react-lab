class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  
  # GET /messages: returns an array of all messages as JSON, ordered by created_at in ascending order.
  get '/messages' do 
    messages = Message.order(created_at: :asc)
    messages.to_json
  end

  # POST /messages: creates a new message with a body and username from params, and returns the newly created post as JSON.
  post '/messages' do 
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  # PATCH /messages/:id: updates the body of the message using params, and returns the updated message as JSON.
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end

  # DELETE /messages/:id: deletes the message from the database.
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
  end
  
end















# class ApplicationController < Sinatra::Base

#   set :default_content_type, 'application/json'
  
#   # Add routes

# # GET /messages: returns an array of all messages as JSON, ordered by created_at in ascending order.

#   get '/messages' do 

#     messages = Message.order(created_at: :asc)
#     messages.to_json
#     {message: "Here are some messages ordered in descending order"}.to_json
#   end

# # POST /messages: creates a new message with a body and username from params, and returns the newly created post as JSON.
#   post '/messages' do 
#     messages = Message.create(
#       body: params[:body],
#       username: params[:username]
#     )
#     messages.to_json
#   end

# # PATCH /messages/:id: updates the body of the message using params, and returns the updated message as JSON.

#   patch '/messages/:id' do
#     messages = Message.find(params[:id])
#     messages.body = params[:body]
#     messages.save
#     messages.to_json
#   end

# # DELETE /messages/:id: deletes the message from the database.

#   delete '/messages/:id' do
#     messages = Message.find(params[:id])
#     messages.destroy

#   end
  
# end
