import MacroTesting
import ViewInspectorHelperMacros
import Testing
import ViewInspectorHelper

@Suite(.macros([InspectableMacro.self]))
struct StringifyTests {
  @Test func stringify() {
    assertMacro {
      """
      #stringify(a + b)
      """
    } expansion: {
      """
      (a + b, "a + b")
      """
    }
  }
}
