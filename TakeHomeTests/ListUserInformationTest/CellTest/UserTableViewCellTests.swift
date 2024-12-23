//
//  UserTableViewCellTests.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//


import XCTest
@testable import TakeHome
import Kingfisher

class UserTableViewCellTests: XCTestCase {
    
    var cell: UserTableViewCell!
    
    override func setUp() {
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        cell = nib.instantiate(withOwner: self, options: nil).first as? UserTableViewCell
        super.setUp()
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testLoadNib_shouldNotBeNil() {
        XCTAssertNotNil(cell)
    }
    
    func testCellInitialization_WhenLayoutSubView() {
        //When
        cell.awakeFromNib()
        cell.layoutSubviews()
        
        // Then
        XCTAssertEqual(cell.containerView.layer.cornerRadius, 16, "Container view corner radius should be 16")
        XCTAssertEqual(cell.containerView.layer.borderWidth, 1, "Container view border width should be 1")
        XCTAssertNotNil(cell.containerView.layer.shadowColor, "Container view shadow color should be set")
        XCTAssertEqual(cell.containerImageView.layer.cornerRadius, 16, "Container image view corner radius should be 16")
        XCTAssertEqual(cell.borderView.layer.borderWidth, 1, "Border view border width should be 1")
        XCTAssertEqual(cell.borderView.layer.borderColor, UIColor.black.cgColor, "Border view border color should be black")
    }

    func testSetupData() {
        // Given
        let mockModel = UserCellModel(imageViewURL: "https://example.com/avatar.jpg", name: "Test User")
        
        // When
        cell.setupData(model: mockModel)
        
        // Then
        XCTAssertEqual(cell.userNameLabel.text, "Test User", "User name label should show the correct name")
      
    }

    func testLinkedInLabel() {
        let text = "https://www.linkedin.com/"
        let attributedText = cell.linkedinLabel.attributedText
        
        //Then
        XCTAssertTrue(attributedText?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor == UIColor.blue, "LinkedIn text should have blue color")

        let range = NSRange(location: 0, length: attributedText?.length ?? 0)
        XCTAssertTrue(attributedText?.attribute(.underlineStyle, at: 0, effectiveRange: nil) as? Int == NSUnderlineStyle.single.rawValue, "LinkedIn text should be underlined")
    }
}
