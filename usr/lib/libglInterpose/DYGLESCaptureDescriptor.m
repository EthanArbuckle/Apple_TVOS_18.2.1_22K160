@interface DYGLESCaptureDescriptor
- (BOOL)queryDriverEventsOnGraphicsCommands;
- (DYGLESCaptureDescriptor)init;
- (void)setQueryDriverEventsOnGraphicsCommands:(BOOL)a3;
@end

@implementation DYGLESCaptureDescriptor

- (DYGLESCaptureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYGLESCaptureDescriptor;
  return -[DYGLESCaptureDescriptor initWithAPI:](&v3, "initWithAPI:", 0LL);
}

- (BOOL)queryDriverEventsOnGraphicsCommands
{
  return self->_queryDriverEventsOnGraphicsCommands;
}

- (void)setQueryDriverEventsOnGraphicsCommands:(BOOL)a3
{
  self->_queryDriverEventsOnGraphicsCommands = a3;
}

@end