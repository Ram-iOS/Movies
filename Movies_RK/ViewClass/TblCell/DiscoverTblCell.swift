//
//  DiscoverTblCell.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import UIKit
import SDWebImage

class DiscoverTblCell: UITableViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblMoviewname: UILabel!
    @IBOutlet weak var lblreleasedate: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(data: Movies){
        
        lblMoviewname.text   = data.title
        lblOverview.text     = data.overview
        lblreleasedate.text  = data.releaseDate
        
        if let img = data.posterPath{
            let urlstring = "http://image.tmdb.org/t/p/w185" + img
            imgMovie.sd_setImage(with: URL(string: urlstring), placeholderImage: nil, options: .queryDiskDataSync, completed: nil)
        }
    }
    
}
