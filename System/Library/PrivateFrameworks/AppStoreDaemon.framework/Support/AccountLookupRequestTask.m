@interface AccountLookupRequestTask
- (void)main;
@end

@implementation AccountLookupRequestTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(9LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self, v6);
    id v8 = v7;
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v10 = error;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v10, "clientID"));
    if (self) {
      response = self->super._response;
    }
    else {
      response = 0LL;
    }
    v13 = response;
    *(_DWORD *)buf = 138544130;
    v34 = v7;
    __int16 v35 = 2114;
    v36 = v3;
    __int16 v37 = 2114;
    v38 = v11;
    __int16 v39 = 1024;
    LODWORD(v40) = -[ASDRequestResponse authIfNeeded](v13, "authIfNeeded");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Account lookup request by client: %{public}@ for authIfNeeded: %d",  buf,  0x26u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_activeiTunesAccount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));

  BOOL v32 = 0;
  id v17 = sub_100320738((uint64_t)&OBJC_CLASS___FamilyManager);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (self) {
    v19 = self->super._response;
  }
  else {
    v19 = 0LL;
  }
  v20 = v19;
  id v31 = 0LL;
  BOOL v21 = sub_1003207D4((uint64_t)v18, v3, 1, (int)-[ASDRequestResponse authIfNeeded](v20, "authIfNeeded"), &v32, &v31);
  id v22 = v31;

  id v23 = objc_alloc(&OBJC_CLASS___ASDAccountLookupResponse);
  if (v22) {
    id v24 = [v23 initWithError:v22];
  }
  else {
    id v24 = [v23 initWithAccountID:v16 askToBuyEnabled:v21];
  }
  v25 = v24;
  sub_1001BA9FC(self, v24);
  if (self) {
    LOBYTE(self->super.super._keepAlive) = v22 == 0LL;
  }
  uint64_t v26 = ASDLogHandleForCategory(9LL);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_opt_class(self, v28);
    *(_DWORD *)buf = 138544130;
    v34 = v29;
    __int16 v35 = 2114;
    v36 = v3;
    __int16 v37 = 2114;
    v38 = v16;
    __int16 v39 = 2048;
    uint64_t v40 = v21;
    id v30 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Account lookup request complete with accountID: %{public}@ for askToBuy: %ld",  buf,  0x2Au);
  }
}

@end