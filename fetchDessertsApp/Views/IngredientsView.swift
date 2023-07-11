import SwiftUI

struct IngredientsView: View {
    var mealDetail: MealDetail
    
    private var ingredients: [Ingredient]
    
    init(mealDetail: MealDetail) {
        self.mealDetail = mealDetail
        var arr = [Ingredient]()
        if let strIngredient1 = mealDetail.strIngredient1, strIngredient1.isEmpty == false, let strMeasure1 = mealDetail.strMeasure1, strMeasure1.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient1, measure: strMeasure1))
        }
        if let strIngredient2 = mealDetail.strIngredient2, strIngredient2.isEmpty == false, let strMeasure2 = mealDetail.strMeasure2, strMeasure2.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient2, measure: strMeasure2))
        }
        if let strIngredient3 = mealDetail.strIngredient3, strIngredient3.isEmpty == false, let strMeasure3 = mealDetail.strMeasure3, strMeasure3.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient3, measure: strMeasure3))
        }
        if let strIngredient4 = mealDetail.strIngredient4, strIngredient4.isEmpty == false, let strMeasure4 = mealDetail.strMeasure4, strMeasure4.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient4, measure: strMeasure4))
        }
        if let strIngredient5 = mealDetail.strIngredient5, strIngredient5.isEmpty == false, let strMeasure5 = mealDetail.strMeasure5, strMeasure5.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient5, measure: strMeasure5))
        }
        if let strIngredient6 = mealDetail.strIngredient6, strIngredient6.isEmpty == false, let strMeasure6 = mealDetail.strMeasure6, strMeasure6.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient6, measure: strMeasure6))
        }
        if let strIngredient7 = mealDetail.strIngredient7, strIngredient7.isEmpty == false, let strMeasure7 = mealDetail.strMeasure7, strMeasure7.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient7, measure: strMeasure7))
        }
        if let strIngredient8 = mealDetail.strIngredient8, strIngredient8.isEmpty == false, let strMeasure8 = mealDetail.strMeasure8, strMeasure8.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient8, measure: strMeasure8))
        }
        if let strIngredient9 = mealDetail.strIngredient9, strIngredient9.isEmpty == false, let strMeasure9 = mealDetail.strMeasure9, strMeasure9.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient9, measure: strMeasure9))
        }
        if let strIngredient10 = mealDetail.strIngredient10, strIngredient10.isEmpty == false, let strMeasure10 = mealDetail.strMeasure10, strMeasure10.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient10, measure: strMeasure10))
        }
        if let strIngredient11 = mealDetail.strIngredient11, strIngredient11.isEmpty == false, let strMeasure11 = mealDetail.strMeasure11, strMeasure11.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient11, measure: strMeasure11))
        }
        if let strIngredient12 = mealDetail.strIngredient12, strIngredient12.isEmpty == false, let strMeasure12 = mealDetail.strMeasure12, strMeasure12.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient12, measure: strMeasure12))
        }
        if let strIngredient13 = mealDetail.strIngredient13, strIngredient13.isEmpty == false, let strMeasure13 = mealDetail.strMeasure13, strMeasure13.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient13, measure: strMeasure13))
        }
        if let strIngredient14 = mealDetail.strIngredient14, strIngredient14.isEmpty == false, let strMeasure14 = mealDetail.strMeasure14, strMeasure14.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient14, measure: strMeasure14))
        }
        if let strIngredient15 = mealDetail.strIngredient15, strIngredient15.isEmpty == false, let strMeasure15 = mealDetail.strMeasure15, strMeasure15.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient15, measure: strMeasure15))
        }
        if let strIngredient16 = mealDetail.strIngredient16, strIngredient16.isEmpty == false, let strMeasure16 = mealDetail.strMeasure16, strMeasure16.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient16, measure: strMeasure16))
        }
        if let strIngredient17 = mealDetail.strIngredient17, strIngredient17.isEmpty == false, let strMeasure17 = mealDetail.strMeasure17, strMeasure17.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient17, measure: strMeasure17))
        }
        if let strIngredient18 = mealDetail.strIngredient18, strIngredient18.isEmpty == false, let strMeasure18 = mealDetail.strMeasure18, strMeasure18.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient18, measure: strMeasure18))
        }
        if let strIngredient19 = mealDetail.strIngredient19, strIngredient19.isEmpty == false, let strMeasure19 = mealDetail.strMeasure19, strMeasure19.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient19, measure: strMeasure19))
        }
        if let strIngredient20 = mealDetail.strIngredient20, strIngredient20.isEmpty == false, let strMeasure20 = mealDetail.strMeasure20, strMeasure20.isEmpty == false {
            arr.append(Ingredient(ingredient: strIngredient20, measure: strMeasure20))
        }
        self.ingredients = arr
    }
    
    var body: some View {
        let _ = print(ingredients)
        VStack {
            Text("Ingredients")
            .font(.custom(
                "AmericanTypewriter",
                size: 28,
                relativeTo: .title))
            ForEach(ingredients, id: \.self) { ingredient in
                let _ = print(ingredient.ingredient)
                IngredientMeasureView(ingredient: ingredient)
            }
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var mealDetail = MealDetail.sampleData
    static var previews: some View {
        IngredientsView(mealDetail: mealDetail)
    }
}
