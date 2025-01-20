@interface VerifyReceiptsTask
- (VerifyReceiptsTask)init;
- (void)main;
@end

@implementation VerifyReceiptsTask

- (VerifyReceiptsTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VerifyReceiptsTask;
  v2 = -[MigrateToManagedTask init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    revoked = v2->super._revoked;
    v2->super._revoked = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    soonestExpiring = v2->_soonestExpiring;
    v2->_soonestExpiring = (ApplicationProxy *)v5;
  }

  return v2;
}

- (void)main
{
  if (!self || !self->_qaVerficationRevokedApps)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    qaVerficationRevokedApps = self->_qaVerficationRevokedApps;
    self->_qaVerficationRevokedApps = (NSArray *)v3;
  }

  selfa = self;
  uint64_t v5 = ASDLogHandleForCategory(14LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_qaVerficationRevokedApps;
    *(_DWORD *)buf = 138412290;
    v89 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Starting receipt refresh", buf, 0xCu);
  }

  if (os_variant_has_internal_content("com.apple.appstored"))
  {
    CFPropertyListRef v8 = sub_1002FA504((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ([v9 count])
    {
    }

    else
    {
      CFPropertyListRef v10 = sub_1002FA4DC((uint64_t)&OBJC_CLASS___AppDefaultsManager);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = [v11 count] == 0;

      if (v12) {
        goto LABEL_13;
      }
    }

    CFPropertyListRef v13 = sub_1002FA4DC((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue(v13);
    soonestExpiringDate = self->_soonestExpiringDate;
    self->_soonestExpiringDate = v14;

    CFPropertyListRef v16 = sub_1002FA504((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v16);
    revoked = self->_revoked;
    self->_revoked = v17;

    uint64_t v19 = ASDLogHandleForCategory(14LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_qaVerficationRevokedApps;
      v22 = self->_revoked;
      v23 = self->_soonestExpiringDate;
      *(_DWORD *)buf = 138412802;
      v89 = v21;
      __int16 v90 = 2114;
      v91 = v22;
      __int16 v92 = 2114;
      v93 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] Including the following for QA verification. revoked: %{public}@ expired: %{public}@",  buf,  0x20u);
    }
  }

- (void).cxx_destruct
{
}

@end