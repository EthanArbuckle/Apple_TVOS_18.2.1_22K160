@interface UINavigationBar
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UINavigationBar

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"backIndicatorImage");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v19 = Mutable;
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"propertyOptions", v3);
  CFRelease(v3);
  v21[0] = Mutable;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"backIndicatorTransitionMaskImage");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v16 = v4;
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v21[1] = v4;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"barTintColor");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v21[2] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"delegate");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v17, @"propertyFormat", @"objectInfo");
  v21[3] = v17;
  v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"shadowImage");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v6, @"propertyOptions", v7);
  CFRelease(v7);
  v21[4] = v6;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"translucent");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v21[5] = v15;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"barStyle");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"UIBarStyle");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"integer");
  v21[6] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"titleFont");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UIFont");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeFont");
  CFDictionaryAddValue(v9, @"propertyFormat", @"font");
  v21[7] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"titleTextColor");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v21[8] = v10;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"titleTextShadowColor");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v21[9] = v11;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"titleTextShadowOffset");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v12, @"propertyFormat", @"CGf, CGf");
  v21[10] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 11LL));

  return v13;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isEqualToString:@"dbg_hasLargeTitleTextAttributes"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"titleFont"])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 titleTextAttributes]);
      id v11 = v10;
      v12 = &NSFontAttributeName;
    }

    else
    {
      if (![v8 isEqualToString:@"titleTextColor"])
      {
        if (![v8 isEqualToString:@"titleTextShadowColor"])
        {
          if ([v8 isEqualToString:@"titleTextShadowOffset"])
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v9 titleTextAttributes]);
            id v11 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSShadowAttributeName]);

            [v11 shadowOffset];
            uint64_t valuePtr = v17;
            v38[0] = v18;
            v19 = (const void **)malloc(0x10uLL);
            __CFDictionary *v19 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
            v19[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, v38);
            a6 = (id *)CFArrayCreate(0LL, v19, 2LL, &kCFTypeArrayCallBacks);
            CFRelease(*v19);
            CFRelease(v19[1]);
            free(v19);
          }

          else
          {
            id v11 = v9;
            id v20 = v8;
            if (![v20 length]) {
              goto LABEL_27;
            }
            SEL v21 = NSSelectorFromString((NSString *)v20);
            if ((objc_opt_respondsToSelector(v11, v21) & 1) != 0)
            {
              v22 = (NSString *)v20;
            }

            else
            {
              if ((unint64_t)[v20 length] < 2)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue([v20 uppercaseString]);
              }

              else
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue([v20 substringToIndex:1]);
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uppercaseString]);
                v25 = (void *)objc_claimAutoreleasedReturnValue([v20 substringFromIndex:1]);
                v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:v25]);
              }

              v27 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v26]);
              SEL v28 = NSSelectorFromString(v27);
              v22 = (objc_opt_respondsToSelector(v11, v28) & 1) != 0 ? v27 : 0LL;
            }

            if (v22)
            {
              a6 = (id *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v22]);
            }

            else
            {
LABEL_27:
              if (a6)
              {
                v29 = (__CFString *)v20;
                if (v11) {
                  v30 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v11));
                }
                else {
                  v30 = &stru_34740;
                }
                if (v29) {
                  v31 = v29;
                }
                else {
                  v31 = &stru_34740;
                }
                v36[0] = @"propertyName";
                v36[1] = @"objectDescription";
                uint64_t valuePtr = v31;
                v38[0] = v30;
                v36[2] = @"errorDescription";
                v38[1] = &stru_34740;
                v32 = v31;
                v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &valuePtr,  v36,  3LL));
                v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  100LL,  v33));

                id v35 = v34;
                *a6 = v35;

                v22 = 0LL;
                a6 = 0LL;
              }

              else
              {
                v22 = 0LL;
              }
            }
          }

          goto LABEL_9;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 titleTextAttributes]);
        id v11 = (id)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSShadowAttributeName]);

        v13 = (id *)objc_claimAutoreleasedReturnValue([v11 shadowColor]);
LABEL_8:
        a6 = v13;
LABEL_9:

        goto LABEL_10;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 titleTextAttributes]);
      id v11 = v10;
      v12 = &NSForegroundColorAttributeName;
    }

    v13 = (id *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:*v12]);
    goto LABEL_8;
  }

  a6 = (id *)&__kCFBooleanTrue;
LABEL_10:

  return a6;
}

@end