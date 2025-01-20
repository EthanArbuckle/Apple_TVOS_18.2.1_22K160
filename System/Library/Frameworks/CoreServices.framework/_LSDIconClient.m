@interface _LSDIconClient
- (void)getAlternateIconNameForIdentifier:(id)a3 reply:(id)a4;
- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6;
@end

@implementation _LSDIconClient

- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = -[_LSDClient XPCConnection](self, "XPCConnection");
  [v14 _xpcConnection];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)_LSCopyBundleIdentifierForXPCConnection(v15, 0);
  v17 = -[_LSDClient XPCConnection](self, "XPCConnection");
  v18 = v17;
  if (v17)
  {
    [v17 auditToken];
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
  }

  if (([v16 isEqualToString:v11] & 1) != 0
    || _LSCheckEntitlementForAuditToken((uint64_t)&v20, @"com.apple.lsapplicationworkspace.rebuildappdatabases"))
  {
    v19 = +[LSAltIconManager sharedInstance](&OBJC_CLASS___LSAltIconManager, "sharedInstance", v20, v21);
    [v19 setAlternateIconName:v10 forIdentifier:v11 iconsDictionary:v12 reply:v13];
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDIconClient setAlternateIconName:forIdentifier:iconsDictionary:reply:]",  66LL,  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, v19);
  }
}

- (void)getAlternateIconNameForIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __58___LSDIconClient_getAlternateIconNameForIdentifier_reply___block_invoke;
  v17[3] = &unk_189D75A60;
  v17[4] = self;
  v8 = (void (**)(void))MEMORY[0x186E2A7B8](v17);
  v9 = -[_LSDClient XPCConnection](self, "XPCConnection");
  [v9 _xpcConnection];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LSXPCConnectionMayMapDatabase(v10))
  {
  }

  else
  {
    v8[2](v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEqualToString:v6];

    if (!v12)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDIconClient getAlternateIconNameForIdentifier:reply:]",  87LL,  0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0LL, v14);
      goto LABEL_6;
    }
  }
  v13 = +[LSAltIconManager sharedInstance](&OBJC_CLASS___LSAltIconManager, "sharedInstance");
  id v16 = 0LL;
  [v13 alternateIconNameForIdentifier:v6 error:&v16];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v16;

  ((void (**)(id, void *, void *))v7)[2](v7, v14, v15);
LABEL_6:
}

@end