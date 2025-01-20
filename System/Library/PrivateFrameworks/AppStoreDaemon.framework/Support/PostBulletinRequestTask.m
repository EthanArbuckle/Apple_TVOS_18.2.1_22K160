@interface PostBulletinRequestTask
- (void)main;
@end

@implementation PostBulletinRequestTask

- (void)main
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_opt_class(self, v3);
    id v5 = v4;
    if (self) {
      response = self->super._response;
    }
    else {
      response = 0LL;
    }
    v7 = response;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse title](v7, "title"));
    if (self) {
      v9 = self->super._response;
    }
    else {
      v9 = 0LL;
    }
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse message](v10, "message"));
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v13 = error;
    int v60 = 138413058;
    v61 = v4;
    __int16 v62 = 2112;
    v63 = v8;
    __int16 v64 = 2112;
    v65 = v11;
    __int16 v66 = 2112;
    v67 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[%@]: Posting bulletin with title: %@ message: %@ for client %@",  (uint8_t *)&v60,  0x2Au);
  }

  if (self) {
    v14 = self->super._response;
  }
  else {
    v14 = 0LL;
  }
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse title](v15, "title"));
  if (self) {
    v17 = self->super._response;
  }
  else {
    v17 = 0LL;
  }
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse message](v18, "message"));
  id v20 = sub_10026F960((uint64_t)&OBJC_CLASS___Bulletin, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (self) {
    v22 = self->super._response;
  }
  else {
    v22 = 0LL;
  }
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse actionButtonTitle](v23, "actionButtonTitle"));

  if (v24)
  {
    if (self) {
      v25 = self->super._response;
    }
    else {
      v25 = 0LL;
    }
    v26 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse actionButtonTitle](v26, "actionButtonTitle"));
    if (v21) {
      objc_setProperty_nonatomic_copy(v21, v27, v28, 8LL);
    }
  }

  if (self) {
    v29 = self->super._response;
  }
  else {
    v29 = 0LL;
  }
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse actionButtonURL](v30, "actionButtonURL"));

  if (v31)
  {
    if (self) {
      v32 = self->super._response;
    }
    else {
      v32 = 0LL;
    }
    v33 = v32;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse actionButtonURL](v33, "actionButtonURL"));
    if (v21) {
      objc_setProperty_nonatomic_copy(v21, v34, v35, 16LL);
    }
  }

  if (self) {
    v36 = self->super._response;
  }
  else {
    v36 = 0LL;
  }
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse creationDate](v37, "creationDate"));

  if (v38)
  {
    if (self) {
      v39 = self->super._response;
    }
    else {
      v39 = 0LL;
    }
    v40 = v39;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse creationDate](v40, "creationDate"));
    if (v21) {
      objc_setProperty_nonatomic_copy(v21, v41, v42, 32LL);
    }
  }

  if (self) {
    v43 = self->super._response;
  }
  else {
    v43 = 0LL;
  }
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse launchURL](v44, "launchURL"));

  if (v45)
  {
    if (self) {
      v46 = self->super._response;
    }
    else {
      v46 = 0LL;
    }
    v47 = v46;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse launchURL](v47, "launchURL"));
    if (v21) {
      objc_setProperty_nonatomic_copy(v21, v48, v49, 24LL);
    }
  }

  if (self) {
    v50 = self->super._response;
  }
  else {
    v50 = 0LL;
  }
  v51 = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse recordID](v51, "recordID"));

  if (v52)
  {
    if (self) {
      v53 = self->super._response;
    }
    else {
      v53 = 0LL;
    }
    v54 = v53;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse recordID](v54, "recordID"));
    if (v21) {
      objc_setProperty_nonatomic_copy(v21, v55, v56, 56LL);
    }
  }

  id v57 = sub_1003085D4((uint64_t)&OBJC_CLASS___UserNotificationManager);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  sub_100308670(v58, v21);

  if (self)
  {
    LOBYTE(self->super.super._keepAlive) = 1;
    objc_setProperty_atomic_copy(self, v59, 0LL, 32LL);
  }
}

@end