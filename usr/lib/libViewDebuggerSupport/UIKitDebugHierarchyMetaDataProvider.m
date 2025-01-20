@interface UIKitDebugHierarchyMetaDataProvider
+ (id)fallback_debugHierarchyEnumDescriptions;
+ (id)fallback_debugHierarchyOptionDescriptions;
@end

@implementation UIKitDebugHierarchyMetaDataProvider

+ (id)fallback_debugHierarchyEnumDescriptions
{
  v7[0] = &off_4EE20;
  v7[1] = &off_4EE38;
  v8[0] = @"UIViewContentModeScaleToFill";
  v8[1] = @"UIViewContentModeScaleAspectFit";
  v7[2] = &off_4EE50;
  v7[3] = &off_4EE68;
  v8[2] = @"UIViewContentModeScaleAspectFill";
  v8[3] = @"UIViewContentModeRedraw";
  v7[4] = &off_4EE80;
  v7[5] = &off_4EE98;
  v8[4] = @"UIViewContentModeCenter";
  v8[5] = @"UIViewContentModeTop";
  v7[6] = &off_4EEB0;
  v7[7] = &off_4EEC8;
  v8[6] = @"UIViewContentModeBottom";
  v8[7] = @"UIViewContentModeLeft";
  v7[8] = &off_4EEE0;
  v7[9] = &off_4EEF8;
  v8[8] = @"UIViewContentModeRight";
  v8[9] = @"UIViewContentModeTopLeft";
  v7[10] = &off_4EF10;
  v7[11] = &off_4EF28;
  v8[10] = @"UIViewContentModeTopRight";
  v8[11] = @"UIViewContentModeBottomLeft";
  v7[12] = &off_4EF40;
  v8[12] = @"UIViewContentModeBottomRight";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  13LL));
  v5 = @"UIViewContentMode";
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

+ (id)fallback_debugHierarchyOptionDescriptions
{
  v7[0] = &off_4EF58;
  v7[1] = &off_4EF70;
  v8[0] = @"UIViewAutoresizingNone";
  v8[1] = @"UIViewAutoresizingFlexibleLeftMargin";
  v7[2] = &off_4EF88;
  v7[3] = &off_4EFA0;
  v8[2] = @"UIViewAutoresizingFlexibleWidth";
  v8[3] = @"UIViewAutoresizingFlexibleRightMargin";
  v7[4] = &off_4EFB8;
  v7[5] = &off_4EFD0;
  v8[4] = @"UIViewAutoresizingFlexibleTopMargin";
  v8[5] = @"UIViewAutoresizingFlexibleHeight";
  v7[6] = &off_4EFE8;
  v8[6] = @"UIViewAutoresizingFlexibleBottomMargin";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  7LL));
  v5 = @"UIViewAutoresizing";
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

@end