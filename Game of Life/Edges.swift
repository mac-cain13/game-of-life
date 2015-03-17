//
//  Edges.swift
//  Game of Life
//
//  Created by Mathijs Kadijk on 17-03-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

typealias Edges = (top: Int32, right: Int32, bottom: Int32, left: Int32)

func edgesForGeneration(g: Generation) -> Edges? {

  if let anyPos = g.keys.first {
    var edges = Edges(top: anyPos.y, right: anyPos.x, bottom: anyPos.y, left: anyPos.x)

    for (position, _) in g {
      if position.y < edges.top {
        edges.top = position.y
      }

      if position.x > edges.right {
        edges.right = position.x
      }

      if position.y > edges.bottom {
        edges.bottom = position.y
      }

      if position.x < edges.left {
        edges.left = position.x
      }
    }

    return edges
  }

  return nil
}

func expandEdges(edges: Edges, byAmount amount: Int32) -> Edges {
  return Edges(edges.top - amount, edges.right + amount, edges.bottom + amount, edges.left - amount)
}
