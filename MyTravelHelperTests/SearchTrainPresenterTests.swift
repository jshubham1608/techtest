//
//  SearchTrainPresenterTests.swift
//  MyTravelHelperTests
//
//  Created by Satish on 11/03/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import XCTest
@testable import MyTravelHelper

class SearchTrainPresenterTests: XCTestCase {
    var presenter: SearchTrainPresenter!
    var view = SearchTrainMockView()
    var interactor = SearchTrainInteractorMock()
    
    override func setUp() {
        super.setUp()
      presenter = SearchTrainPresenter()
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }

    func testfetchallStations() {
        
        presenter.fetchallStations()
        presenter.fetchStationFromSource()
        XCTAssertTrue(view.isSaveFetchedStatinsCalled)
        
    }

    override func tearDown() {
        super.tearDown()

        presenter = nil
    }
}


class SearchTrainMockView:PresenterToViewProtocol {
    var isSaveFetchedStatinsCalled = false

    func saveFetchedStations(stations: [Station]?) {
        isSaveFetchedStatinsCalled = true
    }

    func showInvalidSourceOrDestinationAlert() {

    }
    
    func updateLatestTrainList(trainsList: [StationTrain]) {

    }
    
    func showNoTrainsFoundAlert() {

    }
    
    func showNoTrainAvailbilityFromSource() {

    }
    
    func showNoInterNetAvailabilityMessage() {

    }
}

class SearchTrainInteractorMock:PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?

    func fetchallStations() {
        let station = Station(desc: "Belfast Central", latitude: 54.6123, longitude: -5.91744, code: "BFSTC", stationId: 228)
        presenter?.stationListFetched(list: [station])
    }

    func fetchTrainsFromSource(sourceCode: String, destinationCode: String) {
        let train = StationTrain.init(trainCode: "A148", fullName: "Newry", stationCode: "NEWRY", trainDate: "03 Jan 2021", dueIn: 32, lateBy: -1, expArrival: "17:11", expDeparture: "17:13")
        presenter?.fetchedTrainsList(trainsList: [train])
    }
}
