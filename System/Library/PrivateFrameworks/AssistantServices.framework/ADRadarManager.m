@interface ADRadarManager
+ (id)sharedInstance;
- (id)_init;
- (void)_sharedCreateDraft:(id)a3 withDisplayReason:(id)a4 reproducibility:(int64_t)a5 classification:(int64_t)a6 completionHandler:(id)a7;
- (void)createCrashDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5;
- (void)createDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5;
@end

@implementation ADRadarManager

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADRadarManager;
  return -[ADRadarManager init](&v3, "init");
}

- (void)_sharedCreateDraft:(id)a3 withDisplayReason:(id)a4 reproducibility:(int64_t)a5 classification:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2050000000LL;
  v14 = (void *)qword_100578408;
  uint64_t v43 = qword_100578408;
  if (!qword_100578408)
  {
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472LL;
    v37 = sub_1002D468C;
    v38 = &unk_1004FDB20;
    v39 = &v40;
    sub_1002D468C((uint64_t)&v35);
    v14 = (void *)v41[3];
  }

  v15 = v14;
  _Block_object_dispose(&v40, 8);
  id v16 = objc_alloc_init(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
  [v16 setTitle:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 problemDescription]);
  [v16 setProblemDescription:v18];

  objc_msgSend(v16, "setIsUserInitiated:", objc_msgSend(v11, "isUserInitiated"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceIDs]);
  [v16 setDeviceIDs:v19];

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v11 componentName]);
  if (v20)
  {
    v21 = (void *)v20;
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v11 componentVersion]);
    if (!v22)
    {
LABEL_9:

      goto LABEL_10;
    }

    v23 = (void *)v22;
    id v24 = [v11 componentIdentifier];

    if (v24)
    {
      uint64_t v40 = 0LL;
      v41 = &v40;
      uint64_t v42 = 0x2050000000LL;
      v25 = (void *)qword_100578410;
      uint64_t v43 = qword_100578410;
      if (!qword_100578410)
      {
        v35 = _NSConcreteStackBlock;
        uint64_t v36 = 3221225472LL;
        v37 = sub_1002D4750;
        v38 = &unk_1004FDB20;
        v39 = &v40;
        sub_1002D4750((uint64_t)&v35);
        v25 = (void *)v41[3];
      }

      v26 = v25;
      _Block_object_dispose(&v40, 8);
      id v27 = objc_alloc(v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 componentName]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v11 componentVersion]);
      id v29 = objc_msgSend(v27, "initWithName:version:identifier:", v21, v28, objc_msgSend(v11, "componentIdentifier"));
      [v16 setComponent:v29];

      goto LABEL_9;
    }
  }

- (void)createDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5
{
}

- (void)createCrashDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5
{
}

+ (id)sharedInstance
{
  if (qword_1005783F0 != -1) {
    dispatch_once(&qword_1005783F0, &stru_1004FA850);
  }
  return (id)qword_1005783E8;
}

@end