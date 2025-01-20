@interface VCPBackupFileHeader
+ (id)headerForTask:(unint64_t)a3;
+ (id)headerFromStream:(id)a3;
- (NSData)data;
- (VCPBackupFileHeader)initWithIdentifier:(unsigned int)a3 andVersion:(unsigned int)a4;
- (int)writeToStream:(id)a3;
- (unsigned)identifier;
- (unsigned)version;
@end

@implementation VCPBackupFileHeader

- (VCPBackupFileHeader)initWithIdentifier:(unsigned int)a3 andVersion:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VCPBackupFileHeader;
  result = -[VCPBackupFileHeader init](&v7, "init");
  if (result)
  {
    result->_identifier = a3;
    result->_version = a4;
  }

  return result;
}

+ (id)headerForTask:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 <= 9 && ((0x207u >> v3) & 1) != 0) {
    id v4 = [objc_alloc((Class)objc_opt_class(a1)) initWithIdentifier:*(unsigned int *)*(&off_1001BC760 + v3) andVersion:*(unsigned int *)*(&off_1001BC7B0 + v3)];
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (NSData)data
{
  int8x8_t v3 = vrev32_s8(*(int8x8_t *)&self->_identifier);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v3,  8LL));
}

+ (id)headerFromStream:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "vcp_readUint32:", &v9) || objc_msgSend(v4, "vcp_readUint32:", &v8))
  {
    id v5 = 0LL;
  }

  else
  {
    id v7 = objc_alloc((Class)objc_opt_class(a1));
    id v5 = [v7 initWithIdentifier:v9 andVersion:v8];
  }

  return v5;
}

- (int)writeToStream:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(v4, "vcp_writeUint32:", self->_identifier);
  if (!v5) {
    int v5 = objc_msgSend(v4, "vcp_writeUint32:", self->_version);
  }

  return v5;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unsigned)version
{
  return self->_version;
}

@end