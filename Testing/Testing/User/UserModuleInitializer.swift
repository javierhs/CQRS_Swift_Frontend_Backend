//
//  UserModuleInitializer.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class UserModuleInitializer: ModuleInitializer {
    private let repository: UserRepository
    private let queryBus: QueryBus
    private let commandBus: CommandBus
    
    init(
        repository: UserRepository,
        queryBus: QueryBus,
        commandBus: CommandBus
    ) {
        self.repository = repository
        self.queryBus = queryBus
        self.commandBus = commandBus
    }
    
    func setup() {
        registerCommandHandlers()
        registerQueryHandlers()
    }
    
    private func registerCommandHandlers() {
        commandBus.register(CreateUserCommandHandler(repository: repository))
    }
    
    private func registerQueryHandlers() {
        queryBus.register(GetUserQueryHandler(repository: repository))
    }
}
