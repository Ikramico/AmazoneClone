const express = require('express');
const mongoose = require ('mongoose');

const authRour = require('./Server/router/auth');
const DB = 'mongodb+srv://Tester:rdmDB5mar04RuEjs@cluster0.iehvqhb.mongodb.net/datas?retryWrites=true&w=majority'

const PORT = 3000;
const app = express();
app.use(express.json());
app.use(authRour);

mongoose.connect(DB).then(() => {
    console.log('Connected Successfully');
}).catch((e) => console.log(e));

app.listen(PORT, '0.0.0.0', () => {
    console.log('Connected ' + PORT);
});
