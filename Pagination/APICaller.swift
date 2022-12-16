//
//  APICaller.swift
//  Pagination
//
//  Created by Tiku on 29/11/22.
//

import Foundation

class APICaller {
    var isPagination: Bool = false
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            isPagination = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2)) {
            let originalData = [
                "Apple", "Google", "Toyota", "Mercedes", "Honda", "Suzuki", "Nissan", "ThinkPad",
                "Apple", "Google", "Toyota", "Mercedes", "Honda", "Suzuki", "Nissan", "ThinkPad"]
            let newData = [
                "Europa", "USA", "Thailand", "Vietnam", "Norway", "Germany", "Australia", "Africa"]
            completion(.success(pagination ? newData : originalData))
            if pagination {
                self.isPagination = false
            }
        }
    }
}
