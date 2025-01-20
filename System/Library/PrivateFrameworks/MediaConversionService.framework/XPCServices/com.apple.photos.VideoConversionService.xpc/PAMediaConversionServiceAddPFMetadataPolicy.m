@interface PAMediaConversionServiceAddPFMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithKey:(id)a3 value:(id)a4;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSString)key;
- (PAMediaConversionServiceAddPFMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (id)value;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PAMediaConversionServiceAddPFMetadataPolicy

+ (id)policyWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = (void *)objc_opt_new(a1, v8);
  [v9 setKey:v7];

  [v9 setValue:v6];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceAddPFMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"mediaMetadataType"])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"mediaMetadataType"]);
    -[PAMediaConversionServiceAddPFMetadataPolicy setKey:](self, "setKey:", v5);
  }

  if ([v4 containsValueForKey:@"mediaMetadataValue"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"mediaMetadataValue"]);
    -[PAMediaConversionServiceAddPFMetadataPolicy setValue:](self, "setValue:", v6);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceAddPFMetadataPolicy key](self, "key"));
  [v4 encodeObject:v5 forKey:@"mediaMetadataType"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceAddPFMetadataPolicy value](self, "value"));
  [v4 encodeObject:v6 forKey:@"mediaMetadataValue"];
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 1;
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceAddPFMetadataPolicy key](self, "key"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceAddPFMetadataPolicy value](self, "value"));
  unsigned __int8 v9 = +[PFMetadataUtilities addMakerApplePropertyWithKey:value:toProperties:]( &OBJC_CLASS___PFMetadataUtilities,  "addMakerApplePropertyWithKey:value:toProperties:",  v7,  v8,  v6);

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    uint64_t v12 = 0LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to add metadata: %@",  (uint8_t *)&v11,  0xCu);
  }

  return v6;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setKey:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end