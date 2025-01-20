@interface TVCSWiFiNetworkTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation TVCSWiFiNetworkTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVCSWiFiNetworkTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCSWiFiNetworkTableViewCell",  @"bars",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCSWiFiNetworkTableViewCell",  @"secure",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCSWiFiNetworkTableViewCell",  @"state",  "q",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  unsigned int v3 = -[TVCSWiFiNetworkTableViewCellAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"secure");
  v4 = (char *)-[TVCSWiFiNetworkTableViewCellAccessibility safeIntegerForKey:]( self,  "safeIntegerForKey:",  @"state");
  v5 = (char *)-[TVCSWiFiNetworkTableViewCellAccessibility safeIntegerForKey:]( self,  "safeIntegerForKey:",  @"bars");
  if (v3)
  {
    id v6 = accessibilityLocalizedString(@"tv.wifi.secure");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    v7 = 0LL;
  }

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    id v8 = accessibilityLocalizedString(@"tv.in.progress");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    v9 = 0LL;
  }

  else {
    v10 = *(&off_4090 + (void)(v5 - 1));
  }
  id v11 = accessibilityLocalizedString(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v12 = __UIAXStringForVariables(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

@end