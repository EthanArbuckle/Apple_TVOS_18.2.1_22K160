@interface SDAppleIDServerTask
- (BOOL)_isTaskInfoValid;
- (BOOL)activated;
- (BOOL)invalidated;
- (NSDictionary)taskInfo;
- (NSString)appleID;
- (NSString)gsToken;
- (NSURLRequest)urlRequest;
- (NSURLSession)session;
- (OS_dispatch_queue)dispatchQueue;
- (SDAppleIDServerTask)initWithType:(int64_t)a3 appleID:(id)a4 info:(id)a5;
- (id)_parseCreateCertificateResponse:(id)a3 error:(int *)a4;
- (id)_parseFetchCertificateResponse:(id)a3 error:(int *)a4;
- (id)_parseFindPersonResponse:(id)a3 error:(int *)a4;
- (id)_parseGetMyInfoResponse:(id)a3 error:(int *)a4;
- (id)_parseServerResponse:(id)a3 error:(int *)a4;
- (id)description;
- (id)responseHandler;
- (int64_t)type;
- (void)_activate;
- (void)_callResponseHandlerWithInfo:(id)a3 error:(int)a4;
- (void)_callResponseHandlerWithInfo:(id)a3 errorInfo:(id)a4 error:(int)a5;
- (void)_handleGSTokenIsAvailable;
- (void)_handleServerError:(int64_t)a3 withStatusCode:(int64_t)a4 nextSuggestedAttemptDelay:(int64_t)a5;
- (void)_handleTaskResponse:(id)a3 withData:(id)a4 error:(int)a5;
- (void)_handleURLIsAvailable:(id)a3 error:(int)a4 completion:(id)a5;
- (void)_handleURLRequestIsAvailable;
- (void)_invalidate;
- (void)_sendRequest;
- (void)_urlRequestWithCompletion:(id)a3;
- (void)_urlWithCompletion:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setActivated:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGsToken:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setUrlRequest:(id)a3;
@end

@implementation SDAppleIDServerTask

- (SDAppleIDServerTask)initWithType:(int64_t)a3 appleID:(id)a4 info:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SDAppleIDServerTask;
  v11 = -[SDAppleIDServerTask init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appleID, a4);
    uint64_t v15 = SFMainQueue(v13, v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v12->_taskInfo, a5);
    v12->_type = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    [v18 setTimeoutIntervalForResource:3600.0];
    objc_msgSend(v18, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleAIDCService);
    id v19 = [[AKAppleIDSession alloc] initWithIdentifier:@"com.apple.coreservices.appleidauthagent"];
    [v18 setWaitsForConnectivity:1];
    objc_msgSend(v18, "set_appleIDContext:", v19);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v18));
    session = v12->_session;
    v12->_session = (NSURLSession *)v20;
  }

  return v12;
}

- (id)description
{
  id v3 = 0LL;
  NSAppendPrintF(&v3, "-- SDAppleIDServerTask --\n");
  return v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A54D0;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_callResponseHandlerWithInfo:(id)a3 errorInfo:(id)a4 error:(int)a5
{
  id v12 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask responseHandler](self, "responseHandler"));

  if (v9)
  {
    if (a5) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAppleIDErrorDomain,  a5,  v8));
    }
    else {
      id v10 = 0LL;
    }
    v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SDAppleIDServerTask responseHandler]( self,  "responseHandler"));
    ((void (**)(void, id, void *))v11)[2](v11, v12, v10);

    -[SDAppleIDServerTask setResponseHandler:](self, "setResponseHandler:", 0LL);
  }
}

- (void)_callResponseHandlerWithInfo:(id)a3 error:(int)a4
{
}

