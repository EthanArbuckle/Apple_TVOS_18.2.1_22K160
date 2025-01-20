@interface ExternalManifestRequestTask
- (void)main;
@end

@implementation ExternalManifestRequestTask

- (void)main
{
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v4 = response;
  v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v6 = qos_class_self();
  uint64_t v7 = ASDLogHandleForCategory(41LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse manifestURL](v4, "manifestURL"));
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v11 = error;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v11, "clientID"));
    v13 = sub_10027010C(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138413314;
    v41 = v5;
    __int16 v42 = 2114;
    v43 = v9;
    __int16 v44 = 2114;
    v45 = v12;
    __int16 v46 = 2114;
    v47 = v14;
    __int16 v48 = 1024;
    int v49 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Manifest for UPP: %{public}@ clientID: %{public}@ qoS: %{public}@ (0x%x)",  buf,  0x30u);
  }

  v15 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
  v16 = objc_alloc(&OBJC_CLASS___UPPManifestDownloadTask);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse manifestURL](v4, "manifestURL"));
  v18 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = sub_1001BFDF0( (char *)v16,  v17,  v19,  (char)-[ASDRequestResponse shouldHideUserPrompts](v4, "shouldHideUserPrompts"));

  if (v20) {
    objc_setProperty_atomic(v20, v21, v5, 90LL);
  }
  if (self) {
    v22 = self->super.super._error;
  }
  else {
    v22 = 0LL;
  }
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v23, "clientID"));
  v26 = v24;
  if (v20)
  {
    objc_setProperty_atomic(v20, v25, v24, 82LL);

    *(_DWORD *)(v20 + 78) = v6;
  }

  else
  {
  }

  v39 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  if (v15) {
    -[NSOperationQueue addOperations:waitUntilFinished:]( v15->_operationQueue,  "addOperations:waitUntilFinished:",  v27,  1LL);
  }

  if (v20) {
    id Property = objc_getProperty(v20, v28, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v30 = Property;
  id v31 = objc_alloc(&OBJC_CLASS___ASDExternalManifestResponse);
  if (v30) {
    id v32 = [v31 initWithError:v30];
  }
  else {
    id v32 = [v31 initWithResults:&__NSArray0__struct];
  }
  v33 = v32;
  sub_1001BA9FC(self, v32);
  if (v20)
  {
    char v35 = v20[24] & 1;
    if (!self) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  char v35 = 0;
  if (self) {
LABEL_22:
  }
    LOBYTE(self->super.super._keepAlive) = v35;
LABEL_23:
  if (v20) {
    id v36 = objc_getProperty(v20, v34, 32LL, 1);
  }
  else {
    id v36 = 0LL;
  }
  id v38 = v36;
  if (self) {
    objc_setProperty_atomic_copy(self, v37, v38, 32LL);
  }
}

@end