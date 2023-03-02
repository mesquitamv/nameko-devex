const express = require('express')
const mongoose = require('mongoose')
const app = express()

// Mongo variables
const mongoUsername = process.env.MONGODB_USERNAME
const mongoPassword = process.env.MONGODB_PASSWORD
const mongoDatabase = process.env.MONGODB_DATABASE
const mongoHost = process.env.MONGODB_HOSTNAME 
const mongoPort = process.env.MONGODB_PORT || 27017

app.use(
  express.urlencoded({
    extended: true,
  }),
)

app.use(express.json())

// API Routes
const clipboardRoutes = require('./routes/clipboardRoutes')

app.use('/clipboard', clipboardRoutes)

console.log("Connecting to MongoDB...")

mongoose.set("strictQuery", false);
mongoose
  .connect(`mongodb://${mongoUsername}:${mongoPassword}@${mongoHost}:${mongoPort}/${mongoDatabase}`)
  .then(() => {
    console.log("Connection to MongoDB SUCCESS")
    app.listen(8080)
    console.log("Server Up. Waiting requests")

  })
  .catch((err) => console.log(err))
