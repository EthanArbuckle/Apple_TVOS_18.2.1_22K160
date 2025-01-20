@interface PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithAllowLocation:(BOOL)a3;
+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy

- (BOOL)metadataNeedsProcessing:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary]);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned int v5 = [v3 isEqual:v4] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)processMetadata:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy;
  id v4 = -[PAMediaConversionServiceDefaultImageMetadataPolicy processMetadata:](&v10, "processMetadata:", a3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy metadataNeedsProcessing:]( self,  "metadataNeedsProcessing:",  v5))
  {
    id v6 = [v5 mutableCopy];
    [v6 removeObjectForKey:kCGImagePropertyIPTCDictionary];
    v7 = (void *)objc_opt_class(self);
    v11[0] = kCGImagePropertyTIFFMake;
    v11[1] = kCGImagePropertyTIFFModel;
    v11[2] = kCGImagePropertyTIFFCopyright;
    v11[3] = kCGImagePropertyTIFFDateTime;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 4LL));
    [v7 _filterImageProperties:v6 metadataWithKey:kCGImagePropertyTIFFDictionary preserveProperties:v8];

    unsigned int v5 = v6;
  }

  return v5;
}

+ (id)policyWithAllowLocation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___PAMediaConversionServiceSharedPhotoStreamImageMetadataPolicy, a2);
  unsigned int v5 = v4;
  if (v3)
  {
    id v6 = v4;
  }

  else
  {
    v10[0] = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceSetLocationImageMetadataPolicy policyWithLocation:]( &OBJC_CLASS___PAMediaConversionServiceSetLocationImageMetadataPolicy,  "policyWithLocation:",  0LL));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

    id v6 = (id)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceCompositeImageMetadataPolicy policyWithPolicies:]( &OBJC_CLASS___PAMediaConversionServiceCompositeImageMetadataPolicy,  "policyWithPolicies:",  v8));
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_filterImageProperties:(id)a3 metadataWithKey:(id)a4 preserveProperties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
  if (v10)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      id v19 = v9;
      v20 = v7;
      v14 = 0LL;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v17, v19));
          if (v18)
          {
            if (!v14) {
              v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v11 count]));
            }
            [v14 setObject:v18 forKey:v17];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);

      id v9 = v19;
      id v7 = v20;
      if (v14)
      {
        [v20 setObject:v14 forKey:v8];

        goto LABEL_17;
      }
    }

    else
    {
    }

    [v7 removeObjectForKey:v8];
  }

@end