@interface CICode128BarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSNumber)inputBarcodeHeight;
- (NSNumber)inputQuietSpace;
- (void)setInputBarcodeHeight:(id)a3;
- (void)setInputQuietSpace:(id)a3;
@end

@implementation CICode128BarcodeGenerator

+ (id)customAttributes
{
  v15[0] = kCIAttributeFilterCategories;
  v14[0] = kCICategoryGenerator;
  v14[1] = kCICategoryStillImage;
  v14[2] = kCICategoryBuiltIn;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  v16[0] = v2;
  v16[1] = @"8";
  v15[1] = kCIAttributeFilterAvailable_iOS;
  v15[2] = kCIAttributeFilterAvailable_Mac;
  v16[2] = @"10.10";
  v16[3] = &__NSDictionary0__struct;
  v15[3] = @"inputMessage";
  v15[4] = @"inputQuietSpace";
  v12[0] = kCIAttributeMin;
  v12[1] = kCIAttributeMax;
  v13[0] = &off_1DBA0;
  v13[1] = &off_1DBE8;
  v12[2] = kCIAttributeSliderMin;
  v12[3] = kCIAttributeSliderMax;
  v13[2] = &off_1DBA0;
  v13[3] = &off_1DC00;
  v12[4] = kCIAttributeDefault;
  int v4 = dyld_program_sdk_at_least(0x7E50901FFFFFFFFLL, v3);
  v5 = &off_1DC30;
  if (v4) {
    v5 = &off_1DC18;
  }
  v12[5] = kCIAttributeType;
  v13[4] = v5;
  v13[5] = kCIAttributeTypeInteger;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  6LL));
  v16[4] = v6;
  v15[5] = @"inputBarcodeHeight";
  v10[0] = kCIAttributeMin;
  v10[1] = kCIAttributeMax;
  v11[0] = &off_1DAC8;
  v11[1] = &off_1DC48;
  v10[2] = kCIAttributeSliderMin;
  v10[3] = kCIAttributeSliderMax;
  v11[2] = &off_1DAC8;
  v11[3] = &off_1DC60;
  v10[4] = kCIAttributeDefault;
  v10[5] = kCIAttributeType;
  v11[4] = &off_1DAE0;
  v11[5] = kCIAttributeTypeInteger;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  6LL));
  v16[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  6LL));

  return v8;
}

- (CGImage)outputCGImage
{
  inputMessage = self->super.inputMessage;
  if (!inputMessage) {
    return 0LL;
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(inputMessage, v4) & 1) == 0)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"CICode128BarcodeGenerator",  @"CICode128BarcodeGenerator filter requires NSData for inputMessage");
    return 0LL;
  }

  inputQuietSpace = self->inputQuietSpace;
  if (inputQuietSpace)
  {
    -[NSNumber doubleValue](inputQuietSpace, "doubleValue");
    unint64_t v7 = (int)llround(fmin(fmax(v6, 0.0), 100.0));
  }

  else
  {
    unint64_t v7 = 7LL;
  }

  inputBarcodeHeight = self->inputBarcodeHeight;
  if (inputBarcodeHeight)
  {
    -[NSNumber doubleValue](inputBarcodeHeight, "doubleValue");
    uint64_t v11 = (int)llround(fmin(fmax(v10, 1.0), 500.0));
  }

  else
  {
    uint64_t v11 = 32LL;
  }

  v8 = (const void *)sub_FDB0(self->super.inputMessage, v7, v11);
  id v12 = 0LL;
  v13 = v12;
  if (v8)
  {
    CFAutorelease(v8);
  }

  else if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
    NSLog(@"%@", v14);
  }

  else
  {
    NSLog(@"CICode128BarcodeGenerator could not generate an image");
  }

  return (CGImage *)v8;
}

- (NSNumber)inputQuietSpace
{
  return self->inputQuietSpace;
}

- (void)setInputQuietSpace:(id)a3
{
}

- (NSNumber)inputBarcodeHeight
{
  return self->inputBarcodeHeight;
}

- (void)setInputBarcodeHeight:(id)a3
{
}

- (void).cxx_destruct
{
}

@end