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

//处理上传的插件
var createFolder = function(folder){
    try{
        fs.accessSync(folder); 
    }catch(e){
        fs.mkdirSync(folder);
    }  
};

//设置上传目录
var uploadFolder = 'upload';
createFolder(uploadFolder);

// 通过 filename 属性定制文件名等信息
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, uploadFolder); 
         // 保存的路径，备注：需要自己创建
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + Math.floor(Math.random()*100000000));   
        // 将保存文件名设置为 字段名 + 时间戳，比如 logo-1478521468943
    }
});

//初始化multer插件，使用stroage进行转存
var upload = multer({ storage: storage})

//上传轮播图API   公共类api
router.post('/api/uploadPic', upload.single('upload'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/banner/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
            if(err) throw err;
            res.send(target_path)
        })
    })
});
//上传富文本编辑器图片API
router.post('/api/uploadEditorPic', upload.single('upload'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/editor/' + file.filename+ '.jpg';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
            if(err) throw err;
            res.send(target_path)
        })
    })
});


//上传视频api 
router.post('/api/addVideo', upload.single('video'), function(req, res){
    var file = req.file;
    var tmp_path = file.path;
    var target_path = './upload/video/' + file.filename+ '.mp4';
    fs.rename(tmp_path,target_path,function(err){
        if(err) throw err;
        fs.unlink(tmp_path,function(){
          res.send(target_path)
        })
    })
});

//删除视频
router.post('/api/deleteVideo',function(req, res){
   var videoSrc = req.body.videoSrc;
   var ChangeVideoSrc = videoSrc.substring(2);
   fs.unlink(ChangeVideoSrc,function(err){
    if(err){
     throw err;
    } else{
     res.send('已经成功删除')
     }
   })
})   

//修改图片，删除原有图片api
router.post('/api/deletePic',function(req, res){
   var imgSrc = req.body.imgSrc;
   var ChangePicSrc = imgSrc.substring(2);
   fs.unlink(ChangePicSrc,function(err){
    if(err){
     throw err;
    } else{
     res.send('已经成功删除')
     }
   })
})      

//封禁视频API
router.post('/api/movieBan',function(req,res){
    const id = req.body.id;
    connection.query('update movie set enable = "0"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
         console.log(err);
        } else{
         res.send('已被封禁')
        }
    })
})

//视频列表 删除视频API
router.post('/api/movieDelete',function(req, res){
    const id = req.body.id;
    connection.query("DELETE FROM movie WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
      }
    }) 
 })

//解封视频API
router.post('/api/unBanMovie',function(req,res){
    id = req.body.id,
    connection.query('update movie set enable = "1"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被解封')
        }
    })
})

//修改视频，删除原有视频api 
router.post('/api/deleteVideo', function(req, res){
    var videoSrc = req.body.videoSrc;
    var ChangeVideoSrc = videoSrc.substring(2);
    fs.unlinkSync(ChangeVideoSrc,function(err){
        if(err){
          throw err;
         }
        res.send('已经成功删除')
    }) 
});



//取到电影列表API
router.post('/api/movielist', checkLogin);
router.post('/api/movielistPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('SELECT movie.id,movie.Mname,movie.PicUrl,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable, movieCategory.name FROM movie LEFT OUTER JOIN movieCategory ON movie.fid = movieCategory.fid order by movie.id limit '+startPage+','+limitNum+' ',function(err,doc){
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

//取到电影列表API(分页)
router.get('/api/movielist',function(req, res){
    connection.query('SELECT movie.id,movie.Mname,movie.PicUrl,movie.showTime,movie.movieUrl,movie.moviePlayTime,movie.enable, movieCategory.name FROM movie LEFT OUTER JOIN movieCategory ON movie.fid = movieCategory.fid order by movie.id ',function(err,doc){
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

 //电影上传API
 router.post('/api/movieAdd', function(req,res){
    var movieName = req.body.movieName,
    PicUrl = req.body.PicSrc,
    showTime = req.body.showTime,
    content = req.body.content,
    movieUrl = req.body.movieUrl,
    moviePlayTime = req.body.moviePlayTime,
    actor = req.body.actor,
    BelongId = req.body.BelongId,
    resBody = {state:''}
        connection.query("INSERT INTO movie set Mname='"+movieName+"',Actor='"+actor+"',PicUrl='"+PicUrl+"',showTime='"+showTime+"',content='"+content+"',movieUrl='"+movieUrl+"',moviePlayTime='"+moviePlayTime+"',fid='"+BelongId+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
                console.log('err')
            } else{
                resBody.state='上传成功';
                res.send(resBody)
                console.log(doc)
            }
        })
  })

 //电影编辑提交API
 router.post('/api/moiveUpload',function(req,res){
    var movieName = req.body.movieName,
    PicUrl = req.body.PicSrc,
    showTime = req.body.showTime,
    content = req.body.content,
    movieUrl = req.body.movieUrl,
    moviePlayTime = req.body.moviePlayTime,
    actor = req.body.actor,
    BelongId = req.body.BelongId,
    id = req.body.id,
    resBody = {state:''}
        connection.query("update movie set Mname='"+movieName+"',Actor='"+actor+"',PicUrl='"+PicUrl+"',showTime='"+showTime+"',content='"+content+"',movieUrl='"+movieUrl+"',moviePlayTime='"+moviePlayTime+"',fid='"+BelongId+"' WHERE id ='"+id+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            } else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

//电影列表编辑点击API
router.get('/api/movieEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM movie WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
      }
    }) 
})

 //轮播图增加API
 router.post('/api/bannerAdd',function(req,res){
    var bannerName = req.body.bannerName,
    bannerSrc = req.body.bannerSrc,
    resBody = {state:''}
    if(bannerName=='' || bannerSrc==''){
        resBody.state='上传失败';
        res.send(resBody)
    }else{
        connection.query("INSERT INTO banner set title='"+bannerName+"',url='"+bannerSrc+"'",function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }
            else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
    }
 })
  
//轮播图编辑点击API
router.get('/api/bannerEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM banner WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
       }
    }) 
 })



