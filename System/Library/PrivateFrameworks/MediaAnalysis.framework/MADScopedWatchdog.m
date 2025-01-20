@interface MADScopedWatchdog
- (MADScopedWatchdog)init;
- (void)dealloc;
- (void)pet;
@end

@implementation MADScopedWatchdog

- (MADScopedWatchdog)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MADScopedWatchdog;
  v2 = -[MADScopedWatchdog init](&v9, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    internalWatchdog = v2->_internalWatchdog;
    v2->_internalWatchdog = (VCPWatchdog *)v3;

    if (qword_1001E65F0 != -1) {
      dispatch_once(&qword_1001E65F0, &stru_1001BCE30);
    }
    v5 = (dispatch_queue_s *)qword_1001E65F8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C06D0;
    block[3] = &unk_1001BC6A0;
    v8 = v2;
    dispatch_sync(v5, block);
  }

  return v2;
}

- (void)dealloc
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0834;
  block[3] = &unk_1001BC6A0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1001E65F8, block);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MADScopedWatchdog;
  -[MADScopedWatchdog dealloc](&v3, "dealloc");
}

- (void)pet
{
}

- (void).cxx_destruct
{
}

@end