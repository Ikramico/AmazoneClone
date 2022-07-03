const express = require('express');
const User = require('../models/user');

const authRour = express.Router();

authRour.post('/api/signup', (req, res) => {
    const {name, email, password} = req.body;

    const existingUser =  User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg: 'You have an account already with this email'})
    }

    let user = new User({
        email,
        password,
        name,
    })
    user =  user.save();
    res.json(user);
})

module.exports = authRour;