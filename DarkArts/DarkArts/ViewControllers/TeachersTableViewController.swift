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

final class TeachersTableViewController: UITableViewController {
  private lazy var teachers: [Teacher] = {
    guard
      let fileURL = Bundle.main.url(forResource: "teachers", withExtension: "json"),
      let data = try? Data(contentsOf: fileURL)
      else {
        print("Failed to read teachers file")
        return []
    }

    return (try? JSONDecoder().decode([Teacher].self, from: data)) ?? []
  }()

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    teachers.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "TeacherCell",
      for: indexPath) as? TeacherTableViewCell
      else {
        print("This type of cell is not defined")
        return UITableViewCell()
    }

    cell.setTeacher(teachers[indexPath.row])

    return cell
  }

  // MARK: - Navigation

  @IBSegueAction func showDetail(_ coder: NSCoder, sender: Any?) -> UIViewController? {
    guard
      let cell = sender as? TeacherTableViewCell,
      let indexPath = tableView.indexPath(for: cell)
      else {
        return nil
    }

    tableView.deselectRow(at: indexPath, animated: true)

    return TeacherDetailViewController(coder: coder, teacher: teachers[indexPath.row])
  }
}
