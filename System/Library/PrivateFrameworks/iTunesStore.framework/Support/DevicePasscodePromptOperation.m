@interface DevicePasscodePromptOperation
- (DevicePasscodePromptOperation)initWithTitle:(id)a3 message:(id)a4;
- (id)tokenBlock;
- (int64_t)_keyboardType;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)run;
- (void)setTokenBlock:(id)a3;
@end

@implementation DevicePasscodePromptOperation

- (DevicePasscodePromptOperation)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___DevicePasscodePromptOperation;
  v8 = -[DevicePasscodePromptOperation init](&v27, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___ISDialog);
    dialog = v8->_dialog;
    v8->_dialog = v9;

    -[ISDialog setMessage:](v8->_dialog, "setMessage:", v7);
    -[ISDialog setTitle:](v8->_dialog, "setTitle:", v6);
    v24 = objc_alloc(&OBJC_CLASS___NSArray);
    id v25 = v7;
    id v26 = v6;
    v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"PASSCODE_CANCEL" value:&stru_10035EB18 table:@"Mesa"]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v13));
    v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___ISDialog));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"PASSCODE_OK" value:&stru_10035EB18 table:@"Mesa"]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v17));
    v19 = -[NSArray initWithObjects:](v24, "initWithObjects:", v14, v18, 0LL);

    -[ISDialog setButtons:](v8->_dialog, "setButtons:", v19);
    -[ISDialog setDefaultButtonIndex:](v8->_dialog, "setDefaultButtonIndex:", 1LL);
    id v20 = objc_alloc_init(&OBJC_CLASS___ISDialogTextField);
    objc_msgSend(v20, "setKeyboardType:", -[DevicePasscodePromptOperation _keyboardType](v8, "_keyboardType"));
    [v20 setSecure:1];
    v21 = v8->_dialog;
    id v28 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    -[ISDialog setTextFields:](v21, "setTextFields:", v22);

    id v6 = v26;
    id v7 = v25;
  }

  return v8;
}

- (void)setTokenBlock:(id)a3
{
  id v6 = a3;
  -[DevicePasscodePromptOperation lock](self, "lock");
  if (self->_tokenBlock != v6)
  {
    id v4 = [v6 copy];
    id tokenBlock = self->_tokenBlock;
    self->_id tokenBlock = v4;
  }

  -[DevicePasscodePromptOperation unlock](self, "unlock");
}

- (id)tokenBlock
{
  id v3 = [self->_tokenBlock copy];
  -[DevicePasscodePromptOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)run
{
  id v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  passcodeEntrySemaphore = self->_passcodeEntrySemaphore;
  self->_passcodeEntrySemaphore = v3;

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  id v5 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePINEntryViewController"];
  id v6 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
  id v7 = objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000E1904;
  v31[3] = &unk_10034E100;
  v31[4] = self;
  v31[5] = &v32;
  id v8 = [[BSAction alloc] initWithInfo:v7 timeout:0 forResponseOnQueue:v31 withHandler:0.0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
  [v6 setActions:v9];

  id v10 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v5,  v6);
  v11 = v10;
  if (v10)
  {
    [v10 addObserver:self];
    [v11 activateWithContext:0];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_passcodeEntrySemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v12 = 0LL;
    uint64_t v13 = 3LL;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[ISDialogOperation operationWithDialog:]( &OBJC_CLASS___ISDialogOperation,  "operationWithDialog:",  self->_dialog));
    id v30 = 0LL;
    unsigned int v15 = -[DevicePasscodePromptOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v30);
    id v12 = v30;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 selectedButton]);
      if (v16)
      {
        id v28 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ISDialog buttons](self->_dialog, "buttons"));
        id v18 = [v17 indexOfObjectIdenticalTo:v28];

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v14 textFieldValues]);
          if ([v19 count] == (id)1)
          {
            id v20 = objc_claimAutoreleasedReturnValue([v19 objectAtIndex:0]);
            id v21 = [v20 UTF8String];
            v33[3] = (uint64_t)v21;

            uint64_t v13 = 3LL;
          }

          else
          {
            uint64_t v13 = 2LL;
          }
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        v16 = v28;
      }

      else
      {
        uint64_t v13 = 0LL;
      }
    }

    else
    {
      uint64_t v13 = 3LL;
    }
  }

  if (v33[3])
  {
    size_t v29 = 1024LL;
    v22 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 1024LL);
    v23 = (const char *)v33[3];
    int v24 = strlen(v23);
    id v25 = v22;
    if (sub_1001AE98C(0, (uint64_t)v23, v24, 0, -[NSMutableData mutableBytes](v25, "mutableBytes"), &v29))
    {

      id v25 = 0LL;
      uint64_t v13 = 2LL;
    }

    else
    {
      -[NSMutableData setLength:](v25, "setLength:", v29);
      uint64_t v13 = 1LL;
    }
  }

  else
  {
    id v25 = 0LL;
  }

  -[DevicePasscodePromptOperation setError:](self, "setError:", v12);
  -[DevicePasscodePromptOperation setSuccess:](self, "setSuccess:", v13 == 1);
  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[DevicePasscodePromptOperation tokenBlock](self, "tokenBlock"));
  objc_super v27 = (void *)v26;
  if (v26) {
    (*(void (**)(uint64_t, uint64_t, NSMutableData *, id))(v26 + 16))(v26, v13, v25, v12);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (int64_t)_keyboardType
{
  id v2 = objc_msgSend((id)ISWeakLinkedClassForString(@"MCProfileConnection", 17), "sharedConnection");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int64_t v4 = 4 * ([v3 unlockScreenType] < 2);

  return v4;
}

- (void).cxx_destruct
{
}

@end