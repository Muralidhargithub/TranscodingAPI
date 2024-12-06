//
//  CustomTableViewCell.swift
//  APIDataTableViewCell
//
//  Created by Muralidhar reddy Kakanuru on 12/2/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let label : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant:8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant : -8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
    }
    

    
    func configure(with user : Content){
        var text = "\n"

            for (index, transcoding) in user.transcodings.enumerated() {
                text += """
                Transcoding \(index + 1):
                Id: \(transcoding.id ?? "")
                Title: \(transcoding.title ?? "")
                Rtmp_stream: \(transcoding.rtmp_stream_uri ?? "")
                Size: \(transcoding.size ?? 0)
                Http_URI: \(transcoding.http_uri ?? "")
                Progress : \(transcoding.progress ?? 0)
                Rtmp_Base : \(transcoding.rtmp_base_uri ?? "")
                Rtmp_Uri: \(transcoding.rtmp_uri ?? "")
                Bitrate : \(transcoding.bitrate ?? 0)
                Height : \(transcoding.height ?? 0)
                Statw : \(transcoding.state ?? "")
                width : \(transcoding.width ?? 0)

                    \n
                """
            }

            label.text = text
    }
}

