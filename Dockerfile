# База: готовый RunPod serverless worker с vLLM и OpenAI-роутером
#FROM runpod/worker-v1-vllm:latest

# ВАЖНО: стандартный vLLM не поддерживает MXFP4; ставим спец-сборку для gpt-oss
#RUN pip uninstall -y vllm || true && \
#    pip install --pre "vllm==0.10.1+gptoss" \
#      --extra-index-url https://wheels.vllm.ai/gpt-oss/ \
#      --extra-index-url https://download.pytorch.org/whl/nightly/cu128 \
#      --index-strategy unsafe-best-match

# Healthcheck роут уже есть у worker-vllm (/:8000/health),
# но добавим скрипт, чтобы RunPod видел здоровье
#COPY healthcheck.sh /healthcheck.sh
#RUN chmod +x /healthcheck.sh
#HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=5 \
#  CMD /healthcheck.sh || exit 1
