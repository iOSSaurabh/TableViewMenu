

import UIKit

protocol MenuHeaderTableViewCellDelegate {
    func didSelectMenuHeaderTableViewCell(section: Int, header: MenuHeaderCell)
}

class MenuHeaderCell: UITableViewCell {
    @IBOutlet weak var lblmenuName: UILabel!
    @IBOutlet weak var btnHeader: UIButton!
    var delegate : MenuHeaderTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    public func setData(name: String?){
        if let menu = name {
            self.lblmenuName.text = menu.capitalized
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func selectedHeader(sender: AnyObject) {
        delegate?.didSelectMenuHeaderTableViewCell(section: sender.tag, header: self)
        
    }
    
}
