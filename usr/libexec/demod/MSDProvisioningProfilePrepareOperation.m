@interface MSDProvisioningProfilePrepareOperation
- (BOOL)_determineAppInstallNecessity;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDProvisioningProfilePrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
  {
    v3 = (void *)objc_opt_new(&OBJC_CLASS___NSArray, v2);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_determineAppInstallNecessity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v4, v5, 0LL));
  }

  return v3;
}

- (int64_t)type
{
  return 1LL;
}

- (BOOL)_determineAppInstallNecessity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (+[MSDProvisioningProfileUtils isProvisioningProfileInstalled:]( &OBJC_CLASS___MSDProvisioningProfileUtils,  "isProvisioningProfileInstalled:",  v4))
  {
    id v5 = sub_10003A95C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Provisioning profile with UUID already installed: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    -[MSDOperation setSkipped:](self, "setSkipped:", 1LL);
  }

  return 1;
}

@end