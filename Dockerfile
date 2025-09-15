FROM vllm/vllm-openai:gptoss
# Запускаем vLLM OpenAI server на 8000
ENV PORT=8000
ENV MODEL_NAME=openai/gpt-oss-20b
ENV MAX_MODEL_LEN=65536
 
EXPOSE 8000
CMD ["bash","-lc","python -m vllm.entrypoints.openai.api_server \ 
--model ${MODEL_NAME} --port ${PORT} --max-model-len ${MAX_MODEL_LEN}"]