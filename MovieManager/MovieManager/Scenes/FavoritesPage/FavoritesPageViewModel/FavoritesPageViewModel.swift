//
//  FavoritesPageViewModel.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import Foundation
import UIKit

final class FavoritesPageViewModel {
    
    static let leo = ActorModel(image: UIImage(named: "Leo") ?? UIImage(), name: "Leonardo DiCaprio")
    static let joseph = ActorModel(image: UIImage(named: "Joseph") ?? UIImage(), name: "Joseph Gordon-Levitt")
    static let elliot = ActorModel(image: UIImage(named: "Elliot") ?? UIImage(), name: "Elliot Page")
    static let vera = ActorModel(image: UIImage(named: "Vera") ?? UIImage(), name: "Vera Farmiga")
    static let patrick = ActorModel(image: UIImage(named: "Patrick") ?? UIImage(), name: "Patrick Wilson")
    static let brad = ActorModel(image: UIImage(named: "Brad") ?? UIImage(), name: "Brad Pitt")
    static let edward = ActorModel(image: UIImage(named: "Edward") ?? UIImage(), name: "Edward Norton")
    static let evangeline = ActorModel(image: UIImage(named: "Evangeline") ?? UIImage(), name: "Evangeline Lilly")
    static let orlando = ActorModel(image: UIImage(named: "Orlando") ?? UIImage(), name: "Orlando Bloom")
    static let elijah = ActorModel(image: UIImage(named: "Elijah") ?? UIImage(), name: "Elijah Wood")
    static let viggo = ActorModel(image: UIImage(named: "Viggo") ?? UIImage(), name: "Viggo Mortensen")
    static let cate = ActorModel(image: UIImage(named: "Cate") ?? UIImage(), name: "Cate Blanchett")
    static let jodie = ActorModel(image: UIImage(named: "Jodie") ?? UIImage(), name: "Jodie Foster")
    static let anthony = ActorModel(image: UIImage(named: "Anthony") ?? UIImage(), name: "Anthony Hopkins")
    static let bruce = ActorModel(image: UIImage(named: "Bruce") ?? UIImage(), name: "Bruce Willis")
    static let haley = ActorModel(image: UIImage(named: "Haley") ?? UIImage(), name: "Haley Joel Osment")
    static let chirstian = ActorModel(image: UIImage(named: "Christian") ?? UIImage(), name: "Christian Bale")
    static let heath = ActorModel(image: UIImage(named: "Heath") ?? UIImage(), name: "Heath Ledger")


    var movies: [FilmModel] = [
        
        FilmModel(
                image: UIImage(named: "Inception") ?? UIImage(),
                name: "Inception",
                backgroundImage: UIImage(named: "Inception") ?? UIImage(),
                description: "A skilled thief is given a chance to erase his past by planting an idea in someone's mind.",
                genre: [.action, .mystery, .thriller],
                imdbRating: 8.8,
                length: "148 min",
                language: "English",
                rating: "PG-13",
                cast: [leo, joseph, elliot]
            ),
        FilmModel(
                image: UIImage(named: "TheConjuring") ?? UIImage(),
                name: "The Conjuring",
                backgroundImage: UIImage(named: "TheConjuring") ?? UIImage(),
                description: "Paranormal investigators help a family terrorized by a dark force.",
                genre: [.horror, .mystery, .thriller],
                imdbRating: 7.5,
                length: "112 min",
                language: "English",
                rating: "R",
                cast: [vera, patrick]
            ),
        FilmModel(
                image: UIImage(named: "FightClub") ?? UIImage(),
                name: "Fight Club",
                backgroundImage: UIImage(named: "FightClub") ?? UIImage(),
                description: "A depressed man and a soap maker form an underground fight club.",
                genre: [.mystery, .thriller],
                imdbRating: 8.8,
                length: "139 min",
                language: "English",
                rating: "R",
                cast: [brad, edward]
            ),
        FilmModel(
                image: UIImage(named: "TheLordOfRings") ?? UIImage(),
                name: "The Lord of the Rings: The Fellowship of the Ring",
                backgroundImage: UIImage(named: "TheLordOfTheRings") ?? UIImage(),
                description: "A hobbit sets out to destroy a powerful ring to save Middle-earth.",
                genre: [.fantasy, .action],
                imdbRating: 8.8,
                length: "178 min",
                language: "English",
                rating: "PG-13",
                cast: [elijah, viggo, cate, orlando]
            ),
        FilmModel(
                image: UIImage(named: "Interstellar") ?? UIImage(),
                name: "Interstellar",
                backgroundImage: UIImage(named: "Interstellar") ?? UIImage(),
                description: "A group of explorers travel through a wormhole to save humanity.",
                genre: [.action, .mystery, .fantasy],
                imdbRating: 8.6,
                length: "169 min",
                language: "English",
                rating: "PG-13",
                cast: [leo, elliot]
            ),
        FilmModel(
                image: UIImage(named: "ShutterIsland") ?? UIImage(),
                name: "Shutter Island",
                backgroundImage: UIImage(named: "ShutterIsland") ?? UIImage(),
                description: "A U.S. Marshal investigates the disappearance of a patient from a hospital for the criminally insane.",
                genre: [.mystery, .thriller],
                imdbRating: 8.2,
                length: "138 min",
                language: "English",
                rating: "R",
                cast: [leo]
            ),
        FilmModel(
                image: UIImage(named: "Hobbit") ?? UIImage(),
                name: "The Hobbit: An Unexpected Journey",
                backgroundImage: UIImage(named: "Hobbit") ?? UIImage(),
                description: "A hobbit joins a group of dwarves on a quest to reclaim their mountain home.",
                genre: [.fantasy, .action],
                imdbRating: 7.8,
                length: "169 min",
                language: "English",
                rating: "PG-13",
                cast: [elijah, cate]
            ),
        FilmModel(
                image: UIImage(named: "TheSielenceOfLambs") ?? UIImage(),
                name: "The Silence of the Lambs",
                backgroundImage: UIImage(named: "TheSielenceOfLambs") ?? UIImage(),
                description: "A young FBI agent seeks the help of a brilliant, imprisoned cannibal to catch another serial killer.",
                genre: [.mystery, .thriller],
                imdbRating: 8.6,
                length: "118 min",
                language: "English",
                rating: "R",
                cast: [jodie, anthony]
            ),
        FilmModel(
                image: UIImage(named: "TheSixthSense") ?? UIImage(),
                name: "The Sixth Sense",
                backgroundImage: UIImage(named: "TheSixthSense") ?? UIImage(),
                description: "A young boy who can see ghosts seeks help from a disillusioned child psychologist.",
                genre: [.mystery, .thriller],
                imdbRating: 8.1,
                length: "107 min",
                language: "English",
                rating: "PG-13",
                cast: [bruce, haley]
            ),
        FilmModel(
                image: UIImage(named: "TheDarkKnight") ?? UIImage(),
                name: "The Dark Knight",
                backgroundImage: UIImage(named: "TheDarkKnight") ?? UIImage(),
                description: "Batman faces off against the Joker, who is terrorizing Gotham City.",
                genre: [.action, .thriller],
                imdbRating: 9.0,
                length: "152 min",
                language: "English",
                rating: "PG-13",
                cast: [chirstian, heath]
            )
        ]
        
        var numberOfFilms: Int {
            movies.count
        }
        
        func getFilm(at index: Int) -> FilmModel {
            movies[index]
        }
}
