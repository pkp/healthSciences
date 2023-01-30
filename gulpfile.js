const gulp = require('gulp');
const sass = require('gulp-sass')(require('sass'));
const concat = require('gulp-concat');
const minifyCSS = require('gulp-csso');
const sourcemaps = require('gulp-sourcemaps');
const minify = require('gulp-minify');

gulp.task('sass', function() {
	return gulp
		.src(['node_modules/bootstrap/scss/bootstrap.scss'])
		.pipe(sass())
		.pipe(concat('app.min.css'))
		.pipe(minifyCSS())
		.pipe(gulp.dest('libs'));
});

gulp.task('scripts', function() {
	return gulp
		.src([
			'node_modules/@popperjs/core/dist/umd/popper.js',
			'node_modules/bootstrap/dist/js/bootstrap.js',
			'js/main.js'
		])
		.pipe(sourcemaps.init())
		.pipe(concat('app.js'))
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('libs'));
});

gulp.task('compress', function() {
	return gulp
		.src('libs/app.js')
		.pipe(
			minify({
				ext: {
					min: '.min.js'
				}
			})
		)
		.pipe(gulp.dest('libs'));
});

gulp.task('build', gulp.series('sass', 'scripts', 'compress'));

gulp.task('watch', function() {
	return gulp.watch('js/*.js', gulp.series('scripts', 'compress'));
});
