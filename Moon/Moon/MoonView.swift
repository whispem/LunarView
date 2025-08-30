//
//  MoonView.swift
//  Moon
//
//  Created by Emilie on 30/08/2025.
//
import SwiftUI
import SceneKit

struct MoonView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView(frame: .zero)
        view.allowsCameraControl = true
        view.backgroundColor = .black
        view.autoenablesDefaultLighting = false

        let scene = SCNScene()
        view.scene = scene

        
        let moon = SCNSphere(radius: 2.0)
        moon.segmentCount = 128

        let mat = SCNMaterial()
        if let texture = UIImage(named: "moonTexture") {
            print("✅ Found")
            mat.diffuse.contents = texture
            mat.emission.contents = texture
        } else {
            print("❌ Not found")
            mat.diffuse.contents = UIColor.gray
        }
        mat.lightingModel = .lambert
        mat.isDoubleSided = true
        moon.firstMaterial = mat

        let moonNode = SCNNode(geometry: moon)
        scene.rootNode.addChildNode(moonNode)

        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(0, 0, 12)
        scene.rootNode.addChildNode(camera)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .directional
        lightNode.eulerAngles = SCNVector3(-Float.pi/4, Float.pi/4, 0)
        scene.rootNode.addChildNode(lightNode)

        let rotation = CABasicAnimation(keyPath: "rotation")
        rotation.toValue = NSValue(scnVector4: SCNVector4(0, 1, 0, Float.pi * 2))
        rotation.duration = 20
        rotation.repeatCount = .infinity
        moonNode.addAnimation(rotation, forKey: "rotation")

        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
