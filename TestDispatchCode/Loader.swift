//
//  Loader.swift
//  TestDispatchWithLegacyCode
//
//  Created by Fabio Cuomo on 21/03/2021.
//

import Foundation

public protocol Loader {
    func load(completion: @escaping (String)-> Void)
}
