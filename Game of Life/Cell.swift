//
//  Cell.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 15-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

enum Cell: Printable {
  case Alive
  case Dead

  var description: String {
    switch self {
    case .Alive:
      return "O"
    case .Dead:
      return " "
    }
  }
}
