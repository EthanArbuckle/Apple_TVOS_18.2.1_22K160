@interface GTURLAccessProviderXPCDispatcher
- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)makeURL_:(id)a3 replyConnection:(id)a4;
- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)urlForPath_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTURLAccessProviderXPCDispatcher

- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protocolMethods]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTURLAccessProviderXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, "initWithProtocolMethods:", v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSURL);
  nsobject = xpc_dictionary_get_nsobject(v6, "identifier", v8);
  size_t length = 0LL;
  data = (__int128 *)xpc_dictionary_get_data(v6, "auditToken", &length);
  if (data && length == 32)
  {
    __int128 v11 = data[1];
    __int128 v24 = *data;
    __int128 v25 = v11;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);
    xpc_connection_get_audit_token(v12, &v24);
  }

  xpc_object_t reply = gt_xpc_dictionary_create_reply(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(reply);
  service = self->_service;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100009194;
  v18[3] = &unk_100030968;
  id v19 = v7;
  id v20 = v14;
  __int128 v21 = v24;
  __int128 v22 = v25;
  id v16 = v14;
  id v17 = v7;
  -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:]( service,  "securityScopedURLFromSandboxID:completionHandler:",  nsobject,  v18);
}

- (void)makeURL_:(id)a3 replyConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(xdict);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSURL);
  nsobject = xpc_dictionary_get_nsobject(xdict, "url", v9);
  if (nsobject)
  {
    string = xpc_dictionary_get_string(xdict, "sandboxExtension");
    if (string)
    {
      v12 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", string, strlen(string) + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      _CFURLAttachSecurityScopeToFileURL(nsobject, v13);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider makeURL:](self->_service, "makeURL:", nsobject));
    if (([v6 isTrusted] & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v14,  1LL));
      [v15 setHost:@"localhost"];
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 URL]);

      v14 = (void *)v16;
    }

    xpc_dictionary_set_nsobject(v8, "identifier", (uint64_t)v14);
  }

  [v6 sendMessage:v8];
}

- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSURL);
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v10);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    service = self->_service;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100009518;
    v16[3] = &unk_100030990;
    id v17 = v9;
    id v18 = v6;
    -[GTURLAccessProvider transferIdentifier:toDevice:completionHandler:]( service,  "transferIdentifier:toDevice:completionHandler:",  nsobject,  v14,  v16);
  }

  else
  {
    [v6 sendMessage:v9];
  }
}

- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSURL);
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v10);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v14 = (void *)v13;
    service = self->_service;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100009768;
    v18[3] = &unk_1000309B8;
    id v19 = v9;
    id v20 = v6;
    -[GTURLAccessProvider copyIdentifier:toDevice:completionHandler:]( service,  "copyIdentifier:toDevice:completionHandler:",  nsobject,  v14,  v18);
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTURLAccessProviderXPCDispatcher",  @"Invalid device UDID passed to copyIdentifier"));
    __int128 v22 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v17));

    xpc_dictionary_set_nserror(v9, "error", v14);
    [v6 sendMessage:v9];
  }
}

- (void)urlForPath_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t reply = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
  string = xpc_dictionary_get_string(v7, "path");

  if (string
    && (uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string))) != 0)
  {
    v12 = (void *)v11;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider urlForPath:](self->_service, "urlForPath:", v11));
    unsigned int v14 = [v13 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(v9, "result", (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
    xpc_connection_get_audit_token(v15, v22);

    uint64_t v16 = APP_SANDBOX_READ;
    id v17 = v13;
    id v18 = [v17 fileSystemRepresentation];
    v21[0] = v22[0];
    v21[1] = v22[1];
    id v19 = (const char *)sandbox_extension_issue_file_to_process(v16, v18, SANDBOX_EXTENSION_DEFAULT, v21);
    if (v19)
    {
      id v20 = (char *)v19;
      xpc_dictionary_set_string(v9, "sandboxExtension", v19);
      free(v20);
    }

    if (v14) {
      [v17 stopAccessingSecurityScopedResource];
    }
    [v6 sendMessage:v9];
  }

  else
  {
    [v6 sendMessage:v9];
  }
}

- (void).cxx_destruct
{
}

@end