import UIKit

class BorrowedController: UIViewController {
    
    @IBOutlet weak var borrowedNote: UITextField!
    
    @IBOutlet weak var major1: UILabel!
    @IBOutlet weak var major2: UILabel!
    @IBOutlet weak var major3: UILabel!
    @IBOutlet weak var major4: UILabel!
    @IBOutlet weak var major5: UILabel!
    @IBOutlet weak var major6: UILabel!
    @IBOutlet weak var major7: UILabel!
    
    @IBOutlet weak var dorian1: UILabel!
    @IBOutlet weak var dorian2: UILabel!
    @IBOutlet weak var dorian3: UILabel!
    @IBOutlet weak var dorian4: UILabel!
    @IBOutlet weak var dorian5: UILabel!
    @IBOutlet weak var dorian6: UILabel!
    @IBOutlet weak var dorian7: UILabel!
    
    @IBOutlet weak var phrygian1: UILabel!
    @IBOutlet weak var phrygian2: UILabel!
    @IBOutlet weak var phrygian3: UILabel!
    @IBOutlet weak var phrygian4: UILabel!
    @IBOutlet weak var phrygian5: UILabel!
    @IBOutlet weak var phrygian6: UILabel!
    @IBOutlet weak var phrygian7: UILabel!
    
    @IBOutlet weak var lydian1: UILabel!
    @IBOutlet weak var lydian2: UILabel!
    @IBOutlet weak var lydian3: UILabel!
    @IBOutlet weak var lydian4: UILabel!
    @IBOutlet weak var lydian5: UILabel!
    @IBOutlet weak var lydian6: UILabel!
    @IBOutlet weak var lydian7: UILabel!
    
    @IBOutlet weak var mixo1: UILabel!
    @IBOutlet weak var mixo2: UILabel!
    @IBOutlet weak var mixo3: UILabel!
    @IBOutlet weak var mixo4: UILabel!
    @IBOutlet weak var mixo5: UILabel!
    @IBOutlet weak var mixo6: UILabel!
    @IBOutlet weak var mixo7: UILabel!
    
    @IBOutlet weak var minor1: UILabel!
    @IBOutlet weak var minor2: UILabel!
    @IBOutlet weak var minor3: UILabel!
    @IBOutlet weak var minor4: UILabel!
    @IBOutlet weak var minor5: UILabel!
    @IBOutlet weak var minor6: UILabel!
    @IBOutlet weak var minor7: UILabel!
    
    @IBOutlet weak var locrian1: UILabel!
    @IBOutlet weak var locrian2: UILabel!
    @IBOutlet weak var locrian3: UILabel!
    @IBOutlet weak var locrian4: UILabel!
    @IBOutlet weak var locrian5: UILabel!
    @IBOutlet weak var locrian6: UILabel!
    @IBOutlet weak var locrian7: UILabel!
    
    var root: String?
    var modes: [[UILabel?]] = []
    var suffix: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let majors = [major1, major2, major3, major4, major5, major6, major7]
        let dorians = [dorian1, dorian2, dorian3, dorian4, dorian5, dorian6, dorian7]
        let phrygians = [phrygian1, phrygian2, phrygian3, phrygian4, phrygian5, phrygian6, phrygian7]
        let lydians = [lydian1, lydian2, lydian3, lydian4, lydian5, lydian6, lydian7]
        let mixos = [mixo1, mixo2, mixo3, mixo4, mixo5, mixo6, mixo7]
        let minors = [minor1, minor2, minor3, minor4, minor5, minor6, minor7]
        let locrians = [locrian1, locrian2, locrian3, locrian4, locrian5, locrian6, locrian7]
        
        modes = [majors, dorians, phrygians, lydians, mixos, minors, locrians]
        suffix = ["", "m", "m", "", "", "m", "°"]
    
        
        updateView(note: "C", modes: modes)
        
    }
    
    func updateView(note: String, modes: [[UILabel?]]) {
        for value in 0...6{
            var suffix: [String] = ["", "m", "m", "", "", "m", "°"]
            var formula: [String] = ["W", "W", "H", "W", "W", "W", "H"]

            formula = shift(array: formula, position: value)
            suffix = shift(array: suffix, position: value)
            let scale = buildScale(note: note, formula: formula)
            updateChords(scale: scale, suffix: suffix, textViews: modes[value] as! [UILabel])
        }
    }
    
    @IBAction func generateButton(_ sender: Any) {
        root = borrowedNote.text ?? "C"
        updateView(note: root ?? "C", modes: modes)
        
    }
}
