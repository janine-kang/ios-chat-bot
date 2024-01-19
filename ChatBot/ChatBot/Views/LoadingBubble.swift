//
//  LoadingBubble.swift
//  ChatBot
//
//  Created by Janine on 1/17/24.
//

import UIKit

final class LoadingBubble: UIView {
    
    // MARK: - Properties
    
    private(set) var isAnimating = false
    
    var isPulseEnabled: Bool = true
    
    override var backgroundColor: UIColor? {
        set {
            [contentBubble, cornerBubble, tinyBubble].forEach { $0.backgroundColor = newValue }
        } get {
            contentBubble.backgroundColor
        }
    }
    
    // MARK: - Subviews
    
    let loadingIndicator = LoadingIndicator()
    let contentBubble = UIView()
    let cornerBubble = BubbleCircle()
    let tinyBubble = BubbleCircle()
    
    //MARK: - Animation Layers
    
    var contentPulseAnimationLayer: CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.fromValue = 1
        animation.toValue = 1.04
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.autoreverses = true
        
        return animation
    }
    
    var circlePulseAnimationLayer: CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.fromValue = 1
        animation.toValue = 1.1
        animation.duration = 0.5
        animation.repeatCount = .infinity
        animation.autoreverses = true
        
        return animation
    }
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
      addSubview(tinyBubble)
      addSubview(cornerBubble)
      addSubview(contentBubble)
      contentBubble.addSubview(loadingIndicator)
      backgroundColor = .systemGray5
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()

      guard
        bounds.width > 0,
        bounds.height > 0
      else { return }

      let ratio = bounds.width / bounds.height
      let extraRightInset = bounds.width - (1.65 / ratio) * bounds.width

      let tinyBubbleRadius: CGFloat = bounds.height / 6
      tinyBubble.frame = CGRect(
        x: 0,
        y: bounds.height - tinyBubbleRadius,
        width: tinyBubbleRadius,
        height: tinyBubbleRadius)

      let cornerBubbleRadius = tinyBubbleRadius * 2
      let offset: CGFloat = tinyBubbleRadius / 6
      cornerBubble.frame = CGRect(
        x: tinyBubbleRadius - offset,
        y: bounds.height - (1.5 * cornerBubbleRadius) + offset,
        width: cornerBubbleRadius,
        height: cornerBubbleRadius)

      let contentBubbleFrame = CGRect(
        x: tinyBubbleRadius + offset,
        y: 0,
        width: bounds.width - (tinyBubbleRadius + offset) - extraRightInset,
        height: bounds.height - (tinyBubbleRadius + offset))
      let contentBubbleFrameCornerRadius = contentBubbleFrame.height / 2

      contentBubble.frame = contentBubbleFrame
      contentBubble.layer.cornerRadius = contentBubbleFrameCornerRadius

      let insets = UIEdgeInsets(
        top: offset,
        left: contentBubbleFrameCornerRadius / 1.25,
        bottom: offset,
        right: contentBubbleFrameCornerRadius / 1.25)
      loadingIndicator.frame = contentBubble.bounds.inset(by: insets)
    }

    
    
    // MARK: - Animation
    func startAnimating() {
        defer { isAnimating = true }
        
        guard !isAnimating else { return }
        loadingIndicator.startAnimating()
        
        if isPulseEnabled {
            contentBubble.layer.add(
                contentPulseAnimationLayer,
                forKey: AnimationKeys.pulse
            )
            
            [cornerBubble, tinyBubble].forEach { $0.layer.add(
                circlePulseAnimationLayer,
                forKey: AnimationKeys.pulse
            )}
        }
    }
    
    func stopAnimating() {
        defer { isAnimating = false }
        
        guard isAnimating else { return }
        loadingIndicator.stopAnimating()
        
        [contentBubble, cornerBubble, tinyBubble].forEach { $0.layer.removeAnimation(forKey: AnimationKeys.pulse)
        }
    }
    
    // MARK: - Private
    
    private enum AnimationKeys {
        static let pulse = "typingBubble.pulse"
    }
}
