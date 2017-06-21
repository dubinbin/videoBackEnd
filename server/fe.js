//存放前端api
const express = require('express')
const router = express.Router()
const fs = require('fs')
const multer = require('multer')
const bodyParser = require('body-parser')
const path = require('path')
var upload = multer({ dest: 'upload' })
const mysql = require('mysql')
var crypto=require('crypto')

//mysql连接信息配置
const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"6653145",
    database:"movie",
    port:8889
})
connection.connect();

//md5加密
function md5 (text) {
    return crypto.createHash('md5').update(text).digest('hex');
};


//切换收藏  前端
router.post('/api/toggleColllect',function(req, res){
    var userid = req.body.uid;
    var collectlist = req.body.collectlist;
    connection.query('update user set collect = "' + collectlist + '"  WHERE id ="' + userid + '"',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json(doc)
        }
    })
})

 //插入视频评论  前端
 router.post('/api/insertMoviecomment', function(req,res){
    var comment = req.body.comment,
    time = req.body.time,
    mid = req.body.mid,
    uid = req.body.uid,
    resBody = {state:''};
        connection.query("INSERT INTO movieComment set comment='"+comment+"',time='"+time+"',mid='"+mid+"',uid='"+uid+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
  })

//插入话题评论  前端
 router.post('/api/insertTopiccomment', function(req,res){
    var comment = req.body.comment,
    time = req.body.time,
    tid = req.body.tid,
    uid = req.body.uid,
    resBody = {state:''};
        connection.query("INSERT INTO topicComment set comment='"+comment+"',time='"+time+"',time='"+time+"',tid='"+tid+"',uid='"+uid+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
  })

//取到弹幕视频信息  前端
router.get('/api/DanmuvideoInfo',function(req, res){
    var id = req.query.id;
    connection.query("SELECT movie.id,movie.Mname,movie.PicUrl,movie.content,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable,user.thumb,user.username,movieCategory.name FROM movie LEFT JOIN(user,movieCategory) ON (movie.uid = user.id AND movie.fid = movieCategory.fid ) WHERE movie.id='"+id+"'AND movie.enable = 1 ",function(err,doc){
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

//插入建议和意见 前端
router.post('/api/insertAdvise', function(req, res){
    var uName = req.body.uName,
    content = req.body.content,
    time = req.body.time,
    contact = req.body.contact,
    title =  req.body.title,
    resBody = {state:''};
    connection.query("INSERT INTO advise set title='"+title+"',content='"+content+"',time='"+time+"',contact='"+contact+"',uName='"+uName+"'",function(err,doc){
        if(err){
            resBody.state='失败';
            res.send(resBody)
        }else{
            resBody.state='成功';
            res.send(resBody)
        }
    })    
})

//取到指定用户收藏列表  前端
router.get('/api/getUsercollect',function(req, res){
    var id = req.query.id;
     connection.query("SELECT user.collect from user WHERE user.id='"+id+"' ",function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json(doc)
        }
    })   
})

//取得话题评论  //前端
router.get('/api/getTopicCommentlist', function(req, res){
    var id = req.query.id;
    connection.query("SELECT topicComment.id,topicComment.comment,topicComment.time,topicComment.enable,user.username,user.thumb,topic.id FROM topicComment LEFT JOIN(user,topic) ON (user.id = topicComment.tid AND topic.id = topicComment.tid) WHERE topicComment.tid='"+id+"' AND topicComment.enable = 1 ",function(err, doc){
        if(err){
           res.send(err);
        }else if (doc) {
           res.json(doc);
        }    
    })
})

//取得影片评论  //前端
router.get('/api/getMovieCommentlist', function(req, res){
    var id = req.query.id;
    connection.query("SELECT movieComment.id, movieComment.comment,movieComment.time,movieComment.enable,user.username,user.thumb,movie.id FROM movieComment LEFT JOIN(user,movie) ON (user.id = movieComment.uid AND movie.id = movieComment.mid) WHERE movieComment.mid='"+id+"' AND movieComment.enable = 1 ",function(err, doc){
        if(err){
          console.log(err);
        }else if (doc) {
           res.json(doc);
        }    
    })
})

//取得弹幕  //前端
router.get('/api/getDanmu', function(req, res){
    connection.query("SELECT * FROM danmu",function(err, doc){
        if(err){
          console.log(err);
        }else if (doc) {
           res.json(doc);
        }    
    })
})

//插入弹幕
router.post('/api/sendDanmu', function(req, res){
    var getDanmu = eval('('+req.body.danmu+')'),
    danmuText = getDanmu.text,
    danmuTime = getDanmu.time,
    danmuColor = getDanmu.color,
    danmuSize = getDanmu.size,
    danmuPosition = getDanmu.position,
    resBody = {};   
    connection.query("INSERT INTO danmu (text,time,position,color,size) VALUE ('"+danmuText+"','"+danmuTime+"','"+danmuPosition+"','"+danmuColor+"','"+danmuSize+"')" ,function(err,doc){
        if(err){
            resBody.state='插入失败';
            res.send(resBody)
        }else{
            resBody.state='插入成功';
            res.send(resBody)
        }
    })
})



//注册api  前端
router.post('/api/resign',function(req, res){
    var username = req.body.username,
    password = md5(req.body.password),
    mobileNum = req.body.mobileNum,
    resBody = {};
    connection.query("INSERT INTO user (username,password,mobile,level) VALUE ('"+username+"','" + password + "','"+mobileNum+"',1)" ,function(err,doc){
        if(err){
            resBody.state='注册失败';
            res.send(resBody)
        }else{
            resBody.state='注册成功';
            res.send(resBody)
        }
    })
})

//验证用户名是否存在
router.post('/api/checkUserName',function(req, res){
    var username = req.body.username,
    resBody = {state:''};
    connection.query('SELECT *  FROM user WHERE username = "'+username+'"',function(err,doc){
        if (err) {
         resBody.state='error';
          console.log(err)
        } else{
          if(doc.length==0) {
            resBody.state='不存在的';
            res.send(resBody)
         } else if(doc[0]){
            resBody.state='用户名已存在';
            res.send(resBody)         
         }
       }
    })
})

//根据id取到对应分类电影列表API   前端
router.get('/api/getCategorymovie',function(req, res){
    var id = req.query.id;
    connection.query("SELECT movie.id,movie.Mname,movie.PicUrl,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable, movieCategory.name FROM movie LEFT OUTER JOIN movieCategory ON movie.fid = movieCategory.fid  WHERE movie.fid='"+id+"'  order by movie.id LIMIT 4",function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            name: doc[0].name,
            data: doc
           })
        }
    })
})
//根据id取到对应分类电影列表API (加载使用)  前端
router.post('/api/getCategorymoviePage', function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 4);
    var limitNum = '4';
    var id = req.body.id;
      connection.query('SELECT movie.id,movie.Mname,movie.PicUrl,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable, movieCategory.name FROM movie LEFT OUTER JOIN movieCategory ON movie.fid = movieCategory.fid  WHERE movie.fid='+id+' order by movie.id limit '+startPage+','+limitNum+' ',function(err,doc){
        if(err){
           res.send(err);
        }else if (doc) {
           res.json(doc);
        }    
    })
})

