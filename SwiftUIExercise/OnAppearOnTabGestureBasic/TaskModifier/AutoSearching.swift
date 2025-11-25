//
//  AutoSearching.swift
//  SwiftUIExercise
//
//  Created by YoonieMac on 11/25/25.
//

import SwiftUI


struct dummyWords {
    static let dummyText = """
            heimish stella seraphic vanilla melody cherish miracle miracle vanilla serendipity masquerade destiny eunoia lovable aurora hello cherish droplet baby sunrise cherish baby haze you illusion apple ideale girlish illusion moonlight droplet way marshmallow sunrise stella blush masquerade bijou miracle sunrise computer flora adorable hello lucy charming iris lucy seraphic like flora grapes hello carnival computer masquerade adorable adolescence ice ice miracle bijou honey cresent aurora baby cherish blush blossom twinkle florence milky shine serendipity blush cherish cream haze twinkle flora grapes honey flora droplet stella laptop ideale masquerade fascinating bijou fabulous haze adorable vanilla bijou charming lucid world lovable way milky ice serendipity blossom bijou marshmallow lucy miracle bijou bijou apple lucid iris girlish adolescence requiem computer banana lovesick twinkle lovesick bijou carnival blush sunrise honey melody lucid flora adolescence cresent pure banana you lucy lucy kitten miracle flora requiem purity baby fabulous carnival droplet lucy melody miracle cresent cherish seraphic ice miracle honey way world carnival bijou twinkle cherish twinkle eunoia vanilla iris aurora girlish masquerade hello world lovesick shine adorable ideale lovesick lovable lucid adolescence apple twinkle requiem twinkle milky illusion blush milky stella lucid ice like way florence honey serendipity iris vanilla heimish heimish lucy cream destiny requiem melody bijou charming shine lovable shine flora honey lovable twinkle aurora heimish illusion way melody bijou heimish fabulous baby eunoia vanilla grapes florence florence carnival pure like masquerade cherish baby banana twinkle you computer fascinating twilight cream milky eunoia girlish sunrise twilight melody requiem shine adolescence droplet cherish illusion girlish illusion apple ice milky haze lucy flutter cherish carnival like vanilla apple blossom aurora adolescence world fabulous carnival twinkle twilight iris charming moonlight cream grapes you grapes world ideale miracle bijou flora illusion destiny twinkle haze droplet you lovesick fascinating ice apple florence grapes hello moonlight computer twilight cherish blush way girlish purity purity marshmallow hello banana pure stella lucy sunrise girlish world aurora like banana flutter marshmallow laptop aurora masquerade charming heimish lucy eunoia aurora requiem you blossom purity heimish carnival purity adolescence sunrise blush heimish florence shine ice way ideale bijou twinkle flora blush marshmallow droplet kitten charming bijou lovable banana like hello flora charming honey baby lovable twilight hello miracle shine blossom milky baby miracle requiem grapes bijou pure blossom purity eunoia blush illusion adorable grapes apple cream apple flora aurora ice you droplet cresent milky cream cream computer melody lucy twilight way moonlight moonlight hello iris kitten lucid carnival world twilight grapes lovesick computer twilight banana pure flutter adorable baby masquerade world adorable illusion lovesick blush lovable twinkle lucid ice pure miracle requiem world bijou florence apple sunrise grapes melody illusion girlish you pure computer droplet miracle florence lovesick cream adolescence purity carnival stella haze flora blush cream ice adolescence serendipity fabulous haze like cresent fabulous florence honey illusion lovable florence pure kitten melody haze baby florence hello ideale shine blush destiny heimish fascinating lucid droplet flutter blush twilight droplet bijou ideale girlish miracle way lucy banana sunrise cream way destiny carnival ideale you cream.
        """
    static let dummywords = textToWords(text: dummyText)
    
    static private func textToWords(text: String) -> [String] {
        let trimmedText = text.trimmingCharacters(in: .punctuationCharacters)
        let wordSet = Set(trimmedText.components(separatedBy: " "))
        return Array(wordSet).map { $0.lowercased() }
    }
}


struct AutoSearching: View {
    
    @State private var searchingText: String = ""
    @State private var matchingResults: [String] = []
    @State private var searchTask: Task<Void, Never>?
    private var theWords: [String] = dummyWords.dummywords
    
    var body: some View {
        NavigationStack {
            TextField("검색어를 입력하세요", text: $searchingText)
                .font(.title3)
                .padding()
                .padding(.horizontal, 10)
                .textFieldStyle(.roundedBorder)
            List {
                ForEach($matchingResults, id: \.self) { $word in
                    Text(word)
                }//: ForEach
            }//: List
            .navigationTitle("검색 리스트")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
        .onChange(of: searchingText) { (oldValue, newValue) in
            searchTask?.cancel()
            searchTask = Task {
                try? await Task.sleep(for: .seconds(1))
                
                if !Task.isCancelled {
                    matchingResults = matchingWords(searchTerm: newValue)
                }
            }
        }
    }
    private func matchingWords(searchTerm: String) -> [String] {
        return theWords.filter { $0.contains(searchTerm.lowercased()) }
    }
}

#Preview {
    AutoSearching()
}
