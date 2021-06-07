//
//  DBHelper.swift
//  RealmTest
//
//  Created by Peadar Conaghan on 07/05/2021.
//

import Foundation
import RealmSwift
import Realm

class DBHelper {
    
    static let shared = DBHelper()
    private init(){}
    let realm = try! Realm()
    
    
//     func viewDidLoad() {
//
//       print(Realm.Configuration.defaultConfiguration.fileURL!)
//    }
    
    
    
    //MARK:- getMuscles
    func getMusclesCount()-> Int {
        let storedExercise = realm.objects(StoredExercise5.self)
        return storedExercise.count
    }
    
    //MARK:- getAllMuscelsNames
//    func getAllMusclesNames()-> [String] {
//        var musclesName = [String]() //*******
//        let storedExercise = realm.objects(StoredExercise.self).filter("muscle == 'chest'")
//        for exercise in storedExercise {
//            print("Muscle = \(exercise.muscle)")
//            musclesName.append(exercise.name)
//        }
//        return musclesName
//    }
    
    func getChest()-> [Exercise] {
      var excercises = [Exercise]()
        let storedExercise = realm.objects(StoredExercise5.self).filter("muscle == 'chest'")
        for exercise in storedExercise {
    //        print("Muscle = \(exercise.muscle)")
            var exc = Exercise(name: "", information: "")
            exc.name = exercise.name
            exc.information = exercise.information
            excercises.append(exc)
        }
        return excercises
    }
    
    func getBiceps()-> [Exercise] {
        var excercises = [Exercise]()
        let storedExercise = realm.objects(StoredExercise5.self).filter("muscle == 'bicep'")
        for exercise in storedExercise {
    //        print("Muscle = \(exercise.muscle)")
            var exc = Exercise(name: "", information: "")
//            musclesName.append(exercise.name)
            exc.name = exercise.name
            exc.information = exercise.information
            excercises.append(exc)
        }
        return excercises
    }
    
    func getTriceps()-> [Exercise] {
        var excercises = [Exercise]()
        let storedExercise = realm.objects(StoredExercise5.self).filter("muscle == 'tricep'")
        for exercise in storedExercise {
     //       print("Muscle = \(exercise.muscle)")
            var exc = Exercise(name: "", information: "")
//            musclesName.append(exercise.name)
            exc.name = exercise.name
            exc.information = exercise.information
            excercises.append(exc)
        }
        return excercises
    }
    
    func getShoulders()-> [Exercise] {
        var excercises = [Exercise]()
        let storedExercise = realm.objects(StoredExercise5.self).filter("muscle == 'shoulder'")
        for exercise in storedExercise {
            var exc = Exercise(name: "", information: "")
            exc.name = exercise.name
            exc.information = exercise.information
            excercises.append(exc)
        }
        return excercises
    }
    
    func getData()-> [Sesh] {
        var workoutData = [Sesh]()
        let storedData = realm.objects(SessionDetail.self)
        for data in storedData {
            var dt = Sesh(exercise: "", weight: "", reps: "")
//            dt.exercise = data.
            dt.reps = data.reps
            dt.weight = data.weight
            workoutData.append(dt)
        }
        
        return workoutData
    }
    
    func getWorkout()-> [String] {
        var musclesName = [String]() //*******
//        var information = [String]()
        let storedExercise = realm.objects(Workout5.self)
        for exercise in storedExercise {
    //        print("Muscle = \(exercise.muscle)")
            musclesName.append(exercise.exercise)
//            information.append(exercise.information)
            
        }
        return musclesName
    }
    
    func getInfo()-> String {
        var exerciseInfo = String()
        let storedInfo = realm.objects(Workout5.self)
        for info in storedInfo {
            exerciseInfo.append(info.information)
        }
        return exerciseInfo
    }
    
    
    
    //MARK:- saveToWorkoutWithExcerciseName
    func saveToWorkoutWithExerciseName(_ name:String,_ info:String) {
        let workout = Workout5()
        workout.exercise = name
        workout.information = info
        try! realm.write{
            realm.add(workout)
        }
    }
    
    func saveWorkoutSessionData(_ name:String, with workOutSessions:[Dictionary<String, String>]) {
        let session = Session5()
        session.exercise = name
        for workOutSession in workOutSessions{
            let sessionDetail = SessionDetail()
            sessionDetail.weight = workOutSession["weight"] ?? ""
            sessionDetail.reps = workOutSession["reps"] ?? ""
            session.details.append(sessionDetail)
        }
        
        try! realm.write {
            realm.add(session)
        }
    }
}
