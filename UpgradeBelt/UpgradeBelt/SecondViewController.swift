//
//  SecondViewController.swift
//  UpgradeBelt
//
//  Created by Julia Boichentsova on 11/04/2020.
//  Copyright © 2020 Julia Boichentsova. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var containerView: UIView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var contactUsButton: UIButton!    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "X"
        textView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        textView.text = "Upgrade Belt app is created for Taekwon-Do students as a support tool to browse and learn grading material in preparation for their next belt.\n\nThe app may not cover all grading requirements and may contain mistakes. \n\nIf you'd like to contribute or support the project, or want to share your thoughts of how to improve the app please contact us.\n\nBuild v." + buildVersion
        
        contactUsButton.layer.cornerRadius = 10
        contactUsButton.layer.borderColor = UIColor.black.cgColor
        contactUsButton.layer.borderWidth = 1.0
        contactUsButton.backgroundColor = .white
        
    }
    
    func openURL(url: URL) {
        // for versions iOS 10 and above
         if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
         }
    }
    
    @IBAction func contactUs(_ sender:UIButton) {
        let recipientEmail = "upgradebelt@gmail.com"
        let subject = "Upgrade Belt"
        let body = ""

        // Show default mail composer
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)

            present(mail, animated: true)

        // Show third party email composer if default Mail app is not present
        } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
            if(UIApplication.shared.canOpenURL(emailUrl)) {
                UIApplication.shared.open(emailUrl)
            } else {
                let url = URL(string:"https://upgradebelt.wordpress.com/")
                self.openURL(url: url!)
            }
        }
    }
    
    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
            let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

            let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
            let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

            if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
                return gmailUrl
            } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
                return outlookUrl
            } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
                return yahooMail
            } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
                return sparkUrl
            }

            return defaultUrl
    }
    
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

