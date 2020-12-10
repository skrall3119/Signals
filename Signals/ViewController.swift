import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var modeField: UITextField!
    @IBOutlet weak var noteField: UITextField!
    
    @IBOutlet weak var tonic: UILabel!
    @IBOutlet weak var superTonic: UILabel!
    @IBOutlet weak var mediant: UILabel!
    @IBOutlet weak var subDominant: UILabel!
    @IBOutlet weak var Dominant: UILabel!
    @IBOutlet weak var subMediant: UILabel!
    @IBOutlet weak var leadingTone: UILabel!
    
    @IBOutlet weak var note1: UILabel!
    @IBOutlet weak var note2: UILabel!
    @IBOutlet weak var note3: UILabel!
    @IBOutlet weak var note4: UILabel!
    @IBOutlet weak var note5: UILabel!
    @IBOutlet weak var note6: UILabel!
    @IBOutlet weak var note7: UILabel!
    
    @IBOutlet weak var progression1: UILabel!
    @IBOutlet weak var progression2: UILabel!
    @IBOutlet weak var progression3: UILabel!
    @IBOutlet weak var progression4: UILabel!
    
    
    var scale: [String] = []
    
    let modePicker = UIPickerView()
    
    let modes = ["Ionian (Major)",
                 "Dorian",
                 "Phrygian",
                 "Lydian",
                 "Mixolydian",
                 "Aeolian (Minor)",
                 "Locrian"]
    
    var selectedMode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modePicker.delegate = self
        modeField.inputView = modePicker
        modeField.text = modes[0]
        modePicker.selectedRow(inComponent: 0)
        createToolbar()
        
        buildChordsAndScale()
    }
    
    @IBAction func generateButton(_ sender: Any) {
        buildChordsAndScale()
    }
    
    func buildChordsAndScale() {
        let chordViews = [tonic, superTonic, mediant, subDominant, Dominant, subMediant, leadingTone]
        let noteViews = [note1, note2, note3, note4, note5, note6, note7]
        let note = String(noteField.text!)
        let formula: [String] = ["W", "W", "H", "W", "W", "W", "H"]
        let suffix: [String] = ["", "m", "m", "", "", "m", "°"]
        
        
        let mode = modePicker.selectedRow(inComponent: 0)
        let newFormula = shift(array: formula, position: mode)
        let newSuffix = shift(array: suffix, position: mode)
        scale = buildScale(note: note, formula: newFormula)
        
        updateChords(scale: scale, suffix: newSuffix, textViews: chordViews as! [UILabel])
        updateNotes(scale: scale, textViews: noteViews as! [UILabel])
    }
    
    //Allows user to close pickerview via toolbar
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        modeField.inputAccessoryView = toolbar
    }
    
    //Hides keyboard when tapping the pickerview editText
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func generateProgression(_ sender: Any) {
        var progression = [String]()

        var isDifferent: Bool = false
        
        var max: Int
        var min: Int
        
        var numberOne = 0
        var numberTwo = 0
        var numberThree = 0
        
        switch modePicker.selectedRow(inComponent: 0) {
        case 5:
            max = 6
            min = 1
            
            while !isDifferent {
                if numberTwo == numberOne || numberTwo == numberThree || numberOne == numberThree {
                    numberOne = Int.random(in: min...max)
                    numberTwo = Int.random(in: min...max)
                    numberThree = Int.random(in: 4...5)
                } else {
                    isDifferent = true
                }
            }
            
            progression.append(scale[0] + "m")
            if numberOne == 3 || numberOne == 4 {
                progression.append(scale[numberOne] + "m")
            } else {
                progression.append(scale[numberOne])
            }
            if numberTwo == 3 || numberTwo == 4 {
                progression.append(scale[numberTwo] + "m")
            } else {
                progression.append(scale[numberTwo])
            }
            progression.append(scale[numberThree] + "m")
            break
            
        default:
            while !isDifferent {
                if numberTwo == numberOne || numberTwo == numberThree || numberOne == numberThree {
                    numberOne = Int.random(in: 1...5)
                    numberTwo = Int.random(in: 1...5)
                    numberThree = Int.random(in: 3...4)
                } else {
                    isDifferent = true
                }
            }
            
            progression.append(scale[0] + "m")
            if numberOne == 1 || numberOne == 2 || numberOne == 5 {
                progression.append(scale[numberOne] + "m")
            } else {
                progression.append(scale[numberOne])
            }
            if numberTwo == 1 || numberTwo == 2 || numberTwo == 5 {
                progression.append(scale[numberTwo] + "m")
            } else {
                progression.append(scale[numberTwo])
            }
            progression.append(scale[numberThree])
            break
        }
        
        progression1.text = progression[0]
        progression2.text = progression[1]
        progression3.text = progression[2]
        progression4.text = progression[3]
    }
}

//Sets up pickerView
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedMode = modes[row]
        modeField.text = selectedMode
        
    }
    
    
}
