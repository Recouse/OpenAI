//
//  CompletionsModel.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public extension Completions {
    enum Model: String, Decodable {
        // MARK: - GTP-3.5
        
        /// Can do any language task with better quality, longer output,
        /// and consistent instruction-following than the curie, babbage, or ada models.
        /// Also supports inserting completions within text.
        /// * Max tokens: 4,097
        /// * Training data: Up to Jun 2021
        case text_davinci_003 = "text-davinci-003"
        
        /// Similar capabilities to text-davinci-003 but trained with supervised fine-tuning instead of reinforcement learning
        /// * Max tokens: 4,097
        /// * Training data: Up to Jun 2021
        case text_davinci_002 = "text-davinci-002"
        
        // MARK: - GPT-3
        
        /// Very capable, faster and lower cost than Davinci.
        /// * Max tokens: 2,049
        /// * Training data: Up to Oct 2019
        case text_curie_001 = "text-curie-001"
        
        /// Capable of straightforward tasks, very fast, and lower cost.
        /// * Max tokens: 2,049
        /// * Training data: Up to Oct 2019
        case text_babbage_001 = "text-babbage-001"
        
        /// Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost.
        /// * Max tokens: 2,049
        /// * Training data: Up to Oct 2019
        case text_ada_001 = "text-ada-001"
    }
}
