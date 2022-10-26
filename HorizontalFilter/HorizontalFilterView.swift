//
//  HorizontalFilterView.swift
//  HorizontalFilter
//
//  Created by Jonathon Albert on 27/09/2022.
//

import SwiftUI

enum FilterCategory: String, CaseIterable {
    case Recommendations, Features, Tacos, Burgers, Pizza
}

struct HorizontalFilterItemViewModel: Hashable {
    let filterCategory: FilterCategory
    let font: Font
    let underlineColor: Color

    var title: String {
        filterCategory.rawValue
    }
}

extension HorizontalFilterItemViewModel {

    static func standard(category: FilterCategory) -> HorizontalFilterItemViewModel {
        return HorizontalFilterItemViewModel(filterCategory: category,
                                             font: .system(size: 12.0).weight(.medium),
                                             underlineColor: .orange)
    }
}

struct HorizontalFilterItem: View {

    var viewModel: HorizontalFilterItemViewModel

    @Binding var selectedFilter: FilterCategory

    var body: some View {
//        ZStack {
            VStack(spacing: 0.0) {
                Text(viewModel.title)
                    .lineLimit(1)
                    .font(viewModel.font)
                    .padding(.horizontal, 30)
                    .foregroundColor(selectedFilter == viewModel.filterCategory ? .black : .gray)
                if selectedFilter == viewModel.filterCategory {
                    Rectangle()
                        .frame(height: 2.0)
                        .foregroundColor(viewModel.underlineColor)
                }
            }
            .frame(height: 28.0)
//        }
    }
}

struct HorizontalFilterViewModel {

    private var items: [FilterCategory]

    init(items: [FilterCategory]) {
        self.items = items
    }

    var filters: [HorizontalFilterItemViewModel] {
        return items.map { HorizontalFilterItemViewModel.standard(category: $0) }
    }
}

struct HorizontalFilterView: View {

    var viewModel: HorizontalFilterViewModel
    @Binding var selectedItem: FilterCategory

    var body: some View {
//        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(viewModel.filters, id: \.self) { viewModel in
                        HorizontalFilterItem(viewModel: viewModel,
                                             selectedFilter: $selectedItem)
//                            .frame(width: geo.size.width / min(CGFloat(viewModel.items.count), 3.3))
                            .onTapGesture {
                                selectedItem = viewModel.filterCategory
                            }
                    }
                }
            }
//            .border(.red, width: 2.0)
//            .frame(minWidth: geo.size.width)
//        }
    }
}

struct AnimatedHorizontalHeader_Previews: PreviewProvider {

    static let sections = FilterCategory.allCases

    static var previews: some View {
        HorizontalFilterView(viewModel: HorizontalFilterViewModel(items: sections), selectedItem: .constant(.Features))
    }
}
