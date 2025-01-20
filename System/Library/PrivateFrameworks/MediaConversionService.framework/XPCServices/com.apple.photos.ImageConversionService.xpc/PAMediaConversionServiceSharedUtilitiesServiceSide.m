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
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v66 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 1276, @"Invalid parameter not satisfying: %@", @"job.sourceResourceURLCollection" object file lineNumber description];
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
        *(void *)v71 = v9;
        *(_WORD *)&v71[8] = 2048;
        *(void *)&v71[10] = v11;
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
          *(_DWORD *)v71 = v18;
          *(_WORD *)&v71[4] = 2048;
          *(void *)&v71[6] = v16;
          *(_WORD *)&v71[14] = 1024;
          *(_DWORD *)&v71[16] = v18;
          __int16 v72 = 1024;
          unsigned int v73 = v17;
          __int16 v74 = 2114;
          v75 = v19;
          __int16 v76 = 1024;
          int v77 = v12;
          __int16 v78 = 1024;
          int v79 = v21;
          __int16 v80 = 1024;
          int v81 = (int)v22;
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
          goto LABEL_71;
        }

        v23 = (CGImageSource *)[v5 imageSource];
        v24 = (CGImageDestination *)[v5 imageDestination];
        v25 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceUTI]);
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v25));

        if (v17)
        {
          v27 = (CGImage *)[v5 sourceImageRef];
          if (!v27) {
            goto LABEL_68;
          }
          v28 = v27;
          id v29 = [v5 colorspaceMode];
          if ([v26 conformsToType:UTTypeRAWImage])
          {
            CGColorSpaceRef v30 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
            ColorSpace = (CGColorSpace *)CFAutorelease(v30);
          }

          else
          {
            ColorSpace = CGImageGetColorSpace(v28);
          }

          v34 = ColorSpace;
          if (ColorSpace)
          {
            if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB) {
              uint64_t v35 = (uint64_t)v29;
            }
            else {
              uint64_t v35 = 0LL;
            }
            v36 = sub_100010DC4(v35, v34);
          }

          else
          {
            CGColorSpaceRef v39 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
            if (!v39)
            {
              v40 = 0LL;
              goto LABEL_52;
            }

            v36 = (void *)CFAutorelease(v39);
          }

          v40 = v36;
LABEL_52:
          [v5 scaleFactor];
          v42 = (CGImage *)objc_msgSend( a1,  "newScaledImageForImageRef:scaleFactor:orientation:colorspace:",  v28,  objc_msgSend(v5, "orientation"),  v40,  v41);
          if (!v42)
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              goto LABEL_68;
            }
            v44 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 logMessageSummary]);
            *(_DWORD *)buf = 138412290;
            *(void *)v71 = v45;
            v46 = "Unable to create output image for %@";
            goto LABEL_74;
          }

          v43 = v42;
          CGImageDestinationAddImage(v24, v42, (CFDictionaryRef)v13);
          CGImageRelease(v43);
LABEL_65:
          if (CGImageDestinationFinalize(v24))
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue([v5 imageDestinationData]);
            [v5 setDestinationData:v62];

            v63 = (void *)objc_claimAutoreleasedReturnValue([v5 imageDestinationData]);
            +[PAMediaConversionServiceSharedUtilitiesServiceSide imageSizeForImageData:]( &OBJC_CLASS___PAMediaConversionServiceSharedUtilitiesServiceSide,  "imageSizeForImageData:",  v63);
            objc_msgSend(v5, "setOutputImageSize:");

            uint64_t v64 = 1LL;
LABEL_69:
            [v5 setStatus:v64];
LABEL_70:

LABEL_71:
            goto LABEL_72;
          }

          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
LABEL_68:
            uint64_t v64 = 2LL;
            goto LABEL_69;
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v44 logMessageSummary]);
          *(_DWORD *)buf = 138412290;
          *(void *)v71 = v45;
          v46 = "Unable to finalize output image for image conversion of %@";
