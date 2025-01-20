@interface UIView
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyChildGroupingID;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)__dbg_hasAmbiguousLayout;
- (BOOL)__dbg_renderingModeIsMultiLayer;
- (BOOL)__dbg_shouldIgnoreScrollableContentHeightAmbiguity;
- (BOOL)__dbg_shouldIgnoreScrollableContentWidthAmbiguity;
- (BOOL)__dbg_wantsAutoLayout;
- (double)__dbg_firstBaselineOffsetFromTop;
- (double)__dbg_lastBaselineOffsetFromBottom;
- (id)__dbg_constraintsAffectingLayoutForAxis:(int64_t)a3;
- (id)__dbg_formattedDisplayName;
- (id)__dbg_layer;
- (id)__dbg_readableContentGuide;
- (id)__dbg_snapshotImage;
- (id)__dbg_snapshotImageRenderedUsingDrawHierarchyInRect;
- (id)__dbg_viewController;
- (id)__dbg_viewForFirstBaselineLayout;
- (id)__dbg_viewForLastBaselineLayout;
- (unint64_t)__dbg_ambiguityStatusMask;
@end

@implementation UIView

+ (id)fallback_debugHierarchyChildGroupingID
{
  return @"com.apple.UIKit.UIView";
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v3[0] = @"com.apple.UIKit.NSLayoutConstraint";
  v3[1] = @"com.apple.QuartzCore.CALayer";
  v3[2] = @"com.apple.UIKit.UIViewController";
  v3[3] = @"com.apple.UIKit.UILayoutGuide";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  4LL));
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqualToString:@"com.apple.UIKit.UIView"])
  {
    if ([v6 isEqualToString:@"com.apple.UIKit.NSLayoutConstraint"])
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 constraints]);
      goto LABEL_5;
    }

    if ([v6 isEqualToString:@"com.apple.QuartzCore.CALayer"])
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_layer"));
      v12 = (void *)v11;
      if (!v11)
      {
        v9 = 0LL;
        goto LABEL_17;
      }

      uint64_t v15 = v11;
      v13 = &v15;
    }

    else
    {
      if (![v6 isEqualToString:@"com.apple.UIKit.UIViewController"])
      {
        if (![v6 isEqualToString:@"com.apple.UIKit.UILayoutGuide"])
        {
          v9 = 0LL;
          goto LABEL_6;
        }

        uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 layoutGuides]);
        goto LABEL_5;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_viewController"));

      if (!v9) {
        goto LABEL_6;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__dbg_viewController"));
      v14 = v12;
      v13 = (uint64_t *)&v14;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 1LL));
LABEL_17:

    goto LABEL_6;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 subviews]);
