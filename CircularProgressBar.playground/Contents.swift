//: # CircularProgressBar

import PlaygroundSupport
import SpriteKit

class Scene: SKScene {
    
    let progressBar = CircularProgressBar()
    
    override init() {
        // Landscape 4:3
        let width = 800
        let height = width / 4 * 3
        super.init(size: CGSize(width: width, height: height))
        
        // Smooth scaling across devices
        scaleMode = .aspectFill
        
        // Center the anchor-point to the screen center
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        // Set the target framerate (energy saving)
        view.preferredFramesPerSecond = 30
        
        // Add the progress bar to the scene
        addChild(progressBar)
    }
    
    var lastTime: TimeInterval = 0
    override func update(_ currentTime: TimeInterval) {
        // Calculate the current delta time
        let deltaTime = currentTime - lastTime
        lastTime = currentTime

        // Applying an increasing value
        progressBar.value += (progressBar.value < 100 ? 5 * deltaTime : -100)
    }
    
}

PlaygroundSupport.PlaygroundPage.current.liveView = setup(Scene())
