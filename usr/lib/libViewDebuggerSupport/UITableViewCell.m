@interface UITableViewCell
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UITableViewCell

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"indentationLevel");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"integer");
  v16[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"indentationWidth");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"CGf");
  v16[1] = v13;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"reuseIdentifier");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v12, @"propertyFormat", @"public.plain-text");
  v16[2] = v12;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"separatorInset");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"UIEdgeInsets");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeInsets");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v16[3] = v11;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"shouldIndentWhileEditing");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v10, @"propertyFormat", @"b");
  v16[4] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"showsReorderControl");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v16[5] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"accessoryType");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UITableViewCellAccessoryType");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v3, @"propertyFormat", @"integer");
  v16[6] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"editingAccessoryType");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UITableViewCellAccessoryType");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v16[7] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"selectionStyle");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UITableViewCellSelectionStyle");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v16[8] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"image");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, @"propertyOptions", v7);
  CFRelease(v7);
  v16[9] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 10LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"image"])
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

  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 imageView]);
  a6 = (id *)objc_claimAutoreleasedReturnValue([v10 image]);
LABEL_24:

  return a6;
}

@end