import Foundation

struct Ingredient: Identifiable, Hashable, Codable {
    var ingredient: String
    var measure: String
    var id: UUID
    
    init(ingredient: String, measure: String, id: UUID = UUID()) {
        self.ingredient = ingredient
        self.measure = measure
        self.id = id
    }
}
