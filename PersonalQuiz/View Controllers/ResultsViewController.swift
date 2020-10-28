import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        updateUI()
    }
}

// MARK: - Private Methods
extension ResultsViewController {
    private func updateUI() {
        let resultAnimal: AnimalType = findMostPopularAnimal()
        
        resultTitleLabel.text = "Вы - \(resultAnimal.rawValue)!"
        resultTextLabel.text = resultAnimal.definition
    }
    
    private func findMostPopularAnimal() -> AnimalType {
        var mostPopularAnimals: [AnimalType: Int] = [:]
        
        var animals: [AnimalType] = []
        for answer in answers {
            animals.append(answer.type)
        }
        
        for animal in animals {
            mostPopularAnimals[animal] = (mostPopularAnimals[animal] ?? 0) + 1
        }
        
        let sortedMostPopularAnimals = mostPopularAnimals.sorted { $0.value > $1.value }
        return sortedMostPopularAnimals.first!.key
    }
}
