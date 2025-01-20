@interface CIAztecCodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSNumber)inputCompactStyle;
- (NSNumber)inputCorrectionLevel;
- (NSNumber)inputLayers;
- (void)setInputCompactStyle:(id)a3;
- (void)setInputCorrectionLevel:(id)a3;
- (void)setInputLayers:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIAztecCodeGenerator

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
  v15[4] = @"inputCorrectionLevel";
  v12[0] = kCIAttributeMin;
  v12[1] = kCIAttributeSliderMin;
  v13[0] = &off_1DA80;
  v13[1] = &off_1DA80;
  v12[2] = kCIAttributeSliderMax;
  v12[3] = kCIAttributeMax;
  v13[2] = &off_1DA98;
  v13[3] = &off_1DA98;
  v12[4] = kCIAttributeDefault;
  v12[5] = kCIAttributeType;
  v13[4] = &off_1DAB0;
  v13[5] = kCIAttributeTypeInteger;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  6LL));
  v16[4] = v3;
  v15[5] = @"inputLayers";
  v10[0] = kCIAttributeMin;
  v10[1] = kCIAttributeSliderMin;
  v11[0] = &off_1DAC8;
  v11[1] = &off_1DAC8;
  v10[2] = kCIAttributeSliderMax;
  v10[3] = kCIAttributeMax;
  v11[2] = &off_1DAE0;
  v11[3] = &off_1DAE0;
  v10[4] = kCIAttributeType;
  v11[4] = kCIAttributeTypeInteger;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  5LL));
  v16[5] = v4;
  v15[6] = @"inputCompactStyle";
  v8[0] = kCIAttributeMin;
  v8[1] = kCIAttributeSliderMin;
  v9[0] = &__kCFBooleanFalse;
  v9[1] = &__kCFBooleanFalse;
  v8[2] = kCIAttributeSliderMax;
  v8[3] = kCIAttributeMax;
  v9[2] = &__kCFBooleanTrue;
  v9[3] = &__kCFBooleanTrue;
  v8[4] = kCIAttributeType;
  v9[4] = kCIAttributeTypeBoolean;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  5LL));
  v16[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  7LL));

  return v6;
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
      id v9 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionErrorCorrectionPercentage"]);

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionErrorCorrectionPercentage"]);
        -[CIAztecCodeGenerator setInputCorrectionLevel:](self, "setInputCorrectionLevel:", v11);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionLayers"]);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionLayers"]);
        -[CIAztecCodeGenerator setInputLayers:](self, "setInputLayers:", v13);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionUseCompactStyle"]);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AztecOptionUseCompactStyle"]);
        -[CIAztecCodeGenerator setInputLayers:](self, "setInputLayers:", v15);
      }
    }
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___CIAztecCodeGenerator;
    -[CIAztecCodeGenerator setValue:forUndefinedKey:](&v16, "setValue:forUndefinedKey:", v6, v7);
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
    id v9 = @"CIAztecCodeGenerator filter requires NSData for inputMessage";
    goto LABEL_9;
  }

  inputCorrectionLevel = self->inputCorrectionLevel;
  if (inputCorrectionLevel)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(inputCorrectionLevel, v6) & 1) == 0
      || (-[NSNumber floatValue](self->inputCorrectionLevel, "floatValue"), v7 < 5.0)
      || (-[NSNumber floatValue](self->inputCorrectionLevel, "floatValue"), v8 > 95.0))
    {
      id v9 = @"CIAztecCodeGenerator filter requires nil or a number between 5 and 95 for inputCorrectionLevel";
LABEL_9:
      +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"CIAztecCodeGenerator", v9);
      return 0LL;
    }
  }

  inputLayers = self->inputLayers;
  if (inputLayers)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(inputLayers, v13) & 1) == 0
      || (-[NSNumber floatValue](self->inputLayers, "floatValue"), v14 < 1.0)
      || (-[NSNumber floatValue](self->inputLayers, "floatValue"), v15 > 32.0))
    {
      id v9 = @"CIAztecCodeGenerator filter requires nil or a number between 1 and 32 for inputLayers";
      goto LABEL_9;
    }
  }

  inputCompactStyle = self->inputCompactStyle;
  if (inputCompactStyle)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(inputCompactStyle, v17) & 1) == 0
      || (-[NSNumber isEqual:](self->inputCompactStyle, "isEqual:", &__kCFBooleanTrue) & 1) == 0
      && (-[NSNumber isEqual:](self->inputCompactStyle, "isEqual:", &__kCFBooleanFalse) & 1) == 0)
    {
      id v9 = @"CIAztecCodeGenerator filter requires nil or @YES or @NO for inputCompactStyle";
      goto LABEL_9;
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v19 = v18;
  v20 = self->inputCorrectionLevel;
  if (v20) {
    [v18 setObject:v20 forKey:@"AztecOptionErrorCorrectionPercentage"];
  }
  v21 = self->inputLayers;
  if (v21) {
    [v19 setObject:v21 forKey:@"AztecOptionLayers"];
  }
  v22 = self->inputCompactStyle;
  if (v22) {
    [v19 setObject:v22 forKey:@"AztecOptionUseCompactStyle"];
  }
  CGImageRef v10 = sub_7320(self->super.inputMessage, v19);
  id v23 = 0LL;
  v24 = v23;
  if (v10)
  {
    CFAutorelease(v10);
  }

  else if (v23)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
    NSLog(@"%@", v25);
  }

  else
  {
    NSLog(@"CIAztecCodeGenerator could not generate an image");
  }

  return v10;
}

- (NSNumber)inputCorrectionLevel
{
  return self->inputCorrectionLevel;
}

- (void)setInputCorrectionLevel:(id)a3
{
}

- (NSNumber)inputLayers
{
  return self->inputLayers;
}

- (void)setInputLayers:(id)a3
{
}

- (NSNumber)inputCompactStyle
{
  return self->inputCompactStyle;
}

- (void)setInputCompactStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end