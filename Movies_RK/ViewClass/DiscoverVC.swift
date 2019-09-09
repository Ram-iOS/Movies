//
//  ViewController.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class DiscoverVC: UIViewController {
    
    @IBOutlet weak var tblDiscover: UITableView!
    
    let viewmodel = DiscoverViewMDL()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCommonNavigationBar(title: "Movie List", largeTitle: false, tranpernt: false, tint: Constants.Colors.navColor, fontColor: .white, backhide: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func bindTableView() {
        
        
        viewmodel.results.asObservable().bind(to: tblDiscover.rx.items(cellIdentifier: String(describing: DiscoverTblCell.self), cellType: DiscoverTblCell.self)){
            row, result, cell in
            cell.configure(data: result)
            }.disposed(by: disposeBag)
        
        tblDiscover.rx.setDelegate(self).disposed(by: disposeBag)
        
    }
}



//MARK:- Tbl Source
/*
 * Extension to Tableview data source and delegates
 */

extension DiscoverVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailvc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: MovieDetailVC.self)) as? MovieDetailVC{
            detailvc.mvid = self.viewmodel.results.value[indexPath.row].id!
            detailvc.posterimage = self.viewmodel.results.value[indexPath.row].posterPath!
            detailvc.bgimage = self.viewmodel.results.value[indexPath.row].backdropPath!
            detailvc.moviename = self.viewmodel.results.value[indexPath.row].title!
            self.navigationController?.pushViewController(detailvc, animated: true)
        }
    }
    
}

