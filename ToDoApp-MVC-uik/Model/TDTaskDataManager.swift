//
//  TDTaskDataManager.swift
//  ToDoApp-MVC-uik
//
//  Created by Israel Aguilar on 8/17/24.
//

import Foundation

class TDTaskDataManager {
    
    private var tdTasks : [TDTask] = []
        
    var dataTasks = [
        TDTask(title: "Pasear al perro", description: "Sacar al perro al parque a las 13 horas", isCompleted: false),
        TDTask(title: "Comprar chocolates a mi novia", description: "Le gustan los ferrero de avellana", isCompleted: true),
        TDTask(title: "Cancelar Spotify Premium", description: "Cancelar antes del día 1 de marzo", isCompleted: false)
    
    ]
    
    func fetchTDTask(){
        tdTasks = dataTasks
    }
    
    func countTDTask() -> Int {
        return tdTasks.count
    }
    
    func getTDTask(at index: Int) -> TDTask {
        return tdTasks[index]
    }
    
    func updateTDTaskCompletion(index : Int) {
        tdTasks[index].isCompleted.toggle()
        print(tdTasks[index].title,tdTasks[index].isCompleted)
    }
}
