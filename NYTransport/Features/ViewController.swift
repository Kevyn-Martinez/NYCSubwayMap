import UIKit
import PDFKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let pdfView = PDFView(frame: view.bounds)
        
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfView.autoScales = true
        
        if let pdfDocument = createPdfDocument(for: "Subway_Map"){
            self.view.addSubview(pdfView)
            pdfView.document = pdfDocument
        }
    }
    
    // TODO: Add initializer to inject non-optional PDF Document.
    private func createPdfDocument(for fileName: String) -> PDFDocument? {
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "pdf")
        else { return nil }
        
        return PDFDocument(url: url)
    }
}

