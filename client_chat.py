# -*- coding: utf-8 -*-
import requests
import json

API_URL = "http://localhost:8501" 

def generate_response(chats):
    data = {
        'chats': chats,
        'max_new_tokens': 500,
        'skip_special_tokens': False,
        'temperature': 0.7,
        'top_p': 0.95,
        'top_k': 40,
        'repetition_penalty': 1.1
    }
    response = requests.post(f"{API_URL}/chat", json=data)
    content = json.loads(response.content)
    return content.get("response")

def chat_with_mixtral(chats, user_input):
    # Update chats with the user input
    chats.append({"role": "user", "content": user_input})
    # Add a placeholder for the assistant's response
    chats.append({"role": "assistant", "content": None})

    # Get the response from Mixtral
    mixtral_output = generate_response(chats)
    return mixtral_output

def main():
    print("Welcome to the Mixtral Chat! Type 'quit' to exit.")

    chats = [{"role": "system", "content": "You're a useful AI assistant"}]
    while True:
        user_input = input("User: ")
        if user_input.lower() == 'quit':
            break

        assistant_response = chat_with_mixtral(chats, user_input)
        print("Assistant:", assistant_response)

        # Update the last chat entry with the assistant's response
        if assistant_response:
            chats[-1]['content'] = assistant_response

if __name__ == '__main__':
    main()
