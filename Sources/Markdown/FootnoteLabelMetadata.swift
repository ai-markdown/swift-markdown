import cmark_gfm

/// Derive raw MDAST fields from actual footnote source labels; compute the identifier without first decoding the label.
package struct FootnoteLabelMetadata: Sendable {
    package let identifier: String
    package let label: String

    /// Parser source labels contain no NUL. Explicitly reject programmatic input outside the C label domain rather than truncating it.
    package init?(rawSource: String) {
        guard !rawSource.utf8.contains(0), rawSource.utf8.count <= Int32.max else { return nil }
        var count = 0
        guard let decoded = rawSource.withCString({ cmark_decode_reference_label($0, rawSource.utf8.count, &count) }) else { return nil }
        defer { cmark_decoded_reference_label_free(decoded) }
        label = String(decoding: UnsafeBufferPointer(start: decoded, count: count), as: UTF8.self)
        if let normalized = cmark_reference_identifier(rawSource) {
            defer { cmark_reference_identifier_free(normalized) }
            identifier = String(cString: normalized)
        } else { identifier = "" }
    }
}
