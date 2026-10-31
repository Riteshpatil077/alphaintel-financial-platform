.PHONY: run-api run-dashboard test load clean

run-api:
	uvicorn src.api.main:app --port 8000 --reload

run-dashboard:
	streamlit run src/dashboard/app.py

load:
	python -m src.etl.loader
	python -m src.analytics.add_indexes

test:
	pytest tests/ -v

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +