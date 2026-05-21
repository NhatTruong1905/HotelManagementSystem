from chatbot import client

def prompt(question):
    response = client.responses.create(
        model='gpt-5-nano',
        input=question
    )

    return response.output_text
