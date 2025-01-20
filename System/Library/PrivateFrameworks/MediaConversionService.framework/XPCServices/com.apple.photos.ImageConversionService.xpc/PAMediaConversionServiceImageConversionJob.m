@interface PAMediaConversionServiceImageConversionJob
- (BOOL)_validateMetadata;
- (BOOL)_validateOrientation;
- (BOOL)_validateOutputSize;
- (BOOL)_validateSource;
- (BOOL)applySourceOrientationTransform;
- (BOOL)canAccessSourceImageProperties;
- (BOOL)formatConversionOnly;
- (BOOL)hasLivePhotoSourceURLs;
- (BOOL)hasPhotosAdjustments;
- (BOOL)isRAWSourceUTI;
- (BOOL)shouldCheckForOutputCorruption;
- (BOOL)shouldUseEmbeddedImageAsSource;
- (BOOL)sourceRequiresRasterization;
- (BOOL)valid;
- (BOOL)validateSourceAndOptions;
- (CGImage)sourceImageRef;
- (CGImageDestination)imageDestination;
- (CGImageSource)imageSource;
- (CGSize)outputImageSize;
- (CGSize)sourceImageSize;
- (NSData)destinationData;
- (NSData)photosAdjustmentData;
- (NSDictionary)adjustmentInformation;
- (NSDictionary)sourceImageProperties;
- (NSError)error;
- (NSMutableData)imageDestinationData;
- (NSMutableDictionary)destinationImageProperties;
- (NSNumber)candidacy;
- (NSString)inputFileType;
- (NSString)outputFileType;
- (NSString)photosAdjustmentFormatIdentifier;
- (NSString)photosAdjustmentFormatVersion;
- (NSString)requestIdentifier;
- (NSString)sourceUTI;
- (NSURL)adjustmentSidecarDataResourceURL;
- (NSURL)mainSourceResourceURL;
- (PAMediaConversionServiceImageConversionJob)initWithRequestIdentifier:(id)a3 sourceResourceURLCollection:(id)a4 outputFileType:(id)a5;
- (PAMediaConversionServiceImageMetadataPolicy)metadataPolicy;
- (PAMediaConversionServiceResourceURLCollection)destinationResourceURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceResourceURLCollection;
- (double)scaleFactor;
- (int64_t)colorspaceMode;
- (int64_t)orientation;
- (int64_t)rasterizationDPI;
- (int64_t)requestedMaximumLongSideLength;
- (int64_t)requestedMaximumPixelCount;
- (int64_t)requestedOrCalculatedMaximumLongSideLength;
- (int64_t)sourceOrientation;
- (unint64_t)orientationTransformBehavior;
- (unint64_t)status;
- (unint64_t)validationState;
- (void)_validate;
- (void)dealloc;
- (void)setAdjustmentInformation:(id)a3;
- (void)setApplySourceOrientationTransform:(BOOL)a3;
- (void)setCandidacy:(id)a3;
- (void)setColorspaceMode:(int64_t)a3;
- (void)setDestinationData:(id)a3;
- (void)setDestinationResourceURLCollection:(id)a3;
- (void)setError:(id)a3;
- (void)setFormatConversionOnly:(BOOL)a3;
- (void)setImageDestination:(CGImageDestination *)a3;
- (void)setImageDestinationData:(id)a3;
- (void)setImageSource:(CGImageSource *)a3;
- (void)setInputFileType:(id)a3;
- (void)setMetadataPolicy:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOutputFileType:(id)a3;
- (void)setOutputImageSize:(CGSize)a3;
- (void)setRasterizationDPI:(int64_t)a3;
- (void)setRequestedMaximumLongSideLength:(int64_t)a3;
- (void)setRequestedMaximumPixelCount:(int64_t)a3;
- (void)setScaleFactor:(double)a3;
- (void)setShouldCheckForOutputCorruption:(BOOL)a3;
- (void)setShouldUseEmbeddedImageAsSource:(BOOL)a3;
- (void)setSourceResourceURLCollection:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setValidationState:(unint64_t)a3;
@end

