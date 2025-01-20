@interface UIDevice
+ (id)fallback_debugHierarchyGroupingIDs;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIDevice

+ (id)fallback_debugHierarchyGroupingIDs
{
  v3 = @"com.apple.UIKit.UIDevice";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"batteryLevel");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"f");
  v16[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"generatesDeviceOrientationNotifications");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v13, @"propertyFormat", @"b");
  v16[1] = v13;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"localizedModel");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v12, @"propertyFormat", @"public.plain-text");
  v16[2] = v12;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"model");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v11, @"propertyFormat", @"public.plain-text");
  v16[3] = v11;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"multitaskingSupported");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v10, @"propertyFormat", @"b");
  v16[4] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"name");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.plain-text");
  v16[5] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"systemName");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v3, @"propertyFormat", @"public.plain-text");
  v16[6] = v3;
  uint64_t v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"systemVersion");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.plain-text");
  v16[7] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"hardwareType");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.plain-text");
  uint64_t valuePtr = 4LL;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"visibility", v6);
  CFRelease(v6);
  v16[8] = v5;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"orientation");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIDeviceOrientation");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v16[9] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 10LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"hardwareType"])
  {
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
LABEL_8:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v14]);
LABEL_25:

          goto LABEL_26;
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
          goto LABEL_8;
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
      v30[0] = @"propertyName";
      v30[1] = @"objectDescription";
      *(void *)v29.sysname = v23;
      *(void *)&v29.sysname[8] = v22;
      v30[2] = @"errorDescription";
      *(void *)&v29.sysname[16] = &stru_34740;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  v30,  3LL));
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

    goto LABEL_25;
  }

  uname(&v29);
  v10 = (id *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29.machine,  4LL));
  if (v10) {
    a6 = v10;
  }
  else {
    a6 = (id *)@"(Unknown)";
  }
LABEL_26:

  return a6;
}

@end