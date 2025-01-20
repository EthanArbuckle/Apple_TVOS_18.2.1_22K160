@interface CoreControlCECDeviceProvider
- (void)readyToSend;
@end

@implementation CoreControlCECDeviceProvider

- (void)readyToSend
{
  id v3 = sub_3980();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Check TV\n", buf, 2u);
  }

  id v29 = 0LL;
  unsigned __int8 v5 = -[CoreControlCECDeviceProvider pollTo:error:](self, "pollTo:error:", 0LL, &v29);
  id v6 = v29;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    v9 = v8;
    if (v8 == (void *)CoreCECErrorDomain)
    {
      v10 = (char *)[v7 code];

      if (v10 == (_BYTE *)&dword_0 + 2)
      {
        id v11 = sub_3980();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Check TV => TV is either not present or not responding\n",  buf,  2u);
        }

        goto LABEL_11;
      }
    }

    else
    {
    }

    id v13 = sub_3980();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      id v15 = [v14 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v31 = v15;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Poll TV => %s\n", buf, 0xCu);
    }

@end