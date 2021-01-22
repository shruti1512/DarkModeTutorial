/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

final class TeacherDetailViewController: UIViewController {
	private let teacher: Teacher

	@IBOutlet private weak var headerBackgroundView: UIView!
	@IBOutlet private weak var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = 64
			imageView.layer.masksToBounds = true
		}
	}
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var houseImageView: UIImageView!
	@IBOutlet private weak var houseLabel: UILabel!
	@IBOutlet private weak var yearsAtHogwartsLabel: UILabel!

	init?(coder: NSCoder, teacher: Teacher) {
		self.teacher = teacher
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		imageView.image = UIImage(named: teacher.imageName)
		nameLabel.text = teacher.name
		yearsAtHogwartsLabel.text = "\(teacher.startingYear)-\(teacher.endingYear)"
		houseLabel.text = teacher.house.name

		headerBackgroundView.backgroundColor = .white

		switch teacher.house {
		case .gryffindor:
			houseLabel.textColor = .red
		case .hufflepuff:
			houseLabel.textColor = .yellow
		case .ravenclaw:
			houseLabel.textColor = .blue
		case .slytherin:
			houseLabel.textColor = .green
		}

		houseImageView.tintColor = .black
	}
}