@implementation PAMediaConversionServiceImageConversionJob

- (PAMediaConversionServiceImageConversionJob)initWithRequestIdentifier:(id)a3 sourceResourceURLCollection:(id)a4 outputFileType:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 980, @"Invalid parameter not satisfying: %@", @"resourceURLCollection" object file lineNumber description];
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceImageConversionJob;
  v13 = -[PAMediaConversionServiceImageConversionJob init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestIdentifier, a3);
    objc_storeStrong((id *)&v14->_sourceResourceURLCollection, a4);
    objc_storeStrong((id *)&v14->_outputFileType, a5);
    v14->_rasterizationDPI = (int64_t)+[PFMediaUtilities defaultRasterizationDPI]( &OBJC_CLASS___PFMediaUtilities,  "defaultRasterizationDPI");
  }

  return v14;
}

- (BOOL)validateSourceAndOptions
{
  if (!self->_validationState) {
    -[PAMediaConversionServiceImageConversionJob _validate](self, "_validate");
  }
  return -[PAMediaConversionServiceImageConversionJob valid](self, "valid");
}

- (void)_validate
{
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, self);
  id v4 = &_os_log_default;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_BEGIN,  v3,  "com.apple.photos.mediaconversion.service.validate",  "",  buf,  2u);
  }

  if (-[PAMediaConversionServiceImageConversionJob _validateSource](self, "_validateSource")
    && -[PAMediaConversionServiceImageConversionJob _validateMetadata](self, "_validateMetadata")
    && -[PAMediaConversionServiceImageConversionJob _validateOrientation](self, "_validateOrientation"))
  {
    unsigned int v5 = -[PAMediaConversionServiceImageConversionJob _validateOutputSize](self, "_validateOutputSize");
    unint64_t v6 = 1LL;
    if (v5) {
      unint64_t v6 = 2LL;
    }
  }

  else
  {
    unint64_t v6 = 1LL;
  }

  self->_validationState = v6;
  id v7 = &_os_log_default;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_SIGNPOST_INTERVAL_END,  v3,  "com.apple.photos.mediaconversion.service.validate",  "",  v8,  2u);
  }
}

- (BOOL)_validateSource
{
  os_signpost_id_t v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob mainSourceResourceURL]( self,  "mainSourceResourceURL"));
  v14[0] = &__kCFBooleanFalse;
  v13[0] = kCGImageSourceShouldCache;
  v13[1] = kCGImageSourceRasterizationDPI;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[PFMediaUtilities defaultRasterizationDPI]( &OBJC_CLASS___PFMediaUtilities,  "defaultRasterizationDPI")));
  v14[1] = v4;
  self->_imageSource = CGImageSourceCreateWithURL( v3,  (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  if (!self->_imageSource)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v3, "path"));
      int v11 = 138412290;
      id v12 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image source from %@",  (uint8_t *)&v11,  0xCu);
    }

    goto LABEL_7;
  }

  unsigned int v5 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  imageDestinationData = self->_imageDestinationData;
  self->_imageDestinationData = v5;

  BOOL v7 = 1;
  v8 = CGImageDestinationCreateWithData( (CFMutableDataRef)self->_imageDestinationData,  (CFStringRef)self->_outputFileType,  1uLL,  0LL);
  self->_imageDestination = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create output image destination",  (uint8_t *)&v11,  2u);
    }

