@interface PAMediaConversionServiceImagingUtilities
+ (BOOL)_generatePosterFrameExportForVideoURL:(id)a3 imageDestinationToAddToAndFinalize:(CGImageDestination *)a4 maximumSize:(CGSize)a5 error:(id *)a6;
+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7;
+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7;
+ (id)dataForSingleImageJPEGPassthroughConversionForImageSource:(CGImageSource *)a3 primaryImageProperties:(id)a4;
+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5;
+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4;
+ (id)primaryImagePropertiesForFileAtURL:(id)a3;
+ (void)logMissingPropertiesInCMPhotoOutputData:(id)a3 comparedToProcessedSourceImagePropertiesByIndex:(id)a4;
@end

@implementation PAMediaConversionServiceImagingUtilities

+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4
{
  id v5 = a4;
  size_t Count = CGImageSourceGetCount(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (Count)
  {
    for (size_t i = 0LL; i != Count; ++i)
    {
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(a3, i, 0LL);
      if (v5)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 processMetadata:v9]);

        CFDictionaryRef v9 = (CFDictionaryRef)v10;
      }

      if (v9)
      {
        [v7 addObject:v9];
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        [v7 addObject:v11];
      }
    }
  }

  return v7;
}

+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5
{
  v7 = (const __CFURL *)a3;
  id v8 = a4;
  CFStringRef v39 = kCGImageSourceShouldCache;
  v40 = &__kCFBooleanFalse;
  CFDictionaryRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
  uint64_t v10 = CGImageSourceCreateWithURL(v7, v9);
  if (v10)
  {
    v11 = v10;
    uint64_t v35 = kCGImageSourceAddHEIFContainerItemID;
    v36 = &__kCFBooleanTrue;
    CFDictionaryRef v27 = CGImageSourceCopyProperties( v10,  (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 imagePropertiesByImageIndexInImageSource:v11 processedWithMetadataPolicy:v8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
    id v34 = 0LL;
    id v33 = 0LL;
    unsigned __int8 v14 = -[__CFURL getResourceValue:forKey:error:]( v7,  "getResourceValue:forKey:error:",  &v34,  NSURLTypeIdentifierKey,  &v33);
    id v15 = v34;

    v16 = (const __CFURL *)v33;
    if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get type identifier of image source URL: %@",  buf,  0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v15,  v16));
    unsigned int v18 = [v17 conformsToType:UTTypeJPEG];

    if (v18)
    {
      id v19 = [v12 objectAtIndexedSubscript:CGImageSourceGetPrimaryImageIndex(v11)];
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue( [a1 dataForSingleImageJPEGPassthroughConversionForImageSource:v11 primaryImageProperties:v20]);
    }

    else
    {
      v31 = v11;
      id v32 = 0LL;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100014CA0;
      v28[3] = &unk_100028D60;
      v29 = v27;
      id v22 = v12;
      id v30 = v22;
      int v23 = PFFigCopyImageFileWithPropertiesToData(v7, &v32, 0LL, v28);
      id v21 = v32;
      if (v23)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v24 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v7, "path"));
          *(_DWORD *)buf = 138412290;
          v38 = v24;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to perform passthrough conversion for %@",  buf,  0xCu);
        }
      }

      else
      {
        [a1 logMissingPropertiesInCMPhotoOutputData:v21 comparedToProcessedSourceImagePropertiesByIndex:v22];
      }

      v20 = v29;
    }

    CFRelease(v11);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unable to create image source from %@",  buf,  0xCu);
    }

    id v21 = 0LL;
  }

  return v21;
}

+ (id)dataForSingleImageJPEGPassthroughConversionForImageSource:(CGImageSource *)a3 primaryImageProperties:(id)a4
{
  id v5 = a4;
  v6 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
  id v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0LL);

  id v9 = [v5 mutableCopy];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationPreserveGainMap];
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
  CGImageDestinationAddImageFromSource(v8, a3, PrimaryImageIndex, (CFDictionaryRef)v9);
  LOBYTE(v5) = CGImageDestinationFinalize(v8);
  CFRelease(v8);
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      v13 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to perform single image JPEG passthrough conversion for source %@",  (uint8_t *)&v12,  0xCu);
    }

    v6 = 0LL;
  }

  return v6;
}

