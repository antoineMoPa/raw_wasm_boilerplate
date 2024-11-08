(module
  (import "env" "drawRect" (func $drawRect (param i32 i32 i32 i32)))
  (import "env" "setFillStyle" (func $setFillStyle (param i32)))
  (import "env" "setStrokeStyle" (func $setStrokeStyle (param i32)))
  (import "env" "drawText" (func $drawText (param i32 i32)))
  (import "env" "drawLine" (func $drawLine (param i32 i32 i32 i32)))

  ;; Memory for string storage
  (memory (export "memory") 1)
  (data (i32.const 0) "Hello, World!\00")

  (global $window_width (mut i32) (i32.const 0))
  (global $window_height (mut i32) (i32.const 0))

  (func $drawTile
        (call $setStrokeStyle (i32.const 0xFFFFFF))
        (call $drawLine
              (i32.const 0)
              (global.get $window_height)
              (i32.mul (global.get $window_height) (i32.const 2))
              (i32.const 0))
        (call $drawLine
              (i32.const 50)
              (global.get $window_height)
              (i32.add (i32.const 50)
                       (i32.mul (global.get $window_height) (i32.const 2))
                       )
              (i32.const 0))
        (call $drawLine
              (i32.const 0)
              (i32.const 0)
              (i32.mul (global.get $window_width) (i32.const 2))
              (i32.mul (global.get $window_height) (i32.const 2))
              )
        (call $drawLine
              (i32.const 50)
              (i32.const 0)
              (i32.add (i32.const 50)
                       (i32.mul (global.get $window_width) (i32.const 2))
                       )
              (i32.mul (global.get $window_height) (i32.const 2))
              )
        )


  (func $renderCanvas (param $color i32) (param $window_width_param i32) (param $window_height_param i32)
        (global.set $window_width (local.get $window_width_param))
        (global.set $window_height (local.get $window_height_param))
        (call $setFillStyle (local.get $color))

        ;; reset background
        (call $drawRect
              (i32.const 0) (i32.const 0) (global.get $window_width) (global.get $window_height))

        (call $drawTile)

        (call $setFillStyle (i32.const 0xFF0000))
        (call $drawText
              (i32.const 40)
              (i32.const 40)
              )
  )

  ;; Export the render function
  (export "renderCanvas" (func $renderCanvas))
)
