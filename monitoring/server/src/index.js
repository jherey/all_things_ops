'use strict';

const express = require('express');
const { createMiddleware, getSummary, getContentType } = require('@promster/express');

const PORT = 5000;
const HOST = '0.0.0.0';

const app = express();

function pause(delayInMs) {
  return new Promise((resolve) => setTimeout(resolve, delayInMs))
}

async function longRunning() {
  await pause(Math.random() * 5000)

  return 'Hello World'
}

app.use(createMiddleware({ app }))

app.get('/', (req, res) => {
  res.send('Hello world');
});

app.get('/delay', async (req, res) => {
  res.send(await longRunning());
});

app.get('/metrics', async (req, res) => {
  req.statusCode = 200;

  res.setHeader('Content-Type', getContentType());
  res.end(getSummary());
});


app.listen(PORT, HOST);

console.log(`Running on http://${HOST}:${PORT}`);

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});
