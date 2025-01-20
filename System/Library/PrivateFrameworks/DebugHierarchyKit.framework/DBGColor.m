@interface DBGColor
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5;
- (CGColor)CGColor;
- (DBGColor)initWithCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5;
- (NSString)catalogName;
- (NSString)colorName;
- (id)JSONCompatibleRepresentation;
- (void)dealloc;
@end

@implementation DBGColor

+ (id)withCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithCGColor:a3 colorName:v9 catalogName:v8];

  return v10;
}

- (DBGColor)initWithCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DBGColor;
  v11 = -[DBGColor init](&v13, "init");
  if (v11)
  {
    v11->_CGColor = CGColorRetain(a3);
    objc_storeStrong((id *)&v11->_colorName, a4);
    objc_storeStrong((id *)&v11->_catalogName, a5);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DBGColor;
  -[DBGColor dealloc](&v3, "dealloc");
}

- (CGColor)CGColor
{
  return self->_CGColor;
}

- (NSString)colorName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)catalogName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0
    && ((-[__CFString isEqualToString:](v9, "isEqualToString:", @"color") & 1) != 0
     || -[__CFString isEqualToString:](v9, "isEqualToString:", @"patternImageColor")))
  {
    id v27 = 0LL;
    uint64_t v12 = DBGDecodeValueFromJSONCompatibleValue(v8, v9, &v27);
    objc_super v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v27;
    v15 = v14;
    if (v14)
    {
      v16 = 0LL;
      if (a5) {
        *a5 = v14;
      }
    }

    else
    {
      v17 = 0LL;
      if (v9)
      {
        if (v13)
        {
          v17 = 0LL;
          if (CFStringCompare(v9, @"color", 0LL) == kCFCompareEqualTo)
          {
            v18 = (const __CFString *)CFDictionaryGetValue(v13, @"colorSpaceName");
            if (v18)
            {
              v19 = CGColorSpaceCreateWithName(v18);
              value = 0LL;
              if (CFDictionaryGetValueIfPresent(v13, @"componentValues", (const void **)&value))
              {
                CFIndex Count = CFArrayGetCount((CFArrayRef)value);
                v21 = (CGFloat *)malloc(8 * Count);
                if (Count >= 1)
                {
                  for (CFIndex i = 0LL; i != Count; ++i)
                  {
                    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)value, i);
                    CGFloat valuePtr = 0.0;
                    CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
                    v21[i] = valuePtr;
                  }
                }

                v17 = CGColorCreate(v19, v21);
                free(v21);
              }

              else
              {
                v17 = 0LL;
              }

              CGColorSpaceRelease(v19);
            }

            else
            {
              v17 = 0LL;
            }
          }
        }
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", @"colorName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", @"catalogName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([a1 withCGColor:v17 colorName:v24 catalogName:v25]);
      CGColorRelease(v17);
    }
  }

  else
  {
    v16 = 0LL;
    if (!v8 && a5)
    {
      v16 = 0LL;
      *a5 = 0LL;
    }
  }

  return v16;
}

- (id)JSONCompatibleRepresentation
{
  if (!-[DBGColor CGColor](self, "CGColor")) {
    return 0LL;
  }
  objc_super v3 = -[DBGColor CGColor](self, "CGColor");
  if (v3)
  {
    v4 = v3;
    Mutable = CFDictionaryCreateMutable( 0LL,  20LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    ColorSpace = CGColorGetColorSpace(v4);
    CFStringRef v7 = CGColorSpaceCopyName(ColorSpace);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v4);
    uint64_t v9 = NumberOfComponents << 32;
    CFIndex v10 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v28 = v7;
      uint64_t v11 = ColorSpace;
      uint64_t v12 = CFStringCreateMutable(0LL, 0LL);
      CFIndex v13 = v10 - 1;
      else {
        uint64_t v14 = v10;
      }
      do
      {
        CFStringAppend(v12, @"CGf");
        if (v13) {
          CFStringAppend(v12, @", ");
        }
        --v13;
        --v14;
      }

      while (v14);
      ColorSpace = v11;
      CFStringRef v7 = v28;
    }

    else
    {
      uint64_t v12 = &stru_20CA8;
    }

    Components = CGColorGetComponents(v4);
    v17 = (const void **)malloc(v9 >> 29);
    if (v9 <= 0)
    {
      CFArrayRef v20 = CFArrayCreate(0LL, v17, v10, &kCFTypeArrayCallBacks);
    }

    else
    {
      uint64_t v18 = 0LL;
      if (v10 <= 1) {
        uint64_t v19 = 1LL;
      }
      else {
        uint64_t v19 = v10;
      }
      do
      {
        v17[v18] = CFNumberCreate(0LL, kCFNumberCGFloatType, &Components[v18]);
        ++v18;
      }

      while (v19 != v18);
      CFArrayRef v20 = CFArrayCreate(0LL, v17, v10, &kCFTypeArrayCallBacks);
      v21 = v17;
      do
      {
        v22 = *v21++;
        CFRelease(v22);
        --v19;
      }

      while (v19);
    }

    free(v17);
    CGColorSpaceGetModel(ColorSpace);
    if (v20) {
      CFDictionaryAddValue(Mutable, @"componentValues", v20);
    }
    if (v12) {
      CFDictionaryAddValue(Mutable, @"componentValuesFormat", v12);
    }
    if (v7) {
      CFDictionaryAddValue(Mutable, @"colorSpaceName", v7);
    }
    if (v20) {
      CFRelease(v20);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (v12) {
      CFRelease(v12);
    }
  }

  else
  {
    Mutable = 0LL;
  }

  id v29 = 0LL;
  uint64_t v23 = DBGEncodeValueAsJSONCompatibleValue(Mutable, @"color", &v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v29;
  v26 = v25;
  if (v25)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
    NSLog(@"%s Error: %@", "-[DBGColor(JSONSerialization) JSONCompatibleRepresentation]", v27);

    v24 = 0LL;
  }

  return v24;
}

@end