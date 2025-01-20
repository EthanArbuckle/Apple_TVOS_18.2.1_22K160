@interface RestoreApplicationsRequestTask
- (void)main;
@end

@implementation RestoreApplicationsRequestTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v5 = response;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse items](v5, "items"));

  uint64_t v7 = ASDLogHandleForCategory(29LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 count];
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v11 = error;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v11, "clientID"));
    *(_DWORD *)buf = 138412802;
    v52 = v3;
    __int16 v53 = 2048;
    id v54 = v9;
    __int16 v55 = 2114;
    v56 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Restoring %ld app(s) for client: %{public}@",  buf,  0x20u);
  }

  if (self) {
    v13 = self->super._response;
  }
  else {
    v13 = 0LL;
  }
  v14 = v13;
  unsigned int v15 = -[ASDRequestResponse createsPlaceholders](v14, "createsPlaceholders");

  if (v15)
  {
    if ([v6 count])
    {
      id v16 = [[ASDCreatePlaceholdersRequestOptions alloc] initWithApplicationMetadata:v6];
      if (self) {
        v17 = self->super._response;
      }
      else {
        v17 = 0LL;
      }
      v18 = v17;
      objc_msgSend( v16,  "setCompleteDataPromise:",  -[ASDRequestResponse completeDataPromise](v18, "completeDataPromise"));

      if (os_variant_has_internal_content("com.apple.appstored"))
      {
        if (self) {
          v19 = self->super._response;
        }
        else {
          v19 = 0LL;
        }
        v20 = v19;
        objc_msgSend( v16,  "setCreateAsMobileBackup:",  -[ASDRequestResponse createAsMobileBackup](v20, "createAsMobileBackup"));
      }

      v21 = objc_alloc(&OBJC_CLASS___CreatePlaceholdersRequestTask);
      if (self) {
        v22 = self->super.super._error;
      }
      else {
        v22 = 0LL;
      }
      v23 = v22;
      id v24 = -[CreatePlaceholdersRequestTask initForClient:withOptions:](v21, "initForClient:withOptions:", v23, v16);

      id v50 = 0LL;
      -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v24, &v50);
      v25 = (_TtC9appstored6LogKey *)v50;
      if (v25)
      {
        uint64_t v26 = ASDLogHandleForCategory(29LL);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v52 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Error creating coordinators error: %{public}@",  buf,  0xCu);
        }
      }
    }

    else
    {
      uint64_t v28 = ASDLogHandleForCategory(29LL);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "No items to restore", buf, 2u);
      }

      v25 = 0LL;
    }
  }

  else
  {
    v25 = 0LL;
  }

  if (self) {
    v29 = self->super._response;
  }
  else {
    v29 = 0LL;
  }
  v30 = v29;
  unsigned int v31 = -[ASDRequestResponse skipCoordinatorCompletion](v30, "skipCoordinatorCompletion");

  if (v31)
  {
    uint64_t v32 = ASDLogHandleForCategory(29LL);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Skipping coordinator completion", buf, 2u);
    }
  }

  else
  {
    v33 = objc_alloc_init(&OBJC_CLASS___CompleteRestoreCoordinatorsTask);
    if (self) {
      v34 = self->super.super._error;
    }
    else {
      v34 = 0LL;
    }
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v35, "clientID"));
    v38 = v36;
    if (v33)
    {
      objc_setProperty_nonatomic_copy(v33, v37, v36, 40LL);

      objc_setProperty_nonatomic_copy(v33, v39, v3, 48LL);
    }

    else
    {
    }

    if (self) {
      v40 = self->super.super._error;
    }
    else {
      v40 = 0LL;
    }
    v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v41, "clientID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Restore applications request for client %@",  v42));
    if (v33) {
      objc_setProperty_nonatomic_copy(v33, v43, v44, 56LL);
    }

    id v45 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)v46;
    if (v46) {
      [*(id *)(v46 + 8) addOperation:v33];
    }
  }

  id v48 = [[ASDRestoreApplicationsRequestResponse alloc] initWithResults:&__NSArray0__struct];
  sub_1001BA9FC(self, v48);

  if (self)
  {
    LOBYTE(self->super.super._keepAlive) = v25 == 0LL;
    objc_setProperty_atomic_copy(self, v49, v25, 32LL);
  }
}

@end