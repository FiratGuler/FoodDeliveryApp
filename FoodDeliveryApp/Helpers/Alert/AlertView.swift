//
//  AlertView.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 18.07.2024.
//

import UIKit

class AlertView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let customBar = ProgressBarView()
    private var timer : Timer?
    private let totalDuration : Float = 5.0
    
    init(message: String?) {
        super.init(frame: .zero)
        setupViews()
        contentViewsSetup()
        messageLabel.text = message
        startProgress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupViews() {
        backgroundColor = UIColor(named: "FadedColor")?.withAlphaComponent(0.9)
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        addSubview(messageLabel)
        addSubview(customBar)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        customBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func contentViewsSetup() {
        NSLayoutConstraint.activate([
            
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            customBar.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5),
            customBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            customBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            customBar.heightAnchor.constraint(equalToConstant: 6)
            
        ])
    }
    
    private func startProgress() {
        customBar.setProgress(progress: 1.0, animated: false)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else {return}
            
            let progressValue = customBar.getProgress()
            let progress = max(progressValue - 0.3 / totalDuration , 0.0)
            self.customBar.setProgress(progress: progress, animated: true)
            
            if progress <= 0.0 {
                timer.invalidate()
                animateOut()
            }
            
        }
        
    }
    
    private func animateOut() {
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = 0.0
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }) { _ in
                self.removeFromSuperview()
            }
        }
}
