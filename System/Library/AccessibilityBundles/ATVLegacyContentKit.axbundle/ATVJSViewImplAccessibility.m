@interface ATVJSViewImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
@end

@implementation ATVJSViewImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ATVJSViewImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ATVJSViewImpl" isKindOfClass:@"UIView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIView",  @"_addSubview: positioned: relativeTo:",  "v",  "@",  "q",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return @"ATVJS";
}

- (id)accessibilityElements
{
  id AssociatedObject = objc_getAssociatedObject(self, &_AXElementsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (![v4 count])
  {
    v20 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    char v28 = 0;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ATVJSViewImplAccessibility safeValueForKey:](self, "safeValueForKey:", @"subviews"));
    uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v28) {
      abort();
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityLabel]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityValue]);
          if (v15) {
            [v23 addObject:v15];
          }
          if (v16) {
            [v22 addObject:v16];
          }
          v17 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
          [v14 accessibilityFrame];
          -[UIAccessibilityElement setAccessibilityFrame:](v17, "setAccessibilityFrame:");
          if ([v15 length]) {
            v18 = v15;
          }
          else {
            v18 = v16;
          }
          -[UIAccessibilityElement setAccessibilityLabel:](v17, "setAccessibilityLabel:", v18);
          [v4 addObject:v17];
          [v14 setIsAccessibilityElement:0];
        }

        id v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v11);
    }

    objc_setAssociatedObject(self, &_AXElementsKey, v4, &stru_2E8.segname[9]);
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ATVJSViewImplAccessibility accessibilityContainer](self, "accessibilityContainer"));
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [v9 setIsAccessibilityElement:0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ATVJSViewImplAccessibility;
  -[ATVJSViewImplAccessibility _addSubview:positioned:relativeTo:]( &v10,  "_addSubview:positioned:relativeTo:",  v9,  a4,  v8);
}

@end