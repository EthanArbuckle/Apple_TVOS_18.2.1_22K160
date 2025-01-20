@interface PQLNameInjectionBase
- (PQLNameInjectionBase)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (PQLNameInjectionBase)initWithData:(id)a3;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation PQLNameInjectionBase

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PQLNameInjectionBase;
  -[PQLNameInjectionBase dealloc](&v3, sel_dealloc);
}

- (PQLNameInjectionBase)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PQLNameInjectionBase;
  v6 = -[PQLNameInjectionBase init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_length = a4;
    v8 = (char *)malloc(a4 + 1);
    v7->_bytes = v8;
    if (!v8) {
      abort();
    }
    v9 = v8;
    memcpy(v8, a3, a4);
    v9[a4] = 0;
  }

  return v7;
}

- (PQLNameInjectionBase)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return -[PQLNameInjectionBase initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

@end