FROM runpod/worker-v1-vllm:latest

# vLLM со спец-поддержкой gpt-oss (MXFP4)
RUN pip uninstall -y vllm || true && \
    pip install --pre "vllm==0.10.1+gptoss" \
      --extra-index-url https://wheels.vllm.ai/gpt-oss/ \
      --extra-index-url https://download.pytorch.org/whl/nightly/cu128 \
      --index-strategy unsafe-best-match

COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh
HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=5 \
  CMD /healthcheck.sh || exit 1
