@interface CUStateEvent
+ (id)enterState;
+ (id)exitState;
+ (id)initialTransition;
- (CUStateEvent)initWithName:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)name;
- (id)description;
- (void)dealloc;
@end

@implementation CUStateEvent

- (CUStateEvent)initWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CUStateEvent;
  v8 = -[CUStateEvent init](&v15, sel_init);
  if (!v8) {
    FatalErrorF("init failed");
  }
  v9 = v8;
  uint64_t v10 = [v6 copy];
  name = v9->_name;
  v9->_name = (NSString *)v10;

  uint64_t v12 = [v7 copy];
  userInfo = v9->_userInfo;
  v9->_userInfo = (NSDictionary *)v12;

  return v9;
}

- (void)dealloc
{
  name = self->_name;
  self->_name = 0LL;

  userInfo = self->_userInfo;
  self->_userInfo = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUStateEvent;
  -[CUStateEvent dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)-[NSString copy](self->_name, "copy");
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

+ (id)enterState
{
  if (enterState_sInit != -1) {
    dispatch_once(&enterState_sInit, &__block_literal_global_7700);
  }
  return (id)enterState_sState;
}

+ (id)exitState
{
  if (exitState_sInit != -1) {
    dispatch_once(&exitState_sInit, &__block_literal_global_31);
  }
  return (id)exitState_sState;
}

+ (id)initialTransition
{
  if (initialTransition_sInit != -1) {
    dispatch_once(&initialTransition_sInit, &__block_literal_global_34);
  }
  return (id)initialTransition_sState;
}

void __33__CUStateEvent_initialTransition__block_invoke()
{
  v0 = -[CUStateEvent initWithName:userInfo:]( objc_alloc(&OBJC_CLASS___CUStateEvent),  "initWithName:userInfo:",  @"initial",  0LL);
  v1 = (void *)initialTransition_sState;
  initialTransition_sState = (uint64_t)v0;
}

void __25__CUStateEvent_exitState__block_invoke()
{
  v0 = -[CUStateEvent initWithName:userInfo:]( objc_alloc(&OBJC_CLASS___CUStateEvent),  "initWithName:userInfo:",  @"exit",  0LL);
  v1 = (void *)exitState_sState;
  exitState_sState = (uint64_t)v0;
}

void __26__CUStateEvent_enterState__block_invoke()
{
  v0 = -[CUStateEvent initWithName:userInfo:]( objc_alloc(&OBJC_CLASS___CUStateEvent),  "initWithName:userInfo:",  @"enter",  0LL);
  v1 = (void *)enterState_sState;
  enterState_sState = (uint64_t)v0;
}

@end