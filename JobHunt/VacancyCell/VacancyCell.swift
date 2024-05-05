import UIKit

class VacancyCell: UITableViewCell {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var jobTitleLable: UILabel!
    @IBOutlet weak var companyNameLable: UILabel!
    
    func configure(with vacancyData: VacancyData) {
        logoImageView.image = UIImage(named: vacancyData.image)
        jobTitleLable.text = vacancyData.title
        companyNameLable.text = vacancyData.company
    }
    
    private func cornerRadiusCell() {
        
        
        
    }
}


