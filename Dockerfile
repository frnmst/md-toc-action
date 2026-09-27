FROM python:3.13.15-slim-trixie

RUN pip install --no-cache-dir md-toc==9.0.1

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
