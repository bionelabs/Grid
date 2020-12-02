# Grid
Make views easy by Autolayout Swift from UIKit

## Code

```swift
class ViewController: UIViewController {
    
    let _view: Grid = Grid(
        .interitemSpacing(0),
        .lineSpacing(0),
        .sectionInset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)),
        View(
            .view(Header(text: "HEADER"), 50)
        ),
        Group(tracks: 3,
              .view(Label(text: "1"), 150),
              .view(Label(text: "2"), 50),
              .view(Label(text: "3"), 150),
              .view(Label(text: "4"), 50),
              .view(Label(text: "5"), 50)
        ),
        Group(tracks: 4,
              .square(Label(text: "75")),
              .square(Label(text: "75")),
              .square(Label(text: "75")),
              .square(Label(text: "75"))
        ),
        View(
            .view(Header(text: "HEADER"), 50)
        ),
        Group(tracks: 4,
              .square(Label(text: "75")),
              .view(Label(text: "2"), 50),
              .square(Label(text: "75")),
              .view(Label(text: "2"), 50)
        )
    )
    
    override func loadView() {
        super.loadView()
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



```


## Demo
<img sizes="(max-width: 420px) 100vw, 600px" src="https://github.com/onebuffer/Grid/blob/main/Resources/Screen%20Shot%202020-12-02%20at%202.46.24%20PM.png?raw=true"></img>

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/

