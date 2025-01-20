@interface SATVDialogueColumnHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SATVDialogueColumnHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SATVDialogueColumnHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVDialogueColumnHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVDialogueColumnHeaderView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVDialogueColumnHeaderView",  @"subtitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVDialogueColumnHeaderView",  @"loadingIndicator",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVDialogueColumnHeaderViewAccessibility;
  -[SATVDialogueColumnHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( &v13,  "_accessibilityLoadAccessibilityInformation");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVDialogueColumnHeaderViewAccessibility accessibilityHeaderElements]( self,  "accessibilityHeaderElements",  0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    UIAccessibilityTraits v7 = UIAccessibilityTraitHeader;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setAccessibilityTraits:v7];
        v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }

    while (v5);
  }
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVDialogueColumnHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVDialogueColumnHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleLabel"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATVDialogueColumnHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"loadingIndicator"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  3LL,  v3,  v4,  v5));

  return v6;
}

- (SATVDialogueColumnHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVDialogueColumnHeaderViewAccessibility;
  id v3 =  -[SATVDialogueColumnHeaderViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[SATVDialogueColumnHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end