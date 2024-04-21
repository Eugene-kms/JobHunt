import UIKit

struct VacancyViewModel {
    let title: String
    let company: String
    let imageName: String
    let category: String
    
    init(title: String, company: String, imageName: String, category: String) {
        self.title = title
        self.company = company
        self.imageName = imageName
        self.category = category
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let vacancyCategories: [String]  = ["Active", "Ejected"]
    var activeVacancies: [VacancyViewModel] = []
    var ejectedVacancies: [VacancyViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeVacancies = provideActiveVacancy()
        ejectedVacancies = provideEjectedVacancy()
        
        
        configureTableView()
        configureSegmentedControl()
    }
    
    
    func configureSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        for (index, item) in vacancyCategories.enumerated() {
            segmentedControl.insertSegment(withTitle: item, at: index, animated: false)
        }
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func configureTableView() {
        
    }
    
    func provideActiveVacancy() -> [VacancyViewModel] {
        var activeVacancies: [VacancyViewModel] = []
        let activeCategory = "Active"
        
        activeVacancies.append(VacancyViewModel(
            title: "UX Research",
            company: "Google LLC",
            imageName: "Google",
            category: activeCategory))
        
        activeVacancies.append(VacancyViewModel(
            title: "Interaction Designer",
            company: "Microsoft Corporation",
            imageName: "Microsoft",
            category: activeCategory))
        
        activeVacancies.append(VacancyViewModel(
            title: "Product Designer",
            company: "Adobe Inc.",
            imageName: "Adobe",
            category: activeCategory))
        
        return activeVacancies
    }
    
    func provideEjectedVacancy() -> [VacancyViewModel] {
        
        var ejectedVacancies: [VacancyViewModel] = []
        let ejectedCategory = "Ejected"
        
        ejectedVacancies.append(VacancyViewModel(
            title: "Design Manager",
            company: "Tesla, Inc.",
            imageName: "Tesla",
            category: ejectedCategory))
        
        ejectedVacancies.append(VacancyViewModel(
            title: "Product Designer",
            company: "Salesforce.com, Inc.",
            imageName: "Salesforce",
            category: ejectedCategory))
        
        return ejectedVacancies
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeVacancies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyTableViewCell", for: indexPath)
        
        return cell
    }
}
