@interface TKToken
- (TKToken)initWithTokenDriver:(TKTokenDriver *)tokenDriver instanceID:(TKTokenInstanceID)instanceID;
- (TKTokenConfiguration)configuration;
- (TKTokenDriver)tokenDriver;
- (TKTokenID)tokenID;
- (TKTokenKeychainContents)keychainContents;
- (id)delegate;
- (id)description;
- (void)setDelegate:(id)delegate;
- (void)setKeychainContents:(id)a3;
- (void)terminate;
@end

@implementation TKToken

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKToken tokenID](self, "tokenID");
  [v6 stringRepresentation];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %@ %p>", v5, v7, self];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TKToken)initWithTokenDriver:(TKTokenDriver *)tokenDriver instanceID:(TKTokenInstanceID)instanceID
{
  v7 = tokenDriver;
  v8 = instanceID;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TKToken;
  v9 = -[TKToken init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenDriver, tokenDriver);
    v11 = objc_alloc(&OBJC_CLASS___TKTokenID);
    v12 = -[TKTokenDriver classID](v7, "classID");
    uint64_t v13 = -[TKTokenID initWithClassID:instanceID:](v11, "initWithClassID:instanceID:", v12, v8);
    tokenID = v10->_tokenID;
    v10->_tokenID = (TKTokenID *)v13;
  }

  return v10;
}

- (TKTokenConfiguration)configuration
{
  v2 = self;
  objc_sync_enter(v2);
  configuration = v2->_configuration;
  if (!configuration)
  {
    v4 = objc_alloc(&OBJC_CLASS___TKTokenConfiguration);
    tokenID = v2->_tokenID;
    v6 = -[TKTokenDriver context](v2->_tokenDriver, "context");
    [v6 configurationConnection];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]( v4,  "initWithTokenID:configurationConnection:",  tokenID,  v7);
    v9 = v2->_configuration;
    v2->_configuration = (TKTokenConfiguration *)v8;

    configuration = v2->_configuration;
  }

  v10 = configuration;
  objc_sync_exit(v2);

  return v10;
}

- (void)terminate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 delegate];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TKToken tokenDriver](self, "tokenDriver");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 delegate];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TKToken tokenDriver](self, "tokenDriver");
    [v6 tokenDriver:v7 terminateToken:self];
  }

- (TKTokenDriver)tokenDriver
{
  return (TKTokenDriver *)objc_getProperty(self, a2, 16LL, 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (TKTokenKeychainContents)keychainContents
{
  return (TKTokenKeychainContents *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setKeychainContents:(id)a3
{
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end