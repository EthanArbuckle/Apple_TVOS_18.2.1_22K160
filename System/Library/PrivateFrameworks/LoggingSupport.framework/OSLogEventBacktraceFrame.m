@interface OSLogEventBacktraceFrame
- (NSUUID)imageUUID;
- (OSLogEventBacktraceFrame)initWithUUIDBytes:(const char *)a3 andOffset:(unint64_t)a4;
- (const)imageUUIDBytes;
- (unint64_t)imageOffset;
- (void)dealloc;
@end

@implementation OSLogEventBacktraceFrame

- (OSLogEventBacktraceFrame)initWithUUIDBytes:(const char *)a3 andOffset:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OSLogEventBacktraceFrame;
  result = -[OSLogEventBacktraceFrame init](&v7, sel_init);
  if (result)
  {
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
    result->_imageOffset = a4;
  }

  return result;
}

- (NSUUID)imageUUID
{
  result = self->_imageUUID;
  if (!result)
  {
    result = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:self->_uuid];
    self->_imageUUID = result;
  }

  return result;
}

- (const)imageUUIDBytes
{
  return (const char *)self->_uuid;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogEventBacktraceFrame;
  -[OSLogEventBacktraceFrame dealloc](&v3, sel_dealloc);
}

- (unint64_t)imageOffset
{
  return self->_imageOffset;
}

@end