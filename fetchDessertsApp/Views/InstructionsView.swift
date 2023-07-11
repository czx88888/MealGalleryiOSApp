import SwiftUI

struct InstructionsView: View {
    var mealDetail: MealDetail
    
    var body: some View {
        VStack {
            Text("Instructions")
                .font(.custom(
                    "AmericanTypewriter",
                    size: 28,
                    relativeTo: .title))
            Text(mealDetail.strInstructions)
                .font(.custom(
                    "PingFangTC-Semibold",
                    size: 20,
                    relativeTo: .body))
        }
        .padding(.horizontal, 30)
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var mealDetail = MealDetail.sampleData
    static var previews: some View {
        InstructionsView(mealDetail: mealDetail)
    }
}
