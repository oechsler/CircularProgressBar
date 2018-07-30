import PlaygroundSupport
import SpriteKit

// Global settings
let radius: CGFloat = 90
let width: CGFloat = 12
let fontSize: CGFloat = 48

class Scene: SKScene {

    let circleNode = SKShapeNode(circleOfRadius: radius)
    
    var percentage = 100.0
    let percentageLabel = SKLabelNode(text: "NaN %")
    
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
        
        let backCircle = SKShapeNode(circleOfRadius: radius)
        backCircle.lineWidth = width
        backCircle.alpha = 0.4
        circleNode.addChild(backCircle)
        
        percentageLabel.fontName = "Helvetica"
        percentageLabel.fontSize = fontSize
        percentageLabel.position.y = -percentageLabel.frame.size.height / 2.2
        circleNode.addChild(percentageLabel)
        
        circleNode.lineWidth = width
        addChild(circleNode)
    }
    
    var lastTime: TimeInterval = 0
    override func update(_ currentTime: TimeInterval) {
        // Calculate the current delta time
        let deltaTime = currentTime - lastTime
        lastTime = currentTime
        
        // The percentage of degrees the circle will be filled
        percentage += (percentage < 100 ? 5 * deltaTime : -100.0)
        
        // Label to display the percentage
        percentageLabel.text = "\(Int(percentage)) %"
        
        // Calculate the Bezier path for the circle
        circleNode.path = UIBezierPath(
            arcCenter: CGPoint(x: 0 , y: 0),
            radius: radius,
            startAngle: CGFloat(90).degreesToRadians(),
            endAngle: CGFloat(90 - 360 * percentage / 100).degreesToRadians(),
            clockwise: false)
        .cgPath
    }
    
}

PlaygroundSupport.PlaygroundPage.current.liveView = setup(Scene())
