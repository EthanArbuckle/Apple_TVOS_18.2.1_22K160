@interface NSLayoutConstraint
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation NSLayoutConstraint

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"active");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v18[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"constant");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v16, @"propertyFormat", @"CGf");
  v18[1] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"firstAnchor");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v15, @"propertyFormat", @"objectInfo");
  v18[2] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"firstItem");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v14, @"propertyFormat", @"objectInfo");
  v18[3] = v14;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"identifier");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v13, @"propertyFormat", @"public.plain-text");
  v18[4] = v13;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"multiplier");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v12, @"propertyFormat", @"f");
  v18[5] = v12;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"priority");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"f");
  v18[6] = v10;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"secondAnchor");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v11, @"propertyFormat", @"objectInfo");
  v18[7] = v11;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"secondItem");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v9, @"propertyFormat", @"objectInfo");
  v18[8] = v9;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"dbgInspectedHasIdentifier");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v18[9] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"dbgInspectedHasSecondItem");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v3, @"propertyFormat", @"b");
  v18[10] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"firstAttribute");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"NSLayoutAttribute");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v18[11] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"relation");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSLayoutRelation");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v18[12] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"secondAttribute");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSLayoutAttribute");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v18[13] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 14LL));

  return v7;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"dbgInspectedHasIdentifier"])
  {
    if ([v8 isEqualToString:@"dbgInspectedHasSecondItem"])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 secondItem]);
      BOOL v14 = v13 != 0LL;

      BOOL v12 = v14;
      goto LABEL_5;
    }

    id v15 = v9;
    v16 = (NSString *)v8;
    if (-[NSString length](v16, "length"))
    {
      SEL v17 = NSSelectorFromString(v16);
      if ((objc_opt_respondsToSelector(v15, v17) & 1) != 0)
      {
        v18 = v16;
        if (v18)
        {
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v18]);
LABEL_26:

          goto LABEL_27;
        }
      }

      else
      {
        if (-[NSString length](v16, "length") < 2)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v16, "uppercaseString"));
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v16, "substringToIndex:", 1LL));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uppercaseString]);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v16, "substringFromIndex:", 1LL));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingString:v21]);
        }

        v23 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v22]);
        SEL v24 = NSSelectorFromString(v23);
        if ((objc_opt_respondsToSelector(v15, v24) & 1) != 0) {
          v18 = v23;
        }
        else {
          v18 = 0LL;
        }

        if (v18) {
          goto LABEL_9;
        }
      }
    }

    if (a6)
    {
      v25 = v16;
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
      v33[0] = @"propertyName";
      v33[1] = @"objectDescription";
      v34[0] = v27;
      v34[1] = v26;
      v33[2] = @"errorDescription";
      v34[2] = &stru_34740;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
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

    goto LABEL_26;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  BOOL v11 = [v10 length] != 0;

  BOOL v12 = v11;
LABEL_5:
  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
LABEL_27:

  return a6;
}

@end