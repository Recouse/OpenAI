//
//  Model.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 01/08/2025.
//

/// Model type to define OpenAI models.
///
/// For more information about models and their capabilities visit https://platform.openai.com/docs/models
public typealias Model = String

// MARK: - o-series

extension Model {
    /// o1 models think before they answer, producing a long internal chain of thought before responding to the user.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o1: Model = "o1"

    /// The o1-pro model uses more compute to think harder and provide consistently better answers.
    ///
    /// o1-pro is available in the Responses API only to enable support for multi-turn model
    /// interactions before responding to API requests, and other advanced API features in the future.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o1_pro: Model = "o1-pro"

    /// o3 is a well-rounded and powerful model across domains.
    ///
    /// Use it to think through multi-step problems that involve analysis across text, code, and images.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o3: Model = "o3"

    /// The o3-pro model uses more compute to think harder and provide consistently better answers.
    ///
    /// o3-pro is available in the Responses API only to enable support for multi-turn model
    /// interactions before responding to API requests, and other advanced API features in the future.
    /// Since o3-pro is designed to tackle tough problems, some requests may take several minutes to
    /// finish. To avoid timeouts, try using background mode.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o3_pro: Model = "o3-pro"

    /// o3-mini is our newest small reasoning model, providing high intelligence at the same cost
    /// and latency targets of o1-mini.
    ///
    /// o3-mini supports key developer features, like Structured Outputs, function calling, and Batch API.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o3_mini: Model = "o3-mini"

    /// o3-deep-research is the most advanced model for deep research, designed to tackle complex,
    /// multi-step research tasks.
    ///
    /// It can search and synthesize information from across the internet as well as from your own data—brought in through MCP connectors.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o3_deep_research: Model = "o3-deep-research"

    /// o4-mini is the latest small o-series model.
    ///
    /// It's optimized for fast, effective reasoning with exceptionally efficient performance in
    /// coding and visual tasks.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o4_mini: Model = "o4-mini"

    /// o4-mini-deep-research is a faster, more affordable deep research model—ideal for tackling
    /// complex, multi-step research tasks.
    ///
    /// It can search and synthesize information from across the internet as well as from your own
    /// data, brought in through MCP connectors.
    ///
    /// * Context window: 200,000
    /// * Max output tokens: 100,000
    public static let o4_mini_deep_research: Model = "o4-mini-deep-research"
}

// MARK: - GPT-5

extension Model {
    /// GPT-5 is a flagship model for coding, reasoning, and agentic tasks across domains.
    ///
    /// * Context window: 400,000
    /// * Max output tokens: 128,000
    public static let gpt5: Model = "gpt-5"

    /// GPT-5 mini is a faster, more cost-efficient version of GPT-5. It's great for well-defined
    /// tasks and precise prompts.
    ///
    /// * Context window: 400,000
    /// * Max output tokens: 128,000
    public static let gpt5_mini: Model = "gpt-5-mini"

    /// GPT-5 Nano is the fastest, cheapest version of GPT-5. It's great for summarization and
    /// classification tasks.
    ///
    /// * Context window: 400,000
    /// * Max output tokens: 128,000
    public static let gpt5_nano: Model = "gpt-5-nano"

    /// GPT-5 Chat points to the GPT-5 snapshot currently used in ChatGPT.
    ///
    /// * Context window: 400,000
    /// * Max output tokens: 128,000
    public static let gpt5_chat: Model = "gpt-5-chat-latest"
}

// MARK: - Open weight models

extension Model {
    /// `gpt-oss-120b` is the most powerful open weight model, which fits into a single H100 GPU
    /// (117B parameters with 5.1B active parameters).
    ///
    /// * Context window: 131,072
    /// * Max output tokens: 131,072
    public static let gpt_oss_120b = "gpt-oss-120b"

    /// `gpt-oss-20b` is a medium-sized open model for low latency, local, or specialized use-cases
    /// (21B parameters with 3.6B active parameters).
    ///
    /// * Context window: 131,072
    /// * Max output tokens: 131,072
    public static let gpt_oss_20b = "gpt-oss-20b"
}

// MARK: - GPT-4.1

extension Model {
    /// GPT-4.1 is a flagship model for complex tasks.
    ///
    /// It is well suited for problem solving across domains.
    /// * Context window: 1,047,576
    /// * Max output tokens: 32,768
    public static let gpt4_1: Model = "gpt-4.1"

    /// GPT-4.1 mini provides a balance between intelligence, speed, and cost that makes it an attractive model for many use cases.
    ///
    /// * Context window: 1,047,576
    /// * Max output tokens: 32,768
    public static let gpt4_1_mini: Model = "gpt-4.1-mini"

    /// GPT-4.1 nano is the fastest, most cost-effective GPT-4.1 model.
    ///
    /// * Context window: 1,047,576
    /// * Max output tokens: 32,768
    public static let gpt4_1_nano: Model = "gpt-4.1-nano"
}