//收藏功能  前端
router.get('/api/getCollect',function(req,res){
    var collectID = req.query.collectID;
    connection.query("SELECT movie.id,movie.Mname,movie.enable,movie.PicUrl FROM movie WHERE id in ("+ collectID + ") order by movie.id " ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
       }
    }) 
 })

//根据前端传值取到影片  前端
router.get('/api/getHistory',function(req,res){
    var historyID = req.query.historyID;
    connection.query("SELECT movie.id,movie.PicUrl,movie.Mname,movie.enable FROM movie WHERE id in ("+ historyID + ") order by movie.id " ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
       }
    }) 
 })

//选择id的文章  前端
router.get('/api/gettopic',function(req, res){
    let id = req.query.id;
    connection.query("SELECT topic.id,topic.tname,topic.coverPic,topic.content,topic.time,topic.article,topic.enable,user.thumb,user.username,topicCategory.name FROM topic LEFT JOIN(user,topicCategory) ON (topic.uid = user.id AND topic.categoryId = topicCategory.tid ) WHERE topic.id='"+id+"' AND topic.enable=1 ",function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json(doc)
        }
    })
})
//取到电影列表API   前端
router.get('/api/getmovielist',function(req, res){
    let limitNum = '4';
    let type = req.query.type;
    connection.query('SELECT movie.id,movie.Mname,movie.PicUrl,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable, movieCategory.name FROM movie LEFT OUTER JOIN movieCategory ON movie.fid = movieCategory.fid WHERE movie.fid = '+type+'  AND movie.enable=1  order by movie.id LIMIT '+limitNum+' ',function(err,doc){
        if (err) {
          console.log(err)
        } else if (doc) {
          res.json({
            name: doc[0].name,
            data: doc
           })
        }
    })
})

//前端请求轮播图
router.get('/api/bannerList',function(req,res){
    connection.query('SELECT * FROM banner WHERE enable = 1 LIMIT 3', function(err, doc){
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

//前端请求话题列表
router.get('/api/gettopiclist',function(req, res){
    connection.query('SELECT topic.id,topic.coverPic,topic.tname,topic.time,topic.enable,topicCategory.name FROM topic LEFT OUTER JOIN topicCategory ON topic.categoryId = topicCategory.tid WHERE topic.enable = 1 order by topic.id ',function(err,doc){
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
//前台登陆 ／／区分后台登录
router.post('/api/loginInFe', function(req, res){
    var userName = req.body.userName,
    password = md5(req.body.password),
    resBody = {state:''}
    connection.query("SELECT * FROM user WHERE username='"+userName+"' AND enable= 1 ",function(err, doc){
        if(err){
            resBody.state = '账号不存在';
            res.send(resBody);
        }else{
            if(doc.length==0){
              resBody.state = '账号不存在';
              res.send(resBody);
            } else{
              if(doc[0].password==password){
                req.session.user = doc[0].username;
                resBody.state = '登陆成功';
                res.send(doc);
               }else{
               resBody.state = '密码错误'
               res.send(resBody)
              }
            }
        }
    })
});

router.get('/getLoginStatus',function(req, res){
    let LoginStatus = req.session.user
    res.send(LoginStatus);
})
module.exports = router
