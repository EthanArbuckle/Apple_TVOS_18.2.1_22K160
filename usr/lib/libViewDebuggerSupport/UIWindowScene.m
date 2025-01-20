@interface UIWindowScene
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIWindowScene

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v3[0] = @"com.apple.UIKit.UIWindow";
  v3[1] = @"com.apple.UIKit.UIScreen";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.UIKit.UIWindow"])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windows]);
  }

  else if ([v6 isEqualToString:@"com.apple.UIKit.UIScreen"])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
      v11 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"coordinateSpace");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"objectInfo");
  v11[0] = Mutable;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"screen");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v9, @"propertyFormat", @"objectInfo");
  v11[1] = v9;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"bounds");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v2, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v11[2] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"interfaceOrientation");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIInterfaceOrientation");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v3, @"propertyFormat", @"integer");
  v11[3] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"traitCollectionVerticalSizeClass");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v11[4] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"traitCollectionHorizontalSizeClass");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v11[5] = v5;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"traitCollectionLayoutDirection");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UITraitEnvironmentLayoutDirection");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v11[6] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));

  return v7;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"bounds"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 coordinateSpace]);
    [v10 bounds];
    v36 = v11;
    v37 = v12;
    v38 = v13;
    uint64_t v39 = v14;
    v15 = (const void **)malloc(0x20uLL);
    for (uint64_t i = 0LL; i != 4; ++i)
      v15[i] = CFNumberCreate(0LL, kCFNumberCGFloatType, (char *)&v36 + i * 8);
    a6 = (id *)CFArrayCreate(0LL, v15, 4LL, &kCFTypeArrayCallBacks);
    for (uint64_t j = 0LL; j != 4; ++j)
      CFRelease(v15[j]);
    free(v15);
    goto LABEL_16;
  }

  if ([v8 isEqualToString:@"traitCollectionUserInterfaceStyle"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
    id v18 = [v10 userInterfaceStyle];
LABEL_15:
    a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
    goto LABEL_16;
  }

  if ([v8 isEqualToString:@"traitCollectionVerticalSizeClass"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
    id v18 = [v10 verticalSizeClass];
    goto LABEL_15;
  }

  if ([v8 isEqualToString:@"traitCollectionHorizontalSizeClass"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
    id v18 = [v10 horizontalSizeClass];
    goto LABEL_15;
  }

  if ([v8 isEqualToString:@"traitCollectionLayoutDirection"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
    id v18 = [v10 layoutDirection];
    goto LABEL_15;
  }

  id v10 = v9;
  id v20 = v8;
  if (![v20 length]) {
    goto LABEL_29;
  }
  SEL v21 = NSSelectorFromString((NSString *)v20);
  if ((objc_opt_respondsToSelector(v10, v21) & 1) != 0)
  {
    v22 = (NSString *)v20;
  }

  else
  {
    if ((unint64_t)[v20 length] < 2)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v20 uppercaseString]);
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v20 substringToIndex:1]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uppercaseString]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v20 substringFromIndex:1]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:v25]);
    }

    v27 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v26]);
    SEL v28 = NSSelectorFromString(v27);
    v22 = (objc_opt_respondsToSelector(v10, v28) & 1) != 0 ? v27 : 0LL;
  }

  if (v22)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v22]);
  }

  else
  {
LABEL_29:
    if (a6)
    {
      v29 = (__CFString *)v20;
      if (v10) {
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v10));
      }
      else {
        v30 = &stru_34740;
      }
      if (v29) {
        v31 = v29;
      }
      else {
        v31 = &stru_34740;
      }
      v40[0] = @"propertyName";
      v40[1] = @"objectDescription";
      v36 = v31;
      v37 = v30;
      v40[2] = @"errorDescription";
      v38 = &stru_34740;
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  v40,  3LL));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v33));

      id v35 = v34;
      *a6 = v35;

      v22 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v22 = 0LL;
    }
  }

LABEL_16:
  return a6;
}

@end