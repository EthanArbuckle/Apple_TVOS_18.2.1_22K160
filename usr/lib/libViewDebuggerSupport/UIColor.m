@interface UIColor
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIColor

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class(self);
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v10 = 0LL;
    goto LABEL_4;
  }

  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9)
  {
LABEL_4:
    v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIColor);
    v12 = NSStringFromClass(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }

  id v13 = v9;
LABEL_7:
  v14 = v13;

  v47[0] = @"propertyFormat";
  v47[1] = @"propertyRuntimeType";
  v48[0] = @"color";
  v48[1] = v14;
  v15 = &CAEncodeLayerTree_ptr;
  id v16 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2LL));
  *a3 = v16;
  v17 = self;
  v18 = -[UIColor CGColor](v17, "CGColor");
  if (v18)
  {
    id v46 = v16;
    Mutable = CFDictionaryCreateMutable( 0LL,  20LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    space = CGColorGetColorSpace(v18);
    CFStringRef v44 = CGColorSpaceCopyName(space);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v18);
    uint64_t v20 = NumberOfComponents << 32;
    CFIndex v21 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v22 = v14;
      v23 = CFStringCreateMutable(0LL, 0LL);
      CFIndex v24 = v21 - 1;
      else {
        uint64_t v25 = v21;
      }
      do
      {
        CFStringAppend(v23, @"CGf");
        if (v24) {
          CFStringAppend(v23, @", ");
        }
        --v24;
        --v25;
      }

      while (v25);
      v14 = v22;
      v15 = &CAEncodeLayerTree_ptr;
    }

    else
    {
      v23 = &stru_34740;
    }

    Components = CGColorGetComponents(v18);
    v27 = (const void **)malloc(v20 >> 29);
    if (v20 <= 0)
    {
      CFArrayRef v30 = CFArrayCreate(0LL, v27, v21, &kCFTypeArrayCallBacks);
    }

    else
    {
      uint64_t v28 = 0LL;
      if (v21 <= 1) {
        uint64_t v29 = 1LL;
      }
      else {
        uint64_t v29 = v21;
      }
      do
      {
        v27[v28] = CFNumberCreate(0LL, kCFNumberCGFloatType, &Components[v28]);
        ++v28;
      }

      while (v29 != v28);
      CFArrayRef v30 = CFArrayCreate(0LL, v27, v21, &kCFTypeArrayCallBacks);
      v31 = v27;
      do
      {
        v32 = *v31++;
        CFRelease(v32);
        --v29;
      }

      while (v29);
    }

    free(v27);
    CGColorSpaceGetModel(space);
    v18 = Mutable;
    id v16 = v46;
    if (v30) {
      CFDictionaryAddValue(Mutable, @"componentValues", v30);
    }
    if (v23) {
      CFDictionaryAddValue(Mutable, @"componentValuesFormat", v23);
    }
    if (v44) {
      CFDictionaryAddValue(Mutable, @"colorSpaceName", v44);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v44) {
      CFRelease(v44);
    }
    if (v23) {
      CFRelease(v23);
    }
  }

  if ((objc_opt_respondsToSelector(v17, "_debugName") & 1) != 0
    && (objc_opt_respondsToSelector(v17, "_debugCatalogBundleIdentifier") & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));
    if (v33)
    {
    }

    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));

      if (!v34) {
        goto LABEL_48;
      }
    }

    v35 = v15;
    id v36 = -[CGColor mutableCopy](v18, "mutableCopy");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));
      [v36 setObject:v38 forKeyedSubscript:@"catalogBundleID"];
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));
      [v36 setObject:v40 forKeyedSubscript:@"colorName"];
    }

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v35[30] dictionaryWithDictionary:v36]);

    v18 = (CGColor *)v41;
  }

@end