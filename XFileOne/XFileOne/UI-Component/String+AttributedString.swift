//
//  String+AttributedString.swift
//  Manhattan
//
//  Created by Mario on 2020/12/28.
//

import UIKit
import Foundation

class String_AttributedString: NSMutableAttributedString {

    
}

extension String {

    /// range转换为NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }

    // 匹配第一个字符串
    func stringMatchStrRange(_ matchStr: String) -> NSRange {
            var selfStr = self as NSString
            var withStr = Array(repeating: "X", count: (matchStr as NSString).length).joined(separator: "") //辅助字符串
            if matchStr == withStr { withStr = withStr.uppercased() } //临时处理辅助字符串差错
            while selfStr.range(of: matchStr).location != NSNotFound {
                let range = selfStr.range(of: matchStr)
                selfStr = selfStr.replacingCharacters(in: NSMakeRange(range.location, range.length), with: withStr) as NSString
                return NSRange(location: range.location,length: range.length)
            }
        return NSRange(location: 0, length: 0)
    }
}
