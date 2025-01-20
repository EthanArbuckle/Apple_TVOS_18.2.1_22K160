@interface UITextView
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UITextView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"allowsEditingTextAttributes");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v21[0] = Mutable;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"attributedText");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"NSAttributedString");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeAttributedString");
  CFDictionaryAddValue(v19, @"propertyFormat", @"attrStr");
  v21[1] = v19;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"delegate");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v18, @"propertyFormat", @"objectInfo");
  v21[2] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"editable");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v21[3] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"enablesReturnKeyAutomatically");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v16, @"propertyFormat", @"b");
  v21[4] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"secureTextEntry");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v21[5] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"selectable");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v14, @"propertyFormat", @"b");
  v21[6] = v14;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"text");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v12, @"propertyFormat", @"public.plain-text");
  v21[7] = v12;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"textColor");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v21[8] = v13;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"autocapitalizationType");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"UITextAutocapitalizationType");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  v21[9] = v11;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"autocorrectionType");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"UITextAutocorrectionType");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v10, @"propertyFormat", @"integer");
  v21[10] = v10;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"dataDetectorTypes");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIDataDetectorTypes");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v2, @"propertyFormat", @"uinteger");
  v21[11] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"font");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIFont");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeFont");
  CFDictionaryAddValue(v3, @"propertyFormat", @"font");
  v21[12] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"keyboardAppearance");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIKeyboardAppearance");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"uinteger");
  v21[13] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"keyboardType");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIKeyboardType");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v21[14] = v5;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"returnKeyType");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UIReturnKeyType");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v21[15] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"textAlignment");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"NSTextAlignment");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v21[16] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 17LL));

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"autocapitalizationType"])
  {
    id v10 = [v9 autocapitalizationType];
LABEL_11:
    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
LABEL_12:
    a6 = v11;
    goto LABEL_13;
  }

  if ([v8 isEqualToString:@"autocorrectionType"])
  {
    id v10 = [v9 autocorrectionType];
    goto LABEL_11;
  }

  if ([v8 isEqualToString:@"keyboardAppearance"])
  {
    id v10 = [v9 keyboardAppearance];
    goto LABEL_11;
  }

  if ([v8 isEqualToString:@"keyboardType"])
  {
    id v10 = [v9 keyboardType];
    goto LABEL_11;
  }

  if ([v8 isEqualToString:@"returnKeyType"])
  {
    id v10 = [v9 returnKeyType];
    goto LABEL_11;
  }

  if ([v8 isEqualToString:@"enablesReturnKeyAutomatically"])
  {
    id v13 = [v9 enablesReturnKeyAutomatically];
LABEL_18:
    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
    goto LABEL_12;
  }

  if ([v8 isEqualToString:@"secureTextEntry"])
  {
    id v13 = [v9 isSecureTextEntry];
    goto LABEL_18;
  }

  id v14 = v9;
  id v15 = v8;
  if (![v15 length]) {
    goto LABEL_31;
  }
  SEL v16 = NSSelectorFromString((NSString *)v15);
  if ((objc_opt_respondsToSelector(v14, v16) & 1) != 0)
  {
    v17 = (NSString *)v15;
  }

  else
  {
    if ((unint64_t)[v15 length] < 2)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v15 uppercaseString]);
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 substringToIndex:1]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uppercaseString]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v15 substringFromIndex:1]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:v20]);
    }

    v22 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v21]);
    SEL v23 = NSSelectorFromString(v22);
    v17 = (objc_opt_respondsToSelector(v14, v23) & 1) != 0 ? v22 : 0LL;
  }

  if (v17)
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue([v14 valueForKey:v17]);
  }

  else
  {
LABEL_31:
    if (a6)
    {
      v24 = (__CFString *)v15;
      if (v14) {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v14));
      }
      else {
        v25 = &stru_34740;
      }
      if (v24) {
        v26 = v24;
      }
      else {
        v26 = &stru_34740;
      }
      v31[0] = @"propertyName";
      v31[1] = @"objectDescription";
      v32[0] = v26;
      v32[1] = v25;
      v31[2] = @"errorDescription";
      v32[2] = &stru_34740;
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v28));

      id v30 = v29;
      *a6 = v30;

      v17 = 0LL;
      a6 = 0LL;
    }

    else
    {
      v17 = 0LL;
    }
  }

LABEL_13:
  return a6;
}

@end