LABEL_5:
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"alpha");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf");
  v69[0] = Mutable;
  v65 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v65, @"propertyName", @"accessibilityCustomActions");
  CFDictionaryAddValue(v65, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v65, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v65, @"propertyFormat", @"public.plain-text");
  v69[1] = v65;
  v64 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v64, @"propertyName", @"accessibilityElements");
  CFDictionaryAddValue(v64, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v64, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v64, @"propertyFormat", @"public.plain-text");
  v69[2] = v64;
  v63 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v63, @"propertyName", @"accessibilityElementIsFocused");
  CFDictionaryAddValue(v63, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v63, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v63, @"propertyFormat", @"b");
  v69[3] = v63;
  v62 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v62, @"propertyName", @"accessibilityLabel");
  CFDictionaryAddValue(v62, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v62, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v62, @"propertyFormat", @"public.plain-text");
  v69[4] = v62;
  v61 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v61, @"propertyName", @"accessibilityHint");
  CFDictionaryAddValue(v61, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v61, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v61, @"propertyFormat", @"public.plain-text");
  v69[5] = v61;
  v60 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v60, @"propertyName", @"accessibilityIdentifier");
  CFDictionaryAddValue(v60, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v60, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v60, @"propertyFormat", @"public.plain-text");
  v69[6] = v60;
  v59 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v59, @"propertyName", @"accessibilityValue");
  CFDictionaryAddValue(v59, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v59, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v59, @"propertyFormat", @"public.plain-text");
  v69[7] = v59;
  v58 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v58, @"propertyName", @"autoresizesSubviews");
  CFDictionaryAddValue(v58, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v58, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v58, @"propertyFormat", @"b");
  v69[8] = v58;
  v57 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v57, @"propertyName", @"backgroundColor");
  CFDictionaryAddValue(v57, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v57, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v69[9] = v57;
  v56 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v56, @"propertyName", @"bounds");
  CFDictionaryAddValue(v56, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v56, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v56, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[10] = v56;
  v55 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v55, @"propertyName", @"clearsContextBeforeDrawing");
  CFDictionaryAddValue(v55, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v55, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v55, @"propertyFormat", @"b");
  v69[11] = v55;
  v54 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v54, @"propertyName", @"clipsToBounds");
  CFDictionaryAddValue(v54, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v54, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v54, @"propertyFormat", @"b");
  v69[12] = v54;
  v53 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v53, @"propertyName", @"frame");
  CFDictionaryAddValue(v53, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v53, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v53, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[13] = v53;
  v52 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v52, @"propertyName", @"hasAmbiguousLayout");
  CFDictionaryAddValue(v52, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v52, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v52, @"propertyFormat", @"b");
  v69[14] = v52;
  v51 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v51, @"propertyName", @"hidden");
  CFDictionaryAddValue(v51, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v51, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v51, @"propertyFormat", @"b");
  v69[15] = v51;
  v50 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v50, @"propertyName", @"isAccessibilityElement");
  CFDictionaryAddValue(v50, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v50, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v50, @"propertyFormat", @"b");
  v69[16] = v50;
  v49 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v49, @"propertyName", @"layer");
  CFDictionaryAddValue(v49, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v49, @"propertyFormat", @"objectInfo");
  v69[17] = v49;
  v48 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v48, @"propertyName", @"layoutMargins");
  CFDictionaryAddValue(v48, @"propertyRuntimeType", @"UIEdgeInsets");
  CFDictionaryAddValue(v48, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeInsets");
  CFDictionaryAddValue(v48, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[18] = v48;
  v47 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v47, @"propertyName", @"multipleTouchEnabled");
  CFDictionaryAddValue(v47, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v47, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v47, @"propertyFormat", @"b");
  v69[19] = v47;
  v46 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, @"propertyName", @"opaque");
  CFDictionaryAddValue(v46, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v46, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v46, @"propertyFormat", @"b");
  v69[20] = v46;
  v45 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v45, @"propertyName", @"userInteractionEnabled");
  CFDictionaryAddValue(v45, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v45, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v45, @"propertyFormat", @"b");
  v69[21] = v45;
  v44 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v44, @"propertyName", @"tag");
  CFDictionaryAddValue(v44, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v44, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v44, @"propertyFormat", @"integer");
  v69[22] = v44;
  v43 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v43, @"propertyName", @"tintColor");
  CFDictionaryAddValue(v43, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v43, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v69[23] = v43;
  v42 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v42, @"propertyName", @"ambiguityStatusMask");
  CFDictionaryAddValue(v42, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v42, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v42, @"propertyFormat", @"integer");
  v69[24] = v42;
  v41 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v41, @"propertyName", @"autoresizingMask");
  CFDictionaryAddValue(v41, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v41, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v41, @"propertyFormat", @"integer");
  v69[25] = v41;
  v40 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v40, @"propertyName", @"autoresizingMask");
  CFDictionaryAddValue(v40, @"propertyRuntimeType", @"UIViewAutoresizing");
  CFDictionaryAddValue(v40, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v40, @"propertyFormat", @"uinteger");
  v69[26] = v40;
  v39 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v39, @"propertyName", @"contentCompressionResistancePriorityHorizontal");
  CFDictionaryAddValue(v39, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v39, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v39, @"propertyFormat", @"f");
  v69[27] = v39;
  v38 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, @"propertyName", @"contentCompressionResistancePriorityVertical");
  CFDictionaryAddValue(v38, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v38, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v38, @"propertyFormat", @"f");
  v69[28] = v38;
  v37 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, @"propertyName", @"contentHuggingPriorityHorizontal");
  CFDictionaryAddValue(v37, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v37, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v37, @"propertyFormat", @"f");
  v69[29] = v37;
  v36 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, @"propertyName", @"contentHuggingPriorityVertical");
  CFDictionaryAddValue(v36, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v36, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v36, @"propertyFormat", @"f");
  v69[30] = v36;
  v35 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, @"propertyName", @"contentMode");
  CFDictionaryAddValue(v35, @"propertyRuntimeType", @"UIViewContentMode");
  CFDictionaryAddValue(v35, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v35, @"propertyFormat", @"integer");
  v69[31] = v35;
  v34 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, @"propertyName", @"contentStretch");
  CFDictionaryAddValue(v34, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v34, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v34, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[32] = v34;
  v33 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, @"propertyName", @"dbgFormattedDisplayName");
  CFDictionaryAddValue(v33, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v33, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v33, @"propertyFormat", @"public.plain-text");
  v69[33] = v33;
  v32 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, @"propertyName", @"dbgInspectedDebugDescription");
  CFDictionaryAddValue(v32, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v32, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v32, @"propertyFormat", @"public.plain-text");
  v69[34] = v32;
  v2 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"snapshotImage");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v31 = v2;
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, @"propertyOptions", v3);
  CFRelease(v3);
  v69[35] = v2;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"snapshotImageRenderedUsingDrawHierarchyInRect");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v30 = v4;
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1LL;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v69[36] = v4;
  v29 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, @"propertyName", @"tintAdjustmentMode");
  CFDictionaryAddValue(v29, @"propertyRuntimeType", @"UIViewTintAdjustmentMode");
  CFDictionaryAddValue(v29, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v29, @"propertyFormat", @"integer");
  v69[37] = v29;
  v28 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"dbgViewForFirstBaselineLayout");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v28, @"propertyFormat", @"objectInfo");
  v69[38] = v28;
  v27 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"dbgViewForLastBaselineLayout");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v27, @"propertyFormat", @"objectInfo");
  v69[39] = v27;
  v26 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"layerClass");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v26, @"propertyFormat", @"public.plain-text");
  v69[40] = v26;
  v25 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"horizontalAffectingConstraints");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v25, @"propertyFormat", @"public.plain-text");
  v69[41] = v25;
  v24 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"verticalAffectingConstraints");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v24, @"propertyFormat", @"public.plain-text");
  v69[42] = v24;
  v23 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"firstBaselineOffsetFromTop");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v23, @"propertyFormat", @"CGf");
  v69[43] = v23;
  v22 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"lastBaselineOffsetFromBottom");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v22, @"propertyFormat", @"CGf");
  v69[44] = v22;
  v21 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"dbgRenderingModeIsMultiLayer");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v21, @"propertyFormat", @"b");
  v69[45] = v21;
  v20 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"accessibilityTraits");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"unsigned long long");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v20, @"propertyFormat", @"ull");
  v69[46] = v20;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v19, @"propertyFormat", @"CGf, CGf");
  v69[47] = v19;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"anchorPointZ");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v18, @"propertyFormat", @"CGf");
  v69[48] = v18;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"position");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v17, @"propertyFormat", @"CGf, CGf");
  v69[49] = v17;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"zPosition");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  v69[50] = v6;
  id v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"traitCollectionVerticalSizeClass");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v69[51] = v7;
  uint64_t v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"traitCollectionHorizontalSizeClass");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"integer");
  v69[52] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"traitCollectionLayoutDirection");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UITraitEnvironmentLayoutDirection");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v9, @"propertyFormat", @"integer");
  v69[53] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"dbgSubviewHierarchy");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeData");
  CFDictionaryAddValue(v10, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8LL;
  CFNumberRef v11 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v10, @"visibility", v11);
  CFRelease(v11);
  v69[54] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 55LL));

  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"traitCollectionUserInterfaceStyle");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"UIUserInterfaceStyle");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v13, @"propertyFormat", @"integer");
  v68 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v14]);
  return v15;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (![v9 isEqualToString:@"accessibilityCustomActions"])
  {
    if ([v9 isEqualToString:@"accessibilityElements"])
    {
      CFNumberRef v11 = (void *)objc_claimAutoreleasedReturnValue([a1 accessibilityElements]);
      goto LABEL_5;
    }

    if ([v9 isEqualToString:@"snapshotImage"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_snapshotImage"));
LABEL_39:
      a6 = v14;
      goto LABEL_40;
    }

    if ([v9 isEqualToString:@"snapshotImageRenderedUsingDrawHierarchyInRect"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_snapshotImageRenderedUsingDrawHierarchyInRect"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"dbgViewForFirstBaselineLayout"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_viewForFirstBaselineLayout"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"dbgViewForLastBaselineLayout"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_viewForLastBaselineLayout"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"ambiguityStatusMask"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "__dbg_ambiguityStatusMask")));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"horizontalAffectingConstraints"])
    {
      uint64_t v15 = v10;
      uint64_t v16 = 0LL;
LABEL_22:
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "__dbg_constraintsAffectingLayoutForAxis:", v16));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"verticalAffectingConstraints"])
    {
      uint64_t v15 = v10;
      uint64_t v16 = 1LL;
      goto LABEL_22;
    }

    if ([v9 isEqualToString:@"firstBaselineOffsetFromTop"])
    {
      objc_msgSend(v10, "__dbg_firstBaselineOffsetFromTop");
LABEL_27:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"lastBaselineOffsetFromBottom"])
    {
      objc_msgSend(v10, "__dbg_lastBaselineOffsetFromBottom");
      goto LABEL_27;
    }

    if ([v9 isEqualToString:@"contentCompressionResistancePriorityHorizontal"])
    {
      v17 = v10;
      uint64_t v18 = 0LL;
LABEL_32:
      [v17 contentCompressionResistancePriorityForAxis:v18];
LABEL_38:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"contentCompressionResistancePriorityVertical"])
    {
      v17 = v10;
      uint64_t v18 = 1LL;
      goto LABEL_32;
    }

    if ([v9 isEqualToString:@"contentHuggingPriorityHorizontal"])
    {
      v19 = v10;
      uint64_t v20 = 0LL;
LABEL_37:
      [v19 contentHuggingPriorityForAxis:v20];
      goto LABEL_38;
    }

    if ([v9 isEqualToString:@"contentHuggingPriorityVertical"])
    {
      v19 = v10;
      uint64_t v20 = 1LL;
      goto LABEL_37;
    }

    if ([v9 isEqualToString:@"dbgFormattedDisplayName"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__dbg_formattedDisplayName"));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"dbgInspectedDebugDescription"])
    {
      v14 = (id *)objc_claimAutoreleasedReturnValue([v10 debugDescription]);
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"hasAmbiguousLayout"])
    {
      id v22 = objc_msgSend(v10, "__dbg_hasAmbiguousLayout");
LABEL_47:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"layerClass"])
    {
      v23 = (id *)[(id)objc_opt_class(v10) layerClass];
      a6 = v23;
      if (!v23) {
        goto LABEL_40;
      }
      if (object_isClass(v23))
      {
        v24 = NSStringFromClass((Class)a6);
        v14 = (id *)objc_claimAutoreleasedReturnValue(v24);
        goto LABEL_39;
      }

- (BOOL)__dbg_wantsAutoLayout
{
  if ((objc_opt_respondsToSelector(self, "_wantsAutolayout") & 1) != 0) {
    return -[UIView _wantsAutolayout](self, "_wantsAutolayout");
  }
  else {
    return 0;
  }
}

- (BOOL)__dbg_hasAmbiguousLayout
{
  if (!-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")) {
    return 0;
  }
  CFNumberRef v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _layoutVariablesWithAmbiguousValue](self, "_layoutVariablesWithAmbiguousValue"));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (unint64_t)__dbg_ambiguityStatusMask
{
  CFNumberRef v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _layoutVariablesWithAmbiguousValue](self, "_layoutVariablesWithAmbiguousValue"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  CFNumberRef v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (!v5) {
    goto LABEL_7;
  }
  while ((objc_msgSend(v5, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

    CFNumberRef v5 = v6;
    if (!v6) {
      goto LABEL_8;
    }
  }

  else {
LABEL_7:
  }
    id v6 = 0LL;
LABEL_8:
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[UIView _minXVariable](self, "_minXVariable"));
  if (v7)
  {
    else {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _minYVariable](self, "_minYVariable"));
  if (v9)
  {
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _boundsWidthVariable](self, "_boundsWidthVariable"));
  if (v10)
  {
  }

  CFNumberRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _boundsHeightVariable](self, "_boundsHeightVariable"));
  if (v11)
  {
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _contentWidthVariable](self, "_contentWidthVariable"));
  uint64_t v15 = (void *)v7;
  if (v12)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity]( self,  "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")
      && [v4 containsObject:v12])
    {
      v8 |= 0x20uLL;
    }

    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity]( self,  "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")
      && ![v6 hasValue:0 forVariable:v12])
    {
      v8 |= 0x4000uLL;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _contentHeightVariable](self, "_contentHeightVariable"));
  if (v13)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity]( self,  "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")
      && [v4 containsObject:v13])
    {
      v8 |= 0x40uLL;
    }

    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity]( self,  "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")
      && ![v6 hasValue:0 forVariable:v13])
    {
      v8 |= 0x8000uLL;
    }
  }

  return v8;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentWidthAmbiguity
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIScrollView);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0) {
    return 0;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentHeightAmbiguity
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIScrollView);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0) {
    return 0;
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (double)__dbg_firstBaselineOffsetFromTop
{
  v2 = self;
  uint64_t v3 = v2;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout"))
  {
    uint64_t v3 = v2;
    if ((objc_opt_respondsToSelector(v2, "viewForFirstBaselineLayout") & 1) != 0)
    {
      uint64_t v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView viewForFirstBaselineLayout](v2, "viewForFirstBaselineLayout"));
    }
  }

  double v4 = 0.0;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(v3, "_firstBaselineOffsetFromTop") & 1) != 0)
  {
    -[UIView _firstBaselineOffsetFromTop](v3, "_firstBaselineOffsetFromTop");
    double v4 = v5;
  }

  -[UIView bounds](v3, "bounds");
  -[UIView alignmentRectForFrame:](v3, "alignmentRectForFrame:");
  -[UIView convertRect:toView:](v3, "convertRect:toView:", v2);
  double v7 = v6;
  -[UIView bounds](v2, "bounds");
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  double v9 = v4 + v7 + v8;

  return v9;
}

