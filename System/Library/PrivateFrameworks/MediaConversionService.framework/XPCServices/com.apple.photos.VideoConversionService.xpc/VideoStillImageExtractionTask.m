@interface VideoStillImageExtractionTask
- (NSData)imageData;
- (double)posterFrameScaleFactorForCGImage:(CGImage *)a3;
- (void)extractStillImage;
- (void)performConversion;
- (void)setImageData:(id)a3;
- (void)storeImage;
@end

@implementation VideoStillImageExtractionTask

- (void)performConversion
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VideoStillImageExtractionTask;
  -[VideoConversionTask performConversion](&v3, "performConversion");
  -[VideoConversionTask loadAsset](self, "loadAsset");
  -[VideoStillImageExtractionTask extractStillImage](self, "extractStillImage");
  -[VideoStillImageExtractionTask storeImage](self, "storeImage");
  -[VideoConversionTask callCompletionHandler](self, "callCompletionHandler");
}

- (void)extractStillImage
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
  if (v3)
  {
    v4 = -[AVAssetImageGenerator initWithAsset:](objc_alloc(&OBJC_CLASS___AVAssetImageGenerator), "initWithAsset:", v3);
    -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](v4, "setAppliesPreferredTrackTransform:", 1LL);
    id v39 = 0LL;
    *(_OWORD *)arg = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    id v5 = +[PFMediaUtilities copyCGImageFromImageGenerator:atTime:actualTime:error:]( &OBJC_CLASS___PFMediaUtilities,  "copyCGImageFromImageGenerator:atTime:actualTime:error:",  v4,  arg,  v40,  &v39);
    id v6 = v39;
    arg[0] = v5;
    if (v5)
    {
      PFCGImageApplyTemporaryAVAssetImageGeneratorColorSpaceWorkaround(arg);
      CFAutorelease(arg[0]);
      -[VideoStillImageExtractionTask posterFrameScaleFactorForCGImage:]( self,  "posterFrameScaleFactorForCGImage:",  arg[0]);
      double v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"]);

      if (!v10
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options")),
            v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 objectForKeyedSubscript:@"PAMediaConversionServiceOptionColorSpaceKey"]),  id v10 = objc_msgSend(v12, "integerValue"),  v12,  v11,  (unint64_t)v10 < 3))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options", arg[0]));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"]);

        if (!v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputURLCollection](self, "outputURLCollection"));
          v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"]);
          v17 = v16;
          if (v16) {
            v18 = v16;
          }
          else {
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
          }
          v14 = v18;
        }

        if (-[VideoConversionTask requiresPhotosAdjustmentRendering](self, "requiresPhotosAdjustmentRendering"))
        {
          NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
          v50 = @"Photos adjustments rendering is unavailable on this platform";
          v21 = &v50;
          v22 = &v49;
LABEL_14:
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v22,  1LL));
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v23));
          -[VideoConversionTask setError:](self, "setError:", v24);
