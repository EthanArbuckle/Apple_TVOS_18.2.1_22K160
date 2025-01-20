@interface CPLCloudKitFakeDynamicDerivatives
+ (BOOL)_transferImageFromSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 matchingResource:(id)a5;
+ (BOOL)allowsFakeDerivatives;
+ (BOOL)isFakeDerivative:(id)a3;
+ (BOOL)transformFromURL:(id)a3 fileType:(id)a4 toTargetURL:(id)a5 matchingResource:(id)a6 error:(id *)a7;
+ (BOOL)usesFakeDerivatives;
+ (NSString)fakeDerivativesDescription;
+ (id)_metadataWithoutOrientation:(id)a3;
+ (id)_outputOptionsFromSource:(CGImageSource *)a3 matchingResource:(id)a4;
+ (id)overriddenResourcesFromResources:(id)a3;
+ (id)transformData:(id)a3 fileType:(id)a4 matchingResource:(id)a5 error:(id *)a6;
+ (unint64_t)realResourceTypeForResource:(id)a3;
+ (void)setAllowsFakeDerivatives:(BOOL)a3;
@end

@implementation CPLCloudKitFakeDynamicDerivatives

+ (BOOL)allowsFakeDerivatives
{
  return byte_1002960E0;
}

+ (NSString)fakeDerivativesDescription
{
  if (byte_1002960E1 != 1 || ![(id)qword_1002960D8 count]) {
    return (NSString *)0LL;
  }
  v2 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v3 = -[NSMutableArray initWithCapacity:](v2, "initWithCapacity:", [(id)qword_1002960D8 count]);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_1002960D8;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "description", (void)v12));
        -[NSMutableArray addObject:](v3, "addObject:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  return (NSString *)v10;
}

+ (void)setAllowsFakeDerivatives:(BOOL)a3
{
  if (a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:@"CPLFakeDynamicDerivatives"]);

    if (v6)
    {
      id v27 = a1;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@","]);
      v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v29;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            __int128 v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
            __int128 v15 = -[_CPLFakeDerivativeMapper initWithRule:]( objc_alloc(&OBJC_CLASS____CPLFakeDerivativeMapper),  "initWithRule:",  v14);
            if (!v15)
            {
              if (!_CPLSilentLogging)
              {
                uint64_t v22 = __CPLGenericOSLogDomain(0LL);
                v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v33 = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Invalid fake derivative rule '%@'",  buf,  0xCu);
                }
              }

              if (!_CPLSilentLogging)
              {
                uint64_t v25 = __CPLGenericOSLogDomain(v24);
                v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v33 = v6;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to parse fake derivatives rules '%@'",  buf,  0xCu);
                }
              }

              byte_1002960E1 = 0;
              v19 = (os_log_s *)qword_1002960D8;
              qword_1002960D8 = 0LL;
              goto LABEL_24;
            }

            v16 = v15;
            -[NSMutableArray addObject:](v8, "addObject:", v15);
          }

          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      byte_1002960E1 = 1;
      objc_storeStrong((id *)&qword_1002960D8, v8);
      if (!_CPLSilentLogging)
      {
        uint64_t v18 = __CPLGenericOSLogDomain(v17);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v27 fakeDerivativesDescription]);
          *(_DWORD *)buf = 138412290;
          v33 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Will produce fake derivatives: %@",  buf,  0xCu);
        }

+ (BOOL)usesFakeDerivatives
{
  return byte_1002960E1;
}

+ (id)overriddenResourcesFromResources:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (byte_1002960E1 == 1 && [v3 count])
  {
    id v5 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 resourceType]));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v12);
        }

        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v8);
    }

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v13 = (id)qword_1002960D8;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)j), "updateResources:", v5, (void)v20);
        }

        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v15);
    }

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v5, "allValues"));
  }

  else
  {
    id v18 = v4;
  }

  return v18;
}

+ (BOOL)isFakeDerivative:(id)a3
{
  if (byte_1002960E1 != 1) {
    return 0;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 identity]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerPrint]);
  unsigned __int8 v5 = [v4 hasPrefix:@"^"];

  return v5;
}

+ (unint64_t)realResourceTypeForResource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS____CPLCloudKitFakeFingerPrint);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identity]);
  id v6 = -[_CPLCloudKitFakeFingerPrint initWithFakeIdentity:](v4, "initWithFakeIdentity:", v5);

  if (v6) {
    id v7 = -[_CPLCloudKitFakeFingerPrint realResourceType](v6, "realResourceType");
  }
  else {
    id v7 = [v3 resourceType];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

+ (id)_metadataWithoutOrientation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  [v4 removeObjectForKey:kCGImagePropertyOrientation];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kCGImagePropertyTIFFDictionary]);

  id v6 = [v5 mutableCopy];
  if (v6)
  {
    [v6 removeObjectForKey:kCGImagePropertyTIFFOrientation];
    [v4 setObject:v6 forKey:kCGImagePropertyTIFFDictionary];
  }

  return v4;
}

