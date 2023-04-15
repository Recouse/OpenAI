//
//  ChatModels.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public extension ChatCompletions {
    enum Model: String, Decodable {
        // MARK: - GTP-4
        
        /// More capable than any GPT-3.5 model, able to do more complex tasks, and optimized for chat.
        /// Will be updated with our latest model iteration.
        /// * Max tokens: 8,192
        /// * Training data: Up to Sep 2021
        case gpt4 = "gpt-4"
        
        /// Snapshot of gpt-4 from March 14th 2023. Unlike gpt-4, this model will not receive updates,
        /// and will only be supported for a three month period ending on June 14th 2023.
        /// * Max tokens: 8,192
        /// * Training data: Up to Sep 2021
        case gpt4_0314 = "gpt-4-0314"
        
        /// Same capabilities as the base gpt-4 mode but with 4x the context length. Will be updated with our latest model iteration.
        /// * Max tokens: 32,768
        /// * Training data: Up to Sep 2021
        case gpt4_32k = "gpt-4-32k"
        
        /// Snapshot of gpt-4-32 from March 14th 2023. Unlike gpt-4-32k, this model will not receive updates,
        /// and will only be supported for a three month period ending on June 14th 2023.
        /// * Max tokens: 32,768
        /// * Training data: Up to Sep 2021
        case gpt4_32k_0314 = "gpt-4-32k-0314"
        
        // MARK: - GTP-3.5
        
        /// Most capable GPT-3.5 model and optimized for chat at 1/10th the cost of text-davinci-003.
        /// Will be updated with our latest model iteration.
        /// * Max tokens: 4,096
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo = "gpt-3.5-turbo"
        
        /// Snapshot of gpt-3.5-turbo from March 1st 2023. Unlike gpt-3.5-turbo, this model will not receive updates,
        /// and will only be supported for a three month period ending on June 1st 2023.
        /// * Max tokens: 4,096
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo_0301 = "gpt-3.5-turbo-0301"
    }
}
