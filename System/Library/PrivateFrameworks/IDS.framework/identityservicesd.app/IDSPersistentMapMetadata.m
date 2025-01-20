@interface IDSPersistentMapMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSPersistentMapMetadata)initWithCoder:(id)a3;
- (IDSPersistentMapMetadata)initWithVersionNumber:(int64_t)a3;
- (int64_t)versionNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPersistentMapMetadata

- (IDSPersistentMapMetadata)initWithVersionNumber:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSPersistentMapMetadata;
  result = -[IDSPersistentMapMetadata init](&v5, "init");
  if (result) {
    result->_versionNumber = a3;
  }
  return result;
}

- (IDSPersistentMapMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSPersistentMapMetadata;
  objc_super v5 = -[IDSPersistentMapMetadata init](&v7, "init");
  if (v5) {
    v5->_versionNumber = (int64_t)[v4 decodeIntegerForKey:@"versionNumber"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[IDSPersistentMapMetadata versionNumber](self, "versionNumber"),  @"versionNumber");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSPersistentMap, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    int64_t v8 = -[IDSPersistentMapMetadata versionNumber](self, "versionNumber");
    id v9 = [v7 versionNumber];

    BOOL v10 = v8 == (void)v9;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

@end