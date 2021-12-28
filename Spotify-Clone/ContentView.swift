//
//  ContentView.swift
//  Spotify-Clone
//  Created by Manav Deep Singh Lamba on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Background()
            VStack {
                Cover()
                
                VStack{
                    ArtistInfo()
                    Controls()
                    
                    VStack(spacing: 24){
                        Track(name: "Punjabi Top Hits", artists: "Diljit Dosanjh", explicit: false, playing: false)
                        
                        Track(name: "G.O.A.T.", artists: "Diljit Dosanjh", explicit: false, playing: true)
                        
                        Track(name: "Navi Navi Yaari", artists: "Diljit Dosanjh", explicit: false, playing: false)
                        
                        Track(name: "Taare", artists: "Diljit Dosanjh", explicit: false, playing: false)
                        Track(name: "Born to Shine", artists: "Diljit Dosanjh", explicit: false, playing: false)
                    }.padding(.top)
                }
                Spacer()
            }
            
            VStack{
                MediaPlayer()
                Menu()
            }
            .background(Color(#colorLiteral(red: 0.1568410099, green: 0.1568752527, blue: 0.1568388343, alpha: 1)))
            .offset(y: UIScreen.main.bounds.height / 2 - 75)
            
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Background: View{
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1407667696, green: 0.5089942217, blue: 0.5972044468, alpha: 1)), Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Cover: View{
    var body: some View{
        ZStack(alignment: .top){
            Image("profilepic")
                .resizable()
                .frame(width: 220, height: 220)
                .shadow(radius: 5)
            
            Image(systemName: "chevron.left")
                .offset(x: -165)
                .font(.system(size: 20))
        }
    }
}

struct ArtistInfo: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("G.O.A.T.")
                    .font(.system(size: 25, weight: .bold))
                
                HStack{
                    Image("diljit")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    Text("Diljit Dosanjh")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        }
    }
}

struct Controls: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("Album")
                    Circle()
                        .frame(width: 3, height: 3)
                    Text("2020")
                }
                
                HStack(spacing: 25){
                    Image(systemName: "heart")
                    Image(systemName: "arrow.down.circle")
                    Image(systemName: "ellipsis")
                }
                .font(.system(size: 25))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            .font(.system(size: 14))
            
            Spacer()
            
            ZStack(alignment: .bottomTrailing){
                ZStack{
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                
                ZStack{
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Image(systemName: "shuffle")
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                        .font(.system(size: 10))
                }
            }
        }.padding(.horizontal)
    }
}

struct Track: View{
    let name: String
    let artists: String
    let explicit: Bool
    let playing: Bool
    
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .font(.system(size: 14))
                    .foregroundColor(playing ? Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)) : .white)
                
                HStack{
                    
                    if explicit{
                        Image(systemName: "e.square.fill")
                    }
                    
                    Text(artists)
                        .font(.system(size: 12))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal)
    }
}

struct MediaPlayer: View{
    var body: some View{
        HStack{
            HStack{
                Image("profilepic")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading){
                    Text("G.O.A.T.")
                    Text("Diljit Dosanjh")
                        .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                }
                .font(.system(size: 14))
            }
            
            Spacer()
            
            HStack(spacing: 35){
                Image(systemName: "hifispeaker")
                    .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                Image(systemName: "play.fill")
            }
            .font(.system(size: 25))
            .padding(.trailing)
        }
        .border(Color.black, width: 0.3)
    }
}

struct Menu: View{
    var body: some View{
        HStack{
            
            VStack(spacing: 8){
                Image(systemName: "house")
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                
                Text("Search")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "text.justifyright")
                    .rotationEffect(.degrees(90))
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
        }
        .padding(.bottom, 30)
        .padding(.top, 2)
        .padding(.horizontal, 40)
    }
}

