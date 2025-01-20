@interface AKAuthenticationContextSanitizer
- (AKAccountManager)accountManager;
- (AKAuthenticationContextSanitizer)init;
- (AKDevice)device;
- (BOOL)_sanitizeContext:(id)a3;
- (BOOL)_validateAppleIDAuthContext:(id)a3;
- (BOOL)_validateAppleIDAuthContext:(id)a3 forAuthMode:(unint64_t)a4;
- (BOOL)_validateAuthContext:(id)a3;
- (BOOL)_validateFederatedAppleIDAuthContext:(id)a3;
- (BOOL)_validateNativeAppleIDAuthContext:(id)a3;
- (BOOL)_validateSilentPreferredFederatedAppleIDAuthContext:(id)a3;
- (BOOL)sanitizeContext:(id)a3;
- (id)_accountForAppleIDAuthContext:(id)a3;
- (void)_annotateTransformationOfProperty:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (void)setAccountManager:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation AKAuthenticationContextSanitizer

- (AKAuthenticationContextSanitizer)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKAuthenticationContextSanitizer;
  v2 = -[AKAuthenticationContextSanitizer init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    device = v2->_device;
    v2->_device = (AKDevice *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.akd.context-validator", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (BOOL)sanitizeContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A86C;
  block[3] = &unk_1001C9158;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (AKAccountManager)accountManager
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10006A954;
  v10 = sub_10006A964;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10006A96C;
  v5[3] = &unk_1001C7A08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AKAccountManager *)v3;
}

- (void)setAccountManager:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006A9FC;
  block[3] = &unk_1001C6538;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (AKDevice)device
{
  uint64_t v6 = 0LL;
  dispatch_queue_attr_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10006A954;
  v10 = sub_10006A964;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10006AABC;
  v5[3] = &unk_1001C7A08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AKDevice *)v3;
}

- (void)setDevice:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006AB4C;
  block[3] = &unk_1001C6538;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)_sanitizeContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  transformationAnnotations = self->_transformationAnnotations;
  self->_transformationAnnotations = v5;

  BOOL v7 = -[AKAuthenticationContextSanitizer _validateAuthContext:](self, "_validateAuthContext:", v4);
  id v8 = self->_transformationAnnotations;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006AC00;
  v10[3] = &unk_1001C7618;
  v10[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v10);
  return v7;
}

- (BOOL)_validateAuthContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Validating authentication context (%@)",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationContext, v7);
  id v9 = v4;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) == 0)
  {

    goto LABEL_8;
  }

  if (!v9)
  {
LABEL_8:
    id v11 = 0LL;
    goto LABEL_9;
  }

  unsigned int v10 = -[AKAuthenticationContextSanitizer _validateAppleIDAuthContext:](self, "_validateAppleIDAuthContext:", v9);
  id v11 = v9;
  if (v10)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }

  BOOL v12 = 0;
  id v11 = v9;
LABEL_10:

  return v12;
}

- (BOOL)_validateAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[AKAuthenticationContextSanitizer _validateAppleIDAuthContext:forAuthMode:]( self,  "_validateAppleIDAuthContext:forAuthMode:",  v4,  [v4 authenticationMode]);

  return (char)self;
}

- (BOOL)_validateAppleIDAuthContext:(id)a3 forAuthMode:(unint64_t)a4
{
  id v6 = a3;
  if (!a4) {
    goto LABEL_5;
  }
  if (a4 != 2)
  {
    if (a4 == 1
      && !-[AKAuthenticationContextSanitizer _validateNativeAppleIDAuthContext:]( self,  "_validateNativeAppleIDAuthContext:",  v6))
    {
      goto LABEL_5;
    }

- (BOOL)_validateNativeAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  if ([v4 authenticationType] == (id)3)
  {
    -[AKAuthenticationContextSanitizer _annotateTransformationOfProperty:fromValue:toValue:]( self,  "_annotateTransformationOfProperty:fromValue:toValue:",  @"authenticationType",  @"InteractiveUsernameOnly",  @"Interactive");
    [v4 setAuthenticationType:2];
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 companionDevice]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueDeviceIdentifier]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueDeviceIdentifier]);
  unsigned int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    uint64_t v11 = _AKLogSystem(v10);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring companion device and proceeding with silent auth",  v14,  2u);
    }

    [v4 setCompanionDevice:0];
  }

  return 1;
}

- (BOOL)_validateFederatedAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authenticationType];
  if (v5 == (id)2)
  {
    -[AKAuthenticationContextSanitizer _annotateTransformationOfProperty:fromValue:toValue:]( self,  "_annotateTransformationOfProperty:fromValue:toValue:",  @"authenticationType",  @"Interactive",  @"InteractiveUsernameOnly");
    [v4 setAuthenticationType:3];
  }

  else if (!v5 {
         && !-[AKAuthenticationContextSanitizer _validateSilentPreferredFederatedAppleIDAuthContext:]( self,  "_validateSilentPreferredFederatedAppleIDAuthContext:",  v4))
  }
  {
    BOOL v6 = 0;
    goto LABEL_10;
  }

  if ([v4 authenticationType] == (id)3
    && -[AKDevice isMultiUserMode](self->_device, "isMultiUserMode"))
  {
    -[AKAuthenticationContextSanitizer _annotateTransformationOfProperty:fromValue:toValue:]( self,  "_annotateTransformationOfProperty:fromValue:toValue:",  @"authenticationType",  @"InteractiveUsernameOnly",  @"Interactive");
    [v4 setAuthenticationType:2];
  }

  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_validateSilentPreferredFederatedAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationContextSanitizer _accountForAppleIDAuthContext:]( self,  "_accountForAppleIDAuthContext:",  v4));
  if (!v5
    || (BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager continuationTokenForAccount:]( self->_accountManager,  "continuationTokenForAccount:",  v5)),  v6,  !v6)
    || (BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 proxiedDevice]), v7, v7))
  {
    -[AKAuthenticationContextSanitizer _annotateTransformationOfProperty:fromValue:toValue:]( self,  "_annotateTransformationOfProperty:fromValue:toValue:",  @"authenticationType",  @"SilentPreferred",  @"InteractiveUsernameOnly");
    [v4 setAuthenticationType:3];
  }

  return 1;
}

- (id)_accountForAppleIDAuthContext:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccount:&v11]);
  id v6 = v11;
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = _AKLogSystem(v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@: Failed to retrieve AuthKit account for context (%@) with error: %@",  buf,  0x20u);
    }
  }

  return v5;
}

- (void)_annotateTransformationOfProperty:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", a4, a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_transformationAnnotations,  "setObject:forKeyedSubscript:",  v9,  v8);
}

- (void).cxx_destruct
{
}

@end