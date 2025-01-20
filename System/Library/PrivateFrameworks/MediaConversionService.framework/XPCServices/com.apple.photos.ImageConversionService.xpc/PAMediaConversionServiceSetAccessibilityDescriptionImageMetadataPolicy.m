@interface PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithAccessibilityDescription:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSString)accessibilityDescription;
- (PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
@end

@implementation PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy

+ (id)policyWithAccessibilityDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  [v5 setAccessibilityDescription:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"accessibilityDescription"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"accessibilityDescription"];
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy setAccessibilityDescription:]( self,  "setAccessibilityDescription:",  v6);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription]( self,  "accessibilityDescription"));
  [v4 encodeObject:v5 forKey:@"accessibilityDescription"];
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCGImagePropertyIPTCExtArtworkContentDescription]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription]( self,  "accessibilityDescription"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription]( self,  "accessibilityDescription"));
    unsigned __int8 v8 = [v7 isEqualToString:v5];
  }

  else
  {
    if (!v5)
    {
      char v9 = 0;
      goto LABEL_6;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v8 = [v5 isEqual:v7];
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
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary]);
  id v8 = [v7 mutableCopy];

  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription]( self,  "accessibilityDescription"));
  if (v9)
  {
    if (!v8) {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceSetAccessibilityDescriptionImageMetadataPolicy accessibilityDescription]( self,  "accessibilityDescription"));
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  v11 = (void *)v10;
  [v8 setObject:v10 forKeyedSubscript:kCGImagePropertyIPTCExtArtworkContentDescription];

  [v6 setObject:v8 forKeyedSubscript:kCGImagePropertyIPTCDictionary];
  return v6;
}

- (NSString)accessibilityDescription
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end