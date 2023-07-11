import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
            
        } else {
            Rectangle()
                .fill(.gray)
                .frame(width: 300, height: 300, alignment: .center)
                .onAppear {
                    fetchData()
                }
        }
        
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {  data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

