@interface PVAppIdentityService
- (BOOL)isEntitled;
- (BOOL)isFeatureEnabled;
- (PVAppIdentityService)initWithConnection:(id)a3;
- (void)generateDigest:(id)a3 ppqAppId:(id)a4 withReply:(id)a5;
@end

@implementation PVAppIdentityService

- (PVAppIdentityService)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = -[PVAppIdentityService init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)isFeatureEnabled
{
  return _os_feature_enabled_impl("ProfileValidatedAppIdentity", "enable_generation");
}

- (BOOL)isEntitled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  @"com.apple.private.pvappidentity.spi"));
  id v3 = isNSNumber(v2);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v4 && (id v5 = (void *)v4, v6 = [v2 BOOLValue], v5, (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }

  else
  {
    id v8 = _PVAppIdentityLogSystem();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100019104(v9);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)generateDigest:(id)a3 ppqAppId:(id)a4 withReply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (-[PVAppIdentityService isFeatureEnabled](self, "isFeatureEnabled")
    && -[PVAppIdentityService isEntitled](self, "isEntitled"))
  {
    v10 = -[PVAppIdentityGenerator initWithApplicationURL:ppqAppId:]( objc_alloc(&OBJC_CLASS___PVAppIdentityGenerator),  "initWithApplicationURL:ppqAppId:",  v12,  v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PVAppIdentityGenerator generateDigest](v10, "generateDigest"));
    v9[2](v9, v11);
  }

  else
  {
    v10 = (PVAppIdentityGenerator *)objc_claimAutoreleasedReturnValue( +[PVAppIdentityDigest digestWithErrorCode:]( &OBJC_CLASS___PVAppIdentityDigest,  "digestWithErrorCode:",  -10000LL));
    v9[2](v9, v10);
  }
}

- (void).cxx_destruct
{
}

@end