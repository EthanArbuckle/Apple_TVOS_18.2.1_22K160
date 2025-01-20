@interface UIWindow
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyGroupingIDs;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIWindow

+ (id)fallback_debugHierarchyGroupingIDs
{
  v3 = @"com.apple.UIKit.UIWindow";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"com.apple.UIKit.UIWindow", a4)) {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  1LL,  0LL));
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v3[0] = @"com.apple.UIKit.UIViewController";
  v3[1] = @"com.apple.UIKit.UIScreen";
  v3[2] = @"com.apple.UIKit.UIScene";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqualToString:@"com.apple.UIKit.UIViewController"])
  {
    if ([v6 isEqualToString:@"com.apple.UIKit.UIScreen"])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);

      if (v11)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
        v15 = v9;
        v10 = &v15;
        goto LABEL_9;
      }
    }

    else if ([v6 isEqualToString:@"com.apple.UIKit.UIScene"])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 windowScene]);
      v14 = v9;
      v10 = &v14;
      goto LABEL_9;
    }

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"keyWindow");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v12[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"rootViewController");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v3, @"propertyFormat", @"objectInfo");
  v12[1] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"screen");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v4, @"propertyFormat", @"objectInfo");
  v12[2] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"windowLevel");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v5, @"propertyFormat", @"CGf");
  v12[3] = v5;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"internal");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  uint64_t v11 = 4LL;
  CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberCFIndexType, &v11);
  CFDictionaryAddValue(v6, @"visibility", v7);
  CFRelease(v7);
  v12[4] = v6;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"visible");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v8, @"propertyFormat", @"b");
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 6LL));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"internal"])
  {
    if ([v8 isEqualToString:@"visible"])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  1LL,  1LL));
      id v11 = [v10 containsObject:v9];
      goto LABEL_5;
    }

    if ([v8 isEqualToString:@"screenScale"])
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v9 screen]);
      [v12 scale];
      a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
LABEL_29:

      goto LABEL_30;
    }

    id v12 = v9;
    v13 = (NSString *)v8;
    if (-[NSString length](v13, "length"))
    {
      SEL v14 = NSSelectorFromString(v13);
      if ((objc_opt_respondsToSelector(v12, v14) & 1) != 0)
      {
        v15 = v13;
        if (v15)
        {
LABEL_11:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v15]);
LABEL_28:

          goto LABEL_29;
        }
      }

      else
      {
        if (-[NSString length](v13, "length") < 2)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v13, "uppercaseString"));
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v13, "substringToIndex:", 1LL));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uppercaseString]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v13, "substringFromIndex:", 1LL));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:v18]);
        }

        v20 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v19]);
        SEL v21 = NSSelectorFromString(v20);
        if ((objc_opt_respondsToSelector(v12, v21) & 1) != 0) {
          v15 = v20;
        }
        else {
          v15 = 0LL;
        }

        if (v15) {
          goto LABEL_11;
        }
      }
    }

    if (a6)
    {
      v22 = v13;
      if (v12) {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v12));
      }
      else {
        v23 = &stru_34740;
      }
      if (v22) {
        v24 = v22;
      }
      else {
        v24 = &stru_34740;
      }
      v30[0] = @"propertyName";
      v30[1] = @"objectDescription";
      v31[0] = v24;
      v31[1] = v23;
      v30[2] = @"errorDescription";
      v31[2] = &stru_34740;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v26));

      id v28 = v27;
      *a6 = v28;

      v15 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v15 = 0LL;
    }

    goto LABEL_28;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  0LL,  0LL));
  id v11 = (id)([v10 containsObject:v9] ^ 1);
LABEL_5:

  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
LABEL_30:

  return a6;
}

@end