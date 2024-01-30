
const express = require("express");
const mongoose = require("mongoose")
const authRouter = require("./routes/auth");
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://mit:Mit%40123@cluster0.fdbrwvp.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);

//connection
mongoose.connect(DB).then(() => {
console.log("connection successful");
}).catch((e) =>{
console.log("Error"+ e);
})

app.listen(PORT, () => {
console.log(`Connected at port ${PORT}`)
});


