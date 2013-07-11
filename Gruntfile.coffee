module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['coffee/**/*.coffee']
      tasks: ['coffee', 'uglify']
    coffee:
      compile:
        options:
          join: true
          sourceMap: true
        files:
          'js/pepopo.js': ['coffee/**/*.coffee']
    uglify:
      compile:
        options:
          sourceMap: (fileName) ->
            fileName.replace /\.js$/, '.js.map'
        files: [
          expand: true
          cwd: 'js/'
          src: ['**/*.js']
          dest: 'public/js/'
          ext: '-min.js'
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ['watch']
  return