LABEL_25:

          goto LABEL_26;
        }

        if (fabs(v8 + -1.0) > 2.22044605e-16)
        {
          v25 = +[PAMediaConversionServiceSharedUtilitiesServiceSide newScaledImageForImageRef:scaleFactor:orientation:colorspace:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "newScaledImageForImageRef:scaleFactor:orientation:colorspace:",  arg[0],  1LL,  sub_10000F4A0((CGImage *)arg[0], 0LL, (uint64_t)v10),  v8);
          if (!v25)
          {
            NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
            v48 = @"Unable to rotate image to preferred orientation";
            v21 = &v48;
            v22 = &v47;
            goto LABEL_14;
          }

          v26 = v25;
          CFAutorelease(v25);
          arg[0] = v26;
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data", arg[0]));
        v27 = CGImageDestinationCreateWithData((CFMutableDataRef)v23, v14, 1uLL, 0LL);
        if (v27)
        {
          v28 = v27;
          CGImageDestinationAddImage(v27, (CGImageRef)arg[0], (CFDictionaryRef)&__NSDictionary0__struct);
          BOOL v29 = CGImageDestinationFinalize(v28);
          CFRelease(v28);
          if (v29)
          {
            -[VideoStillImageExtractionTask setImageData:](self, "setImageData:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask resultInformation](self, "resultInformation"));
            v41[0] = @"PAMediaConversionServicePixelWidthKey";
            v30 = +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  CGImageGetWidth((CGImageRef)arg[0]));
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            v41[1] = @"PAMediaConversionServicePixelHeightKey";
            v42[0] = v31;
            v32 = +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  CGImageGetHeight((CGImageRef)arg[0]));
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v42[1] = v33;
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
            [v24 addEntriesFromDictionary:v34];

LABEL_24:
            goto LABEL_25;
          }

          NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
          v44 = @"Unable to finalize image";
          v35 = &v44;
          v36 = &v43;
        }

        else
        {
          NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
          v46 = @"Unable to create image destination";
          v35 = &v46;
          v36 = &v45;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v36,  1LL));
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v24));
        -[VideoConversionTask setError:](self, "setError:", v31);
        goto LABEL_24;
      }

      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      v52 = @"Illegal ColorSpace option";
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v19));
      -[VideoConversionTask setError:](self, "setError:", v20);
    }

    else
    {
      -[VideoConversionTask setError:](self, "setError:", v6);
    }

- (double)posterFrameScaleFactorForCGImage:(CGImage *)a3
{
  double Width = (double)CGImageGetWidth(a3);
  double Height = (double)CGImageGetHeight(a3);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBoundingBoxKey"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v10 = v9;
  if (v8)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBoundingBoxKey"]);

    NSSize v13 = NSSizeFromString(v11);
    double v12 = v13.width;
    if (v13.width >= v13.height) {
      double v14 = v13.height;
    }
    else {
      double v14 = v13.width;
    }
    if (v13.width < v13.height) {
      double v12 = v13.height;
    }
    if (Width >= Height) {
      double v15 = Height;
    }
    else {
      double v15 = Width;
    }
    double v16 = v14 / v15;
    if (Width >= Height) {
      double v17 = Width;
    }
    else {
      double v17 = Height;
    }
    double v18 = v12 / v17;
    if (v16 < v18) {
      double v18 = v16;
    }
    double v19 = fmin(v18, 1.0);

    return v19;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"]);

  if (!v21) {
    return 1.0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 objectForKeyedSubscript:@"PAMediaConversionServiceOptionMaximumPixelCountKey"]);
  id v24 = [v23 integerValue];

  PFScaleFactorForMaximumPixelCount(v24, Width, Height);
  return result;
}

- (void)storeImage
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoStillImageExtractionTask imageData](self, "imageData"));

  if (v3)
  {
    if (-[VideoConversionTask wantsResultAsData](self, "wantsResultAsData"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[VideoStillImageExtractionTask imageData](self, "imageData"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask resultInformation](self, "resultInformation"));
      [v5 setObject:v4 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];

LABEL_6:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VideoStillImageExtractionTask imageData](self, "imageData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 length]));
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask resultInformation](self, "resultInformation"));
      [v12 setObject:v11 forKeyedSubscript:@"PAMediaConversionServiceFileSizeKey"];

      -[VideoConversionTask setStatus:](self, "setStatus:", 1LL);
      return;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));

    if (v6)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoStillImageExtractionTask imageData](self, "imageData"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
      id v17 = 0LL;
      unsigned int v9 = [v7 writeToURL:v8 options:1 error:&v17];
      id v4 = v17;

      if (v9) {
        goto LABEL_6;
      }
      v20[0] = NSLocalizedDescriptionKey;
      v20[1] = NSUnderlyingErrorKey;
      v21[0] = @"Unable to write output data";
      v21[1] = v4;
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  2LL,  v15));
      -[VideoConversionTask setError:](self, "setError:", v16);
    }

    else
    {
      NSErrorUserInfoKey v18 = NSDebugDescriptionErrorKey;
      double v19 = @"Caller wants result to URL but no URL is provided";
      NSSize v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  4LL,  v13));
      -[VideoConversionTask setError:](self, "setError:", v14);
    }
  }

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end