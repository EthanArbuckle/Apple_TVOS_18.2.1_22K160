@interface MRAppDelegate
- (BOOL)shouldCreateViewController;
- (void)_closeInterposeDylib;
- (void)dealloc;
- (void)startupAndCreateViewController:(BOOL)a3;
@end

@implementation MRAppDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAppDelegate;
  -[MRAppDelegate dealloc](&v3, "dealloc");
}

- (void)_closeInterposeDylib
{
  interposeDylib = self->_interposeDylib;
  if (interposeDylib)
  {
    dlclose(interposeDylib);
    self->_interposeDylib = 0LL;
  }

- (void)startupAndCreateViewController:(BOOL)a3
{
  self->_shouldCreateViewController = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v4 environment]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"METAL_LOAD_INTERPOSER"]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (const char *)DYGetMTLInterposeDylibPath();
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"GT_HOST_URL_MTL"]);
    v9 = "DYGetMTLGuestAppClient";
  }

  else
  {
    v7 = (const char *)DYGetGLInterposeDylibPath();
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"GT_HOST_URL_GL"]);
    v9 = "DYGetGLGuestAppClient";
  }

  v10 = (void *)v8;
  if (self->_interposeDylib || (v11 = dlopen(v7, 9), (self->_interposeDylib = v11) != 0LL))
  {
    if (v10)
    {
      v12 = (uint64_t (*)(void))dlsym((void *)0xFFFFFFFFFFFFFFFELL, v9);
      if (!v12) {
        __assert_rtn( "-[MRAppDelegate startupAndCreateViewController:]",  (const char *)&unk_1000055D9,  0,  "GetGuestClient != NULL");
      }
      uint64_t v13 = v12();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!v14) {
        __assert_rtn( "-[MRAppDelegate startupAndCreateViewController:]",  (const char *)&unk_1000055D9,  0,  "appClient != nil");
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRReplayController sharedController](&OBJC_CLASS___MRReplayController, "sharedController"));
      if ([v15 initializeTransportWith:v14])
      {
        [v15 setDelegate:self];
        if ([v15 informReady])
        {

          return;
        }

        dy_abort("inform ready failed");
      }

      else
      {
        dy_abort("transport could not be initialized");
      }
    }

    else
    {
      dy_abort("no transport url is provided");
    }
  }

  else
  {
    v16 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v16);
  }

  __break(1u);
}

- (BOOL)shouldCreateViewController
{
  return self->_shouldCreateViewController;
}

@end