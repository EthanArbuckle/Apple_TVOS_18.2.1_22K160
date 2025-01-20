@interface MPAssetManager
+ (id)convertCGImageToBuffer:(CGImage *)a3;
+ (id)convertCGImageToBufferUsingDataProvider:(CGImage *)a3;
+ (id)convertCGImageToBufferUsingRGBDevice:(CGImage *)a3;
+ (id)sharedManager;
+ (void)releaseSharedManager;
+ (void)setInhibitSharedManagerInit:(BOOL)a3;
- (CGSize)resolutionForAssetAtPath:(id)a3;
- (double)altitudeForAssetAtPath:(id)a3;
- (double)durationForAssetAtPath:(id)a3;
- (double)latitudeForAssetAtPath:(id)a3;
- (double)longitudeForAssetAtPath:(id)a3;
- (double)posterTimeForAssetAtPath:(id)a3;
- (double)startTimeForAssetAtPath:(id)a3;
- (double)stopTimeForAssetAtPath:(id)a3;
- (id)absolutePathFromPath:(id)a3;
- (id)creationDateForAssetAtPath:(id)a3;
- (id)keywordsForAssetAtPath:(id)a3;
- (id)locationHierarchyForAssetAtPath:(id)a3;
- (id)regionsOfInterestForAsset:(CGImage *)a3;
- (id)regionsOfInterestForAssetAtPath:(id)a3;
- (unint64_t)mediaTypeForAssetAtPath:(id)a3;
@end

@implementation MPAssetManager

+ (void)setInhibitSharedManagerInit:(BOOL)a3
{
  byte_2B0570 = a3;
}

+ (id)sharedManager
{
  id result = (id)qword_2B0578;
  if (qword_2B0578) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = byte_2B0570 == 0;
  }
  if (v4)
  {
    objc_sync_enter(a1);
    if (!qword_2B0578) {
      qword_2B0578 = objc_alloc_init(&OBJC_CLASS___MPEmbeddedAssetManager);
    }
    objc_sync_exit(a1);
    return (id)qword_2B0578;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B0578)
  {
    objc_sync_enter(a1);
    v3 = (void *)qword_2B0578;
    objc_sync_enter((id)qword_2B0578);

    qword_2B0578 = 0LL;
    objc_sync_exit(v3);
    objc_sync_exit(a1);
  }

- (double)durationForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)startTimeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)stopTimeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (CGSize)resolutionForAssetAtPath:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (a3)
  {
    v6 = [a3 isAbsolutePath]
       ? +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3)
       : +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3);
    v7 = (const __CFURL *)v6;
    v8 = +[AVURLAsset assetWithURL:](&OBJC_CLASS___AVURLAsset, "assetWithURL:", v6);
    if (!v8) {
      goto LABEL_25;
    }
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v9 = -[AVURLAsset tracksWithMediaType:](v8, "tracksWithMediaType:", AVMediaTypeVideo);
    id v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          objc_msgSend(v14, "naturalSize", v44, v45, v46);
          double v16 = v15;
          double v18 = v17;
          if (v14)
          {
            [v14 preferredTransform];
            double v19 = *((double *)&v44 + 1);
            double v20 = *(double *)&v44;
            double v21 = *((double *)&v45 + 1);
            double v22 = *(double *)&v45;
          }

          else
          {
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            double v21 = 0.0;
            double v19 = 0.0;
            double v22 = 0.0;
            double v20 = 0.0;
            __int128 v44 = 0u;
          }

          double v23 = v18 * v22 + v20 * v16;
          double v24 = v18 * v21 + v19 * v16;
          if (v23 > width) {
            double width = v23;
          }
          if (v24 > height) {
            double height = v24;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }

      while (v11);
    }

    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
