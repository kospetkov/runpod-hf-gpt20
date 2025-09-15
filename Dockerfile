FROM runpod/worker-v1-vllm:latest

# Ставим специальный vLLM с поддержкой MXFP4 (gpt-oss).
# НЕ тянем nightly/cu128 – в базе уже есть совместимый PyTorch/CUDA.
RUN pip uninstall -y vllm || true && \
    pip install --pre "vllm==0.10.1+gptoss" \
      --extra-index-url https://wheels.vllm.ai/gpt-oss/

# (опционально оставим файл, но без HEALTHCHECK директивы)
COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh
