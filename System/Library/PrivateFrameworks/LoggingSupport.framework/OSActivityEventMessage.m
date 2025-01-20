@interface OSActivityEventMessage
- (NSMutableArray)arguments;
- (NSString)format;
- (void)fillEventData:(const char *)a3 length:(unint64_t)a4 privateBuffer:(const char *)a5 length:(unint64_t)a6;
@end

@implementation OSActivityEventMessage

- (void)fillEventData:(const char *)a3 length:(unint64_t)a4 privateBuffer:(const char *)a5 length:(unint64_t)a6
{
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  bufferData = self->_bufferData;
  self->_bufferData = v9;

  [MEMORY[0x189603F48] dataWithBytes:a5 length:a6];
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  bufferPrivateData = self->_bufferPrivateData;
  self->_bufferPrivateData = v11;
}

- (NSMutableArray)arguments
{
  return 0LL;
}

- (NSString)format
{
  v9[2] = *MEMORY[0x1895F89C0];
  v8 = 0LL;
  unint64_t v3 = -[OSActivityEvent traceID](self, "traceID") >> 32;
  v9[0] = 0LL;
  v9[1] = 0LL;
  v4 = -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
  [v4 getUUIDBytes:v9];

  int v5 = uuidpath_resolve(0LL, v9, v3, 0LL, &v8, 0LL, 0LL, 0LL);
  v6 = 0LL;
  if (v5)
  {
    [NSString stringWithUTF8String:v8];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end