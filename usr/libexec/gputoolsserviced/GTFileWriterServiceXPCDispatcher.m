@interface GTFileWriterServiceXPCDispatcher
- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTFileWriterServiceXPCDispatcher

- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTFileWriterServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      service = self->_service;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10000DF50;
      v25[3] = &unk_100030AD0;
      id v26 = v9;
      id v27 = v7;
      -[GTFileWriterService initiateTransfer:basePath:fromDevice:options:completionHandler:]( service,  "initiateTransfer:basePath:fromDevice:options:completionHandler:",  nsarray,  v14,  v17,  nsobject,  v25);
    }

    else
    {
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid device UDID passed to initiateTransfer"));
      v29 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v24));

      xpc_dictionary_set_nserror(v9, "error", v17);
      [v7 sendMessage:v9];
    }
  }

  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid path passed to initiateTransfer"));
    v31 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v22));

    xpc_dictionary_set_nserror(v9, "error", v14);
    [v7 sendMessage:v9];
  }
}

- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      service = self->_service;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10000E2C4;
      v25[3] = &unk_1000309B8;
      id v26 = v9;
      id v27 = v7;
      -[GTFileWriterService startTransfer:basePath:fromDevice:options:completionHandler:]( service,  "startTransfer:basePath:fromDevice:options:completionHandler:",  nsarray,  v14,  v17,  nsobject,  v25);
    }

    else
    {
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid device UDID passed to startTransfer"));
      v29 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v24));

      xpc_dictionary_set_nserror(v9, "error", v17);
      [v7 sendMessage:v9];
    }
  }

  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid path passed to startTransfer"));
    v31 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v22));

    xpc_dictionary_set_nserror(v9, "error", v14);
    [v7 sendMessage:v9];
  }
}

- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___GTFileEntry);
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v10);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    v15 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v15
      && (uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15))) != 0)
    {
      v17 = (void *)v16;
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___GTFileTransferOptions);
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v18);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "sessionID");
      service = self->_service;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000E680;
      v26[3] = &unk_100030AD0;
      id v27 = v9;
      id v28 = v7;
      -[GTFileWriterService beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:]( service,  "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:",  nsarray,  v14,  v17,  nsobject,  uint64,  v26);
    }

    else
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid device UDID passed to beginTransferSessionWithFileEntries"));
      NSErrorUserInfoKey v30 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v25));

      xpc_dictionary_set_nserror(v9, "error", v17);
      [v7 sendMessage:v9];
    }
  }

  else
  {
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterServiceXPCDispatcher",  @"Invalid path passed to beginTransferSessionWithFileEntries"));
    v32 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v23));

    xpc_dictionary_set_nserror(v9, "error", v14);
    [v7 sendMessage:v9];
  }
}

- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(v7, "data");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "sessionID");
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(reply);

  service = self->_service;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E7B0;
  v15[3] = &unk_100030AD0;
  id v16 = v11;
  id v17 = v6;
  id v13 = v6;
  id v14 = v11;
  -[GTFileWriterService writeFileData:sessionID:completionHandler:]( service,  "writeFileData:sessionID:completionHandler:",  nsdata_nocopy,  uint64,  v15);
}

- (void).cxx_destruct
{
}

@end