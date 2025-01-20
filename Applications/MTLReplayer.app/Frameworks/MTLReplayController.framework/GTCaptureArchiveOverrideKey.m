@interface GTCaptureArchiveOverrideKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GTCaptureArchiveOverrideKey)initWithCoder:(id)a3;
- (NSNumber)riaGeneration;
- (NSString)platform;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRiaGeneration:(id)a3;
@end

@implementation GTCaptureArchiveOverrideKey

- (void)encodeWithCoder:(id)a3
{
  platform = self->_platform;
  id v5 = a3;
  [v5 encodeObject:platform forKey:@"platform"];
  [v5 encodeObject:self->_riaGeneration forKey:@"riaGeneration"];
}

- (GTCaptureArchiveOverrideKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GTCaptureArchiveOverrideKey;
  v6 = -[GTCaptureArchiveOverrideKey init](&v16, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"platform");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    platform = v6->_platform;
    v6->_platform = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"riaGeneration");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    riaGeneration = v6->_riaGeneration;
    v6->_riaGeneration = (NSNumber *)v12;

    v14 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___GTCaptureArchiveOverrideKey);
  -[GTCaptureArchiveOverrideKey setPlatform:](v4, "setPlatform:", self->_platform);
  -[GTCaptureArchiveOverrideKey setRiaGeneration:](v4, "setRiaGeneration:", self->_riaGeneration);
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_platform, "hash");
  return (unint64_t)-[NSNumber hash](self->_riaGeneration, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___GTCaptureArchiveOverrideKey, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = v5;
    v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 platform]);
    platform = self->_platform;
    if (v9 == platform
      || (NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue([v8 platform]),
          [v3 isEqualToString:self->_platform]))
    {
      uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue([v8 riaGeneration]);
      if (v12 == self->_riaGeneration)
      {
        unsigned __int8 v11 = 1;
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 riaGeneration]);
        unsigned __int8 v11 = [v13 isEqualToNumber:self->_riaGeneration];
      }

      if (v9 == platform) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }

  unsigned __int8 v11 = 0;
LABEL_12:

  return v11;
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPlatform:(id)a3
{
}

- (NSNumber)riaGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRiaGeneration:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end