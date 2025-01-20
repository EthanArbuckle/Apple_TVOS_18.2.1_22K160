@interface UILabel
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UILabel

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"adjustsFontSizeToFitWidth");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v20[0] = Mutable;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"attributedText");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"NSAttributedString");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeAttributedString");
  CFDictionaryAddValue(v18, @"propertyFormat", @"attrStr");
  v20[1] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"enabled");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v20[2] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"font");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"UIFont");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeFont");
  CFDictionaryAddValue(v16, @"propertyFormat", @"font");
  v20[3] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"highlighted");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v20[4] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"highlightedTextColor");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v20[5] = v14;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"minimumScaleFactor");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"CGf");
  v20[6] = v13;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"numberOfLines");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  v20[7] = v11;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"shadowColor");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v20[8] = v12;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"shadowOffset");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf, CGf");
  v20[9] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"text");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.plain-text");
  v20[10] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"textColor");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v20[11] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"baselineAdjustment");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIBaselineAdjustment");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v20[12] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"lineBreakMode");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSLineBreakMode");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v20[13] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"textAlignment");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSTextAlignment");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v20[14] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"usesAttributedText");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v20[15] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 16LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"usesAttributedText"])
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
LABEL_6:
          a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v14]);
LABEL_23:

          goto LABEL_24;
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
          goto LABEL_6;
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

    goto LABEL_23;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 attributedText]);
  a6 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10 != 0LL));

LABEL_24:
  return a6;
}

@end