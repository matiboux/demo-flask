
FROM python:3.10-slim AS base

WORKDIR /app

COPY from/requirements.txt requirements.txt
RUN pip install -r requirements.txt && \
	rm -rf /root/.cache/pip


FROM base AS dev

VOLUME /app

CMD [ "flask", "run", "--host", "0.0.0.0", "--port", "80", "--debug" ]



FROM base AS prod

COPY --chmod=755 from/app.py app.py

CMD [ "flask", "run", "--host", "0.0.0.0", "--port", "80" ]
