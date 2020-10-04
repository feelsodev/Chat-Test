//
//  ChatMessageCell.swift
//  Chat-Test
//
//  Created by once on 2020/10/04.
//

import UIKit

class ChatMessageCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var containerViewWidthAnchor: NSLayoutConstraint?
    var containerViewRightAnchor: NSLayoutConstraint?
    var containerViewLeftAnchor: NSLayoutConstraint?
    var containerViewHeightAnchor: NSLayoutConstraint?
    var textLabelHeightAnchor: NSLayoutConstraint?
    
    func setUITraits() {
        containerView.layer.cornerRadius = 4
        
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
    }
    
    func setAnchors() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerViewLeftAnchor = containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4)
        containerViewRightAnchor = containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4)
        containerViewWidthAnchor = containerView.widthAnchor.constraint(equalToConstant: 200)
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: frame.height)
        containerViewWidthAnchor?.isActive = true
        containerViewHeightAnchor?.isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        textLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 4).isActive = true
        textLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        textLabelHeightAnchor = textLabel.heightAnchor.constraint(equalToConstant: frame.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAnchors()
        setUITraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func measuredFrameHeightForEachMessage(message: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: message).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        let height = measuredFrameHeightForEachMessage(message: textLabel.text!).height + 20
        var newFrame = layoutAttributes.frame
        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
        newFrame.size.height = height
        containerViewHeightAnchor?.constant = height
        textLabelHeightAnchor?.constant = height
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
}
