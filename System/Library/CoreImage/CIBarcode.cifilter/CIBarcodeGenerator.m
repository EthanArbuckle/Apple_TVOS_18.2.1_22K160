@interface CIBarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (CGImage)outputCGImageForAztecCodeDescriptor;
- (CGImage)outputCGImageForDataMatrixCodeDescriptor;
- (CGImage)outputCGImageForPDF417CodeDescriptor;
- (CGImage)outputCGImageForQRCodeDescriptor;
- (CIBarcodeDescriptor)inputBarcodeDescriptor;
- (id)outputImage;
- (void)setInputBarcodeDescriptor:(id)a3;
@end

@implementation CIBarcodeGenerator

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryGenerator;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v5[3] = kCICategoryBuiltIn;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 4LL));
  v7[0] = v2;
  v7[1] = @"11";
  v6[1] = kCIAttributeFilterAvailable_iOS;
  v6[2] = kCIAttributeFilterAvailable_Mac;
  v7[2] = @"10.13";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));

  return v3;
}

- (CGImage)outputCGImageForQRCodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CIBarcodeDescriptor errorCorrectedPayload](v2, "errorCorrectedPayload"));
  if (v3)
  {
    -[CIBarcodeDescriptor maskPattern](v2, "maskPattern");
    -[CIBarcodeDescriptor symbolVersion](v2, "symbolVersion");
    unint64_t v4 = (unint64_t)-[CIBarcodeDescriptor errorCorrectionLevel](v2, "errorCorrectionLevel") - 72;
    if (v4 >= 0xA || ((0x231u >> v4) & 1) == 0) {
      sub_10AC0();
    }
    sub_B4BC(v3, *(&off_1C430 + v4));
    v6 = v5;
    if (v5)
    {
      CFAutorelease(v5);
    }

    else
    {
      uint64_t v7 = sub_373C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10AE8();
      }
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (CGImage)outputCGImageForAztecCodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CIBarcodeDescriptor errorCorrectedPayload](v2, "errorCorrectedPayload"));
  if (v3)
  {
    v15[0] = &__kCFBooleanTrue;
    v14[0] = @"AztecOptionMessageDataIsDataCodeWords";
    v14[1] = @"AztecOptionUseCompactStyle";
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CIBarcodeDescriptor isCompact](v2, "isCompact")));
    v15[1] = v4;
    v14[2] = @"AztecOptionLayers";
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CIBarcodeDescriptor layerCount](v2, "layerCount")));
    v15[2] = v5;
    v14[3] = @"AztecOptionMessageCodeWordCount";
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CIBarcodeDescriptor dataCodewordCount](v2, "dataCodewordCount")));
    v15[3] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL));

    CGImageRef v8 = sub_7320(v3, v7);
    id v9 = 0LL;
    if (v8)
    {
      CFAutorelease(v8);
    }

    else
    {
      uint64_t v10 = sub_373C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v12) {
          sub_10B14(v9);
        }
      }

      else if (v12)
      {
        sub_10AE8();
      }
    }
  }

  else
  {
    CGImageRef v8 = 0LL;
  }

  return v8;
}

- (CGImage)outputCGImageForPDF417CodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CIBarcodeDescriptor errorCorrectedPayload](v2, "errorCorrectedPayload"));
  if (v3)
  {
    v15[0] = &__kCFBooleanTrue;
    v14[0] = @"PDF417OptionMessageDataIsCodeWordData";
    v14[1] = @"PDF417OptionUseCompactStyle";
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CIBarcodeDescriptor isCompact](v2, "isCompact")));
    v15[1] = v4;
    v14[2] = @"PDF417OptionRows";
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CIBarcodeDescriptor rowCount](v2, "rowCount")));
    v15[2] = v5;
    v14[3] = @"PDF417OptionDataColumns";
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CIBarcodeDescriptor columnCount](v2, "columnCount")));
    v15[3] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL));

    CGImageRef v8 = sub_E078(v3, v7);
    id v9 = 0LL;
    if (v8)
    {
      CFAutorelease(v8);
    }

    else
    {
      uint64_t v10 = sub_373C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v12) {
          sub_10B98(v9);
        }
      }

      else if (v12)
      {
        sub_10AE8();
      }
    }
  }

  else
  {
    CGImageRef v8 = 0LL;
  }

  return v8;
}

- (CGImage)outputCGImageForDataMatrixCodeDescriptor
{
  uint64_t v2 = sub_373C();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10C1C();
  }

  return 0LL;
}

- (CGImage)outputCGImage
{
  p_inputBarcodeDescriptor = &self->inputBarcodeDescriptor;
  inputBarcodeDescriptor = self->inputBarcodeDescriptor;
  if (inputBarcodeDescriptor)
  {
    if (-[CIBarcodeDescriptor isMemberOfClass:]( inputBarcodeDescriptor,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___CIQRCodeDescriptor))) {
      return -[CIBarcodeGenerator outputCGImageForQRCodeDescriptor](self, "outputCGImageForQRCodeDescriptor");
    }
    if (-[CIBarcodeDescriptor isMemberOfClass:]( *p_inputBarcodeDescriptor,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___CIAztecCodeDescriptor))) {
      return -[CIBarcodeGenerator outputCGImageForAztecCodeDescriptor](self, "outputCGImageForAztecCodeDescriptor");
    }
    if (-[CIBarcodeDescriptor isMemberOfClass:]( *p_inputBarcodeDescriptor,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___CIPDF417CodeDescriptor))) {
      return -[CIBarcodeGenerator outputCGImageForPDF417CodeDescriptor](self, "outputCGImageForPDF417CodeDescriptor");
    }
    if (-[CIBarcodeDescriptor isMemberOfClass:]( *p_inputBarcodeDescriptor,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___CIDataMatrixCodeDescriptor))) {
      return -[CIBarcodeGenerator outputCGImageForDataMatrixCodeDescriptor]( self,  "outputCGImageForDataMatrixCodeDescriptor");
    }
    uint64_t v5 = sub_373C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10C48(p_inputBarcodeDescriptor);
    }
  }

  return 0LL;
}

- (id)outputImage
{
  uint64_t v2 = -[CIBarcodeGenerator outputCGImage](self, "outputCGImage");
  if (v2)
  {
    v5[0] = kCIImageNearestSampling;
    v5[1] = kCIImageAlphaOne;
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
    uint64_t v2 = (CGImage *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:options:](&OBJC_CLASS___CIImage, "imageWithCGImage:options:", v2, v3));
  }

  return v2;
}

- (CIBarcodeDescriptor)inputBarcodeDescriptor
{
  return self->inputBarcodeDescriptor;
}

- (void)setInputBarcodeDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end