- (BOOL)_validateMetadata
{
  if (-[PAMediaConversionServiceImageConversionJob canAccessSourceImageProperties]( self,  "canAccessSourceImageProperties"))
  {
    os_signpost_id_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob metadataPolicy](self, "metadataPolicy"));

    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No metadata policy provided, defaulting to standard policy",  v13,  2u);
      }

      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceImageMetadataPolicy standardPolicy]( &OBJC_CLASS___PAMediaConversionServiceImageMetadataPolicy,  "standardPolicy"));
      -[PAMediaConversionServiceImageConversionJob setMetadataPolicy:](self, "setMetadataPolicy:", v4);
    }

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob metadataPolicy](self, "metadataPolicy"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob sourceImageProperties](self, "sourceImageProperties"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 processMetadata:v6]);
    v8 = (NSMutableDictionary *)[v7 mutableCopy];
    destinationImageProperties = self->_destinationImageProperties;
    self->_destinationImageProperties = v8;
  }

  else
  {
    id v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    int v11 = self->_destinationImageProperties;
    self->_destinationImageProperties = v10;
  }

  return 1;
}

- (BOOL)_validateOrientation
{
  int64_t v3 = -[PAMediaConversionServiceImageConversionJob sourceOrientation](self, "sourceOrientation");
  if (-[PAMediaConversionServiceImageConversionJob applySourceOrientationTransform]( self,  "applySourceOrientationTransform"))
  {
    -[PAMediaConversionServiceImageConversionJob setOrientation:](self, "setOrientation:", v3);
  }

  int64_t v4 = -[PAMediaConversionServiceImageConversionJob orientation](self, "orientation");
  self->_orientationTransformBehavior = 0LL;
  if (IPAOrientationIsValid())
  {
    if (v4 == v3)
    {
      if (v3 == 1)
      {
LABEL_12:
        -[NSMutableDictionary removeObjectForKey:]( self->_destinationImageProperties,  "removeObjectForKey:",  kCGImagePropertyOrientation);
        goto LABEL_13;
      }

      unint64_t v5 = 1LL;
    }

    else
    {
      unint64_t v5 = 2LL;
    }

    self->_orientationTransformBehavior = v5;
    goto LABEL_12;
  }

  if (!v4)
  {
LABEL_13:
    LOBYTE(v6) = 1;
    return v6;
  }

  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    int v8 = 134217984;
    int64_t v9 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid orientation request option %ld",  (uint8_t *)&v8,  0xCu);
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_validateOutputSize
{
  BOOL v5 = v4 != 0.0 && v3 != 0.0;
  if (v5)
  {
    double v6 = v3;
    double v7 = v4;
    if (-[PAMediaConversionServiceImageConversionJob requestedMaximumPixelCount](self, "requestedMaximumPixelCount"))
    {
      PFScaleFactorForMaximumPixelCount( -[PAMediaConversionServiceImageConversionJob requestedMaximumPixelCount](self, "requestedMaximumPixelCount"),  v6,  v7);
    }

    else
    {
      if (!-[PAMediaConversionServiceImageConversionJob requestedMaximumLongSideLength]( self,  "requestedMaximumLongSideLength"))
      {
LABEL_15:
        -[PAMediaConversionServiceImageConversionJob scaleFactor](self, "scaleFactor");
        if (v11 > 1.0) {
          double v11 = 1.0;
        }
        -[PAMediaConversionServiceImageConversionJob setScaleFactor:](self, "setScaleFactor:", v11);
        return v5;
      }

      uint64_t v9 = -[PAMediaConversionServiceImageConversionJob requestedMaximumLongSideLength]( self,  "requestedMaximumLongSideLength");
      if (v6 >= v7) {
        double v10 = v6;
      }
      else {
        double v10 = v7;
      }
      double v8 = (double)v9 / v10;
    }

    -[PAMediaConversionServiceImageConversionJob setScaleFactor:](self, "setScaleFactor:", v8);
    goto LABEL_15;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to determine input image size",  v13,  2u);
  }

  return v5;
}

- (int64_t)requestedOrCalculatedMaximumLongSideLength
{
  if (-[PAMediaConversionServiceImageConversionJob requestedMaximumLongSideLength]( self,  "requestedMaximumLongSideLength"))
  {
    return -[PAMediaConversionServiceImageConversionJob requestedMaximumLongSideLength]( self,  "requestedMaximumLongSideLength");
  }

  -[PAMediaConversionServiceImageConversionJob sourceImageSize](self, "sourceImageSize");
  double v5 = v4;
  double v7 = v6;
  -[PAMediaConversionServiceImageConversionJob scaleFactor](self, "scaleFactor");
  if (v5 >= v7) {
    double v9 = v5;
  }
  else {
    double v9 = v7;
  }
  int64_t v10 = llround(v8 * v9);
  return v10 - ((v10 > 1) & v10);
}

- (BOOL)valid
{
  unint64_t validationState = self->_validationState;
  if (!validationState)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1117 description:@"Call validateSourceAndOptions on job before calling valid"];

    unint64_t validationState = self->_validationState;
  }

  return validationState == 2;
}

