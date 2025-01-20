@interface UIScreen
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (double)__dbg_traitCollectionDisplayCornerRadius;
@end

@implementation UIScreen

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"bounds");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v19[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"maximumFramesPerSecond");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v16, @"propertyFormat", @"integer");
  v19[1] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"nativeBounds");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v15, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v19[2] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"nativeScale");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v14, @"propertyFormat", @"CGf");
  v19[3] = v14;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"scale");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"CGf");
  v19[4] = v13;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"wantsSoftwareDimming");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v12, @"propertyFormat", @"b");
  v19[5] = v12;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"displayCornerRadius");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf");
  v19[6] = v11;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"isMainScreen");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v19[7] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"nativeDisplayBounds");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v19[8] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"pointsPerInch");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v4, @"propertyFormat", @"CGf");
  v19[9] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"dbgScreenShapeIsRectangular");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v5, @"propertyFormat", @"b");
  uint64_t valuePtr = 4LL;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"visibility", v6);
  CFRelease(v6);
  v19[10] = v5;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"dbgScreenShape");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"DBGScreenShape");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  uint64_t valuePtr = 4LL;
  CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v7, @"visibility", v8);
  CFRelease(v8);
  v19[11] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 12LL));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"displayCornerRadius"])
  {
    objc_msgSend(v9, "__dbg_traitCollectionDisplayCornerRadius");
LABEL_6:
    v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
LABEL_7:
    a6 = v10;
    goto LABEL_8;
  }

  if ([v8 isEqualToString:@"pointsPerInch"])
  {
    if ((objc_opt_respondsToSelector(v9, "_pointsPerInch") & 1) == 0)
    {
      a6 = (id *)&off_4EDF8;
      goto LABEL_8;
    }

    [v9 _pointsPerInch];
    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"nativeDisplayBounds"])
  {
    if ((objc_opt_respondsToSelector(v9, "_nativeDisplayBounds") & 1) != 0)
    {
      [v9 _nativeDisplayBounds];
      v10 = (id *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:"));
      goto LABEL_7;
    }

- (double)__dbg_traitCollectionDisplayCornerRadius
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen traitCollection](self, "traitCollection"));
  SEL v4 = NSSelectorFromString(@"displayCornerRadius");
  char v5 = objc_opt_respondsToSelector(v3, v4);

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  CFNumberRef v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen traitCollection](self, "traitCollection"));
  [v6 displayCornerRadius];
  double v8 = v7;

  return v8;
}

@end