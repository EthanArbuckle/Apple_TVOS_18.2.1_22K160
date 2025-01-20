@interface StickyKeyHandler
- (StickyKeyHandler)initWithFilter:(void *)a3 service:(__IOHIDService *)a4;
- (void)StickyKeyNotification:(id)a3;
- (void)removeObserver;
@end

@implementation StickyKeyHandler

- (StickyKeyHandler)initWithFilter:(void *)a3 service:(__IOHIDService *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___StickyKeyHandler;
  v6 = -[StickyKeyHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_filter = a3;
    v6->_service = a4;
    [MEMORY[0x189607958] defaultCenter];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObserver:v7 selector:sel_StickyKeyNotification_ name:@"HIDResetStickyKeyNotification" object:0];

    v9 = v7;
  }

  return v7;
}

- (void)StickyKeyNotification:(id)a3
{
  v4 = (__IOHIDService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;

  if (v4 != service)
  {
    filter = self->_filter;
    v7 = (dispatch_queue_s *)*((void *)filter + 62);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1890BE92C;
    block[3] = &unk_18A3441C8;
    block[4] = filter;
    dispatch_async(v7, block);
  }

- (void)removeObserver
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self name:@"HIDResetStickyKeyNotification" object:0];
}

@end