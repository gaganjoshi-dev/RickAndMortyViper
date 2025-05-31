//
//  NetworkChecker.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-31.
//


import Network

class NetworkChecker {
    static func isConnected() -> Bool {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        var status: NWPath.Status = .requiresConnection
        monitor.start(queue: queue)
        let group = DispatchGroup()
        group.enter()
        monitor.pathUpdateHandler = { path in
            status = path.status
            monitor.cancel()
            group.leave()
        }
        group.wait()
        return status == .satisfied
    }
}
