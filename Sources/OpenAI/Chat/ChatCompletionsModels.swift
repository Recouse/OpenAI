//
//  ChatModels.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public extension ChatCompletions {
    enum Model: String, Decodable {
        // MARK: - GTP-4
        
        /// The latest GPT-4 model intended to reduce cases of "laziness" where the model doesn't complete a task.
        /// * Context window: 128,000
        /// * Training data: Up to Apr 2023
        case gpt4_0125_preview = "gpt-4-0125-preview"
        
        /// Currently points to gpt-4-0125-preview.
        /// * Context window: 128,000
        /// * Training data: Up to Apr 2023
        case gpt4_turbo_preview = "gpt-4-turbo-preview"
        
        /// GPT-4 Turbo model featuring improved instruction following, JSON mode, reproducible outputs,
        /// parallel function calling, and more. Returns a maximum of 4,096 output tokens.
        /// This preview model is not yet suited for production traffic.
        /// * Context window: 128,000
        /// * Training data: Up to Apr 2023
        case gpt4_1106_preview = "gpt-4-1106-preview"
        
        /// GPT-4 with the ability to understand images, in addition to all other GPT-4 Turbo
        /// capabilities. Returns a maximum of 4,096 output tokens. This is a preview model version
        /// and not suited yet for production traffic.
        /// * Context window: 128,000
        /// * Training data: Up to Apr 2023
        case gpt4_vision_preview = "gpt-4-vision-preview"
        
        /// More capable than any GPT-3.5 model, able to do more complex tasks, and optimized for chat.
        /// Will be updated with our latest model iteration.
        /// * Context window: 8,192
        /// * Training data: Up to Sep 2021
        case gpt4 = "gpt-4"
        
        /// Snapshot of gpt-4 from June 13th 2023 with function calling data. Unlike gpt-4,
        /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
        /// * Context window: 8,192
        /// * Training data: Up to Sep 2021
        case gpt4_0613 = "gpt-4-0613"
        
        /// Same capabilities as the base gpt-4 mode but with 4x the context length.
        /// Will be updated with our latest model iteration.
        /// * Context window: 32,768
        /// * Training data: Up to Sep 2021
        case gpt4_32k = "gpt-4-32k"
        
        /// Snapshot of gpt-4-32 from June 13th 2023. Unlike gpt-4-32k, this model will not receive updates,
        /// and will be deprecated 3 months after a new version is released.
        /// * Context window: 32,768
        /// * Training data: Up to Sep 2021
        case gpt4_32k_0613 = "gpt-4-32k-0613"
        
        // MARK: - GTP-3.5
        
        /// The latest GPT-3.5 Turbo model with improved instruction following, JSON mode,
        /// reproducible outputs, parallel function calling, and more.
        /// Returns a maximum of 4,096 output tokens.
        /// * Context window: 16,385
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo_1106 = "gpt-3.5-turbo-1106"
        
        /// Most capable GPT-3.5 model and optimized for chat at 1/10th the cost of text-davinci-003.
        /// Will be updated with our latest model iteration.
        /// * Context window: 4,096
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo = "gpt-3.5-turbo"
        
        /// Same capabilities as the standard `gpt-3.5-turbo` model but with 4 times the context.
        /// * Context window: 16,384
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo_16k = "gpt-3.5-turbo-16k"
        
        /// Similar capabilities as GPT-3 era models. Compatible with legacy Completions endpoint and not Chat Completions.
        /// * Context window: 4,096
        /// * Training data: Up to Sep 2021
        case gpt3_5_turbo_instruct = "gpt-3.5-turbo-instruct"
        
        /// Snapshot of gpt-3.5-turbo from June 13th 2023 with function calling data. Unlike gpt-3.5-turbo,
        /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
        /// * Context window: 4,096
        /// * Training data: Up to Sep 2021
        @available(*, deprecated, renamed: "gpt3_5_turbo_1106", message: "Will be deprecated by OpenAI.")
        case gpt3_5_turbo_0613 = "gpt-3.5-turbo-0613"
        
        /// Snapshot of gpt-3.5-turbo-16k from June 13th 2023. Unlike gpt-3.5-turbo-16k,
        /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
        /// * Context window: 16,384
        /// * Training data: Up to Sep 2021
        @available(*, deprecated, renamed: "gpt3_5_turbo_1106", message: "Will be deprecated by OpenAI.")
        case gpt3_5_turbo_16k_0613 = "gpt-3.5-turbo-16k-0613"
        
        /// Snapshot of gpt-3.5-turbo from March 1st 2023. Unlike gpt-3.5-turbo, this model will not receive updates,
        /// and will only be supported for a three month period ending on June 1st 2023.
        /// * Context window: 4,096
        /// * Training data: Up to Sep 2021
        @available(*, deprecated, renamed: "gpt3_5_turbo_1106", message: "Will be deprecated by OpenAI.")
        case gpt3_5_turbo_0301 = "gpt-3.5-turbo-0301"
    }
}
