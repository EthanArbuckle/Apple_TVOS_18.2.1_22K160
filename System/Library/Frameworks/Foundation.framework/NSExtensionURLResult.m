@interface NSExtensionURLResult
- (BOOL)wait:(double)a3;
- (NSExtensionURLResult)init;
- (NSURL)url;
- (id)copiedURL;
- (void)dealloc;
- (void)setURL:(id)a3;
- (void)signal;
@end

@implementation NSExtensionURLResult

- (NSExtensionURLResult)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSExtensionURLResult;
  v2 = -[NSExtensionURLResult init](&v4, sel_init);
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_url = 0LL;
  v2->_sema = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  return v2;
}

- (void)setURL:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_url == a3)
  {
    url = 0LL;
  }

  else
  {
    url = self->_url;
    self->_url = (NSURL *)[a3 copy];
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)copiedURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)-[NSURL copy](self->_url, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)url
{
  return (NSURL *)-[NSExtensionURLResult copiedURL](self, "copiedURL");
}

- (void)signal
{
}

- (BOOL)wait:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, v4) != 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  dispatch_release((dispatch_object_t)self->_sema);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtensionURLResult;
  -[NSExtensionURLResult dealloc](&v3, sel_dealloc);
}

@end