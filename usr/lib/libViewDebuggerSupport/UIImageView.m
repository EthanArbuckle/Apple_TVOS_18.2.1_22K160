@interface UIImageView
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIImageView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"highlighted");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v16[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"highlightedImage");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v3, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v3, @"propertyOptions", v4);
  CFRelease(v4);
  v16[1] = v3;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"image");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"propertyOptions", v6);
  CFRelease(v6);
  v16[2] = v5;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"dbg_holdsSymbolImage");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v16[3] = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 4LL));

  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"preferredSymbolConfigurationSummary");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v8, @"propertyFormat", @"public.plain-text");
  v15[0] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"displaySymbolConfigurationSummary");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v9, @"propertyFormat", @"public.plain-text");
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObjectsFromArray:v10]);
  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"preferredSymbolConfigurationSummary"])
  {
    if ([v8 isEqualToString:@"displaySymbolConfigurationSummary"])
    {
      uint64_t CurrentImage = _UIImageViewGetCurrentImage(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue(CurrentImage);
      a6 = (id *)objc_claimAutoreleasedReturnValue([v10 symbolConfiguration]);

      if (!a6) {
        goto LABEL_12;
      }
      id v14 = (id)objc_claimAutoreleasedReturnValue([v10 symbolConfiguration]);
      uint64_t v15 = _UIImageSymbolConfigurationTextualSummary();
      v16 = (id *)objc_claimAutoreleasedReturnValue(v15);
    }

    else
    {
      if (![v8 isEqualToString:@"dbg_holdsSymbolImage"])
      {
        if ([v8 isEqualToString:@"image"])
        {
          uint64_t v19 = _UIImageViewGetCurrentImage(v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          id v10 = v20;
          if (v20) {
            v12 = v20;
          }
          else {
            v12 = (id *)objc_claimAutoreleasedReturnValue([v9 image]);
          }
          goto LABEL_4;
        }

        id v10 = v9;
        id v14 = v8;
        if (![v14 length]) {
          goto LABEL_30;
        }
        SEL v21 = NSSelectorFromString((NSString *)v14);
        if ((objc_opt_respondsToSelector(v10, v21) & 1) != 0)
        {
          v22 = (NSString *)v14;
        }

        else
        {
          if ((unint64_t)[v14 length] < 2)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);
          }

          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v14 substringToIndex:1]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uppercaseString]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:1]);
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
LABEL_30:
          if (a6)
          {
            v29 = (__CFString *)v14;
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
            v36[0] = @"propertyName";
            v36[1] = @"objectDescription";
            v37[0] = v31;
            v37[1] = v30;
            v36[2] = @"errorDescription";
            v37[2] = &stru_34740;
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
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

LABEL_11:
        goto LABEL_12;
      }

      uint64_t v17 = _UIImageViewGetCurrentImage(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue(v17);
      id v14 = (id)objc_claimAutoreleasedReturnValue([v10 symbolConfiguration]);
      v16 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14 != 0LL));
    }

    a6 = v16;
    goto LABEL_11;
  }

  a6 = (id *)objc_claimAutoreleasedReturnValue([v9 preferredSymbolConfiguration]);

  if (a6)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 preferredSymbolConfiguration]);
    uint64_t v11 = _UIImageSymbolConfigurationTextualSummary();
    v12 = (id *)objc_claimAutoreleasedReturnValue(v11);
LABEL_4:
    a6 = v12;
LABEL_12:
  }

  return a6;
}

@end