// MARK: - GPT-4o

extension Model {
    /// GPT-4o is a versatile, high-intelligence flagship model.
    ///
    /// It accepts both text and image inputs, and produces text outputs (including Structured Outputs).
    /// It is the best model for most tasks, and is our most capable model outside of our o-series models.
    public static let gpt4o: Model = "gpt-4o"

    public static let gpt4o_2024_11_20: Model = "gpt-4o-2024-11-20"

    public static let gpt4o_2024_05_13: Model = "gpt-4o-2024-05-13"

    /// ChatGPT-4o points to the GPT-4o snapshot currently used in ChatGPT.
    public static let chatgpt4o: Model = "chatgpt-4o-latest"

    /// This is a preview release of the GPT-4o Audio models.
    ///
    /// These models accept audio inputs and outputs, and can be used in the Chat Completions REST API.
    public static let gpt40_audio_preview: Model = "gpt-4o-audio-preview"

    public static let gpt40_audio_preview_2024_12_17: Model = "gpt-4o-audio-preview-2024-12-17"

    public static let gpt40_audio_preview_2024_10_01: Model = "gpt-4o-audio-preview-2024-10-01"

    /// GPT-4o mini (“o” for “omni”) is a fast, affordable small model for focused tasks.
    ///
    /// It accepts both text and image inputs, and produces text outputs (including Structured Outputs).
    /// It is ideal for fine-tuning, and model outputs from a larger model like GPT-4o can be distilled
    /// to GPT-4o-mini to produce similar results at lower cost and latency.
    public static let gpt4o_mini: Model = "gpt-4o-mini"

    /// This is a preview release of the smaller GPT-4o Audio mini model.
    ///
    /// It's designed to input audio or create audio outputs via the REST API.
    public static let gpt4o_mini_audio_preview: Model = "gpt-4o-mini-audio-preview"
}

// MARK: - GTP-4

extension Model {
    /// GPT-4 Turbo is the next generation of GPT-4, an older high-intelligence GPT model.
    ///
    /// It was designed to be a cheaper, better version of GPT-4. Today, we recommend using a newer model like GPT-4o.
    /// * Context window: 128,000
    /// * Training data: Up to Dec 2023
    public static let gpt4_turbo: Model = "gpt-4-turbo"

    /// The latest GPT-4 model intended to reduce cases of "laziness" where the model doesn't complete a task.
    /// * Context window: 128,000
    /// * Training data: Up to Dec 2023
    public static let gpt4_0125_preview: Model = "gpt-4-0125-preview"

    /// Currently points to gpt-4-0125-preview.
    /// * Context window: 128,000
    /// * Training data: Up to Apr 2023
    @available(*, deprecated, renamed: "gpt4_turbo")
    public static let gpt4_turbo_preview: Model = "gpt-4-turbo-preview"

    /// GPT-4 with the ability to understand images, in addition to all other GPT-4 Turbo
    /// capabilities. Returns a maximum of 4,096 output tokens. This is a preview model version
    /// and not suited yet for production traffic.
    /// * Context window: 128,000
    /// * Training data: Up to Apr 2023
    @available(*, deprecated, renamed: "gpt4o", message: "As of June 17, 2024, only existing users of these models will be able to continue using them.")
    public static let gpt4_vision_preview: Model = "gpt-4-vision-preview"

    /// More capable than any GPT-3.5 model, able to do more complex tasks, and optimized for chat.
    /// Will be updated with our latest model iteration.
    /// * Context window: 8,192
    /// * Training data: Up to Sep 2021
    public static let gpt4: Model = "gpt-4"

    /// Snapshot of gpt-4 from June 13th 2023 with function calling data. Unlike gpt-4,
    /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
    /// * Context window: 8,192
    /// * Training data: Up to Dec 2023
    public static let gpt4_0314: Model = "gpt-4-0314"

    /// Same capabilities as the base gpt-4 mode but with 4x the context length.
    /// Will be updated with our latest model iteration.
    /// * Context window: 32,768
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt4o", message: "As of June 17, 2024, only existing users of these models will be able to continue using them.")
    public static let gpt4_32k: Model = "gpt-4-32k"

    /// Snapshot of gpt-4-32 from June 13th 2023. Unlike gpt-4-32k, this model will not receive updates,
    /// and will be deprecated 3 months after a new version is released.
    /// * Context window: 32,768
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt4o", message: "As of June 17, 2024, only existing users of these models will be able to continue using them.")
    public static let gpt4_32k_0613: Model = "gpt-4-32k-0613"
}

// MARK: - GTP-3.5

