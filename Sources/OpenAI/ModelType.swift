//
//  ModelType.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

public enum ModelType: String, Codable {
    // MARK: - GTP-4
    
    /// More capable than any GPT-3.5 model, able to do more complex tasks, and optimized for chat. Will be updated with our latest model iteration.
    /// Max tokens: 8,192
    case gpt4 = "gpt-4"
    
    /// Snapshot of gpt-4 from March 14th 2023. Unlike gpt-4, this model will not receive updates, and will only be supported for a three month period ending on June 14th 2023.
    /// Max tokens: 8,192
    case gpt4_0314 = "gpt-4-0314"
    
    /// Same capabilities as the base gpt-4 mode but with 4x the context length. Will be updated with our latest model iteration.
    /// Max tokens: 32,768
    case gpt4_32k = "gpt-4-32k"
    
    /// Snapshot of gpt-4-32 from March 14th 2023. Unlike gpt-4-32k, this model will not receive updates, and will only be supported for a three month period ending on June 14th 2023.
    /// Max tokens: 32,768
    case gpt4_32k_0314 = "gpt-4-32k-0314"
    
    // MARK: - GTP-3.5
    
    /// Most capable GPT-3.5 model and optimized for chat at 1/10th the cost of text-davinci-003. Will be updated with our latest model iteration.
    /// Max tokens: 4,096
    case gpt35_turbo = "gpt-3.5-turbo"
    
    /// Snapshot of gpt-3.5-turbo from March 1st 2023. Unlike gpt-3.5-turbo, this model will not receive updates, and will only be supported for a three month period ending on June 1st 2023.
    /// Max tokens: 4,096
    case gpt35_turbo_0301 = "gpt-3.5-turbo-0301"
    
    /// Can do any language task with better quality, longer output, and consistent instruction-following than the curie, babbage, or ada models. Also supports inserting completions within text.
    /// Max tokens: 4,097
    case text_davinci_003 = "text-davinci-003"
    
    /// Similar capabilities to text-davinci-003 but trained with supervised fine-tuning instead of reinforcement learning
    /// Max tokens: 4,097
    case text_davinci_002 = "text-davinci-002"
    
    /// Optimized for code-completion tasks
    /// Max tokens: 8,001
    case code_davinci_002 = "code-davinci-002"

}
