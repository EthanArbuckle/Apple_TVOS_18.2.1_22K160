@interface CIQRCodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSString)inputCorrectionLevel;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
- (void)setInputCorrectionLevel:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIQRCodeGenerator

- (void)setDefaults
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CIQRCodeGenerator;
  -[CIQRCodeGenerator setDefaults](&v4, "setDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CIQRCodeGenerator _defaultVersion](self, "_defaultVersion")));
  -[CIQRCodeGenerator setValue:forKey:](self, "setValue:forKey:", v3, kCIInputVersionKey);
}

- (int)_maxVersion
{
  return 1;
}

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least(0x7E50901FFFFFFFFLL, a2);
}

+ (id)customAttributes
{
  v9[0] = kCIAttributeFilterCategories;
  v8[0] = kCICategoryGenerator;
  v8[1] = kCICategoryStillImage;
  v8[2] = kCICategoryBuiltIn;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  v10[0] = v2;
  v10[1] = @"7";
  v9[1] = kCIAttributeFilterAvailable_iOS;
  v9[2] = kCIAttributeFilterAvailable_Mac;
  v10[2] = @"10.9";
  v10[3] = &__NSDictionary0__struct;
  v9[3] = @"inputMessage";
  v9[4] = @"inputCorrectionLevel";
  v6 = kCIAttributeDefault;
  v7 = @"M";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  v10[4] = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  5LL));

  return v4;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"inputOptions"])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"QRCodeOptionErrorCorrectionLevel"]);

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"QRCodeOptionErrorCorrectionLevel"]);
        -[CIQRCodeGenerator setInputCorrectionLevel:](self, "setInputCorrectionLevel:", v10);
      }
    }
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CIQRCodeGenerator;
    -[CIQRCodeGenerator setValue:forUndefinedKey:](&v11, "setValue:forUndefinedKey:", v6, v7);
  }
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
    v9 = @"CIQRCodeGenerator filter requires NSData for inputMessage";
LABEL_11:
    +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"CIQRCodeGenerator", v9);
    return 0LL;
  }

  inputCorrectionLevel = self->inputCorrectionLevel;
  if (inputCorrectionLevel
    && !-[NSString isEqualToString:](inputCorrectionLevel, "isEqualToString:", @"L")
    && !-[NSString isEqualToString:](self->inputCorrectionLevel, "isEqualToString:", @"M")
    && !-[NSString isEqualToString:](self->inputCorrectionLevel, "isEqualToString:", @"Q")
    && !-[NSString isEqualToString:](self->inputCorrectionLevel, "isEqualToString:", @"H"))
  {
    v9 = @"CIQRCodeGenerator filter requires L, M, Q, or H for inputCorrectionLevel";
    goto LABEL_11;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CIQRCodeGenerator valueForKey:](self, "valueForKey:", kCIInputVersionKey));
  [v6 intValue];

  id v7 = (CGImage *)sub_A778(self->super.inputMessage, self->inputCorrectionLevel, 0LL);
  uint64_t v8 = v7;
  if (v7) {
    CFAutorelease(v7);
  }
  return v8;
}

- (NSString)inputCorrectionLevel
{
  return self->inputCorrectionLevel;
}

- (void)setInputCorrectionLevel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end