//
//  ModelType.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

public enum ModelType: String, Codable {
    
    
    // MARK: - GTP-3.5
    
    /// Optimized for code-completion tasks
    /// * Max tokens: 8,001
    /// * Training data: Up to Jun 2021
    case code_davinci_002 = "code-davinci-002"
    
    // MARK: - Whisper
    
    /// Whisper is a general-purpose speech recognition model.
    case whisper1 = "whisper-1"
    
    // MARK: - Embeddings
    
    /// Embeddings are a numerical representation of text that can be used to measure the relateness between two pieces of text.
    case text_embedding_ada_002 = "text-embedding-ada-002"
    
    // MARK: - Moderation
    
    /// Most capable moderation model. Accuracy will be slighlty higher than the stable model.
    case text_moderation_latest = "text-moderation-latest"
    
    /// Almost as capable as the latest model, but slightly older.
    case text_moderation_stable = "text-moderation-stable"
    
    // MARK: - GPT-3
    
    /// Most capable GPT-3 model. Can do any task the other models can do, often with higher quality.
    /// * Max tokens: 2,049
    /// * Training data: Up to Oct 2019
    case davinci
    
    /// Very capable, but faster and lower cost than Davinci.
    /// * Max tokens: 2,049
    /// * Training data: Up to Oct 2019
    case curie
    
    /// Capable of straightforward tasks, very fast, and lower cost.
    /// * Max tokens: 2,049
    /// * Training data: Up to Oct 2019
    case babbage
    
    /// Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost.
    /// * Max tokens: 2,049
    /// * Training data: Up to Oct 2019
    case ada
}
