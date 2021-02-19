//
//  pokemon.swift
//  Pokedex
//
//  Created by ansh vidyabhanu on 24/12/20.
//

import Foundation

struct Plist: Codable
{
    // Json -> swift data
    let results: [Pbasic]
}
struct Pbasic: Codable
{
    // name and url for pokemon details
    let name: String
    let url: String
}

struct Pdata: Codable
{
    // other data such as id ,
    let id: Int
    let types: [Ptypeentry]
}

struct Ptype: Codable
{
    // stores pokemon tpye and url
    let name: String
    let url: String
}

struct Ptypeentry: Codable
{
    let slot: Int
    let  type: Ptype
}
