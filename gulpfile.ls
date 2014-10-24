require!{
  \gulp
  \gulp-livescript
  \gulp-livereload
  \tiny-lr
  \gulp-browserify
  \gulp-concat
  \express
  \gulp-util
  \path
  \connect-livereload
  \connect-history-api-fallback
  \del 
  \gulp-rename
  \gulp-notify
  \gulp-uglify
  \gulp-rev
  \gulp-usemin-query
  \gulp-stylus
  \gulp-minify-css
}

# port config
DEV_PORT = 3000
PRO_PORT = 4000
LIVERELOAD_PORT = 33333

app = express!
server = tiny-lr!

# express server
gulp.task \devexpress, ->
  gulp-util.log "============================"
  gulp-util.log "Listening on port: #{DEV_PORT}"
  gulp-util.log "============================"
  app.use connect-livereload!
  app.use connect-history-api-fallback
  app.use express.static path.resolve \./app/
  app.listen DEV_PORT
gulp.task \proexpress, ->
  gulp-util.log "============================"
  gulp-util.log "Listening on port: #{PRO_PORT}"
  gulp-util.log "============================"
  app.use connect-livereload!
  app.use connect-history-api-fallback
  app.use express.static path.resolve \./dist/
  app.listen PRO_PORT

# livereload tasks
gulp.task \html, ->
  gulp.src \app/*.html
    .pipe gulp-livereload server
gulp.task \livescript !->
  gulp.src \gulpfile.ls
    .pipe gulp-livescript {bare: true}
    .pipe gulp.dest \.
    .pipe gulp-livereload server
gulp.task \stylus, ->
  gulp.src \app/styl/*.styl
    .pipe gulp-stylus!
    .pipe gulp.dest \app/css
    .pipe gulp-livereload server

# browserify for app/src/app.ls
gulp.task \browserify !->
  gulp.src \app/src/app.ls, { read: false }
    .pipe gulp-browserify {transform: \liveify, extensions: ['.ls'], debug: true}
    .on \error, ( err ) !->
      gulp-util.log "[error] #{err}"
      @end!
      gulp.src('').pipe gulp-notify '✖ Browserify Failed ✖'
    .pipe gulp-rename \bundle.js
    .pipe gulp.dest \app/js/ 
    .pipe gulp-livereload server

# watch task
gulp.task \watch ->
  server.listen LIVERELOAD_PORT, ->
    gulp.watch \app/*.html, <[ html ]>
    gulp.watch \gulpfile.ls, <[ livescript ]>
    gulp.watch \app/src/**/*.ls, <[ browserify ]>

# delete app/js folder
gulp.task \clean ->
  del.sync <[ app/js ]>

# publish
gulp.task \bundle, ->
  gulp.src \app/src/app.ls, { read: false }
    .pipe gulp-browserify {transform: \liveify, extensions: ['.ls']}
    .pipe gulp-rename \bundle.js
    .pipe gulp-uglify!
    .pipe gulp-rev!
    .pipe gulp.dest \./dist/js

gulp.task \cleanDist ->
  del.sync <[ dist ]>

gulp.task \usemin, ->
  gulp.src \app/index.html
    .pipe gulp-usemin-query do
      css: [gulp-minify-css!, gulp-rev!]
      js: [gulp-uglify!, gulp-rev!]
    .pipe gulp.dest \./dist

gulp.task \copy, ->
  gulp.src \app/*.html
    .pipe gulp.dest \./dist

gulp.task \default, <[ clean html livescript stylus browserify watch devexpress ]>
gulp.task \publish, <[ cleanDist usemin copy proexpress ]>
