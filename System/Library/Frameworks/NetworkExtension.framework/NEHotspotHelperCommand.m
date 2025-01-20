@interface NEHotspotHelperCommand
- (NEHotspotHelperCommandType)commandType;
- (NEHotspotHelperResponse)createResponse:(NEHotspotHelperResult)result;
- (NEHotspotNetwork)network;
- (NSArray)networkList;
- (NWTCPConnection)createTCPConnection:(NWEndpoint *)endpoint;
- (NWUDPSession)createUDPSession:(NWEndpoint *)endpoint;
- (OS_nw_interface)interface;
- (id)description;
- (id)interfaceName;
- (void)dealloc;
@end

@implementation NEHotspotHelperCommand

- (id)description
{
  if (self) {
    self = (NEHotspotHelperCommand *)self->_command;
  }
  return (id)(id)CFCopyDescription(self);
}

- (void)dealloc
{
  if (self)
  {
    command = self->_command;
    if (command) {
      CFRelease(command);
    }
    self->_command = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEHotspotHelperCommand;
  -[NEHotspotHelperCommand dealloc](&v4, sel_dealloc);
}

- (NEHotspotHelperCommandType)commandType
{
  return (unint64_t)CNPluginCommandGetType();
}

- (NEHotspotNetwork)network
{
  if (self && self->_command && (v2 = (const void *)CNPluginCommandCopyCurrentNetwork()) != 0LL)
  {
    v3 = v2;
    id v4 = -[NEHotspotNetwork initWithNetwork:](objc_alloc(&OBJC_CLASS___NEHotspotNetwork), v2);
    CFRelease(v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return (NEHotspotNetwork *)v4;
}

- (NSArray)networkList
{
  if (self && self->_command && (v2 = (const __CFArray *)CNPluginCommandCopyNetworkList()) != 0LL)
  {
    v3 = v2;
    createHotspotNetworkArray(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSArray *)v4;
}

- (NEHotspotHelperResponse)createResponse:(NEHotspotHelperResult)result
{
  if (self && self->_command && (uint64_t v3 = CNPluginResponseCreate()) != 0)
  {
    id v4 = (__CNPluginCommand *)v3;
    v5 = objc_alloc(&OBJC_CLASS___NEHotspotHelperResponse);
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)&OBJC_CLASS___NEHotspotHelperResponse;
      v6 = -[NEHotspotHelperCommand init](&v9, sel_init);
      if (v6)
      {
        CFRetain(v4);
        command = v6->_command;
        if (command) {
          CFRelease(command);
        }
        v6->_command = v4;
      }
    }

    else
    {
      v6 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    v6 = 0LL;
  }

  return (NEHotspotHelperResponse *)v6;
}

- (OS_nw_interface)interface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 UTF8String];
  uint64_t v3 = (void *)nw_interface_create_with_name();

  return (OS_nw_interface *)v3;
}

- (NWTCPConnection)createTCPConnection:(NWEndpoint *)endpoint
{
  id v4 = (objc_class *)MEMORY[0x189608E00];
  v5 = endpoint;
  id v6 = objc_alloc(v4);
  v7 = -[NEHotspotHelperCommand interfaceName](self);
  v8 = (void *)[v6 initWithInterfaceName:v7];

  id v9 = objc_alloc_init(MEMORY[0x189608E10]);
  [v9 setRequiredInterface:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x189608E30]) initWithEndpoint:v5 parameters:v9];

  return (NWTCPConnection *)v10;
}

- (NWUDPSession)createUDPSession:(NWEndpoint *)endpoint
{
  id v4 = (objc_class *)MEMORY[0x189608E00];
  v5 = endpoint;
  id v6 = objc_alloc(v4);
  v7 = -[NEHotspotHelperCommand interfaceName](self);
  v8 = (void *)[v6 initWithInterfaceName:v7];

  id v9 = objc_alloc_init(MEMORY[0x189608E10]);
  [v9 setRequiredInterface:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x189608E38]) initWithEndpoint:v5 parameters:v9];

  return (NWUDPSession *)v10;
}

- (id)interfaceName
{
  if (a1)
  {
    CNPluginCommandGetInterfaceName();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

@end