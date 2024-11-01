import SwiftUI

struct HomeView: View {
    
//    @State private var groups: [Group] = []
        @State private var groups: [Group] = [
            Group(
                group: "Florida",
                tournaments: [
                    GroupTournament(
                        status: "Finished",
                        id: 4054,
                        name: "2024 Butterfly September Tournament $5.295 in Prizes",
                        city: "Davie",
                        date: "09/27/24",
                        contactUrl: "mailto:cze9359656@aol.com",
                        contactName: "Carlos Zeller/ David Bonilla9548495436",
                        ballInfo: "Butterfly R40+",
                        usattRating: "4-Star",
                        state: "Florida"
                    ),
                    GroupTournament(
                        status: "Finished",
                        id: 4090,
                        name: "Naples Pong Butterfly October Open 2024",
                        city: "Naples",
                        date: "10/19/24",
                        contactUrl: "mailto:jeff@naplespong.com",
                        contactName: "Jeff Yamada239-296-5876",
                        ballInfo: "Butterfly R40+",
                        usattRating: "1-Star",
                        state: "Florida"
                    ),
                    GroupTournament(
                        status: "Open",
                        id: 4268,
                        name: "NAPLES PONG BUTTERFLY NOVEMBER OPEN 2024",
                        city: "Naples",
                        date: "11/16/24",
                        contactUrl: "mailto:jeff@naplespong.com",
                        contactName: "Jeff Yamada239-296-5876",
                        ballInfo: "Butterfly R40+",
                        usattRating: "1-Star",
                        state: "Florida"
                    ),
                    GroupTournament(
                        status: "Open",
                        id: 4180,
                        name: "Miami Table Tennis Club December 2024 Tournament",
                        city: "Doral",
                        date: "12/07/24",
                        contactUrl: "mailto:ramses@miamittc.com",
                        contactName: "Ramses Gonzalez786-219-7066",
                        ballInfo: "Butterfly R40+",
                        usattRating: "2-Star",
                        state: "Florida"
                    ),
                    GroupTournament(
                        status: "Open",
                        id: 4196,
                        name: "Carmel Barrau 2024 International Tournament",
                        city: "Davie",
                        date: "12/13/24",
                        contactUrl: "mailto:cze9359656@aol.com",
                        contactName: "Carlos Zeller & David Bonilla9548495436",
                        ballInfo: "Butterfly R40+",
                        usattRating: "4-Star",
                        state: "Florida"
                    )
                ]
            ),
            Group(
                group: "Georgia",
                tournaments: [
                    GroupTournament(
                        status: "Finished",
                        id: 4136,
                        name: "East Cobb U1200 Tournament",
                        city: "Marietta",
                        date: "10/20/24",
                        contactUrl: "mailto:ecsports.tournaments@gmail.com",
                        contactName: "Medha Krishna / Amy Feng678-551-2687",
                        ballInfo: "",
                        usattRating: "0-Star",
                        state: "Georgia"
                    ),
                    GroupTournament(
                        status: "TBD",
                        id: 3560,
                        name: "2024 Paddle Palace Winter Giant Round Robin",
                        city: "Norcross",
                        date: "11/09/24",
                        contactUrl: "mailto:wrenglebreth@gmail.com",
                        contactName: "Bill Englebreth7045602441",
                        ballInfo: "Nittaku 3*Premium 40+",
                        usattRating: "3-Star",
                        state: "Georgia"
                    ),
                    GroupTournament(
                        status: "TBD",
                        id: 4140,
                        name: "2024 Atlanta On Demand Tournament",
                        city: "Norcross",
                        date: "11/10/24",
                        contactUrl: "mailto:wrenglebreth@gmail.com",
                        contactName: "Bill Englebreth704-560-2441",
                        ballInfo: "",
                        usattRating: "3-Star",
                        state: "Georgia"
                    ),
                    GroupTournament(
                        status: "Open",
                        id: 4100,
                        name: "East Cobb December (U1750 & U2200) Tournament",
                        city: "Marietta",
                        date: "12/07/24",
                        contactUrl: "mailto:ecsports.tournaments@gmail.com",
                        contactName: "Medha Krishna / Amy Feng678-551-2687",
                        ballInfo: "",
                        usattRating: "1-Star",
                        state: "Georgia"
                    )
                ]
            ),
            Group(
                group: "Hawaii",
                tournaments: [
                    GroupTournament(
                        status: "Open",
                        id: 4078,
                        name: "Hawai'i Island Open",
                        city: "Kamuela",
                        date: "11/16/24",
                        contactUrl: "mailto:len@tabletennisandmore.com",
                        contactName: "Len Winkler602-882-1099",
                        ballInfo: "Nittaku 3*Premium 40+",
                        usattRating: "1-Star",
                        state: "Hawaii"
                    )
                ]
            )
        ]
        @State private var savedPlayer: SavedPlayer? = SavedPlayer(
            id: 6586,
            name: "Carlos Rodriguez",
            currRating: 2023,
            prevRating: 2049,
            ratingDiff: -26,
            lastTournament: "2024 Butterfly September Tournament"
        )
//    @State private var savedPlayer: SavedPlayer? = nil
    @State private var input: String = ""
    
