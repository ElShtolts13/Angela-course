//
//  ViewController.swift
//  ByteCoin
//
//  Created by User on 28.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50)
          return label
      }()
    let coinView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
          return view
      }()
    let bitcoinImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bitcoinsign.circle.fill")
        image.tintColor = .white
        return image
    }()
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
          return label
      }()
    var bitcoinLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
          return label
      }()
    var currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setUpUI()
    }

    func addView() {
        view.addSubview(titleLabel)
        view.addSubview(coinView)
        coinView.addSubview(bitcoinImage)
        coinView.addSubview(currencyLabel)
        coinView.addSubview(bitcoinLabel)
        view.addSubview(currencyPicker)
    }

    func setUpUI() {
        view.backgroundColor = UIColor(red: 32/255, green: 113/255, blue: 106/255, alpha: 1)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        coinView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(80)
            }
            
        coinView.layer.cornerRadius = 10
            
        bitcoinImage.snp.makeConstraints{ make in
            make.leading.equalTo(coinView)
            make.height.width.equalTo(80)
            }
        currencyLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview().inset(10)
            }
        bitcoinLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
            }
        currencyPicker.snp.makeConstraints{ make in
            make.height.equalTo(216)
            make.bottom.leading.trailing.equalToSuperview()
        }
            
        }
        
        
        
    }

