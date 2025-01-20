@interface TransparencyGPBFileDescriptor
- (BOOL)isEqual:(id)a3;
- (NSString)objcPrefix;
- (NSString)package;
- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5;
- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4;
- (unint64_t)hash;
- (unsigned)syntax;
- (void)dealloc;
@end

@implementation TransparencyGPBFileDescriptor

- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TransparencyGPBFileDescriptor;
  v8 = -[TransparencyGPBFileDescriptor init](&v10, "init");
  if (v8)
  {
    v8->package_ = (NSString *)[a3 copy];
    v8->objcPrefix_ = (NSString *)[a4 copy];
    v8->syntax_ = a5;
  }

  return v8;
}

- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyGPBFileDescriptor;
  v6 = -[TransparencyGPBFileDescriptor init](&v8, "init");
  if (v6)
  {
    v6->package_ = (NSString *)[a3 copy];
    v6->syntax_ = a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBFileDescriptor;
  -[TransparencyGPBFileDescriptor dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_9;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBFileDescriptor, a2);
  unsigned int v6 = -[NSString isEqual:](self->package_, "isEqual:", *((void *)a3 + 1));
  if (v6)
  {
    objcPrefix = self->objcPrefix_;
    objc_super v8 = (NSString *)*((void *)a3 + 2);
    if (objcPrefix != v8)
    {
      if (v8)
      {
        LOBYTE(v6) = -[NSString isEqual:](objcPrefix, "isEqual:");
        return v6;
      }

- (unint64_t)hash
{
  return -[NSString hash](self->package_, "hash");
}

- (NSString)package
{
  return self->package_;
}

- (NSString)objcPrefix
{
  return self->objcPrefix_;
}

- (unsigned)syntax
{
  return self->syntax_;
}

@end