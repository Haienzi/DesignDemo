//
//  Person.swift
//  DesignDemo
//
//  Created by mqh on 2022/10/20.
//

import Foundation

// 小孩和大人，小孩吃一碗米饭，大人吃两碗米饭，小孩每天10点睡觉，大人每天12点睡觉，如果直接用继承来实现有两个方法
// eat 和 sleep,如果此时多个老人，吃一碗米饭，12点睡觉，就要重写吃一碗米饭和12点睡觉的方法，
// 使用策略模式可以将eat和sleep的操作独立出来，延伸成eatOne/eatTwo， sleepTen/SleepTwo,这样添加新的老人时就不需要重写操作方法，只需重新组合即可。
//
