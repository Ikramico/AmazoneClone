const mongoose = require ('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {validator: (value) => {
            const re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return value.match(re);
        },
    message: 'Enter a valid Email',
    }
    },
    password: {
        required: true,
        type: String,
    },
    address: {
        default: '',
        type: String,
    },
    type:{
        type: String,
        default: 'user',
    },
});