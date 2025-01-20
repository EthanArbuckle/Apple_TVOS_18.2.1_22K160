@interface LACSecureData
+ (id)secureDataWithBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)secureDataWithData:(id)a3;
+ (id)secureDataWithString:(id)a3;
+ (void)resetBytes:(void *)a3 length:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeLastCharacter;
- (LACSecureData)init;
- (LACSecureData)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (LACSecureData)initWithData:(id)a3;
- (LACSecureData)initWithString:(id)a3;
- (const)bytes;
- (id)data;
- (id)nullTerminatedCopy;
- (unint64_t)length;
- (void)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)appendData:(id)a3;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)prepareBuffer:(unint64_t)a3;
- (void)reset;
@end

@implementation LACSecureData

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LACSecureData;
  -[LACSecureData dealloc](&v3, sel_dealloc);
}

- (void)prepareBuffer:(unint64_t)a3
{
  unint64_t allocatedLength = self->_allocatedLength;
  if (allocatedLength >= a3)
  {
    +[LACSecureData resetBytes:length:]( &OBJC_CLASS___LACSecureData,  "resetBytes:length:",  (char *)self->_bytes + a3,  allocatedLength - a3);
LABEL_8:
    self->_size_t bytesLength = a3;
    return;
  }

  v6 = malloc(a3);
  if (v6)
  {
    v7 = v6;
    +[LACSecureData resetBytes:length:](&OBJC_CLASS___LACSecureData, "resetBytes:length:", v6, a3);
    bytes = self->_bytes;
    if (bytes)
    {
      size_t bytesLength = self->_bytesLength;
      if (bytesLength)
      {
        memcpy(v7, bytes, bytesLength);
        -[LACSecureData reset](self, "reset");
      }
    }

    self->_unint64_t allocatedLength = a3;
    self->_bytes = v7;
    goto LABEL_8;
  }

  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"malloc failed" userInfo:0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
  -[LACSecureData init](v11, v12);
}

- (LACSecureData)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return -[LACSecureData initWithString:](v3, v4, v5);
}

- (LACSecureData)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACSecureData;
  id v5 = -[LACSecureData init](&v8, sel_init);
  if (v5)
  {
    uint64_t v7 = 0LL;
    objc_msgSend( v4,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  0,  0,  &v7,  4,  0,  0,  objc_msgSend(v4, "length"),  0);
    -[LACSecureData prepareBuffer:](v5, "prepareBuffer:", v7);
    objc_msgSend( v4,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v5->_bytes,  v5->_bytesLength,  &v7,  4,  0,  0,  objc_msgSend(v4, "length"),  0);
  }

  return v5;
}

- (LACSecureData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACSecureData;
  v6 = -[LACSecureData init](&v9, sel_init);
  uint64_t v7 = v6;
  if (v6)
  {
    -[LACSecureData prepareBuffer:](v6, "prepareBuffer:", a4);
    memcpy(v7->_bytes, a3, a4);
  }

  return v7;
}

- (LACSecureData)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return -[LACSecureData initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

+ (id)secureDataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return  -[LACSecureData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___LACSecureData),  "initWithBytes:length:",  a3,  a4);
}

+ (id)secureDataWithString:(id)a3
{
  id v3 = a3;
  id v4 = -[LACSecureData initWithString:](objc_alloc(&OBJC_CLASS___LACSecureData), "initWithString:", v3);

  return v4;
}

+ (id)secureDataWithData:(id)a3
{
  id v3 = a3;
  id v4 = -[LACSecureData initWithData:](objc_alloc(&OBJC_CLASS___LACSecureData), "initWithData:", v3);

  return v4;
}

- (id)nullTerminatedCopy
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = 0;
  [v2 appendBytes:&v4 length:1];
  return v2;
}

+ (void)resetBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)reset
{
  bytes = self->_bytes;
  if (bytes)
  {
    +[LACSecureData resetBytes:length:](&OBJC_CLASS___LACSecureData, "resetBytes:length:", bytes, self->_bytesLength);
    free(self->_bytes);
    self->_unint64_t allocatedLength = 0LL;
    self->_bytes = 0LL;
    self->_size_t bytesLength = 0LL;
  }

- (const)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return self->_bytesLength;
}

- (id)data
{
  return (id)[MEMORY[0x189603F48] dataWithBytes:self->_bytes length:self->_bytesLength];
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t bytesLength = self->_bytesLength;
  -[LACSecureData prepareBuffer:](self, "prepareBuffer:", bytesLength + a4);
  memcpy((char *)self->_bytes + bytesLength, a3, a4);
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  -[LACSecureData appendBytes:length:](self, "appendBytes:length:", v5, v6);
}

- (void)appendString:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LACSecureData appendData:](self, "appendData:", v4);
}

- (BOOL)removeLastCharacter
{
  bytes = (char *)self->_bytes;
  if (bytes)
  {
    unint64_t bytesLength = self->_bytesLength;
    if (bytesLength)
    {
      if (bytesLength == 1)
      {
        unint64_t v4 = 1LL;
LABEL_13:
        -[LACSecureData resize:](self, "resize:", bytesLength - v4);
        LOBYTE(bytes) = 1;
        return (char)bytes;
      }

      uint64_t v5 = &bytes[bytesLength];
      uint64_t v6 = bytes - 1;
      unint64_t v4 = 1LL;
      while ((v6[bytesLength] & 0xC0) == 0x80)
      {
        --v6;
        if (bytesLength == ++v4)
        {
          unint64_t v4 = self->_bytesLength;
          break;
        }
      }

      if (v4 < 2) {
        goto LABEL_13;
      }
      LOBYTE(bytes) = 0;
    }

    else
    {
      LOBYTE(bytes) = 0;
    }
  }

  return (char)bytes;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[LACSecureData length](self, "length");
  BOOL v6 = v5 == [v4 length]
    && timingsafe_bcmp( -[LACSecureData bytes](self, "bytes"),  (const void *)[v4 bytes],  -[LACSecureData length](self, "length")) == 0;

  return v6;
}

@end