@interface SCNView
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (id)__dbg_pointOfViewIndexPath;
@end

@implementation SCNView

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v3 = @"com.apple.SceneKit.SCNScene";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.SceneKit.SCNScene"])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scene]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scene]);
      v10 = v8;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"allowsCameraControl");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v13[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"autoenablesDefaultLighting");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v3, @"propertyFormat", @"b");
  v13[1] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"jitteringEnabled");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v4, @"propertyFormat", @"b");
  v13[2] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"loops");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v5, @"propertyFormat", @"b");
  v13[3] = v5;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"playing");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v13[4] = v6;
  v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSIndexPath);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"pointOfViewIndexPath");
  if (v9) {
    CFDictionaryAddValue(v10, @"propertyRuntimeType", v9);
  }
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v10, @"propertyFormat", @"public.plain-text");

  v13[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 6LL));

  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"pointOfViewIndexPath"])
  {
    id v10 = v9;
    v11 = (NSString *)v8;
    if (-[NSString length](v11, "length"))
    {
      SEL v12 = NSSelectorFromString(v11);
      if ((objc_opt_respondsToSelector(v10, v12) & 1) != 0)
      {
        v13 = v11;
        if (v13)
        {
LABEL_6:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v13]);
LABEL_23:

          goto LABEL_24;
        }
      }

      else
      {
        if (-[NSString length](v11, "length") < 2)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v11, "uppercaseString"));
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v11, "substringToIndex:", 1LL));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v11, "substringFromIndex:", 1LL));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:v16]);
        }

        v18 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v17]);
        SEL v19 = NSSelectorFromString(v18);
        if ((objc_opt_respondsToSelector(v10, v19) & 1) != 0) {
          v13 = v18;
        }
        else {
          v13 = 0LL;
        }

        if (v13) {
          goto LABEL_6;
        }
      }
    }

    if (a6)
    {
      v20 = v11;
      if (v10) {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v10));
      }
      else {
        v21 = &stru_34740;
      }
      if (v20) {
        v22 = v20;
      }
      else {
        v22 = &stru_34740;
      }
      v28[0] = @"propertyName";
      v28[1] = @"objectDescription";
      v29[0] = v22;
      v29[1] = v21;
      v28[2] = @"errorDescription";
      v29[2] = &stru_34740;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v24));

      id v26 = v25;
      *a6 = v26;

      v13 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v13 = 0LL;
    }

    goto LABEL_23;
  }

  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__dbg_pointOfViewIndexPath"));
LABEL_24:

  return a6;
}

- (id)__dbg_pointOfViewIndexPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView pointOfView](self, "pointOfView"));
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView scene](self, "scene"));

  if (v4)
  {
    if ((objc_opt_respondsToSelector(&OBJC_CLASS___SCNScene, "_indexPathForNode:") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SCNScene _indexPathForNode:](&OBJC_CLASS___SCNScene, "_indexPathForNode:", v3));
      goto LABEL_6;
    }

@end