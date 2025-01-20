@interface CIPDF417BarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSNumber)inputAlwaysSpecifyCompaction;
- (NSNumber)inputCompactStyle;
- (NSNumber)inputCompactionMode;
- (NSNumber)inputCorrectionLevel;
- (NSNumber)inputDataColumns;
- (NSNumber)inputMaxHeight;
- (NSNumber)inputMaxWidth;
- (NSNumber)inputMinHeight;
- (NSNumber)inputMinWidth;
- (NSNumber)inputPreferredAspectRatio;
- (NSNumber)inputRows;
- (void)setInputAlwaysSpecifyCompaction:(id)a3;
- (void)setInputCompactStyle:(id)a3;
- (void)setInputCompactionMode:(id)a3;
- (void)setInputCorrectionLevel:(id)a3;
- (void)setInputDataColumns:(id)a3;
- (void)setInputMaxHeight:(id)a3;
- (void)setInputMaxWidth:(id)a3;
- (void)setInputMinHeight:(id)a3;
- (void)setInputMinWidth:(id)a3;
- (void)setInputPreferredAspectRatio:(id)a3;
- (void)setInputRows:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIPDF417BarcodeGenerator

+ (id)customAttributes
{
  v39[0] = kCIAttributeFilterCategories;
  v38[0] = kCICategoryGenerator;
  v38[1] = kCICategoryVideo;
  v38[2] = kCICategoryStillImage;
  v38[3] = kCICategoryBuiltIn;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 4LL));
  v40[0] = v15;
  v40[1] = @"9";
  v39[1] = kCIAttributeFilterAvailable_iOS;
  v39[2] = kCIAttributeFilterAvailable_Mac;
  v40[2] = @"10.11";
  v40[3] = &__NSDictionary0__struct;
  v39[3] = @"inputMessage";
  v39[4] = @"inputMinWidth";
  v36[0] = kCIAttributeMin;
  v36[1] = kCIAttributeSliderMin;
  v37[0] = &off_1DAF8;
  v37[1] = &off_1DAF8;
  v36[2] = kCIAttributeSliderMax;
  v36[3] = kCIAttributeMax;
  v37[2] = &off_1DB10;
  v37[3] = &off_1DB10;
  v36[4] = kCIAttributeType;
  v37[4] = kCIAttributeTypeInteger;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  5LL));
  v40[4] = v14;
  v39[5] = @"inputMaxWidth";
  v34[0] = kCIAttributeMin;
  v34[1] = kCIAttributeSliderMin;
  v35[0] = &off_1DAF8;
  v35[1] = &off_1DAF8;
  v34[2] = kCIAttributeSliderMax;
  v34[3] = kCIAttributeMax;
  v35[2] = &off_1DB10;
  v35[3] = &off_1DB10;
  v34[4] = kCIAttributeType;
  v35[4] = kCIAttributeTypeInteger;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  5LL));
  v40[5] = v13;
  v39[6] = @"inputMinHeight";
  v32[0] = kCIAttributeMin;
  v32[1] = kCIAttributeSliderMin;
  v33[0] = &off_1DB28;
  v33[1] = &off_1DB28;
  v32[2] = kCIAttributeSliderMax;
  v32[3] = kCIAttributeMax;
  v33[2] = &off_1DB40;
  v33[3] = &off_1DB40;
  v32[4] = kCIAttributeType;
  v33[4] = kCIAttributeTypeInteger;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  5LL));
  v40[6] = v12;
  v39[7] = @"inputMaxHeight";
  v30[0] = kCIAttributeMin;
  v30[1] = kCIAttributeSliderMin;
  v31[0] = &off_1DB28;
  v31[1] = &off_1DB28;
  v30[2] = kCIAttributeSliderMax;
  v30[3] = kCIAttributeMax;
  v31[2] = &off_1DB40;
  v31[3] = &off_1DB40;
  v30[4] = kCIAttributeType;
  v31[4] = kCIAttributeTypeInteger;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  5LL));
  v40[7] = v11;
  v39[8] = @"inputDataColumns";
  v28[0] = kCIAttributeMin;
  v28[1] = kCIAttributeSliderMin;
  v29[0] = &off_1DAC8;
  v29[1] = &off_1DAC8;
  v28[2] = kCIAttributeSliderMax;
  v28[3] = kCIAttributeMax;
  v29[2] = &off_1DB58;
  v29[3] = &off_1DB58;
  v28[4] = kCIAttributeType;
  v29[4] = kCIAttributeTypeInteger;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  5LL));
  v40[8] = v10;
  v39[9] = @"inputRows";
  v26[0] = kCIAttributeMin;
  v26[1] = kCIAttributeSliderMin;
  v27[0] = &off_1DB70;
  v27[1] = &off_1DB70;
  v26[2] = kCIAttributeSliderMax;
  v26[3] = kCIAttributeMax;
  v27[2] = &off_1DB88;
  v27[3] = &off_1DB88;
  v26[4] = kCIAttributeType;
  v27[4] = kCIAttributeTypeInteger;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  5LL));
  v40[9] = v9;
  v39[10] = @"inputPreferredAspectRatio";
  v24[0] = kCIAttributeMin;
  v24[1] = kCIAttributeSliderMin;
  v25[0] = &off_1DBA0;
  v25[1] = &off_1DBA0;
  v24[2] = kCIAttributeSliderMax;
  v24[3] = kCIAttributeMax;
  v25[2] = &off_1DBB8;
  v25[3] = &off_1DBB8;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  v40[10] = v8;
  v39[11] = @"inputCompactionMode";
  v22[0] = kCIAttributeMin;
  v22[1] = kCIAttributeSliderMin;
  v23[0] = &off_1DBA0;
  v23[1] = &off_1DBA0;
  v22[2] = kCIAttributeSliderMax;
  v22[3] = kCIAttributeMax;
  v23[2] = &off_1DB70;
  v23[3] = &off_1DB70;
  v22[4] = kCIAttributeType;
  v23[4] = kCIAttributeTypeInteger;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  5LL));
  v40[11] = v7;
  v39[12] = @"inputCompactStyle";
  v20[0] = kCIAttributeMin;
  v20[1] = kCIAttributeSliderMin;
  v21[0] = &__kCFBooleanFalse;
  v21[1] = &__kCFBooleanFalse;
  v20[2] = kCIAttributeSliderMax;
  v20[3] = kCIAttributeMax;
  v21[2] = &__kCFBooleanTrue;
  v21[3] = &__kCFBooleanTrue;
  v20[4] = kCIAttributeType;
  v21[4] = kCIAttributeTypeBoolean;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));
  v40[12] = v6;
  v39[13] = @"inputCorrectionLevel";
  v18[0] = kCIAttributeMin;
  v18[1] = kCIAttributeSliderMin;
  v19[0] = &off_1DBA0;
  v19[1] = &off_1DBA0;
  v18[2] = kCIAttributeSliderMax;
  v18[3] = kCIAttributeMax;
  v19[2] = &off_1DBD0;
  v19[3] = &off_1DBD0;
  v18[4] = kCIAttributeType;
  v19[4] = kCIAttributeTypeInteger;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));
  v40[13] = v2;
  v39[14] = @"inputAlwaysSpecifyCompaction";
  v16[0] = kCIAttributeMin;
  v16[1] = kCIAttributeSliderMin;
  v17[0] = &__kCFBooleanFalse;
  v17[1] = &__kCFBooleanFalse;
  v16[2] = kCIAttributeSliderMax;
  v16[3] = kCIAttributeMax;
  v17[2] = &__kCFBooleanTrue;
  v17[3] = &__kCFBooleanTrue;
  v16[4] = kCIAttributeType;
  v17[4] = kCIAttributeTypeBoolean;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  5LL));
  v40[14] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  15LL));

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
      id v9 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMinWidth"]);

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMinWidth"]);
        -[CIPDF417BarcodeGenerator setInputMinWidth:](self, "setInputMinWidth:", v11);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMaxWidth"]);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMaxWidth"]);
        -[CIPDF417BarcodeGenerator setInputMaxWidth:](self, "setInputMaxWidth:", v13);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMinHeight"]);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMinHeight"]);
        -[CIPDF417BarcodeGenerator setInputMinHeight:](self, "setInputMinHeight:", v15);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMaxHeight"]);

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionMaxHeight"]);
        -[CIPDF417BarcodeGenerator setInputMaxHeight:](self, "setInputMaxHeight:", v17);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionDataColumns"]);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionDataColumns"]);
        -[CIPDF417BarcodeGenerator setInputDataColumns:](self, "setInputDataColumns:", v19);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionRows"]);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionRows"]);
        -[CIPDF417BarcodeGenerator setInputRows:](self, "setInputRows:", v21);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionPreferredAspectRatio"]);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionPreferredAspectRatio"]);
        -[CIPDF417BarcodeGenerator setInputPreferredAspectRatio:](self, "setInputPreferredAspectRatio:", v23);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionCompactionMode"]);

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionCompactionMode"]);
        -[CIPDF417BarcodeGenerator setInputCompactionMode:](self, "setInputCompactionMode:", v25);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionUseCompactStyle"]);

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionUseCompactStyle"]);
        -[CIPDF417BarcodeGenerator setInputCompactStyle:](self, "setInputCompactStyle:", v27);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionErrorCorrectionLevel"]);

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionErrorCorrectionLevel"]);
        -[CIPDF417BarcodeGenerator setInputCorrectionLevel:](self, "setInputCorrectionLevel:", v29);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionAlwaysSpecifyCompaction"]);

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"PDF417OptionAlwaysSpecifyCompaction"]);
        -[CIPDF417BarcodeGenerator setInputAlwaysSpecifyCompaction:](self, "setInputAlwaysSpecifyCompaction:", v31);
      }
    }
  }

  else
  {
    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___CIPDF417BarcodeGenerator;
    -[CIPDF417BarcodeGenerator setValue:forUndefinedKey:](&v32, "setValue:forUndefinedKey:", v6, v7);
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
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"CIPDF417BarcodeGenerator",  @"CIPDF417BarcodeGenerator filter requires NSData for inputMessage");
    return 0LL;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = v5;
  inputMinWidth = self->inputMinWidth;
  if (inputMinWidth) {
    [v5 setObject:inputMinWidth forKey:@"PDF417OptionMinWidth"];
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMaxWidth](self, "inputMaxWidth"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMaxWidth](self, "inputMaxWidth"));
    [v6 setObject:v9 forKey:@"PDF417OptionMaxWidth"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMinHeight](self, "inputMinHeight"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMinHeight](self, "inputMinHeight"));
    [v6 setObject:v11 forKey:@"PDF417OptionMinHeight"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMaxHeight](self, "inputMaxHeight"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputMaxHeight](self, "inputMaxHeight"));
    [v6 setObject:v13 forKey:@"PDF417OptionMaxHeight"];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputDataColumns](self, "inputDataColumns"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputDataColumns](self, "inputDataColumns"));
    [v6 setObject:v15 forKey:@"PDF417OptionDataColumns"];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputRows](self, "inputRows"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputRows](self, "inputRows"));
    [v6 setObject:v17 forKey:@"PDF417OptionRows"];
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputPreferredAspectRatio](self, "inputPreferredAspectRatio"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputPreferredAspectRatio](self, "inputPreferredAspectRatio"));
    [v6 setObject:v19 forKey:@"PDF417OptionPreferredAspectRatio"];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCompactionMode](self, "inputCompactionMode"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCompactionMode](self, "inputCompactionMode"));
    [v6 setObject:v21 forKey:@"PDF417OptionCompactionMode"];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCompactStyle](self, "inputCompactStyle"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCompactStyle](self, "inputCompactStyle"));
    [v6 setObject:v23 forKey:@"PDF417OptionUseCompactStyle"];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCorrectionLevel](self, "inputCorrectionLevel"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputCorrectionLevel](self, "inputCorrectionLevel"));
    [v6 setObject:v25 forKey:@"PDF417OptionErrorCorrectionLevel"];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputAlwaysSpecifyCompaction](self, "inputAlwaysSpecifyCompaction"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CIPDF417BarcodeGenerator inputAlwaysSpecifyCompaction](self, "inputAlwaysSpecifyCompaction"));
    [v6 setObject:v27 forKey:@"PDF417OptionAlwaysSpecifyCompaction"];
  }

  CGImageRef v28 = sub_E078(self->super.inputMessage, v6);
  id v29 = 0LL;
  v30 = v29;
  if (v28)
  {
    CFAutorelease(v28);
  }

  else if (v29)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedDescription]);
    NSLog(@"%@", v31);
  }

  else
  {
    NSLog(@"CIPDF417BarcodeGenerator could not generate an image");
  }

  return v28;
}

