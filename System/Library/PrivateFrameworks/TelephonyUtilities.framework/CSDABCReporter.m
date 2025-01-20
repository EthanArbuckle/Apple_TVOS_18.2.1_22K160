@interface CSDABCReporter
- (CSDABCReporter)initWithQueue:(id)a3;
- (CSDABCReporter)initWithQueue:(id)a3 block:(id)a4;
- (OS_dispatch_queue)queue;
- (id)block;
- (id)stringForIDSSessionEndedReason:(unsigned int)a3;
- (id)stringForIMAVChatEndedReason:(unsigned int)a3;
- (id)stringForSignatureType:(unint64_t)a3;
- (id)stringRepresentationForTUCallDisconnectedReason:(int)a3;
- (void)reportingController:(id)a3 forCallUUID:(id)a4 report:(id)a5;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)setBlock:(id)a3;
@end

@implementation CSDABCReporter

- (CSDABCReporter)initWithQueue:(id)a3
{
  return -[CSDABCReporter initWithQueue:block:](self, "initWithQueue:block:", a3, &stru_1003DBC60);
}

- (CSDABCReporter)initWithQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDABCReporter;
  v9 = -[CSDABCReporter init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = objc_retainBlock(v8);
    id block = v10->_block;
    v10->_id block = v11;
  }

  return v10;
}

- (void)reportingController:(id)a3 forCallUUID:(id)a4 report:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDABCReporter stringForSignatureType:](self, "stringForSignatureType:", 1LL));
  uint64_t v10 = TUCallTUStartCallActionDuration;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:TUCallTUStartCallActionDuration]);

  if (v11)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
    v18 = @"CallUUID";
    id v19 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    objc_super v14 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDABCReporter block](self, "block"));
    ((void (**)(void, void *, const __CFString *, os_log_s *, void *))v14)[2]( v14,  v9,  @"StartCallAction duration unexpected",  v12,  v13);
  }

  else
  {
    id v15 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown report: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDABCReporter stringRepresentationForTUCallDisconnectedReason:]( self,  "stringRepresentationForTUCallDisconnectedReason:",  [v6 disconnectedReason]));
  BOOL v9 = [v6 status] == 6 && v7 != 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  if (!v11 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDABCReporter stringForSignatureType:](self, "stringForSignatureType:", 0LL));
    v33 = @"CallUUID";
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
    v34 = v13;
    objc_super v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

    id v15 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDABCReporter block](self, "block"));
    ((void (**)(void, void *, const __CFString *, void, __CFString *))v15)[2]( v15,  v12,  @"nilCallProvider",  0LL,  v14);
LABEL_45:

    goto LABEL_46;
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  unsigned int v17 = [v16 isFaceTimeProvider] & v9;

  if (v17 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDABCReporter stringForSignatureType:](self, "stringForSignatureType:", 0LL));
    id v18 = [v6 providerErrorCode];
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 providerContext]);
    uint64_t v20 = TUCallFaceTimeTransportTypeKey;
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:TUCallFaceTimeTransportTypeKey]);
    if (v21)
    {
      v22 = (void *)v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v6 providerContext]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v20]);
      id v25 = [v24 integerValue];

      if (v25)
      {
        if (v25 == (id)1)
        {
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDABCReporter stringForIMAVChatEndedReason:]( self,  "stringForIMAVChatEndedReason:",  v18));
        }

        else
        {
          if (v25 != (id)2)
          {
            objc_super v14 = 0LL;
            goto LABEL_20;
          }

          v26 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDABCReporter stringForIDSSessionEndedReason:]( self,  "stringForIDSSessionEndedReason:",  v18));
        }

- (id)stringRepresentationForTUCallDisconnectedReason:(int)a3
{
  else {
    return off_1003DBC80[a3 - 8];
  }
}

- (id)stringForIDSSessionEndedReason:(unsigned int)a3
{
  if (a3 > 0x31) {
    return &stru_1003E7718;
  }
  else {
    return *(&off_1003DBD08 + (int)a3);
  }
}

- (id)stringForIMAVChatEndedReason:(unsigned int)a3
{
  if (a3 > 0x1F) {
    return &stru_1003E7718;
  }
  else {
    return *(&off_1003DBE98 + (int)a3);
  }
}

- (id)stringForSignatureType:(unint64_t)a3
{
  if (a3) {
    return @"Call Info";
  }
  else {
    return @"Call Failure";
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end