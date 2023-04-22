import UIKit
protocol InitialScreenViewControllerInput {
}

class InitialScreenViewController: UIViewController {
    
    // MARK: - properties

    var viewModel: InitialScreenViewControllerOutput?
    
    // MARK: - UI properties
    
    private lazy var tuiCardButton: TuiButton = {
        let button = TuiButton()
        button.setTitle("TuiCard", for: .normal)
        button.addTarget(self, action: #selector(tuiCardButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var tuiTitleCardButton: TuiButton = {
        let button = TuiButton()
        button.setTitle("tuiTitleCard", for: .normal)
        button.addTarget(self, action: #selector(tuiTitleCardButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var tuiCardStackButton: TuiButton = {
        let button = TuiButton()
        button.setTitle("tuiCardStack", for: .normal)
        button.addTarget(self, action: #selector(tuiCardStackButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var tuiCarouselViewButton: TuiButton = {
        let button = TuiButton()
        button.setTitle("tuiCarouselView", for: .normal)
        button.addTarget(self, action: #selector(tuiCarouselViewButtonPressed), for: .touchUpInside)
        return button
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
        setupTuiButton()
        setupTuiTitleButton()
        setupTuiCardStackButton()
        setupTuiCarouselViewButton()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupTuiButton() {
        view.addSubview(tuiCardButton)
        NSLayoutConstraint.activate([
            tuiCardButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tuiCardButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCardButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tuiCardButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setupTuiTitleButton() {
        view.addSubview(tuiTitleCardButton)
        NSLayoutConstraint.activate([
            tuiTitleCardButton.topAnchor.constraint(equalTo: tuiCardButton.bottomAnchor, constant: 32),
            tuiTitleCardButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiTitleCardButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tuiTitleCardButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setupTuiCardStackButton() {
        view.addSubview(tuiCardStackButton)
        NSLayoutConstraint.activate([
            tuiCardStackButton.topAnchor.constraint(equalTo: tuiTitleCardButton.bottomAnchor, constant: 32),
            tuiCardStackButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCardStackButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tuiCardStackButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setupTuiCarouselViewButton() {
        view.addSubview(tuiCarouselViewButton)
        NSLayoutConstraint.activate([
            tuiCarouselViewButton.topAnchor.constraint(equalTo: tuiCardStackButton.bottomAnchor, constant: 32),
            tuiCarouselViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tuiCarouselViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tuiCarouselViewButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // MARK: - actions
    
    @objc private func tuiCardButtonPressed() {
        viewModel?.tuiCardButtonPressed()
    }
    
    @objc private func tuiTitleCardButtonPressed() {
        viewModel?.tuiTitleCardButtonPressed()
    }
    
    @objc private func tuiCardStackButtonPressed() {
        viewModel?.tuiCardStackButtonPressed()
    }
    
    @objc private func tuiCarouselViewButtonPressed() {
        viewModel?.tuiCarouselViewButtonPressed()
    }
}

// MARK: - InitialScreenViewControllerInput
extension InitialScreenViewController: InitialScreenViewControllerInput {
}

// MARK: - Assemble
extension InitialScreenViewController {
    
    static func assemble() -> UIViewController {
        let view = InitialScreenViewController()
        let viewModel = InitialScreenViewModel()
        let model = InitialScreenModel(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.model = model
        return view
    }
}
