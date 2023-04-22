import Foundation

protocol TuiTitleCardPreviewViewControllerOutput {
    func viewDidLoad()
}

protocol TuiTitleCardPreviewModelOutput {
}

class TuiTitleCardPreviewViewModel {
    
    var model: TuiTitleCardPreviewModelInput?
    weak var view: (TuiTitleCardPreviewViewControllerInput & AnyObject)?
}

// MARK: - TuiTitleCardPreviewViewControllerOutput
extension TuiTitleCardPreviewViewModel: TuiTitleCardPreviewViewControllerOutput {
    
    func viewDidLoad() {
    }
}

// MARK: - TuiTitleCardPreviewModelOutput
extension TuiTitleCardPreviewViewModel: TuiTitleCardPreviewModelOutput {
}
