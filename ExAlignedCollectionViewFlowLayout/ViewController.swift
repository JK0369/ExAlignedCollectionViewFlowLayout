//
//  ViewController.swift
//  ExAlignedCollectionViewFlowLayout
//
//  Created by Jake.K on 2021/12/20.
//

import UIKit
import SnapKit
import AlignedCollectionViewFlowLayout
import Reusable
import Then

class ViewController: UIViewController {
  // MARK: Constants
  private enum Color {
    static let clear = UIColor.clear
  }
  // MARK: UI
  private lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: AlignedCollectionViewFlowLayout().then { // <- 여기
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 10
      $0.minimumInteritemSpacing = 10
      $0.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
      $0.horizontalAlignment = .right
      $0.estimatedItemSize = .init(width: 100, height: 40) // self resizing 활성화
    }
  ).then {
    $0.register(cellType: CollectionViewCell.self)
    $0.contentInset = .zero
    $0.showsVerticalScrollIndicator = false
    $0.allowsMultipleSelection = false
    $0.allowsSelection = true
    $0.isScrollEnabled = true
    $0.bounces = true
    $0.backgroundColor = Self.Color.clear
  }
  
  let tags1 = ["When you", "eliminate", "the impossible,", "whatever remains,", "however improbable,", "must be", "the truth."]
  let tags2 = ["Of all the souls", "I have", "encountered", "in my travels,", "his", "was the most…", "human."]
  let tags3 = ["Computers", "make", "excellent", "and", "efficient", "servants", "but", "I", "have", "no", "wish", "to", "serve", "under", "them."]

  var dataSource = [[String]]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBackground
    
    self.setupDataSource()
    self.setupLayout()
  }

  private func setupLayout() {
    self.view.addSubview(self.collectionView)
    self.collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  private func setupDataSource() {
    self.dataSource = [self.tags1, self.tags2, self.tags3]
    self.collectionView.dataSource = self
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(for: indexPath) as CollectionViewCell
    cell.label.text = dataSource[indexPath.section][indexPath.item]
    return cell
  }
}
