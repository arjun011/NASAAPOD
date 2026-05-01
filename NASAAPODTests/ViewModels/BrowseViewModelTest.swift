//
//  BrowseViewModelTest.swift
//  NASAAPODTests
//
//  Created by Arjun on 01/05/26.
//

import Testing
import Foundation
@testable import NASAAPOD

@MainActor
struct BrowseViewModelTest {

    @Test
    func loadAPOD_success_updatesState() async {
        let apod = APOD.mock

        let repository = MockAPODRepository(
            result: .success(
                APODFetchResult(apod: apod, source: .remote)
            )
        )

        let viewModel = BrowseViewModel(repository: repository)

        await viewModel.loadAPOD(from: Date())

        #expect(viewModel.apodDetails == apod)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.isShowingCachedData == false)
    }

    @Test
    func loadAPOD_cached_setsCachedFlag() async {
        let apod = APOD.mock

        let repository = MockAPODRepository(
            result: .success(
                APODFetchResult(apod: apod, source: .cache)
            )
        )

        let viewModel = BrowseViewModel(repository: repository)

        await viewModel.loadAPOD(from: Date())

        #expect(viewModel.apodDetails == apod)
        #expect(viewModel.isShowingCachedData == true)
    }

    @Test
    func loadAPOD_failure_setsErrorMessage() async {
        let repository = MockAPODRepository(
            result: .failure(URLError(.badServerResponse))
        )

        let viewModel = BrowseViewModel(repository: repository)

        await viewModel.loadAPOD(from: Date())

        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.isLoading == false)
    }
}
