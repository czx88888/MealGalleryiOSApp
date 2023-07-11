import SwiftUI

struct IngredientMeasureView: View {
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(ingredient.ingredient)
            .font(.custom(
                "Verdana-Bold",
                size: 20,
                relativeTo: .title2))
            Spacer()
            Text(ingredient.measure)
            .font(.custom(
                "Verdana-Bold",
                size: 20,
                relativeTo: .title2))
        }
        .padding()
    }
}

struct IngredientMeasureView_Previews: PreviewProvider {
    static var ingredient = Ingredient(ingredient: "ingredient", measure: "measure")
    static var previews: some View {
        IngredientMeasureView(ingredient: ingredient)
    }
}
