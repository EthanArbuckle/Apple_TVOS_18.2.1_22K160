@interface TKTokenAccessRequest
- (BOOL)clientHasAccessTokenEntitlement;
- (BOOL)isEqual:(id)a3;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)providerBundleID;
- (NSString)providerName;
- (NSUUID)correlationID;
- (NSXPCConnection)clientConnection;
- (TKTokenAccessRequest)initWithCaller:(id)a3 tokenID:(id)a4 extension:(id)a5;
- (TKTokenAccessRequest)initWithClientBundleID:(id)a3 clientName:(id)a4 clientConnection:(id)a5 clientHasAccessTokenEntitlement:(BOOL)a6 tokenID:(id)a7 providerBundleID:(id)a8 providerName:(id)a9 correlationID:(id)a10;
- (TKTokenID)tokenID;
@end

@implementation TKTokenAccessRequest

- (TKTokenAccessRequest)initWithClientBundleID:(id)a3 clientName:(id)a4 clientConnection:(id)a5 clientHasAccessTokenEntitlement:(BOOL)a6 tokenID:(id)a7 providerBundleID:(id)a8 providerName:(id)a9 correlationID:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TKTokenAccessRequest;
  v18 = -[TKTokenAccessRequest init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientBundleID, a3);
    objc_storeStrong((id *)&v19->_clientName, a4);
    objc_storeStrong((id *)&v19->_clientConnection, a5);
    v19->_clientHasAccessTokenEntitlement = a6;
    objc_storeStrong((id *)&v19->_tokenID, a7);
    objc_storeStrong((id *)&v19->_providerBundleID, a8);
    objc_storeStrong((id *)&v19->_providerName, a9);
    objc_storeStrong((id *)&v19->_correlationID, a10);
  }

  return v19;
}

- (TKTokenAccessRequest)initWithCaller:(id)a3 tokenID:(id)a4 extension:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc(&OBJC_CLASS___TKTokenAccessRequest);
  [v7 valueForEntitlement:@"com.apple.private.ctk.token-access.allow"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v19 BOOLValue];
  [v8 _extensionBundle];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 bundleIdentifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 _localizedShortName];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    [v8 _localizedShortName];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v16 = objc_alloc_init(MEMORY[0x189607AB8]);
  id v17 = -[TKTokenAccessRequest initWithClientBundleID:clientName:clientConnection:clientHasAccessTokenEntitlement:tokenID:providerBundleID:providerName:correlationID:]( v10,  "initWithClientBundleID:clientName:clientConnection:clientHasAccessTokenEntitlement:tokenID:providerBundleID:pr oviderName:correlationID:",  0LL,  0LL,  v7,  v11,  v9,  v13,  v15,  v16);

  if (!v14) {
  return v17;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    if (!v5) {
      goto LABEL_15;
    }
    v6 = -[TKTokenAccessRequest correlationID](self, "correlationID");
    [v5 correlationID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = -[TKTokenAccessRequest clientBundleID](self, "clientBundleID");
    if (v9)
    {
      v10 = (void *)v9;
      -[TKTokenAccessRequest clientBundleID](self, "clientBundleID");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 clientBundleID];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v11 isEqualToString:v12];

      if (!v13) {
        goto LABEL_15;
      }
    }

    uint64_t v14 = -[TKTokenAccessRequest clientName](self, "clientName");
    if (v14)
    {
      v15 = (void *)v14;
      -[TKTokenAccessRequest clientName](self, "clientName");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 clientName];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_15;
      }
    }

    int v19 = -[TKTokenAccessRequest clientHasAccessTokenEntitlement](self, "clientHasAccessTokenEntitlement");
    v20 = -[TKTokenAccessRequest tokenID](self, "tokenID");
    [v5 tokenID];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_15;
    }
    uint64_t v23 = -[TKTokenAccessRequest providerBundleID](self, "providerBundleID");
    if (!v23) {
      goto LABEL_12;
    }
    id v24 = (void *)v23;
    -[TKTokenAccessRequest providerBundleID](self, "providerBundleID");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 providerBundleID];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = [v25 isEqual:v26];

    if (v27)
    {
LABEL_12:
      uint64_t v28 = -[TKTokenAccessRequest providerName](self, "providerName");
      if (v28)
      {
        v29 = (void *)v28;
        v30 = -[TKTokenAccessRequest providerName](self, "providerName");
        [v5 providerName];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        char v32 = [v30 isEqual:v31];
      }

      else
      {
        char v32 = 1;
      }
    }

    else
    {
LABEL_15:
      char v32 = 0;
    }
  }

  else
  {
    char v32 = 0;
  }

  return v32;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)clientHasAccessTokenEntitlement
{
  return self->_clientHasAccessTokenEntitlement;
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (NSString)providerBundleID
{
  return self->_providerBundleID;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSUUID)correlationID
{
  return self->_correlationID;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void).cxx_destruct
{
}

@end