//
//  UIViewController+Extension.swift
//  ZeroChat
//
//  Created by Viktor on 09.01.2021.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView,
                                                        cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: value)
        return cell
    }
}


extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
