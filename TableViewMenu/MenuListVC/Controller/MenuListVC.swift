

import UIKit

class MenuListVC: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    private let viewModel = MenuListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.menuTableView.estimatedRowHeight = 50
        self.menuTableView.rowHeight = UITableView.automaticDimension
        self.menuTableView.tableFooterView = UIView.init(frame: .zero)
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
        self.menuListRequest()
    }
    
    //MARK:- Api call
    private func menuListRequest() {
        self.viewModel.getMenuList( onCompletion: { (responseType, data) in
            if data == nil {
                //Show Error
                self.showAlert(withMessage: Messages.networkError)
            }
            else
            {
                if responseType == ResponseType.kResponseTypeFail{
                    //Show Error
                    self.showAlert(withMessage: Messages.networkError)
                } else {
                    if self.viewModel.menuList.count == 0 {
                        //Show error ---menu list is empty
                        self.showAlert(withMessage: Messages.menuNotFount)
                    }
                    else
                    {
                        print_debug(object: "menu item count--------\(self.viewModel.menuList))")
                        //Menu Data found and reload data
                        self.menuTableView.reloadData()
                    }
                }
            }
            
        })
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

/// TableView DataSource and Delegate
extension MenuListVC: UITableViewDelegate, UITableViewDataSource, MenuHeaderTableViewCellDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.menuList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.menuList[section].selectedIndex == 1{
            return self.viewModel.menuList[section].sub_category?.count ?? 0
        }else{
            return 0
        }
            
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.menuTableView.dequeueReusableCell(withIdentifier: String(describing: MenuHeaderCell.self)) as? MenuHeaderCell
        header?.delegate = self
        header?.btnHeader.tag = section
        let model = self.viewModel.menuList[section]
        header?.setData(name: model.name)
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.menuTableView.dequeueReusableCell(withIdentifier: String(describing: MenuItemCell.self), for: indexPath) as? MenuItemCell {
            let model = self.viewModel.menuList[indexPath.section].sub_category
            cell.setData(data: model?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    //Header Delegate
    func didSelectMenuHeaderTableViewCell(section: Int, header: MenuHeaderCell) {
        print_debug(object: "Cell Selected!")
        if self.viewModel.menuList[section].selectedIndex == 1{
            self.viewModel.menuList[section].selectedIndex = 0
        }else{
            self.viewModel.menuList[section].selectedIndex = 1
        }
                
        self.menuTableView.reloadData()
    }
    
}

