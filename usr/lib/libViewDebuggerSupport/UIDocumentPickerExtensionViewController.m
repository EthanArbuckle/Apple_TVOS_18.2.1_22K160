@interface UIDocumentPickerExtensionViewController
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIDocumentPickerExtensionViewController

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"providerIdentifier");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.plain-text");
  v8[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"documentPickerMode");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIDocumentPickerMode");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v3, @"propertyFormat", @"uinteger");
  v8[1] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"originalURL");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"NSURL");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.plain-text");
  v8[2] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"documentStorageURL");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSURL");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.plain-text");
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"originalURL"])
  {
    if ([v8 isEqualToString:@"originalURL"])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 documentStorageURL]);
      goto LABEL_5;
    }

    id v11 = v9;
    v12 = (NSString *)v8;
    if (-[NSString length](v12, "length"))
    {
      SEL v13 = NSSelectorFromString(v12);
      if ((objc_opt_respondsToSelector(v11, v13) & 1) != 0)
      {
        v14 = v12;
        if (v14)
        {
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v14]);
LABEL_26:

          goto LABEL_27;
        }
      }

      else
      {
        if (-[NSString length](v12, "length") < 2)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v12, "uppercaseString"));
        }

        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v12, "substringToIndex:", 1LL));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uppercaseString]);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v12, "substringFromIndex:", 1LL));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v17]);
        }

        v19 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v18]);
        SEL v20 = NSSelectorFromString(v19);
        if ((objc_opt_respondsToSelector(v11, v20) & 1) != 0) {
          v14 = v19;
        }
        else {
          v14 = 0LL;
        }

        if (v14) {
          goto LABEL_9;
        }
      }
    }

    if (a6)
    {
      v21 = v12;
      if (v11) {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v11));
      }
      else {
        v22 = &stru_34740;
      }
      if (v21) {
        v23 = v21;
      }
      else {
        v23 = &stru_34740;
      }
      v29[0] = @"propertyName";
      v29[1] = @"objectDescription";
      v30[0] = v23;
      v30[1] = v22;
      v29[2] = @"errorDescription";
      v30[2] = &stru_34740;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v25));

      id v27 = v26;
      *a6 = v27;

      v14 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v14 = 0LL;
    }

    goto LABEL_26;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 originalURL]);
LABEL_5:
  id v11 = v10;
  a6 = (id *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
LABEL_27:

  return a6;
}

@end