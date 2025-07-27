/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@attached(member)
public macro Inspectable() = #externalMacro(
  module: "ViewInspectorHelperMacros",
  type: "InspectableMacro"
)


