//
//  OrderResultViewController.swift
//  FruitFruit
//
//  Created by 김유나 on 2022/07/19.
//

import UIKit

class OrderResultViewController: UIViewController {

    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondaryTitleLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var backToHomeButton: UIButton!
    
    let orderSheet: OrderSheet = {
        let orderSheet = OrderSheet(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 48, height: 370))
        orderSheet.translatesAutoresizingMaskIntoConstraints = false
        return orderSheet
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitleLabel.text = "주문 완료"
        navigationTitleLabel.textColor = UIColor(named: Constants.FruitfruitColors.black)
        navigationTitleLabel.font = UIFont.preferredFont(for: .headline, weight: .semibold)
        
        titleLabel.text = "주문이\n완료되었습니다"
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor(named: Constants.FruitfruitColors.black)
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        
        secondaryTitleLabel.text = "아래 계좌로 입금해주세요"
        secondaryTitleLabel.textColor = UIColor(named: Constants.FruitfruitColors.gray1)
        secondaryTitleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        
        view.addSubview(orderSheet)
        orderSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        orderSheet.topAnchor.constraint(equalTo: view.topAnchor, constant: 259).isActive = true
    
        warningLabel.text = "오늘 오후 6시까지 입금이 확인되지 않으면\n주문이 자동으로 취소됩니다."
        warningLabel.font = UIFont.preferredFont(for: .footnote, weight: .bold)
        warningLabel.textColor = UIColor(named: Constants.FruitfruitColors.gray1)
        
        backToHomeButton.setTitle("홈으로", for: .normal)
        let gradient = backToHomeButton.applyButtonGradient(colors: Constants.FruitfruitColors.buttonGradient)
        backToHomeButton.layer.insertSublayer(gradient, at: 0)
        DispatchQueue.main.async {
            self.backToHomeButton.titleLabel?.font = UIFont.preferredFont(for: .headline, weight: .bold)
        }
       
        backToHomeButton.layer.cornerRadius = 16
        backToHomeButton.layer.borderWidth = 1
        backToHomeButton.layer.borderColor = UIColor(named: Constants.FruitfruitColors.button1)?.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
