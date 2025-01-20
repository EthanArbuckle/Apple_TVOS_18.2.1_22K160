@interface UIViewController
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyChildGroupingID;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIViewController

+ (id)fallback_debugHierarchyChildGroupingID
{
  return @"com.apple.UIKit.UIViewController";
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v3 = @"com.apple.UIKit.UIView";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.UIKit.UIViewController"])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 childViewControllers]);
  }

  else if ([v6 isEqualToString:@"com.apple.UIKit.UIView"])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 viewIfLoaded]);
    v10 = (void *)v9;
    if (v9)
    {
      uint64_t v12 = v9;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    }

    else
    {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"automaticallyAdjustsScrollViewInsets");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v41[0] = Mutable;
  v38 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, @"propertyName", @"definesPresentationContext");
  CFDictionaryAddValue(v38, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v38, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v38, @"propertyFormat", @"b");
  v41[1] = v38;
  v37 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, @"propertyName", @"disablesAutomaticKeyboardDismissal");
  CFDictionaryAddValue(v37, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v37, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v37, @"propertyFormat", @"b");
  v41[2] = v37;
  v36 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, @"propertyName", @"editing");
  CFDictionaryAddValue(v36, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v36, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v36, @"propertyFormat", @"b");
  v41[3] = v36;
  v35 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, @"propertyName", @"extendedLayoutIncludesOpaqueBars");
  CFDictionaryAddValue(v35, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v35, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v35, @"propertyFormat", @"b");
  v41[4] = v35;
  v34 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, @"propertyName", @"hidesBottomBarWhenPushed");
  CFDictionaryAddValue(v34, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v34, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v34, @"propertyFormat", @"b");
  v41[5] = v34;
  v33 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, @"propertyName", @"isBeingDismissed");
  CFDictionaryAddValue(v33, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v33, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v33, @"propertyFormat", @"b");
  v41[6] = v33;
  v32 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, @"propertyName", @"isBeingPresented");
  CFDictionaryAddValue(v32, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v32, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v32, @"propertyFormat", @"b");
  v41[7] = v32;
  v31 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v31, @"propertyName", @"isMovingFromParentViewController");
  CFDictionaryAddValue(v31, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v31, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v31, @"propertyFormat", @"b");
  v41[8] = v31;
  v30 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v30, @"propertyName", @"isMovingToParentViewController");
  CFDictionaryAddValue(v30, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v30, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v30, @"propertyFormat", @"b");
  v41[9] = v30;
  v29 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, @"propertyName", @"modalPresentationCapturesStatusBarAppearance");
  CFDictionaryAddValue(v29, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v29, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v29, @"propertyFormat", @"b");
  v41[10] = v29;
  v28 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"modalInPopover");
  CFDictionaryAddValue(v28, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v28, @"propertyFormat", @"b");
  v41[11] = v28;
  v27 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"nibName");
  CFDictionaryAddValue(v27, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v27, @"propertyFormat", @"public.plain-text");
  v41[12] = v27;
  v26 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"preferredContentSize");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v26, @"propertyFormat", @"CGf, CGf");
  v41[13] = v26;
  v25 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"prefersStatusBarHidden");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v25, @"propertyFormat", @"b");
  v41[14] = v25;
  v24 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"providesPresentationContextTransitionStyle");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v24, @"propertyFormat", @"b");
  v41[15] = v24;
  v23 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"restorationIdentifier");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v23, @"propertyFormat", @"public.plain-text");
  v41[16] = v23;
  v22 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"restoresFocusAfterTransition");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v22, @"propertyFormat", @"b");
  v41[17] = v22;
  v21 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"shouldAutorotate");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v21, @"propertyFormat", @"b");
  v41[18] = v21;
  v20 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"shouldAutomaticallyForwardAppearanceMethods");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v20, @"propertyFormat", @"b");
  v41[19] = v20;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"title");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v19, @"propertyFormat", @"public.plain-text");
  v41[20] = v19;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"view");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v18, @"propertyFormat", @"objectInfo");
  v41[21] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"viewLoaded");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v41[22] = v17;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"modalPresentationStyle");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"UIModalPresentationStyle");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v16, @"propertyFormat", @"integer");
  v41[23] = v16;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"modalTransitionStyle");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"UIModalTransitionStyle");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v15, @"propertyFormat", @"integer");
  v41[24] = v15;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"nibBundlePath");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v14, @"propertyFormat", @"public.plain-text");
  v41[25] = v14;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"preferredStatusBarStyle");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"UIStatusBarStyle");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v13, @"propertyFormat", @"integer");
  v41[26] = v13;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"preferredStatusBarUpdateAnimation");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIStatusBarAnimation");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v2, @"propertyFormat", @"integer");
  v41[27] = v2;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"preferredInterfaceOrientationForPresentation");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIInterfaceOrientation");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v3, @"propertyFormat", @"integer");
  v41[28] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"supportedInterfaceOrientations");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIInterfaceOrientationMask");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v41[29] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"traitCollectionVerticalSizeClass");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v41[30] = v5;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"traitCollectionHorizontalSizeClass");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v41[31] = v6;
  id v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"traitCollectionLayoutDirection");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UITraitEnvironmentLayoutDirection");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v41[32] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 33LL));

  uint64_t v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"traitCollectionUserInterfaceStyle");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UIUserInterfaceStyle");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v9, @"propertyFormat", @"integer");
  v40 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v10]);
  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"nibBundlePath"])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 nibBundle]);
    v11 = (id *)objc_claimAutoreleasedReturnValue([v10 bundlePath]);
    goto LABEL_14;
  }

  if (![v8 isEqualToString:@"view"])
  {
    if ([v8 isEqualToString:@"traitCollectionUserInterfaceStyle"])
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
      id v12 = [v10 userInterfaceStyle];
    }

    else if ([v8 isEqualToString:@"traitCollectionVerticalSizeClass"])
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
      id v12 = [v10 verticalSizeClass];
    }

    else if ([v8 isEqualToString:@"traitCollectionHorizontalSizeClass"])
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
      id v12 = [v10 horizontalSizeClass];
    }

    else
    {
      if (![v8 isEqualToString:@"traitCollectionLayoutDirection"])
      {
        id v10 = v9;
        id v14 = v8;
        if (![v14 length]) {
          goto LABEL_29;
        }
        SEL v15 = NSSelectorFromString((NSString *)v14);
        if ((objc_opt_respondsToSelector(v10, v15) & 1) != 0)
        {
          v16 = (NSString *)v14;
        }

        else
        {
          if ((unint64_t)[v14 length] < 2)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);
          }

          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 substringToIndex:1]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uppercaseString]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:1]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v19]);
          }

          v21 = (NSString *)objc_claimAutoreleasedReturnValue([@"is" stringByAppendingString:v20]);
          SEL v22 = NSSelectorFromString(v21);
          v16 = (objc_opt_respondsToSelector(v10, v22) & 1) != 0 ? v21 : 0LL;
        }

        if (v16)
        {
          a6 = (id *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v16]);
        }

        else
        {
LABEL_29:
          if (a6)
          {
            v23 = (__CFString *)v14;
            if (v10) {
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v10));
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
            v30[0] = @"propertyName";
            v30[1] = @"objectDescription";
            v31[0] = v25;
            v31[1] = v24;
            v30[2] = @"errorDescription";
            v31[2] = &stru_34740;
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
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
        }

        goto LABEL_15;
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 traitCollection]);
      id v12 = [v10 layoutDirection];
    }

    v11 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
LABEL_14:
    a6 = v11;
LABEL_15:

    goto LABEL_16;
  }

  a6 = (id *)objc_claimAutoreleasedReturnValue([v9 viewIfLoaded]);
LABEL_16:

  return a6;
}

@end