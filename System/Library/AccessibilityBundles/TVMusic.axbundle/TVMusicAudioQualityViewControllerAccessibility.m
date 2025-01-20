@interface TVMusicAudioQualityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation TVMusicAudioQualityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicAudioQualityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVMusicAudioQualityViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicAudioQualityViewController",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicAudioQualityViewController",  @"inputDetailsLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicAudioQualityViewControllerAccessibility;
  -[TVMusicAudioQualityViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v13,  "_accessibilityLoadAccessibilityInformation");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioQualityViewControllerAccessibility accessibilityHeaderElements]( self,  "accessibilityHeaderElements",  0LL));
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
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioQualityViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioQualityViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"inputDetailsLabel"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v3,  v4));

  return v5;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicAudioQualityViewControllerAccessibility;
  -[TVMusicAudioQualityViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[TVMusicAudioQualityViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end