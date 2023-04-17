conversation1 = Conversation.create(name: "General")
conversation2 = Conversation.create(name: "Random")
conversation3 = Conversation.create(name: "Sports")

# Create sample messages for each conversation
Message.create(conversation: conversation1, username: "Alice", content: "Hello everyone!")
Message.create(conversation: conversation1, username: "Bob", content: "Hi Alice! How's it going?")

Message.create(conversation: conversation2, username: "Carol", content: "Did you see the latest movie?")
Message.create(conversation: conversation2, username: "Dave", content: "Yeah, I loved it!")

Message.create(conversation: conversation3, username: "Eve", content: "Great game last night!")
Message.create(conversation: conversation3, username: "Frank", content: "Definitely! Can't wait for the next one.")

User.create(username: "Alice", password: "password1")
User.create(username: "Bob", password: "password2")

