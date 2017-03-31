//
//  CustomRGBViewController.swift
//  Color Palette RGB
//
//  Created by Ethan Halprin on 31/03/2017.
//  License : MIT
//
import UIKit

class CustomRGBViewController: UIViewController
{
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redLabel: UILabel!
    
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenLabel: UILabel!
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var opacitySlider: UISlider!
    @IBOutlet var opacityLabel: UILabel!
    
    @IBOutlet var codeTextView: UITextView!
    @IBOutlet var copyCodeButton: UIButton!
    
    private var currMixColorBundle : ColorBundle = ColorBundle()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        codeTextView.layer.borderWidth  = 3.0
        codeTextView.layer.borderColor  = UIColor.black.cgColor
        codeTextView.layer.cornerRadius = 7.0

        copyCodeButton.layer.borderWidth  = 1.0
        copyCodeButton.layer.borderColor  = copyCodeButton.titleColor(for: UIControlState.normal)?.cgColor
        copyCodeButton.layer.cornerRadius = 7.0
        
        displayBlend()
    }
    
    private func displayBlend()
    {
        let R = CGFloat(self.currMixColorBundle.red   / 255.0)
        let G = CGFloat(self.currMixColorBundle.green / 255.0)
        let B = CGFloat(self.currMixColorBundle.blue  / 255.0)
        let A = CGFloat(self.currMixColorBundle.alpha)
        
        self.view.backgroundColor = UIColor.init(red  : R,
                                                 green: G,
                                                 blue : B,
                                                 alpha: A)
        
        
        self.codeTextView.text?.removeAll()
        self.codeTextView.text = "let color = UIColor.init(red: \(self.currMixColorBundle.red)/255.0, green: \(self.currMixColorBundle.green)/255.0, blue: \(self.currMixColorBundle.blue)/255.0, alpha: \(self.currMixColorBundle.alpha))"
    }
    
    @IBAction func redSliderValueChanged(_ sender: UISlider)
    {
        DispatchQueue.global().async
        {
            self.currMixColorBundle.red = Float(sender.value)
            
            DispatchQueue.main.async
            {
                self.displayBlend()
                
                self.redLabel.text?.removeAll()
                self.redLabel.text = "\(self.currMixColorBundle.red)"
            }
        }
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider)
    {
        DispatchQueue.global().async
        {
            self.currMixColorBundle.green = Float(sender.value)
            
            DispatchQueue.main.async
            {
                self.displayBlend()
                
                self.greenLabel.text?.removeAll()
                self.greenLabel.text = "\(self.currMixColorBundle.green)"
            }
        }
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider)
    {
        DispatchQueue.global().async
        {
            self.currMixColorBundle.blue = Float(sender.value)
            
            DispatchQueue.main.async
            {
                self.displayBlend()
                
                self.blueLabel.text?.removeAll()
                self.blueLabel.text = "\(self.currMixColorBundle.blue)"
            }
        }
    }
    
    @IBAction func opacitySliderValueChanged(_ sender: UISlider)
    {
        DispatchQueue.global().async
        {
            self.currMixColorBundle.alpha = Float(sender.value)
            
            DispatchQueue.main.async
            {
                self.displayBlend()
                
                self.opacityLabel.text?.removeAll()
                self.opacityLabel.text = "\(self.currMixColorBundle.alpha)"
            }
        }
    }
    
    @IBAction func copyCodeTouchUp(_ sender: Any)
    {
        UIPasteboard.general.string = codeTextView.text
    }
}
