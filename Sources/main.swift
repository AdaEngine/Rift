import Gravity

let sourceCode = """
extern var rift

var globalVar = 0

func _init() {
    rift.assets.loadImage("Image.png")
    System.print(rift.system.platform)
}

func _update(delta: Float) {
    System.print(rift.input.getTouches())
    globalVar += 1
    System.print(globalVar)
}

func _draw(graphics: Graphics) {
    graphics.drawText(globalVar)
}
"""

var riftVM = RiftVM()
riftVM.setup()
riftVM.execute(sourceCode: sourceCode)
riftVM.callSetupFunction()

let graphics = Graphics()
for _ in 0..<20 {
    riftVM.update()
    
    riftVM.draw(graphics)
}
