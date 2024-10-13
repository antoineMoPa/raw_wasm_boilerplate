(module
  ;; Import JavaScript functions to interact with the canvas
  (import "env" "drawRect" (func $drawRect (param i32 i32 i32 i32)))
  (import "env" "setFillStyle" (func $setFillStyle (param i32))) ;; Set color
  (import "env" "drawText" (func $drawText (param i32 i32))) ;; Draw text on canvas

  ;; Memory for string storage
  (memory (export "memory") 1)
  (data (i32.const 0) "Hello, World!\00") ;; String data in memory

  ;; Function to interact with canvas by calling JS functions
  (func $renderCanvas (param $color i32) (param $x i32) (param $y i32)
    ;; Call imported functions
    (call $setFillStyle (local.get $color)) ;; Set the fill color
    (call $drawRect (i32.const 50) (i32.const 50) (i32.const 200) (i32.const 100)) ;; Draw a rectangle
    (call $drawText (local.get $x) (local.get $y)) ;; Draw "Hello, World!" at specified coordinates
  )

  ;; Export the render function
  (export "renderCanvas" (func $renderCanvas))
)
