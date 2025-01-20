@interface DTXService
+ (BOOL)automaticallyRegistersCapabilities;
+ (void)instantiateServiceWithChannel:(id)a3;
- (DTXChannel)channel;
- (DTXService)initWithChannel:(id)a3;
@end

@implementation DTXService

+ (void)instantiateServiceWithChannel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v7 = (id)objc_msgSend_initWithChannel_(v5, v6, (uint64_t)v4);
}

+ (BOOL)automaticallyRegistersCapabilities
{
  return 1;
}

- (DTXService)initWithChannel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DTXService;
  v6 = -[DTXService init](&v14, sel_init);
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = sub_188BC0C70;
    v12[3] = &unk_18A2ED4D8;
    v8 = v6;
    v13 = v8;
    objc_msgSend_setMessageHandler_(v5, v9, (uint64_t)v12);
    objc_msgSend_setDispatchTarget_(v5, v10, (uint64_t)v8);
    objc_storeStrong(v8 + 1, a3);
  }

  return v7;
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
}

@end