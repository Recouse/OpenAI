//
//  AudioRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 02/08/2025.
//

public struct AudioRequest: Codable, Sendable {
    let format: AudioFormat
    let voice: AudioVoice
}
