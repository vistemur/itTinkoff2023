import Foundation

protocol TuiCardPreviewViewControllerOutput {
    func viewDidLoad()
}

protocol TuiCardPreviewModelOutput {
}

class TuiCardPreviewViewModel {
    
    var model: TuiCardPreviewModelInput?
    weak var view: (TuiCardPreviewViewControllerInput & AnyObject)?
}

// MARK: - TuiCardPreviewViewControllerOutput
extension TuiCardPreviewViewModel: TuiCardPreviewViewControllerOutput {
    
    func viewDidLoad() {
    }
}

// MARK: - TuiCardPreviewModelOutput
extension TuiCardPreviewViewModel: TuiCardPreviewModelOutput {
}
