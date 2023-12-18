FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

WORKDIR /app

RUN apt-get update && apt-get install -y git
RUN pip install git+https://github.com/mobiusml/hqq.git

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY app.py /app

EXPOSE 8501

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8501"]
