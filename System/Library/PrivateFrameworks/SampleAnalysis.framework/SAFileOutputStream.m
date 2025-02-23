@interface SAFileOutputStream
- (BOOL)hasSpaceAvailable;
- (int)appendData:(id)a3;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)initWithFileStream:(void *)result;
@end

@implementation SAFileOutputStream

- (void)initWithFileStream:(void *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)&OBJC_CLASS___SAFileOutputStream;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[17] = a2;
    }
  }

  return result;
}

- (int)appendData:(id)a3
{
  id v4 = a3;
  else {
    int v5 = 0;
  }

  return v5;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  if (fwrite(a3, a4, 1uLL, self->_outputFileStream) == 1) {
    return a4;
  }
  else {
    return -1LL;
  }
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

@end