@interface UMDRotatingLog
- (void)dealloc;
@end

@implementation UMDRotatingLog

- (void)dealloc
{
  if (self->_fd != -1)
  {
    uint64_t v3 = sub_100019434((uint64_t)self->_se);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    [v4 closeFileWithDescriptor:self->_fd];

    close(self->_fd);
    self->_fd = -1;
  }

  queue = self->_queue;
  self->_queue = 0LL;

  se = self->_se;
  self->_se = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UMDRotatingLog;
  -[UMDRotatingLog dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
}

@end