- (BOOL)_isTaskInfoValid
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
  id v4 = [v3 count];

  switch(-[SDAppleIDServerTask type](self, "type"))
  {
    case 0LL:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v6 = v5;
      v7 = @"csr";
      goto LABEL_9;
    case 1LL:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v6 = v5;
      v7 = @"certificateToken";
LABEL_9:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);

      if (!v8) {
        goto LABEL_43;
      }
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
      char isKindOfClass = objc_opt_isKindOfClass(v8, v10);
      goto LABEL_42;
    case 2LL:
      if (v4 != (id)2) {
        goto LABEL_40;
      }
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"serialNumber"]);

      if (!v8) {
        goto LABEL_43;
      }
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
      if ((objc_opt_isKindOfClass(v8, v14) & 1) == 0) {
        goto LABEL_43;
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"clientAidvrId"]);

      if (!v16) {
        goto LABEL_40;
      }
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
      char isKindOfClass = objc_opt_isKindOfClass(v16, v18);
      goto LABEL_37;
    case 3LL:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      id v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v20) {
        goto LABEL_26;
      }
      id v22 = v20;
      uint64_t v23 = *(void *)v37;
      break;
    default:
      if (dword_1006429A8 <= 60
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
      {
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _isTaskInfoValid]",  60LL,  "### Unhandled type %d\n",  -[SDAppleIDServerTask type](self, "type"));
      }

      goto LABEL_40;
  }

  while (2)
  {
    for (i = 0LL; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v37 != v23) {
        objc_enumerationMutation(v19);
      }
      uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v21);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0
        || ![&off_1005FAE08 containsObject:v25])
      {

LABEL_40:
        char isKindOfClass = 0;
        goto LABEL_41;
      }
    }

    id v22 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22) {
      continue;
    }
    break;
  }

- (void)_urlWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_1006429A8 <= 30
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _urlWithCompletion:]",  30LL,  "Getting a url from AuthKit url bag...");
    }

    int64_t v5 = -[SDAppleIDServerTask type](self, "type");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A5AF4;
    block[3] = &unk_1005CD440;
    int64_t v10 = v5;
    block[4] = self;
    id v9 = v4;
    dispatch_async(v7, block);
  }

  else if (dword_1006429A8 <= 90 {
         && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
  }
  {
    LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _urlWithCompletion:]",  90LL,  "Failed to get url with error %#m\n",  4294960591LL);
  }
}

- (void)_handleURLIsAvailable:(id)a3 error:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void (**)(id, id, uint64_t))a5;
  id v10 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0LL;
  id v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (v10 && !(_DWORD)v6)
  {
    uint64_t v14 = (SDAppleIDMutableURLRequest *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

    if (v14)
    {
      uint64_t v15 = objc_alloc(&OBJC_CLASS___SDAppleIDMutableURLRequest);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));
      uint64_t v14 = -[SDAppleIDMutableURLRequest initWithURL:gsToken:](v15, "initWithURL:gsToken:", v10, v16);

      if (v14)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));

        if (!v11)
        {
LABEL_8:
          uint64_t v13 = v14;
          id v12 = 0LL;
          uint64_t v6 = 0LL;
          uint64_t v14 = v13;
          goto LABEL_9;
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
        id v19 = 0LL;
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v17,  0LL,  &v19));
        id v12 = v19;

        if (!v12)
        {
          -[SDAppleIDMutableURLRequest setHTTPBody:](v14, "setHTTPBody:", v11);
          goto LABEL_8;
        }

        if (dword_1006429A8 <= 90
          && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
          LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleURLIsAvailable:error:completion:]",  90LL,  "JSON Serialization of the URL Request body failed with error %@",  v18);
        }

        uint64_t v6 = NSErrorToOSStatus(v12);
        uint64_t v13 = 0LL;
      }

      else
      {
        v11 = 0LL;
        id v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v6 = 4294960534LL;
      }
    }

    else
    {
      v11 = 0LL;
      id v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v6 = 4294960587LL;
    }
  }

