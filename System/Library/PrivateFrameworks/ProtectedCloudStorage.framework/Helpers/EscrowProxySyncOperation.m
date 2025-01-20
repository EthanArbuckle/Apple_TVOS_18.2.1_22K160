@interface EscrowProxySyncOperation
- (EscrowProxySyncOperation)initWithDSID:(id)a3;
- (NSString)dsid;
- (id)completionBlockWithError;
- (void)main;
- (void)setCompletionBlockWithError:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation EscrowProxySyncOperation

- (EscrowProxySyncOperation)initWithDSID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EscrowProxySyncOperation;
  v5 = -[EscrowProxySyncOperation init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[EscrowProxySyncOperation setDsid:](v5, "setDsid:", v4);
  }

  return v6;
}

- (void)main
{
  CFTypeRef cf = 0LL;
  v3 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Synchronize keys with escrow proxy", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowProxySyncOperation dsid](self, "dsid"));
  char v5 = PCSCurrentPersonaMatchesDSID();

  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowProxySyncOperation dsid](self, "dsid"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel guitarfishStateForDSID:]( &OBJC_CLASS___PCSAccountsModel,  "guitarfishStateForDSID:",  v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 BOOLValue]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, kPCSSetupGuitarfish);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kPCSSetupForceLogging);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowProxySyncOperation dsid](self, "dsid"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, kPCSSetupDSID);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyRegistryCallback]);
      id v13 = objc_retainBlock(v12);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v13,  kPCSSetupCallbackKeyRegistry);

      if ((PCSIdentitySynchronizeKeys(v6, &cf) & 1) == 0)
      {
        v17 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v22 = cf;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fail to synchronize keys: %@", buf, 0xCu);
        }
      }

      v18 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[EscrowProxySyncOperation completionBlockWithError](self, "completionBlockWithError"));
      v18[2]();

      if (cf) {
        CFRelease(cf);
      }
      v19 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Synchronize keys complete", buf, 2u);
      }
    }

    else
    {
      v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[EscrowProxySyncOperation completionBlockWithError]( self,  "completionBlockWithError"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kPCSErrorDomain,  230LL,  0LL));
      ((void (**)(void, void, void *))v15)[2](v15, 0LL, v16);
    }
  }

  else
  {
    v14 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current persona doesn't match dsid", buf, 2u);
    }
  }

- (id)completionBlockWithError
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCompletionBlockWithError:(id)a3
{
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end