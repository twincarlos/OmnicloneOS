import SwiftUI

struct TournamentView: View {
    let groupTournament: GroupTournament
    @State private var tournament: Tournament? = nil
    
    var body: some View {
            TabView() {
                NavigationStack {
                    ScrollView {
                        VStack {
                            Text(tournament?.name ?? "")
                            Text(groupTournament.date)
                                .font(.caption)
                        }
                        VStack(spacing: 0) {
                            ForEach(tournament?.players.indices ?? 0..<0, id: \.self) { index in
                                let player = tournament?.players[index]
                                NavigationLink(value: "Hello", label: {
                                    VStack(alignment: .leading) {
                                        Text("\(player!.rating)")
                                            .font(.caption)
                                        Text(player!.name)
                                    }
                                    .padding(5)
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                Divider()
                            }
                        }
                        .background(Color("SecondaryBackgroundColor"))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColorGradient1"), Color("BackgroundColorGradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Players")
                }
                NavigationStack {
                    ScrollView {
                        VStack {
                            Text(tournament?.name ?? "")
                            Text(groupTournament.date)
                                .font(.caption)
                        }
                        .padding(.bottom)
                        VStack(alignment: .leading) {
                            ForEach(tournament?.events ?? [], id: \.self) { event in
                                Section(header: VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        Text(event.name)
                                            .font(.caption)
                                            .bold()
                                        Text("\(event.date) - \(event.time)")
                                            .font(.caption)
                                    }
                                    .padding(.leading)
                                }) {
                                    VStack(alignment: .leading, spacing: 0) {
                                        ForEach(event.players, id: \.self) { player in
                                            NavigationLink(value: "Hello", label: {
                                                VStack(alignment: .leading) {
                                                    Text("\(player.rating)")
                                                        .font(.caption)
                                                    Text(player.name)
                                                }
                                                .padding(5)
                                            })
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            Divider()
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color("SecondaryBackgroundColor"))
                                    .cornerRadius(10)
                                }
                                Spacer(minLength: 20)
                            }
                        }
                    }
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColorGradient1"), Color("BackgroundColorGradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .tabItem {
                    Image(systemName: "figure.table.tennis")
                    Text("Events")
                }
            }
            .accentColor(.primary)
            .task {
                tournament = await fetchTournament()
            }
    }
    
    func fetchTournament() async -> Tournament {
        let url = URL(string: "https://omniclone-api.onrender.com/omnipong/tournament/\(groupTournament.id)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try! decoder.decode(Tournament.self, from: data)
    }
}

struct Tournament_Previews: PreviewProvider {
    static var previews: some View {
        TournamentView(groupTournament: GroupTournament(status: "Open", id: 4196, name: "Carmel Barrau 2024 International Tournament", city: "Davie", date: "12/13/24", contactUrl: "mailto:cze9359656@aol.com", contactName: "Carlos Zeller & David Bonilla9548495436", ballInfo: "Butterfly R40+", usattRating: "4-Star", state: "Florida"))
    }
}

struct Player: Decodable, Hashable {
    let name: String
    let rating: Int
}

struct Event: Decodable, Hashable {
    let name: String
    let maxSlots: Int
    let date: String
    let time: String
    let players: [Player]
}

struct Tournament: Decodable, Hashable {
    let name: String
    let players: [Player]
    let events: [Event]
}
