//
//  Toast.swift
//  lingoes
//
//  Created by Guen on 02/09/2023.
//

enum ToastStatus {
    case success, error
}

struct Toast {
    let message: String
    let status: ToastStatus
}
