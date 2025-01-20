@interface TVSSTimeInterval
- (NSMutableDictionary)tokenToTransitionHandler;
- (TVSSTimeInterval)init;
- (double)beginTime;
- (double)duration;
- (double)endTime;
- (id)addStateTransitionHandler:(id)a3;
- (int64_t)state;
- (void)_notifyStateTransitionHandlersOfTransitionFromState:(int64_t)a3;
- (void)beginInterval;
- (void)beginIntervalWithTimeOverride:(double)a3;
- (void)endInterval;
- (void)endIntervalWithTimeOverride:(double)a3;
- (void)removeStateTransitionHandler:(id)a3;
- (void)reset;
- (void)setBeginTime:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTokenToTransitionHandler:(id)a3;
@end

@implementation TVSSTimeInterval

- (TVSSTimeInterval)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSTimeInterval;
  v8 = -[TVSSTimeInterval init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v8->_state = 0LL;
    v8->_beginTime = 0.0;
    v8->_endTime = 0.0;
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    tokenToTransitionHandler = v8->_tokenToTransitionHandler;
    v8->_tokenToTransitionHandler = v2;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    int64_t state = self->_state;
    self->_int64_t state = a3;
    -[TVSSTimeInterval _notifyStateTransitionHandlersOfTransitionFromState:]( self,  "_notifyStateTransitionHandlersOfTransitionFromState:",  state);
  }

- (double)beginTime
{
  int64_t v3 = -[TVSSTimeInterval state](self, "state");
  if (!v3) {
    return 0.0;
  }
  return v5;
}

- (double)endTime
{
  int64_t v3 = -[TVSSTimeInterval state](self, "state");
  switch(v3)
  {
    case 0LL:
      return 0.0;
    case 1LL:
      return CFAbsoluteTimeGetCurrent();
    case 2LL:
      return self->_endTime;
  }

  return v5;
}

- (double)duration
{
  double v5 = v2;
  -[TVSSTimeInterval beginTime](self, "beginTime");
  return v5 - v3;
}

- (id)addStateTransitionHandler:(id)a3
{
  v12 = self;
  SEL v11 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v8 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  v11,  v12,  @"TVSSTimeInterval.m",  75LL,  @"Invalid parameter not satisfying: %@",  @"handler != nil");
  }

  v9 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  id v6 = [location copy];
  id v5 = objc_retainBlock(v6);
  v4 = -[TVSSTimeInterval tokenToTransitionHandler](v12, "tokenToTransitionHandler");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, v9);

  SEL v7 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7;
}

- (void)removeStateTransitionHandler:(id)a3
{
  SEL v7 = self;
  SEL v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v4 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  v6,  v7,  @"TVSSTimeInterval.m",  83LL,  @"Invalid parameter not satisfying: %@",  @"token != nil");
  }

  double v3 = -[TVSSTimeInterval tokenToTransitionHandler](v7, "tokenToTransitionHandler");
  -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", location);

  objc_storeStrong(&location, 0LL);
}

- (void)beginInterval
{
}

- (void)beginIntervalWithTimeOverride:(double)a3
{
  int64_t v3 = -[TVSSTimeInterval state](self, "state");
  if (!v3 || v3 == 2)
  {
    -[TVSSTimeInterval setBeginTime:](self, "setBeginTime:", a3);
    -[TVSSTimeInterval setState:](self, "setState:", 1LL);
  }

- (void)endInterval
{
}

- (void)endIntervalWithTimeOverride:(double)a3
{
  if ((id)-[TVSSTimeInterval state](self, "state") == (id)1)
  {
    -[TVSSTimeInterval setEndTime:](self, "setEndTime:", a3);
    -[TVSSTimeInterval setState:](self, "setState:", 2LL);
  }

- (void)reset
{
  int64_t v2 = -[TVSSTimeInterval state](self, "state");
  if (v2)
  {
  }

- (void)_notifyStateTransitionHandlersOfTransitionFromState:(int64_t)a3
{
  location[3] = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  v8 = -[TVSSTimeInterval tokenToTransitionHandler](self, "tokenToTransitionHandler");
  id v7 = -[NSMutableDictionary allValues](v8, "allValues");
  location[0] = [v7 copy];

  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v10)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v10;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v5);
      (*(void (**)(void))(v12 + 16))();
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (NSMutableDictionary)tokenToTransitionHandler
{
  return self->_tokenToTransitionHandler;
}

- (void)setTokenToTransitionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end