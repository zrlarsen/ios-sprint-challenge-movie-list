//
//  listOfMoviesViewController.swift
//  Movie List
//
//  Created by Zack Larsen on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class listOfMoviesViewController: UITableViewController, MovieListDelegate {
    let movieController = MovieController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func toggleSeenButton(on cell: seenTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let seenButton = movieController.movies[indexPath.row]
        
        movieController.toggleHasSeen(seenButton: seenButton)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        //let seenButton =
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? seenTableViewCell else { return UITableViewCell() }
        
        let movie = movieController.movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewMovie" {
            guard let destinationVC = segue.destination as? addMovieViewController else { return }
            
            destinationVC.movieController = movieController
        }
    }
    
}




