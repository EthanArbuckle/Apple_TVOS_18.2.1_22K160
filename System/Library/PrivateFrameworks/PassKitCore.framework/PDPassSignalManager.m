@interface PDPassSignalManager
- (BOOL)_isFeatureEnabled;
- (PDPassSignalManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4;
- (id)_createEventPassContentForSemantics:(id)a3;
- (id)_createPassInstanceForPassUniqueID:(id)a3 semantics:(id)a4;
- (id)_descriptors;
- (void)_peformIncrementalSetDonationAction:(int64_t)a3 pass:(id)a4 completion:(id)a5;
- (void)_performFullSetDonation:(id)a3 withCompletion:(id)a4;
- (void)_queue_updateVersion:(double)a3;
- (void)donateAllPassSignalsIfNeccessaryWithCompletion:(id)a3;
- (void)donateSignalForPass:(id)a3 completion:(id)a4;
- (void)removeAllPassSignalsWithCompletion:(id)a3;
- (void)removeSignalForPass:(id)a3 completion:(id)a4;
@end

@implementation PDPassSignalManager

- (PDPassSignalManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDPassSignalManager;
  v9 = -[PDPassSignalManager init](&v16, "init");
  if (v9)
  {
    id v10 = PDUtilityQueue();
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v9->_webServiceCoordinator, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v13 doubleForKey:@"PDPassSignalManagerVersion"];
    v9->_currentVersion = v14 + 1.0;
  }

  return v9;
}

- (void)donateAllPassSignalsIfNeccessaryWithCompletion:(id)a3
{
  id v4 = a3;
  if (PKCascadeIntegrationEnabled()
    && -[PDPassSignalManager _isFeatureEnabled](self, "_isFeatureEnabled")
    && (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible") & 1) != 0)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001A5E58;
    v6[3] = &unk_10063AC90;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)queue, v6);
  }

  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)donateSignalForPass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(id, void))a4;
  if (PKCascadeIntegrationEnabled()
    && -[PDPassSignalManager _isFeatureEnabled](self, "_isFeatureEnabled")
    && (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible") & 1) != 0)
  {
    -[PDPassSignalManager _peformIncrementalSetDonationAction:pass:completion:]( self,  "_peformIncrementalSetDonationAction:pass:completion:",  0LL,  v7,  v6);
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

- (void)removeSignalForPass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(id, void))a4;
  if ((PKCascadeIntegrationEnabled() & 1) != 0) {
    -[PDPassSignalManager _peformIncrementalSetDonationAction:pass:completion:]( self,  "_peformIncrementalSetDonationAction:pass:completion:",  1LL,  v7,  v6);
  }
  else {
    v6[2](v6, 0LL);
  }
}

- (void)removeAllPassSignalsWithCompletion:(id)a3
{
  id v4 = a3;
  if ((PKCascadeIntegrationEnabled() & 1) != 0)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001A6298;
    v6[3] = &unk_10063AC90;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)queue, v6);
  }

  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)_peformIncrementalSetDonationAction:(int64_t)a3 pass:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 allSemantics]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSignalManager _createPassInstanceForPassUniqueID:semantics:]( self,  "_createPassInstanceForPassUniqueID:semantics:",  v10,  v11));

  if (v12)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A6824;
    block[3] = &unk_100649A18;
    block[4] = self;
    int64_t v18 = a3;
    id v15 = v8;
    id v17 = v9;
    id v16 = v12;
    dispatch_async((dispatch_queue_t)queue, block);
  }

  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

- (void)_performFullSetDonation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A6D6C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_queue_updateVersion:(double)a3
{
  self->_currentVersion = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setInteger:(uint64_t)a3 forKey:@"PDPassSignalManagerVersion"];
}

- (id)_descriptors
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = PKPassKitCoreBundle();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  id v21 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CCSetDescriptor sourceIdentifierWithValue:error:]( &OBJC_CLASS___CCSetDescriptor,  "sourceIdentifierWithValue:error:",  v5,  &v21));
  id v7 = v21;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    -[NSMutableArray addObject:](v2, "addObject:", v6);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to build required source bundle identifier descriptor from donation bundle %@ with error %@",  buf,  0x16u);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localeIdentifier]);
  id v20 = v8;
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[CCSetDescriptor localeIdentifierWithValue:error:]( &OBJC_CLASS___CCSetDescriptor,  "localeIdentifierWithValue:error:",  v13,  &v20));
  id v15 = v20;

  if (!v14 || v15)
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(6LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to build required locale descriptor from donation bundle %@ with error %@",  buf,  0x16u);
    }
  }

  else
  {
    -[NSMutableArray addObject:](v2, "addObject:", v14);
  }

  id v18 = -[NSMutableArray copy](v2, "copy");

  return v18;
}

- (id)_createPassInstanceForPassUniqueID:(id)a3 semantics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 count])
  {
    id v20 = 0LL;
    id v9 = [[CCWalletPassMetaContent alloc] initWithSourceItemIdentifier:v6 error:&v20];
    id v10 = v20;
    id v11 = objc_alloc(&OBJC_CLASS___CCWalletPassContent);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassSignalManager _createEventPassContentForSemantics:]( self,  "_createEventPassContentForSemantics:",  v8));
    id v19 = v10;
    id v13 = [v11 initWithPassUniqueIdentifier:v6 eventContent:v12 error:&v19];
    id v14 = v19;

    id v18 = v14;
    id v15 = [[CCItemInstance alloc] initWithContent:v13 metaContent:v9 error:&v18];
    id v16 = v18;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_createEventPassContentForSemantics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CCWalletPassEventContent);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringsKeyArtistIDs]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringsValue]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyAwayTeamAbbreviation]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyAwayTeamName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v24 stringValue]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyEventName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyEventType]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyGenre]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyHomeTeamAbbreviation]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringKeyHomeTeamName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:PKPassSemanticStringsKeyPerformerNames]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringsValue]);
  id v28 = 0LL;
  id v18 = [v4 initWithArtistIDs:v27 awayTeamAbbreviation:v5 awayTeamName:v6 eventName:v7 eventType:v19 genre:v17 homeTeamAbbreviation:v8 homeTeamNam e:v10 performerNames:v12 error:&v28];
  id v16 = v28;

  if (v16 || !v18)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to build event pass content with error %@",  buf,  0xCu);
    }
  }

  return v18;
}

- (BOOL)_isFeatureEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self->_webServiceCoordinator, "sharedWebService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 supportedRegionFeatureOfType:18 didFailOSVersionRequirements:0]);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 isIntegrationTypeSupported:3];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end