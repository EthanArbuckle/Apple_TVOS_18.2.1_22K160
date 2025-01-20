@interface PAMediaConversionServiceDefaultImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithLossyCompressionQuality:(float)a3;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)init;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3;
- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3;
- (float)lossyCompressionQuality;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLossyCompressionQuality:(float)a3;
@end

@implementation PAMediaConversionServiceDefaultImageMetadataPolicy

- (PAMediaConversionServiceDefaultImageMetadataPolicy)init
{
  LODWORD(v2) = 1062836634;
  return -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:]( self,  "initWithLossyCompressionQuality:",  v2);
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithLossyCompressionQuality:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceDefaultImageMetadataPolicy;
  v4 = -[PAMediaConversionServiceDefaultImageMetadataPolicy init](&v8, "init");
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    -[PAMediaConversionServiceDefaultImageMetadataPolicy setLossyCompressionQuality:]( v4,  "setLossyCompressionQuality:",  v5);
  }

  return v6;
}

- (PAMediaConversionServiceDefaultImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"lossyCompressionQuality"])
  {
    [v4 decodeFloatForKey:@"lossyCompressionQuality"];
    double v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy initWithLossyCompressionQuality:]( self,  "initWithLossyCompressionQuality:");
  }

  else
  {
    double v5 = -[PAMediaConversionServiceDefaultImageMetadataPolicy init](self, "init");
  }

  v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[PAMediaConversionServiceDefaultImageMetadataPolicy lossyCompressionQuality](self, "lossyCompressionQuality");
  objc_msgSend(v4, "encodeFloat:forKey:", @"lossyCompressionQuality");
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  -[PAMediaConversionServiceDefaultImageMetadataPolicy lossyCompressionQuality](self, "lossyCompressionQuality");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  kCGImageDestinationLossyCompressionQuality,  0LL));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  kCGImagePropertyExifDictionary,  kCGImagePropertyExifAuxDictionary,  kCGImagePropertyGPSDictionary,  kCGImagePropertyMakerCanonDictionary,  kCGImagePropertyMakerCanonDictionary,  kCGImagePropertyMakerNikonDictionary,  kCGImagePropertyMakerMinoltaDictionary,  kCGImagePropertyMakerFujiDictionary,  kCGImagePropertyMakerOlympusDictionary,  kCGImagePropertyMakerPentaxDictionary,  0LL));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v12]);
        if (v13) {
          [v6 setObject:v13 forKey:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kCGImagePropertyIPTCDictionary]);
  if (v14)
  {
    v15 = v14;
    id v16 = [v14 mutableCopy];

    [v16 removeObjectForKey:kCGImagePropertyIPTCImageOrientation];
    [v6 setObject:v16 forKey:kCGImagePropertyIPTCDictionary];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kCGImagePropertyTIFFDictionary]);
  if (v17)
  {
    v18 = v17;
    v19 = (NSMutableDictionary *)[v17 mutableCopy];

    -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", kCGImagePropertyTIFFOrientation);
    [v6 setObject:v19 forKey:kCGImagePropertyTIFFDictionary];
  }

  else
  {
    v19 = 0LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kCGImagePropertyMakerAppleDictionary]);
  if (v20)
  {
    v21 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);

    uint64_t v22 = AVAppleMakerNote_MeteorHeadroom;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:AVAppleMakerNote_MeteorHeadroom]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v22);

    uint64_t v24 = AVAppleMakerNote_MeteorPlusGainMap;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:AVAppleMakerNote_MeteorPlusGainMap]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v25, v24);

    [v6 setObject:v21 forKey:kCGImagePropertyMakerAppleDictionary];
    v19 = v21;
  }

  return v6;
}

- (float)lossyCompressionQuality
{
  return self->_lossyCompressionQuality;
}

- (void)setLossyCompressionQuality:(float)a3
{
  self->_lossyCompressionQuality = a3;
}

+ (id)standardPolicy
{
  id v4 = (void *)objc_opt_class(a1);
  if (([v4 isEqual:objc_opt_class(PAMediaConversionServiceDefaultImageMetadataPolicy)] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 82, @"Subclasses must override %@", v8 object file lineNumber description];
  }

  if (qword_100039768 != -1) {
    dispatch_once(&qword_100039768, &stru_1000309D0);
  }
  return (id)qword_100039760;
}

+ (id)policyWithLossyCompressionQuality:(float)a3
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = a3;
  return [v4 initWithLossyCompressionQuality:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end