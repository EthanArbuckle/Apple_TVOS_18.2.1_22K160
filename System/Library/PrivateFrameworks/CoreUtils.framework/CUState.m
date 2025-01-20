@interface CUState
- (CUState)initWithName:(id)a3 parent:(id)a4;
- (NSString)name;
- (id)description;
- (id)eventHandler;
- (void)dealloc;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
@end

@implementation CUState

- (CUState)initWithName:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CUState;
  v8 = -[CUState init](&v15, sel_init);
  if (!v8) {
    FatalErrorF("init failed");
  }
  v9 = v8;
  uint64_t v10 = [v6 copy];
  name = v9->_name;
  v9->_name = (NSString *)v10;

  v12 = (CUState *)v7;
  parent = v9->_parent;
  v9->_parent = v12;

  return v9;
}

- (void)dealloc
{
  if (self->_eventHandler || self->_lcaMap || self->_parent) {
    FatalErrorF("State %@: invalidate not called");
  }
  name = self->_name;
  self->_name = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUState;
  -[CUState dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)-[NSString copy](self->_name, "copy");
}

- (void)invalidate
{
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = 0LL;

  -[NSPointerArray setCount:](self->_lcaMap, "setCount:", 0LL);
  lcaMap = self->_lcaMap;
  self->_lcaMap = 0LL;

  parent = self->_parent;
  self->_parent = 0LL;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end