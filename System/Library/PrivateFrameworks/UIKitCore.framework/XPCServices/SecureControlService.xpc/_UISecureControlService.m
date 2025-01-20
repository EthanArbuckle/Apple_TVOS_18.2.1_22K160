@interface _UISecureControlService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_UISecureControlService)init;
- (void)getSizeToolWithReply:(id)a3;
- (void)getSlotMachineWithReply:(id)a3;
@end

@implementation _UISecureControlService

- (_UISecureControlService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____UISecureControlService;
  v2 = -[_UISecureControlService init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____UISecureControlSizeTool);
    sizeTool = v2->_sizeTool;
    v2->_sizeTool = v3;

    v5 = -[UISSlotMachine initWithSlotDrawer:options:]( objc_alloc(&OBJC_CLASS___UISSlotMachine),  "initWithSlotDrawer:options:",  v2->_sizeTool,  3LL);
    slotMachine = v2->_slotMachine;
    v2->_slotMachine = v5;
  }

  return v2;
}

- (void)getSizeToolWithReply:(id)a3
{
}

- (void)getSlotMachineWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = UISSecureControlServiceInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end