- (void)_urlRequestWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000A6090;
      v7[3] = &unk_1005CD468;
      v7[4] = self;
      id v8 = v4;
      -[SDAppleIDServerTask _urlWithCompletion:](self, "_urlWithCompletion:", v7);

      goto LABEL_4;
    }

    uint64_t v6 = 4294960587LL;
  }

  else
  {
    uint64_t v6 = 4294960591LL;
  }

  if (dword_1006429A8 <= 90 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL))) {
    LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _urlRequestWithCompletion:]",  90LL,  "Failed to create NSURLRequest with error %#m\n",  v6);
  }
  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0LL, v6);
  }
LABEL_4:
}

- (void)_activate
{
  if (!self->_activated)
  {
    if (self->_invalidated)
    {
      if (dword_1006429A8 <= 60
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
      {
        LogPrintF(&dword_1006429A8, "-[SDAppleIDServerTask _activate]", 60LL, "### Object invalidated\n");
      }

      uint64_t v3 = 4294960573LL;
    }

    else
    {
      if (dword_1006429A8 <= 30
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)))
      {
        LogPrintF(&dword_1006429A8, "-[SDAppleIDServerTask _activate]", 30LL, "Activate\n");
      }

      if (-[SDAppleIDServerTask _isTaskInfoValid](self, "_isTaskInfoValid"))
      {
        -[SDAppleIDServerTask _sendRequest](self, "_sendRequest");
        self->_activated = 1;
        return;
      }

      uint64_t v3 = 4294960591LL;
    }

    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](self, "_callResponseHandlerWithInfo:error:", 0LL, v3);
    return;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A625C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleURLRequestIsAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));

  if (v3)
  {
    session = self->_session;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A6434;
    v11[3] = &unk_1005CD490;
    v11[4] = self;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSession dataTaskWithRequest:completionHandler:]( session,  "dataTaskWithRequest:completionHandler:",  v5,  v11));

    [v3 resume];
    if (dword_1006429A8 <= 30)
    {
      if (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL))
      {
        unint64_t v6 = -[SDAppleIDServerTask type](self, "type");
        if (v6 > 3) {
          v7 = @"?";
        }
        else {
          v7 = *(&off_1005CD500 + v6);
        }
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleURLRequestIsAvailable]",  30LL,  "Sending %@ server task\n",  v7);
      }

      if (dword_1006429A8 <= 10
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 10LL)))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allHTTPHeaderFields]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleURLRequestIsAvailable]",  10LL,  "HTTP Headers: %@\nBody: %@",  v9,  v10);
      }
    }
  }

  else
  {
    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:]( self,  "_callResponseHandlerWithInfo:error:",  0LL,  4294960587LL);
  }
}

- (void)_handleGSTokenIsAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000A65DC;
    v4[3] = &unk_1005CD4B8;
    v4[4] = self;
    -[SDAppleIDServerTask _urlRequestWithCompletion:](self, "_urlRequestWithCompletion:", v4);
  }

  else
  {
    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:]( self,  "_callResponseHandlerWithInfo:error:",  0LL,  4294960587LL);
  }

- (void)_handleServerError:(int64_t)a3 withStatusCode:(int64_t)a4 nextSuggestedAttemptDelay:(int64_t)a5
{
  if (a4 == 401)
  {
    uint64_t v9 = 201215LL;
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]",  60LL,  "### Status code %d, server error code %d. User authentication required to proceed\n");
    }
  }

  else if (a4 == 200)
  {
    uint64_t v9 = 201215LL;
    if (a3 > -20210)
    {
      if (a3 == -1)
      {
        uint64_t v9 = 201221LL;
        goto LABEL_25;
      }

      if (a3 == -20209) {
        goto LABEL_5;
      }
    }

    else
    {
      if ((unint64_t)(a3 + 22412) < 4)
      {
LABEL_5:
        if (dword_1006429A8 <= 60
          && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
        {
          LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]",  60LL,  "### Server error %d: status code %d expected, but %d received\n");
        }

        goto LABEL_25;
      }

      if (a3 == -22413)
      {
        if (dword_1006429A8 <= 60
          && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
        {
          LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]",  60LL,  "### Server error %d means server bug. Report to server folks\n",  -22413);
        }

        uint64_t v9 = 201217LL;
        goto LABEL_25;
      }
    }

    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]",  60LL,  "### Unhandled server error: %d\n",  a3);
    }

    uint64_t v9 = 201200LL;
  }

  else
  {
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]",  60LL,  "### Unhandled server response status code: %d. Server error code: %d\n",  a4,  a3);
    }

    uint64_t v9 = 4294960584LL;
  }

