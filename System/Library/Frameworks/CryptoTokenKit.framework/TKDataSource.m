@interface TKDataSource
- (BOOL)bytesSafeToRead:(int64_t)a3;
- (NSData)data;
- (TKDataSource)initWithData:(id)a3;
- (const)end;
- (const)ptr;
- (id)dataFromPtr:(const char *)a3;
- (id)fetchDataWithLength:(int64_t)a3;
- (unsigned)fetchByte;
@end

@implementation TKDataSource

- (TKDataSource)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKDataSource;
  v6 = -[TKDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_ptr = (const char *)[v5 bytes];
  }

  return v7;
}

- (const)end
{
  v3 = -[NSData bytes](self->_data, "bytes");
  return &v3[-[NSData length](self->_data, "length")];
}

- (BOOL)bytesSafeToRead:(int64_t)a3
{
  v3 = &self->_ptr[a3];
  return v3 <= -[TKDataSource end](self, "end");
}

- (unsigned)fetchByte
{
  ptr = self->_ptr;
  self->_ptr = ptr + 1;
  return *ptr;
}

- (id)fetchDataWithLength:(int64_t)a3
{
  if (-[TKDataSource bytesSafeToRead:](self, "bytesSafeToRead:"))
  {
    [MEMORY[0x189603F48] dataWithBytes:self->_ptr length:a3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ptr += a3;
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_msgSend( MEMORY[0x189603F48],  "dataWithBytes:length:",  -[NSData bytes](self->_data, "bytes"),  &self->_ptr[-(uint64_t)-[NSData bytes](self->_data, "bytes")]);
}

- (id)dataFromPtr:(const char *)a3
{
  if (-[NSData bytes](self->_data, "bytes") > a3 || self->_ptr < a3) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"Invalid argument ptr"];
  }
  return -[NSData subdataWithRange:]( self->_data,  "subdataWithRange:",  &a3[-(uint64_t)-[NSData bytes](self->_data, "bytes")],  self->_ptr - a3);
}

- (const)ptr
{
  return self->_ptr;
}

- (void).cxx_destruct
{
}

@end