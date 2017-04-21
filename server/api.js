const express = require('express')
const router = express.Router()
const fs = require('fs')
const multer = require('multer')
const bodyParser = require('body-parser');
const path = require('path')
var  upload = multer({ dest: 'upload' })
const mysql = require('mysql')
var crypto=require('crypto')

const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"6653145",
    database:"movie",
    port:8889
})

connection.connect();

var createFolder = function(folder){
    try{
        fs.accessSync(folder); 
    }catch(e){
        fs.mkdirSync(folder);
    }  
};

var uploadFolder = 'upload';

createFolder(uploadFolder);

function md5 (text) {
    return crypto.createHash('md5').update(text).digest('hex');
};
// 通过 filename 属性定制
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, uploadFolder);    // 保存的路径，备注：需要自己创建
    },
    filename: function (req, file, cb) {
        // 将保存文件名设置为 字段名 + 时间戳，比如 logo-1478521468943
        cb(null, file.fieldname + '-' + Date.now()+ '.jpg');  
    }
});

var upload = multer({ storage: storage })

router.post('/api/upload', upload.single('logo'), function(req, res){
    var file = req.file;
    res.send('success');
});

router.get('/api/userinfo',function(req,res){
    connection.query('SELECT * FROM user WHERE enable = 1', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
           res.json({
            errno: 0,
            data: doc
          });
        }
    }) 
});

router.get('/api/banner',function(req,res){
    connection.query('SELECT * FROM banner WHERE enable = 1', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
           res.json({
            errno: 0,
            data: doc
          });
        }
    }) 
});

router.get('/api/topiclist',function(req,res){
       connection.query('SELECT * FROM topic WHERE enable = 1', function(err, doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})


router.get('/api/movielist',function(req,res){
    connection.query('SELECT movie.Mname,movie.showTime, movie.moviePlayTime,movie.enable, FirstCatrgory.name FROM movie LEFT OUTER JOIN FirstCatrgory ON movie.fid = FirstCatrgory.fid',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            errno: 0,
            data: doc
           })
        }
    })
})

router.post('/api/login', function(req, res){
    var userName = req.body.userName,
    password = md5(req.body.password),
    resBody = {state:''}
    connection.query("SELECT * FROM user WHERE username='"+userName+"'",function(err, doc){
        if(err){
            resBody.state = '账号不存在';
            res.send(resBody);
        }
        else{
            if(doc.length==0){
              resBody.state = '账号不存在';
              res.send(resBody);
            }
            else{
              if(doc[0].password==password){
                resBody.state = '登陆成功';
                res.send(resBody);
               }
              else{
               resBody.state = '密码错误'
               res.send(resBody)
              }
            }
        }
    })
});

router.post('/api/setPsw',function(req,res){
    var userName = req.body.userName,
    password = req.body.password,
    repeatPsw = req.body.repeatPsw,
    resBody = {state:''}
    if(password === repeatPsw && userName==='admin'){
    connection.query('update user set password = md5("' + password + '")',function(err, doc){
        if(err){
            console.log(err);
            resBody.state = '修改失败';
            res.send(resBody);
        }
        else{
            resBody.state = '修改成功'
            res.send(resBody);
            console.log(userName + password + repeatPsw)
        }
    })
  }
  else{
    console.log('两次密码输入不一致，请重新输入!');
    console.log(userName + password + repeatPsw)
  }
})
module.exports = router
