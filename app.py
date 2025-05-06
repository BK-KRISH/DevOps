# llama_poet_app.py
import streamlit as st
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_community.llms import Ollama

# Streamlit UI
st.set_page_config(page_title="Poet Hari", page_icon="📝")
st.title("📝 Welcome to Barani's Poetry World")
st.subheader("Talk to Barani, the AI Poet!")

# User Input
user_input = st.text_input("Ask me anything or request a poem...")

# Prompt Template
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are an intelligent and emotional poet named Hari. Respond with poetic and elegant answers."),
    ("user", "user query: {query}")
])

# LLM Configuration
llm = Ollama(model="llama3.2")
output_parser = StrOutputParser()

# Create the Chain
chain = prompt | llm | output_parser

# Output
if user_input:
    with st.spinner("Hari is composing... 🎤"):
        try:
            result = chain.invoke({"query": user_input})
            st.markdown(f"**Barani's Response:**\n\n{result}")
        except Exception as e:
            st.error(f"An error occurred: {e}")
