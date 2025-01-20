@interface ContextAwareObject
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (id)initCTXBase;
- (int)ctxType;
- (int)getContextState;
@end

@implementation ContextAwareObject

- (id)initCTXBase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ContextAwareObject;
  id result = -[ContextAwareObject init](&v3, "init");
  if (result) {
    *((_BYTE *)result + 8) = 0;
  }
  return result;
}

- (int)getContextState
{
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_100038998(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return -1;
}

- (BOOL)isContextTriggered
{
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_1000389C8(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 0;
}

- (BOOL)synchContext
{
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_1000389F8(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 0;
}

- (int)ctxType
{
  return self->ctxType;
}

@end