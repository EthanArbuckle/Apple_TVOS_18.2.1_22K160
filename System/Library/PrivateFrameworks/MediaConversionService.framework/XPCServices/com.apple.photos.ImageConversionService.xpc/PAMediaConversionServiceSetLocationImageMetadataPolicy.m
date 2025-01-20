@interface PAMediaConversionServiceSetLocationImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithLocation:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (CLLocation)location;
- (PAMediaConversionServiceSetLocationImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation PAMediaConversionServiceSetLocationImageMetadataPolicy

- (PAMediaConversionServiceSetLocationImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"location"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class(CLLocation) forKey:@"location"];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[PAMediaConversionServiceSetLocationImageMetadataPolicy setLocation:](self, "setLocation:", v6);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location"));
  [v4 encodeObject:v5 forKey:@"location"];
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kCGImagePropertyGPSDictionary]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFSharingUtilities gpsDictionaryForLocation:]( &OBJC_CLASS___PFSharingUtilities,  "gpsDictionaryForLocation:",  v6));

    unsigned __int8 v8 = [v7 isEqualToDictionary:v4];
  }

  else
  {
    if (!v4)
    {
      char v9 = 0;
      goto LABEL_6;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v8 = [v4 isEqual:v7];
  }

  char v9 = v8 ^ 1;

LABEL_6:
  return v9;
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location"));

  if (v7)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetLocationImageMetadataPolicy location](self, "location"));
    char v9 = (void *)objc_claimAutoreleasedReturnValue( +[PFSharingUtilities gpsDictionaryForLocation:]( &OBJC_CLASS___PFSharingUtilities,  "gpsDictionaryForLocation:",  v8));
  }

  else
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  [v6 setObject:v9 forKeyedSubscript:kCGImagePropertyGPSDictionary];

  return v6;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)policyWithLocation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new(a1);
  [v5 setLocation:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end