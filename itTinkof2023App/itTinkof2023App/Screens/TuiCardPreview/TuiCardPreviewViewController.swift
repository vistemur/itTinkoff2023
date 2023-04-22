import UIKit

protocol TuiCardPreviewViewControllerInput {
}

class TuiCardPreviewViewController: UIViewController {
    
    // MARK: - properties

    var viewModel: TuiCardPreviewViewControllerOutput?
    
    // MARK: - UI properties
    
    private lazy var tuiCard1: TuiCard = {
        let tuiCard = TuiCard()
        let buttonAction: ((UIButton) -> Void) = { button in
            
        }
        tuiCard.setup(with: TuiCardData(header: "Header",
                                        subheader: nil,
                                        imagePositoin: .right,
                                        color: .white,
                                        buttonTitle: nil,
                                        buttonAction: nil))
        return tuiCard
    }()
    
    private lazy var tuiCard2: TuiCard = {
        let tuiCard = TuiCard()
        tuiCard.setup(with: TuiCardData(header: "Header",
                                        subheader: "Subheader",
                                        imagePositoin: .right,
                                        color: .white,
                                        buttonTitle: nil,
                                        buttonAction: nil))
        return tuiCard
    }()
    
    private lazy var tuiCard3: TuiCard = {
        let tuiCard = TuiCard()
        let buttonAction: ((UIButton) -> Void) = { button in }
        tuiCard.setup(with: TuiCardData(header: "Header",
                                        subheader: nil,
                                        imagePositoin: .right,
                                        color: .light,
                                        buttonTitle: "Button3",
                                        buttonAction: buttonAction))
        return tuiCard
    }()
    
    private lazy var tuiCard4: TuiCard = {
        let tuiCard = TuiCard()
        let buttonAction: ((UIButton) -> Void) = { button in }
        tuiCard.setup(with: TuiCardData(header: "Header",
                                        subheader: "Subheader",
                                        imagePositoin: .right,
                                        color: .light,
                                        buttonTitle: "Button4",
                                        buttonAction: buttonAction))
        return tuiCard
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
        setupTuiCard1()
        setupTuiCard2()
        setupTuiCard3()
        setupTuiCard4()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray
    }
    
    private func setupTuiCard1() {
        view.addSubview(tuiCard1)
        NSLayoutConstraint.activate([
            tuiCard1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tuiCard1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCard1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTuiCard2() {
        view.addSubview(tuiCard2)
        NSLayoutConstraint.activate([
            tuiCard2.topAnchor.constraint(equalTo: tuiCard1.bottomAnchor, constant: 32),
            tuiCard2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCard2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTuiCard3() {
        view.addSubview(tuiCard3)
        NSLayoutConstraint.activate([
            tuiCard3.topAnchor.constraint(equalTo: tuiCard2.bottomAnchor, constant: 32),
            tuiCard3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCard3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTuiCard4() {
        view.addSubview(tuiCard4)
        NSLayoutConstraint.activate([
            tuiCard4.topAnchor.constraint(equalTo: tuiCard3.bottomAnchor, constant: 32),
            tuiCard4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCard4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - TuiCardPreviewViewControllerInput
extension TuiCardPreviewViewController: TuiCardPreviewViewControllerInput {
}

// MARK: - Assemble
extension TuiCardPreviewViewController {
    
    static func assemble() -> UIViewController {
        let view = TuiCardPreviewViewController()
        let viewModel = TuiCardPreviewViewModel()
        let model = TuiCardPreviewModel(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
}
