//
//  ViewController.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:-IBOutlets
    @IBOutlet weak var tableViewRecipe:UITableView?
    @IBOutlet weak var searchBarRecipe:UISearchBar?
    @IBOutlet weak var lableNoRecipe:UILabel?
    
    var recipes:[Recipe] = []
    let identifierRecipetableCell = "RecipeTableViewCell"
    var currentPage = 1
    

    
    //MARK:-Life Cycle Method Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewRecipe?.isHidden = true
        lableNoRecipe?.isHidden = false
        lableNoRecipe?.text = Label_No_Recipe_Text
        registerCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCell(){
        tableViewRecipe?.register(UINib(nibName:identifierRecipetableCell, bundle:nil), forCellReuseIdentifier: identifierRecipetableCell)
    }
    
    func getRecipeWith(_ recipeStr:String){
        if Reachability.isConnectedToNetwork(){
            APIWrapper.getSearchData(param: ["i":recipeStr ,"q":"","p":currentPage ], callBack: { (response) in
                DispatchQueue.main.async {
                    if let res:AnyObject  = response {
                        let array = res as? [Recipe]
                        
                        self.recipes = array!
                        self.searchBarRecipe?.resignFirstResponder()
                        self.tableViewRecipe?.isHidden = !((array?.count)! > 0)
                        self.lableNoRecipe?.isHidden = (array?.count)! > 0
                        self.tableViewRecipe?.reloadData()
                        
                        if (array?.count)! > 0 {
                        
                        }else{
                            
                        self.view.makeToast(message: k_No_Recipe_Error, duration: 3.0, position: HRToastPositionTop as AnyObject)
                        }
                        
                        
                        
                        
                    }else{
                       self.view.makeToast(message: k_No_Recipe_Error, duration: 3.0, position: HRToastPositionTop as AnyObject)
                    }
                }
            })
            
        }else{
            self.view.makeToast(message: k_No_Network_Error, duration: 3.0, position: HRToastPositionTop as AnyObject)
        }
    }


}
// MARK:- TableView DataSource Method
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierRecipetableCell) as? RecipeTableViewCell
        cell?.setRecipeData(recipe: recipes[indexPath.row])
        return cell!
    }
}

// MARK:- SearchBar Delegate Method
extension ViewController:UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
       searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let completeStr = searchBar.text!+text
        
        
        
        if completeStr.characters.count > 3 {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(getRecipeWith(_:)), object: completeStr)
            self.perform(#selector(getRecipeWith(_:)), with: completeStr, afterDelay: 1.0)
            
        }else{
            tableViewRecipe?.isHidden = true
            lableNoRecipe?.isHidden = false
        }
        
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableViewRecipe?.isHidden = true
        lableNoRecipe?.isHidden = false
    }
    
}

