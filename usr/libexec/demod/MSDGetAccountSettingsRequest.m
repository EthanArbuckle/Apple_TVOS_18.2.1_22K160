@interface MSDGetAccountSettingsRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)existingAccounts;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setExistingAccounts:(id)a3;
@end

@implementation MSDGetAccountSettingsRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDGetAccountSettingsRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest existingAccounts](self, "existingAccounts"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getPostData
{
  v8[0] = @"UniqueDeviceID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = @"ExistingAccounts";
  v9[0] = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest existingAccounts](self, "existingAccounts"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 convertToNSData]);
  return v6;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDGetAccountSettingsResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MSDGetAccountSettingsRequest;
  id v7 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);

  if (!v9)
  {
    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
      *(_DWORD *)buf = 138543618;
      v27 = v12;
      __int16 v28 = 2114;
      v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: data from server: %{public}@",  buf,  0x16u);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 data]);
    if (v14
      && (v15 = (void *)v14,
          v16 = (void *)objc_claimAutoreleasedReturnValue([v8 data]),
          id v17 = [v16 length],
          v16,
          v15,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryFromJsonData:]( &OBJC_CLASS___NSDictionary,  "dictionaryFromJsonData:",  v18));

      if (!v19)
      {
        id v20 = sub_10003A95C();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000933D0(self, v21);
        }

        id v24 = v6;
        sub_100087610(&v24, 3727744512LL, (uint64_t)@"Unexpected server response.");
        v19 = v6;
        id v6 = v24;
        goto LABEL_12;
      }
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    }

    [v8 setAccountSettings:v19];
LABEL_12:
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);

  if (!v22) {
    [v8 setError:v6];
  }

  return v8;
}

- (NSDictionary)existingAccounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExistingAccounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end