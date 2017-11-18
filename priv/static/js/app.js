/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__App_elm__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__App_elm___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_0__App_elm__);


const elmDiv = document.querySelector("#elm-target");
if (elmDiv) {
  __WEBPACK_IMPORTED_MODULE_0__App_elm__["default"].App.embed(elmDiv);
}


/***/ }),
/* 1 */
/***/ (function(module, exports) {

throw new Error("Module build failed: Error: Compiler process exited with error Compilation failed\n-- TYPE MISMATCH - /Users/boo/ispychange/phoenix_elm_starter/lib/phoenix_elm_starter_web/elm/App.elm\n\nThe 2nd argument to function `program` is causing a mismatch.\n\n54|     Navigation.program UrlChange\n55|>        { init = init\n56|>        , update = update\n57|>        , view = view\n58|>        , subscriptions = subscriptions\n59|>        }\n\nFunction `program` is expecting the 2nd argument to be:\n\n    { ...\n    , init : Navigation.Location -> ( Model, Cmd (Msg a) )\n    , update :\n          Msg a\n          -> Model\n          -> ( { currentUser : WebData User\n          , error : Maybe String\n          , loading : Bool\n          , login : LoginView.Model\n          , route : Maybe Route\n          }\n          , Cmd (Msg a)\n          )\n    }\n\nBut it is:\n\n    { ...\n    , init : Navigation.Location -> ( Model, Cmd Types.GraphqlResult )\n    , update :\n          Msg a\n          -> { currentUser : WebData User\n          , loading : Bool\n          , error : Maybe String\n          , login : LoginView.Model\n          , route : Maybe Route\n          }\n          -> ( { currentUser : WebData User\n          , error : Maybe String\n          , loading : Bool\n          , login : LoginView.Model\n          , route : Maybe Route\n          }\n          , Cmd Types.GraphqlResult\n          )\n    }\n\nHint: I am seeing issues with the update and init fields. I always figure out\nfield types in alphabetical order. If a field seems fine, I assume it is\n\"correct\" in subsequent checks. So the problem may actually be a weird\ninteraction with previous fields.\n\nHint: I always figure out the type of arguments from left to right. If an\nargument is acceptable when I check it, I assume it is \"correct\" in subsequent\nchecks. So the problem may actually be in how previous arguments interact with\nthe 2nd.\n\nDetected errors in 1 module.\n\n    at ChildProcess.<anonymous> (/Users/boo/node_modules/node-elm-compiler/index.js:225:27)\n    at emitTwo (events.js:126:13)\n    at ChildProcess.emit (events.js:214:7)\n    at maybeClose (internal/child_process.js:925:16)\n    at Process.ChildProcess._handle.onexit (internal/child_process.js:209:5)");

/***/ })
/******/ ]);