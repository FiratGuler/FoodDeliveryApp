//
//  ProgressBarView.swift
//  FoodDeliveryApp
//
//  Created by Fırat Güler on 19.07.2024.
//

import UIKit

class ProgressBarView: UIView {
    
    private let timerBar : UIProgressView = {
        let timerBar = UIProgressView()
        timerBar.progressViewStyle = .default
        timerBar.progressTintColor = UIColor(named: "MainColor")
        timerBar.trackTintColor = UIColor(named: "FadedColor")
        return timerBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(timerBar)
        
        timerBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            timerBar.topAnchor.constraint(equalTo: topAnchor),
            timerBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            timerBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            timerBar.heightAnchor.constraint(equalToConstant: 6)
            
        ])
    }
    
    func setProgress(progress : Float, animated : Bool) {
        timerBar.setProgress(progress, animated: animated)
    }
    
    func getProgress() -> Float {
        return timerBar.progress
    }
    
}
