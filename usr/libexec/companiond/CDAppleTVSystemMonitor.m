@interface CDAppleTVSystemMonitor
+ (CDAppleTVSystemMonitor)sharedInstance;
- (id)_init;
- (int64_t)attentionState;
@end

@implementation CDAppleTVSystemMonitor

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CDAppleTVSystemMonitor;
  v2 = -[CDAppleTVSystemMonitor init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_attentionState = 3;
    objc_initWeak(&location, v2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000513C;
    v5[3] = &unk_1000307F8;
    objc_copyWeak(&v6, &location);
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  1LL,  1LL,  v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

  return v3;
}

+ (CDAppleTVSystemMonitor)sharedInstance
{
  if (qword_10003BF38 != -1) {
    dispatch_once(&qword_10003BF38, &stru_100030838);
  }
  return (CDAppleTVSystemMonitor *)(id)qword_10003BF30;
}

- (int64_t)attentionState
{
  return atomic_load(&self->_attentionState);
}

@end