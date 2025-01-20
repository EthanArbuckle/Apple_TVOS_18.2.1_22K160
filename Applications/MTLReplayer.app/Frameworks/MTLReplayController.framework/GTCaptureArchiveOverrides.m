@interface GTCaptureArchiveOverrides
+ (BOOL)supportsSecureCoding;
+ (id)allowedClasses;
- (GTCaptureArchiveOverrides)init;
- (GTCaptureArchiveOverrides)initWithCoder:(id)a3;
- (NSDictionary)filenameOverrides;
- (void)encodeWithCoder:(id)a3;
- (void)setFilenameOverrides:(id)a3;
@end

@implementation GTCaptureArchiveOverrides

- (void)encodeWithCoder:(id)a3
{
}

- (GTCaptureArchiveOverrides)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTCaptureArchiveOverrides;
  v2 = -[GTCaptureArchiveOverrides init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    filenameOverrides = v2->_filenameOverrides;
    v2->_filenameOverrides = v3;

    v5 = v2;
  }

  return v2;
}

- (GTCaptureArchiveOverrides)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTCaptureArchiveOverrides;
  v5 = -[GTCaptureArchiveOverrides init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allowedClasses]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v6 forKey:@"filenameOverrides"]);
    filenameOverrides = v5->_filenameOverrides;
    v5->_filenameOverrides = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSDictionary)filenameOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFilenameOverrides:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedClasses
{
  if (allowedClasses_onceToken != -1) {
    dispatch_once(&allowedClasses_onceToken, &__block_literal_global_8202);
  }
  return (id)allowedClasses_allowedClasses;
}

void __43__GTCaptureArchiveOverrides_allowedClasses__block_invoke(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___GTCaptureArchiveOverrides);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___GTCaptureArchiveOverrideKey);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___GTCaptureArchiveFilenameOverride);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)allowedClasses_allowedClasses;
  allowedClasses_allowedClasses = v7;
}

@end