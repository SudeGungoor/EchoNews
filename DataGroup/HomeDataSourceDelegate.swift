//
//  HomeDataSourceDelegate.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import Foundation

protocol HomeDataSourceDelegate: AnyObject {
    func homeListLoaded(homeList: [Source1])
}
