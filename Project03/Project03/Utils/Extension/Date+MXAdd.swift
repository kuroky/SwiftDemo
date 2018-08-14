//
//  Date+MXAdd.swift
//  Project03
//
//  Created by kuroky on 2018/8/13.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 日期格式单例
class DateFormatterPool {
    static let shared = DateFormatterPool()
    private init() {}
    
    /// 生成指定的日期格式
    /// - Parameters:
    ///   - formate: date style
    class func dateFormatter(formate: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        dateFormatter.locale = NSLocale.current
        return dateFormatter
    }
}

extension Date {
    
    /// 根据时间戳计算Date
    static func dateFromInterval(interval: Int) -> Date {
        var timeInterval = TimeInterval(interval)
        if interval.count() == 13 {
            timeInterval = timeInterval * 0.001
        }
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    /// 日期转化为指定格式字符串 (今天: HH:mm, 昨天:昨天, 之前的: yyyy/MM/dd)
    func stringFromDate() -> String {
        if self.isToday() {
            return DateFormatterPool.dateFormatter(formate: "HH:mm").string(from: self)
        } else if self.isYesterDay() {
            return "昨天"
        } else {
            return DateFormatterPool.dateFormatter(formate: "yyyy/MM/dd").string(from: self)
        }
    }
    
    /// 日期是否为今天
    func isToday() -> Bool {
        let calendar = Calendar.current
        let unit: Set<Calendar.Component> = [.day, .month, .year]
        let nowComps = calendar.dateComponents(unit, from: Date())
        let selfCmps = calendar.dateComponents(unit, from: self)
        
        return (selfCmps.year == nowComps.year) && (selfCmps.month == nowComps.month) && (selfCmps.day == nowComps.day)
    }
    
    /// 日期是否为昨天
    func isYesterDay() -> Bool {
        let calendar = Calendar.current
        let unit: Set<Calendar.Component> = [.day, .month, .year]
        let nowComps = calendar.dateComponents(unit, from: Date())
        let selfCmps = calendar.dateComponents(unit, from: self)
        
        if selfCmps.day == nil || nowComps.day == nil {
            return false
        }
        
        let count = nowComps.day! - selfCmps.day!
        return (selfCmps.year == nowComps.year) && (selfCmps.month == nowComps.month) && (count == 1)
    }
}
