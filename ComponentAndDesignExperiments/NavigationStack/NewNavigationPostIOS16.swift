//
//  NewNavigationPostIOS16.swift
//  ComponentAndDesignExperiments
//
//  Created by Marshall  on 9/21/22.
//

import Foundation
import SwiftUI

//MARK: - NEW WAY
struct NewNavigationSame: View {
    var body: some View {
        
        //Same as old Way but with "Navigation Stack" instead of "Navigation View"
        NavigationStack {
            List {
                NavigationLink("Link to another view") {
                    Text("The aforementioned other view")
                }
            }
        }
    }
}

struct NewNavigationWithDestination: View {
    var body: some View {
        
        //Updated navigationlink to use "value"
        NavigationStack {
            List {
                NavigationLink("NavigationLink with Value", value: "valueA")
            }
            //Needs to be hashable
            .navigationDestination(for: String.self) { string in
                Text(string)
                    .foregroundColor(.red)
            }
        }
    }
}

struct NewNavigationProgramatic: View {
    @State private var path = [String]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("NavigationLink with path", value: "pathValueA")
                
                Button("Navigate to pathValueB") {
                    path.append("pathValueB")
                }
            }
            .navigationDestination(for: String.self) { string in
                VStack {
                    Text(string)
                        .foregroundColor(.red)
                    
                    Button("Navigate to pathValueC") {
                        path.append("pathValueC")
                    }
                    
                    Button("Navigate to pathValueB") {
                        path.append("pathValueB")
                    }
                    
                    Button("Pop to root") {
                        path.removeAll()
                    }
                }
            }
        }
    }
}

struct NewNavigationProgramaticMultipleTypes: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("People") {
                    ForEach(Person.examples) { person in
                        NavigationLink(value: person) {
                            VStack(alignment: .leading
                            ) {
                                Text(person.name)
                                
                                Text(person.age, formatter: .number)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section("Articles") {
                    ForEach(Article.examples) { article in
                        NavigationLink(value: article) {
                            VStack(alignment: .leading
                            ) {
                                Text(article.title)
                                
                                Text(article.author)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Person.self) { person in
                Text(person.name)
                    .font(.headline)
            }
            .navigationDestination(for: Article.self) { article in
                Text(article.title)
                    .font(.headline)
                
                Button("Pop to root") {
                    path.removeLast(path.count)
                }
                
                Button("Navigation to person") {
                    path.append(Person.examples[1])
                }
            }
        }
    }
}


struct Article: Identifiable, Hashable {
    let id = UUID()
    
    let title: String
    let author: String
}

extension Article {
    static let examples: [Article] = [
        .init(title: "Title 1", author: "Author 1"),
        .init(title: "Title 2", author: "Author 2"),
        .init(title: "Title 3", author: "Author 3")
    ]
}

struct Person: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let age: Int
}

extension Person {
    static let examples: [Person] = [
        .init(name: "person1", age: 21),
        .init(name: "person2", age: 22),
        .init(name: "person3", age: 23),
        .init(name: "person4", age: 24)
    ]
}


struct NewNavigation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewNavigationSame()
            NewNavigationWithDestination()
            NewNavigationProgramatic()
            NewNavigationProgramaticMultipleTypes()
        }
    }
}

