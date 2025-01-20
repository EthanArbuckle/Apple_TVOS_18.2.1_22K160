@interface SUCoreStartup
+ (id)initializeSharedStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5;
- (id)_initAtStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5;
@end

@implementation SUCoreStartup

+ (id)initializeSharedStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke;
  block[3] = &unk_189FEA298;
  id v16 = v8;
  int64_t v17 = a3;
  id v15 = v7;
  uint64_t v9 = initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce;
  id v10 = v8;
  id v11 = v7;
  if (v9 != -1) {
    dispatch_once(&initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce, block);
  }
  id v12 = (id)initializeSharedStartup_usingDomain_usingFilesystemDir__startup;

  return v12;
}

void __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke(void *a1)
{
  id v1 = -[SUCoreStartup _initAtStartup:usingDomain:usingFilesystemDir:]( objc_alloc(&OBJC_CLASS___SUCoreStartup),  "_initAtStartup:usingDomain:usingFilesystemDir:",  a1[6],  a1[4],  a1[5]);
  v2 = (void *)initializeSharedStartup_usingDomain_usingFilesystemDir__startup;
  initializeSharedStartup_usingDomain_usingFilesystemDir__startup = (uint64_t)v1;
}

- (id)_initAtStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCoreStartup;
  id v10 = -[SUCoreStartup init](&v17, sel_init);
  if (!v10) {
    goto LABEL_7;
  }
  if ((v6 & 1) != 0)
  {
    v13 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    v14 = v13;
    if (v8) {
      [v13 useDomain:v8];
    }
    if (v9) {
      [v14 useFilesystemBaseDir:v9];
    }

    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_14:
      id v16 = +[SUCoreEventReporter sharedReporter](&OBJC_CLASS___SUCoreEventReporter, "sharedReporter");
      if ((v6 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }

  id v15 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  if ((v6 & 4) != 0) {
    goto LABEL_14;
  }
LABEL_5:
  if ((v6 & 8) != 0) {
LABEL_6:
  }
    id v11 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
LABEL_7:

  return v10;
}

@end