+ (id)_outputOptionsFromSource:(CGImageSource *)a3 matchingResource:(id)a4
{
  id v18 = @"kCGImageSourceKeepOriginalProfile";
  CFBooleanRef v19 = kCFBooleanTrue;
  id v6 = a4;
  id v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(a3, 0LL, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _metadataWithoutOrientation:v8]);
  [v9 setObject:&off_10025C6D8 forKey:kCGImageDestinationLossyCompressionQuality];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);

  [v10 imageDimensions];
  double v12 = v11;
  double v14 = v13;

  if (v12 >= v14) {
    double v15 = v12;
  }
  else {
    double v15 = v14;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)v15));
  [v9 setObject:v16 forKey:kCGImageDestinationImageMaxPixelSize];

  [v9 setObject:&__kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailWithTransform];
  return v9;
}

+ (BOOL)_transferImageFromSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 matchingResource:(id)a5
{
  id v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([a1 _outputOptionsFromSource:a3 matchingResource:a5]);
  CGImageDestinationAddImageFromSource(a4, a3, 0LL, v7);
  LOBYTE(a4) = CGImageDestinationFinalize(a4);

  return (char)a4;
}

+ (BOOL)transformFromURL:(id)a3 fileType:(id)a4 toTargetURL:(id)a5 matchingResource:(id)a6 error:(id *)a7
{
  double v12 = (const __CFURL *)a3;
  id v13 = a4;
  double v14 = (const __CFURL *)a5;
  id v15 = a6;
  uint64_t v16 = objc_alloc(&OBJC_CLASS____CPLCloudKitFakeFingerPrint);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 identity]);
  id v18 = -[_CPLCloudKitFakeFingerPrint initWithFakeIdentity:](v16, "initWithFakeIdentity:", v17);

  if (v18)
  {
    if (v13)
    {
      CFStringRef v33 = kCGImageSourceTypeIdentifierHint;
      id v34 = v13;
      CFBooleanRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    }

    else
    {
      CFBooleanRef v19 = 0LL;
    }

    CGImageSourceRef v23 = CGImageSourceCreateWithURL(v12, v19);
    if (!v23)
    {
      unsigned __int8 v20 = 0;
      if (!a7) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }

    CGImageSourceRef v24 = v23;
    __int128 v31 = v12;
    __int128 v25 = a7;
    id v26 = a1;
    __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitFakeFingerPrint outputType](v18, "outputType"));
    __int128 v28 = v14;
    CGImageDestinationRef v29 = CGImageDestinationCreateWithURL(v14, v27, 1uLL, 0LL);

    if (v29)
    {
      unsigned __int8 v20 = [v26 _transferImageFromSource:v24 toDestination:v29 matchingResource:v15];
      CFRelease(v29);
    }

    else
    {
      unsigned __int8 v20 = 0;
    }

    a7 = v25;
    CFRelease(v24);
    double v14 = v28;
    double v12 = v31;
    if (v25)
    {
LABEL_16:
      if ((v20 & 1) == 0) {
        *a7 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
      }
    }
  }

  else
  {
    CFBooleanRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v32 = 0LL;
    unsigned __int8 v20 = -[__CFDictionary cplCopyItemAtURL:toURL:error:]( v19,  "cplCopyItemAtURL:toURL:error:",  v12,  v14,  &v32);
    id v21 = v32;
    __int128 v22 = v21;
    if (a7 && (v20 & 1) == 0) {
      *a7 = v21;
    }
  }

+ (id)transformData:(id)a3 fileType:(id)a4 matchingResource:(id)a5 error:(id *)a6
{
  uint64_t v9 = (const __CFData *)a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = objc_alloc(&OBJC_CLASS____CPLCloudKitFakeFingerPrint);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identity]);
  double v14 = -[_CPLCloudKitFakeFingerPrint initWithFakeIdentity:](v12, "initWithFakeIdentity:", v13);

  if (v14)
  {
    if (v10)
    {
      CFStringRef v22 = kCGImageSourceTypeIdentifierHint;
      id v23 = v10;
      id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    }

    else
    {
      id v15 = 0LL;
    }

    CGImageSourceRef v17 = CGImageSourceCreateWithData(v9, v15);
    if (v17)
    {
      CGImageSourceRef v18 = v17;
      uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      CFBooleanRef v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitFakeFingerPrint outputType](v14, "outputType"));
      CGImageDestinationRef v20 = CGImageDestinationCreateWithData((CFMutableDataRef)v16, v19, 1uLL, 0LL);

      if (v20)
      {
        if (([a1 _transferImageFromSource:v18 toDestination:v20 matchingResource:v11] & 1) == 0)
        {

          uint64_t v16 = 0LL;
        }

        CFRelease(v20);
      }

      CFRelease(v18);
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = v9;
  }

  return v16;
}

@end