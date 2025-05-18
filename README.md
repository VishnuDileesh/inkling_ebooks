# Inkling Ebooks API

A FastAPI-based REST API for accessing and searching through Project Gutenberg's ebook collection.

[Base Live URL](https://inkling-ebooks-image-412181778426.asia-south1.run.app)

[Docs](https://inkling-ebooks-image-412181778426.asia-south1.run.app/docs)


- PostgreSQL Database is deployed on NeonDB
- Docker image is stored in GCP Artifact Registry
- API is deployed on GCP CloudRun

## Features

- Search books by multiple criteria:
  - Topics (subjects and bookshelves)
  - Languages
  - MIME types
  - Authors
  - Titles
  - Gutenberg IDs
- Pagination support
- Rate limiting
- Case-insensitive partial matching
- Comprehensive book metadata

## Prerequisites

- Python 3.12+
- Poetry for dependency management
- Docker for containerized deployment

## Development Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd inkling_ebooks
```

2. Install dependencies using Poetry:
```bash
poetry install
```

3. Set up your environment variables:
```bash
cp .env.example .env
# Edit .env with your configuration
```

4. Run the development server:
```bash
poetry run uvicorn app.main:app --reload
```

The API will be available at `http://localhost:8000`

## API Documentation

Once the server is running, you can access:
- Interactive API documentation: `http://localhost:8000/docs`
- Alternative API documentation: `http://localhost:8000/redoc`

## API Endpoints

### GET /api/v1/books

Search and filter books with the following query parameters:

- `languages`: List of language codes (e.g., `en`, `fr`)
- `mime_types`: List of MIME types (e.g., `text/plain`, `application/epub+zip`)
- `topics`: List of topics to search in subjects and bookshelves
- `authors`: List of author names (partial matches supported)
- `titles`: List of book titles (partial matches supported)
- `gutenberg_ids`: List of Gutenberg IDs
- `page`: Page number (default: 1)
- `page_size`: Items per page (default: 25)

Example:
```
GET /api/v1/books?languages=en&languages=fr&mime_types=text/plain&topics=philosophy&topics=science
```

## Docker Deployment

[Reference for Cloud Run Deployment](https://vishnudileesh.stck.me/post/715290/Dockerizing-a-Hello-World-Express-App-and-Uploading-to-GCP-Artifact-Registry)


1. Build the Docker image:
```bash
docker build -t inkling_ebooks_image .
```

2. Run the container:
```bash
docker run -p 8000:8000 inkling_ebooks_image
```

The API will be available at `http://localhost:8000`
