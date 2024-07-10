//
//  MovieDetails.swift
//  SummerProject
//
//  Created by Claude White on 2024-07-09.
//

import SwiftUI

struct MovieDetails: View {
    @State private var movie: Movie?
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                ProgressView()
            } else if let movie = movie {
                VStack(alignment: .center, spacing: 10) {
                    Text(movie.title)
                        .font(.title)
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.posterPath)"), scale: 1) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView().background(Color.gray)
                    }
                    .cornerRadius(15)
                    .frame(width: 200, height: 300)
                    Text(movie.overview)
                        .font(.body)
                }
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                Text("No movie data available")
            }
        }
        .task {
            await fetchMovieDetails()
        }
    }

    private func fetchMovieDetails() async {
        isLoading = true
        defer { isLoading = false }

        let dataFetcher = FetchData()
        do {
            movie = try await dataFetcher.getMovieDetails(movieId: 519182)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    MovieDetails()
}
