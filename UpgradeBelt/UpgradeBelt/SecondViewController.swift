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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        textView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        textView.text = "Upgrade Belt app is created for Taekwon-Do students to browse and learn grading material in preparation for their next belt. \n\nIf you'd like to contribute or support the project please contact us."
    }
    
    func openURL(url: URL) {
        // for versions iOS 10 and above
         if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
         }
    }
    
    @IBAction func visitWebsite(_ sender:UIButton) {
        
        let url = URL(string:"http://www.rita-itf.org/student.htm")
        self.openURL(url: url!)
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