extension Model {
    /// The latest GPT-3.5 Turbo model with improved instruction following, JSON mode,
    /// reproducible outputs, parallel function calling, and more.
    /// Returns a maximum of 4,096 output tokens.
    /// * Context window: 16,385
    /// * Training data: Up to Sep 2021
    public static let gpt3_5_turbo_1106: Model = "gpt-3.5-turbo-1106"

    /// Most capable GPT-3.5 model and optimized for chat at 1/10th the cost of text-davinci-003.
    /// Will be updated with our latest model iteration.
    /// * Context window: 16,384
    /// * Training data: Up to Sep 2021
    public static let gpt3_5_turbo: Model = "gpt-3.5-turbo"

    /// Same capabilities as the standard `gpt-3.5-turbo` model but with 4 times the context.
    /// * Context window: 16,384
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt3_5_turbo")
    public static let gpt3_5_turbo_16k: Model = "gpt-3.5-turbo-16k"

    /// Similar capabilities as GPT-3 era models. Compatible with legacy Completions endpoint and not Chat Completions.
    /// * Context window: 4,096
    /// * Training data: Up to Sep 2021
    public static let gpt3_5_turbo_instruct: Model = "gpt-3.5-turbo-instruct"

    /// Snapshot of gpt-3.5-turbo from June 13th 2023 with function calling data. Unlike gpt-3.5-turbo,
    /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
    /// * Context window: 4,096
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt3_5_turbo", message: "As of June 17, 2024, only existing users of these models will be able to continue using them.")
    public static let gpt3_5_turbo_0613: Model = "gpt-3.5-turbo-0613"

    /// Snapshot of gpt-3.5-turbo-16k from June 13th 2023. Unlike gpt-3.5-turbo-16k,
    /// this model will not receive updates, and will be deprecated 3 months after a new version is released.
    /// * Context window: 16,384
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt3_5_turbo", message: "As of June 17, 2024, only existing users of these models will be able to continue using them.")
    public static let gpt3_5_turbo_16k_0613: Model = "gpt-3.5-turbo-16k-0613"

    /// Snapshot of gpt-3.5-turbo from March 1st 2023. Unlike gpt-3.5-turbo, this model will not receive updates,
    /// and will only be supported for a three month period ending on June 1st 2023.
    /// * Context window: 4,096
    /// * Training data: Up to Sep 2021
    @available(*, deprecated, renamed: "gpt3_5_turbo", message: "Will be deprecated by OpenAI.")
    public static let gpt3_5_turbo_0301: Model = "gpt-3.5-turbo-0301"
}

// MARK: - Whisper

extension Model {
    /// Whisper is a general-purpose speech recognition model.
    public static let whisper1: Model = "whisper-1"

}

// MARK: - Embeddings

extension Model {
    /// Most capable embedding model for both english and non-english tasks.
    /// * Output dimension: 3,072
    public static let text_embedding_3_large: Model = "text-embedding-3-large"

    /// Increased performance over 2nd generation ada embedding model
    /// * Output dimension: 1,536
    public static let text_embedding_3_small: Model = "text-embedding-3-small"

    /// Most capable 2nd generation embedding model, replacing 16 first generation models.
    /// * Output dimension: 1,536
    public static let text_embedding_ada_002: Model = "text-embedding-ada-002"
}

// MARK: - Moderation

extension Model {
    /// Moderation models are free models designed to detect harmful content.
    ///
    /// This model is the most capable moderation model, accepting images as input as well.
    public static let omni_moderation: Model = "omni-moderation"

    /// Currently points to text-moderation-007.
    /// * Max tokens: 32,768
    @available(*, deprecated, renamed: "omni_moderation", message: "On April 28th, 2025, OpenAI notified developers using text-moderation of its deprecation and removal from the API in six months.")
    public static let text_moderation_latest: Model = "text-moderation-latest"

    /// Currently points to text-moderation-007.
    /// * Max tokens: 32,768
    @available(*, deprecated, renamed: "omni_moderation", message: "On April 28th, 2025, OpenAI notified developers using text-moderation of its deprecation and removal from the API in six months.")
    public static let text_moderation_stable: Model = "text-moderation-stable"

    /// Most capable moderation model across all categories.
    /// * Max tokens: 32,768
    @available(*, deprecated, renamed: "omni_moderation", message: "On April 28th, 2025, OpenAI notified developers using text-moderation of its deprecation and removal from the API in six months.")
    public static let text_moderation_007: Model = "text-moderation-007"
}

// MARK: - GPT base

extension Model {
    /// Replacement for the GPT-3 ada and babbage base models.
    /// * Max tokens: 16,384
    /// * Training data: Up to Sep 2021
    public static let babbage_002: Model = "babbage-002"

    /// Replacement for the GPT-3 curie and davinci base models.
    /// * Max tokens: 16,384
    /// * Training data: Up to Sep 2021
    public static let davinci_002: Model = "davinci-002"
}
