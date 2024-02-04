import Foundation

public extension String {
    func isPasswordValid(minLength: Int) -> Bool {
        let regExp = RegExpBuilder()
            .startAnchor()
            .length(min: minLength)
            .endAnchor()
            .build()
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        
        return predicate.evaluate(with: self)
    }
    
    var isPhoneNumberValid: Bool {
        let phonePattern = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        return self.range(
            of: phonePattern,
            options: .regularExpression
        ) != nil
    }
    
    var isEmailValid: Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        return self.range(
            of: emailPattern,
            options: .regularExpression
        ) != nil
    }
}
