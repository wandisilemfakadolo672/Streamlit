import streamlit as st
import os

st.title("Test Script")
st.header("Test")

os.system("ls -la")
results = os.system("bash run_gotty.sh")
st.write(results)
