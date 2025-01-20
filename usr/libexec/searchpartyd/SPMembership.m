@interface SPMembership
+ (BOOL)isLocalAccountUUID:(id)a3;
+ (id)currentMachineUserUUID;
@end

@implementation SPMembership

+ (BOOL)isLocalAccountUUID:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SPMembership isLocalAccountUUID: %@",  buf,  0xCu);
  }

  int v15 = 0;
  id v4 = v3;
  uuid_parse((const char *)[v4 UTF8String], uu);
  if (mbr_check_membership_by_id(uu, 20LL, &v15))
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_1007DA7E8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    BOOL v13 = 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v4;
      __int16 v18 = 1024;
      int v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SPMembership isLocalAccountUUID: %@, LocalGroup: staff(20), result: %i",  buf,  0x12u);
    }

    BOOL v13 = v15 == 1;
  }

  return v13;
}

+ (id)currentMachineUserUUID
{
  uid_t v2 = getuid();
  memset(uu, 0, sizeof(uu));
  if (mbr_uid_to_uuid(v2, uu))
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_1007DA820(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    exit(1);
  }

  memset(v12, 0, sizeof(v12));
  uuid_unparse_upper(uu, v12);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  1LL));
}

@end