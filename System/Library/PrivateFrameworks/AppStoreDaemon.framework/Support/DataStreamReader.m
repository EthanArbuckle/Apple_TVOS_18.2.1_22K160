@interface DataStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
@end

@implementation DataStreamReader

- (BOOL)hasBytesAvailable
{
  unint64_t cursor = self->_cursor;
  return cursor < -[NSData length](self->_data, "length");
}

- (void)close
{
  data = self->_data;
  self->_data = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DataStreamReader;
  -[Stream close](&v4, "close");
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t v5 = a4;
  NSUInteger v8 = -[NSData length](self->_data, "length", a3, a4, a5);
  unint64_t cursor = (void *)self->_cursor;
  if (v5 >= 1)
  {
    -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_cursor, v5);
    unint64_t cursor = (void *)(self->_cursor + v5);
    self->_unint64_t cursor = (unint64_t)cursor;
  }

  if (cursor == (void *)-[NSData length](self->_data, "length"))
  {
    sub_100237C1C((uint64_t)self, 5LL);
    dispatch_source_merge_data((dispatch_source_t)self->super._delegateSource, 0x10uLL);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end