//
//  ContentView.swift
//  Jokey
//
//  Created by Abdelrahman Shehab on 17/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -  PROPERTIES
    @ObservedObject var jokesVM = JokeViewModel()
    
    func addJoke() {
        jokesVM.getJokes(count: 1)
    }
    
    // MARK: -  BODY
    var body: some View {
        NavigationView {
            
            List(jokesVM.jokes) { joke in
                Text(joke.joke)
            }// LIST
            .toolbar {
                Button(action: addJoke) {
                    Text("Get New Joke")
                }
            }
            .navigationTitle("Jokey App")
        }//: NAVIGATION
    }
    
}
// MARK: -  PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
