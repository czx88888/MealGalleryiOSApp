import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.mealsData.meals, id: \.self) { meal in
                    ZStack{
                        NavigationLink (destination: DetailView(mealID: meal.idMeal)){
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        HStack {
                            CardView(meal: meal)
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
