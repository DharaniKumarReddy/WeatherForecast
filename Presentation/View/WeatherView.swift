//
//  WeatherView.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var city = ""
    @StateObject private var weatherViewModel = DependencyContainer().makeWeatherViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        contentView
        inputSection
    }
    
    @ViewBuilder
    private var inputSection: some View {
        VStack(spacing: 20) {
            TextField("Enter city name...", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .focused($isFocused)
            actionButtonStack
        }
        .padding()
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isFocused = true
            }
        }
    }
    
    private var actionButtonStack: some View {
        HStack(spacing: 30) {
            actionButton(title: "Get Weather", action: handleWeatherSubmit)
            
            actionButton(title: "Get Forecast", action: handleForecastSubmit)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if weatherViewModel.isLoading {
            loadingView
        } else if let error = weatherViewModel.errorMessage {
            errorView(error)
        } else {
            if weatherViewModel.selectedMode == .current {
                weatherInfoView
            } else {
                forecastInfoView
            }
        }
    }
    
    private var loadingView: some View {
        ProgressView()
    }
    
    private func errorView(_ message: String) -> some View {
        Text(message)
            .foregroundColor(.orange)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
    
    private var weatherInfoView: some View {
        VStack(spacing: 8) {
            Text(weatherViewModel.temperature)
                .font(.system(size: 64, weight: .bold))
            Text(weatherViewModel.description)
                .font(.title3)
                .foregroundColor(.gray)
        }
        .onAppear {
            DispatchQueue.main.async {
                city = ""
            }
        }
    }
    
    private var forecastInfoView: some View {
        List($weatherViewModel.list) { entry in
            HStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(DateFormatters.dayTimePeriod.string(from: entry.wrappedValue.date))
                            .font(.headline)
                        Text(entry.wrappedValue.description)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("\(Int(entry.wrappedValue.temperature))°C")
                        .bold()
                }
            }
            .padding(.vertical, 4)
            .onAppear {
                DispatchQueue.main.async {
                    city = ""
                    isFocused = false
                }
            }
        }
    }
    
    private func actionButton(title: String, action: @escaping () -> Void) -> some View {
        Button(title) {
            action()
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(.blue, lineWidth: 2)
        )
        .disabled(weatherViewModel.isLoading)
        .opacity(weatherViewModel.isLoading ? 0.5 : 1.0)
    }
    
    private func handleWeatherSubmit() {
        Task {
            weatherViewModel.selectedMode = .current
            await weatherViewModel.fetchReport(for: city)
        }
    }
    
    private func handleForecastSubmit() {
        Task {
            weatherViewModel.selectedMode = .forecast
            await weatherViewModel.fetchReport(for: city)
        }
    }
}

#Preview {
    WeatherView()
}