- (double)__dbg_lastBaselineOffsetFromBottom
{
  v2 = self;
  uint64_t v3 = v2;
  if (-[UIView __dbg_wantsAutoLayout](v2, "__dbg_wantsAutoLayout"))
  {
    uint64_t v3 = v2;
    if ((objc_opt_respondsToSelector(v2, "viewForLastBaselineLayout") & 1) != 0)
    {
      uint64_t v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView viewForLastBaselineLayout](v2, "viewForLastBaselineLayout"));
    }
  }

  double v4 = 0.0;
  if (-[UIView __dbg_wantsAutoLayout](v3, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(v3, "_baselineOffsetFromBottom") & 1) != 0)
  {
    -[UIView _baselineOffsetFromBottom](v3, "_baselineOffsetFromBottom");
    double v4 = v5;
  }

  -[UIView bounds](v3, "bounds");
  -[UIView alignmentRectForFrame:](v3, "alignmentRectForFrame:");
  -[UIView convertRect:toView:](v3, "convertRect:toView:", v2);
  double v7 = v6;
  double v9 = v8;
  -[UIView bounds](v2, "bounds");
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  double v12 = v4 + v10 + v11 - (v7 + v9);

  return v12;
}

- (id)__dbg_viewForFirstBaselineLayout
{
  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "viewForFirstBaselineLayout") & 1) != 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout"));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)__dbg_viewForLastBaselineLayout
{
  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "viewForLastBaselineLayout") & 1) != 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView viewForLastBaselineLayout](self, "viewForLastBaselineLayout"));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)__dbg_readableContentGuide
{
  if (-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")
    && (objc_opt_respondsToSelector(self, "readableContentGuide") & 1) != 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView readableContentGuide](self, "readableContentGuide"));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)__dbg_constraintsAffectingLayoutForAxis:(int64_t)a3
{
  if (!-[UIView __dbg_wantsAutoLayout](self, "__dbg_wantsAutoLayout")) {
    return 0LL;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView constraintsAffectingLayoutForAxis:](self, "constraintsAffectingLayoutForAxis:", a3));
  if ([v5 count])
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        double v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8LL * (void)v11)) {
            double v12 = (__CFString *)CFStringCreateWithFormat( 0LL,  0LL,  @"%p",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11));
          }
          else {
            double v12 = 0LL;
          }
          [v6 addObject:v12];

          double v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)__dbg_viewController
{
  if ((objc_opt_respondsToSelector(self, "_viewDelegate") & 1) != 0) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _viewDelegate](self, "_viewDelegate"));
  }
  else {
    uint64_t v3 = 0LL;
  }
  return v3;
}

