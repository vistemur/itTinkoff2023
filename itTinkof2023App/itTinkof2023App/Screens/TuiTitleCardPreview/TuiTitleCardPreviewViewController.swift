import UIKit

protocol TuiTitleCardPreviewViewControllerInput {
}

class TuiTitleCardPreviewViewController: UIViewController {
    
    // MARK: - properties

    var viewModel: TuiTitleCardPreviewViewControllerOutput?
    
    // MARK: - UI properties
    
    private lazy var tuiTitleCard1: TuiTitleCard = {
        let tuiTitleCard = TuiTitleCard()
        tuiTitleCard.setup(with: TuiTitleCardData(title: "Title",
                                                  description: "Description",
                                                  color: .white,
                                                  closeButtonAction: nil))
        return tuiTitleCard
    }()
    
    private lazy var tuiTitleCard2: TuiTitleCard = {
        let tuiTitleCard = TuiTitleCard()
        let closeButtonAction: ((UIButton) -> Void) = { button in }
        tuiTitleCard.setup(with: TuiTitleCardData(title: "Title",
                                                  description: "Description",
                                                  color: .light,
                                                  closeButtonAction: closeButtonAction))
        return tuiTitleCard
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
        setupTuiTitleCard1()
        setupTuiTitleCard2()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray
    }
    
    private func setupTuiTitleCard1() {
        view.addSubview(tuiTitleCard1)
        NSLayoutConstraint.activate([
            tuiTitleCard1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tuiTitleCard1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiTitleCard1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTuiTitleCard2() {
        view.addSubview(tuiTitleCard2)
        NSLayoutConstraint.activate([
            tuiTitleCard2.topAnchor.constraint(equalTo: tuiTitleCard1.bottomAnchor, constant: 32),
            tuiTitleCard2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiTitleCard2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - TuiTitleCardPreviewViewControllerInput
extension TuiTitleCardPreviewViewController: TuiTitleCardPreviewViewControllerInput {
}

// MARK: - Assemble
extension TuiTitleCardPreviewViewController {
    
    static func assemble() -> UIViewController {
        let view = TuiTitleCardPreviewViewController()
        let viewModel = TuiTitleCardPreviewViewModel()
        let model = TuiTitleCardPreviewModel(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
}
