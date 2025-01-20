@interface MISLaunchWarningQueryResult
- (BOOL)isUserOverridden;
- (MISLaunchWarningQueryResult)initWithWarningState:(int64_t)a3 withUserOverridden:(BOOL)a4 withKBURL:(id)a5;
- (NSURL)kbURL;
- (int64_t)warningState;
@end

@implementation MISLaunchWarningQueryResult

- (MISLaunchWarningQueryResult)initWithWarningState:(int64_t)a3 withUserOverridden:(BOOL)a4 withKBURL:(id)a5
{
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MISLaunchWarningQueryResult;
  v10 = -[MISLaunchWarningQueryResult init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->warningState = a3;
    v10->isUserOverridden = a4;
    if (a3)
    {
      p_kbURL = (void **)&v10->kbURL;
      objc_storeStrong((id *)&v10->kbURL, a5);
      if (!v11->kbURL)
      {
        id v13 = objc_alloc(MEMORY[0x189604030]);
        uint64_t v16 = objc_msgSend_initWithString_(v13, v14, (uint64_t)@"https://support.apple.com/116947", v15);
        v17 = *p_kbURL;
        *p_kbURL = (void *)v16;
      }
    }
  }

  return v11;
}

- (int64_t)warningState
{
  return self->warningState;
}

- (BOOL)isUserOverridden
{
  return self->isUserOverridden;
}

- (NSURL)kbURL
{
  return self->kbURL;
}

- (void).cxx_destruct
{
}

@end