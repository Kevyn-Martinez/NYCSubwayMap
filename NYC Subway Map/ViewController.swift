////
//  ViewController.swift
//  NYC Subway Map
//
//  Created by Blaze on 6/12/21.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayPdf()
}
            
    //Gets the file name by using the Bundle
    //function to search for the File Name with its extension
    //If the file doesn't exist it retunrs nil

    private func resourceURL(forFileName fileName: String) -> URL? {
        
        if let resourceUrl = Bundle.main.url(forResource: fileName, withExtension: "pdf"){
            
            return resourceUrl
        }

        return nil
        
    }

    //Create a PDF View so we can use to display the file
    private func createPdfView(withFrame frame: CGRect) -> PDFView{
       
        let pdfView = PDFView(frame: frame)
        
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        pdfView.autoScales = true
        return pdfView
    }
    
    //Creathe the PDF Document
    private func createPdfDocument(forFileName fileName: String) -> PDFDocument?{
        if let resourceUrl = self.resourceURL(forFileName: fileName){
            
            return PDFDocument(url: resourceUrl)
        }
        return nil
    }
    
    //Now Display the PDF in a funct
    private func displayPdf(){
        let pdfView = createPdfView(withFrame: self.view.bounds)
        if let pdfDocument = createPdfDocument(forFileName: "Subway_Map"){
            self.view.addSubview(pdfView)
            pdfView.document = pdfDocument
        }
    }
}

