@interface UARPAssetVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)versionString;
- (UARPAssetVersion)init;
- (UARPAssetVersion)initWithBVERString:(id)a3;
- (UARPAssetVersion)initWithCoder:(id)a3;
- (UARPAssetVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6;
- (UARPAssetVersion)initWithVersionString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)buildVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)releaseVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersion)init
{
  return 0LL;
}

- (UARPAssetVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPAssetVersion;
  result = -[UARPAssetVersion init](&v11, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }

  return result;
}

- (UARPAssetVersion)initWithVersionString:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 count] == 1)
  {
    [v4 objectAtIndexedSubscript:0];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = 0LL;
LABEL_5:
    uint64_t v9 = 0LL;
LABEL_6:
    uint64_t v10 = 0LL;
    goto LABEL_7;
  }

  if ([v4 count] == 2)
  {
    [v4 objectAtIndexedSubscript:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v8 integerValue];

    [v4 objectAtIndexedSubscript:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 integerValue];
    goto LABEL_5;
  }

  if ([v4 count] == 3)
  {
    [v4 objectAtIndexedSubscript:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v13 integerValue];

    [v4 objectAtIndexedSubscript:1];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v14 integerValue];

    [v4 objectAtIndexedSubscript:2];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v5 integerValue];
    goto LABEL_6;
  }

  if ([v4 count] != 4)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_8;
  }

  [v4 objectAtIndexedSubscript:0];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v15 integerValue];

  [v4 objectAtIndexedSubscript:1];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v16 integerValue];

  [v4 objectAtIndexedSubscript:2];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v17 integerValue];

  [v4 objectAtIndexedSubscript:3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v5 integerValue];
LABEL_7:

LABEL_8:
  objc_super v11 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( self,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v6,  v7,  v9,  v10);

  return v11;
}

- (UARPAssetVersion)initWithBVERString:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectAtIndexedSubscript:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsSeparatedByString:@"."];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  unint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if ([v6 count] == 3)
  {
    [v6 objectAtIndexedSubscript:0];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v11 integerValue];

    [v6 objectAtIndexedSubscript:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = [v12 longLongValue];

    unint64_t v9 = HIDWORD(v13);
    uint64_t v7 = v13;
    [v6 objectAtIndexedSubscript:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v14 integerValue];
  }

  v15 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( self,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v10,  v9,  v7,  v8);

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  self->_majorVersion,  self->_minorVersion,  self->_releaseVersion,  self->_buildVersion);
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x189607968];
  unint64_t majorVersion = self->_majorVersion;
  id v6 = a3;
  [v4 numberWithUnsignedInteger:majorVersion];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"majorVersion"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_minorVersion];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v8 forKey:@"minorVersion"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_releaseVersion];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v9 forKey:@"releaseVersion"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_buildVersion];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v10 forKey:@"buildVersion"];
}

- (UARPAssetVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorVersion"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseVersion"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v9 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( self,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  [v5 unsignedIntegerValue],  objc_msgSend(v6, "unsignedIntegerValue"),  objc_msgSend(v7, "unsignedIntegerValue"),  objc_msgSend(v8, "unsignedIntegerValue"));
  return v9;
}

- (NSString)versionString
{
  return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"%lu.%lu.%lu.%lu",  self->_majorVersion,  self->_minorVersion,  self->_releaseVersion,  self->_buildVersion);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)releaseVersion
{
  return self->_releaseVersion;
}

- (unint64_t)buildVersion
{
  return self->_buildVersion;
}

@end