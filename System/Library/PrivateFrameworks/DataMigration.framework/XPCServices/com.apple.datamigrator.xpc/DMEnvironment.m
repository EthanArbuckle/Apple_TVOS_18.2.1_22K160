@interface DMEnvironment
- (BOOL)inAppleStore;
- (BOOL)isFromFactory;
- (BOOL)isProgressHostReady;
- (id)_cwfInterface;
- (id)userManager;
- (int)sem_createOwnerReadableWithName:(const char *)a3 value:(int)a4 errorString:(id *)a5;
- (int)sem_openWithName:(const char *)a3 errorString:(id *)a4;
- (void)sem_close:(int *)a3;
- (void)setProgressHostIsReady;
@end

@implementation DMEnvironment

- (id)userManager
{
  return +[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager");
}

- (id)_cwfInterface
{
  return objc_alloc_init(&OBJC_CLASS___CWFInterface);
}

- (BOOL)inAppleStore
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMEnvironment _cwfInterface](self, "_cwfInterface"));
  [v4 activate];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  unsigned __int8 v6 = [v5 isEqualToString:@"Apple Store"];

  [v4 invalidate];
  return v6;
}

- (BOOL)isFromFactory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  return v3;
}

- (int)sem_openWithName:(const char *)a3 errorString:(id *)a4
{
  v5 = sem_open(a3, 0);
  unsigned __int8 v6 = v5;
  if (a4 && v5 == (sem_t *)-1LL)
  {
    v7 = __error();
    v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", strerror(*v7));
    *a4 = (id)objc_claimAutoreleasedReturnValue(v8);
  }

  return v6;
}

- (int)sem_createOwnerReadableWithName:(const char *)a3 value:(int)a4 errorString:(id *)a5
{
  unsigned __int8 v6 = sem_open(a3, 512, 256LL, a4);
  v7 = v6;
  if (a5 && v6 == (sem_t *)-1LL)
  {
    v8 = __error();
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", strerror(*v8));
    *a5 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v7;
}

- (void)sem_close:(int *)a3
{
}

- (BOOL)isProgressHostReady
{
  id v7 = 0LL;
  v4 = -[DMEnvironment sem_openWithName:errorString:]( self,  "sem_openWithName:errorString:",  "datamigrator.progressHost",  &v7);
  id v5 = v7;
  else {
    -[DMEnvironment sem_close:](self, "sem_close:", v4);
  }

  return v4 != (int *)-1LL;
}

- (void)setProgressHostIsReady
{
  id v6 = 0LL;
  v4 = -[DMEnvironment sem_createOwnerReadableWithName:value:errorString:]( self,  "sem_createOwnerReadableWithName:value:errorString:",  "datamigrator.progressHost",  0LL,  &v6);
  id v5 = v6;
  else {
    -[DMEnvironment sem_close:](self, "sem_close:", v4);
  }
}

@end