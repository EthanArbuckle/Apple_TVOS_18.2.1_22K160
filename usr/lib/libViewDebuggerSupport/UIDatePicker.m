@interface UIDatePicker
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIDatePicker

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"countDownDuration");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf");
  v11[0] = Mutable;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"minuteInterval");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"integer");
  v11[1] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"date");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v3, @"propertyFormat", @"public.plain-text");
  v11[2] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"datePickerMode");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIDatePickerMode");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v11[3] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"localeIdentifier");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.plain-text");
  v11[4] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"maximumDate");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.plain-text");
  v11[5] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"minimumDate");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.plain-text");
  v11[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"date"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 date]);
LABEL_9:
    id v11 = v10;
    v12 = (id *)objc_claimAutoreleasedReturnValue([v10 description]);
    goto LABEL_10;
  }

  if ([v8 isEqualToString:@"localeIdentifier"])
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v9 locale]);
    v12 = (id *)objc_claimAutoreleasedReturnValue([v11 localeIdentifier]);
LABEL_10:
    a6 = v12;
    goto LABEL_11;
  }

  if ([v8 isEqualToString:@"maximumDate"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 maximumDate]);
    goto LABEL_9;
  }

  if ([v8 isEqualToString:@"minimumDate"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 minimumDate]);
    goto LABEL_9;
  }

  id v11 = v9;
  id v14 = v8;
  if (![v14 length]) {
    goto LABEL_24;
  }
  SEL v15 = NSSelectorFromString((NSString *)v14);
  if ((objc_opt_respondsToSelector(v11, v15) & 1) != 0)
  {
    v16 = (NSString *)v14;
  }

  else
  {
    if ((unint64_t)[v14 length] < 2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 substringToIndex:1]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uppercaseString]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:1]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v19]);
    }

    v21 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v20]);
    SEL v22 = NSSelectorFromString(v21);
    v16 = (objc_opt_respondsToSelector(v11, v22) & 1) != 0 ? v21 : 0LL;
  }

  if (v16)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v16]);
  }

  else
  {
LABEL_24:
    if (a6)
    {
      v23 = (__CFString *)v14;
      if (v11) {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v11));
      }
      else {
        v24 = &stru_34740;
      }
      if (v23) {
        v25 = v23;
      }
      else {
        v25 = &stru_34740;
      }
      v30[0] = @"propertyName";
      v30[1] = @"objectDescription";
      v31[0] = v25;
      v31[1] = v24;
      v30[2] = @"errorDescription";
      v31[2] = &stru_34740;
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v27));

      id v29 = v28;
      *a6 = v29;

      v16 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v16 = 0LL;
    }
  }

LABEL_11:
  return a6;
}

@end