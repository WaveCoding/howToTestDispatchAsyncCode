//
//  RemoteLoader.swift
//  TestDispatchWithLegacyCode
//
//  Created by Fabio Cuomo on 21/03/2021.
//

import Foundation

final class RemoteLoader: Loader {
    func load(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: {
            completion("=-Loaded-=")
        })
    }
}
