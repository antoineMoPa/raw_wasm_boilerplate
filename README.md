# Writing wasm by hand

Writing wasm directly - ok, slightly indirectly as this is using 
the [WAT syntax](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format) - 
is not as difficult as I tougth, especially with some Lisp experience.

# Content

```
index.html - loads the wat file - converts it to wasm - streams it and binds some functions to the wasm env.
main.wat - this is where you edit wasm.
```

# How to run

Start a file server in this directory and open in your browser. Example:

```
python -m http.server
# then visit http://localhost:8000/
```
