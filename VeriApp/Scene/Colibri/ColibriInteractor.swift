//
//  ColibriInteractor.swift
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

protocol ColibriBusinessLogic
{
func readLocalFile(forName name: String) -> Data?
func parse(jsonData: Data)
func parseFiltered(jsonData: Data,filtro: String)
}

protocol ColibriDataStore
{
    var tableData: ColibriModel.Verificentros? { get set }
}

class ColibriInteractor: ColibriBusinessLogic, ColibriDataStore
{
  var tableData: ColibriModel.Verificentros?
  var presenter: ColibriPresentationLogic?
  var worker: ColibriWorker?
  //var name: String = ""
  
  // MARK: Do something
  
     func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
     func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(ColibriModel.Verificentros.self,
                                                       from: jsonData)
        /*    let index = 0
            print("ID: ", decodedData.Table![index].Id!)
            print("Nombre: ", decodedData.Table![index].Nombre!)
            print("Tipo: ", decodedData.Table![index].Tipo!)
            print("Especialidad: ", decodedData.Table![index].Especialidad!)
            print("===================================")
            print(decodedData)*/
            self.tableData = decodedData
            self.presenter?.presentTableData(data: self.tableData)
        } catch {
            print("decode error")
        }
    }
    
    func parseFiltered(jsonData: Data, filtro: String = "Verificentro") {
       do {
           let decodedData = try JSONDecoder().decode(ColibriModel.Verificentros.self,
                                                      from: jsonData)
           self.tableData = decodedData
           if filtro == "Verificentro" || filtro == "Taller"{
           let filtroSucursal = self.tableData?.Table!.filter{ $0.Tipo == filtro}
           self.tableData?.Table = filtroSucursal
           }else{
               let filtroSucursal = self.tableData?.Table!.filter{ $0.Localidad == filtro}
               self.tableData?.Table = filtroSucursal
           }
           
           self.presenter?.presentTableData(data: self.tableData)
       } catch {
           print("decode error")
       }
   }
}
