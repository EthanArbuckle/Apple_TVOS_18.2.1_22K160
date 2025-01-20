@interface DVTKTraceSessionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)useExisting;
- (DVTKTraceSessionConfiguration)init;
- (DVTKTraceSessionConfiguration)initWithCoder:(id)a3;
- (NSData)bitmap;
- (NSDictionary)providers;
- (unint64_t)collectionInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setBitmap:(id)a3;
- (void)setCollectionInterval:(unint64_t)a3;
- (void)setProviders:(id)a3;
- (void)setUseExisting:(BOOL)a3;
@end

@implementation DVTKTraceSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DVTKTraceSessionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DVTKTraceSessionConfiguration;
  result = -[DVTKTraceSessionConfiguration init](&v3, "init");
  if (result) {
    result->_collectionInterval = 100LL;
  }
  return result;
}

- (DVTKTraceSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DVTKTraceSessionConfiguration;
  v5 = -[DVTKTraceSessionConfiguration init](&v15, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"_bitmap"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    bitmap = v5->_bitmap;
    v5->_bitmap = (NSData *)v7;

    v5->_useExisting = [v4 decodeBoolForKey:@"_useExisting"];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"_providers"]);
    providers = v5->_providers;
    v5->_providers = (NSDictionary *)v12;

    v5->_collectionInterval = (unint64_t)[v4 decodeInt64ForKey:@"_collectionInterval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bitmap = self->_bitmap;
  id v5 = a3;
  [v5 encodeObject:bitmap forKey:@"_bitmap"];
  [v5 encodeBool:self->_useExisting forKey:@"_useExisting"];
  [v5 encodeObject:self->_providers forKey:@"_providers"];
  [v5 encodeInt64:self->_collectionInterval forKey:@"_collectionInterval"];
}

- (NSData)bitmap
{
  return self->_bitmap;
}

- (void)setBitmap:(id)a3
{
}

- (BOOL)useExisting
{
  return self->_useExisting;
}

- (void)setUseExisting:(BOOL)a3
{
  self->_useExisting = a3;
}

- (NSDictionary)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (unint64_t)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(unint64_t)a3
{
  self->_collectionInterval = a3;
}

- (void).cxx_destruct
{
}

@end