- (void)_invalidate
{
  if (self->_invalidated)
  {
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF(&dword_1006429A8, "-[SDAppleIDServerTask _invalidate]", 60LL, "### Object invalidated\n");
    }
  }

  else
  {
    if (dword_1006429A8 <= 30
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)))
    {
      unint64_t type = self->_type;
      if (type > 3) {
        id v4 = @"?";
      }
      else {
        id v4 = *(&off_1005CD500 + type);
      }
      LogPrintF(&dword_1006429A8, "-[SDAppleIDServerTask _invalidate]", 30LL, "Invalidate %@ server task\n", v4);
    }

    if (self->_activated) {
      -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:]( self,  "_callResponseHandlerWithInfo:error:",  0LL,  4294960573LL);
    }
    self->_invalidated = 1;
  }

- (void)_handleTaskResponse:(id)a3 withData:(id)a4 error:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v49 = v5;
  if ((_DWORD)v5)
  {
    if (dword_1006429A8 <= 90
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
    {
      unint64_t v34 = -[SDAppleIDServerTask type](self, "type");
      if (v34 > 3) {
        v35 = @"?";
      }
      else {
        v35 = *(&off_1005CD500 + v34);
      }
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]",  90LL,  "### %@ server task failed with error %#m\n",  v35,  v5);
    }

    uint64_t v25 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v23 = 0LL;
    id v33 = 0LL;
    id v48 = 0LL;
    goto LABEL_25;
  }

  if (!v8)
  {
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]",  60LL,  "### No response object\n");
    }

    goto LABEL_57;
  }

  if (dword_1006429A8 <= 30 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)))
  {
    unint64_t v12 = -[SDAppleIDServerTask type](self, "type");
    if (v12 > 3) {
      uint64_t v13 = @"?";
    }
    else {
      uint64_t v13 = *(&off_1005CD500 + v12);
    }
    LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]",  30,  "Received %@ server task response with status %ld\n",  v13,  [v8 statusCode]);
    id v10 = self;
  }

  if (!v11)
  {
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]",  60LL,  "### No data object\n");
    }

- (id)_parseCreateCertificateResponse:(id)a3 error:(int *)a4
{
  id v5 = a3;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v5, @"altDsId", TypeID, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v8)
  {
    if (dword_1006429A8 <= 90
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]",  90LL,  "### No altDSID\n");
    }

    goto LABEL_32;
  }

  CFTypeID v9 = CFDictionaryGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue(v5, @"certificate", v9, 0LL);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    if (dword_1006429A8 <= 90
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]",  90LL,  "### No certificate info\n");
    }

