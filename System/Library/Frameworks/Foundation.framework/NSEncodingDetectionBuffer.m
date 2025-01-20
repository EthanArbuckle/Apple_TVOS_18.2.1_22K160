@interface NSEncodingDetectionBuffer
- (BOOL)_growBufferIfNeededToAccomodateByteCount:(unint64_t)a3;
- (NSEncodingDetectionBuffer)initWithNSStringEncoding:(unint64_t)a3 CFStringEncoding:(unsigned int)a4 stackBuffer:(char *)a5 bufferLength:(unint64_t)a6 placeholder:(id)a7;
- (id)stringWithLossySubsitutionString:(id)a3;
- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4;
- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5;
- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5 byte4:(unsigned __int8)a6;
- (void)appendByte:(unsigned __int8)a3;
- (void)appendBytes:(const char *)a3 count:(unint64_t)a4;
- (void)appendPlaceholder;
- (void)appendUTF16Char:(unsigned __int16)a3;
- (void)appendUTF32Char:(unsigned int)a3;
- (void)dealloc;
@end

@implementation NSEncodingDetectionBuffer

- (NSEncodingDetectionBuffer)initWithNSStringEncoding:(unint64_t)a3 CFStringEncoding:(unsigned int)a4 stackBuffer:(char *)a5 bufferLength:(unint64_t)a6 placeholder:(id)a7
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSEncodingDetectionBuffer;
  v12 = -[NSEncodingDetectionBuffer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_nsEncoding = a3;
    v12->_cfEncoding = a4;
    if (a5)
    {
      v12->_bytes = a5;
      v12->_bytesAllocated = 0;
    }

    else
    {
      if (a6) {
        size_t v14 = a6;
      }
      else {
        size_t v14 = 64LL;
      }
      a6 = malloc_good_size(v14);
      v15 = (char *)malloc(a6);
      v13->_bytes = v15;
      v13->_bytesAllocated = 1;
      if (!v15)
      {

        return 0LL;
      }
    }

    v13->_bytesIndex = 0LL;
    v13->_bytesLength = a6;
    v13->_placeholder = (NSEncodingDetectionPlaceholder *)a7;
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  self->_placeholder = 0LL;
  if (self->_bytesAllocated)
  {
    bytes = self->_bytes;
    if (bytes)
    {
      free(bytes);
      self->_bytes = 0LL;
      self->_bytesIndex = 0LL;
      self->_bytesLength = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSEncodingDetectionBuffer;
  -[NSEncodingDetectionBuffer dealloc](&v4, sel_dealloc);
}

- (BOOL)_growBufferIfNeededToAccomodateByteCount:(unint64_t)a3
{
  if (!a3)
  {
    LOBYTE(v5) = 1;
    return (char)v5;
  }

  unint64_t bytesLength = self->_bytesLength;
  if (self->_bytesIndex + a3 < bytesLength) {
    goto LABEL_3;
  }
  size_t v6 = malloc_good_size(2 * bytesLength);
  if (v6 <= bytesLength)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }

  unint64_t v7 = v6;
  uint64_t v5 = (char *)malloc(v6);
  if (v5)
  {
    v8 = v5;
    BOOL bytesAllocated = self->_bytesAllocated;
    bytes = self->_bytes;
    memcpy(v5, bytes, self->_bytesIndex);
    self->_unint64_t bytesLength = v7;
    self->_bytes = v8;
    LOBYTE(v5) = 1;
    self->_BOOL bytesAllocated = 1;
    if (bytesAllocated)
    {
      free(bytes);
LABEL_3:
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (void)appendByte:(unsigned __int8)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  1LL))
  {
    self->_bytes[self->_bytesIndex++] = a3;
  }

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  2LL))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytesIndex += 2LL;
  }

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  3LL))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytes[self->_bytesIndex + 2] = a5;
    self->_bytesIndex += 3LL;
  }

- (void)appendUTF16Char:(unsigned __int16)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  2LL))
  {
    *(_WORD *)&self->_bytes[self->_bytesIndex] = a3;
    self->_bytesIndex += 2LL;
  }

- (void)appendUTF32Char:(unsigned int)a3
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  4LL))
  {
    *(_DWORD *)&self->_bytes[self->_bytesIndex] = a3;
    self->_bytesIndex += 4LL;
  }

- (void)appendByte1:(unsigned __int8)a3 byte2:(unsigned __int8)a4 byte3:(unsigned __int8)a5 byte4:(unsigned __int8)a6
{
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  4LL))
  {
    self->_bytes[self->_bytesIndex] = a3;
    self->_bytes[self->_bytesIndex + 1] = a4;
    self->_bytes[self->_bytesIndex + 2] = a5;
    self->_bytes[self->_bytesIndex + 3] = a6;
    self->_bytesIndex += 4LL;
  }

- (void)appendPlaceholder
{
  placeholder = self->_placeholder;
  if (placeholder)
  {
    size_t v4 = -[NSEncodingDetectionPlaceholder bytesLength](placeholder, "bytesLength");
    if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  v4))
    {
      memcpy(&self->_bytes[self->_bytesIndex], -[NSEncodingDetectionPlaceholder bytes](self->_placeholder, "bytes"), v4);
      self->_bytesIndex += v4;
    }
  }

- (void)appendBytes:(const char *)a3 count:(unint64_t)a4
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSEncodingDetectionBuffer.m",  151LL,  @"Invalid parameter not satisfying: %@",  @"fromBytes != nil");
  }
  if (-[NSEncodingDetectionBuffer _growBufferIfNeededToAccomodateByteCount:]( self,  "_growBufferIfNeededToAccomodateByteCount:",  a4))
  {
    memcpy(&self->_bytes[self->_bytesIndex], a3, a4);
    self->_bytesIndex += a4;
  }

- (id)stringWithLossySubsitutionString:(id)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithBytes:self->_bytes length:self->_bytesIndex];
  size_t v6 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v5,  self->_nsEncoding);

  if (a3 && v6)
  {
    unint64_t v7 =  -[NSString stringByReplacingOccurrencesOfString:withString:]( v6,  "stringByReplacingOccurrencesOfString:withString:",  -[NSEncodingDetectionPlaceholder string](self->_placeholder, "string"),  a3);

    size_t v6 = v7;
  }

  return v6;
}

@end