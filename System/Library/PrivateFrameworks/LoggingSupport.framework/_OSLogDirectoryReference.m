@interface _OSLogDirectoryReference
- (_OSLogDirectoryReference)initWithDescriptor:(int)a3;
- (_OSLogDirectoryReference)initWithDescriptor:(int)a3 sandboxExtensionToken:(const char *)a4;
- (int)fileDescriptor;
- (void)close;
- (void)dealloc;
@end

@implementation _OSLogDirectoryReference

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3
{
  return -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( self,  "initWithDescriptor:sandboxExtensionToken:",  *(void *)&a3,  0LL);
}

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3 sandboxExtensionToken:(const char *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____OSLogDirectoryReference;
  v6 = -[_OSLogDirectoryReference init](&v8, sel_init);
  if (v6)
  {
    v6->_fd = dup(a3);
    v6->_etk = -1LL;
    if (a4) {
      v6->_etk = sandbox_extension_consume();
    }
  }

  return v6;
}

- (void)close
{
  int fd = self->_fd;
  if (fd < 0 || close(fd) != -1) {
    goto LABEL_3;
  }
  int v4 = *__error();
  uint64_t v5 = *__error();
  if (v4 != 9)
  {
    _os_assumes_log();
LABEL_3:
    self->_int fd = -1;
    return;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v5;
  __break(1u);
}

- (void)dealloc
{
  uint64_t fd = self->_fd;
  if ((_DWORD)fd == -1)
  {
    if (self->_etk != -1)
    {
      sandbox_extension_release();
      self->_etk = -1LL;
    }

    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS____OSLogDirectoryReference;
    -[_OSLogDirectoryReference dealloc](&v4, sel_dealloc);
  }

  else
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _OSLogDirectoryReference released before close";
    qword_18C695DD0 = fd;
    __break(1u);
  }

- (int)fileDescriptor
{
  return self->_fd;
}

@end