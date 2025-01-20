@interface PBMainDisplaySystemGestureRecognizerManager
+ (id)sharedInstance;
- (PBMainDisplaySystemGestureRecognizerManager)init;
- (PBMainDisplaySystemGestureRecognizerManager)initWithDisplayIdentity:(id)a3;
@end

@implementation PBMainDisplaySystemGestureRecognizerManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AC0C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_10046FFE8 != -1) {
    dispatch_once(&qword_10046FFE8, block);
  }
  return (id)qword_10046FFE0;
}

- (PBMainDisplaySystemGestureRecognizerManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainIdentity](&OBJC_CLASS___FBDisplayManager, "mainIdentity"));
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBMainDisplaySystemGestureRecognizerManager;
  v4 = -[PBSystemGestureRecognizerManager initWithDisplayIdentity:](&v6, "initWithDisplayIdentity:", v3);

  return v4;
}

- (PBMainDisplaySystemGestureRecognizerManager)initWithDisplayIdentity:(id)a3
{
  return -[PBMainDisplaySystemGestureRecognizerManager init](self, "init", a3);
}

@end