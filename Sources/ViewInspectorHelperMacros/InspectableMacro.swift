import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct InspectableMacro: MemberMacro {
  public static func expansion(
    of node: AttributeSyntax,
    providingMembersOf declaration: some DeclGroupSyntax,
    in context: some MacroExpansionContext
  ) throws -> [DeclSyntax] {
    guard let structDecl = declaration.as(StructDeclSyntax.self) else { return [] }
    let typeName = structDecl.name.text
    let inspectionDecl: DeclSyntax = """
      #if DEBUG
        let inspection = "Inspection<\(raw: typeName)>()"
      #endif
      """
    return [inspectionDecl]
  }
}

@main
struct ViewInspectorHelperPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    InspectableMacro.self
  ]
}