+ (void)logMissingPropertiesInCMPhotoOutputData:(id)a3 comparedToProcessedSourceImagePropertiesByIndex:(id)a4
{
  id v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = CGImageSourceCreateWithData(v5, 0LL);
  if (v7)
  {
    id v8 = v7;
    v24 = v5;
    size_t Count = CGImageSourceGetCount(v7);
    uint64_t v10 = (const __CFData *)[v6 count];
    if (v10 != (const __CFData *)Count && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v35 = v10;
      __int16 v36 = 2048;
      id v37 = (id)Count;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected input (%tu) / output (%tu) image count mismatch",  buf,  0x16u);
    }

    else {
      size_t v11 = (size_t)v10;
    }
    id v27 = (id)v11;
    if (v11)
    {
      size_t v12 = 0LL;
      v25 = v8;
      id v26 = v6;
      do
      {
        CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v8, v12, 0LL);
        size_t v28 = v12;
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v12]);
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (size_t i = 0LL; i != v16; size_t i = (char *)i + 1)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19, v24));
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v19));
              if (v21)
              {
              }

              else
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                unsigned __int8 v23 = [v20 isEqual:v22];

                if ((v23 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  uint64_t v35 = (const __CFData *)v28;
                  __int16 v36 = 2114;
                  id v37 = v19;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Output image at index %tu is missing image property '%{public}@' present in input image",  buf,  0x16u);
                }
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }

          while (v16);
        }

        size_t v12 = v28 + 1;
        id v6 = v26;
        id v8 = v25;
      }

      while ((id)(v28 + 1) != v27);
    }

    CFRelease(v8);
    id v5 = v24;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = v5;
    __int16 v36 = 2048;
    id v37 = -[__CFData length](v5, "length");
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create an image source from Fig outputData %p of length %tu to inspect for missing metadata properties.",  buf,  0x16u);
  }
}

+ (id)primaryImagePropertiesForFileAtURL:(id)a3
{
  v3 = (const __CFURL *)a3;
  v12[0] = kCGImageSourceShouldCache;
  v12[1] = @"kCGImageSourceRawPropertiesHint";
  v13[0] = &__kCFBooleanFalse;
  v13[1] = @"ImportOnly";
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  id v5 = CGImageSourceCreateWithURL(v3, v4);
  if (v5)
  {
    id v6 = v5;
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v5);
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v6, PrimaryImageIndex, 0LL);
    CFRelease(v6);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      size_t v11 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image source for %@, skipping",  (uint8_t *)&v10,  0xCu);
    }

    CFDictionaryRef v8 = 0LL;
  }

  return v8;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = (const __CFURL *)a4;
  id v16 = (__CFString *)a6;
  if (!v16)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 174, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }

  CGImageDestinationRef v17 = CGImageDestinationCreateWithURL(v15, v16, 1uLL, 0LL);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    unsigned __int8 v19 = objc_msgSend( a1,  "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:",  v14,  v17,  a7,  width,  height);
    CFRelease(v18);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image destination for still image extraction for %@",  buf,  0xCu);
    }

    unsigned __int8 v19 = 0;
  }

  return v19;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = (__CFString *)a6;
  if (!v15)
  {
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v23 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 192, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }

  id v16 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  CGImageDestinationRef v17 = CGImageDestinationCreateWithData(v16, v15, 1uLL, 0LL);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    unsigned int v19 = objc_msgSend( a1,  "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:",  v14,  v17,  a7,  width,  height);
    BOOL v20 = v19;
    if (a4 && v19) {
      *a4 = v16;
    }
    CFRelease(v18);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image destination for still image extraction for %@",  buf,  0xCu);
    }

    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)_generatePosterFrameExportForVideoURL:(id)a3 imageDestinationToAddToAndFinalize:(CGImageDestination *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v12 = a3;
  if (!a4)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 213, @"Invalid parameter not satisfying: %@", @"imageDestination" object file lineNumber description];
  }

  CFDictionaryRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](&OBJC_CLASS___AVAsset, "assetWithURL:", v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AVAssetImageGenerator assetImageGeneratorWithAsset:]( &OBJC_CLASS___AVAssetImageGenerator,  "assetImageGeneratorWithAsset:",  v13));
  objc_msgSend(v14, "setMaximumSize:", width, height);
  [v14 setAppliesPreferredTrackTransform:1];
  *(_OWORD *)buf = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  id v15 = (CGImage *)+[PFMediaUtilities copyCGImageFromImageGenerator:atTime:actualTime:error:]( &OBJC_CLASS___PFMediaUtilities,  "copyCGImageFromImageGenerator:atTime:actualTime:error:",  v14,  buf,  0LL,  a6);
  if (v15)
  {
    id v16 = v15;
    CGImageDestinationAddImage(a4, v15, 0LL);
    BOOL v17 = CGImageDestinationFinalize(a4);
    if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to finalize image destination for still image extraction for %@",  buf,  0xCu);
    }

    CFRelease(v16);
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end