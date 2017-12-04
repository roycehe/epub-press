<p align="center"><img src="https://cloud.githubusercontent.com/assets/1745854/14191006/397082b2-f75b-11e5-9f5b-6016d069556b.png"/>
</p>

# epub-press

> Backend server for [EpubPress](https://epub.press).

For clients, see [epub-press-clients](https://github.com/haroldtreen/epub-press-clients).

### Setup

```bash
git clone https://github.com/haroldtreen/epub-press
cd epub-press
npm install
```

### Usage

**Docker Setup**

1. [Install Docker](https://docs.docker.com/engine/installation/)
1. `docker-compose up`

EpubPress will be running at `http://localhost:3000`.

**Development Setup**

1. [Install Docker](https://docs.docker.com/engine/installation/)
1. `docker-compose up postgres`
1. `npm start`

EpubPress will be running at `http://localhost:3000` and reload upon file changes.

### Tests

```bash
npm run test:integration   # Test API + full article extraction
npm run test:models        # Test models
npm run test:unit          # Test regular JS
npm run test               # Test all of the above
```

Changes should be accompanied by tests. 
All tests located in `/tests`.

### API

|Description                                | Endpoint                          |
|-------------------------------------------|-----------------------------------|
|Create a book                              |`POST /api/v1/books`               |
|Check the status of an in progress book    |`GET /api/v1/books/:id/status`     |
|Download an ebook as a file                |`GET /api/v1/books/:id/download`   |
|Send the ebook to an email                 |`GET /api/v1/books/:id/email`      |
|Check versions compatible with the server  |`GET /api/v1/version`              |
