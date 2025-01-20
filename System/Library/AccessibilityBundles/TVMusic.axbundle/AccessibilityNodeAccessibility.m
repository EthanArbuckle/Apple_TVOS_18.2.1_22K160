@interface AccessibilityNodeAccessibility
@end

@implementation AccessibilityNodeAccessibility

void __128__AccessibilityNodeAccessibility__TVMusic__SwiftUI__accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier___block_invoke( id a1)
{
  id v5 = 0LL;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\[id=(.*?)(?:,parentId=(.*?))?(?:\\,.*)*\\]",  0LL,  &v5));
  id v2 = v5;
  v3 = (void *)_accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__regex;
  _accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__regex = v1;

  if (v2)
  {
    char v4 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v4,  @"Could not make regular expression: %@",  v2);
  }

BOOL __79__AccessibilityNodeAccessibility__TVMusic__SwiftUI_accessibilityHeaderElements__block_invoke( id a1,  id a2,  unint64_t a3)
{
  unint64_t v3 = (unint64_t)objc_msgSend(a2, "accessibilityTraits", a3);
  return (UIAccessibilityTraitHeader & v3) != 0;
}

BOOL __79__AccessibilityNodeAccessibility__TVMusic__SwiftUI_accessibilityHeaderElements__block_invoke_2( id a1,  id a2,  unint64_t a3,  BOOL *a4)
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "accessibilityIdentifier", a3, a4));
  unsigned __int8 v5 = [v4 hasSuffix:@"header"];

  return v5;
}

int64_t __92__AccessibilityNodeAccessibility__TVMusic__SwiftUI__axHeaderElementsForPosterOrSquareLockup__block_invoke( id a1,  id a2,  id a3)
{
  id v4 = a3;
  [a2 accessibilityFrame];
  double v6 = v5;
  double v8 = v7;
  [v4 accessibilityFrame];
  double v10 = v9;
  double v12 = v11;

  int64_t v13 = -1LL;
  if (v6 + v8 > v10 + v12) {
    int64_t v13 = 1LL;
  }
  if (v10 + v12 > v6 + v8) {
    int64_t v13 = -1LL;
  }
  if (v10 < v6) {
    return 1LL;
  }
  else {
    return v13;
  }
}

void __92__AccessibilityNodeAccessibility__TVMusic__SwiftUI__axHeaderElementsForPosterOrSquareLockup__block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v13 = a2;
  unint64_t v6 = (unint64_t)[v13 accessibilityTraits];
  UIAccessibilityTraits v7 = UIAccessibilityTraitHeader & v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v13 accessibilityLabel]);
  id v9 = [v8 length];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v10 + 24)) {
    BOOL v11 = v9 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v7 == 0)
  {
    *a4 = 1;
  }

  else if (v7)
  {
    *(_BYTE *)(v10 + 24) = 1;
    [*(id *)(a1 + 32) axSafelyAddObject:v13];
  }
}

@end