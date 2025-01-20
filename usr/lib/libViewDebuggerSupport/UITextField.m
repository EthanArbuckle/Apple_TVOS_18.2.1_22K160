@interface UITextField
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UITextField

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"adjustsFontSizeToFitWidth");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v31[0] = Mutable;
  v28 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"allowsEditingTextAttributes");
  CFDictionaryAddValue(v28, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v28, @"propertyFormat", @"b");
  v31[1] = v28;
  v27 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"attributedText");
  CFDictionaryAddValue(v27, @"propertyRuntimeType", @"NSAttributedString");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeAttributedString");
  CFDictionaryAddValue(v27, @"propertyFormat", @"attrStr");
  v31[2] = v27;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"background");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v26 = v2;
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, @"propertyOptions", v3);
  CFRelease(v3);
  v31[3] = v2;
  v25 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"clearsOnBeginEditing");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v25, @"propertyFormat", @"b");
  v31[4] = v25;
  v24 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"delegate");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v24, @"propertyFormat", @"objectInfo");
  v31[5] = v24;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"disabledBackground");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v23 = v4;
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v31[6] = v4;
  v22 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"enablesReturnKeyAutomatically");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v22, @"propertyFormat", @"b");
  v31[7] = v22;
  v21 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"minimumFontSize");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v21, @"propertyFormat", @"CGf");
  v31[8] = v21;
  v20 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"placeholder");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v20, @"propertyFormat", @"public.plain-text");
  v31[9] = v20;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"secureTextEntry");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v19, @"propertyFormat", @"b");
  v31[10] = v19;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"text");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v18, @"propertyFormat", @"public.plain-text");
  v31[11] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"textColor");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v31[12] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"autocapitalizationType");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"UITextAutocapitalizationType");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v16, @"propertyFormat", @"integer");
  v31[13] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"autocorrectionType");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"UITextAutocorrectionType");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v15, @"propertyFormat", @"integer");
  v31[14] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"borderStyle");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"UITextBorderStyle");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v14, @"propertyFormat", @"integer");
  v31[15] = v14;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"clearButtonMode");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UITextFieldViewMode");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v31[16] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"font");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIFont");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeFont");
  CFDictionaryAddValue(v7, @"propertyFormat", @"font");
  v31[17] = v7;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"keyboardAppearance");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"UIKeyboardAppearance");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"integer");
  v31[18] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"keyboardType");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UIKeyboardType");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v9, @"propertyFormat", @"integer");
  v31[19] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"returnKeyType");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"UIReturnKeyType");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v10, @"propertyFormat", @"integer");
  v31[20] = v10;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"textAlignment");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSHashTableCallBacks");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v11, @"propertyFormat", @"uinteger");
  v31[21] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 22LL));

  return v12;
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