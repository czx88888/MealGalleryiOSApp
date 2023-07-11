import Foundation
import SwiftUI

struct Meal: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct Meals: Hashable, Codable {
    var meals: [Meal]
}

extension Meal {
    static let sampleData: Meal = Meal(strMeal: "Sample Meal", strMealThumb: "", idMeal: "-1")
}


class ViewModel: ObservableObject {
    @Published var mealsData: Meals = Meals(meals:[])

    func fetch() {
        guard let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            print("data")
            print(data)
            // Convert to JSON
            do {
                var mealsData = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    mealsData.meals.sort { $0.strMeal < $1.strMeal }
                    self?.mealsData = mealsData
                    print("meals info: testing")
                    print(self?.mealsData.meals.count ?? "nothing")
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}

