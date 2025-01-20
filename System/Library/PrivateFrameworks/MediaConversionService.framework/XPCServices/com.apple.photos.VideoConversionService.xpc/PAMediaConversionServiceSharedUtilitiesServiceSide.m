@interface PAMediaConversionServiceSharedUtilitiesServiceSide
+ (BOOL)isOutputCorruptionLikelyComparingFileSizeOfInputURL:(id)a3 toOutputURL:(id)a4;
+ (BOOL)isOutputCorruptionLikelyUsingSSIMOfInputURL:(id)a3 toOutputURL:(id)a4;
+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 inputSize:(PFIntSize_st)a4 outputSize:(PFIntSize_st)a5 sx:(double)a6 sy:(double)a7 orientation:(int64_t)a8 colorspace:(CGColorSpace *)space;
+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 scaleFactor:(double)a4 orientation:(int64_t)a5 colorspace:(CGColorSpace *)a6;
+ (CGSize)imageSizeForImageData:(id)a3;
+ (id)temporaryDestinationURLCollectionForFinalDestinationURLCollection:(id)a3 inParentDirectoryURL:(id)a4;
+ (id)temporaryFilesDirectoryURLForConversionTaskIdentifier:(id)a3 error:(id *)a4;
+ (void)checkConversionResultForOutputCorruptionAndMarkJobAsFailed:(id)a3;
+ (void)executeConversionJob:(id)a3;
@end

@implementation PAMediaConversionServiceSharedUtilitiesServiceSide

+ (void)executeConversionJob:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);

  if (!v6)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v59 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1276, @"Invalid parameter not satisfying: %@", @"job.sourceResourceURLCollection" object file lineNumber description];
  }

  if ([v5 validateSourceAndOptions])
  {
    if ([v5 isRAWSourceUTI]
      && ([v5 sourceImageSize],
          uint64_t v9 = (uint64_t)(v7 * v8),
          id v10 = +[PFMediaUtilities rawSourceMaximumPixelCountForBackgroundProcessing]( &OBJC_CLASS___PFMediaUtilities,  "rawSourceMaximumPixelCountForBackgroundProcessing"),  (uint64_t)v10 < v9))
    {
      id v11 = v10;
      int v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v64 = v9;
        *(_WORD *)&v64[8] = 2048;
        *(void *)&v64[10] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to process full size RAW source with pixel count %zd (exceeds limit of %zd), falling back to embedded preview",  buf,  0x16u);
        int v12 = 0;
      }
    }

    else
    {
      int v12 = 1;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationImageProperties]);
    if ([v5 sourceRequiresRasterization])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 rasterizationDPI]));
      [v13 setObject:v14 forKeyedSubscript:kCGImageSourceRasterizationDPI];
    }

    if ([v5 colorspaceMode] == (id)2)
    {
      v15 = (const __CFString *)&__kCFBooleanTrue;
    }

    else
    {
      if ([v5 colorspaceMode])
      {
LABEL_17:
        id v16 = [v5 orientationTransformBehavior];
        else {
          unsigned int v17 = 1;
        }
        unsigned int v18 = [v5 hasPhotosAdjustments];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceUTI]);
          [v5 sourceImageSize];
          int v21 = (int)v20;
          [v5 sourceImageSize];
          *(_DWORD *)buf = 67110914;
          *(_DWORD *)v64 = v18;
          *(_WORD *)&v64[4] = 2048;
          *(void *)&v64[6] = v16;
          *(_WORD *)&v64[14] = 1024;
          *(_DWORD *)&v64[16] = v18;
          __int16 v65 = 1024;
          unsigned int v66 = v17;
          __int16 v67 = 2114;
          v68 = v19;
          __int16 v69 = 1024;
          int v70 = v12;
          __int16 v71 = 1024;
          int v72 = v21;
          __int16 v73 = 1024;
          int v74 = (int)v22;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Image conversion: requiresCustomOrientationTransform %d, orientationBehavior %lu, requiresPhotosAdjustmentRe ndering %d, requiresDrawing %d, source UTI %{public}@, canProcessFullSizeRaw %d, inputImageSize %dx%d",  buf,  0x3Au);
        }

        if (v18)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Photos adjustments are unavailable on this platform",  buf,  2u);
          }

          [v5 setStatus:2];
          goto LABEL_51;
        }

        v23 = (CGImageSource *)[v5 imageSource];
        v24 = (CGImageDestination *)[v5 imageDestination];
        v25 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceUTI]);
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v25));

        if (v17)
        {
          v27 = (CGImage *)[v5 sourceImageRef];
          if (!v27) {
            goto LABEL_48;
          }
          v28 = v27;
          CGColorSpaceRef v29 = sub_10000F4A0(v27, v26, (uint64_t)[v5 colorspaceMode]);
          [v5 scaleFactor];
          v31 = (CGImage *)objc_msgSend( a1,  "newScaledImageForImageRef:scaleFactor:orientation:colorspace:",  v28,  objc_msgSend(v5, "orientation"),  v29,  v30);
          if (!v31)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
              v41 = (void *)objc_claimAutoreleasedReturnValue([v40 logMessageSummary]);
              *(_DWORD *)buf = 138412290;
              *(void *)v64 = v41;
              v42 = "Unable to create output image for %@";
              goto LABEL_63;
            }

