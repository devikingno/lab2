module.exports = {
  apps : [{
    script: 'index.js',
    watch: '.'
  }],

  deploy : {
    production : {
      user : 'parallels',
      host : '10.211.55.8',
      ref  : 'origin/master',
      repo : 'https://github.com/lujakob/nestjs-realworld-example-app.git',
      path : '/home/parallels/Desktop',
      'post-deploy' : 'npm install && pm2 start ecosystem.config.js',
      'pre-setup': ''
    }
  }
};