- (BOOL)hasPhotosAdjustments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob photosAdjustmentData](self, "photosAdjustmentData"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)hasLivePhotoSourceURLs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( self,  "sourceResourceURLCollection"));
  v6[0] = @"PAMediaConversionResourceRoleMainResource";
  v6[1] = @"PAMediaConversionResourceRoleVideoComplement";
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  unsigned __int8 v4 = [v2 containsAllRoles:v3];

  return v4;
}

- (NSData)photosAdjustmentData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob adjustmentInformation](self, "adjustmentInformation"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentDataKey"]);

  return (NSData *)v3;
}

- (NSString)photosAdjustmentFormatIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob adjustmentInformation](self, "adjustmentInformation"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatIdentifierKey"]);

  return (NSString *)v3;
}

- (NSString)photosAdjustmentFormatVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob adjustmentInformation](self, "adjustmentInformation"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatVersionKey"]);

  return (NSString *)v3;
}

- (unint64_t)orientationTransformBehavior
{
  if (!-[PAMediaConversionServiceImageConversionJob valid](self, "valid"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v5 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1148 description:@"Invalid job"];
  }

  return self->_orientationTransformBehavior;
}

- (NSURL)mainSourceResourceURL
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceResourceURLCollection resourceURLForRole:]( self->_sourceResourceURLCollection,  "resourceURLForRole:",  @"PAMediaConversionResourceRoleMainResource"));
  if (-[PAMediaConversionServiceResourceURLCollection isBlastDoorAccessRequired]( self->_sourceResourceURLCollection,  "isBlastDoorAccessRequired"))
  {
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v7 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[BlastDoor] Unexpected nil main resource URL for blastDoorAccess",  v7,  2u);
    }
  }

  else if (!v4)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1160 description:@"Unexpected nil main resource URL"];
  }

  return (NSURL *)v4;
}

- (NSURL)adjustmentSidecarDataResourceURL
{
  return (NSURL *)-[PAMediaConversionServiceResourceURLCollection resourceURLForRole:]( self->_sourceResourceURLCollection,  "resourceURLForRole:",  @"PAMediaConversionResourceRoleCompositionSidecarDataFile");
}

- (CGImage)sourceImageRef
{
  result = self->_sourceImageRef;
  if (!result)
  {
    if (-[PAMediaConversionServiceImageConversionJob sourceRequiresRasterization](self, "sourceRequiresRasterization"))
    {
      uint64_t v11 = kCGImageSourceRasterizationDPI;
      unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_rasterizationDPI));
      id v12 = v4;
      double v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    }

    else
    {
      double v5 = 0LL;
    }

    ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, 0LL, v5);
    self->_sourceImageRef = ImageAtIndex;
    if (!ImageAtIndex && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob mainSourceResourceURL](self, "mainSourceResourceURL"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      int v9 = 138412290;
      int64_t v10 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create image ref from %@",  (uint8_t *)&v9,  0xCu);
    }

    return self->_sourceImageRef;
  }

  return result;
}

