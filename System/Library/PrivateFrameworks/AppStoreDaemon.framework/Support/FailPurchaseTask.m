@interface FailPurchaseTask
- (void)main;
@end

@implementation FailPurchaseTask

- (void)main
{
  if (-[NSError discoveredUpdate](self->super._error, "discoveredUpdate"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));

    if (v3)
    {
      *(void *)v49 = 0LL;
      *(void *)&v49[8] = v49;
      *(void *)&v49[16] = 0x2020000000LL;
      LOBYTE(v50) = 1;
      id v4 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1002B07F4;
      v46[3] = &unk_1003EE318;
      v46[4] = self;
      v46[5] = v49;
      [v5 modifyUsingTransaction:v46];

      if (*(_BYTE *)(*(void *)&v49[8] + 24LL))
      {
        uint64_t v6 = ASDLogHandleForCategory(25LL);
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError logKey](self->super._error, "logKey"));
          *(_DWORD *)buf = 138412290;
          v48 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] Resetting update after purchase failed",  buf,  0xCu);
        }

        id v9 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError logKey](self->super._error, "logKey"));
        sub_1002384B8(v10, v11, v12);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError logKey](self->super._error, "logKey"));
      [v13 noteUpdatesStateChanged:@"Purchase Failure" logKey:v14];

      _Block_object_dispose(v49, 8);
    }
  }

  if (-[NSError generatedVendorID](self->super._error, "generatedVendorID"))
  {
    uint64_t v15 = ASDLogHandleForCategory(25LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSError logKey](self->super._error, "logKey"));
      *(_DWORD *)v49 = 138412290;
      *(void *)&v49[4] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] Removing generated vendor identifier",  v49,  0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSError vendorName](self->super._error, "vendorName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));
      [v18 removeDeviceIdentifierForVendorName:v20 bundleIdentifier:v21];
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSError temporaryBundleID](self->super._error, "temporaryBundleID"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSError vendorName](self->super._error, "vendorName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSError temporaryBundleID](self->super._error, "temporaryBundleID"));
      [v18 removeDeviceIdentifierForVendorName:v23 bundleIdentifier:v24];
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSError coordinator](self->super._error, "coordinator"));
  BOOL v26 = v25 == 0LL;

  if (!v26)
  {
    id v27 = *(id *)&self->super._success;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
    unsigned __int8 v29 = [v28 isEqualToString:IXUserPresentableErrorDomain];

    if ((v29 & 1) == 0)
    {
      uint64_t v30 = IXCreateUserPresentableError(1LL, 0LL, *(void *)&self->super._success);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

      id v27 = (id)v31;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSError coordinator](self->super._error, "coordinator"));
    uint64_t v33 = ASDErrorWithSafeUserInfo(v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v45 = 0LL;
    char v35 = sub_1001E59A0(v32, v34, &v45);
    id v36 = v45;

    if ((v35 & 1) == 0)
    {
      uint64_t v37 = ASDLogHandleForCategory(25LL);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSError logKey](self->super._error, "logKey"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSError coordinator](self->super._error, "coordinator"));
        *(_DWORD *)v49 = 138412802;
        *(void *)&v49[4] = v43;
        *(_WORD *)&v49[12] = 2114;
        *(void *)&v49[14] = v44;
        *(_WORD *)&v49[22] = 2114;
        id v50 = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "[%@] Canceling coordinator: %{public}@ failed: %{public}@",  v49,  0x20u);
      }
    }
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));

  if (v39)
  {
    id v40 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSError bundleID](self->super._error, "bundleID"));
    sub_1002B0F20((uint64_t)v41, v42);
  }

  -[Task completeWithSuccess](self, "completeWithSuccess");
}

- (void).cxx_destruct
{
}

@end