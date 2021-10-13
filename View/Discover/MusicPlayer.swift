//
//  MusicPlayer.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/04.
//

import SwiftUI
import AVKit


struct MusicPlayer : View {

    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["song1"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()

    var body : some View{

        VStack(spacing: 20){

//            Image(uiImage: self.data.count == 0 ? UIImage(named: "itunes")! : UIImage(data: self.data)!)
//            .resizable()
//            .frame(width: self.data.count == 0 ? 250 : nil, height: 250)
//            .cornerRadius(15)

//            Text(self.title).font(.title).padding(.top)
//
//            ZStack(alignment: .leading) {
//
//                Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
//
//                Capsule().fill(Color.red).frame(width: self.width, height: 8)
//                .gesture(DragGesture()
//                    .onChanged({ (value) in
//
//                        let x = value.location.x
//
//                        self.width = x
//
//                    }).onEnded({ (value) in
//
//                        let x = value.location.x
//
//                        let screen = UIScreen.main.bounds.width - 30
//
//                        let percent = x / screen
//
//                        self.player.currentTime = Double(percent) * self.player.duration
//                    }))
//            }
//            .padding(.top)

            HStack{

//                Button(action: {
//
//                    if self.current > 0{
//
//                        self.current -= 1
//
//                        self.ChangeSongs()
//                    }
//
//                }) {
//
//                    Image(systemName: "backward.fill").font(.title)
//
//                }
//
//                    Button(action: {
//
//                        self.player.currentTime -= 15
//
//                    }) {
//
//                        Image(systemName: "gobackward.15").font(.title)
//
//                    }

                    Button(action: {

                        if self.player.isPlaying{

                            self.player.pause()
                            self.playing = false
                        }
                        else{

                            if self.finish{

                                self.player.currentTime = 0
                                self.width = 0
                                self.finish = false

                            }

                            self.player.play()
                            self.playing = true
                        }

                    }) {
                        HStack{
                            
                            ZStack{
                                Image("bung2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(10)
                                if self.playing{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke((Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))), lineWidth: 2)
                                        .frame(width: 70, height: 70)
                                    
                                }
                                
                            }
                           

                            VStack(alignment: .leading){
                                Text("Someone You Loved")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                if self.playing{
                                    Music()
                                        .offset(x: -50)
                                }
//                                HStack{
//                                    if self.playing{
//                                        Text("02:00")
//                                            .font(.caption)
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.blue)
//                                    }
//                                    else{
//                                        Text("02:00")
//                                            .font(.caption)
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.gray)
//                                    }
//
//                                    if self.playing{
//                                        Music()
//                                    }
//                                }
                            }
  
                            
                            Spacer()
                            
//                            Image(systemName: self.playing && !self.finish ? "checkmark.circle.fill" : "play.circle.fill")


                            if self.playing{
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 25,weight: .bold))
                                    .foregroundColor(.blue)
                            }
                            else{
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 25,weight: .bold))
                                    .foregroundColor(.gray.opacity(0.4))
                            }
                            
                        }
                        .padding(.horizontal)
                    }

//                    Button(action: {
//
//                        let increase = self.player.currentTime + 15
//
//                        if increase < self.player.duration{
//
//                            self.player.currentTime = increase
//                        }
//
//                    }) {
//
//                        Image(systemName: "goforward.15").font(.title)
//
//                    }
//
//                    Button(action: {
//
//                        if self.songs.count - 1 != self.current{
//
//                            self.current += 1
//
//                            self.ChangeSongs()
//                        }
//
//                    }) {
//
//                        Image(systemName: "forward.fill").font(.title)
//
//                    }
            }
            .foregroundColor(.black)

        }
        .onAppear {

            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")

            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

            self.player.delegate = self.del

            self.player.prepareToPlay()
            self.getData()

            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in

                if self.player.isPlaying{

                    let screen = UIScreen.main.bounds.width - 30

                    let value = self.player.currentTime / self.player.duration

                    self.width = screen * CGFloat(value)
                }
            }

            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in

                self.finish = true
            }
        }
    }

    func getData(){


        let asset = AVAsset(url: self.player.url!)

        for i in asset.commonMetadata{

            if i.commonKey?.rawValue == "artwork"{

                let data = i.value as! Data
                self.data = data
            }

            if i.commonKey?.rawValue == "title"{

                let title = i.value as! String
                self.title = title
            }
        }
    }

    func ChangeSongs(){

        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")

        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

        self.player.delegate = self.del

        self.data = .init(count: 0)

        self.title = ""

        self.player.prepareToPlay()
        self.getData()

        self.playing = true

        self.finish = false

        self.width = 0

        self.player.play()


    }
}

