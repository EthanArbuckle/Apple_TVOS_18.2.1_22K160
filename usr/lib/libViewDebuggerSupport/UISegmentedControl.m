@interface UISegmentedControl
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)__dbg_hasValidSelectedSegmentIndex;
- (BOOL)__dbg_isEnabledForSelectedSegment;
- (CGSize)__dbg_contentOffsetForSelectedSegment;
- (double)__dbg_widthForSelectedSegment;
- (id)__dbg_titleForSelectedSegment;
@end

@implementation UISegmentedControl

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"apportionsSegmentWidthsByContent");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v15[0] = Mutable;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"momentary");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v12, @"propertyFormat", @"b");
  v15[1] = v12;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"numberOfSegments");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"uinteger");
  v15[2] = v11;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"selectedSegmentIndex");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"integer");
  v15[3] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"contentOffsetForInspectedSegment");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf, CGf");
  v15[4] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"imageForInspectedSegment");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v15[5] = v4;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"isEnabledForInspectedSegment");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v15[6] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"titleForInspectedSegment");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.plain-text");
  v15[7] = v7;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"widthForInspectedSegment");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v8, @"propertyFormat", @"CGf");
  v15[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 9LL));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"contentOffsetForInspectedSegment"])
  {
    objc_msgSend(v9, "__dbg_contentOffsetForSelectedSegment");
    uint64_t valuePtr = v10;
    v34[0] = v11;
    v12 = (const void **)malloc(0x10uLL);
    __CFDictionary *v12 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
    v12[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, v34);
    a6 = (id *)CFArrayCreate(0LL, v12, 2LL, &kCFTypeArrayCallBacks);
    CFRelease(*v12);
    CFRelease(v12[1]);
    free(v12);
    goto LABEL_14;
  }

  if ([v8 isEqualToString:@"imageForInspectedSegment"])
  {
    if ([v9 selectedSegmentIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      a6 = 0LL;
      goto LABEL_14;
    }

    v13 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageForSegmentAtIndex:", objc_msgSend(v9, "selectedSegmentIndex")));
LABEL_13:
    a6 = v13;
    goto LABEL_14;
  }

  if ([v8 isEqualToString:@"isEnabledForInspectedSegment"])
  {
    v13 = (id *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v9, "__dbg_isEnabledForSelectedSegment")));
    goto LABEL_13;
  }

  if ([v8 isEqualToString:@"titleForInspectedSegment"])
  {
    v13 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__dbg_titleForSelectedSegment"));
    goto LABEL_13;
  }

  if ([v8 isEqualToString:@"widthForInspectedSegment"])
  {
    objc_msgSend(v9, "__dbg_widthForSelectedSegment");
    v13 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    goto LABEL_13;
  }

  id v15 = v9;
  id v16 = v8;
  if (![v16 length]) {
    goto LABEL_27;
  }
  SEL v17 = NSSelectorFromString((NSString *)v16);
  if ((objc_opt_respondsToSelector(v15, v17) & 1) != 0)
  {
    v18 = (NSString *)v16;
  }

  else
  {
    if ((unint64_t)[v16 length] < 2)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v16 uppercaseString]);
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v16 substringToIndex:1]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uppercaseString]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v16 substringFromIndex:1]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingString:v21]);
    }

    v23 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v22]);
    SEL v24 = NSSelectorFromString(v23);
    v18 = (objc_opt_respondsToSelector(v15, v24) & 1) != 0 ? v23 : 0LL;
  }

  if (v18)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v18]);
  }

  else
  {
LABEL_27:
    if (a6)
    {
      v25 = (__CFString *)v16;
      if (v15) {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v15));
      }
      else {
        v26 = &stru_34740;
      }
      if (v25) {
        v27 = v25;
      }
      else {
        v27 = &stru_34740;
      }
      v32[0] = @"propertyName";
      v32[1] = @"objectDescription";
      uint64_t valuePtr = v27;
      v34[0] = v26;
      v32[2] = @"errorDescription";
      v34[1] = &stru_34740;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &valuePtr,  v32,  3LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v29));

      id v31 = v30;
      *a6 = v31;

      v18 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v18 = 0LL;
    }
  }

LABEL_14:
  return a6;
}

- (BOOL)__dbg_hasValidSelectedSegmentIndex
{
  if (-[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex") < 0) {
    return 0;
  }
  unint64_t v3 = -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex");
  return v3 < -[UISegmentedControl numberOfSegments](self, "numberOfSegments");
}

- (CGSize)__dbg_contentOffsetForSelectedSegment
{
  if (-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex"))
  {
    -[UISegmentedControl contentOffsetForSegmentAtIndex:]( self,  "contentOffsetForSegmentAtIndex:",  -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)__dbg_isEnabledForSelectedSegment
{
  BOOL v3 = -[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex");
  if (v3) {
    LOBYTE(v3) = -[UISegmentedControl isEnabledForSegmentAtIndex:]( self,  "isEnabledForSegmentAtIndex:",  -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  }
  return v3;
}

- (id)__dbg_titleForSelectedSegment
{
  if (-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex")) {
    id v3 =  -[UISegmentedControl titleForSegmentAtIndex:]( self,  "titleForSegmentAtIndex:",  -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  }
  return 0LL;
}

- (double)__dbg_widthForSelectedSegment
{
  if (!-[UISegmentedControl __dbg_hasValidSelectedSegmentIndex](self, "__dbg_hasValidSelectedSegmentIndex")) {
    return 0.0;
  }
  -[UISegmentedControl widthForSegmentAtIndex:]( self,  "widthForSegmentAtIndex:",  -[UISegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex"));
  return result;
}

@end