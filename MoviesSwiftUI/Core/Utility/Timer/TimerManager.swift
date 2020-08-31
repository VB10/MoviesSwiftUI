//
//  TimerManager.swift
//  MoviesSwiftUI
//
//  Created by Veli on 31.08.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


final class TimerManager {

    var timer: Timer = Timer()
    var count: Int = 0


    func start(onComplete: @escaping () -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: TimerIntervals.high.rawValue, repeats: true, block: { (timer) in

            self.timerFunc {
                onComplete()
            }
        })
    }

    private func timerFunc(onComplete: () -> Void) {
        count += TimerValues.increment.rawValue

        if count == TimerValues.complete.rawValue {
            timer.invalidate()
            count = 0
            onComplete()
        }
    }

}
