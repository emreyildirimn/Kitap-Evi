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
        sepeteGit.setTitle("Sepet Tutar?? : \((falakaAdet+ikiSehirAdet))???  |  ??deme Yap!", for: UIControl.State.normal)
    }
   
    @IBAction func falakaSepeteEkle(_ sender: Any) {
        falakaAdet += 1
        sepeteGit.setTitle("Sepet Tutar?? : \((falakaAdet+ikiSehirAdet))???  |  ??deme Yap!", for: UIControl.State.normal)
    }
    @IBAction func falakaOzetIncele(_ sender: Any) {
        ozetEkraniResimAdi = "Palaka"
        ozetEkraniLabel = "Kahraman??m??z k??rk arkada???? ile birlikte bir kuran kursuna gitmektedir. Burada huysuz bir hoca bulunmaktad??r. Hep bir a????zdan ??art olsun ki nikah??n??n d????ece??ini s??yleyip dururlar. Ne yapaca????n?? bilemeyen hoca e??e??i falakaya yat??r??r. O esnada oradan ge??en kaymakam olay?? g??r??p gelir ve hocay?? onunla gelmesini s??yler. O g??nden bug??ne kahraman??m??z ne o hocay?? nede falakay?? g??rmemi??tir. Her hap ??uran?? g??rd?????? zaman akl??na bu hikaye gelip vicdan azab?? duymaktad??r."
        
        performSegue(withIdentifier: "OzetIncele", sender: nil)
    }
    @IBAction func ikiSehirSepeteEkle(_ sender: Any) {
        ikiSehirAdet += 1
        sepeteGit.setTitle("Sepet Tutar?? : \((falakaAdet+ikiSehirAdet))???  |  ??deme Yap!", for: UIControl.State.normal)
    }
    @IBAction func ikiSehirOzetiIncele(_ sender: Any) {
        ozetEkraniResimAdi = "IkiSehrinHikayesi"
        ozetEkraniLabel = "Dr. Manetta Paris???te bir hapishanede aristokratlar y??z??nden su??suz yere 18 y??l yatar. Bu y??zden akli dengesi bozulur. Dr. Manetta???n??n en yak??n dostlar?? Defargeler, Damey???i halk d????man?? ilan etmi??tir. Darney idama mahk??m edilir. Darney???le birbirlerine ??ok benzemektedirler. K??yafetlerini de??i??tirirler ve Avukat Carton, Darney???in yerine giyotine gider. Darney, Lucia ve k??z??n?? alarak Paris???ten ka??ar."
        
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
        sepeteGit.setTitle("Sepet Tutar?? : \((falakaAdet+ikiSehirAdet))???  |  ??deme Yap!", for: UIControl.State.normal)
    }
    @IBAction func odemeYap(_ sender: Any) {
        if (falakaAdet+ikiSehirAdet) != 0{
            let alert = UIAlertController(title: "??deme Onay??", message: "\(falakaAdet+ikiSehirAdet) adet kitap tutar?? olan \(falakaAdet+ikiSehirAdet)??? hesab??n??zdan ??denecektir. ??demeyi onayl??yor musunuz?", preferredStyle: UIAlertController.Style.alert)

                    alert.addAction(UIAlertAction(title: "Onayl??yorum", style: UIAlertAction.Style.default, handler: nil))
                    alert.addAction(UIAlertAction(title: "??ptal", style: UIAlertAction.Style.cancel, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
            ikiSehirAdet = 0
            falakaAdet = 0
            sepeteGit.setTitle("Sepet Tutar?? : \((falakaAdet+ikiSehirAdet))???  |  ??deme Yap!", for: UIControl.State.normal)
        }
 
    }
    
}