- (id)__dbg_formattedDisplayName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSAttributedString);
    char v8 = objc_opt_isKindOfClass(v6, v7);

    if ((v8 & 1) == 0) {
      goto LABEL_5;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView accessibilityLabel](self, "accessibilityLabel"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v9 string]);
  }

  if (!v6)
  {
LABEL_5:
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIButton);
    if ((objc_opt_isKindOfClass(self, v10) & 1) != 0)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView currentTitle](self, "currentTitle"));
      return v6;
    }

    if ((objc_opt_respondsToSelector(self, "text") & 1) != 0)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[UIView text](self, "text"));
    }

    else
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___UIDatePicker);
      if ((objc_opt_isKindOfClass(self, v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView date](self, "date"));
        id v14 = (id)objc_claimAutoreleasedReturnValue([v13 description]);
LABEL_17:
        double v6 = v14;

        return v6;
      }

      if ((objc_opt_respondsToSelector(self, "title") & 1) == 0)
      {
        double v6 = 0LL;
        return v6;
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[UIView title](self, "title"));
    }

    v13 = (void *)v11;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
      __int128 v16 = v13;
    }
    else {
      __int128 v16 = 0LL;
    }
    id v14 = v16;
    goto LABEL_17;
  }

  return v6;
}

- (id)__dbg_snapshotImage
{
  double v4 = v3;
  -[UIView bounds](self, "bounds");
  CGContextRef CurrentContext = 0LL;
  if (v4 > 0.0 && v5 > 0.0 && v4 * v5 < 16000000.0)
  {
    Class v7 = NSClassFromString(@"GLKView");
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0
      || (Class v8 = NSClassFromString(@"SKView"), (objc_opt_isKindOfClass(self, v8) & 1) != 0)
      || (Class v9 = NSClassFromString(@"SCNView"), (objc_opt_isKindOfClass(self, v9) & 1) != 0)
      || (Class v10 = NSClassFromString(@"RealityKit.ARView"), (objc_opt_isKindOfClass(self, v10) & 1) != 0))
    {
      CGContextRef CurrentContext = (CGContextRef)objc_claimAutoreleasedReturnValue(-[UIView snapshot](self, "snapshot"));
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
      id v13 = [v12 count];
      id v14 = (char *)&v29 - ((4LL * (void)v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      if (v13)
      {
        uint64_t v15 = 0LL;
        do
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v15]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 layer]);
          [v17 opacity];
          *(_DWORD *)&v14[4 * (void)v15] = v18;

          v19 = (void *)objc_claimAutoreleasedReturnValue([v16 layer]);
          [v19 setOpacity:3.18618444e-58];

          uint64_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
      }

      -[UIView bounds](self, "bounds");
      v30.width = v20;
      v30.height = v21;
      UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
      CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
      if (CurrentContext)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        [v22 renderInContext:CurrentContext];

        ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
        CGContextRef CurrentContext = (CGContextRef)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      }

      UIGraphicsEndImageContext();
      if (v13)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:i]);
          int v26 = *(_DWORD *)&v14[4 * (void)i];
          v27 = (void *)objc_claimAutoreleasedReturnValue([v25 layer]);
          LODWORD(v28) = v26;
          [v27 setOpacity:v28];
        }
      }
    }
  }

  return CurrentContext;
}

