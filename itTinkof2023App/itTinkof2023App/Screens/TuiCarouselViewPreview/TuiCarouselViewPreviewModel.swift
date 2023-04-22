import Foundation

protocol TuiCarouselViewPreviewModelInput {
}

class TuiCarouselViewPreviewModel {
    
    private let viewModel: TuiCarouselViewPreviewModelOutput
    
    init(viewModel: TuiCarouselViewPreviewModelOutput) {
        self.viewModel = viewModel
    }
}

// MARK: - TuiCarouselViewPreviewModelInput
extension TuiCarouselViewPreviewModel: TuiCarouselViewPreviewModelInput {
}
