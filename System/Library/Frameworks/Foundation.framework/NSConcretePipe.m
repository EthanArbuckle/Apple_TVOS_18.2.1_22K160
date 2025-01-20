@interface NSConcretePipe
- (NSConcretePipe)init;
- (id)fileHandleForReading;
- (id)fileHandleForWriting;
- (void)_closeOnDealloc;
- (void)dealloc;
@end

@implementation NSConcretePipe

- (id)fileHandleForReading
{
  return self->_readHandle;
}

- (id)fileHandleForWriting
{
  return self->_writeHandle;
}

- (NSConcretePipe)init
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSConcretePipe;
  v2 = -[NSPipe init](&v12, sel_init);
  if (v2)
  {
    if (pipe(v13) < 0)
    {
      v11 = v2;
      v7 = (objc_super *)&v11;
      goto LABEL_8;
    }

    id v3 = objc_allocWithZone((Class)&OBJC_CLASS___NSConcreteFileHandle);
    uint64_t v4 = [v3 initWithFileDescriptor:v13[0] closeOnDealloc:1];
    v2->_readHandle = (NSFileHandle *)v4;
    if (!v4)
    {
      close(v13[0]);
      close(v13[1]);
      v10.receiver = v2;
      v7 = &v10;
      goto LABEL_8;
    }

    id v5 = objc_allocWithZone((Class)&OBJC_CLASS___NSConcreteFileHandle);
    uint64_t v6 = [v5 initWithFileDescriptor:v13[1] closeOnDealloc:1];
    v2->_writeHandle = (NSFileHandle *)v6;
    if (!v6)
    {

      close(v13[1]);
      v9 = v2;
      v7 = (objc_super *)&v9;
LABEL_8:
      v7->super_class = (Class)&OBJC_CLASS___NSConcretePipe;
      -[objc_super dealloc](v7, sel_dealloc, v9);
      return 0LL;
    }
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcretePipe;
  -[NSConcretePipe dealloc](&v3, sel_dealloc);
}

- (void)_closeOnDealloc
{
}

@end