LABEL_74:
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

          goto LABEL_68;
        }

        if (v12
          && (([v5 isRAWSourceUTI] & 1) != 0
           || [v26 isEqual:UTTypeTIFF])
          && ([v5 shouldUseEmbeddedImageAsSource] & 1) == 0)
        {
          v68[0] = kCIContextCacheIntermediates;
          v68[1] = kCIContextName;
          v69[0] = &__kCFBooleanFalse;
          v69[1] = @"PAMediaConversionSeriveSharedUtilitiesServerSide-executeConversionJob";
          v68[2] = kCIContextIntermediateMemoryTarget;
          v69[2] = &off_10002A900;
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  3LL));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](&OBJC_CLASS___CIContext, "contextWithOptions:", v47));

          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          [v5 scaleFactor];
          if (v50 != 1.0)
          {
            [v5 scaleFactor];
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            [v49 setObject:v51 forKeyedSubscript:kCIInputScaleFactorKey];
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue([v5 mainSourceResourceURL]);
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[CIFilter filterWithImageURL:options:]( &OBJC_CLASS___CIFilter,  "filterWithImageURL:options:",  v52,  v49));

          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 outputImage]);
          CGColorSpaceRef v55 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
          v56 = (CGColorSpace *)CFAutorelease(v55);
          [v54 extent];
          v61 = (CGImage *)objc_msgSend( v48,  "createCGImage:fromRect:format:colorSpace:deferred:",  v54,  kCIFormatRGBA8,  sub_100010DC4((uint64_t)objc_msgSend(v5, "colorspaceMode"), v56),  1,  v57,  v58,  v59,  v60);
          if (v61)
          {
            [v13 setObject:&off_10002A918 forKeyedSubscript:kCGImagePropertyOrientation];
            [v13 removeObjectForKey:kCGImageDestinationOptimizeColorForSharing];
            CGImageDestinationAddImage(v24, v61, (CFDictionaryRef)v13);
            CFRelease(v61);
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v67 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceResourceURLCollection]);
              v65 = (void *)objc_claimAutoreleasedReturnValue([v67 logMessageSummary]);
              *(_DWORD *)buf = 138412290;
              *(void *)v71 = v65;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to generate image using CIRawFilter for %@",  buf,  0xCu);
            }

            [v5 setStatus:2];
          }

          if (!v61) {
            goto LABEL_70;
          }
          goto LABEL_65;
        }

        [v5 scaleFactor];
        if (v32 != 1.0)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 requestedOrCalculatedMaximumLongSideLength]));
          [v13 setObject:v33 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
        }

        [v13 setObject:kCGImageSourceDecodeToSDR forKeyedSubscript:kCGImageSourceDecodeRequest];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationCreateHDRGainMap];
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationPreserveGainMap];
        [v13 setObject:&off_10002A930 forKeyedSubscript:kCGImageDestinationLossyCompressionQuality];
        if (v16)
        {
          if (v16 == (id)1)
          {
            [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageSourceCreateThumbnailWithTransform];
LABEL_47:
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 requestedOrCalculatedMaximumLongSideLength]));
            [v13 setObject:v37 forKeyedSubscript:kCGImageDestinationImageMaxPixelSize];
          }
        }

        else if ([v5 shouldUseEmbeddedImageAsSource])
        {
          goto LABEL_47;
        }

        size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v23);
        CGImageDestinationAddImageFromSource(v24, v23, PrimaryImageIndex, (CFDictionaryRef)v13);
        goto LABEL_65;
      }

      v15 = @"sRGB";
    }

    [v13 setObject:v15 forKeyedSubscript:kCGImageDestinationOptimizeColorForSharing];
    goto LABEL_17;
  }

  [v5 setStatus:2];
LABEL_72:
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
  double v9 = v8;
  if (!v7)
  {
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2110, @"Invalid parameter not satisfying: %@", @"finalDestinationURLCollection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 2111, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_100010D18;
  v17[3] = &unk_100028CD8;
  id v18 = v9;
  id v10 = objc_opt_new(&OBJC_CLASS___PAMediaConversionServiceResourceURLCollection);
  double v19 = v10;
  id v11 = v9;
  [v7 enumerateResourceURLs:v17];
  unsigned int v12 = v19;
  double v13 = v10;

  return v13;
}

+ (id)temporaryFilesDirectoryURLForConversionTaskIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSTemporaryDirectory();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities protectedTemporaryItemsSubdirectoryName]( &OBJC_CLASS___PFMediaUtilities,  "protectedTemporaryItemsSubdirectoryName"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v8]);

  id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.photos.mediaconversion-%d-%@",  getpid(),  v5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v11]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v12, 1LL));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v15 = [v14 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:a4];
  id v16 = 0LL;
  if (v15) {
    id v16 = v13;
  }

  return v16;
}

@end