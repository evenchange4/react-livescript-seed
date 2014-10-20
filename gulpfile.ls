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
}

# port config
DEV_PORT = 3000
LIVERELOAD_PORT = 33333

app = express!
server = tiny-lr!

# express server
gulp.task \devexpress, ->
  gulp-util.log "Listening on port: #{DEV_PORT}"
  app.use connect-livereload!
  app.use connect-history-api-fallback
  app.use express.static path.resolve \./app/
  app.listen DEV_PORT

# livereload tasks
gulp.task \html, ->
  gulp.src \app/*.html
    .pipe gulp-livereload server
gulp.task \livescript !->
  gulp.src \gulpfile.ls
    .pipe gulp-livescript {bare: true}
    .pipe gulp.dest \.
    .pipe gulp-livereload server

# browserify for app/src/app.ls
gulp.task \browserify !->
  gulp.src \app/src/app.ls, { read: false }
    .pipe gulp-browserify {transform: \liveify, extensions: ['.ls']}
    .pipe gulp-rename \app.js
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

gulp.task \default, <[ clean html livescript browserify watch devexpress ]>
