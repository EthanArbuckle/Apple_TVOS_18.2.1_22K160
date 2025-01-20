@interface SKStateTransitionEntry
+ (id)entryWithState:(id)a3 event:(id)a4;
+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5;
+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6;
+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5;
+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6;
- (NSString)event;
- (NSString)nextState;
- (NSString)state;
- (SEL)selector;
- (id)action;
- (void)setAction:(id)a3;
- (void)setEvent:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setState:(id)a3;
@end

@implementation SKStateTransitionEntry

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)objc_opt_class(a1));
  [v14 setState:v13];

  [v14 setEvent:v12];
  [v14 setAction:v11];

  [v14 setNextState:v10];
  [v14 setSelector:0];
  return v14;
}

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class(a1) entryWithState:v10 event:v9 action:v8 nextState:0];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)objc_opt_class(a1));
  [v13 setState:v12];

  [v13 setEvent:v11];
  [v13 setAction:0];
  [v13 setNextState:v10];

  [v13 setSelector:a5];
  return v13;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class(a1) entryWithState:v9 event:v8 selector:a5 nextState:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (id)entryWithState:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class(a1) entryWithState:v7 event:v6 action:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (NSString)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end