struct MusicPlayer2 : View {

    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["song2"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()

    var body : some View{

        VStack(spacing: 20){
            
            HStack{

                Button(action: {

                    if self.player.isPlaying{

                        self.player.pause()
                        self.playing = false
                    }
                    else{

                        if self.finish{

                            self.player.currentTime = 0
                            self.width = 0
                            self.finish = false

                        }

                        self.player.play()
                        self.playing = true
                    }

                }) {
                    
                    HStack{
                        
                        ZStack{
                            Image("bung")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .cornerRadius(10)
                            if self.playing{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke((Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))), lineWidth: 2)
                                    .frame(width: 70, height: 70)
                                
                            }
                            
                        }
                        VStack(alignment: .leading){
                            Text("Infinity")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("02:00")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                                    
                        }

                        
                        Spacer()
                        
                        if self.playing{
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 25,weight: .bold))
                                .foregroundColor(.blue)
                        }
                        else{
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 25,weight: .bold))
                                .foregroundColor(.gray.opacity(0.4))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .foregroundColor(.black)

        }
        .onAppear {

            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")

            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

            self.player.delegate = self.del

            self.player.prepareToPlay()
            self.getData()

            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in

                if self.player.isPlaying{

                    let screen = UIScreen.main.bounds.width - 30

                    let value = self.player.currentTime / self.player.duration

                    self.width = screen * CGFloat(value)
                }
            }

            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in

                self.finish = true
            }
        }
    }

    func getData(){


        let asset = AVAsset(url: self.player.url!)

        for i in asset.commonMetadata{

            if i.commonKey?.rawValue == "artwork"{

                let data = i.value as! Data
                self.data = data
            }

            if i.commonKey?.rawValue == "title"{

                let title = i.value as! String
                self.title = title
            }
        }
    }

    func ChangeSongs(){

        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")

        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

        self.player.delegate = self.del

        self.data = .init(count: 0)

        self.title = ""

        self.player.prepareToPlay()
        self.getData()

        self.playing = true

        self.finish = false

        self.width = 0

        self.player.play()


    }
}


class AVdelegate : NSObject,AVAudioPlayerDelegate{

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {

        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}


//struct MusicPlayer: View {
//    @State var audioPlayer: AVAudioPlayer!
//    @State var count = 1
//    var body: some View{
//
//
//        VStack {
//            HStack {
//                Text("MusicPlayer").font(.system(size: 45)).fontWeight(.bold)
//                    .foregroundColor(.black)
//            }
//            HStack {
//                Spacer()
//                Button(action: {
//                    self.audioPlayer.play()
//                }) {
//                    Image(systemName: "play.circle.fill").resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.black)
//                }
//                Spacer()
//                Button(action: {
//                    self.audioPlayer.pause()
//                }) {
//                    Image(systemName: "pause.circle.fill").resizable()
//                        .frame(width: 50, height: 50)
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.black)
//                }
//                Spacer()
//                Button(action: {
//                    if self.count < 3 {
//                        self.count += 1
//                    } else {
//                        self.count = 1
//                    }
//                    let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
//                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//                    self.audioPlayer.play()
//                }) {
//                    Image(systemName: "forward.end").resizable()
//                        .frame(width: 45, height: 45)
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.black)
//                }
//                Spacer()
//            }
//        }
//        .onAppear {
//            let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
//            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }
//    }
//}
