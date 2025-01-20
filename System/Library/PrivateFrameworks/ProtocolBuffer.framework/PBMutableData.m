@interface PBMutableData
- (PBMutableData)initWithCapacity:(unint64_t)a3;
- (const)bytes;
- (unint64_t)length;
- (void)_pb_growCapacityBy:(void *)a1;
- (void)dealloc;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation PBMutableData

- (PBMutableData)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBMutableData;
  v4 = -[PBMutableData init](&v6, sel_init);
  -[PBMutableData _pb_growCapacityBy:](v4, a3);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMutableData;
  -[PBMutableData dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->p - self->buffer;
}

- (void)setLength:(unint64_t)a3
{
  buffer = self->buffer;
  objc_super v6 = (char *)(self->end - buffer);
  if (a3 > (unint64_t)v6)
  {
    -[PBMutableData _pb_growCapacityBy:](self, a3 - (void)v6);
    buffer = self->buffer;
  }

  self->p = &buffer[a3];
}

- (const)bytes
{
  return self->buffer;
}

- (void)mutableBytes
{
  return self->buffer;
}

- (void)_pb_growCapacityBy:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 length];
    v5 = (void *)a1[2];
    size_t v6 = a1[3] - (void)v5 + a2;
    v7 = (char *)realloc(v5, v6);
    if (!v7)
    {
      [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:0 userInfo:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 raise];
    }

    a1[2] = v7;
    a1[3] = &v7[v6];
    a1[1] = &v7[v4];
  }

@end