- (BOOL)canAccessSourceImageProperties
{
  return !-[PAMediaConversionServiceImageConversionJob sourceRequiresRasterization](self, "sourceRequiresRasterization");
}

- (NSMutableDictionary)destinationImageProperties
{
  if (!-[PAMediaConversionServiceImageConversionJob valid](self, "valid"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v5 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1195 description:@"Invalid job"];
  }

  return self->_destinationImageProperties;
}

- (NSDictionary)sourceImageProperties
{
  sourceImageProperties = self->_sourceImageProperties;
  if (sourceImageProperties) {
    return sourceImageProperties;
  }
  if (-[PAMediaConversionServiceImageConversionJob canAccessSourceImageProperties]( self,  "canAccessSourceImageProperties"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( self,  "sourceResourceURLCollection"));
    unsigned int v6 = [v5 isBlastDoorAccessRequired];

    if (v6)
    {
      double v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( self,  "sourceResourceURLCollection"));
      double v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSDictionary blastDoorMainSourceProperties](v7, "blastDoorMainSourceProperties"));
      int v9 = self->_sourceImageProperties;
      self->_sourceImageProperties = v8;
    }

    else
    {
      int64_t v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities imagePropertiesFromImageSource:]( &OBJC_CLASS___PFMediaUtilities,  "imagePropertiesFromImageSource:",  self->_imageSource));
      double v7 = self->_sourceImageProperties;
      self->_sourceImageProperties = v10;
    }

    sourceImageProperties = self->_sourceImageProperties;
    if (!sourceImageProperties)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob mainSourceResourceURL]( self,  "mainSourceResourceURL"));
        int v13 = 138412290;
        v14 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get source image properties for %@",  (uint8_t *)&v13,  0xCu);

        sourceImageProperties = self->_sourceImageProperties;
      }

      else
      {
        sourceImageProperties = 0LL;
      }
    }

    return sourceImageProperties;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob mainSourceResourceURL](self, "mainSourceResourceURL"));
    int v13 = 138412290;
    v14 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get source image properties for input image: %@",  (uint8_t *)&v13,  0xCu);
  }

  return (NSDictionary *)0LL;
}

- (BOOL)sourceRequiresRasterization
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob sourceUTI](self, "sourceUTI"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v2));
  unsigned __int8 v4 = +[PFMediaUtilities typeRequiresRasterizationDPI:]( &OBJC_CLASS___PFMediaUtilities,  "typeRequiresRasterizationDPI:",  v3);

  return v4;
}

- (NSString)sourceUTI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceImageConversionJob sourceResourceURLCollection]( self,  "sourceResourceURLCollection"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"]);

  return (NSString *)v3;
}

- (BOOL)isRAWSourceUTI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob sourceUTI](self, "sourceUTI"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[PFUniformTypeUtilities typeWithIdentifier:]( &OBJC_CLASS___PFUniformTypeUtilities,  "typeWithIdentifier:",  v2));
  unsigned __int8 v4 = [v3 conformsToType:UTTypeRAWImage];

  return v4;
}

- (int64_t)sourceOrientation
{
  if (!-[PAMediaConversionServiceImageConversionJob canAccessSourceImageProperties]( self,  "canAccessSourceImageProperties")) {
    return 1LL;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob sourceImageProperties](self, "sourceImageProperties"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCGImagePropertyOrientation]);

  if (!v4) {
    return 1LL;
  }
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (CGSize)sourceImageSize
{
  if (-[PAMediaConversionServiceImageConversionJob canAccessSourceImageProperties]( self,  "canAccessSourceImageProperties"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceImageConversionJob sourceImageProperties](self, "sourceImageProperties"));
    +[PFMediaUtilities maximumImageSizeFromProperties:]( &OBJC_CLASS___PFMediaUtilities,  "maximumImageSizeFromProperties:",  v3);
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double Height = v7;
  }

  else
  {
    int64_t v10 = -[PAMediaConversionServiceImageConversionJob sourceImageRef](self, "sourceImageRef");
    double Width = (double)CGImageGetWidth(v10);
    double Height = (double)CGImageGetHeight(v10);
    double v8 = Width;
  }

  result.height = Height;
  result.width = v8;
  return result;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  imageDestination = self->_imageDestination;
  if (imageDestination) {
    CFRelease(imageDestination);
  }
  sourceImageRef = self->_sourceImageRef;
  if (sourceImageRef) {
    CGImageRelease(sourceImageRef);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceImageConversionJob;
  -[PAMediaConversionServiceImageConversionJob dealloc](&v6, "dealloc");
}

