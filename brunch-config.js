exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      // joinTo: {
      //  "js/app.js": /^(web\/static\/js)/,
      //  "js/vendor.js": /^(web\/static\/vendor)|(deps)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "web/static/vendor/js/jquery-2.1.1.js",
      //     "web/static/vendor/js/bootstrap.min.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": /^web\/static\/css/,
        "vendor/vendor.css": /^node_modules/
      },
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: [
      /^(web\/static\/assets)/,
      /^(node_modules\/font-awesome)/
    ]
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      'web/static',
      'test/static',
      'node_modules/font-awesome/fonts/fontawesome-webfont.eot',
      'node_modules/font-awesome/fonts/fontawesome-webfont.svg',
      'node_modules/font-awesome/fonts/fontawesome-webfont.ttf',
      'node_modules/font-awesome/fonts/fontawesome-webfont.woff',
      'node_modules/font-awesome/fonts/fontawesome-webfont.woff2'
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    },
    sass: {
      options: {
        includePaths: [
          'node_modules/bulma',
          'node_modules/font-awesome/scss'
        ]
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    styles:{
      bulma: ['bulma/bulma.sass'],
      fontawesome: ['font-awesome/scss/font-awesome.scss']
    }
  }
};
