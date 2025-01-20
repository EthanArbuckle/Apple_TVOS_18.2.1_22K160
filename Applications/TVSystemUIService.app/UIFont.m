@interface UIFont
+ (id)tvss_cameraFontWithWeight:(double)a3 pointSize:(double)a4;
- (id)tvss_fontWithMonospacedNumbers;
@end

@implementation UIFont

- (id)tvss_fontWithMonospacedNumbers
{
  v12 = self;
  v11[1] = (id)a2;
  v11[0] = -[UIFont fontDescriptor](self, "fontDescriptor");
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[UIFont pointSize](v12, "pointSize");
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:");

  v13[0] = UIFontFeatureTypeIdentifierKey;
  v14[0] = &off_1001C89C0;
  v13[1] = UIFontFeatureSelectorIdentifierKey;
  v14[1] = &off_1001C89D8;
  v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL);
  v15 = v6;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v9,  UIFontDescriptorFeatureSettingsAttribute);
  id v2 = [v11[0] fontDescriptorByAddingAttributes:v10];
  id v3 = v11[0];
  v11[0] = v2;

  id v8 = +[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v11[0], 0.0);
  id v7 = v8;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(v11, 0LL);
  return v7;
}

+ (id)tvss_cameraFontWithWeight:(double)a3 pointSize:(double)a4
{
  id v16 = a1;
  SEL v15 = a2;
  double v14 = a3;
  double v13 = a4;
  id location = 0LL;
  if ((BSEqualDoubles(a3, UIFontWeightUltraLight) & 1) != 0)
  {
    objc_storeStrong(&location, @"Ultralight");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightThin) & 1) != 0)
  {
    objc_storeStrong(&location, @"Thin");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightLight) & 1) != 0)
  {
    objc_storeStrong(&location, @"Light");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightMedium) & 1) != 0)
  {
    objc_storeStrong(&location, @"Medium");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightSemibold) & 1) != 0)
  {
    objc_storeStrong(&location, @"Semibold");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightBold) & 1) != 0)
  {
    objc_storeStrong(&location, @"Bold");
  }

  else if ((BSEqualDoubles(v14, UIFontWeightHeavy) & 1) != 0)
  {
    objc_storeStrong(&location, @"Heavy");
  }

  else
  {
    objc_storeStrong(&location, @"Regular");
  }

  v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @".SFCamera-%@", location);
  v20[0] = kCTFontNameAttribute;
  v21[0] = v11;
  v20[1] = kCTFontTraitsAttribute;
  v18[0] = kCTFontWeightTrait;
  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14);
  v19[0] = v6;
  v18[1] = kCTFontUIFontDesignTrait;
  v19[1] = kCTFontUIFontDesignMonospaced;
  v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18);
  v21[1] = v5;
  CFDictionaryRef attributes =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL);

  CTFontDescriptorRef descriptor = CTFontDescriptorCreateWithAttributes(attributes);
  CTFontRef v17 = CTFontCreateWithFontDescriptorAndOptions(descriptor, v13, 0LL, 0x400uLL);
  id v8 = v17;
  CFRelease(descriptor);
  id v7 = v8;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong((id *)&attributes, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7;
}

@end