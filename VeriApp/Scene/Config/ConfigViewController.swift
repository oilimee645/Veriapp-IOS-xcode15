//
//  ConfigViewController.swift
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

protocol ConfigDisplayLogic: AnyObject
{
  func displaySomething(viewModel: Config.Something.ViewModel)
}

class ConfigViewController: VeriAppViewController, ConfigDisplayLogic
{
  // MARK: Outlets
    
  @IBOutlet weak var Vstack: UIStackView!
  @IBOutlet weak var LblEstadoAlarma: UILabel!
    @IBOutlet weak var mes1: UILabel!
    @IBOutlet weak var mes2: UILabel!
    @IBOutlet weak var mes3: UILabel!
    @IBOutlet weak var mes4: UILabel!
    @IBOutlet weak var mes5: UILabel!
    
    @IBOutlet weak var s1: UISwitch!
    @IBOutlet weak var s2: UISwitch!
    @IBOutlet weak var s3: UISwitch!
    @IBOutlet weak var s4: UISwitch!
    @IBOutlet weak var s5: UISwitch!
    
    
    var interactor: ConfigBusinessLogic?
  var router: (NSObjectProtocol & ConfigRoutingLogic & ConfigDataPassing)?

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
    let interactor = ConfigInteractor()
    let presenter = ConfigPresenter()
    let router = ConfigRouter()
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
    configure()
  }
  
    func configure() {
        
        //Constrains for differents models
        let screenSize: CGRect = UIScreen.main.bounds
        
        if Int(screenSize.height) <= Constants.DevicesHeight.eight {
        self.Vstack.spacing = 14
        }else if Int(screenSize.height) >= Constants.DevicesHeight.TwelveProMax{
            self.Vstack.spacing = 44
            self.LblEstadoAlarma.text = "Estado    de alarma"
            
        }
        
        
        
        //add action to switches
        self.s1.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        self.s2.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        self.s3.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        self.s4.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        self.s5.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
    }
 
    @objc func switchChanged(Switch: UISwitch)  {
       let switchTag = "s\(Switch.tag)"
       UserDefaultsManager.saveUserDefaults(value: Switch.isOn, key: enumUDKeys(rawValue: switchTag)!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // reneber los demas
        rememberSwitchSelection()
        //seleccion del main
        rememberSwitchSelectionFromMain()
        //setear notificaciones
    }
  
    func rememberSwitchSelection(){
        
        
        
        
        let rS1 = UserDefaultsManager.getUserDefaultsBool(.s1)
        if rS1 == true{
            self.s1.isOn = true
        }else{self.s1.isOn = false}
        let rS2 = UserDefaultsManager.getUserDefaultsBool(.s2)
        if rS2 == true{
            self.s2.isOn = true
        }else{self.s2.isOn = false}
        let rS3 = UserDefaultsManager.getUserDefaultsBool(.s3)
        if rS3 == true{
            self.s3.isOn = true
        }else{self.s3.isOn = false}
        let rS4 = UserDefaultsManager.getUserDefaultsBool(.s4)
        if rS4 == true{
            self.s4.isOn = true
        }else{self.s4.isOn = false}
        let rS5 = UserDefaultsManager.getUserDefaultsBool(.s5)
        if rS5 == true{
            self.s5.isOn = true
        }else{self.s5.isOn = false}

    }
    
    func rememberSwitchSelectionFromMain(){
        let placaR = UserDefaultsManager.getUserDefaultsArray(.numeroPlacaUserDefault)
        let placa = placaR![0] as! String
                                            if placa == "5" || placa == "6" {
                                                self.s1.isOn = true
                                            }
                                            if placa == "7" || placa == "8" {
                                                self.s2.isOn = true
                                            }
                                            if placa == "3" || placa == "4" {
                                                self.s3.isOn = true
                                            }
                                            if placa == "1" || placa == "2" {
                                                self.s4.isOn = true
                                            }
                                            if placa == "0" || placa == "9" {
                                                self.s5.isOn = true
                                            }
    }
    
    
  func displaySomething(viewModel: Config.Something.ViewModel)
  {
    
    
    
  }
}
