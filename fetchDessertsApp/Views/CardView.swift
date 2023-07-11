import SwiftUI

struct CardView: View {
    var meal: Meal
    
    var body: some View {
        VStack {
            URLImage(urlString: meal.strMealThumb, data: nil)
            Text(meal.strMeal)
                .font(.custom(
                            "AmericanTypewriter",
                            size: 36,
                            relativeTo: .largeTitle))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CardView_Previews: PreviewProvider {
    static var meal = Meal.sampleData
    static var previews: some View {
        CardView(meal: meal)
            .previewLayout(.fixed(width: 500, height: 350))
    }
}
