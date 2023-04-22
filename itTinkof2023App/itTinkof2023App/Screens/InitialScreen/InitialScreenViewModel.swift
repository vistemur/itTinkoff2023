import UIKit

protocol InitialScreenViewControllerOutput {
    func viewDidLoad()
    func tuiCardButtonPressed()
    func tuiTitleCardButtonPressed()
    func tuiCardStackButtonPressed()
    func tuiCarouselViewButtonPressed()
}

protocol InitialScreenModelOutput {
}

class InitialScreenViewModel {
    
    var model: InitialScreenModelInput?
    weak var view: (InitialScreenViewControllerInput & UIViewController)?
}

// MARK: - InitialScreenViewControllerOutput
extension InitialScreenViewModel: InitialScreenViewControllerOutput {
    
    func viewDidLoad() {
    }
    
    func tuiCardButtonPressed() {
        view?.navigationController?.pushViewController(TuiCardPreviewViewController.assemble(), animated: true)
    }
    
    func tuiTitleCardButtonPressed() {
        view?.navigationController?.pushViewController(TuiTitleCardPreviewViewController.assemble(), animated: true)
    }
    
    func tuiCardStackButtonPressed() {
        view?.navigationController?.pushViewController(TuiCardStackPreviewViewController.assemble(), animated: true)
    }
    
    func tuiCarouselViewButtonPressed() {
        view?.navigationController?.pushViewController(TuiCarouselViewPreviewViewController.assemble(), animated: true)
    }
}

// MARK: - InitialScreenModelOutput
extension InitialScreenViewModel: InitialScreenModelOutput {
}
