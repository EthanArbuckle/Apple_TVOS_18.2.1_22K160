@interface GTCaptureArchiveFilenameOverride
+ (BOOL)supportsSecureCoding;
- (GTCaptureArchiveFilenameOverride)initWithCoder:(id)a3;
- (NSString)originalFilename;
- (NSString)overrideFilename;
- (unint64_t)exportToolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setExportToolVersion:(unint64_t)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setOverrideFilename:(id)a3;
@end

@implementation GTCaptureArchiveFilenameOverride

- (void)encodeWithCoder:(id)a3
{
  originalFilename = self->_originalFilename;
  id v5 = a3;
  [v5 encodeObject:originalFilename forKey:@"originalFilename"];
  [v5 encodeObject:self->_overrideFilename forKey:@"overrideFilename"];
  [v5 encodeInt64:self->_exportToolVersion forKey:@"exportToolVersion"];
}

- (GTCaptureArchiveFilenameOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GTCaptureArchiveFilenameOverride;
  v6 = -[GTCaptureArchiveFilenameOverride init](&v16, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"originalFilename");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    originalFilename = v6->_originalFilename;
    v6->_originalFilename = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"overrideFilename");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    overrideFilename = v6->_overrideFilename;
    v6->_overrideFilename = (NSString *)v12;

    v6->_exportToolVersion = (unint64_t)[v4 decodeInt64ForKey:@"exportToolVersion"];
    v14 = v6;
  }

  return v6;
}

- (NSString)originalFilename
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setOriginalFilename:(id)a3
{
}

- (NSString)overrideFilename
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOverrideFilename:(id)a3
{
}

- (unint64_t)exportToolVersion
{
  return self->_exportToolVersion;
}

- (void)setExportToolVersion:(unint64_t)a3
{
  self->_exportToolVersion = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end