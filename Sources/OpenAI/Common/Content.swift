//
//  Content.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 08/08/2025.
//

public enum Content: Encodable, Sendable {
    case text(String)
    case content(InputContent)

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .text(let text):
            try container.encode(text)
        case .content(let content):
            try container.encode(content)
        }
    }
}

public enum InputContent: Encodable, Sendable {
    case inputText(TextInput)
    case inputImage(ImageInput)
    case inputFile(FileInput)

    enum TypeCodingKeys: String, CodingKey {
        case type
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .inputText(let textInput):
            try container.encode(textInput)
        case .inputImage(let imageInput):
            try container.encode(imageInput)
        case .inputFile(let fileInput):
            try container.encode(fileInput)
        }

    }
}

/// A text input to the model.
public struct TextInput: Codable, Sendable {
    /// The text input to the model.
    public let text: String

    /// The type of the input item. Always `input_text`.
    public let type: ContentType

    enum CodingKeys: CodingKey {
        case text
        case type
    }

    public init(text: String) {
        self.text = text
        self.type = .inputText
    }
}

/// An image input to the model.
public struct ImageInput: Codable, Sendable {
    /// The detail level of the image to be sent to the model.
    ///
    /// One of `high`, `low`, or `auto`. Defaults to `auto`.
    public let detail: ImageDetail

    /// The type of the input item. Always `input_image`.
    public let type: ContentType

    /// The ID of the file to be sent to the model.
    public let fileId: String?

    /// The URL of the image to be sent to the model.
    ///
    /// A fully qualified URL or base64 encoded image in a data URL.
    public let imageUrl: String?

    public init(detail: ImageDetail = .auto, fileId: String? = nil, imageUrl: String? = nil) {
        self.detail = detail
        self.type = .inputImage
        self.fileId = fileId
        self.imageUrl = imageUrl
    }
}

/// A file input to the model.
public struct FileInput: Codable, Sendable {
    /// The type of the input item. Always `input_file`.
    public let type: ContentType

    /// The content of the file to be sent to the model.
    public let fileData: String?

    /// The ID of the file to be sent to the model.
    public let fileId: String?

    /// The URL of the file to be sent to the model.
    public let fileUrl: String?

    /// The name of the file to be sent to the model.
    public let filename: String?

    public init(
        fileData: String? = nil,
        fileId: String? = nil,
        fileUrl: String? = nil,
        filename: String? = nil
    ) {
        self.type = .inputFile
        self.fileData = fileData
        self.fileId = fileId
        self.fileUrl = fileUrl
        self.filename = filename
    }
}

public enum ContentType: String, Codable, Sendable {
    case inputText = "input_text"
    case outputText = "output_text"
    case inputFile = "input_file"
    case inputImage = "input_image"
}


public enum ImageDetail: String, Codable, Sendable {
    case auto, low, high
}
