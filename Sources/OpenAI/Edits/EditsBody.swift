//
//  EditsBody.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

public extension Edits {
    struct Body: Encodable {
        /// ID of the model to use. You can use the `text-davinci-edit-001` or `code-davinci-edit-001` model with this endpoint.
        public var model: String
        /// The input text to use as a starting point for the edit.
        ///
        /// Example: "What day of the wek is it?"
        public var input: String?
        /// The instruction that tells the model how to edit the prompt.
        ///
        /// Example: "Fix the spelling mistakes."
        public var instruction: String
        /// How many edits to generate for the input and instruction.
        public var n: Int?
        /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
        ///
        /// We generally recommend altering this or `top_p` but not both.
        public var temperature: Double?
        /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
        ///
        /// We generally recommend altering this or `temperature` but not both.
        public var topP: Double?
    }
}

