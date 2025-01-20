@interface ContextAwareThermalManager
+ (id)sharedInstance;
- (BOOL)isContextTriggered:(int)a3;
- (ContextAwareThermalManager)init;
- (id)createNewSolarContext:(BOOL)a3;
- (int)getContextState:(int)a3;
- (void)iterateAndUpdateContexts;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation ContextAwareThermalManager

+ (id)sharedInstance
{
  if (qword_10007C478 != -1) {
    dispatch_once(&qword_10007C478, &stru_1000616E8);
  }
  return (id)qword_10007C480;
}

- (ContextAwareThermalManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ContextAwareThermalManager;
  v2 = -[ContextAwareThermalManager init](&v4, "init");
  if (v2) {
    v2->ctxObjects = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  }
  return v2;
}

- (id)createNewSolarContext:(BOOL)a3
{
  v5 = off_100060520;
  if (!a3) {
    v5 = off_100060480;
  }
  id v6 = objc_alloc_init(*v5);
  if (v6)
  {
    CFArrayAppendValue(self->ctxObjects, v6);
    CFRelease(v6);
  }

  else
  {
    v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A89C(a3, v7);
    }
  }

  return v6;
}

- (int)getContextState:(int)a3
{
  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_10007CB30)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Cannot get ContextValue", v9, 2u);
      }
    }

    return -1;
  }

  else
  {
    CFIndex v5 = 0LL;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if (CFArrayGetCount(self->ctxObjects) <= ++v5) {
        goto LABEL_5;
      }
    }
  }

- (BOOL)isContextTriggered:(int)a3
{
  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_10007CB30)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> No ContextTriggered Match", v9, 2u);
      }
    }

    return 0;
  }

  else
  {
    CFIndex v5 = 0LL;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if (CFArrayGetCount(self->ctxObjects) <= ++v5) {
        goto LABEL_5;
      }
    }
  }

- (void)iterateAndUpdateContexts
{
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v3 = 0LL;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v3++), "synchContext");
    while (CFArrayGetCount(self->ctxObjects) > v3);
  }

- (void)updateSystemPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v5 = 0LL;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v5++), "updateSystemPowerState:", v3);
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v5 = 0LL;
    do
      objc_msgSend((id)CFArrayGetValueAtIndex(self->ctxObjects, v5++), "setInfoOnlySensorsActive:", v3);
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }

@end