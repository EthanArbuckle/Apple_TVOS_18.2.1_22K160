@interface UINavigationController
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UINavigationController

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"barHideOnSwipeGestureRecognizer");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"objectInfo");
  v19[0] = Mutable;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"barHideOnTapGestureRecognizer");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v17, @"propertyFormat", @"objectInfo");
  v19[1] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"delegate");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v16, @"propertyFormat", @"objectInfo");
  v19[2] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"hidesBarsWhenKeyboardAppears");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v19[3] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"hidesBarsOnSwipe");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v14, @"propertyFormat", @"b");
  v19[4] = v14;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"hidesBarsWhenVerticallyCompact");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  v13 = v2;
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v19[5] = v2;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"hidesBarsOnTap");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v11, @"propertyFormat", @"b");
  v19[6] = v11;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"interactivePopGestureRecognizer");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v12, @"propertyFormat", @"objectInfo");
  v19[7] = v12;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"navigationBar");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v3, @"propertyFormat", @"objectInfo");
  v19[8] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"navigationBarHidden");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v4, @"propertyFormat", @"b");
  v19[9] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"toolbar");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v5, @"propertyFormat", @"objectInfo");
  v19[10] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"toolbarHidden");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v19[11] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"topViewController");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v7, @"propertyFormat", @"objectInfo");
  v19[12] = v7;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"visibleViewController");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v8, @"propertyFormat", @"objectInfo");
  v19[13] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 14LL));

  return v9;
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