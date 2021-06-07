//
//  Session.swift
//  RealmTest
//
//  Created by Peadar Conaghan on 10/05/2021.
//

import Foundation
import RealmSwift

struct Sesh {
    var exercise: String
    var weight: String
    var reps: String
}

class Session5: Object {
    
    @objc dynamic var exercise: String = ""
    let details = List<SessionDetail>()
}

class SessionDetail: Object {
    @objc dynamic var weight: String = ""
    @objc dynamic var reps: String = ""
}
