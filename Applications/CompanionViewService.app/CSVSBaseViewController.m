@interface CSVSBaseViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)deviceFromViewServiceMessage:(id)a3;
- (void)_cancelButtonPressed;
- (void)_dismissViewServiceWithCancellationReason:(int64_t)a3;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_handleFetchAppIconMessage:(id)a3 withReplyHandler:(id)a4;
- (void)_menuButtonPressed;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4;
@end

@implementation CSVSBaseViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Will dismiss view service with result: %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSBaseViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:v4];
}

- (void)_dismissViewServiceWithCancellationReason:(int64_t)a3
{
  uint64_t v5 = CPSErrorDomain;
  v11[0] = CPSCancellationReasonErrorKey;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  v12[0] = v6;
  v11[1] = NSDebugDescriptionErrorKey;
  else {
    id v7 = off_1000249D8[a3 - 1];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"User cancelled view service: %@",  v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  104LL,  v9));

  -[CSVSBaseViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v10);
}

- (void)_menuButtonPressed
{
}

- (void)_cancelButtonPressed
{
}

- (void)_handleFetchAppIconMessage:(id)a3 withReplyHandler:(id)a4
{
}

+ (id)deviceFromViewServiceMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CPSDevice);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeNumberForKey:", @"deviceFlags"));
  -[CPSDevice setFlags:](v4, "setFlags:", [v5 unsignedIntegerValue]);

  int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeStringForKey:", @"deviceModel"));
  -[CPSDevice setModel:](v4, "setModel:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeStringForKey:", @"deviceName"));
  -[CPSDevice setName:](v4, "setName:", v7);

  return v4;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
}

- (void)viewServiceHandleMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeNumberForKey:", @"messageType"));
  v9 = (char *)[v8 integerValue];

  id v10 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(v9 - 1) >= 5) {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v9));
    }
    else {
      v11 = off_1000249F0[(void)(v9 - 1)];
    }
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received view service message. type=%@, message=%@",  buf,  0x16u);
  }

  switch((unint64_t)v9)
  {
    case 1uLL:
      -[CSVSBaseViewController _handleFetchAppIconMessage:withReplyHandler:]( self,  "_handleFetchAppIconMessage:withReplyHandler:",  v6,  v7);
      break;
    case 2uLL:
      sub_10000FA1C(self, v6, v7);
      break;
    case 3uLL:
      sub_10000FAA8(self, v6, v7);
      break;
    case 4uLL:
      sub_10000FB34(self, v12, v7);
      break;
    case 5uLL:
      sub_10000FB88(self, v6, v7);
      break;
    default:
      uint64_t v13 = CPSErrorDomain;
      NSErrorUserInfoKey v17 = NSDebugDescriptionErrorKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid view service message type: %ld",  v9));
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  101LL,  v15));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v16);

      break;
  }
}

+ (id)_exportedInterface
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___NSDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___NSArray);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSNumber);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_opt_self(&OBJC_CLASS___NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___NSError);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_opt_self(&OBJC_CLASS___NSData);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = objc_opt_self(&OBJC_CLASS___NSXPCListenerEndpoint);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, v5, v7, v9, v11, v13, v15, 0LL));

  NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v17 setClasses:v16 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v17 setClasses:v16 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];
  [v17 setClasses:v16 forSelector:"viewServiceHandleMessage:reply:" argumentIndex:0 ofReply:0];

  return v17;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

@end