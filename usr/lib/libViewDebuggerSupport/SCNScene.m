@interface SCNScene
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation SCNScene

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  v2 = (objc_class *)a1;
  if (a1)
  {
    if (object_isClass(a1))
    {
      v3 = NSStringFromClass(v2);
      a1 = (id)objc_claimAutoreleasedReturnValue(v3);
    }

    else
    {
      a1 = 0LL;
    }
  }

  id v4 = a1;
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"encodedPresentationScene");
  if (v4) {
    CFDictionaryAddValue(Mutable, @"propertyRuntimeType", v4);
  }
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeData");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.data");
  uint64_t v15 = 8LL;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(Mutable, @"visibility", v6);
  CFRelease(v6);
  uint64_t v15 = 1LL;
  CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(Mutable, @"propertyOptions", v7);
  CFRelease(v7);

  v16[0] = Mutable;
  if (v2 && object_isClass(v2))
  {
    v8 = NSStringFromClass(v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    v9 = 0LL;
  }

  id v10 = v9;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"encodedScene");
  if (v10) {
    CFDictionaryAddValue(v11, @"propertyRuntimeType", v10);
  }
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeData");
  CFDictionaryAddValue(v11, @"propertyFormat", @"public.data");
  uint64_t v15 = 1LL;
  CFNumberRef v12 = CFNumberCreate(0LL, kCFNumberCFIndexType, &v15);
  CFDictionaryAddValue(v11, @"propertyOptions", v12);
  CFRelease(v12);

  v16[1] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));

  return v13;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isEqualToString:@"encodedScene"] & 1) == 0
    && ![v8 isEqualToString:@"encodedPresentationScene"])
  {
    id v13 = v9;
    v14 = (NSString *)v8;
    if (-[NSString length](v14, "length"))
    {
      SEL v15 = NSSelectorFromString(v14);
      if ((objc_opt_respondsToSelector(v13, v15) & 1) != 0)
      {
        v16 = v14;
        if (v16)
        {
LABEL_9:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v13 valueForKey:v16]);
LABEL_26:

          goto LABEL_27;
        }
      }

      else
      {
        if (-[NSString length](v14, "length") < 2)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v14, "uppercaseString"));
        }

        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v14, "substringToIndex:", 1LL));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uppercaseString]);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v14, "substringFromIndex:", 1LL));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v19]);
        }

        v21 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v20]);
        SEL v22 = NSSelectorFromString(v21);
        if ((objc_opt_respondsToSelector(v13, v22) & 1) != 0) {
          v16 = v21;
        }
        else {
          v16 = 0LL;
        }

        if (v16) {
          goto LABEL_9;
        }
      }
    }

    if (a6)
    {
      v23 = v14;
      if (v13) {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v13));
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
      v33[0] = @"propertyName";
      v33[1] = @"objectDescription";
      v34[0] = v25;
      v34[1] = v24;
      v33[2] = @"errorDescription";
      v34[2] = &stru_34740;
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
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

    goto LABEL_26;
  }

  Class v10 = NSClassFromString(@"SCNKeyedArchiver");
  if ((objc_opt_respondsToSelector(v10, "archivedDataWithRootObject:options:") & 1) != 0)
  {
    id v11 = [v8 isEqualToString:@"encodedPresentationScene"];
    v31[0] = SCNSceneExportEmbedImages;
    v31[1] = SCNSceneExportEmbedReferences;
    v32[0] = &__kCFBooleanTrue;
    v32[1] = &__kCFBooleanTrue;
    v31[2] = SCNSceneExportPresentationTree;
    CFNumberRef v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    v32[2] = v12;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));

    a6 = (id *)objc_claimAutoreleasedReturnValue(-[objc_class archivedDataWithRootObject:options:](v10, "archivedDataWithRootObject:options:", v9, v13));
LABEL_27:

    goto LABEL_28;
  }

  a6 = 0LL;
LABEL_28:

  return a6;
}

@end