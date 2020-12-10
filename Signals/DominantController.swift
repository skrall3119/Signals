import UIKit

class DominantController : UIViewController {
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var chord1: UILabel!
    @IBOutlet weak var chord2: UILabel!
    @IBOutlet weak var chord3: UILabel!
    @IBOutlet weak var chord4: UILabel!
    @IBOutlet weak var chord5: UILabel!
    @IBOutlet weak var chord6: UILabel!
    @IBOutlet weak var chord7: UILabel!
    
    @IBOutlet weak var dominant1: UILabel!
    @IBOutlet weak var dominant2: UILabel!
    @IBOutlet weak var dominant3: UILabel!
    @IBOutlet weak var dominant4: UILabel!
    @IBOutlet weak var dominant5: UILabel!
    @IBOutlet weak var dominant6: UILabel!
    @IBOutlet weak var dominant7: UILabel!
    
    let suffixes = ["", "m", "m", "", "", "m", "°"]
    let sevens = ["7", "7", "7", "7", "7", "7", "7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bases: [UILabel] = [chord1, chord2, chord3, chord4, chord5, chord6, chord7]
        let dominants: [UILabel] = [dominant1, dominant2, dominant3, dominant4, dominant5, dominant6, dominant7]
        
        note.text = "C"
        let input = note.text
        let scale = buildScale(note: input!, formula: formula)
        let doms = makeDominants(scale: scale)
        print(doms)
        updateChords(scale: scale, suffix: suffixes, textViews: bases)
        updateChords(scale: doms, suffix: sevens, textViews: dominants)
    }
    
    @IBAction func generateChords(_ sender: Any) {
        var input = note.text
        if input ==  nil{
            note.text = "C"
            input = "C"
        }
        
        let bases: [UILabel] = [chord1, chord2, chord3, chord4, chord5, chord6, chord7]
        let dominants: [UILabel] = [dominant1, dominant2, dominant3, dominant4, dominant5, dominant6, dominant7]
        
        let scale = buildScale(note: input!, formula: formula)
        let doms = makeDominants(scale: scale)
        updateChords(scale: scale, suffix: suffixes, textViews: bases)
        updateChords(scale: doms, suffix: sevens, textViews: dominants)
        
    }
    
}
