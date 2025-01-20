@interface PBUserNotificationTextEntryButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
@end

@implementation PBUserNotificationTextEntryButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBUserNotificationTextEntryButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryButtonViewAccessibility;
  -[PBUserNotificationTextEntryButtonViewAccessibility accessibilityFrame](&v28, "accessibilityFrame");
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryButtonViewAccessibility subviews](self, "subviews", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v15) accessibilityFrame];
        v33.origin.CGFloat x = v16;
        v33.origin.CGFloat y = v17;
        v33.size.CGFloat width = v18;
        v33.size.CGFloat height = v19;
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        CGRect v31 = CGRectUnion(v30, v33);
        CGFloat x = v31.origin.x;
        CGFloat y = v31.origin.y;
        CGFloat width = v31.size.width;
        CGFloat height = v31.size.height;
        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v13);
  }

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

@end