FROM python:3.12-slim

WORKDIR /app

COPY site/ /app/site/

EXPOSE 8080

USER 10001:10001

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \

   CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8080/', timeout=2)" || exit 1

CMD ["python", "-m", "http.server", "8080", "--bind", "0.0.0.0", "--directory", "/app/site"]
