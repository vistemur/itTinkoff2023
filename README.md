# Tinkoff tornament 2023 app

## Goal 🎯
make 5 customizable UI elements

## App tour ✈️

<div align="center">

  <div>Main menu</div>
    <img width="207" height="448" alt="main" src="https://github.com/user-attachments/assets/0bf215e8-5d41-4427-9490-066fe6d8dc6c" />
  </br></br></br>
  
  <div>Tui Card</div>
    <img width="207" height="448" alt="card" src="https://github.com/user-attachments/assets/666e9b43-4637-45fa-a39e-0e50572f5111" />
  </br></br></br>

  <div>Tui Title Card</div>
    <img width="207" height="448" alt="titleCard" src="https://github.com/user-attachments/assets/69f28153-66d8-45ca-bfc2-c63e81978117" />
  </br></br></br>

  <div>Tui Card Stack</div>
    <img width="207" height="448" alt="cardStack" src="https://github.com/user-attachments/assets/b4388ca2-78c5-43d7-a0f1-37dc88283b08" />
  </br></br></br>

  <div>Tui Carousel View</div>
    <img width="207" height="448" alt="CarouselView" src="https://github.com/user-attachments/assets/4cc4a288-47c2-4678-9962-1ae147510809" />
  </br></br></br>
  
</div>

## code example 🔨


```swift
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
```
