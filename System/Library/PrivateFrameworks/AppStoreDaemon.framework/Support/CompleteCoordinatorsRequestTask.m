@interface CompleteCoordinatorsRequestTask
- (void)main;
@end

@implementation CompleteCoordinatorsRequestTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v4 = ASDLogHandleForCategory(29LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      error = self->super.super._error;
    }
    else {
      error = 0LL;
    }
    v7 = error;
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    __int16 v25 = 2114;
    v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%@] Checking for incomplete coordinators at request of: %{public}@",  buf,  0x16u);
  }

  v8 = objc_alloc_init(&OBJC_CLASS___CompleteRestoreCoordinatorsTask);
  v10 = v8;
  if (v8) {
    objc_setProperty_nonatomic_copy(v8, v9, v3, 48LL);
  }
  if (self) {
    v11 = self->super.super._error;
  }
  else {
    v11 = 0LL;
  }
  v12 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v12, "clientID"));
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v13, v14, 40LL);
  }

  if (self) {
    v15 = self->super.super._error;
  }
  else {
    v15 = 0LL;
  }
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSError clientID](v16, "clientID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Restore applications request for client %@",  v17));
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v18, v19, 56LL);
  }

  id v20 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)v21;
  if (v21) {
    [*(id *)(v21 + 8) addOperation:v10];
  }

  if (self) {
    LOBYTE(self->super.super._keepAlive) = 1;
  }
}

@end