- (int64_t)rasterizationDPI
{
  return self->_rasterizationDPI;
}

- (void)setRasterizationDPI:(int64_t)a3
{
  self->_rasterizationDPI = a3;
}

- (NSString)requestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (PAMediaConversionServiceResourceURLCollection)sourceResourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSourceResourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)destinationResourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDestinationResourceURLCollection:(id)a3
{
}

- (NSData)destinationData
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDestinationData:(id)a3
{
}

- (int64_t)requestedMaximumPixelCount
{
  return self->_requestedMaximumPixelCount;
}

- (void)setRequestedMaximumPixelCount:(int64_t)a3
{
  self->_requestedMaximumPixelCount = a3;
}

- (int64_t)requestedMaximumLongSideLength
{
  return self->_requestedMaximumLongSideLength;
}

- (void)setRequestedMaximumLongSideLength:(int64_t)a3
{
  self->_requestedMaximumLongSideLength = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (BOOL)applySourceOrientationTransform
{
  return self->_applySourceOrientationTransform;
}

- (void)setApplySourceOrientationTransform:(BOOL)a3
{
  self->_applySourceOrientationTransform = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)colorspaceMode
{
  return self->_colorspaceMode;
}

- (void)setColorspaceMode:(int64_t)a3
{
  self->_colorspaceMode = a3;
}

- (BOOL)formatConversionOnly
{
  return self->_formatConversionOnly;
}

- (void)setFormatConversionOnly:(BOOL)a3
{
  self->_formatConversionOnly = a3;
}

- (BOOL)shouldCheckForOutputCorruption
{
  return self->_shouldCheckForOutputCorruption;
}

- (void)setShouldCheckForOutputCorruption:(BOOL)a3
{
  self->_shouldCheckForOutputCorruption = a3;
}

- (NSDictionary)adjustmentInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setAdjustmentInformation:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)inputFileType
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setInputFileType:(id)a3
{
}

- (NSString)outputFileType
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setOutputFileType:(id)a3
{
}

- (PAMediaConversionServiceImageMetadataPolicy)metadataPolicy
{
  return (PAMediaConversionServiceImageMetadataPolicy *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setMetadataPolicy:(id)a3
{
}

- (CGSize)outputImageSize
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOutputImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_outputImageSize, &v3, 16LL, 1, 0);
}

- (NSNumber)candidacy
{
  return (NSNumber *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setCandidacy:(id)a3
{
}

- (BOOL)shouldUseEmbeddedImageAsSource
{
  return self->_shouldUseEmbeddedImageAsSource;
}

- (void)setShouldUseEmbeddedImageAsSource:(BOOL)a3
{
  self->_shouldUseEmbeddedImageAsSource = a3;
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(CGImageSource *)a3
{
  self->_imageSource = a3;
}

- (NSMutableData)imageDestinationData
{
  return (NSMutableData *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setImageDestinationData:(id)a3
{
}

- (CGImageDestination)imageDestination
{
  return self->_imageDestination;
}

- (void)setImageDestination:(CGImageDestination *)a3
{
  self->_imageDestination = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (void)setValidationState:(unint64_t)a3
{
  self->_unint64_t validationState = a3;
}

- (void).cxx_destruct
{
}

@end