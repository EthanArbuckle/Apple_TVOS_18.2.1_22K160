@interface HBAppGridViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityNativeFocusPreferredElementIsValid;
- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
- (BOOL)_beginGlobalEditingMode;
- (HBAppGridViewAccessibility)initWithFrame:(CGRect)a3 dockMode:(BOOL)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_endGlobalEditingMode;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)setHeaderView:(id)a3;
@end

@implementation HBAppGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBAppGridView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  uint64_t v3 = AXValidationClientAccessibility;
  id v4 = a3;
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  v3,  @"HBAppGridView",  @"_beginGlobalEditingMode",  "B",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientAccessibility,  @"HBAppGridView",  @"_endGlobalEditingMode",  "v",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientAccessibility,  @"HBAppGridView",  @"moveItemAtIndexPath: toIndexPath:",  "v",  "@",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientAccessibility,  @"HBAppGridView",  @"initWithFrame: dockMode:",  "@",  "{CGRect={CGPoint=dd}{CGSize=dd}}",  "B",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientAccessibility,  @"HBAppGridView",  @"gridView",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientAccessibility,  @"HBAppGridView",  @"headerView",  "@",  0);
}

- (BOOL)_accessibilityNativeFocusPreferredElementIsValid
{
  return 0;
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  -[HBAppGridViewAccessibility _accessibilityLoadAccessibilityInformation]( &v14,  "_accessibilityLoadAccessibilityInformation");
  char v13 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UICollectionView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HBAppGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"gridView"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v13
    || ([v7 setAccessibilityIdentifier:@"GridCollectionView"],
        char v13 = 0,
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIView, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HBAppGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView")),
        uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &v13),
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11),
        v10,
        v13))
  {
    abort();
  }

  [v12 setAccessibilityContainerType:4];
}

- (void)setHeaderView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  -[HBAppGridViewAccessibility setHeaderView:](&v4, "setHeaderView:", a3);
  -[HBAppGridViewAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

- (HBAppGridViewAccessibility)initWithFrame:(CGRect)a3 dockMode:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  objc_super v4 = -[HBAppGridViewAccessibility initWithFrame:dockMode:]( &v6,  "initWithFrame:dockMode:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[HBAppGridViewAccessibility _accessibilityLoadAccessibilityInformation]( v4,  "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (BOOL)_beginGlobalEditingMode
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  BOOL v2 = -[HBAppGridViewAccessibility _beginGlobalEditingMode](&v8, "_beginGlobalEditingMode");
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedView]);

    if (v4)
    {
      UIAccessibilityPostNotification(0x411u, 0LL);
      id v5 = accessibilityLocalizedString(@"begin.moving.cell.announcement");
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
  }

  return v2;
}

- (void)_endGlobalEditingMode
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  -[HBAppGridViewAccessibility _endGlobalEditingMode](&v6, "_endGlobalEditingMode");
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedView]);

  if (v3)
  {
    UIAccessibilityPostNotification(0x411u, 0LL);
    id v4 = accessibilityLocalizedString(@"end.moving.cell.announcement");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___HBAppGridViewAccessibility;
  -[HBAppGridViewAccessibility moveItemAtIndexPath:toIndexPath:](&v31, "moveItemAtIndexPath:toIndexPath:", v6, v7);
  char v30 = 0;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UICollectionView, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HBAppGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"gridView"));
  uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v30) {
    abort();
  }
  char v13 = (char *)[v12 numberOfItemsInSection:0];
  if (v7)
  {
    if (v6)
    {
      if (v12)
      {
        objc_super v14 = v13;
        if (v13)
        {
          if (((unint64_t)[v6 item] & 0x8000000000000000) == 0
            && ((unint64_t)[v7 item] & 0x8000000000000000) == 0)
          {
            if ([v7 item]
              && ([v7 item] == v14 - 1
               || (id v15 = [v7 item], (uint64_t)v15 >= (uint64_t)objc_msgSend(v6, "item"))))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v7 item] - 1,  0));
              v17 = (void *)objc_claimAutoreleasedReturnValue([v12 cellForItemAtIndexPath:v19]);

              if (v17)
              {
                v18 = @"after.cell.announcement";
                goto LABEL_17;
              }
            }

            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v7 item] + 1,  0));
              v17 = (void *)objc_claimAutoreleasedReturnValue([v12 cellForItemAtIndexPath:v16]);

              if (v17)
              {
                v18 = @"before.cell.announcement";
LABEL_17:
                id v20 = accessibilityLocalizedString(v18);
                v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v17 accessibilityLabel]);
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v22));

LABEL_19:
                id v24 = objc_alloc(&OBJC_CLASS___AXAttributedString);
                id v25 = appCellGridString(self, v7);
                v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                id v27 = [v24 initWithStringOrAttributedString:v26];

                uint64_t v28 = __UIAXStringForVariables(v23);
                v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
                UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v29);

                goto LABEL_14;
              }
            }

            v23 = 0LL;
            goto LABEL_19;
          }
        }
      }
    }
  }

  _AXLogWithFacility( 3LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Got an unexpected condition when reordering cells");
LABEL_14:
}

@end