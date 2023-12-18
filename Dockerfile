# Use the PyTorch image as the base
FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel
# FROM vllm/vllm-openai:latest

# Set working directory
WORKDIR /app

RUN apt-get update && apt-get install -y git
RUN pip install git+https://github.com/mobiusml/hqq.git

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY app.py /app

CMD ["python", "app.py"]
