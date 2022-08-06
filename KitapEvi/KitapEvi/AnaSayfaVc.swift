//
//  ViewController.swift
//  odev3_emreYildirim
//
//  Created by macbook air on 5.08.2022.
//

import UIKit

class AnaSayfaVc: UIViewController {

    @IBOutlet weak var falakaBaslik: UILabel!
    @IBOutlet weak var falakaSepet: UIButton!
    @IBOutlet weak var falakaOzet: UIButton!
    @IBOutlet weak var ikiSehirBaslik: UILabel!
    @IBOutlet weak var ikiSehirSepet: UIButton!
    @IBOutlet weak var ikiSehirOzet: UIButton!
    @IBOutlet weak var sepeteGit: UIButton!
    @IBOutlet weak var altBilgi: UILabel!
    @IBOutlet weak var sepetBosaltma: UIButton!
    var falakaAdet = 0
    var ikiSehirAdet = 0
    var ozetEkraniResimAdi: String = ""
    var ozetEkraniLabel: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Kitap Evi"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "ArkaPlan")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "YaziRenk")! , .font : UIFont(name: "PlayfairDisplay-Italic", size: 30)!]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        falakaOzet.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 20)
        falakaSepet.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 20)
        falakaBaslik.font = UIFont(name: "PlayfairDisplay-Italic", size: 25)
        ikiSehirOzet.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 20)
        ikiSehirSepet.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 20)
        ikiSehirBaslik.font = UIFont(name: "PlayfairDisplay-Italic", size: 25)
        sepeteGit.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 25)
        sepetBosaltma.titleLabel!.font = UIFont(name: "PlayfairDisplay", size: 25)
        altBilgi.font = UIFont(name: "PlayfairDisplay", size: 10)
        sepeteGit.setTitle("Sepet Tutarı : \((falakaAdet+ikiSehirAdet))₺  |  Ödeme Yap!", for: UIControl.State.normal)
    }
   
    @IBAction func falakaSepeteEkle(_ sender: Any) {
        falakaAdet += 1
        sepeteGit.setTitle("Sepet Tutarı : \((falakaAdet+ikiSehirAdet))₺  |  Ödeme Yap!", for: UIControl.State.normal)
    }
    @IBAction func falakaOzetIncele(_ sender: Any) {
        ozetEkraniResimAdi = "Palaka"
        ozetEkraniLabel = "Kahramanımız kırk arkadaşı ile birlikte bir kuran kursuna gitmektedir. Burada huysuz bir hoca bulunmaktadır. Hep bir ağızdan Şart olsun ki nikahının düşeceğini söyleyip dururlar. Ne yapacağını bilemeyen hoca eşeği falakaya yatırır. O esnada oradan geçen kaymakam olayı görüp gelir ve hocayı onunla gelmesini söyler. O günden bugüne kahramanımız ne o hocayı nede falakayı görmemiştir. Her hap şuranı gördüğü zaman aklına bu hikaye gelip vicdan azabı duymaktadır."
        
        performSegue(withIdentifier: "OzetIncele", sender: nil)
    }
    @IBAction func ikiSehirSepeteEkle(_ sender: Any) {
        ikiSehirAdet += 1
        sepeteGit.setTitle("Sepet Tutarı : \((falakaAdet+ikiSehirAdet))₺  |  Ödeme Yap!", for: UIControl.State.normal)
    }
    @IBAction func ikiSehirOzetiIncele(_ sender: Any) {
        ozetEkraniResimAdi = "IkiSehrinHikayesi"
        ozetEkraniLabel = "Dr. Manetta Paris’te bir hapishanede aristokratlar yüzünden suçsuz yere 18 yıl yatar. Bu yüzden akli dengesi bozulur. Dr. Manetta’nın en yakın dostları Defargeler, Damey’i halk düşmanı ilan etmiştir. Darney idama mahkûm edilir. Darney’le birbirlerine çok benzemektedirler. Kıyafetlerini değiştirirler ve Avukat Carton, Darney’in yerine giyotine gider. Darney, Lucia ve kızını alarak Paris’ten kaçar."
        
        performSegue(withIdentifier: "OzetIncele2", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OzetIncele" || segue.identifier == "OzetIncele2"{
            let destinationVC = segue.destination as! OzetVc
            destinationVC.ozetEkraniLabel = ozetEkraniLabel
            destinationVC.ozetEkraniResimAdi = ozetEkraniResimAdi
        }
    }
    
    @IBAction func sepetBosalt(_ sender: Any) {
        ikiSehirAdet = 0
        falakaAdet = 0
        sepeteGit.setTitle("Sepet Tutarı : \((falakaAdet+ikiSehirAdet))₺  |  Ödeme Yap!", for: UIControl.State.normal)
    }
    @IBAction func odemeYap(_ sender: Any) {
        if (falakaAdet+ikiSehirAdet) != 0{
            let alert = UIAlertController(title: "Ödeme Onayı", message: "\(falakaAdet+ikiSehirAdet) adet kitap tutarı olan \(falakaAdet+ikiSehirAdet)₺ hesabınızdan ödenecektir. Ödemeyi onaylıyor musunuz?", preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "Onaylıyorum", style: UIAlertAction.Style.default, handler: nil))
                    alert.addAction(UIAlertAction(title: "İptal", style: UIAlertAction.Style.cancel, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            ikiSehirAdet = 0
            falakaAdet = 0
            sepeteGit.setTitle("Sepet Tutarı : \((falakaAdet+ikiSehirAdet))₺  |  Ödeme Yap!", for: UIControl.State.normal)
        }
 
    }
    
}



