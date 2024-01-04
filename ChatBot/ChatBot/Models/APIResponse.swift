//
//  APIResponse.swift
//  ChatBot
//
//  Created by 동준 on 1/4/24.
//

import Foundation

struct APIResponse: Decodable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let systemFingerprint: String
    let choices: [Choice]
    let usage: Usage
    
    enum CodingKeys: String, CodingKey {
        case id, object, created, model, choices, usage
        case systemFingerprint = "system_fingerprint"
    }
}

struct Choice: Decodable {
    let index: Int
    let message: Message
    let logprobs: LogProbs?
    let finishReason: String
    
    enum CodingKeys: String, CodingKey {
        case index, message, logprobs
        case finishReason = "finish_reason"
    }
}

struct Usage: Decodable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

struct LogProbs: Decodable {
    let content: [Content]?
    let topLogprobs: [TopLogProbs]?
    
    struct Content: Decodable {
        let token: String
        let logprob: Double
        let bytes: [Int]?
    }
    
    struct TopLogProbs: Decodable {
        let token: String
        let logprob: Double
    }
}
