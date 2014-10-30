# React LiveScript Seed
Quick starter of React-Flux LiveScript Project seed. DEOM: http://michaelhsu.tw/react-livescript-seed/

# Feature

- LiveScipt
- Gulp.js
- LiveReload
- Browserify

## Usage
### 0. Install Dependencies
```
$ npm install
$ bower install
```

### 1. Run the Application

```
$ npm start
```

Now browse to the app at `http://127.0.0.1:3000` .

### 2. Running the App in Production 

```
$ gulp publish
```

Now browse to the app at `http://127.0.0.1:4000` .

## Directory Layout

```
.
├── app
│   ├── css                       #=> compiled Syulus
│   ├── styl                      #=> Stylus
│   ├── js                        #=> compiled LiveScript
│   ├── src                       #=> LiveScript
│   │   ├── actions
│   │   │   └── AppActionCreators.ls
│   │   ├── components
│   │   │   ├── App.react.ls
│   │   │   └── TextItem.react.ls
│   │   ├── constants
│   │   │   └── AppConstants.ls
│   │   ├── dispatcher
│   │   │   └── AppDispatcher.ls
│   │   ├── stores
│   │   │   └── TextItemStore.ls
│   │   ├── utils
│   │   └── app.ls                #=> boot 
│   └── index.html              
├── dist                          #=> production
│   ├── css
│   │   └── style-acc9bc1f.css
│   ├── index.html
│   └── js
│       └── app-8b633c80.js
├── gulpfile.js
└── package.json
```

## Deploy GitHub Pages

```
$ git push origin --delete gh-pages
$ git subtree push --prefix dist origin gh-pages
```