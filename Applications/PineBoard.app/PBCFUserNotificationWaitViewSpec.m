@interface PBCFUserNotificationWaitViewSpec
- (NSString)dismissalDarwinNotification;
- (NSString)sharePlayDeviceName;
- (NSString)type;
- (PBCFUserNotificationWaitViewSpec)initWithDictionary:(id)a3;
- (int64_t)sharePlayDeviceModel;
- (unint64_t)userNotificationResponse;
@end

@implementation PBCFUserNotificationWaitViewSpec

- (PBCFUserNotificationWaitViewSpec)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", PBSUserNotificationWaitViewTypeKey));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", PBSUserNotificationWaitViewDismissalDarwinNotificationKey));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", PBSUserNotificationResponseForWaitViewKey));
    v9 = (void *)v8;
    if (v6) {
      BOOL v10 = v7 == 0LL;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10 || v8 == 0)
    {
      v12 = 0LL;
    }

    else
    {
      v21.receiver = self;
      v21.super_class = (Class)&OBJC_CLASS___PBCFUserNotificationWaitViewSpec;
      v13 = -[PBCFUserNotificationWaitViewSpec init](&v21, "init");
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_type, v6);
        objc_storeStrong((id *)&v14->_dismissalDarwinNotification, v7);
        v14->_userNotificationResponse = (unint64_t)[v9 unsignedLongValue];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", PBSUserNotificationSharePlayWaitViewDeviceNameKey));
        sharePlayDeviceName = v14->_sharePlayDeviceName;
        v14->_sharePlayDeviceName = (NSString *)v15;

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", PBSUserNotificationSharePlayWaitViewDeviceModelKey));
        v18 = v17;
        if (v17) {
          id v19 = [v17 integerValue];
        }
        else {
          id v19 = 0LL;
        }

        v14->_sharePlayDeviceModel = (int64_t)v19;
      }

      self = v14;
      v12 = self;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)dismissalDarwinNotification
{
  return self->_dismissalDarwinNotification;
}

- (unint64_t)userNotificationResponse
{
  return self->_userNotificationResponse;
}

- (NSString)sharePlayDeviceName
{
  return self->_sharePlayDeviceName;
}

- (int64_t)sharePlayDeviceModel
{
  return self->_sharePlayDeviceModel;
}

- (void).cxx_destruct
{
}

@end