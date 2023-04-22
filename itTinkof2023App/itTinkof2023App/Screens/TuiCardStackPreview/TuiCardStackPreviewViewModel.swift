import Foundation

protocol TuiCardStackPreviewViewControllerOutput {
    func viewDidLoad()
}

protocol TuiCardStackPreviewModelOutput {
}

class TuiCardStackPreviewViewModel {
    
    var model: TuiCardStackPreviewModelInput?
    weak var view: (TuiCardStackPreviewViewControllerInput & AnyObject)?
}

// MARK: - TuiCardStackPreviewViewControllerOutput
extension TuiCardStackPreviewViewModel: TuiCardStackPreviewViewControllerOutput {
    
    func viewDidLoad() {
    }
}

// MARK: - TuiCardStackPreviewModelOutput
extension TuiCardStackPreviewViewModel: TuiCardStackPreviewModelOutput {
}
