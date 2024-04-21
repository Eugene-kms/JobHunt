import UIKit

class VacancyTableViewCell: UITableViewCell {
    var vacancyViewCell: ViewController = ViewController()
    
    var vacancies: [VacancyViewModel] = []
    
    
    func addActiveVacancies() {
        let activeVacancy = vacancyViewCell.provideActiveVacancy()
        vacancies.append(activeVacancy)
    }
}
