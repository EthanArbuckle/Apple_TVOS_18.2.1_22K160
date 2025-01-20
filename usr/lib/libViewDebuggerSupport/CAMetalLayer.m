@interface CAMetalLayer
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation CAMetalLayer

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"deviceName");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.plain-text");
  v13[0] = Mutable;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"preferredDeviceName");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v11, @"propertyFormat", @"public.plain-text");
  v13[1] = v11;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"pixelFormatName");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v10, @"propertyFormat", @"public.plain-text");
  v13[2] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"colorSpaceName");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.plain-text");
  v13[3] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"drawableSize");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf, CGf");
  v13[4] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"framebufferOnly");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v4, @"propertyFormat", @"b");
  v13[5] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"maximumDrawableCount");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v5, @"propertyFormat", @"uinteger");
  v13[6] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"presentsWithTransaction");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v13[7] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"allowsNextDrawableTimeout");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v13[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 9LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"deviceName"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
LABEL_5:
    id v11 = v10;
    a6 = (id *)objc_claimAutoreleasedReturnValue([v10 name]);
LABEL_6:

    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"preferredDeviceName"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preferredDevice]);
    goto LABEL_5;
  }

  if (![v8 isEqualToString:@"pixelFormatName"])
  {
    if ([v8 isEqualToString:@"colorSpaceName"])
    {
      a6 = (id *)CGColorSpaceCopyName((CGColorSpaceRef)[v9 colorspace]);
      goto LABEL_7;
    }

    id v11 = v9;
    id v16 = v8;
    if (![v16 length]) {
      goto LABEL_28;
    }
    SEL v17 = NSSelectorFromString((NSString *)v16);
    if ((objc_opt_respondsToSelector(v11, v17) & 1) != 0)
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
      v18 = (objc_opt_respondsToSelector(v11, v24) & 1) != 0 ? v23 : 0LL;
    }

    if (v18)
    {
      a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v18]);
    }

    else
    {
LABEL_28:
      if (a6)
      {
        v25 = (__CFString *)v16;
        if (v11) {
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v11));
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
        v33[0] = v27;
        v33[1] = v26;
        v32[2] = @"errorDescription";
        v33[2] = &stru_34740;
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
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

    goto LABEL_6;
  }

  uint64_t Name = MTLPixelFormatGetName([v9 pixelFormat]);
  if (Name) {
    v14 = (const char *)Name;
  }
  else {
    v14 = "Invalid";
  }
  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
  if ([a6 hasPrefix:@"MTLPixelFormat"])
  {
    v15 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "substringFromIndex:", objc_msgSend(@"MTLPixelFormat", "length")));

    a6 = v15;
  }

@end