LABEL_25:
      v26 = CGImageSourceCreateWithURL(v7, 0LL);
      if (v26)
      {
        v27 = v26;
        CFDictionaryRef v28 = CGImageSourceCopyPropertiesAtIndex(v26, 0LL, 0LL);
        if (v28)
        {
          CFDictionaryRef v29 = v28;
          id v30 = -[__CFDictionary objectForKey:](v28, "objectForKey:", kCGImagePropertyPixelWidth);
          if (v30)
          {
            [v30 floatValue];
            double height = v31;
            objc_msgSend( -[__CFDictionary objectForKey:](v29, "objectForKey:", kCGImagePropertyPixelHeight),  "floatValue");
            double v33 = v32;
            unsigned __int8 v34 = objc_msgSend( -[__CFDictionary objectForKey:](v29, "objectForKey:", kCGImagePropertyOrientation),  "integerValue");
            if (v34 <= 4uLL) {
              double width = height;
            }
            else {
              double width = v33;
            }
            if (v34 <= 4uLL) {
              double height = v33;
            }
          }

          else
          {
            id v37 = -[__CFDictionary valueForKey:](v29, "valueForKey:", kCGImagePropertyExifDictionary);
            if (v37)
            {
              v38 = v37;
              id v39 = [v37 objectForKeyedSubscript:kCGImagePropertyExifPixelXDimension];
              id v40 = [v38 objectForKeyedSubscript:kCGImagePropertyExifPixelYDimension];
              if (v39)
              {
                v41 = v40;
                if (v40)
                {
                  [v39 floatValue];
                  double width = v42;
                  [v41 floatValue];
                  double height = v43;
                }
              }
            }
          }

          CFRelease(v29);
        }

        CFRelease(v27);
      }
    }
  }

  double v35 = width;
  double v36 = height;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (id)creationDateForAssetAtPath:(id)a3
{
  return 0LL;
}

- (id)keywordsForAssetAtPath:(id)a3
{
  return 0LL;
}

- (double)latitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)longitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)altitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (id)locationHierarchyForAssetAtPath:(id)a3
{
  return 0LL;
}

- (unint64_t)mediaTypeForAssetAtPath:(id)a3
{
  __int16 v5 = 0;
  char v4 = 0;
  +[MPFileValidationManager checkFileExtension:isAudio:isImage:isVideo:]( &OBJC_CLASS___MPFileValidationManager,  "checkFileExtension:isAudio:isImage:isVideo:",  a3,  (char *)&v5 + 1,  &v5,  &v4);
  if ((_BYTE)v5) {
    return 2LL;
  }
  if (v4) {
    return 3LL;
  }
  if (HIBYTE(v5)) {
    return 1LL;
  }
  return -1LL;
}

- (id)regionsOfInterestForAsset:(CGImage *)a3
{
  char v4 = objc_autoreleasePoolPush();
  if (a3)
  {
    size_t Width = CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    if (Width
      && Height
      && ((v7 = (double)Width, v8 = (double)Height, double v9 = (double)Width / (double)Height, v9 >= 0.5)
        ? (BOOL v10 = v9 <= 2.0)
        : (BOOL v10 = 0),
          v10))
    {
      id v11 = 0LL;
      if (v7 >= v8) {
        double v13 = (double)Width;
      }
      else {
        double v13 = (double)Height;
      }
      if (v13 >= 200.0 && Width >= 0x32 && Height >= 0x32)
      {
        v14 = -[CIDetector featuresInImage:]( +[CIDetector detectorOfType:context:options:]( &OBJC_CLASS___CIDetector,  "detectorOfType:context:options:",  CIDetectorTypeFace,  0LL,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  CIDetectorAccuracyLow,  CIDetectorAccuracy)),  "featuresInImage:",  +[CIImage imageWithCGImage:](&OBJC_CLASS___CIImage, "imageWithCGImage:", a3));
        id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              [*(id *)(*((void *)&v23 + 1) + 8 * (void)i) bounds];
              double x = v28.origin.x;
              double y = v28.origin.y;
              double v21 = v28.size.width;
              double v22 = v28.size.height;
              v30.origin.double x = CGRectZero.origin.x;
              v30.origin.double y = CGRectZero.origin.y;
              v30.size.double width = CGRectZero.size.width;
              v30.size.double height = CGRectZero.size.height;
              if (!CGRectEqualToRect(v28, v30))
              {
                v29.origin.double x = x / v7;
                v29.origin.double y = y / v8;
                v29.size.double width = v21 / v7;
                v29.size.double height = v22 / v8;
                objc_msgSend( v11,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  NSStringFromCGRect(v29),  kMPMetaDataRegionOfInterestBounds,  0));
              }
            }

            id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
          }

          while (v16);
        }
      }
    }

    else
    {
      id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    }
  }

  else
  {
    id v11 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v11;
}

