//
//  ContentView.swift
//  Socialdealcasus
//
//  Created by Dan Keerdijk on 15/11/2025.
//

import SwiftUI

struct DealsView: View {
    
    @EnvironmentObject private var viewModel: DealsListViewModel
    @State private var selectedDeal: Deal? = nil
    
    var body: some View {
        VStack (spacing:0) {
            
            NavigationStack{
                //top header
                VStack{
                    Text(L10n.Deal.title)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .frame(height: Layout.topBarHeight)
                .background(Color.theme)
                .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
                .zIndex(1)
                
                Group {
                    if viewModel.isLoading {
                        VStack {
                            Spacer()
                            ProgressView(L10n.Deal.detailLoading)
                            Spacer()
                        }
                    } else if let error = viewModel.errorMessage {
                        VStack(spacing: 12) {
                            Spacer()
                            Text(error)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            Button(L10n.General.tryAgain) {
                                Task { await viewModel.loadDeals() }
                            }
                            Spacer()
                        }
                    } else {
                        //dealsrow items
                        List(viewModel.deals) { deal in
                            
                            DealsRowView(deal: deal)
                                .contentShape(Rectangle())
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .frame(width: UIScreen.main.bounds.width)
                                .onTapGesture {
                                    selectedDeal = deal
                                }
                        }
                        .navigationDestination(item: $selectedDeal) { deal in
                            DealsDetailView(deal: deal)
                        }
                        .listStyle(.plain)
                        .background(Color(.systemGroupedBackground))
                    }
                }
            }
        }
        .task {
            if viewModel.deals.isEmpty {
                await viewModel.loadDeals()
            }
        }
    }
}
