@interface CSDIncomingCallFilter
- (BOOL)_doNotDisturbAllowsCallFromSourceAddress:(id)a3 providerIdentifier:(id)a4;
- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3;
- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3 countryCode:(id)a4;
- (CNContactStore)contactStore;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDDeviceLockStateObserver)deviceLockObserver;
- (CSDIncomingCallFilter)init;
- (CSDIncomingCallFilter)initWithDataSource:(id)a3 deviceLockObserver:(id)a4 callCenterObserver:(id)a5 callDirectoryStoreBuilder:(id)a6 callDirectoryManager:(id)a7 contactStore:(id)a8 queue:(id)a9;
- (CSDIncomingCallFilterDataSource)dataSource;
- (CXCallDirectorySanitizer)callDirectorySanitizer;
- (CXCallDirectoryStore)callDirectoryStore;
- (OS_dispatch_queue)queue;
- (double)twoTimeCallthroughInterval;
- (id)_callDirectoryPhoneNumberVariantsForSourceAddress:(id)a3 countryCode:(id)a4;
- (id)_callFilterBlock;
- (id)_callFilterIdentifier;
- (id)blockedByExtension:(id)a3;
- (void)callsChangedForCallCenterObserver:(id)a3;
- (void)setCallDirectoryStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setTwoTimeCallthroughInterval:(double)a3;
@end

@implementation CSDIncomingCallFilter

- (CSDIncomingCallFilter)init
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_100114CC4;
  v14 = sub_100114CD4;
  id v15 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100114CDC;
  block[3] = &unk_1003DA228;
  v8 = self;
  v9 = &v10;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.incomingcallfilter", 0LL);
  v2 = v8;
  v3 = v7;
  dispatch_sync(v3, block);
  v4 = (CSDIncomingCallFilter *)(id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (CSDIncomingCallFilter)initWithDataSource:(id)a3 deviceLockObserver:(id)a4 callCenterObserver:(id)a5 callDirectoryStoreBuilder:(id)a6 callDirectoryManager:(id)a7 contactStore:(id)a8 queue:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDIncomingCallFilter;
  v17 = -[CSDIncomingCallFilter init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a9);
    objc_storeStrong((id *)&v18->_dataSource, a3);
    dataSource = v18->_dataSource;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter _callFilterBlock](v18, "_callFilterBlock"));
    -[CSDIncomingCallFilterDataSource setFilterBlock:](dataSource, "setFilterBlock:", v20);

    v18->_twoTimeCallthroughInterval = 180.0;
    objc_storeStrong((id *)&v18->_deviceLockObserver, a4);
    objc_storeStrong((id *)&v18->_callCenterObserver, a5);
    -[CSDCallCenterObserver setTriggers:](v18->_callCenterObserver, "setTriggers:", 1LL);
    -[CSDCallCenterObserver setDelegate:](v18->_callCenterObserver, "setDelegate:", v18);
    v21 = objc_alloc_init(&OBJC_CLASS___CXCallDirectorySanitizer);
    callDirectorySanitizer = v18->_callDirectorySanitizer;
    v18->_callDirectorySanitizer = v21;
  }

  return v18;
}

- (id)_callFilterBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100115050;
  v4[3] = &unk_1003DA790;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_callFilterIdentifier
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%p",  TUBundleIdentifierCallServicesDaemon,  objc_opt_class(self, a2),  self);
}

- (BOOL)_doNotDisturbAllowsCallFromSourceAddress:(id)a3 providerIdentifier:(id)a4
{
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter queue](self, "queue", a3, a4));
  dispatch_sync(v4, &stru_1003DA7B0);

  return 1;
}

- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 networkCountryCode]);
  LOBYTE(self) = -[CSDIncomingCallFilter callDirectoryAllowsCallFromSourceAddress:countryCode:]( self,  "callDirectoryAllowsCallFromSourceAddress:countryCode:",  v4,  v6);

  return (char)self;
}

- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3 countryCode:(id)a4
{
  return 1;
}

- (id)blockedByExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter callDirectoryStore](self, "callDirectoryStore"));
  if (v5 && (v6 = (void *)v5, unsigned int v7 = [v4 destinationIdIsPhoneNumber], v6, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter dataSource](self, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 networkCountryCode]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDIncomingCallFilter _callDirectoryPhoneNumberVariantsForSourceAddress:countryCode:]( self,  "_callDirectoryPhoneNumberVariantsForSourceAddress:countryCode:",  v4,  v9));

    id v11 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "phoneNumberVariants: %@", buf, 0xCu);
    }

    if ([v10 count])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter callDirectoryStore](self, "callDirectoryStore"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
      id v20 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 firstEnabledBlockingExtensionIdentifierForPhoneNumber:v14 error:&v20]);
      id v16 = v20;

      if (v16)
      {
        id v17 = sub_1001704C4();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1002B6E34((uint64_t)v4, (uint64_t)v16, v18);
        }
      }
    }

    else
    {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_callDirectoryPhoneNumberVariantsForSourceAddress:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = [[TUPhoneNumber alloc] initWithDigits:v7 countryCode:v6];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 digits]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter callDirectorySanitizer](self, "callDirectorySanitizer"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 digits]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 canonicalizedPhoneNumber:v12]);

    if (v10) {
      [v8 addObject:v10];
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unformattedInternationalRepresentation]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIncomingCallFilter callDirectorySanitizer](self, "callDirectorySanitizer"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 canonicalizedPhoneNumber:v13]);

    if (!v15) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (v10)
  {
    id v16 = +[NSLocale ITUCountryCodeForISOCountryCode:](&OBJC_CLASS___NSLocale, "ITUCountryCodeForISOCountryCode:", v6);
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld%@",  v16,  v10));
LABEL_10:
      [v8 addObject:v15];
LABEL_11:
    }
  }

  id v17 = [v8 copy];

  return v17;
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", a3));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 queue]);
  dispatch_async(v3, &stru_1003DA7D0);
}

- (double)twoTimeCallthroughInterval
{
  return self->_twoTimeCallthroughInterval;
}

- (void)setTwoTimeCallthroughInterval:(double)a3
{
  self->_twoTimeCallthroughInterval = a3;
}

- (CXCallDirectoryStore)callDirectoryStore
{
  return self->_callDirectoryStore;
}

- (void)setCallDirectoryStore:(id)a3
{
}

- (CSDIncomingCallFilterDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDDeviceLockStateObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (CXCallDirectorySanitizer)callDirectorySanitizer
{
  return self->_callDirectorySanitizer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end