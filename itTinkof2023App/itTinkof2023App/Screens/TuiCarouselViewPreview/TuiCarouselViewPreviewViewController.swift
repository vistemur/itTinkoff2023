import UIKit

protocol TuiCarouselViewPreviewViewControllerInput {
}

class TuiCarouselViewPreviewViewController: UIViewController {
    
    // MARK: - properties

    var viewModel: TuiCarouselViewPreviewViewControllerOutput?
    
    // MARK: - UI properties
    
    private lazy var tuiCarouselView1: TuiCarouselView = {
        let tuiCarouselView = TuiCarouselView()
        let headerButtonAction: ((UIButton) -> Void) = { button in }
        let bottomButtonAction: ((UIButton) -> Void) = { button in }
        tuiCarouselView.setup(with: TuiCarouselViewData(header: "Header",
                                                        headerButton: "Button",
                                                        color: .white,
                                                        cards: [
                                                            TuiCarouselCellData(title: "title1", subtitle: "subtitle1"),
                                                            TuiCarouselCellData(title: "title2", subtitle: "subtitle2"),
                                                            TuiCarouselCellData(title: "title3", subtitle: "subtitle3"),
                                                        ],
                                                        bottomButtonTitle: "Button",
                                                        headerButtonAction: headerButtonAction,
                                                        bottomButtonAction: bottomButtonAction))
        return tuiCarouselView
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        setup()
        viewModel?.viewDidLoad()
        super.viewDidLoad()
    }
    
    // MARK: - setup
    private func setup() {
        setupView()
        setupTuiCarouselView1()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray
    }
    
    private func setupTuiCarouselView1() {
        view.addSubview(tuiCarouselView1)
        NSLayoutConstraint.activate([
            tuiCarouselView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tuiCarouselView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCarouselView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - TuiCarouselViewPreviewViewControllerInput
extension TuiCarouselViewPreviewViewController: TuiCarouselViewPreviewViewControllerInput {
}

// MARK: - Assemble
extension TuiCarouselViewPreviewViewController {
    
    static func assemble() -> UIViewController {
        let view = TuiCarouselViewPreviewViewController()
        let viewModel = TuiCarouselViewPreviewViewModel()
        let model = TuiCarouselViewPreviewModel(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
}
