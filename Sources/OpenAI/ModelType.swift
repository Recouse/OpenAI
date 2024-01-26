//
//  ModelType.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

public enum ModelType: String, Codable {
    // MARK: - Whisper
    
    /// Whisper is a general-purpose speech recognition model.
    case whisper1 = "whisper-1"
    
    // MARK: - Embeddings
    
    /// Most capable embedding model for both english and non-english tasks.
    /// * Output dimension: 3,072
    case text_embedding_3_large = "text-embedding-3-large"
    
    /// Increased performance over 2nd generation ada embedding model
    /// * Output dimension: 1,536
    case text_embedding_3_small = "text-embedding-3-small"
    
    /// Most capable 2nd generation embedding model, replacing 16 first generation models.
    /// * Output dimension: 1,536
    case text_embedding_ada_002 = "text-embedding-ada-002"
    
    // MARK: - Moderation
    
    /// Currently points to text-moderation-007.
    /// * Max tokens: 32,768
    case text_moderation_latest = "text-moderation-latest"
    
    /// Currently points to text-moderation-007.
    /// * Max tokens: 32,768
    case text_moderation_stable = "text-moderation-stable"
    
    /// Most capable moderation model across all categories.
    /// * Max tokens: 32,768
    case text_moderation_007 = "text-moderation-007"
    
    // MARK: - GPT base
    
    /// Replacement for the GPT-3 ada and babbage base models.
    /// * Max tokens: 16,384
    /// * Training data: Up to Sep 2021
    case babbage_002 = "babbage-002"
    
    /// Replacement for the GPT-3 curie and davinci base models.
    /// * Max tokens: 16,384
    /// * Training data: Up to Sep 2021
    case davinci_002 = "davinci-002"
}
