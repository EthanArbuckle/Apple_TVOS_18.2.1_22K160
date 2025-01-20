@interface AKCommonResponseCodeHandler
+ (void)handleResponseCode:(int64_t)a3 altDSID:(id)a4;
@end

@implementation AKCommonResponseCodeHandler

+ (void)handleResponseCode:(int64_t)a3 altDSID:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 437)
  {
    uint64_t v7 = _AKLogSystem(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received status code to sign out. Checking for altDSID.",  buf,  2u);
    }

    uint64_t v10 = _AKLogSystem(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Marking account for sign out.", v13, 2u);
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AKSignOutManager sharedManager](&OBJC_CLASS___AKSignOutManager, "sharedManager"));
      -[os_log_s markAccountForSignOutForAltDSID:](v12, "markAccountForSignOutForAltDSID:", v6);
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_100141B18(v12);
    }
  }
}

@end