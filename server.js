'use strict';

const express = require('express');

// Constants
const PORT = 8088;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello Sane World this is the first project with KIND');
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});

async function closeGracefully(signal) {
  await fastify.close()
  
  process.kill(process.pid, signal);
  
}
process.on('SIGINT', closeGracefully)