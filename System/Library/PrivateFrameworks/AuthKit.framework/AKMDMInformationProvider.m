@interface AKMDMInformationProvider
- (BOOL)_shouldGetMDMInformationForAccount:(id)a3 accountManager:(id)a4;
- (BOOL)_shouldGetMDMInformationForAuthContext:(id)a3;
- (id)_fetchMDMInformationFromDeviceManagementClient;
- (id)fetchMDMInformationIfNecessaryForAccount:(id)a3 accountManager:(id)a4;
- (id)fetchMDMInformationIfNecessaryForAuthContext:(id)a3;
@end

@implementation AKMDMInformationProvider

- (id)fetchMDMInformationIfNecessaryForAuthContext:(id)a3
{
  return 0LL;
}

- (id)fetchMDMInformationIfNecessaryForAccount:(id)a3 accountManager:(id)a4
{
  return 0LL;
}

- (BOOL)_shouldGetMDMInformationForAuthContext:(id)a3
{
  id v3 = [a3 isMDMInformationRequired];
  uint64_t v4 = _AKLogSystem(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001394F0((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  return (char)v3;
}

- (BOOL)_shouldGetMDMInformationForAccount:(id)a3 accountManager:(id)a4
{
  id v4 = [a4 mdmInformationRequiredForAccount:a3];
  uint64_t v5 = _AKLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013956C((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  return (char)v4;
}

- (id)_fetchMDMInformationFromDeviceManagementClient
{
  uint64_t v2 = _AKLogSystem(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "E+E: Aquiring MDM information", v10, 2u);
  }

  uint64_t v4 = +[AKMDMConfiguration getManagementState](&OBJC_CLASS___AKMDMConfiguration, "getManagementState");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKMDMConfiguration getOrganizationToken](&OBJC_CLASS___AKMDMConfiguration, "getOrganizationToken"));
  uint64_t v6 = _AKLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1001395E8((uint64_t)v5, v4, v7);
  }

  uint64_t v8 = -[AKMDMInformation initWithDeviceManagedState:organizationToken:]( objc_alloc(&OBJC_CLASS___AKMDMInformation),  "initWithDeviceManagedState:organizationToken:",  v4,  v5);
  return v8;
}

@end