+ (void)checkConversionResultForOutputCorruptionAndMarkJobAsFailed:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainSourceResourceURL]);
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationResourceURLCollection]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"]);

    if (!v8)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1467, @"Unexpected nil output url: %@/%@", v6, 0 object file lineNumber description];
    }

    unsigned int v9 = [a1 isOutputCorruptionLikelyComparingFileSizeOfInputURL:v6 toOutputURL:v8];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"MediaConversionServiceUseSSIMOutputCorruptionCheck"]);

    if ((objc_opt_respondsToSelector(v11, "BOOLValue") & 1) == 0) {
      goto LABEL_9;
    }
    unsigned int v12 = [v11 BOOLValue];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)unsigned int v17 = 0;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v12;
      *(_WORD *)unsigned int v18 = 2112;
      *(void *)&v18[2] = @"MediaConversionServiceUseSSIMOutputCorruptionCheck";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Overriding enabled state of output corruption SSIM check from %d to %d because %@ user default key is set",  buf,  0x18u);
    }

    if (v12)
    {
      unsigned int v13 = [a1 isOutputCorruptionLikelyUsingSSIMOfInputURL:v6 toOutputURL:v8];
      unsigned int v14 = v13;
    }

    else
    {
LABEL_9:
      unsigned int v13 = 0;
      unsigned int v14 = v9;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)unsigned int v17 = v13;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v9;
      *(_WORD *)unsigned int v18 = 1024;
      *(_DWORD *)&v18[2] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Output corruption checks: %d/%d (%d)",  buf,  0x14u);
    }

    if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)unsigned int v17 = v6;
      *(_WORD *)&v17[8] = 2112;
      *(void *)unsigned int v18 = v8;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Possible conversion output corruption detected for %@/%@",  buf,  0x16u);
    }
  }
}

+ (BOOL)isOutputCorruptionLikelyComparingFileSizeOfInputURL:(id)a3 toOutputURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v37[0] = NSURLFileSizeKey;
  v37[1] = NSURLTypeIdentifierKey;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  [v5 removeCachedResourceValueForKey:NSURLFileSizeKey];
  id v28 = 0LL;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 resourceValuesForKeys:v7 error:&v28]);
  id v9 = v28;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSURLFileSizeKey]);
    v25 = [v10 unsignedLongLongValue];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSURLTypeIdentifierKey]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v11));

    [v6 removeCachedResourceValueForKey:NSURLFileSizeKey];
    id v27 = v9;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 resourceValuesForKeys:v7 error:&v27]);
    id v26 = v27;

    if (!v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        *(_DWORD *)buf = 138412546;
        double v30 = *(double *)&v24;
        __int16 v31 = 2112;
        id v9 = v26;
        uint64_t v32 = (uint64_t)v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to read output image file attributes for %@: %@",  buf,  0x16u);

        BOOL v19 = 0;
        goto LABEL_21;
      }

      BOOL v19 = 0;
