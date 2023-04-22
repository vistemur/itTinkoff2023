import Foundation

protocol TuiCardStackPreviewModelInput {
}

class TuiCardStackPreviewModel {
    
    private let viewModel: TuiCardStackPreviewModelOutput
    
    init(viewModel: TuiCardStackPreviewModelOutput) {
        self.viewModel = viewModel
    }
}

// MARK: - TuiCardStackPreviewModelInput
extension TuiCardStackPreviewModel: TuiCardStackPreviewModelInput {
}
