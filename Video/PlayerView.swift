//
//  PlayerView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/26.
//

import SwiftUI
import YoutubeKit
struct PlayerView: UIViewRepresentable {
    
    typealias UIViewType = YTSwiftyPlayer
    
    // 初期化処理を記述.
    func makeUIView(context: Context) -> YTSwiftyPlayer {
        // 初期化処理・初期設定.
        let player = YTSwiftyPlayer()
        player.autoplay = true
        return player
    }
    
    // 更新処理を記述.
    func updateUIView(_ uiView: YTSwiftyPlayer, context: Context) {
        // 再生する動画の設定.
        uiView.setPlayerParameters([
            .playsInline(true),
            .videoID("kLmWN3Qsj0A"),
        ])
        uiView.loadPlayer()
    }
}
