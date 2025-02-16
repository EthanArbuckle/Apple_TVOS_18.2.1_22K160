@interface IDSXPCServerMessagingClientContext
- (IDSXPCServerMessagingClient)client;
- (NSSet)commands;
- (void)setClient:(id)a3;
- (void)setCommands:(id)a3;
@end

@implementation IDSXPCServerMessagingClientContext

- (IDSXPCServerMessagingClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
}

@end