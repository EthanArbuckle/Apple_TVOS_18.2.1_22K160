@interface IOSurfaceWiringAssertion
- (IOSurfaceWiringAssertion)initWithIOSurface:(id)a3;
- (IOSurfaceWiringAssertion)initWithIOSurfaceClient:(__IOSurfaceClient *)a3;
- (void)dealloc;
@end

@implementation IOSurfaceWiringAssertion

- (IOSurfaceWiringAssertion)initWithIOSurface:(id)a3
{
  return -[IOSurfaceWiringAssertion initWithIOSurfaceClient:](self, "initWithIOSurfaceClient:", *((void *)a3 + 1));
}

- (IOSurfaceWiringAssertion)initWithIOSurfaceClient:(__IOSurfaceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IOSurfaceWiringAssertion;
  v4 = -[IOSurfaceWiringAssertion init](&v7, sel_init);
  unsigned int MachPortWithOptions = IOSurfaceClientCreateMachPortWithOptions((uint64_t)a3, 1uLL);
  v4->_mach_port = MachPortWithOptions;
  if (!MachPortWithOptions)
  {

    return 0LL;
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  mach_port_name_t mach_port = self->_mach_port;
  if (mach_port)
  {
    mach_port_mod_refs(*MEMORY[0x1895FBBE0], mach_port, 0, -1);
    self->_mach_port_name_t mach_port = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IOSurfaceWiringAssertion;
  -[IOSurfaceWiringAssertion dealloc](&v4, sel_dealloc);
}

@end