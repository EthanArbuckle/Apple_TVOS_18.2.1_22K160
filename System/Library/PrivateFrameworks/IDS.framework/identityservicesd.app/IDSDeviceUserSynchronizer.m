@interface IDSDeviceUserSynchronizer
- (id)_retrieveUDID;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
@end

@implementation IDSDeviceUserSynchronizer

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1006946A4((uint64_t)v4, v5);
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 != 3)
  {
    id v8 = v6;
    goto LABEL_6;
  }

  if (CUTIsInternalInstall()
    && +[IMUserDefaults disableDeviceUsers](&OBJC_CLASS___IMUserDefaults, "disableDeviceUsers"))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
LABEL_6:
    id v9 = v8;
    goto LABEL_13;
  }

  if ([v7 count])
  {
    id v9 = v7;
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___IDSDeviceUser);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUserSynchronizer _retrieveUDID](self, "_retrieveUDID"));
    v12 = -[IDSDeviceUser initWithUDID:](v10, "initWithUDID:", v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Finished synchronizing device to users {currentUsers: %@, updatedUsers: %@}",  (uint8_t *)&v15,  0x16u);
  }

LABEL_13:
  return v9;
}

- (id)_retrieveUDID
{
  return +[IDSValidationSession retrieveLocalUDID](&OBJC_CLASS___IDSValidationSession, "retrieveLocalUDID");
}

@end