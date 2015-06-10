gulp = require 'gulp'
sass = require 'gulp-sass'

gulp.task 'sass', () ->
	gulp.src 'sass/master.scss'
	.pipe sass
		outputStyle: 'compressed'
	.on 'error', swallowError
	.pipe gulp.dest 'css'

gulp.task 'watch', () ->
	gulp.start 'sass'
	gulp.watch 'sass/**/*.scss', ['sass'] # '**' represents all subfolders '*' represents any extension that ends with what I defined in this case '.scss'

gulp.task 'default', () ->
	gulp.start 'watch'
			
swallowError = (error) ->
	console.error error.toString()
	this.emit 'end'			