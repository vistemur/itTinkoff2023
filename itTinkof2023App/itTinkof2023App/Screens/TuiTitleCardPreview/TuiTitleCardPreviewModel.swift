import Foundation

protocol TuiTitleCardPreviewModelInput {
}

class TuiTitleCardPreviewModel {
    
    private let viewModel: TuiTitleCardPreviewModelOutput
    
    init(viewModel: TuiTitleCardPreviewModelOutput) {
        self.viewModel = viewModel
    }
}

// MARK: - TuiTitleCardPreviewModelInput
extension TuiTitleCardPreviewModel: TuiTitleCardPreviewModelInput {
}