- (id)_parseFetchCertificateResponse:(id)a3 error:(int *)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (!v5)
  {
    id v46 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v16 = 0LL;
    int v43 = 0LL;
    v44 = 0LL;
    id v33 = 0LL;
    v35 = 0LL;
    v40 = 0LL;
    uint64_t v15 = 0LL;
    int v41 = -6728;
    goto LABEL_80;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"altDsId", TypeID, 0LL);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    [v5 setObject:v8 forKeyedSubscript:@"AltDSID"];
  }

  else if (dword_1006429A8 <= 60 {
         && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
  }
  {
    LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]",  60LL,  "### No altDSID\n");
  }

  CFTypeID v9 = CFDictionaryGetTypeID();
  uint64_t v10 = CFDictionaryGetTypedValue(v4, @"certificate", v9, 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v46 = (void *)v8;
  if (!v11)
  {
    if (dword_1006429A8 <= 90
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]",  90LL,  "### No certificate info\n");
    }

    uint64_t v15 = 0LL;
    int v43 = 0LL;
    v44 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_64;
  }

  CFTypeID v12 = CFStringGetTypeID();
  uint64_t v13 = CFDictionaryGetTypedValue(v11, @"certificateToken", v12, 0LL);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  v44 = (void *)v14;
  if (v14)
  {
    [v5 setObject:v14 forKeyedSubscript:@"CertificateToken"];
  }

  else if (dword_1006429A8 <= 60 {
         && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
  }
  {
    LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]",  60LL,  "### No certificate token\n");
  }

  CFTypeID v19 = CFStringGetTypeID();
  uint64_t v20 = CFDictionaryGetTypedValue(v11, @"status", v19, 0LL);
  int v43 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v43 lowercaseString]);
  if ([v21 isEqualToString:@"issued"])
  {
    uint64_t v22 = 1LL;
  }

  else if ([v21 isEqualToString:@"pending"])
  {
    uint64_t v22 = 2LL;
  }

  else if ([v21 isEqualToString:@"failed"])
  {
    uint64_t v22 = 3LL;
  }

  else if ([v21 isEqualToString:@"revoked"])
  {
    uint64_t v22 = 4LL;
  }

  else if ([v21 isEqualToString:@"expired"])
  {
    uint64_t v22 = 5LL;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v22));
  [v5 setObject:v23 forKeyedSubscript:@"CertificateStatus"];

  double Double = CFDictionaryGetDouble(v11, @"expiryDate", 0LL);
  if (Double <= 0.0)
  {
    if (dword_1006429A8 <= 60
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]",  60LL,  "### No certificate expiration date. Will set to 6 months from now.\n");
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v26 = (id)objc_claimAutoreleasedReturnValue([v18 dateByAddingTimeInterval:15552000.0]);
    uint64_t v15 = 0LL;
LABEL_41:

    uint64_t v18 = v26;
    if (v26) {
      goto LABEL_34;
    }
    goto LABEL_42;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  Double / 1000.0));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v25 dateByAddingTimeInterval:155520000.0]);

  if ([v15 compare:v18] == (id)-1)
  {
    id v26 = v15;
    uint64_t v15 = v26;
    goto LABEL_41;
  }

  if (v18)
  {
LABEL_34:
    [v5 setObject:v18 forKeyedSubscript:@"CertificateExpirationDate"];
    goto LABEL_46;
  }

