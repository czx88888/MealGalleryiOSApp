import Foundation
import SwiftUI

struct MealDetail: Hashable, Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

struct MealDetailAPIData: Hashable, Codable {
    var meals: [MealDetail]
}

class DetailViewModel: ObservableObject {
    @Published var mealDetailData: MealDetailAPIData = MealDetailAPIData(meals:[])
    let mealID: String
    
    init(mealID: String) {
        self.mealDetailData = MealDetailAPIData(meals:[])
        //print("mealID:", mealID)
        self.mealID = mealID
    }

    func fetch() {
        guard let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i="+mealID) else {
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
                let mealDetailData = try JSONDecoder().decode(MealDetailAPIData.self, from: data)
                DispatchQueue.main.async {
                    self?.mealDetailData = mealDetailData
                    print("meals info: testing")
                    print(self?.mealDetailData.meals.count ?? "nothing")
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}

extension MealDetail {
    static let sampleData: MealDetail = MealDetail(idMeal: "53062", strMeal: "Walnut Roll Gužvara", strDrinkAlternate: nil, strCategory: "Dessert", strArea: "Croatian", strInstructions: "Mix all the ingredients for the dough together and knead well. Cover the dough and put to rise until doubled in size which should take about 2 hours. Knock back the dough and knead lightly.\r\n\r\nDivide the dough into two equal pieces; roll each piece into an oblong about 12 inches by 8 inches. Mix the filling ingredients together and divide between the dough, spreading over each piece. Roll up the oblongs as tightly as possible to give two 12 inch sausages. Place these side by side, touching each other, on a greased baking sheet. Cover and leave to rise for about 40 minutes. Heat oven to 200ºC (425ºF). Bake for 30-35 minutes until well risen and golden brown. Bread should sound hollow when the base is tapped.\r\n\r\nRemove from oven and brush the hot bread top with milk. Sift with a generous covering of icing sugar.", strMealThumb: "https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg", strTags: Optional("Nutty"), strYoutube: "https://www.youtube.com/watch?v=Q_akngSJVrQ", strIngredient1: Optional("Flour"), strIngredient2: Optional("Caster Sugar"), strIngredient3: Optional("Yeast"), strIngredient4: Optional("Salt"), strIngredient5: Optional("Milk"), strIngredient6: Optional("Eggs"), strIngredient7: Optional("Butter"), strIngredient8: Optional("Walnuts"), strIngredient9: Optional("Butter"), strIngredient10: Optional("Brown Sugar"), strIngredient11: Optional("Cinnamon"), strIngredient12: Optional("Milk"), strIngredient13: Optional("Icing Sugar"), strIngredient14: Optional(""), strIngredient15: Optional(""), strIngredient16: Optional(""), strIngredient17: Optional(""), strIngredient18: Optional(""), strIngredient19: Optional(""), strIngredient20: Optional(""), strMeasure1: Optional("450g"), strMeasure2: Optional("55g"), strMeasure3: Optional("2 parts "), strMeasure4: Optional("1/2 tsp"), strMeasure5: Optional("6 oz "), strMeasure6: Optional("2 Beaten "), strMeasure7: Optional("30g"), strMeasure8: Optional("140g"), strMeasure9: Optional("85g"), strMeasure10: Optional("85g"), strMeasure11: Optional("1 tsp "), strMeasure12: Optional("To Glaze"), strMeasure13: Optional("To Glaze"), strMeasure14: Optional(" "), strMeasure15: Optional(" "), strMeasure16: Optional(" "), strMeasure17: Optional(" "), strMeasure18: Optional(" "), strMeasure19: Optional(" "), strMeasure20: Optional(" "), strSource: Optional("https://www.visit-croatia.co.uk/croatian-cuisine/croatian-recipes/"), strImageSource: nil, strCreativeCommonsConfirmed: nil, dateModified: nil)
}
