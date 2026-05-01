//
//  TodayViewModelTest.swift
//  NASAAPODTests
//
//  Created by Arjun on 01/05/26.
//

import Testing
@testable import NASAAPOD
import Foundation
@MainActor
struct TodayViewModelTest {

    @Test
    func loadTodayAPODSuccessUpdatesAPODDetails() async {
        let repository = MockAPODRepository(
            result: .success(
                APODFetchResult(
                    apod: .mock,
                    source: .remote
                )
            )
        )

        let viewModel =  TodayViewModel(repository: repository)

        await viewModel.loadTodayAPOD()

        #expect(viewModel.todayAPODDetails == .mock)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.isShowingCachedData == false)
    }

    @Test
    func loadTodayAPODCacheResultShowsCachedFlag() async {
        let repository = MockAPODRepository(
            result: .success(
                APODFetchResult(
                    apod: .mock,
                    source: .cache
                )
            )
        )

        let viewModel = TodayViewModel(repository: repository)

        await viewModel.loadTodayAPOD()

        #expect(viewModel.todayAPODDetails == .mock)
        #expect(viewModel.isShowingCachedData == true)
    }

    @Test
    func loadTodayAPODFailureSetsErrorMessage() async {
        let repository = MockAPODRepository(
            result: .failure(URLError(.badServerResponse))
        )

        let viewModel = TodayViewModel(repository: repository)

        await viewModel.loadTodayAPOD()

        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.isLoading == false)
    }
}
