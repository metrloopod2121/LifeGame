
import SwiftUI

struct ContentView: View {
    @StateObject var cells = Cells()
    @State private var scrollToIndex: Int? = nil 
    
    var backgroundColor = Gradient(colors: [Color(red: 48/255, green: 1/255, blue: 77/255), Color(red: 1/255, green: 2/255, blue: 2/255)])
    
    var addCellButton: some View {
        Button(
            action: {
                cells.addCell()
                scrollToIndex = cells.cellArray.count - 1
            },
            label: {
                Text("Сотворить")
                     .font(.system(size: 20))
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Color(red: 90/255, green: 52/255, blue: 114/255))
                     .foregroundColor(.white)
                     .cornerRadius(10)
            }
        )
    }
    
    var header: some View {
        Text("Клеточное наполнение")
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.white)
    }
     
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { list in
                    ScrollView {
                        ForEach(Array(zip(cells.cellArray.indices, $cells.cellArray)), id: \.0) { index, cell in
                            CellView(cell: cell)
                                .environmentObject(cells)
                                .id(index)
                        }
                    }
                    .onChange(of: scrollToIndex) { newIndex in
                        if let newIndex = newIndex {
                            withAnimation {
                                list.scrollTo(newIndex, anchor: .bottom)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .safeAreaInset(edge: .bottom) {
                    addCellButton
                        .padding(.horizontal, 10)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    header
                }
            }
            .toolbarBackground(backgroundColor, for: .navigationBar)
            .background(backgroundColor)
        }
    }
}

#Preview {
    ContentView()
}


