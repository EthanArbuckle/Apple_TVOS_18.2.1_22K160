@interface _TVCarouselViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_startAutoScrollTimer;
@end

@implementation _TVCarouselViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCarouselView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVCarouselView" hasProperty:@"collectionToDatasourceIndexMap" withType:"@"];
  [v3 validateClass:@"_TVCarouselView" hasInstanceVariable:@"_numberOfRealItemsForDataSource" withType:"Q"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVCarouselView",  @"collectionView:canFocusItemAtIndexPath:",  "B",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVCarouselView",  @"collectionView:cellForItemAtIndexPath:",  "@",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVCarouselView",  @"_startAutoScrollTimer",  "v",  0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____TVCarouselViewAccessibility;
  id v6 = a4;
  id v7 = -[_TVCarouselViewAccessibility collectionView:cellForItemAtIndexPath:]( &v15,  "collectionView:cellForItemAtIndexPath:",  a3,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[_TVCarouselViewAccessibility safeDictionaryForKey:]( self,  "safeDictionaryForKey:",  @"collectionToDatasourceIndexMap",  v15.receiver,  v15.super_class));
  id v10 = [v6 row];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v11]);
  id v13 = [v12 unsignedIntegerValue];

  objc_msgSend( v8,  "_accessibilitySetRowRange:",  v13,  -[_TVCarouselViewAccessibility safeIntegerForKey:]( self,  "safeIntegerForKey:",  @"_numberOfRealItemsForDataSource"));
  return v8;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    BOOL v8 = 1;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS____TVCarouselViewAccessibility;
    BOOL v8 = -[_TVCarouselViewAccessibility collectionView:canFocusItemAtIndexPath:]( &v10,  "collectionView:canFocusItemAtIndexPath:",  v6,  v7);
  }

  return v8;
}

- (void)_startAutoScrollTimer
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS____TVCarouselViewAccessibility;
    -[_TVCarouselViewAccessibility _startAutoScrollTimer](&v3, "_startAutoScrollTimer");
  }

@end