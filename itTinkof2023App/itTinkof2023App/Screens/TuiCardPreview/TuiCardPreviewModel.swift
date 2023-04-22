import Foundation

protocol TuiCardPreviewModelInput {
}

class TuiCardPreviewModel {
    
    private let viewModel: TuiCardPreviewModelOutput
    
    init(viewModel: TuiCardPreviewModelOutput) {
        self.viewModel = viewModel
    }
}

// MARK: - TuiCardPreviewModelInput
extension TuiCardPreviewModel: TuiCardPreviewModelInput {
}
