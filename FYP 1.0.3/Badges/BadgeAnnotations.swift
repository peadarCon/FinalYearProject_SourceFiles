//
//  BadgeAnnotations.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 15/04/2021.
//

import MapKit

class BadgeAnnotation: MKPointAnnotation {
  let imageName: String
  
  init(imageName: String) {
    self.imageName = imageName
    super.init()
  }
}