- (id)_parseFindPersonResponse:(id)a3 error:(int *)a4
{
  unint64_t v34 = a4;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v35 = v4;
  if (!v5)
  {
    uint64_t v14 = 0LL;
    uint64_t v17 = 0LL;
    id v21 = 0LL;
    CFTypeID v27 = 0LL;
    uint64_t v30 = 0LL;
    CFTypeID v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_67;
  }

  CFTypeID TypeID = CFArrayGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"matches", TypeID, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    CFTypeID v9 = v8;
    if ([v8 count])
    {
      if ([v9 count] == (id)1)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        if (v11)
        {
          CFTypeID v12 = CFStringGetTypeID();
          uint64_t v13 = CFDictionaryGetTypedValue(v10, @"certCn", v12, 0LL);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14)
          {
            [v11 setObject:v14 forKeyedSubscript:@"AccountIdentifier"];
          }

          else if (dword_1006429A8 <= 60 {
                 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          }
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "Account identifier not in match info dictionary returned by server\n",  v34,  v4);
          }

          CFTypeID v15 = CFStringGetTypeID();
          uint64_t v16 = CFDictionaryGetTypedValue(v10, @"altDsId", v15, 0LL);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            [v11 setObject:v17 forKeyedSubscript:@"AltDSID"];
          }

          else if (dword_1006429A8 <= 60 {
                 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          }
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "AltDSID not in match info dictionary returned by server\n",  v34);
          }

          CFTypeID v18 = CFStringGetTypeID();
          uint64_t v19 = CFDictionaryGetTypedValue(v10, @"certStatus", v18, 0LL);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          id v21 = v20;
          if (v20)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 lowercaseString]);
            if ([v22 isEqualToString:@"issued"])
            {
              uint64_t v23 = 1LL;
            }

            else if ([v22 isEqualToString:@"pending"])
            {
              uint64_t v23 = 2LL;
            }

            else if ([v22 isEqualToString:@"failed"])
            {
              uint64_t v23 = 3LL;
            }

            else if ([v22 isEqualToString:@"revoked"])
            {
              uint64_t v23 = 4LL;
            }

            else if ([v22 isEqualToString:@"expired"])
            {
              uint64_t v23 = 5LL;
            }

            else
            {
              uint64_t v23 = 0LL;
            }

            int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
            [v11 setObject:v24 forKeyedSubscript:@"CertificateStatus"];
          }

          else if (dword_1006429A8 <= 60 {
                 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          }
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "Certificate status not in match info dictionary returned by server\n",  v34);
          }

          CFTypeID v25 = CFStringGetTypeID();
          uint64_t v26 = CFDictionaryGetTypedValue(v10, @"matched", v25, 0LL);
          CFTypeID v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          if (v27)
          {
            [v11 setObject:v27 forKeyedSubscript:@"Matched"];
          }

          else if (dword_1006429A8 <= 60 {
                 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          }
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "Matched criterion not in match info dictionary returned by server\n",  v34);
          }

          CFTypeID v28 = CFStringGetTypeID();
          uint64_t v29 = CFDictionaryGetTypedValue(v10, @"value", v28, 0LL);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if (v30)
          {
            [v11 setObject:v30 forKeyedSubscript:@"MatchedValue"];
          }

          else if (dword_1006429A8 <= 60 {
                 && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          }
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "Matched value not in match info dictionary returned by server\n",  v34);
          }

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 2592000.0, v34));
          [v11 setObject:v31 forKeyedSubscript:@"ValidUntil"];

          if (dword_1006429A8 <= 60
            && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
          {
            LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "### No matches array\n");
          }

          int v32 = 0;
          goto LABEL_53;
        }

        uint64_t v14 = 0LL;
        uint64_t v17 = 0LL;
        id v21 = 0LL;
        CFTypeID v27 = 0LL;
        uint64_t v30 = 0LL;
LABEL_67:
        int v32 = -6728;
        goto LABEL_53;
      }

      if (dword_1006429A8 <= 60
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 60LL)))
      {
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  60LL,  "### Matches array has more than 1 object\n",  v34,  v4);
      }

      uint64_t v14 = 0LL;
      uint64_t v17 = 0LL;
      id v21 = 0LL;
      CFTypeID v27 = 0LL;
      uint64_t v30 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      int v32 = 201241;
    }

    else
    {
      int v32 = 201223;
      if (dword_1006429A8 <= 90
        && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
      {
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  90LL,  "### No matches found\n",  v34,  v4);
      }

      uint64_t v14 = 0LL;
      uint64_t v17 = 0LL;
      id v21 = 0LL;
      CFTypeID v27 = 0LL;
      uint64_t v30 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    if (dword_1006429A8 <= 90
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 90LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseFindPersonResponse:error:]",  90LL,  "### No matches array\n",  v34,  v4);
    }

    uint64_t v14 = 0LL;
    uint64_t v17 = 0LL;
    id v21 = 0LL;
    CFTypeID v27 = 0LL;
    uint64_t v30 = 0LL;
    CFTypeID v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    int v32 = 201240;
  }

