@interface DebugHierarchyObjectInterface
+ (id)propertyDescriptionsForClass:(Class)a3 inContext:(id)a4;
+ (id)valueAndOptionsForProperty:(id)a3 onObject:(id)a4 inContext:(id)a5;
+ (id)valueForProperty:(id)a3 withOutOptions:(id *)a4 onObject:(id)a5 inContext:(id)a6 error:(id *)a7;
@end

@implementation DebugHierarchyObjectInterface

+ (id)valueAndOptionsForProperty:(id)a3 onObject:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v32 = 0LL;
  id v33 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForProperty:v8 withOutOptions:&v33 onObject:a4 inContext:a5 error:&v32]);
  id v10 = v33;
  id v11 = v32;
  if (v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 name]);
    v13 = (void *)v12;
    v14 = @"<nil>";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    v35[0] = &off_27668;
    v34[0] = @"fetchStatus";
    v34[1] = @"errorDescription";
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    v34[2] = @"propertyName";
    v35[1] = v16;
    v35[2] = v15;
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
  }

  else
  {
    if ([v10 count]) {
      id v18 = [v10 mutableCopy];
    }
    else {
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
    }
    v16 = v18;
    [v18 setObject:&off_27650 forKeyedSubscript:@"fetchStatus"];
    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    [v16 setObject:v19 forKeyedSubscript:@"propertyName"];

    if (v9) {
      [v16 setObject:v9 forKeyedSubscript:@"propertyValue"];
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"propertyFormat"]);

    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v8 format]);
      if (v21) {
        [v16 setObject:v21 forKeyedSubscript:@"propertyFormat"];
      }
    }

    id v22 = [v16 copy];
    id v31 = 0LL;
    id v23 = DBGSerializePropertyDescriptionAsJSON(v22, &v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v15 = (__CFString *)v31;

    if (v15)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v8 name]);
      v26 = (void *)v25;
      v27 = @"<nil>";
      if (v25) {
        v27 = (__CFString *)v25;
      }
      v28 = v27;

      v37[0] = &off_27668;
      v36[0] = @"fetchStatus";
      v36[1] = @"errorDescription";
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString description](v15, "description"));
      v36[2] = @"propertyName";
      v37[1] = v29;
      v37[2] = v28;
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
    }

    else
    {
      id v17 = v24;
    }
  }

  return v17;
}

