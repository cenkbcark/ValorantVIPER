//
//  AgentItemCell.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit

class AgentItemCell: UITableViewCell {

    @IBOutlet private weak var agentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareAgentCell(with model: AgentDataResponse) {
        agentNameLabel.text = model.displayName ?? ""
    }
}