//修改轮播图API
router.post('/api/bannerUpload',function(req,res){
    var title = req.body.bannerName,
    url = req.body.bannerSrc,
    id = req.body.id,
    resBody = {state:''};
    connection.query('update banner set title = "' + title + '",url = "' + url + '" WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
            resBody.state = '修改失败';
            res.send(resBody);
        } else{
            resBody.state = '修改成功'
            res.send(resBody);
        }
    })
})

//轮播图删除API
router.post('/api/bannerDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM banner WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
    }
  }) 
})

//轮播图列表获取API
router.get('/api/banner', checkLogin);
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

//电影分类API
router.get('/api/movieCategoryList',function(req,res){
    connection.query('SELECT * FROM movieCategory order by fid', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
          res.send(doc);
        }
    }) 
});
//点击电影分类API
router.get('/api/movieCategoryEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM movieCategory WHERE fid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})

//删除电影分类API
router.post('/api/movieCategoryDel',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM movieCategory WHERE fid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
        connection.query("DELETE FROM movie WHERE fid='"+id+"'" ,function(err, doc){
            if(err) throw err
            res.send('删除成功')
        })
      }
  }) 
})

//修改电影类别更新API
router.post('/api/movieCategoryUpload',function(req,res){
    var id = req.body.id,
    name = req.body.categoryName;
    connection.query('update movieCategory set name ="' + name + '"  WHERE fid ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        } else{
            res.send('成功')
        }
    })
})

//上传增加电影类别API
router.post('/api/movieCategoryAdd',function(req,res){
    var name = req.body.categoryName
    resBody = {state:''}
        connection.query("INSERT INTO movieCategory set name='"+name+"'",function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            } else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })


//取到用户列表API
router.get('/api/userinfo',function(req,res){
    connection.query('SELECT * FROM user order by id', function(err, doc){
        if (err) {
           return console.log(err)
        }else if (doc) {
           res.json({
            errno: 0,
            data: doc
          });
        }
    }) 
});


//更新用户信息API
router.post('/api/userinfoUpload',function(req,res){
    var userName = req.body.userName,
    url = req.body.thumb,
    id = req.body.id,
    resBody = {state:''};
    connection.query('update user set username = "' + userName + '",thumb = "' + url + '" WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
            resBody.state = '修改失败';
            res.send(resBody);
        }
        else{
            resBody.state = '修改成功'
            res.send(resBody);
        }
    })
})

 
//点击用户编辑API
router.get('/api/userinfoEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM user WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})

//删除用户API 慎用
router.post('/api/userDelete',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM user WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
         res.send('删除成功')
    }
  }) 
})

//封禁用户API
router.post('/api/userBan',function(req,res){
    id = req.body.id;
    connection.query('update user set enable = "0"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被封禁')
        }
    })
})

//解封用户API
router.post('/api/userleaveBan',function(req,res){
    id = req.body.id;
    connection.query('update user set enable = "1"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被解封')
        }
    })
})