+ (id)valueForProperty:(id)a3 withOutOptions:(id *)a4 onObject:(id)a5 inContext:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v74 = a6;
  if (!+[DebugHierarchyObjectProtocolHelper classImplements_debugHierarchyValueForPropertyWithName:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "classImplements_debugHierarchyValueForPropertyWithName:",  objc_opt_class(v11, v12)))
  {
    v46 = 0LL;
    goto LABEL_76;
  }

  id v13 = v11;
  v15 = (objc_class *)objc_opt_class(v13, v14);
  v16 = v15;
  if (v15 && object_isClass(v15))
  {
    id v17 = NSStringFromClass(v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    id v18 = 0LL;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v74 runtimeTypeWithName:v18]);
  id v20 = v19;
  v73 = v20;
  if (v20)
  {
    v21 = v20;
    do
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 instanceProperties]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);

      if (v24) {
        id v25 = v21;
      }
      else {
        id v25 = 0LL;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue([v21 parentType]);

      if (v25) {
        break;
      }
      v21 = v26;
    }

    while (v26);
  }

  else
  {
    id v25 = 0LL;
    v26 = 0LL;
  }

  v27 = (NSString *)objc_claimAutoreleasedReturnValue([v25 name]);
  Class v28 = NSClassFromString(v27);
  v72 = a4;

  if (!v28) {
    goto LABEL_23;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  id v77 = 0LL;
  id v78 = 0LL;
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyValueForPropertyWithName:onObject:vendingClass:outOptions:outError:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyValueForPropertyWithName:onObject:vendingClass:outOptions:outError:",  v29,  v13,  v28,  &v78,  &v77));
  Class v28 = (Class)v78;
  id v31 = v77;

  if (!v31)
  {
    if (v30)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 logicalType]);
      unsigned int v34 = [v33 isEqualToString:@"DebugHierarchyLogicalPropertyTypeObjectInfo"];

      if (v34)
      {
        v35 = v30;
        v37 = (objc_class *)objc_opt_class(v35, v36);
        v38 = v37;
        if (v37 && object_isClass(v37))
        {
          v39 = NSStringFromClass(v38);
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);
        }

        else
        {
          v40 = 0LL;
        }

        v43 = &stru_214E8;
        if (v40) {
          v43 = v40;
        }
        v44 = v43;

        v30 = v35;
        v45 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v30);

        values[0] = @"className";
        values[1] = @"memoryAddress";
        keys[0] = v44;
        keys[1] = v45;
        Mutable = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  keys,  values,  2LL));
      }

      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([v10 logicalType]);
        unsigned int v42 = [v41 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"];

        if (v42)
        {
          Mutable = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p",  v30));
        }

        else
        {
          CFTypeID v51 = CFGetTypeID(v30);
          if (v51 == CGColorGetTypeID())
          {
            Mutable = CFDictionaryCreateMutable( 0LL,  20LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            space = CGColorGetColorSpace((CGColorRef)v30);
            CFStringRef value = CGColorSpaceCopyName(space);
            size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v30);
            uint64_t numValues = (int)NumberOfComponents;
            uint64_t v65 = NumberOfComponents << 32;
            if (NumberOfComponents << 32)
            {
              theString = CFStringCreateMutable(0LL, 0LL);
              uint64_t v53 = numValues - 1;
              else {
                uint64_t v54 = numValues;
              }
              do
              {
                CFStringAppend(theString, @"CGf");
                if (v53) {
                  CFStringAppend(theString, @", ");
                }
                --v53;
                --v54;
              }

              while (v54);
            }

            else
            {
              theString = &stru_214E8;
            }

            Components = CGColorGetComponents((CGColorRef)v30);
            v69 = (void **)malloc(v65 >> 29);
            if (v65 >= 1)
            {
              if (numValues <= 1) {
                uint64_t v59 = 1LL;
              }
              else {
                uint64_t v59 = numValues;
              }
              v60 = (CFNumberRef *)v69;
              do
              {
                *v60++ = CFNumberCreate(0LL, kCFNumberCGFloatType, Components++);
                --v59;
              }

              while (v59);
            }

            CFArrayRef v61 = CFArrayCreate(0LL, (const void **)v69, numValues, &kCFTypeArrayCallBacks);
            if (v65 >= 1)
            {
              if (numValues <= 1) {
                uint64_t v62 = 1LL;
              }
              else {
                uint64_t v62 = numValues;
              }
              v63 = (CFTypeRef *)v69;
              do
              {
                CFRelease(*v63++);
                --v62;
              }

              while (v62);
            }

            free(v69);
            CGColorSpaceGetModel(space);
            if (v61) {
              CFDictionaryAddValue(Mutable, @"componentValues", v61);
            }
            if (theString) {
              CFDictionaryAddValue(Mutable, @"componentValuesFormat", theString);
            }
            if (value) {
              CFDictionaryAddValue(Mutable, @"colorSpaceName", value);
            }
            if (v61) {
              CFRelease(v61);
            }
            if (value) {
              CFRelease(value);
            }
            if (theString) {
              CFRelease(theString);
            }
          }

          else
          {
            if (v51 != CGImageGetTypeID())
            {
              Mutable = (__CFDictionary *)v30;
              goto LABEL_31;
            }

            v55 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 format]);
            int valuePtr = 1065353216;
            Mutable = CFDataCreateMutable(0LL, 0LL);
            v56 = CGImageDestinationCreateWithData(Mutable, v55, 1uLL, 0LL);
            CFMutableStringRef theStringa = (CFMutableStringRef)CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
            keys[0] = (void *)kCGImageDestinationLossyCompressionQuality;
            values[0] = theStringa;
            v57 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 1LL, 0LL, 0LL);
            CGImageDestinationAddImage(v56, (CGImageRef)v30, v57);
            CGImageDestinationFinalize(v56);
            CFRelease(v57);
            CFRelease(theStringa);
            CFRelease(v56);

            v30 = (__CFString *)v55;
          }
        }
      }

LABEL_31:
      Class v28 = v28;
      id v31 = 0LL;
      id *v72 = v28;
      goto LABEL_32;
    }

+ (id)propertyDescriptionsForClass:(Class)a3 inContext:(id)a4
{
  id v5 = a4;
  if (+[DebugHierarchyObjectProtocolHelper classOverrides_debugHierarchyPropertyDescriptions:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "classOverrides_debugHierarchyPropertyDescriptions:",  a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyPropertyDescriptionsOfClass:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyPropertyDescriptionsOfClass:",  a3));
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end