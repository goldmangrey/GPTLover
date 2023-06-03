//
//  ContentView.swift
//  GPTLover
//
//  Created by Yeskendir on 02.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var chatMessages:[ChatMessage] = ChatMessage.sampleMessages
    @State var messageText: String = ""
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack {
                    ForEach(chatMessages, id: \.id){ message in
                        messageView(message: message)
                    }
                }
            }
            HStack{
                TextField("Enter request", text: $messageText){
                    
                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(15)
                Button{
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(15)
                }
            }
        }
        .padding()
    }
    func messageView(message: ChatMessage) -> some View{
        HStack{
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ?  .white :  .black)
                .padding()
                .background(message.sender == .me ?  .blue :  .gray.opacity(0.1))
                .cornerRadius(16)
            if message.sender == .gpt {Spacer()}
        }
    }
    
    func sendMessage(){
        messageText = ""
        print(messageText)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
            
    }
}


struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Whassup brothe", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Just message bro", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Just message bro", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Just message bro", dateCreated: Date(), sender: .gpt)
    ]
    
}
