@interface CALayer
+ (id)fallback_debugHierarchyChildGroupingID;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation CALayer

+ (id)fallback_debugHierarchyChildGroupingID
{
  return @"com.apple.QuartzCore.CALayer";
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a4;
  else {
    v7 = 0LL;
  }

  return v7;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf");
  v96 = Mutable;
  v98[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"anchorPointZ");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf");
  v95 = v3;
  v98[1] = v3;
  v4 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"backgroundColor");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v4, @"propertyFormat", @"color");
  v94 = v4;
  v98[2] = v4;
  v5 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"borderColor");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  v93 = v5;
  v98[3] = v5;
  id v6 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"borderWidth");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  v92 = v6;
  v98[4] = v6;
  v7 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"bounds");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v7, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v91 = v7;
  v98[5] = v7;
  v8 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"contentsCenter");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v8, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v90 = v8;
  v98[6] = v8;
  v9 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"contentsGravity");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v9, @"propertyFormat", @"public.plain-text");
  v89 = v9;
  v98[7] = v9;
  v10 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"contentsScale");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf");
  v88 = v10;
  v98[8] = v10;
  v11 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"contentsRect");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v87 = v11;
  v98[9] = v11;
  v12 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"cornerRadius");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v12, @"propertyFormat", @"CGf");
  v86 = v12;
  v98[10] = v12;
  v13 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"delegate");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v13, @"propertyFormat", @"objectInfo");
  v85 = v13;
  v98[11] = v13;
  v14 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"doubleSided");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v14, @"propertyFormat", @"b");
  v84 = v14;
  v98[12] = v14;
  v15 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"frame");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v15, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v83 = v15;
  v98[13] = v15;
  v16 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"geometryFlipped");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v16, @"propertyFormat", @"b");
  v82 = v16;
  v98[14] = v16;
  v17 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"hidden");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v81 = v17;
  v98[15] = v17;
  v18 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"magnificationFilter");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v18, @"propertyFormat", @"public.plain-text");
  v80 = v18;
  v98[16] = v18;
  v19 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"mask");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v19, @"propertyFormat", @"objectInfo");
  v77 = v19;
  v98[17] = v19;
  v20 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"masksToBounds");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v20, @"propertyFormat", @"b");
  v76 = v20;
  v98[18] = v20;
  v21 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"minificationFilter");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v21, @"propertyFormat", @"public.plain-text");
  v75 = v21;
  v98[19] = v21;
  v22 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"minificationFilterBias");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v22, @"propertyFormat", @"f");
  v74 = v22;
  v98[20] = v22;
  v23 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"needsDisplayOnBoundsChange");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v23, @"propertyFormat", @"b");
  v73 = v23;
  v98[21] = v23;
  v24 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"name");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v24, @"propertyFormat", @"public.plain-text");
  v72 = v24;
  v98[22] = v24;
  v25 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"opacity");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v25, @"propertyFormat", @"CGf");
  v71 = v25;
  v98[23] = v25;
  v26 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"opaque");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v26, @"propertyFormat", @"b");
  v70 = v26;
  v98[24] = v26;
  v27 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"position");
  CFDictionaryAddValue(v27, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v27, @"propertyFormat", @"CGf, CGf");
  v69 = v27;
  v98[25] = v27;
  v28 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"shadowColor");
  CFDictionaryAddValue(v28, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v28, @"propertyFormat", @"color");
  v68 = v28;
  v98[26] = v28;
  v29 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, @"propertyName", @"rasterizationScale");
  CFDictionaryAddValue(v29, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v29, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v29, @"propertyFormat", @"CGf");
  v67 = v29;
  v98[27] = v29;
  v30 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v30, @"propertyName", @"shadowOpacity");
  CFDictionaryAddValue(v30, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v30, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v30, @"propertyFormat", @"CGf");
  v66 = v30;
  v98[28] = v30;
  v31 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v31, @"propertyName", @"shadowRadius");
  CFDictionaryAddValue(v31, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v31, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v31, @"propertyFormat", @"CGf");
  v65 = v31;
  v98[29] = v31;
  v32 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, @"propertyName", @"shadowOffset");
  CFDictionaryAddValue(v32, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v32, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v32, @"propertyFormat", @"CGf, CGf");
  v64 = v32;
  v98[30] = v32;
  v33 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, @"propertyName", @"shouldRasterize");
  CFDictionaryAddValue(v33, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v33, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v33, @"propertyFormat", @"b");
  v63 = v33;
  v98[31] = v33;
  v34 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, @"propertyName", @"sublayerTransform");
  CFDictionaryAddValue(v34, @"propertyRuntimeType", @"CATransform3D");
  CFDictionaryAddValue(v34, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeMatrix4");
  CFDictionaryAddValue( v34,  @"propertyFormat",  @"CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf");
  v62 = v34;
  v98[32] = v34;
  v35 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, @"propertyName", @"transform");
  CFDictionaryAddValue(v35, @"propertyRuntimeType", @"CATransform3D");
  CFDictionaryAddValue(v35, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeMatrix4");
  CFDictionaryAddValue( v35,  @"propertyFormat",  @"CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf");
  v61 = v35;
  v98[33] = v35;
  v36 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, @"propertyName", @"zPosition");
  CFDictionaryAddValue(v36, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v36, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v36, @"propertyFormat", @"CGf");
  v60 = v36;
  v98[34] = v36;
  v37 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, @"propertyName", @"compositingFilter");
  CFDictionaryAddValue(v37, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v37, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v37, @"propertyFormat", @"public.plain-text");
  v59 = v37;
  v98[35] = v37;
  v38 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, @"propertyName", @"contentsDescription");
  CFDictionaryAddValue(v38, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v38, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v38, @"propertyFormat", @"public.plain-text");
  v58 = v38;
  v98[36] = v38;
  v39 = (objc_class *)objc_opt_class(a1);
  if (v39)
  {
    v40 = v39;
    if (object_isClass(v39))
    {
      v41 = NSStringFromClass(v40);
      v39 = (objc_class *)objc_claimAutoreleasedReturnValue(v41);
    }

    else
    {
      v39 = 0LL;
    }
  }

  v42 = v39;
  v43 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v43, @"propertyName", @"encodedPresentationLayer");
  if (v42) {
    CFDictionaryAddValue(v43, @"propertyRuntimeType", v42);
  }
  CFDictionaryAddValue(v43, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v43, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8LL;
  CFNumberRef v44 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v43, @"visibility", v44);
  CFRelease(v44);
  uint64_t valuePtr = 1LL;
  CFNumberRef v45 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v43, @"propertyOptions", v45);
  CFRelease(v45);
  v57 = v42;

  v98[37] = v43;
  v79 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v79, @"propertyName", @"optimizationOpportunities");
  CFDictionaryAddValue(v79, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v79, @"propertyFormat", @"custom");
  v98[38] = v79;
  v46 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, @"propertyName", @"optimizationOpportunities_includingInternals");
  CFDictionaryAddValue(v46, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v46, @"propertyFormat", @"custom");
  v98[39] = v46;
  v47 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v47, @"propertyName", @"renderInfoRenderingPasses");
  CFDictionaryAddValue(v47, @"propertyRuntimeType", @"int");
  CFDictionaryAddValue(v47, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v47, @"propertyFormat", @"i");
  uint64_t valuePtr = 4LL;
  CFNumberRef v48 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v47, @"visibility", v48);
  CFRelease(v48);
  v98[40] = v47;
  v49 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v49, @"propertyName", @"renderInfoOffscreenFlags");
  CFDictionaryAddValue(v49, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v49, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v49, @"propertyFormat", @"ul");
  uint64_t valuePtr = 4LL;
  CFNumberRef v50 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v49, @"visibility", v50);
  CFRelease(v50);
  v98[41] = v49;
  v51 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v51, @"propertyName", @"renderInfoGroupFlags");
  CFDictionaryAddValue(v51, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v51, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v51, @"propertyFormat", @"ul");
  uint64_t valuePtr = 4LL;
  CFNumberRef v52 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v51, @"visibility", v52);
  CFRelease(v52);
  v98[42] = v51;
  v53 = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v53, @"propertyName", @"dbg_ListID");
  CFDictionaryAddValue(v53, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v53, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v53, @"propertyFormat", @"integer");
  uint64_t valuePtr = 8LL;
  CFNumberRef v54 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v53, @"visibility", v54);
  CFRelease(v54);
  v98[43] = v53;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 44LL));

  return v55;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqualToString:@"encodedPresentationLayer"])
  {
    if ([v8 isEqualToString:@"compositingFilter"])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 compositingFilter]);
LABEL_9:
      id v10 = v12;
      v11 = (id *)objc_claimAutoreleasedReturnValue([v12 description]);
      goto LABEL_10;
    }

    if ([v8 isEqualToString:@"contentsDescription"])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 contents]);
      goto LABEL_9;
    }

    if ([v8 isEqualToString:@"renderInfoRenderingPasses"])
    {
      LODWORD(v36) = 0;
      v35 = 0LL;
      if ([v9 getRendererInfo:&v35 size:12])
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v35));
LABEL_23:
        a6 = v14;
        goto LABEL_12;
      }

@end