LABEL_20:
      id v9 = v26;
LABEL_21:

      goto LABEL_22;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSURLFileSizeKey]);
    v15 = [v14 unsignedLongLongValue];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSURLTypeIdentifierKey]);
    unsigned int v17 = (_BYTE *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v16));

    if ([v12 isEqual:v17])
    {
      double v18 = (double)(v15 - v25) / (double)(unint64_t)v25 * 100.0;
      if (fabs(v18) > 10.0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218752;
          double v30 = (double)(v15 - v25) / (double)(unint64_t)v25 * 100.0;
          __int16 v31 = 2048;
          uint64_t v32 = 0x4024000000000000LL;
          __int16 v33 = 2048;
          v34 = v25;
          __int16 v35 = 2048;
          v36 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Conversion output corruption possible based on input/output file size comparison: abs(%f) > %f, %llu/%llu",  buf,  0x2Au);
        }

        BOOL v19 = 1;
        goto LABEL_19;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        double v20 = (_BYTE *)objc_claimAutoreleasedReturnValue([v5 path]);
        int v21 = (_BYTE *)objc_claimAutoreleasedReturnValue([v6 path]);
        *(_DWORD *)buf = 134218754;
        double v30 = v18;
        __int16 v31 = 2048;
        uint64_t v32 = 0x4024000000000000LL;
        __int16 v33 = 2112;
        v34 = v20;
        __int16 v35 = 2112;
        v36 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "File size percentage change abs(%f) < %f for conversion of %@ to %@",  buf,  0x2Au);
        goto LABEL_17;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v20 = (_BYTE *)objc_claimAutoreleasedReturnValue([v5 path]);
      int v21 = (_BYTE *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)buf = 138413058;
      double v30 = *(double *)&v20;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v12;
      __int16 v33 = 2112;
      v34 = v21;
      __int16 v35 = 2112;
      v36 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to check for output corruption based on file size because the file types are different: %@ (%@) / %@ (%@)",  buf,  0x2Au);
LABEL_17:

      BOOL v19 = 0;
LABEL_19:

      goto LABEL_20;
    }

    BOOL v19 = 0;
    goto LABEL_19;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    *(_DWORD *)buf = 138412546;
    double v30 = *(double *)&v23;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to read input image file attributes for %@: %@",  buf,  0x16u);
  }

  BOOL v19 = 0;
LABEL_22:

  return v19;
}

+ (BOOL)isOutputCorruptionLikelyUsingSSIMOfInputURL:(id)a3 toOutputURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[CIImage imageWithContentsOfURL:options:]( &OBJC_CLASS___CIImage,  "imageWithContentsOfURL:options:",  v5,  0LL));
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[CIImage imageWithContentsOfURL:options:]( &OBJC_CLASS___CIImage,  "imageWithContentsOfURL:options:",  v6,  0LL));
  double v13 = NAN;
  PFImageMetricComputeSSIMForCIImage(v8, v7, &v13, 0LL, 0LL);
  double v9 = v13;
  if (v13 >= 94.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)buf = 134218754;
      double v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = 0x4057800000000000LL;
      __int16 v18 = 2112;
      BOOL v19 = v10;
      __int16 v20 = 2112;
      int v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "SSIM %f >= %f for conversion of %@ to %@",  buf,  0x2Au);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    double v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = 0x4057800000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Conversion output corruption likely based on SSIM: %f < %f",  buf,  0x16u);
  }

  return v9 < 94.0;
}

