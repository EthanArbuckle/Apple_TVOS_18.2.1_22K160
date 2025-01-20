@interface CAShapeLayer
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation CAShapeLayer

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"fillColor");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"color");
  v15[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"fillRule");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v13, @"propertyFormat", @"public.plain-text");
  v15[1] = v13;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"lineCap");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v12, @"propertyFormat", @"public.plain-text");
  v15[2] = v12;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"lineDashPhase");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf");
  v15[3] = v11;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"lineJoin");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v10, @"propertyFormat", @"public.plain-text");
  v15[4] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"lineWidth");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"CGf");
  v15[5] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"miterLimit");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf");
  v15[6] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"path");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v4, @"propertyFormat", @"objectInfo");
  v15[7] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"strokeColor");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  v15[8] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"strokeEnd");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  v15[9] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"strokeStart");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v7, @"propertyFormat", @"CGf");
  v15[10] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 11LL));

  return v8;
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