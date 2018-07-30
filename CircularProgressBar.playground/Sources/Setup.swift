import SpriteKit

public func setup(_ scene: SKScene) -> SKView {
    // Landscape 4:3
    let width = 800
    let height = width / 4 * 3
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: width, height: height))
    
    // Present the new scene
    sceneView.presentScene(scene)

    return sceneView
}