- (id)_parseGetMyInfoResponse:(id)a3 error:(int *)a4
{
  id v5 = a3;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v5, @"certificate", TypeID, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    CFTypeID v9 = CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue(v8, @"certificateToken", v9, 0LL);
    uint64_t v59 = objc_claimAutoreleasedReturnValue(v10);
    double Double = CFDictionaryGetDouble(v8, @"expiryDate", 0LL);
    uint64_t v12 = 0LL;
    if (Double > 0.0) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  Double / 1000.0));
    }
    CFTypeID v13 = CFStringGetTypeID();
    uint64_t v14 = CFDictionaryGetTypedValue(v8, @"serialNumber", v13, 0LL);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v14);
    CFTypeID v15 = CFStringGetTypeID();
    uint64_t v16 = CFDictionaryGetTypedValue(v8, @"status", v15, 0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    CFTypeID v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lowercaseString]);
    if ([v18 isEqualToString:@"issued"])
    {
      uint64_t v19 = 1LL;
    }

    else if ([v18 isEqualToString:@"pending"])
    {
      uint64_t v19 = 2LL;
    }

    else if ([v18 isEqualToString:@"failed"])
    {
      uint64_t v19 = 3LL;
    }

    else if ([v18 isEqualToString:@"revoked"])
    {
      uint64_t v19 = 4LL;
    }

    else
    {
      unsigned int v20 = [v18 isEqualToString:@"expired"];
      uint64_t v19 = 5LL;
      if (!v20) {
        uint64_t v19 = 0LL;
      }
    }

    uint64_t v55 = v19;

    v57 = v17;
    if (dword_1006429A8 <= 30
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]",  30LL,  "Received Get My Info Certificate Info: token=%@, expirationDate=%@, serial number=%@, status=%@\n",  v59,  v12,  v60,  v17);
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v59 = 0LL;
    v60 = 0LL;
    v57 = 0LL;
    uint64_t v55 = 0LL;
  }

  CFTypeID v21 = CFStringGetTypeID();
  uint64_t v22 = CFDictionaryGetTypedValue(v5, @"altDsId", v21, 0LL);
  uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
  CFTypeID v24 = CFStringGetTypeID();
  uint64_t v25 = CFDictionaryGetTypedValue(v5, @"firstName", v24, 0LL);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v25);
  CFTypeID v26 = CFStringGetTypeID();
  uint64_t v27 = CFDictionaryGetTypedValue(v5, @"lastName", v26, 0LL);
  v64 = (void *)objc_claimAutoreleasedReturnValue(v27);
  double v28 = CFDictionaryGetDouble(v5, @"msUntilNextCheck", 0LL);
  CFTypeID v29 = CFArrayGetTypeID();
  uint64_t v30 = CFDictionaryGetTypedValue(v5, @"validatedEmails", v29, 0LL);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v30);
  CFTypeID v31 = CFArrayGetTypeID();
  uint64_t v32 = CFDictionaryGetTypedValue(v5, @"validatedPhones", v31, 0LL);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v32);
  CFTypeID v33 = CFStringGetTypeID();
  uint64_t v34 = CFDictionaryGetTypedValue(v5, @"aidvr", v33, 0LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  CFTypeID v36 = CFStringGetTypeID();
  uint64_t v37 = CFDictionaryGetTypedValue(v5, @"serverAidvrId", v36, 0LL);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v37);
  uint64_t NSNumber = NSDictionaryGetNSNumber(v5, @"version", 0LL);
  uint64_t v39 = objc_claimAutoreleasedReturnValue(NSNumber);
  if (dword_1006429A8 <= 30)
  {
    if (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 30LL)) {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]",  30LL,  "Received Get My Info response: AltDSID=%@, Firstname=%{mask}, LastName=%{mask}, Emails=%~@, Phones=%~@, Validati on Record: identifier=%@,version=%@, msUntilNextCheck=%d\n",  v23,  v65,  v64,  v63,  v62,  v61,  v39,  (int)v28);
    }
    if (dword_1006429A8 <= 10
      && (dword_1006429A8 != -1 || _LogCategory_Initialize(&dword_1006429A8, 10LL)))
    {
      LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]",  10LL,  "Validation Record Data (base64)=%@\n",  v35);
    }
  }

  v56 = (void *)v23;
  double v40 = v28 / 1000.0;
  if (v28 / 1000.0 > 7776000.0 || v40 == 0.0) {
    double v42 = 2592000.0;
  }
  else {
    double v42 = v28 / 1000.0;
  }
  int v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v40));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dateByAddingTimeInterval:v42]);
  if (v39) {
    id v45 = (_UNKNOWN **)v39;
  }
  else {
    id v45 = &off_1005F7858;
  }
  if (v35) {
    id v46 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v35,  1LL);
  }
  else {
    id v46 = 0LL;
  }
  id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v48 = v47;
  v58 = (void *)v12;
  if (!v47)
  {
    int v53 = -6728;
    v52 = (void *)v59;
    if (!a4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  [v47 setObject:v12 forKeyedSubscript:@"CertificateExpirationDate"];
  [v48 setObject:v60 forKeyedSubscript:@"CertificateSerialNumber"];
  unsigned int v49 = a4;
  v50 = v8;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v55));
  [v48 setObject:v51 forKeyedSubscript:@"CertificateStatus"];

  uint64_t v8 = v50;
  a4 = v49;
  v52 = (void *)v59;
  [v48 setObject:v59 forKeyedSubscript:@"CertificateToken"];
  [v48 setObject:v65 forKeyedSubscript:@"FirstName"];
  [v48 setObject:v64 forKeyedSubscript:@"LastName"];
  [v48 setObject:v63 forKeyedSubscript:@"ValidatedEmails"];
  [v48 setObject:v62 forKeyedSubscript:@"ValidatedPhones"];
  [v48 setObject:v46 forKeyedSubscript:@"ValidationRecordData"];
  [v48 setObject:v61 forKeyedSubscript:@"ValidationRecordDataID"];
  [v48 setObject:v44 forKeyedSubscript:@"ValidationRecordNextCheckDate"];
  [v48 setObject:v45 forKeyedSubscript:@"Version"];
  int v53 = 0;
  if (a4) {
LABEL_41:
  }
    *a4 = v53;