- (id)regionsOfInterestForAssetAtPath:(id)a3
{
  __int16 v5 = objc_autoreleasePoolPush();
  v6 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  a3,  2LL,  0LL);
  if (!v6) {
    goto LABEL_20;
  }
  double v7 = v6;
  double v8 = CGImageSourceCreateWithData((CFDataRef)v6, 0LL);

  if (!v8) {
    goto LABEL_20;
  }
  CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v8, 0LL, 0LL);
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    objc_msgSend(-[__CFDictionary objectForKey:](v9, "objectForKey:", kCGImagePropertyPixelWidth), "floatValue");
    double width = v11;
    objc_msgSend(-[__CFDictionary objectForKey:](v10, "objectForKey:", kCGImagePropertyPixelHeight), "floatValue");
    double height = v13;
    CFRelease(v10);
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  if (width == 0.0
    || height == 0.0
    || ((double v15 = width / height, width / height >= 0.5) ? (v16 = v15 <= 2.0) : (v16 = 0), v16))
  {
    if (width <= 256.0) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = (uint64_t)(width * 0.00390625);
    }
    double v19 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"kCGImageSourceShouldPreferRGB32",  0LL);
    if (v18 >= 1) {
      -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18),  @"kCGImageSourceSubsampleFactor");
    }
    -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailWithTransform);
    -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailFromImageAlways);
    LODWORD(v20) = 1132462080;
    -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20),  kCGImageSourceThumbnailMaxPixelSize);
    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v8, 0LL, (CFDictionaryRef)v19);

    CFRelease(v8);
    if (ImageAtIndex)
    {
      double v22 = (void *)qword_2B0578;
      objc_sync_enter((id)qword_2B0578);
      id v17 = -[MPAssetManager regionsOfInterestForAsset:](self, "regionsOfInterestForAsset:", ImageAtIndex);
      CGImageRelease(ImageAtIndex);
      objc_sync_exit(v22);
      goto LABEL_21;
    }

- (id)absolutePathFromPath:(id)a3
{
  return 0LL;
}

- (double)posterTimeForAssetAtPath:(id)a3
{
  unint64_t v3 = -[MPAssetManager mediaTypeForAssetAtPath:](self, "mediaTypeForAssetAtPath:", a3);
  double result = 0.0;
  if (v3 == 3) {
    return 2.0;
  }
  return result;
}

+ (id)convertCGImageToBuffer:(CGImage *)a3
{
  id result = +[MPAssetManager convertCGImageToBufferUsingDataProvider:]( &OBJC_CLASS___MPAssetManager,  "convertCGImageToBufferUsingDataProvider:");
  if (!result) {
    return +[MPAssetManager convertCGImageToBufferUsingRGBDevice:]( &OBJC_CLASS___MPAssetManager,  "convertCGImageToBufferUsingRGBDevice:",  a3);
  }
  return result;
}

+ (id)convertCGImageToBufferUsingRGBDevice:(CGImage *)a3
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  double v7 = operator new[](4 * Height * Width);
  double v8 = CGBitmapContextCreate(v7, Width, Height, 8uLL, 4 * Width, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetAllowsAntialiasing(v8, 0);
  CGContextSetInterpolationQuality(v8, kCGInterpolationNone);
  v12.size.double width = (double)Width;
  v12.size.double height = (double)Height;
  v12.origin.double x = 0.0;
  v12.origin.double y = 0.0;
  CGContextDrawImage(v8, v12, a3);
  CGContextRelease(v8);
  CFDictionaryRef v9 = (unsigned __int8 *)operator new[](Height * Width);
  convertToGreyScaleGCD((unsigned __int8 *)v7, v9, Width, Height);
  operator delete[](v7);
  CFDictionaryRef v10 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v9, Height * Width);
  operator delete[](v9);
  return v10;
}

+ (id)convertCGImageToBufferUsingDataProvider:(CGImage *)a3
{
  if ((CGImageGetAlphaInfo(a3) & 5) == 0 || CGImageGetBitsPerComponent(a3) != 8 || CGImageGetBitsPerPixel(a3) != 32) {
    return 0LL;
  }
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  double v7 = operator new[](Height * Width);
  double v8 = CGBitmapContextCreate(v7, Width, Height, 8uLL, Width, DeviceGray, 0);
  CGContextSetAllowsAntialiasing(v8, 0);
  CGContextSetInterpolationQuality(v8, kCGInterpolationNone);
  v11.size.double width = (double)Width;
  v11.size.double height = (double)Height;
  v11.origin.double x = 0.0;
  v11.origin.double y = 0.0;
  CGContextDrawImage(v8, v11, a3);
  CGContextRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  CFDictionaryRef v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v7, Height * Width);
  operator delete[](v7);
  return v9;
}

@end