@interface ADEventListener
- (ADEventListener)initWithQueue:(id)a3;
- (void)dealloc;
@end

@implementation ADEventListener

- (ADEventListener)initWithQueue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADEventListener;
  v3 = -[ADEventListener init](&v5, "init", a3);
  if (v3) {
    v3->_appStateChangeEventListener = objc_alloc_init(&OBJC_CLASS___ADApplicationStateChangeEventListener);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADEventListener;
  -[ADEventListener dealloc](&v3, "dealloc");
}

@end