    var filteredGroups: [Group] {
        guard !input.isEmpty else { return groups }
        return groups.map { group in
            let filteredTournaments = group.tournaments.filter { tournament in
                tournament.name.localizedCaseInsensitiveContains(input)
            }
            return Group(group: group.group, tournaments: filteredTournaments)
        }.filter { !$0.tournaments.isEmpty }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if savedPlayer == nil {
                    NavigationLink(value: "Hello", label: {
                        HStack {
                            Image(systemName: "link")
                            Text("Link USATT")
                        }
                        .padding()
                    })
                    .frame(maxWidth: .infinity)
                    .background(Color("SecondaryBackgroundColor"))
                    .cornerRadius(10)
                    .padding(.bottom)
                } else {
                    NavigationLink(value: "Hello", label: {
                        VStack {
                            Text(savedPlayer!.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.secondary)
                            HStack(spacing: 20) {
                                Text("\(savedPlayer!.currRating)")
                                    .frame(alignment: .leading)
                                    .font(.system(.largeTitle, weight: .bold))
                                    .foregroundStyle(.primary)
                                Text(savedPlayer!.ratingDiff > 0 ? "+\(savedPlayer!.ratingDiff)" : "\(savedPlayer!.ratingDiff)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(savedPlayer!.ratingDiff < 0 ? .red : .green)
                            }
                            Text("From: \(savedPlayer!.lastTournament)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                    })
                    .frame(maxWidth: .infinity)
                    .background(Color("SecondaryBackgroundColor"))
                    .cornerRadius(10)
                    .padding(.bottom)
                }
                ForEach(filteredGroups, id: \.self) { group in
                    Section {
                        VStack(alignment: .leading) {
                            ForEach(0..<group.tournaments.count, id: \.self) { index in
                                NavigationLink(value: "Hello", label: {
                                    VStack(alignment: .leading) {
                                        Text(group.tournaments[index].name)
                                        Text(group.tournaments[index].date)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                    .multilineTextAlignment(.leading)
                                })
                                .padding(.leading)
                                .padding(.trailing)
                                .padding(.top, index == 0 ? 10 : 0)
                                .padding(.bottom, index == group.tournaments.count - 1 ? 5 : 0)
                                .frame(alignment: .leading)
                                if index < group.tournaments.count {
                                    Divider()
                                }
                            }
                        }
                        .background(Color("SecondaryBackgroundColor"))
                        .cornerRadius(10)
                    } header: {
                        Text(group.group)
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 30)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .navigationTitle("Tournaments")
            .background(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColorGradient1"), Color("BackgroundColorGradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .searchable(text: $input, prompt: "Search")
        .scrollIndicators(.hidden)
        .accentColor(.primary)
        .task {
//            groups = await fetchGroups()
//            if getPlayerId()! > 0 {
//                await fetchPlayer(getPlayerId()!, getPlayerName()!)
//            }
        }
    }
    
    func fetchGroups() async -> [Group] {
        let url = URL(string: "https://omniclone-api.onrender.com/omnipong/tournaments")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Group].self, from: data)
    }
    
    func savePlayerId(_ playerId: Int,_ playerName: String) async -> Void {
        UserDefaults.standard.set(playerId, forKey: "playerId")
        UserDefaults.standard.set(playerName, forKey: "playerName")
        await fetchPlayer(playerId, playerName)
    }
    
    func removePlayerId() {
        UserDefaults.standard.removeObject(forKey: "playerId")
        UserDefaults.standard.removeObject(forKey: "playerName")
    }
    
    func getPlayerId() -> Int? {
        return UserDefaults.standard.integer(forKey: "playerId")
    }
    
    func getPlayerName() -> String? {
        return UserDefaults.standard.string(forKey: "playerName")
    }
    
    func fetchPlayer(_ playerId: Int,_ playerName: String) async -> Void {
        let url = URL(string: "https://omniclone-api.onrender.com/usatt/get-rating/\(playerId)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let json = try! decoder.decode(FetchedPlayer.self, from: data)
        savedPlayer = SavedPlayer(
            id: playerId,
            name: playerName,
            currRating: json.currRating,
            prevRating: json.prevRating,
            ratingDiff: json.ratingDiff,
            lastTournament: json.lastTournament
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Group: Decodable, Hashable {
    let group: String
    let tournaments: [GroupTournament]
}

struct GroupTournament: Decodable, Hashable {
    let status: String
    let id: Int
    let name: String
    let city: String
    let date: String
    let contactUrl: String
    let contactName: String
    let ballInfo: String
    let usattRating: String
    let state: String
}

struct SavedPlayer: Decodable {
    let id: Int
    let name: String
    let currRating: Int
    let prevRating: Int
    let ratingDiff: Int
    let lastTournament: String
}

struct FetchedPlayer: Codable {
    let currRating: Int
    let prevRating: Int
    let ratingDiff: Int
    let lastTournament: String
}
