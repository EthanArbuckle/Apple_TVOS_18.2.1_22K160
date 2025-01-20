@interface _NSJSONWriter
- (BOOL)appendString:(id)a3 range:(_NSRange)a4;
- (NSError)failure;
- (_NSJSONWriter)init;
- (id)dataWithRootObject:(id)a3 options:(unint64_t)a4;
- (int64_t)writeRootObject:(id)a3 toStream:(id)a4 options:(unint64_t)a5;
- (void)dealloc;
- (void)resizeTemporaryBuffer:(void *)result;
- (void)setFailure:(id)a3;
@end

@implementation _NSJSONWriter

- (_NSJSONWriter)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSJSONWriter;
  result = -[_NSJSONWriter init](&v3, sel_init);
  if (result)
  {
    result->tempBuffer = 0LL;
    result->tempBufferLen = 0LL;
    result->totalDataWritten = 0LL;
  }

  return result;
}

- (id)dataWithRootObject:(id)a3 options:(unint64_t)a4
{
  self->dataBuffer = (char *)malloc(0x1000uLL);
  *(_OWORD *)&self->dataBufferLen = xmmword_183991520;
  self->freeDataBuffer = 1;
  self->kind = 1;
  self->freeDataBuffer = 0;
  return (id)[MEMORY[0x189603F48] dataWithBytesNoCopy:self->dataBuffer length:self->dataLen freeWhenDone:1];
}

- (void)resizeTemporaryBuffer:(void *)result
{
  if (result)
  {
    v2 = result;
    unint64_t v3 = result[8];
    BOOL v4 = v3 >= a2;
    unint64_t v5 = v3 >> 13;
    if (!v4 && v5 == 0)
    {
      unint64_t v7 = 0x2000LL;
      if (a2 < 0x2000) {
        unint64_t v7 = a2;
      }
      if (v7 <= 0x100) {
        size_t v8 = 256LL;
      }
      else {
        size_t v8 = v7;
      }
      v9 = (void *)result[7];
      if (v9) {
        free(v9);
      }
      result = malloc(v8);
      v2[7] = result;
      v2[8] = v8;
    }
  }

  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];

  tempBuffer = self->tempBuffer;
  if (tempBuffer) {
    free(tempBuffer);
  }
  dataBuffer = self->dataBuffer;
  if (dataBuffer && self->freeDataBuffer) {
    free(dataBuffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSJSONWriter;
  -[_NSJSONWriter dealloc](&v5, sel_dealloc);
}

- (int64_t)writeRootObject:(id)a3 toStream:(id)a4 options:(unint64_t)a5
{
  self->outputStream = (NSOutputStream *)a4;
  self->kind = 2;
  self->dataBuffer = (char *)malloc(0x100uLL);
  self->dataBufferLen = 256LL;
  self->freeDataBuffer = 1;
  else {
    return -1LL;
  }
}

- (BOOL)appendString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[_NSJSONWriter resizeTemporaryBuffer:](self, a4.length);
  objc_msgSend( a3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  self->tempBuffer,  self->tempBufferLen,  &__n,  4,  0,  location,  length,  &v14);
  int appended = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v8);
  if (appended)
  {
    uint64_t v10 = v15;
    if (v15)
    {
      do
      {
        objc_msgSend( a3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  self->tempBuffer,  self->tempBufferLen,  &__n,  4,  0,  v14,  v10,  &v14);
        LOBYTE(appended) = _appendBytes(self->tempBuffer, __n, (uint64_t)self, v11);
        uint64_t v10 = v15;
      }

      while (v15 && (appended & 1) != 0);
    }

    else
    {
      LOBYTE(appended) = 1;
    }
  }

  return appended;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setFailure:(id)a3
{
}

@end