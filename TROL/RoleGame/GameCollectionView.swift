//
//  GameCollectionView.swift
//  TROL
//
//  Created by MBSoo on 2022/06/15.
//

import SwiftUI

struct GameCollectionView: View {
    let gameName: String
    var body: some View {
        Text("\(gameName)")
    }
}

struct GameCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameCollectionView(gameName: "젓가락 뽑기")
    }
}
