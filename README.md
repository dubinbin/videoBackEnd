# 一个后台管理系统

## Build Setup

需要在本地准备mysql和redis环境，并启用server环境，例如用supervisor启用server/index.js来启用node服务器，否则会反向代理失败。
介绍文章在http://www.jianshu.com/p/8811eabbc42e
``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
