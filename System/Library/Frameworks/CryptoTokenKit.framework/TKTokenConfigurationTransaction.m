@interface TKTokenConfigurationTransaction
- (TKTokenConfigurationTransaction)initWithConfigurationConnection:(id)a3;
- (void)commit;
- (void)dealloc;
@end

@implementation TKTokenConfigurationTransaction

- (TKTokenConfigurationTransaction)initWithConfigurationConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKTokenConfigurationTransaction;
  v6 = -[TKTokenConfigurationTransaction init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationConnection, a3);
  }

  return v7;
}

- (void)commit
{
  configurationConnection = self->_configurationConnection;
  if (!configurationConnection)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"TKTokenConfiguration.m" lineNumber:97 description:@"Double-commit of transaction"];

    configurationConnection = self->_configurationConnection;
  }
  v4 = -[TKTokenConfigurationConnection configurationProtocol](configurationConnection, "configurationProtocol");
  [v4 endTransactionWithReply:&__block_literal_global_76];

  id v5 = self->_configurationConnection;
  self->_configurationConnection = 0LL;
}

- (void)dealloc
{
  if (self->_configurationConnection)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"TKTokenConfiguration.m" lineNumber:103 description:@"Destroying uncommited transaction"];
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TKTokenConfigurationTransaction;
  -[TKTokenConfigurationTransaction dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end