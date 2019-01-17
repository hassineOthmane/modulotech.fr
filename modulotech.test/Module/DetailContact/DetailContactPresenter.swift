//
//  DetailContactPresenter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// DetailContact Module Presenter
class DetailContactPresenter {
    
    weak private var _view: DetailContactViewProtocol?
    private var interactor: DetailContactInteractorProtocol
    private var wireframe: DetailContactRouterProtocol
    
    init(view: DetailContactViewProtocol) {
        self._view = view
        self.interactor = DetailContactInteractor()
        self.wireframe = DetailContactRouter()
    }
}

// MARK: - extending DetailContactPresenter to implement it's protocol
extension DetailContactPresenter: DetailContactPresenterProtocol {
    
}
