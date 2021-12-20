//
//  CollectionViewCell.swift
//  ExAlignedCollectionViewFlowLayout
//
//  Created by Jake.K on 2021/12/20.
//

import UIKit
import Reusable
import SnapKit
import Then

final class CollectionViewCell: UICollectionViewCell, Reusable {
  // MARK: UI
  let label = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.textColor = .white
    $0.backgroundColor = .systemBlue
    $0.textAlignment = .center
  }
  
  // MARK: Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.backgroundColor = .systemBlue
    self.contentView.addSubview(label)
    self.label.snp.makeConstraints {
      $0.left.right.equalToSuperview().inset(10)
      $0.top.bottom.equalToSuperview().inset(20)
    }
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
