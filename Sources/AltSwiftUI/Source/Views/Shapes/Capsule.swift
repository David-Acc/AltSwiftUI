//
//  Capsule.swift
//  AltSwiftUI
//
//  Created by Nodehi, Jabbar on 2020/09/09.
//  Copyright © 2020 Rakuten Travel. All rights reserved.
//

import UIKit

/// A view that represents a Capsule shape.
public struct Capsule: Shape {
    public var viewStore = ViewValues()
    
    public var fillColor = Color.clear
    public var strokeBorderColor = Color.clear
    public var style = StrokeStyle()

    public var body: View {
        EmptyView()
    }
    
    public init() {}
    
    public func createView(context: Context) -> UIView {
        let view = AltShapeView().noAutoresizingMask()
        view.layer.addSublayer(view.caShapeLayer)
        updateView(view, context: context)
        return view
    }
    
    public func updateView(_ view: UIView, context: Context) {
        guard let view = view as? AltShapeView else { return }
        
        let width = context.viewValues?.viewDimensions?.width ?? .infinity
        let height = context.viewValues?.viewDimensions?.height ?? .infinity
        let minDimensions = min(width, height)
        let animation = context.transaction?.animation
        let path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: width, height: height),
            cornerRadius: minDimensions/2
        ).cgPath
        
        performUpdate(layer: view.caShapeLayer, keyPath: "path", newValue: path, animation: animation)
        updateShapeLayerValues(view: view, context: context)
    }
}
