//
//  SearchDataSourceDelegate.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 6.01.2024.
//

import Foundation

protocol SearchDataSourceDelegate: AnyObject {
    func searchListLoaded(searchList: [Article])
}
