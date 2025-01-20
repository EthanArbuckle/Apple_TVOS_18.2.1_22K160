@interface UISlider
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UISlider

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"continuous");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v16[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"maximumValue");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"f");
  v16[1] = v13;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"minimumValue");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"f");
  v16[2] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"maximumTrackTintColor");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v16[3] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"maximumValueImage");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v16[4] = v4;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"minimumTrackTintColor");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v16[5] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"minimumValueImage");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v7, @"propertyOptions", v8);
  CFRelease(v8);
  v16[6] = v7;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"thumbTintColor");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v16[7] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"value");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"f");
  v16[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 9LL));

  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (NSString *)v8;
  if (-[NSString length](v10, "length"))
  {
    SEL v11 = NSSelectorFromString(v10);
    if ((objc_opt_respondsToSelector(v9, v11) & 1) != 0)
    {
      v12 = v10;
      if (v12)
      {
LABEL_4:
        a6 = (id *)objc_claimAutoreleasedReturnValue([v9 valueForKey:v12]);
        goto LABEL_21;
      }
    }

    else
    {
      if (-[NSString length](v10, "length") < 2)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v10, "uppercaseString"));
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v10, "substringToIndex:", 1LL));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uppercaseString]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v10, "substringFromIndex:", 1LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v15]);
      }

      v17 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v16]);
      SEL v18 = NSSelectorFromString(v17);
      if ((objc_opt_respondsToSelector(v9, v18) & 1) != 0) {
        v12 = v17;
      }
      else {
        v12 = 0LL;
      }

      if (v12) {
        goto LABEL_4;
      }
    }
  }

  if (a6)
  {
    v19 = v10;
    if (v9) {
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v9));
    }
    else {
      v20 = &stru_34740;
    }
    if (v19) {
      v21 = v19;
    }
    else {
      v21 = &stru_34740;
    }
    v27[0] = @"propertyName";
    v27[1] = @"objectDescription";
    v28[0] = v21;
    v28[1] = v20;
    v27[2] = @"errorDescription";
    v28[2] = &stru_34740;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v23));

    id v25 = v24;
    *a6 = v25;

    v12 = 0LL;
    a6 = 0LL;
  }

  else
  {
    v12 = 0LL;
  }

@end