//取到话题列表API(分页)
router.post('/api/topiclistPage',function(req, res){
    var getpageNum = req.body.pageNum;
    var startPage = parseInt(getpageNum * 10);
    var limitNum = '10';
    connection.query('SELECT topic.id,topic.tname,topic.time,topic.enable,topicCategory.name FROM topic LEFT OUTER JOIN topicCategory ON topic.categoryId = topicCategory.tid order by topic.id limit '+startPage+','+limitNum+' ',function(err,doc){
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

//取到话题列表API
// router.get('/api/topiclist', checkLogin);
router.get('/api/topiclist',function(req, res){
    connection.query('SELECT topic.id,topic.tname,topic.time,topic.enable,topicCategory.name FROM topic LEFT OUTER JOIN topicCategory ON topic.categoryId = topicCategory.tid order by topic.id ',function(err,doc){
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

//封禁话题API
router.post('/api/topicBan',function(req,res){
    id = req.body.id;
    connection.query('update topic set enable = "0"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被封禁')
        }
    })
})

//解封话题API
router.post('/api/topicLeaveBan',function(req,res){
    id = req.body.id;
    connection.query('update topic set enable = "1"  WHERE id ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('已被解封')
        }
    })
})

//取到话题分类 API
router.get('/api/topicCategoryList',function(req,res){
    connection.query('SELECT * FROM topicCategory order by tid', function(err, doc){
        if (err) {
           return console.log(err)
        } else if (doc) {
          res.send(doc);
        }
    }) 
});

//点击话题分类API
router.get('/api/topicCategoryEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM topicCategory WHERE tid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})

//删除话题分类API
router.post('/api/topicCategoryDel',function(req,res){
    var id = req.body.id;
    connection.query("DELETE FROM topicCategory WHERE tid='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else{
        connection.query("DELETE FROM topic WHERE  tid='"+id+"'" ,function(err, doc){
            if(err) throw err
            res.send('删除成功')
        })
     }
  }) 
})

//更新话题分类更新API
router.post('/api/topicCategoryUpload',function(req,res){
    var id = req.body.id,
    name = req.body.topicCategoryName;
    connection.query('update topicCategory set name ="' + name + '"  WHERE tid ="' + id + '"',function(err, doc){
        if(err){
            console.log(err);
        }else{
            res.send('成功')
        }
    })
})

//上传增加话题分类API
router.post('/api/topicCategoryAdd',function(req,res){
    var name = req.body.topicCategoryName
    resBody = {state:''}
        connection.query("INSERT INTO topicCategory set name='"+name+"'",function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

 //话题上传API
 router.post('/api/topicAdd', function(req,res){
    var topicName = req.body.topicName,
    content = req.body.content,
    coverPic = req.body.coverPic,
    time = req.body.time,
    categoryId = req.body.categoryId,
    article = req.body.article,
    resBody = {state:''}
        connection.query("INSERT INTO topic set tname='"+topicName+"',content='"+content+"',coverPic='"+coverPic+"',time='"+time+"',categoryId='"+categoryId+"',article='"+article+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
                console.log('err')
            }else{
                resBody.state='上传成功';
                res.send(resBody)
                console.log(doc)
            }
        })
  })

 //话题更新提交API
 router.post('/api/topicUpload',function(req,res){
    var topicName = req.body.topicName,
    id = req.body.id,
    content = req.body.content,
    coverPic = req.body.coverPic,
    time = req.body.time,
    categoryId = req.body.categoryId,
    article = req.body.article,
    resBody = {state:''}
        connection.query("update topic set tname='"+topicName+"',content='"+content+"',coverPic='"+coverPic+"',time='"+time+"',categoryId='"+categoryId+"',article='"+article+"' WHERE id ='"+id+"'", function(err,doc){
            if(err){
                resBody.state='上传失败';
                res.send(resBody)
            }else{
                resBody.state='上传成功';
                res.send(resBody)
            }
        })
 })

//话题编辑点击API
router.get('/api/topicEdit',function(req,res){
    var id = req.query.id;
    connection.query("SELECT * FROM topic WHERE id='"+id+"'" ,function(err, doc){
      if (err) {
        return console.log(err)
      } else if (doc) {
        res.json(doc);
    }
  }) 
})


//登陆／验证API
router.post('/api/login', function(req, res){
    var userName = req.body.userName,
    password = md5(req.body.password),
    resBody = {state:''}
    connection.query("SELECT * FROM user WHERE username='"+userName+"'",function(err, doc){
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
                res.send(resBody);
               }else{
               resBody.state = '密码错误'
               res.send(resBody)
              }
            }
        }
    })
});

 //登出api
 router.post('/api/logout',function(req, res){
    req.session.user = null;
    res.send('已登出');
 })

//修改密码API
router.post('/api/setPsw',function(req, res){
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
        }else{
            resBody.state = '修改成功'
            res.send(resBody);
            console.log(userName + password + repeatPsw)
        }
    })
  } else{
    console.log('两次密码输入不一致，请重新输入!');
    console.log(userName + password + repeatPsw)
  }
})

//中间件，检查登陆状态，如未登陆跳转login页
function checkLogin(req, res, next) {
  if (!req.session.user) {
      res.redirect('/login');
    }
    next();
  }

module.exports = router
