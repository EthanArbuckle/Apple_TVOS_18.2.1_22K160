@interface MigratorAlternateAppDelegate
- (MigratorAlternateAppDelegate)init;
- (OS_dispatch_semaphore)sema;
- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4;
- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4;
- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4;
- (void)alternateSystemAppDidLaunch:(id)a3;
- (void)setSema:(id)a3;
- (void)waitUntilPreboardDidFinishUnlock;
@end

@implementation MigratorAlternateAppDelegate

- (MigratorAlternateAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MigratorAlternateAppDelegate;
  v2 = -[MigratorAlternateAppDelegate init](&v6, "init");
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;
  }

  return v2;
}

- (void)waitUntilPreboardDidFinishUnlock
{
  v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MigratorAlternateAppDelegate sema](self, "sema"));
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)alternateSystemAppDidLaunch:(id)a3
{
}

- (void)alternateSystemApp:(id)a3 didExitWithStatus:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  id v9 = a3;
  if ((_DWORD)v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    _DMLogFunc(v4, 3LL);
  }

  else
  {
    if (MKBDeviceUnlockedSinceBoot())
    {
      v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MigratorAlternateAppDelegate sema](self, "sema"));
      dispatch_semaphore_signal(v7);

      goto LABEL_6;
    }

    _DMLogFunc(v4, 3LL);
  }

  objc_msgSend(v9, "activate", v8);
LABEL_6:
}

- (void)alternateSystemApp:(id)a3 didTerminateWithSignal:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  _DMLogFunc(v4, 3LL);

  objc_msgSend(v7, "activate", v6);
}

- (void)alternateSystemApp:(id)a3 didFailToLaunchWithError:(id)a4
{
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

- (void)setSema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end