- (id)__dbg_snapshotImageRenderedUsingDrawHierarchyInRect
{
  double v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (!v3)
  {
    double v4 = self;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v4, "superview"));

    if (v5)
    {
      do
      {
        double v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](v4, "superview"));

        double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v3, "superview"));
        double v4 = v3;
      }

      while (v6);
    }

    else
    {
      double v3 = v4;
    }
  }

  -[UIView bounds](self, "bounds");
  -[UIView convertRect:fromView:](v3, "convertRect:fromView:", self);
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;
  -[UIView bounds](v3, "bounds");
  v98.origin.double x = v15;
  v98.origin.double y = v16;
  v98.size.double width = v17;
  v98.size.double height = v18;
  v92.origin.double x = x;
  v92.origin.double y = y;
  v92.size.double width = width;
  v92.size.double height = height;
  if (CGRectIntersectsRect(v92, v98))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    CGFloat v20 = self;
    CGFloat v21 = v20;
    if (v3 == v20)
    {
      SEL v37 = v20;
    }

    else
    {
      id v22 = v20;
      do
      {
        v23 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](v22, "superview"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
        v25 = (char *)[v24 indexOfObject:v22];

        int v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
        v27 = (char *)[v26 count];
        double v28 = v25 + 1;

        if (v27 > v25 + 1)
        {
          while (1)
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
            CGSize v30 = (char *)[v29 count];

            if (v28 >= v30) {
              break;
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v23, "subviews"));
            v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:v28]);

            [v32 bounds];
            -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v32);
            v99.origin.double x = x;
            v99.origin.double y = y;
            v99.size.double width = width;
            v99.size.double height = height;
            if (CGRectIntersectsRect(v93, v99)) {
              [v19 addObject:v32];
            }

            ++v28;
          }
        }

        if (-[UIView clipsToBounds](v23, "clipsToBounds"))
        {
          -[UIView bounds](v23, "bounds");
          -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v23);
          v100.origin.double x = v33;
          v100.origin.double y = v34;
          v100.size.double width = v35;
          v100.size.double height = v36;
          v94.origin.double x = x;
          v94.origin.double y = y;
          v94.size.double width = width;
          v94.size.double height = height;
          CGRect v95 = CGRectIntersection(v94, v100);
          double x = v95.origin.x;
          double y = v95.origin.y;
          double width = v95.size.width;
          double height = v95.size.height;
        }

        id v22 = v23;
      }

      while (v23 != v3);
      SEL v37 = v3;
    }

    v96.origin.double x = x;
    v96.origin.double y = y;
    v96.size.double width = width;
    v96.size.double height = height;
    if (CGRectIsNull(v96)
      || (v97.origin.double x = x, v97.origin.y = y, v97.size.width = width, v97.size.height = height, CGRectIsEmpty(v97)))
    {
      v39 = 0LL;
    }

    else
    {
      v78 = v37;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v21, "subviews"));
      [v19 addObjectsFromArray:v40];

      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0LL,  0LL));
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      v79 = v19;
      id v42 = v19;
      id v43 = [v42 countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v85;
        do
        {
          for (i = 0LL; i != v44; i = (char *)i + 1)
          {
            if (*(void *)v85 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
            [v47 alpha];
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            [v41 setObject:v48 forKey:v47];

            [v47 setAlpha:0.00000011920929];
          }

          id v44 = [v42 countByEnumeratingWithState:&v84 objects:v89 count:16];
        }

        while (v44);
      }

      -[UIView bounds](v3, "bounds");
      double v50 = v49;
      double v52 = v51;
      v90.double width = width;
      v90.double height = height;
      UIGraphicsBeginImageContextWithOptions(v90, 0, 0.0);
      -[UIView drawViewHierarchyInRect:afterScreenUpdates:]( v3,  "drawViewHierarchyInRect:afterScreenUpdates:",  1LL,  -x,  -y,  v50,  v52);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v39 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      -[UIView bounds](v21, "bounds");
      if (v55 != width || v54 != height)
      {
        -[UIView convertRect:fromView:](v21, "convertRect:fromView:", v3, x, y, width, height);
        double v57 = v56;
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        -[UIView bounds](v21, "bounds");
        v91.double width = v64;
        v91.double height = v65;
        UIGraphicsBeginImageContextWithOptions(v91, 0, 0.0);
        objc_msgSend(v39, "drawInRect:blendMode:alpha:", 0, v57, v59, v61, v63, 1.0);
        v66 = UIGraphicsGetImageFromCurrentImageContext();
        uint64_t v67 = objc_claimAutoreleasedReturnValue(v66);

        UIGraphicsEndImageContext();
        v39 = (void *)v67;
      }

      SEL v37 = v78;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      v68 = (void *)objc_claimAutoreleasedReturnValue([v41 keyEnumerator]);
      id v69 = [v68 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v69)
      {
        id v70 = v69;
        uint64_t v71 = *(void *)v81;
        do
        {
          for (j = 0LL; j != v70; j = (char *)j + 1)
          {
            if (*(void *)v81 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)j);
            v74 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v73]);
            [v74 doubleValue];
            double v76 = v75;

            [v73 setAlpha:v76];
          }

          id v70 = [v68 countByEnumeratingWithState:&v80 objects:v88 count:16];
        }

        while (v70);
      }

      v19 = v79;
    }

    id v38 = v39;
  }

  else
  {
    id v38 = 0LL;
  }

  return v38;
}

- (id)__dbg_layer
{
  if ((objc_opt_respondsToSelector(self, "_outermostLayer") & 1) != 0) {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _outermostLayer](self, "_outermostLayer"));
  }
  else {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  }
  return v3;
}

- (BOOL)__dbg_renderingModeIsMultiLayer
{
  if ((objc_opt_respondsToSelector(self, "_outermostLayer") & 1) == 0) {
    return 0;
  }
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _outermostLayer](self, "_outermostLayer"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  BOOL v5 = v3 != v4;

  return v5;
}

@end