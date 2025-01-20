@interface VSSPSiriLifecycleObserver
+ (id)sharedInstance;
- (NSMutableSet)activeTokens;
- (VSSPSiriLifecycleObserver)init;
- (void)beginLifecycle:(id)a3;
- (void)endLifecycle:(id)a3;
- (void)setActiveTokens:(id)a3;
@end

@implementation VSSPSiriLifecycleObserver

+ (id)sharedInstance
{
  if (qword_16F78 != -1) {
    dispatch_once(&qword_16F78, &stru_106A8);
  }
  return (id)qword_16F70;
}

- (VSSPSiriLifecycleObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSPSiriLifecycleObserver;
  v2 = -[VSSPSiriLifecycleObserver init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeTokens = v2->_activeTokens;
    v2->_activeTokens = v3;
  }

  return v2;
}

- (void)beginLifecycle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSSPSiriLifecycleObserver activeTokens](self, "activeTokens"));
  [v5 addObject:v4];
}

- (void)endLifecycle:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPSiriLifecycleObserver activeTokens](self, "activeTokens"));
}

- (NSMutableSet)activeTokens
{
  return self->_activeTokens;
}

- (void)setActiveTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end