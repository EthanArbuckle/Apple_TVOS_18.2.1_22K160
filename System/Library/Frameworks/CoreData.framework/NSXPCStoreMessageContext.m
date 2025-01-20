@interface NSXPCStoreMessageContext
- (id)initForMessage:(id)a3 store:(id)a4;
- (void)dealloc;
@end

@implementation NSXPCStoreMessageContext

- (id)initForMessage:(id)a3 store:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSXPCStoreMessageContext;
  v6 = -[NSXPCStoreMessageContext init](&v9, sel_init);
  if (v6)
  {
    v7 = (NSCoreDataXPCMessage *)a3;
    v6->_store = (NSXPCStore *)a4;
    v6->_message = v7;
    v6->_result = 0LL;
  }

  return v6;
}

- (void)dealloc
{
  self->_message = 0LL;
  self->_result = 0LL;

  self->_error = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCStoreMessageContext;
  -[NSXPCStoreMessageContext dealloc](&v3, sel_dealloc);
}

@end