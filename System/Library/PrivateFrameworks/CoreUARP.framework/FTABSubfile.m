@interface FTABSubfile
- (FTABSubfile)initWithTag:(id)a3 data:(id)a4;
- (FTABSubfile)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5;
- (NSData)data;
- (NSString)tag;
- (const)dataPointer;
- (id)description;
- (id)generateHashSHA256;
- (id)generateHashSHA384;
- (id)generateHashSHA512;
- (unsigned)dataLength;
@end

@implementation FTABSubfile

- (FTABSubfile)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FTABSubfile;
  v9 = -[FTABSubfile init](&v13, sel_init);
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v9->_dataPointer = (const char *)a4;
    v9->_dataLength = a5;
  }

  return v9;
}

- (FTABSubfile)initWithTag:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FTABSubfile;
  id v8 = -[FTABSubfile init](&v14, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v8->_dataPointer = (const char *)-[NSData bytes](v8->_data, "bytes");
    v8->_dataLength = -[NSData length](v8->_data, "length");
  }

  return v8;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x189603F48] dataWithBytes:self->_dataPointer length:self->_dataLength];
}

- (id)generateHashSHA256
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&v4);
  CC_SHA256_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA256_Final(md, &v4);
  [MEMORY[0x189603F48] dataWithBytes:md length:32];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateHashSHA384
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  CC_SHA384_Init(&c);
  CC_SHA384_Update(&c, self->_dataPointer, self->_dataLength);
  CC_SHA384_Final(md, &c);
  [MEMORY[0x189603F48] dataWithBytes:md length:48];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateHashSHA512
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  CC_SHA512_Init(&c);
  CC_SHA512_Update(&c, self->_dataPointer, self->_dataLength);
  CC_SHA512_Final(md, &c);
  [MEMORY[0x189603F48] dataWithBytes:md length:64];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Subfile: type=%@, length=%u", self->_tag, self->_dataLength];
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (const)dataPointer
{
  return self->_dataPointer;
}

- (unsigned)dataLength
{
  return self->_dataLength;
}

- (void).cxx_destruct
{
}

@end