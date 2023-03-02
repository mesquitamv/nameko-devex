const router = require('express').Router()
const Clipboard = require('../models/Clipboard')

//  Create
router.post('/', async (req, res) => {

  const {content} = req.body

  if(!content) {
    res.status(422).json({error: "Content cannot be empty"})
    return
  }

  const clipboard = {
    content,
  }

  try {
    
    await Clipboard.create(clipboard)
    
    res.status(201).json({message: "Content copied with success"})

  } catch (error) {
    res.status(500).json({error:error})
  }

})

// Read all
router.get('/', async (req, res) => {

  try {

    const clipboard = await Clipboard.find()

    res.status(200).json(clipboard)

    
  } catch (error) {
    res.status(500).json({error:error})
  }

})

module.exports = router
