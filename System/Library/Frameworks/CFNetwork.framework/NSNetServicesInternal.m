@interface NSNetServicesInternal
- (uint64_t)setListener:(uint64_t)result;
- (void)dealloc;
- (void)setScheduledRunLoop:(const void *)a3 andMode:;
@end

@implementation NSNetServicesInternal

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (self->_listener)
  {
    tcp_listener_cancel();
    tcp_listener_release();
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  monitors = self->_monitors;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( monitors,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(monitors);
        }
        CFNetServiceMonitorInvalidate(*(CFNetServiceMonitorRef *)(*((void *)&v11 + 1) + 8 * i));
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( monitors,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  scheduledRunLoop = self->_scheduledRunLoop;
  if (scheduledRunLoop) {
    CFRelease(scheduledRunLoop);
  }
  scheduledMode = self->_scheduledMode;
  if (scheduledMode) {
    CFRelease(scheduledMode);
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSNetServicesInternal;
  -[NSNetServicesInternal dealloc](&v10, sel_dealloc);
}

- (void)setScheduledRunLoop:(const void *)a3 andMode:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_sync_enter(result);
    uint64_t v6 = (const void *)v5[3];
    if (v6)
    {
      CFRelease(v6);
      v5[3] = 0LL;
    }

    v7 = (const void *)v5[4];
    if (v7)
    {
      CFRelease(v7);
      v5[4] = 0LL;
    }

    if (a3)
    {
      v5[3] = CFRetain(a2);
      v5[4] = CFRetain(a3);
    }

    return (void *)objc_sync_exit(v5);
  }

  return result;
}

- (uint64_t)setListener:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = *(void *)(result + 16);
    if (result)
    {
      tcp_listener_cancel();
      result = tcp_listener_release();
    }

    *(void *)(v3 + 16) = a2;
    if (a2) {
      return tcp_listener_retain();
    }
  }

  return result;
}

@end