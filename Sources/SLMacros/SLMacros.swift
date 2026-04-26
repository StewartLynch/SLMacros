
import Foundation

@freestanding(expression)
public macro URL(_ stringLiteral: String) -> URL = #externalMacro(module: "SLMacrosMacros", type: "URLMacro")

@attached(member, names: named(id))
@attached(extension, conformances: Identifiable)
public macro CaseIdentifiable() = #externalMacro(module: "SLMacrosMacros", type: "CaseIdentifiableMacro")
