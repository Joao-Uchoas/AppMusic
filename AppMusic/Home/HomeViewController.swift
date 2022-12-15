import UIKit

class HomeViewController: UIViewController {

    var customView: HomeView?

    override func loadView() {
        self.customView = HomeView()
        configTableview()
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

    }

    private func configTableview(){
        customView?.tableView.delegate = self
        customView?.tableView.dataSource = self
    }



}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeView.Cell.identifier, for: indexPath) as? HomeView.Cell
        cell?.setupCell(data:  CardData[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}

