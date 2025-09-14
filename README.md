# RunPod Serverless: vLLM + gpt-oss-20b (MXFP4)

Готовый worker-образ для `openai/gpt-oss-20b` на RunPod Serverless.
- База: `runpod/worker-v1-vllm`
- vLLM: `0.10.1+gptoss` (поддержка MXFP4)
- OpenAI-совместимый API: `/openai/v1/*` (chat/completions, completions, embeddings)

## Переменные окружения (в RunPod)
- MODEL_NAME = `openai/gpt-oss-20b`
- MAX_MODEL_LEN = `131072`
- QUANTIZATION = *(пусто)*
- HF_TOKEN = *(обычно не требуется для gpt-oss)*

## Ресурсы
GPU: L4 24GB / A10 24GB / RTX A5000 24GB+. Для длинного контекста — запас по VRAM.

## Тесты
1) Модели:
GET {BASE_URL}/openai/v1/models

2) Чат:
POST {BASE_URL}/openai/v1/chat/completions
{
  "model": "openai/gpt-oss-20b",
  "messages": [{"role":"user","content":"Hello!"}]
}

## Пример JS (fetch)
```js
const res = await fetch(`${BASE_URL}/openai/v1/chat/completions`, {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${RUNPOD_API_KEY}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'openai/gpt-oss-20b',
    messages: [{ role: 'user', content: 'Напиши одно предложение о себе.' }],
    temperature: 0.6
  })
});
console.log(await res.json());
