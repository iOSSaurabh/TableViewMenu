

import UIKit

class MenuItemCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDisplayName:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setData(data: MenuSubCategoryModel?){
        if let subCategory = data {
            self.lblName.text = subCategory.name
            self.lblDisplayName.text = subCategory.display_name
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
