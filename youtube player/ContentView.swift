//
//  ContentView.swift
//  youtube player
//
//  Created by Susumu Hoshikawa on 2020/11/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerSize: CGSize = .zero
    @State private var selected: Video = .guitar
    
    var body: some View {
        VStack {
            PlayerView()
                .frame(
                    width: playerSize.width,
                    height: playerSize.height
                )
        }
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero
            
            // 縦横比が16:9になるように高さを調整.
            playerSize = CGSize(
                width: frame.width,
                height: frame.width / 16 * 9
            )
        }
    }
}

enum Video: String, CaseIterable {
    
    case guitar
    case nirvana
    case amaiyume
    
    var videoId: String {
        switch self {
        case .guitar: return "QW2TfV20FXY"
        case .nirvana: return "hTWKbfoikeg"
        case .amaiyume: return "Y-ou8d-wMoI"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