+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 inputSize:(PFIntSize_st)a4 outputSize:(PFIntSize_st)a5 sx:(double)a6 sy:(double)a7 orientation:(int64_t)a8 colorspace:(CGColorSpace *)space
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  double v15 = CGBitmapContextCreate(0LL, a5.var0, a5.var1, 8uLL, (4 * a5.var0 + 15) & 0xFFFFFFFFFFFFFFF0LL, space, 2u);
  if (v15)
  {
    __int16 v16 = v15;
    CGContextSetInterpolationQuality(v15, kCGInterpolationHigh);
    CGContextScaleCTM(v16, a6, a7);
    if (a8 != 1)
    {
      IPAOrientationMakeTransformWithSize(&buf, a8, (double)var0, (double)var1);
      CGAffineTransform v19 = buf;
      CGContextConcatCTM(v16, &v19);
    }

    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = (double)var0;
    v21.size.height = (double)var1;
    CGContextDrawImage(v16, v21, a3);
    Image = CGBitmapContextCreateImage(v16);
    CGContextRelease(v16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.a) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create output bitmap context",  (uint8_t *)&buf,  2u);
    }

    return 0LL;
  }

  return Image;
}

+ (CGImage)newScaledImageForImageRef:(CGImage *)a3 scaleFactor:(double)a4 orientation:(int64_t)a5 colorspace:(CGColorSpace *)a6
{
  if (!a3) {
    return 0LL;
  }
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  unint64_t v13 = IPAOrientationTransformIntegralImageSize(a5, Width, Height);
  unint64_t v15 = v14;
  if (a4 < 1.0)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[IPAImageSizePolicy scalePolicyWithScale:]( &OBJC_CLASS___IPAImageSizePolicy,  "scalePolicyWithScale:",  a4));
    objc_msgSend(v16, "transformSize:", (double)v13, (double)v15);
    unint64_t v13 = llround(v17);
    unint64_t v15 = llround(v18);
  }

  if (!v13 || !v15) {
    return 0LL;
  }
  double v19 = 1.0;
  if (a4 <= 1.0) {
    double v19 = a4;
  }
  return (CGImage *)objc_msgSend( a1,  "newScaledImageForImageRef:inputSize:outputSize:sx:sy:orientation:colorspace:",  a3,  Width,  Height,  v13,  v15,  a5,  v19,  v19,  a6);
}

+ (CGSize)imageSizeForImageData:(id)a3
{
  id v5 = (const __CFData *)a3;
  if (!v5)
  {
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2092, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }

  v18[0] = &__kCFBooleanFalse;
  v17[0] = kCGImageSourceShouldCache;
  v17[1] = kCGImageSourceRasterizationDPI;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[PFMediaUtilities defaultRasterizationDPI]( &OBJC_CLASS___PFMediaUtilities,  "defaultRasterizationDPI")));
  v18[1] = v6;
  double v7 = CGImageSourceCreateWithData( v5,  (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));

  if (v7)
  {
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0LL, 0LL);
    double v9 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  kCGImagePropertyPixelWidth));
    double width = (double)(uint64_t)[v9 integerValue];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  kCGImagePropertyPixelHeight));
    double height = (double)(uint64_t)[v11 integerValue];

    CFRelease(v7);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image source from output data",  buf,  2u);
    }

    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

+ (id)temporaryDestinationURLCollectionForFinalDestinationURLCollection:(id)a3 inParentDirectoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v10 = v8;
  if (!v7)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2110, @"Invalid parameter not satisfying: %@", @"finalDestinationURLCollection" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2111, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  void v18[2] = sub_10000F3F4;
  v18[3] = &unk_100030E60;
  id v19 = v10;
  id v11 = (id)objc_opt_new(&OBJC_CLASS___PAMediaConversionServiceResourceURLCollection, v9);
  id v20 = v11;
  id v12 = v10;
  [v7 enumerateResourceURLs:v18];
  double v13 = v20;
  id v14 = v11;

  return v14;
}

+ (id)temporaryFilesDirectoryURLForConversionTaskIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSTemporaryDirectory();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities protectedTemporaryItemsSubdirectoryName]( &OBJC_CLASS___PFMediaUtilities,  "protectedTemporaryItemsSubdirectoryName"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);

  id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.photos.mediaconversion-%d-%@",  getpid(),  v5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v11]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v12, 1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v15 = [v14 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:a4];
  id v16 = 0LL;
  if (v15) {
    id v16 = v13;
  }

  return v16;
}

@end