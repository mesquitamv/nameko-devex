const mongoose = require('mongoose')

const Clipboard = mongoose.model('Clipboard', {
  content: String,
})

module.exports = Clipboard