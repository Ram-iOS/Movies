//
//  MovieDetailVC.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MovieDetailVC: UITableViewController {

    
    @IBOutlet weak var imgposter: UIImageView!
    @IBOutlet weak var imgbg: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblgenere: UILabel!
    @IBOutlet weak var lblreleasedate: UILabel!
    @IBOutlet weak var lblduration: UILabel!
    @IBOutlet weak var lblproductioncompay: UILabel!
    @IBOutlet weak var lblbudget: UILabel!
    @IBOutlet weak var lblrevenue: UILabel!
    @IBOutlet weak var lbllanguage: UILabel!
    
    
    var disposeBag = DisposeBag()

    var mvid:String = ""
    var posterimage:String = ""
    var bgimage:String = ""
    var moviename:String = ""
    var viewmodel: MoviewDetailViewMDL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel = MoviewDetailViewMDL(movieid: mvid)
        bindname()
        
        let urlstring = "http://image.tmdb.org/t/p/w185" + posterimage
       // imgposter!.sd_setImage(with: URL(string: urlstring), placeholderImage: nil, options: 0, completed: nil)
        imgposter.sd_setImageWithPreviousCachedImage(with: URL(string: urlstring), placeholderImage: nil, options: [], progress: nil, completed: nil)
        
        let urlstringbg = "http://image.tmdb.org/t/p/w185" + bgimage
        imgbg.sd_setImageWithPreviousCachedImage(with: URL(string: urlstring), placeholderImage: nil, options: [], progress: nil, completed: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCommonNavigationBar(title: moviename, largeTitle: false, tranpernt: false, tint: Constants.Colors.navColor, fontColor: .white)
    }
    
    private func bindname(){
        
        self.viewmodel?.results.asObservable().map({$0?.title}).bind(to: self.lblname.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.tagline}).bind(to: self.lbldescription.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.overview}).bind(to: self.lblOverview.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.genre}).bind(to: self.lblgenere.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.releasedate}).bind(to: self.lblreleasedate.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.duration}).bind(to: self.lblduration.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({ $0?.companies}).bind(to: self.lblproductioncompay.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.budget}).bind(to: self.lblbudget.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.revenue}).bind(to: self.lblrevenue.rx.text).disposed(by:self.disposeBag)
        self.viewmodel?.results.asObservable().map({$0?.lang}).bind(to: self.lbllanguage.rx.text).disposed(by:self.disposeBag)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        
    }

}

extension MovieDetailVC{
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
