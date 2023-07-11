import SwiftUI

struct DetailView: View {
    let mealID: String
    @State var data: Data?
    @State var fetchedData: MealDetailAPIData = MealDetailAPIData(meals:[])
    
    var body: some View {
        if !fetchedData.meals.isEmpty {
            ScrollView {
                VStack {
                    URLImage(urlString: fetchedData.meals[0].strMealThumb, data: nil)
                    Text(fetchedData.meals[0].strMeal)
                        .font(.custom(
                            "AmericanTypewriter",
                            size: 36,
                            relativeTo: .largeTitle))
                        .multilineTextAlignment(.center)
                    
                    IngredientsView(mealDetail: fetchedData.meals[0])
                    InstructionsView(mealDetail: fetchedData.meals[0])
                        .padding(.top, 50)
                    Spacer()
                }
            }
        } else {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i="+mealID) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let mealDetailData = try JSONDecoder().decode(MealDetailAPIData.self, from: data)
                DispatchQueue.main.async {
                    fetchedData = mealDetailData
                }
            } catch {
                print(error)
            }
            self.data = data
        }
        task.resume()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var meal = Meal.sampleData
    static var previews: some View {
        DetailView(mealID: "53049")
    }
}
