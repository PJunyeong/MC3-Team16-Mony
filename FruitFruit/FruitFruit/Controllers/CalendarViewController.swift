//
//  CalendarViewController.swift
//  FruitFruit
//
//  Created by Junyeong Park on 2022/07/26.
//

import UIKit
import FirebaseFirestore

class CalendarViewController: UIViewController, UIGestureRecognizerDelegate {
    var fruitArrivedOrders = [FruitOrder]()
    let database = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        addMockOrder()
        initCalendarViewUI()
    }
    
    private func initCalendarViewUI() {
        initCalendarViewNavBar()
        fetchOrders()
    }
    
    private func initCalendarViewNavBar() {
        guard let orangeColor = UIColor(named: Constants.FruitfruitColors.orange1) else { return }
        guard let blackColor = UIColor(named: Constants.FruitfruitColors.black1) else { return }
        let backButtonImage = UIImage(systemName: "chevron.left")?.withTintColor(orangeColor, renderingMode: .alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .done, target: self, action: #selector(popToPrevious))
        navigationItem.title = "푸릇푸릇 달력"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: blackColor, NSAttributedString.Key.font: UIFont.preferredFont(for: .headline, weight: .bold)]
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    private func fetchOrders() {
        guard let user = Storage().fruitUser else { return }
        let detailCollectionName = "\(user.name) \(user.nickname)"
        database.collection(Constants.FStore.Orders.collectionName).document(user.id).collection(detailCollectionName).whereField("status", isEqualTo: "Arrived").getDocuments { querySnapShot, error in
            // addSnapShotListener -> 네비게이션 클릭 시점 문서만 불러오기
            self.fruitArrivedOrders = []
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let documents = querySnapShot?.documents {
                    for document in documents {
                        let data = document.data()
                        do {
                            let fruitOrder: FruitOrder = try FruitOrder.decode(dictionary: data)
                            self.fruitArrivedOrders.append(fruitOrder)
                        } catch {
                            print(error)
                        }
                    }
                    self.fruitArrivedOrders.sort(by: {$0.dueDate < $1.dueDate})
                    DispatchQueue.main.async {
                        //TODO: 달력 UI에 데이터 세팅하기
                        self.setCalendarUI()
                        self.getAllMonths()
                    }
                }
            }
        }
    }
    
    private func setCalendarUI() {
        for order in fruitArrivedOrders {
            print(order.name)
            print(order.status)
            print(order.dueDate)
        }
    }
    
    private func getAllMonths() {
        // 가장 오래 된 주문부터 현재 달까지 모든 MonthModel 배열 생성 함수
        var months = [MonthModel]()
        guard let startOrder = fruitArrivedOrders.first else { return }
        let startDate = startOrder.dueDate
        let startMonthModel = MonthModel(date: startDate)
        months.append(startMonthModel)
        let calendar = Calendar.current
        let startDateComponent = calendar.dateComponents([.year, .month], from: startDate)
        let endDateComponent = calendar.dateComponents([.year, .month], from: Date())
        
        var startMonth = startDateComponent.month!
        var startYear = startDateComponent.year!
        
        let endMonth = endDateComponent.month!
        let endYear = endDateComponent.year!
        
        print(startMonth, startYear)
        
        var tempDate = startDate
        while startMonth < endMonth && startYear <= endYear {
            tempDate = calendar.date(byAdding: .month, value: 1, to: tempDate)!
            let tempMonthModel = MonthModel(date: tempDate)
            months.append(tempMonthModel)
            startMonth += 1
            
            if startMonth == 13 {
                startMonth = 1
                startYear += 1
            }
        }
        print(months)
    }
    
    private func checkMockDate() {
        let dateModel = MonthModel(date: Date())
        print(dateModel)
    }
}
