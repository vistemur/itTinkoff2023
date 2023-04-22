import Foundation

protocol TuiCarouselViewPreviewViewControllerOutput {
    func viewDidLoad()
}

protocol TuiCarouselViewPreviewModelOutput {
}

class TuiCarouselViewPreviewViewModel {
    
    var model: TuiCarouselViewPreviewModelInput?
    weak var view: (TuiCarouselViewPreviewViewControllerInput & AnyObject)?
}

// MARK: - TuiCarouselViewPreviewViewControllerOutput
extension TuiCarouselViewPreviewViewModel: TuiCarouselViewPreviewViewControllerOutput {
    
    func viewDidLoad() {
    }
}

// MARK: - TuiCarouselViewPreviewModelOutput
extension TuiCarouselViewPreviewViewModel: TuiCarouselViewPreviewModelOutput {
}
