from app import app
from app.schemas import ChatRequest, ChatResponse
from chatbot.inference import prompt

@app.post("/chat", response_model=ChatResponse)
def index(request: ChatRequest):
    return ChatResponse(answer=prompt(request.message))
