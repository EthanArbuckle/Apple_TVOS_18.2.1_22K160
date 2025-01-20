@interface TVSMPeoplePickerPersonModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMPeoplePickerPersonModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMPeoplePickerPersonModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMPeoplePickerPersonModule",  @"selected",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMPeoplePickerPersonModule",  @"user",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPeoplePickerUser",  @"firstName",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPeoplePickerUser",  @"lastName",  "@",  0);
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSMPeoplePickerPersonModuleAccessibility safeValueForKey:](self, "safeValueForKey:", @"user"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"firstName"]);
  if ([v4 length]) {
    [v3 appendFormat:@"%@ ", v4];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"lastName"]);
  if ([v5 length]) {
    [v3 appendString:v5];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  if (-[TVSMPeoplePickerPersonModuleAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"selected")) {
    return UIAccessibilityTraitSelected;
  }
  else {
    return 0LL;
  }
}

@end