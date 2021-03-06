//
//  UICollectionView+StubView.swift
//  MarvelHeroes
//
//  Created by Mikhail Medvedev on 07.12.2019.
//  Copyright © 2019 Mikhail Medvedev. All rights reserved.
//

import UIKit

extension UICollectionView
{
	func setStubView(withImage: Bool, message: String = "There are no related items", animated: Bool) {

		let stubView = UIView(frame: CGRect(x: self.center.x,
											 y: self.center.y,
											 width: self.bounds.size.width,
											 height: self.bounds.size.height))

		let imageView = UIImageView(image:
			withImage ? UIImage(named: "search_stub") : UIImage())

		stubView.addSubview(imageView)

		let messageLabel = UILabel()
		messageLabel.textColor = .systemGray
		messageLabel.text = message
		messageLabel.numberOfLines = 0
		messageLabel.textAlignment = .center

		stubView.addSubview(messageLabel)

		imageView.translatesAutoresizingMaskIntoConstraints = false
		messageLabel.translatesAutoresizingMaskIntoConstraints = false

		imageView.heightAnchor.constraint(equalTo: stubView.heightAnchor, multiplier: 0.25).isActive = true

		imageView.centerYAnchor.constraint(equalTo: messageLabel.centerYAnchor, constant: -100).isActive = true
		imageView.centerXAnchor.constraint(equalTo: stubView.centerXAnchor).isActive = true
		messageLabel.topAnchor.constraint(equalTo: stubView.bottomAnchor, constant: -40).isActive = true
		messageLabel.leftAnchor.constraint(equalTo: stubView.leftAnchor, constant: 20).isActive = true
		messageLabel.rightAnchor.constraint(equalTo: stubView.rightAnchor, constant: -20).isActive = true

		self.backgroundView = stubView
		if animated {
			animatePulse(view: messageLabel)
		}
	}

	func restore() {
		self.backgroundView = nil
	}

	private func animatePulse(view: UIView) {
		view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
		UIView.animate(withDuration: 1.5, delay: 0.5, options: [],
					   animations: {
						view.transform = .identity
		})
	}
}
