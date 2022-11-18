const book = require("../models/books");

const add = (req, res) => {
    const data = req.query;
    console.log(data);
    const bookData = new book({
        bookName: data.name,
        authorName: data.author,
        price: Number(data.price)        
    });

    bookData.save((err) => {
        if(err) {
            return res.status(500).json(err)
        } else {
            return res.status(200).json({entered: 1})
        }
    })
}

const isApiWorking = (req, res) => {
    res.json({success: true});
}

const getBook = (req, res) => {
    const data = req.params;
    book.findById(data.BookId, (result, err) => {
        if(err){
            return res.status(404).json(err);
        } else {
            return res.status(200).json(result);
        }
    })
}


module.exports = {isApiWorking, add, getBook};