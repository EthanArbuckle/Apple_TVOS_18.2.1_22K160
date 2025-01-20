@interface OctagonXPCEntitlementChecker
+ (BOOL)conformsToProtocol:(id)a3;
+ (id)createWithManager:(id)a3 entitlementBearer:(id)a4;
- (OTManager)manager;
- (OctagonEntitlementBearerProtocol)entitlementBearer;
- (OctagonXPCEntitlementChecker)initWithManager:(id)a3 entitlementBearer:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)failFetchAccountSettings:(id)a3 reply:(id)a4;
- (void)failFetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)failFetchEscrowContents:(id)a3 reply:(id)a4;
- (void)failFetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)failPersistAccountSettings:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)failRemoveLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)failSetAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)failSetLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)setEntitlementBearer:(id)a3;
- (void)setManager:(id)a3;
@end

@implementation OctagonXPCEntitlementChecker

- (OctagonXPCEntitlementChecker)initWithManager:(id)a3 entitlementBearer:(id)a4
{
  v6 = (OTManager *)a3;
  v7 = (OctagonEntitlementBearerProtocol *)a4;
  manager = self->_manager;
  self->_manager = v6;
  v9 = v6;

  entitlementBearer = self->_entitlementBearer;
  self->_entitlementBearer = v7;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker manager](self, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 methodSignatureForSelector:a3]);

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (sel_isEqual((SEL)[v4 selector], "fetchEscrowContents:reply:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:kSecEntitlementPrivateOctagonEscrow]);

    if (!v6)
    {
      v20 = sub_10001267C("SecError");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v22;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonEscrow;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failFetchEscrowContents:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual((SEL)[v4 selector], "setLocalSecureElementIdentity:secureElementIdentity:reply:"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement]);

    if (!v8)
    {
      v24 = sub_10001267C("SecError");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v26;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failSetLocalSecureElementIdentity:secureElementIdentity:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual( (SEL)[v4 selector],  "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement]);

    if (!v10)
    {
      v27 = sub_10001267C("SecError");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v29;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failRemoveLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual((SEL)[v4 selector], "fetchTrustedSecureElementIdentities:reply:"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:kSecEntitlementPrivateOctagonSecureElement]);

    if (!v12)
    {
      v30 = sub_10001267C("SecError");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v32;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failFetchTrustedSecureElementIdentities:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual((SEL)[v4 selector], "setAccountSetting:setting:reply:"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus]);

    if (!v14)
    {
      v33 = sub_10001267C("SecError");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v35;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failSetAccountSetting:setting:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual((SEL)[v4 selector], "fetchAccountSettings:reply:"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus]);

    if (!v16)
    {
      v36 = sub_10001267C("SecError");
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v38;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failFetchAccountSettings:reply:";
      goto LABEL_37;
    }
  }

  if (sel_isEqual((SEL)[v4 selector], "fetchAccountWideSettingsWithForceFetch:arguments:reply:"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 valueForEntitlement:kSecEntitlementPrivateOctagonWalrus]);

    if (!v18)
    {
      v39 = sub_10001267C("SecError");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        int v42 = 138412546;
        v43 = v41;
        __int16 v44 = 2112;
        uint64_t v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Client %@ does not have entitlement %@, rejecting rpc",  (uint8_t *)&v42,  0x16u);
      }

      v23 = "failFetchAccountWideSettingsWithForceFetch:arguments:reply:";
LABEL_37:
      [v4 setSelector:v23];
      [v4 invokeWithTarget:self];
      goto LABEL_38;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker manager](self, "manager"));
  [v4 invokeWithTarget:v19];

LABEL_38:
}

- (void)failFetchEscrowContents:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonEscrow;
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v8));
  (*((void (**)(id, void, void, void, void *))a4 + 2))(v6, 0LL, 0LL, 0LL, v7);
}

- (void)failSetLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonSecureElement;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failRemoveLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonSecureElement;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failFetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonSecureElement;
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v8));
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0LL, v7);
}

- (void)failSetAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)failFetchAccountSettings:(id)a3 reply:(id)a4
{
  uint64_t v5 = kSecEntitlementPrivateOctagonWalrus;
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v8));
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0LL, v7);
}

- (void)failFetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v9));
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0LL, v8);
}

- (void)failPersistAccountSettings:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6 = kSecEntitlementPrivateOctagonWalrus;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement '%@'",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -34018LL,  v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (OTManager)manager
{
  return (OTManager *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setManager:(id)a3
{
}

- (OctagonEntitlementBearerProtocol)entitlementBearer
{
  return (OctagonEntitlementBearerProtocol *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEntitlementBearer:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class(OTManager) conformsToProtocol:v3];

  return v4;
}

+ (id)createWithManager:(id)a3 entitlementBearer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[OctagonXPCEntitlementChecker initWithManager:entitlementBearer:]( objc_alloc(&OBJC_CLASS___OctagonXPCEntitlementChecker),  "initWithManager:entitlementBearer:",  v6,  v5);

  return v7;
}

@end