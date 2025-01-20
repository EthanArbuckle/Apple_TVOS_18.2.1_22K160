@interface TVWiFiNetworkTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation TVWiFiNetworkTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVWiFiNetworkTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVWiFiNetworkTableViewCell",  @"showsSignalStrength",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVWiFiNetworkTableViewCell",  @"showsPadlock",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVWiFiNetworkTableViewCell",  @"showsSpinner",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVWiFiNetworkTableViewCell",  @"signalStrength",  "f",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVWiFiNetworkTableViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"showsSignalStrength"));
  unsigned int v4 = [v3 BOOLValue];

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVWiFiNetworkTableViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"showsPadlock"));
  unsigned int v6 = [v5 BOOLValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVWiFiNetworkTableViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"showsSpinner"));
  unsigned int v8 = [v7 BOOLValue];

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVWiFiNetworkTableViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"signalStrength"));
  [v9 floatValue];
  float v11 = v10;

  if (v6)
  {
    id v12 = accessibilityLocalizedString(@"tv.wifi.secure");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!v8) {
      goto LABEL_3;
    }
LABEL_6:
    id v16 = accessibilityLocalizedString(@"tv.in.progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  v13 = 0LL;
  if (v8) {
    goto LABEL_6;
  }
LABEL_3:
  v14 = 0LL;
  if (!v4)
  {
LABEL_4:
    v15 = 0LL;
    goto LABEL_11;
  }

@end