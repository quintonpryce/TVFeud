//
//  UIKitExtensions.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-30.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import UIKit

extension UIView {

    /// Animates the view's alpha to 1 and delays setting it back to 0 for `seconds`.
    func show(for seconds: Double) {
        UIView.animate(withDuration: 0.4, delay: 0.3, animations: {
            self.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.4, delay: seconds, animations: {
                self.alpha = 0
            })
        })
    }
}

extension UIViewController {

    func showAlert(
        alertTitle: String,
        actionOneTitle: String, actionOneHandler: @escaping () -> Void,
        actionTwoTitle: String, actionTwoHandler: @escaping () -> Void
    ) {
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: actionOneTitle, style: .destructive, handler: { _ in
            actionOneHandler()
        }))
        alert.addAction(.init(title: actionTwoTitle, style: .destructive, handler: { _ in
            actionTwoHandler()
        }))

        present(alert, animated: true, completion: nil)
    }

    func showAlert(_ alertTitle: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel, handler: { _ in
            completion?()
        }))

        present(alert, animated: true, completion: nil)
    }
}