LABEL_42:

  return v48;
}

- (id)_parseServerResponse:(id)a3 error:(int *)a4
{
  id v6 = a3;
  int v11 = 0;
  int64_t type = self->_type;
  switch(type)
  {
    case 0LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue( -[SDAppleIDServerTask _parseCreateCertificateResponse:error:]( self,  "_parseCreateCertificateResponse:error:",  v6,  &v11));
      goto LABEL_9;
    case 1LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue( -[SDAppleIDServerTask _parseFetchCertificateResponse:error:]( self,  "_parseFetchCertificateResponse:error:",  v6,  &v11));
      goto LABEL_9;
    case 2LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseGetMyInfoResponse:error:](self, "_parseGetMyInfoResponse:error:", v6, &v11));
      goto LABEL_9;
    case 3LL:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseFindPersonResponse:error:](self, "_parseFindPersonResponse:error:", v6, &v11));
LABEL_9:
      CFTypeID v9 = (void *)v8;
      if (a4) {
        goto LABEL_10;
      }
      goto LABEL_11;
    default:
      if (dword_1006429A8 > 90) {
        goto LABEL_13;
      }
      if (dword_1006429A8 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize(&dword_1006429A8, 90LL))
      {
        int64_t type = self->_type;
LABEL_5:
        LogPrintF( &dword_1006429A8,  "-[SDAppleIDServerTask _parseServerResponse:error:]",  90LL,  "### Unhandled type %d\n",  type);
      }

- (void)_sendRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask appleID](self, "appleID"));
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A8B78;
  v5[3] = &unk_1005CD4E0;
  v5[4] = self;
  sub_100170CE4(v3, dispatchQueue, v5);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)gsToken
{
  return self->_gsToken;
}

- (void)setGsToken:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)taskInfo
{
  return self->_taskInfo;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end