@interface TKSharedResource
- (TKSharedResource)initWithSlot:(id)a3;
- (id)object;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TKSharedResource

- (TKSharedResource)initWithSlot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSharedResource;
  v6 = -[TKSharedResource init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_slot, a3);
  }

  return v7;
}

- (id)object
{
  return -[TKSharedResourceSlot object](self->_slot, "object");
}

- (void)invalidate
{
  slot = self->_slot;
  self->_slot = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSharedResource;
  -[TKSharedResource dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end