@interface CoreUtilsNSSubrangeData
- (BOOL)_isCompact;
- (CoreUtilsNSSubrangeData)init;
- (CoreUtilsNSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation CoreUtilsNSSubrangeData

- (CoreUtilsNSSubrangeData)init
{
  return 0LL;
}

- (CoreUtilsNSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    self->_range.NSUInteger location = *((void *)v7 + 2) + location;
    self->_range.NSUInteger length = length;
    v10 = (NSData *)*((id *)v7 + 1);
    v11 = (NSData *)v7;
    data = self->_data;
    self->_data = v10;
  }

  else
  {
    self->_range.NSUInteger location = location;
    self->_range.NSUInteger length = length;
    v13 = (NSData *)v7;
    v11 = self->_data;
    self->_data = v13;
  }

  if (self->_data) {
    v14 = self;
  }
  else {
    v14 = 0LL;
  }

  return v14;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CoreUtilsNSSubrangeData;
  -[CoreUtilsNSSubrangeData dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;

  return v4;
}

- (const)bytes
{
  return -[NSData bytes](self->_data, "bytes") + self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (void)getBytes:(void *)a3
{
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  if (self->_range.length >= a4) {
    unint64_t length = a4;
  }
  else {
    unint64_t length = self->_range.length;
  }
  -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_range.location, length);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    v8 = -[NSData bytes](self->_data, "bytes");
    if (v8) {
      memmove(a3, &v8[self->_range.location + location], length);
    }
  }

- (BOOL)_isCompact
{
  return -[NSData _isCompact](self->_data, "_isCompact");
}

- (void).cxx_destruct
{
}

@end