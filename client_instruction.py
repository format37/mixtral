# -*- coding: utf-8 -*-
import requests
import json

API_URL = "http://localhost:8501" 

def instruct_request(text):
    data = {
        'instruct': text,
        'max_new_tokens': 500,
        'skip_special_tokens': False,
        'temperature': 0.7,
        'top_p': 0.95,
        'top_k': 40,
        'repetition_penalty': 1.1
    }
    response = requests.post(f"{API_URL}/instruct", json=data)
    print(f"Response code: {response.status_code}")
    try:
        content = json.loads(response.content)
        return content["response"]
    except:
        return response.content

def main():
    user_input = "<s>[INST]You are helpful assistant[/INST]\nUser: What is the capital of Britain?\nAssistant:"
    bot_response = instruct_request(user_input)
    print(f"\nResponse: {bot_response}")

if __name__ == '__main__':
    main()
