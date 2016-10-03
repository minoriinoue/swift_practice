//
//  ViewController.swift
//  MyBrowserApp
//
//  Created by Minori Inoue on 10/2/16.
//  Copyright © 2016 Minori Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: self.webView.frame.size.width, height: 1)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.webView.layer.addSublayer(topBorder)
        
        self.webView.delegate = self
        self.urlField.delegate = self
        
        let startUrl = "http://dotinstall.com"
        jumpToUrl(urlString: startUrl)
        self.setupButtonsEnabled()
        self.activityIndicatorView.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: NSError) {
        self.webView.stopLoading()
        self.activityIndicatorView.stopAnimating()
        if error.code != NSURLErrorCancelled {
            self.showAlert(message: "Network Error")
        }
        
    }
    
    func jumpToUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(url: url as URL)
            self.webView.loadRequest(urlRequest as URLRequest)
        } else {
            self.showAlert(message: "Invalid url")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = self.urlField.text
        urlString = urlString?.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if urlString == "" {
            // alert
            self.showAlert(message: "Please enter url")
        } else {
            // jumpToUrl()
            if !((urlString?.hasPrefix("http://"))!) && !((urlString?.hasPrefix("https://"))!) {
                urlString = "http://" + urlString!
            }
            jumpToUrl(urlString: urlString!)
            self.setupButtonsEnabled()
        }
        self.urlField.resignFirstResponder()
        return true
    }
    
    func setupButtonsEnabled() {
        self.backButton.isEnabled = self.webView.canGoBack
        self.forwardButton.isEnabled = self.webView.canGoForward
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.activityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityIndicatorView.stopAnimating()
        self.setupButtonsEnabled()
        if let urlString = self.webView.request?.url?.absoluteString {
            self.urlField.text = urlString
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: AnyObject) {
        self.webView.goBack()
    }
    @IBAction func goForward(_ sender: AnyObject) {
        self.webView.goForward()
    }
    @IBAction func reload(_ sender: AnyObject) {
        self.webView.reload()
    }

}

