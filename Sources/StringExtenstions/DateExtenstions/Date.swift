//
//  Date.swift
//  PopFoods
//
//  Created by Kirill Titov on 04.02.2024.
//

import Foundation

public extension Date {
    // Получите текущую дату
    var currentDate: Date { Date() }

    /// Определите день недели для текущей даты (0 - воскресенье, 1 - понедельник, и т. д.)
//    var currentWeekday: Int {
//        let calendar = Calendar.current
//        return calendar.component(.weekday, from: currentDate)
//    }
    
    enum RangeForWeek: Int {
        case current = 0
        case currentAndNextOne = 7
        case currentAndNextTwo = 14
    }
    
    func datesOfWeek(_ plus: RangeForWeek = .current) -> [Date] {
        // Создайте календарь
        let calendar = Calendar.current

        // Определите текущий день недели
        let currentWeekday = calendar.component(.weekday, from: currentDate)

        // Вычислите разницу между текущим днем недели и понедельником
        let daysToSubtract = (currentWeekday + 5) % 7 // 0 соответствует понедельнику

        // Определите начальную дату текущей недели, начиная с понедельника
        let startDateOfWeek = calendar.date(byAdding: .day, value: -daysToSubtract, to: currentDate)!

        // Определите конечную дату текущей недели, которая будет воскресеньем
        let endDateOfWeek = calendar.date(byAdding: .day, value: 6 + plus.rawValue, to: startDateOfWeek)!

        // Создайте массив для хранения дат текущей недели
        var datesOfWeek: [Date] = []

        // Заполните массив датами текущей недели
        var currentDateInLoop = startDateOfWeek
        while currentDateInLoop <= endDateOfWeek {
            datesOfWeek.append(currentDateInLoop)
            currentDateInLoop = calendar.date(byAdding: .day, value: 1, to: currentDateInLoop)!
        }

        return datesOfWeek
    }
    
    var getDay: String {
        let dateFormatter = DateFormatter().ru
        // День в виде числа (цифрами)
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    var getMonth: String {
        let dateFormatter = DateFormatter().ru
        // Месяц в виде текста (буквами)
        dateFormatter.dateFormat = "LLL"
        return dateFormatter.string(from: self)
    }
}
