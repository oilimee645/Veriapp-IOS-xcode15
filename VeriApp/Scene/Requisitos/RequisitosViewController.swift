//
//  RequisitosViewController.swift
//  VeriApp
//
//  Created by Emilio on 11/08/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import ScrollStackController

protocol RequisitosDisplayLogic: AnyObject
{
 
}

class RequisitosViewController: VeriAppViewController, RequisitosDisplayLogic
{
    
 private var stackController = ScrollStackViewController()
    // MARK: Outlets
    
   
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
    var interactor: RequisitosBusinessLogic?
  var router: (NSObjectProtocol & RequisitosRoutingLogic & RequisitosDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = RequisitosInteractor()
    let presenter = RequisitosPresenter()
    let router = RequisitosRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
   
    
    Config()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func Config()
  {
    let request = Requisitos.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Requisitos.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
