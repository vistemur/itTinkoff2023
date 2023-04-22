import UIKit

protocol TuiCardStackPreviewViewControllerInput {
}

class TuiCardStackPreviewViewController: UIViewController {
    
    // MARK: - properties

    var viewModel: TuiCardStackPreviewViewControllerOutput?

    // MARK: - UI properties
    
    private lazy var tuiCardStack1: TuiCardStack = {
        let tuiCardStack = TuiCardStack()
        let headerButtonAction: ((UIButton) -> Void) = { button in }
        let bottomButtonAction: ((UIButton) -> Void) = { button in }
        tuiCardStack.setup(with: TuiCardStackData(header: "Header",
                                                  headerButton: "Button",
                                                  color: .white,
                                                  cards: [
                                                    TuiCardStackData.Card(title: "Title1", description: "Description1"),
                                                    TuiCardStackData.Card(title: "Title2", description: "Description2"),
                                                    TuiCardStackData.Card(title: "Title3", description: "Description3")
                                                  ],
                                                  bottomButtonTitle: "Button",
                                                  headerButtonAction: headerButtonAction,
                                                  bottomButtonAction: bottomButtonAction))
        return tuiCardStack
    }()
    
    private lazy var tuiCardStack2: TuiCardStack = {
        let tuiCardStack = TuiCardStack()
        let headerButtonAction: ((UIButton) -> Void) = { button in }
        let bottomButtonAction: ((UIButton) -> Void) = { button in }
        tuiCardStack.setup(with: TuiCardStackData(header: "Header",
                                                  headerButton: "Button",
                                                  color: .light,
                                                  cards: [
                                                    TuiCardStackData.Card(title: "Title1", description: "Description1"),
                                                  ],
                                                  bottomButtonTitle: nil,
                                                  headerButtonAction: headerButtonAction,
                                                  bottomButtonAction: nil))
        return tuiCardStack
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
        setupTuiCardStack1()
        setupTuiCardStack2()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray
    }
    
    private func setupTuiCardStack1() {
        view.addSubview(tuiCardStack1)
        NSLayoutConstraint.activate([
            tuiCardStack1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tuiCardStack1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCardStack1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTuiCardStack2() {
        view.addSubview(tuiCardStack2)
        NSLayoutConstraint.activate([
            tuiCardStack2.topAnchor.constraint(equalTo: tuiCardStack1.bottomAnchor, constant: 32),
            tuiCardStack2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCardStack2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - TuiCardStackPreviewViewControllerInput
extension TuiCardStackPreviewViewController: TuiCardStackPreviewViewControllerInput {
}

// MARK: - Assemble
extension TuiCardStackPreviewViewController {
    
    static func assemble() -> UIViewController {
        let view = TuiCardStackPreviewViewController()
        let viewModel = TuiCardStackPreviewViewModel()
        let model = TuiCardStackPreviewModel(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
}
