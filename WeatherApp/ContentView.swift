//
//  ContentView.swift
//  WeatherApp
//
//  Created by Valmir Garcia on 25/10/24.
//


import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    
    var body: some View {
        ZStack{
            BackgroundStyle(isNight: isNight)
            
            
            VStack{
                
                CityName(city: "São Paulo")
                
                TemperatureView(weatherIcon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "35ºC")
                
                
                HStack(spacing: 20.0) {
                    WeatherDayView(
                        dayOfWeek: "Seg", weatherIcon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "25ºC")
                    
                    WeatherDayView(
                        dayOfWeek: "Ter", weatherIcon: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: "35ºC")
                    
                    WeatherDayView(
                        dayOfWeek: "Qua", weatherIcon: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: "33ºC")
                    
                    WeatherDayView(
                        dayOfWeek: "Qui", weatherIcon: "cloud.rain.fill", temperature: "28ºC")
                    
                    WeatherDayView(
                        dayOfWeek: "Sex", weatherIcon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "25ºC")
                    }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Trocar Hora", textColor: .blue, backgroundColor: .white)
                        
                }
                Spacer()
                    }
                }
            }
        }



#Preview {
    ContentView()
}


struct WeatherDayView: View {
    
    var dayOfWeek: String;
    var weatherIcon: String;
    var temperature: String;
    
    var body: some View {
        VStack{
            
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(10)
            
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(temperature)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundStyle: View {
    
    var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}


struct CityName: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 50)
    }
}

struct TemperatureView: View {
    
    var weatherIcon: String;
    var temperature: String;
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text(temperature)
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .bold, design: .default))
            .foregroundStyle(textColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(20)
    }
}
