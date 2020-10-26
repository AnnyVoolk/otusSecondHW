//
//  CurrentJobScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 30.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct CurrentJobScreen: View {
    
    @ObservedObject var viewModel: CurrentJobViewModel = .init()
    @EnvironmentObject private var navViewModel: NavControllerViewModel
    
    init(id: String?) {
        self.viewModel.id = id
    }
    
    var body: some View {
        VStack {
            if self.viewModel.isPageLoading {
                ActivityIndicatorView(style: .medium)
            } else {
                FakeNavBar(label: viewModel.job?.title ?? "", backAction: { self.viewModel.removeCashJob() })
                Spacer()
                Text(viewModel.job?.company ?? "")
                    .font(.title)
                    .padding()
                Text(viewModel.job?.trimmedDescription ?? "")
                    .font(.body)
                    .lineLimit(6)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                HStack {
                    Spacer()
                    Button(action: self.showFullJobDescription) {
                        Text("Show all description")
                    }
                    .foregroundColor(.blue)
                    .font(.footnote)
                    .padding()
                }
                HStack {
                    Text("Email: \(viewModel.job?.url ?? "")")
                        .font(.footnote)
                        .padding(.leading, 20)
                    Spacer()
                }
                Spacer()
            }
        } .onAppear() {
            self.viewModel.getJobDescription()
        }
    }
    
    func showFullJobDescription() {
        let jobDescriptionScreen = JobDescriptionScreen(description: self.viewModel.job?.trimmedDescription ?? "")
        self.navViewModel.push(jobDescriptionScreen)
    }
}
