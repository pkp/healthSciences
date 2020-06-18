const {src, dest, task} = require('gulp');

task('copy-dependencies', function () {
	return src([
		'node_modules/bootstrap/dist/css/bootstrap.min.css',
		'node_modules/jquery/dist/jquery.min.js',
		'node_modules/jquery-ui-dist/jquery-ui.min.js',
		'node_modules/popper.js/dist/umd/popper.min.js',
		'node_modules/bootstrap/dist/js/bootstrap.min.js'
		])
		.pipe(dest('libs'));
});