- (NSNumber)inputMinWidth
{
  return self->inputMinWidth;
}

- (void)setInputMinWidth:(id)a3
{
}

- (NSNumber)inputMaxWidth
{
  return self->inputMaxWidth;
}

- (void)setInputMaxWidth:(id)a3
{
}

- (NSNumber)inputMinHeight
{
  return self->inputMinHeight;
}

- (void)setInputMinHeight:(id)a3
{
}

- (NSNumber)inputMaxHeight
{
  return self->inputMaxHeight;
}

- (void)setInputMaxHeight:(id)a3
{
}

- (NSNumber)inputDataColumns
{
  return self->inputDataColumns;
}

- (void)setInputDataColumns:(id)a3
{
}

- (NSNumber)inputRows
{
  return self->inputRows;
}

- (void)setInputRows:(id)a3
{
}

- (NSNumber)inputPreferredAspectRatio
{
  return self->inputPreferredAspectRatio;
}

- (void)setInputPreferredAspectRatio:(id)a3
{
}

- (NSNumber)inputCompactionMode
{
  return self->inputCompactionMode;
}

- (void)setInputCompactionMode:(id)a3
{
}

- (NSNumber)inputCompactStyle
{
  return self->inputCompactStyle;
}

- (void)setInputCompactStyle:(id)a3
{
}

- (NSNumber)inputCorrectionLevel
{
  return self->inputCorrectionLevel;
}

- (void)setInputCorrectionLevel:(id)a3
{
}

- (NSNumber)inputAlwaysSpecifyCompaction
{
  return self->inputAlwaysSpecifyCompaction;
}

- (void)setInputAlwaysSpecifyCompaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end