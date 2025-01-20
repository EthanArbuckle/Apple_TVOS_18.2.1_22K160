@interface UISearchBar
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (id)__dbg_scopeButtonTitles;
@end

@implementation UISearchBar

- (id)__dbg_scopeButtonTitles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar scopeButtonTitles](self, "scopeButtonTitles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", @", "));

  return v3;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"autocapitalizationType");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"integer");
  v28[0] = Mutable;
  v25 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"autocorrectionType");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v25, @"propertyFormat", @"integer");
  v28[1] = v25;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"backgroundImage");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, @"propertyOptions", v3);
  CFRelease(v3);
  v28[2] = v2;
  v24 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"barTintColor");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v28[3] = v24;
  v23 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"delegate");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v23, @"propertyFormat", @"objectInfo");
  v28[4] = v23;
  v22 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"placeholder");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v22, @"propertyFormat", @"public.plain-text");
  v28[5] = v22;
  v21 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"prompt");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v21, @"propertyFormat", @"public.plain-text");
  v28[6] = v21;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"scopeBarBackgroundImage");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v20 = v4;
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v28[7] = v4;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"searchFieldBackgroundPositionAdjustment");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"UIOffset");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeOffset");
  CFDictionaryAddValue(v19, @"propertyFormat", @"CGf, CGf");
  v28[8] = v19;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"searchTextPositionAdjustment");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"UIOffset");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeOffset");
  CFDictionaryAddValue(v18, @"propertyFormat", @"CGf, CGf");
  v28[9] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"showsBookmarkButton");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v28[10] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"showsCancelButton");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v16, @"propertyFormat", @"b");
  v28[11] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"showsScopeBar");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v28[12] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"showsSearchResultsButton");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v14, @"propertyFormat", @"b");
  v28[13] = v14;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"text");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.plain-text");
  v28[14] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"translucent");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v28[15] = v7;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"barStyle");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"UIBarStyle");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"integer");
  v28[16] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"keyboardType");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UIKeyboardType");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v9, @"propertyFormat", @"integer");
  v28[17] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"searchBarStyle");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"UISearchBarStyle");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v10, @"propertyFormat", @"uinteger");
  v28[18] = v10;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"scopeButtonTitles");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSArray");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v11, @"propertyFormat", @"public.plain-text");
  v28[19] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 20LL));

  return v12;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"scopeButtonTitles"])
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

  a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__dbg_scopeButtonTitles"));
LABEL_24:

  return a6;
}

@end