import UIKit

class homeCollectionViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var sliderView: UISlider!
    
    @IBOutlet weak var uiView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/4, height: screenWidth/3.5)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        self.CollectionView.collectionViewLayout = layout
        self.CollectionView.register(UINib(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        

    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let height = CGFloat(sliderView.value)
        if(height >= 75){
            self.uiView.frame.size.height = 114
            self.uiView.frame.origin.y =  150
        }else if (height <= 75 && height >= 25){
            self.uiView.frame.size.height = 89
            self.uiView.frame.origin.y =  175
        }
        else {
            self.uiView.frame.size.height = 64
            self.uiView.frame.origin.y =  200
        }
        
    }
    
}

extension homeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        return cell
    }
    
}

open class CustomSlider : UISlider {
    @IBInspectable open var trackWidth:CGFloat = 2 {
        didSet {setNeedsDisplay()}
    }
    
    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
            width: defaultBounds.size.width,
            height: trackWidth
        )
    }
}

