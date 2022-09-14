//
//  OnboardViewModel.swift
//  likematick
//
//  Created by ferhatiltas on 14.07.2022.
//

import UIKit
struct OnboardViewModel {
    var onboardList: [OnboardModel] = []
    var currentPage: Int = 0

    init() {
        self.onboardList = [
            OnboardModel(title: ApplicationConstants().onboardTitle1, description: ApplicationConstants().onboardDescription1, image: ImageHelper.onboard1!),
            OnboardModel(title: ApplicationConstants().onboardTitle2, description: ApplicationConstants().onboardDescription2, image: ImageHelper.onboard2!),
            OnboardModel(title: ApplicationConstants().onboardTitle3, description: ApplicationConstants().onboardDescription3, image: ImageHelper.onboard3!),
        ]
    }
}
