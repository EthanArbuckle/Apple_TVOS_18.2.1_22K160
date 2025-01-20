@interface PDMapsBrandAndMerchantUpdater
+ (BOOL)canUpdateMapsBrandForBrand:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsBrandForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsBrandForTransaction:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForMerchant:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForTransaction:(id)a3 outConfiguration:(id *)a4;
+ (id)_configurationForMapsBrand:(id)a3;
+ (id)_configurationForMapsMerchant:(id)a3;
+ (id)oldestPossibleLastProcessedDate;
- (BOOL)_validHeroImageForPhoto:(id)a3;
- (PDMapsBrandAndMerchantUpdater)initWithDataSource:(id)a3;
- (id)_bestHeroImageForMapItem:(id)a3 size:(CGSize)a4 allowSmaller:(BOOL)a5;
- (id)_heroImageProviderNameForMapItem:(id)a3;
- (id)traits;
- (void)_brandAndMerchantInformationForMapItems:(id)a3 completion:(id)a4;
- (void)_executeNextRequestIfPossible;
- (void)_startNextMapsUpdatesRequest:(id)a3 completion:(id)a4;
- (void)beginCoalesingMapsDataRequests;
- (void)endCoalesingMapsDataRequests;
- (void)merchantDataForMapsURL:(id)a3 completion:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)updateMapsDataForConfiguration:(id)a3 completion:(id)a4;
- (void)updateMapsDataForConfigurations:(id)a3;
@end

@implementation PDMapsBrandAndMerchantUpdater

- (PDMapsBrandAndMerchantUpdater)initWithDataSource:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDMapsBrandAndMerchantUpdater;
  v6 = -[PDMapsBrandAndMerchantUpdater init](&v16, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requests = v6->_requests;
    v6->_requests = v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = (MKMapService *)objc_alloc_init(off_100703600());
    mapService = v6->_mapService;
    v6->_mapService = v9;

    id v11 = PDDefaultQueue();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    PDScheduledActivityClientRegister(@"PDMapsBrandAndMerchantUpdaterClientIdentifier", v6, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v13));

    [v14 setRequireMainsPower:1];
    [v14 setRequireScreenSleep:1];
    [v14 setRequireNetworkConnectivity:1];
    [v14 setRepeating:1];
    [v14 setRepeatInterval:86400.0];
    PDScheduledActivityRegister( @"PDMapsBrandAndMerchantUpdaterClientIdentifier",  @"PDMapsBrandAndMerchantUpdaterActivityIdentifier",  v14);
  }

  return v6;
}

+ (id)oldestPossibleLastProcessedDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:-2592000.0]);

  return v3;
}

+ (BOOL)canUpdateMapsMerchantForTransaction:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 merchant]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapsMerchant]);

  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastProcessedDate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v11)
  {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v11 timeIntervalSinceDate:v16];
    double v18 = v17;

    BOOL v19 = 0;
    if (!v9 || v15 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }

  else if (!v9)
  {
    BOOL v19 = 0;
    goto LABEL_11;
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsMerchant:v8]);
  }
  BOOL v19 = 1;
LABEL_11:
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v9;
    if (v19) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v8 name]);
    signed int v26 = v10;
    v27 = (void *)v25;
    *(_DWORD *)buf = 138414082;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v23;
    __int16 v34 = 2112;
    v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = v25;
    __int16 v38 = 2112;
    v39 = v11;
    __int16 v40 = 2048;
    id v41 = v29;
    __int16 v42 = 2048;
    uint64_t v43 = v26;
    __int16 v44 = 2112;
    v45 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can update maps merchant %@ for identifier %@, serviceIdentifier %@, name %@, mapsMerchantLastProcessedDate %@, ma psMerchantMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@",  buf,  0x52u);
  }

  return v19;
}

+ (BOOL)canUpdateMapsMerchantForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 merchant]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapsMerchant]);
  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastProcessedDate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 planSummary]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionDate]);

  double v14 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v11)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v11 timeIntervalSinceDate:v19];
    double v18 = v17;

    LODWORD(v19) = 0;
    if (!v9 || v16 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }

  else if (!v9)
  {
    LODWORD(v19) = 0;
    goto LABEL_11;
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsMerchant:v8]);
  }
  LODWORD(v19) = 1;
LABEL_11:
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = (_DWORD)v19 == 0;
    v31 = v13;
    char v23 = (char)v19;
    BOOL v19 = v9;
    v24 = v7;
    if (v22) {
      uint64_t v25 = @"NO";
    }
    else {
      uint64_t v25 = @"YES";
    }
    signed int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v8 name]);
    signed int v28 = v10;
    id v29 = (void *)v27;
    *(_DWORD *)buf = 138413826;
    v33 = v25;
    v7 = v24;
    __int16 v34 = 2112;
    v35 = v26;
    __int16 v36 = 2112;
    uint64_t v37 = v27;
    __int16 v38 = 2112;
    v39 = v11;
    __int16 v40 = 2048;
    id v41 = v19;
    LOBYTE(v19) = v23;
    v13 = v31;
    __int16 v42 = 2048;
    uint64_t v43 = v28;
    __int16 v44 = 2112;
    v45 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can update financing plan maps merchant %@ for identifier %@, name %@, mapsMerchantLastProcessedDate %@, mapsMerch antMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@",  buf,  0x48u);
  }

  return (char)v19;
}

+ (BOOL)canUpdateMapsBrandForTransaction:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 merchant]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapsBrand]);

  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastProcessedDate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionDate]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v11)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v11 timeIntervalSinceDate:v16];
    double v18 = v17;

    BOOL v19 = 0;
    if (!v9 || v15 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }

  else if (!v9)
  {
    BOOL v19 = 0;
    goto LABEL_11;
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsBrand:v8]);
  }
  BOOL v19 = 1;
LABEL_11:
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v9;
    if (v19) {
      BOOL v22 = @"YES";
    }
    else {
      BOOL v22 = @"NO";
    }
    char v23 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v8 name]);
    signed int v26 = v10;
    uint64_t v27 = (void *)v25;
    *(_DWORD *)buf = 138414082;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v23;
    __int16 v34 = 2112;
    v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = v25;
    __int16 v38 = 2112;
    v39 = v11;
    __int16 v40 = 2048;
    id v41 = v29;
    __int16 v42 = 2048;
    uint64_t v43 = v26;
    __int16 v44 = 2112;
    v45 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can update maps brand %@ for identifier %@, serviceIdentifier %@, name %@, mapsBrandLastProcessedDate %@, mapsBran dMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@",  buf,  0x52u);
  }

  return v19;
}

+ (BOOL)canUpdateMapsBrandForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 merchant]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapsBrand]);
  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastProcessedDate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 planSummary]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionDate]);

  double v14 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v11)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v11 timeIntervalSinceDate:v19];
    double v18 = v17;

    LODWORD(v19) = 0;
    if (!v9 || v16 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }

  else if (!v9)
  {
    LODWORD(v19) = 0;
    goto LABEL_11;
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsBrand:v8]);
  }
  LODWORD(v19) = 1;
LABEL_11:
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = (_DWORD)v19 == 0;
    v31 = v13;
    char v23 = (char)v19;
    BOOL v19 = v9;
    v24 = v7;
    if (v22) {
      uint64_t v25 = @"NO";
    }
    else {
      uint64_t v25 = @"YES";
    }
    signed int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 planIdentifier]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v8 name]);
    signed int v28 = v10;
    id v29 = (void *)v27;
    *(_DWORD *)buf = 138413826;
    v33 = v25;
    v7 = v24;
    __int16 v34 = 2112;
    v35 = v26;
    __int16 v36 = 2112;
    uint64_t v37 = v27;
    __int16 v38 = 2112;
    v39 = v11;
    __int16 v40 = 2048;
    id v41 = v19;
    LOBYTE(v19) = v23;
    v13 = v31;
    __int16 v42 = 2048;
    uint64_t v43 = v28;
    __int16 v44 = 2112;
    v45 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can update financing plan merchant maps brand %@ for identifier %@, name %@, mapsBrandLastProcessedDate %@, mapsBr andMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@",  buf,  0x48u);
  }

  return (char)v19;
}

+ (BOOL)canUpdateMapsMerchantForMerchant:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  signed int v8 = [v6 resultProviderIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastProcessedDate]);
  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v9 timeIntervalSinceDate:v10];
    BOOL v12 = v11 < 0.0;
  }

  else
  {
    BOOL v12 = 1;
  }

  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (a4 && v13) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsMerchant:v6]);
  }
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      double v16 = @"YES";
    }
    else {
      double v16 = @"NO";
    }
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    int v19 = 138413314;
    v20 = v16;
    __int16 v21 = 2112;
    BOOL v22 = v17;
    __int16 v23 = 2112;
    v24 = v9;
    __int16 v25 = 2048;
    id v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Can update maps merchant %@, name %@, mapsMerchantLastProcessedDate %@, mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld",  (uint8_t *)&v19,  0x34u);
  }

  return v13;
}

+ (BOOL)canUpdateMapsBrandForBrand:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  signed int v8 = [v6 resultProviderIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastProcessedDate]);
  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([a1 oldestPossibleLastProcessedDate]);
    [v9 timeIntervalSinceDate:v10];
    BOOL v12 = v11 < 0.0;
  }

  else
  {
    BOOL v12 = 1;
  }

  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (a4 && v13) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([a1 _configurationForMapsBrand:v6]);
  }
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      double v16 = @"YES";
    }
    else {
      double v16 = @"NO";
    }
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    int v19 = 138413314;
    v20 = v16;
    __int16 v21 = 2112;
    BOOL v22 = v17;
    __int16 v23 = 2112;
    v24 = v9;
    __int16 v25 = 2048;
    id v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Can update maps brand %@, name %@, mapsBrandLastProcessedDate %@, mapsBrandMUID %ld, mapsMerchantResultProviderID %ld",  (uint8_t *)&v19,  0x34u);
  }

  return v13;
}

+ (id)_configurationForMapsMerchant:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 resultProviderIdentifier];
  [v3 locationLatitude];
  CLLocationDegrees v7 = v6;
  [v3 locationLongitude];
  CLLocationDegrees v9 = v8;

  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);
  return  -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]( objc_alloc(&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration),  "initWithMUID:resultProviderID:coordinate:",  v4,  v5,  v10.latitude,  v10.longitude);
}

+ (id)_configurationForMapsBrand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 resultProviderIdentifier];

  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(0.0, 0.0);
  return  -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]( objc_alloc(&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration),  "initWithMUID:resultProviderID:coordinate:",  v4,  v5,  v6.latitude,  v6.longitude);
}

- (void)beginCoalesingMapsDataRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_coalesingRequests)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CLLocationCoordinate2D v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Begin coalesing PDMapsBrandAndMerchantUpdater requests.",  v6,  2u);
    }

    self->_coalesingRequests = 1;
    os_unfair_lock_unlock(p_lock);
  }

- (void)endCoalesingMapsDataRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_coalesingRequests)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CLLocationCoordinate2D v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "End coalesing PDMapsBrandAndMerchantUpdater requests.",  v6,  2u);
    }

    self->_coalesingRequests = 0;
    os_unfair_lock_unlock(p_lock);
    -[PDMapsBrandAndMerchantUpdater _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");
  }

- (void)updateMapsDataForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    double v8 = objc_alloc(&OBJC_CLASS___PKPaymentTransactionMapsUpdateProcessorRequest);
    CLLocationDegrees v9 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v7, 0LL);

    CLLocationCoordinate2D v10 = -[PKPaymentTransactionMapsUpdateProcessorRequest initWithConfigurations:](v8, "initWithConfigurations:", v9);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000065B0;
    v11[3] = &unk_1006390A0;
    id v12 = v6;
    -[PDMapsBrandAndMerchantUpdater _startNextMapsUpdatesRequest:completion:]( self,  "_startNextMapsUpdatesRequest:completion:",  v10,  v11);
  }
}

- (void)merchantDataForMapsURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [objc_alloc(off_100703608()) initWithMapsURL:v6];
    if (v8)
    {
      id v9 = [objc_alloc(off_100703610()) initWithRequest:v8];
      objc_initWeak(&location, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000067A0;
      v10[3] = &unk_1006390C8;
      objc_copyWeak(&v12, &location);
      id v11 = v7;
      [v9 startWithCompletionHandler:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)updateMapsDataForConfigurations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 mutableCopy];
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v6 = self->_requests;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v45;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v44 + 1) + 8 * v10) configurations]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
        [v5 minusSet:v12];

        if (!v5) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v5 count])
    {
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      v35 = self;
      BOOL v13 = self->_requests;
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v41;
LABEL_13:
        uint64_t v17 = 0LL;
        while (1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v17) coalesceWithConfigurations:v5];
          if (!v5) {
            break;
          }
          if (v15 == (id)++v17)
          {
            id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
            if (v15) {
              goto LABEL_13;
            }
            break;
          }
        }
      }

      if ([v5 count])
      {
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
        uint64_t v19 = (uint64_t)[v18 count];
        v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        if (v19 >= 1)
        {
          uint64_t v21 = 0LL;
          uint64_t v22 = v19;
          do
          {
            uint64_t v23 = v22 - 100;
            if (v22 >= 100) {
              uint64_t v24 = 100LL;
            }
            else {
              uint64_t v24 = v22;
            }
            __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subarrayWithRange:", v21, v24));
            -[NSMutableArray addObject:](v20, "addObject:", v25);

            v21 += 100LL;
            uint64_t v22 = v23;
          }

          while (v21 < v19);
        }

        id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int16 v27 = v20;
        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v36,  v50,  16LL);
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v37;
          do
          {
            for (i = 0LL; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v37 != v30) {
                objc_enumerationMutation(v27);
              }
              __int16 v32 = -[PKPaymentTransactionMapsUpdateProcessorRequest initWithConfigurations:]( objc_alloc(&OBJC_CLASS___PKPaymentTransactionMapsUpdateProcessorRequest),  "initWithConfigurations:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)i));
              -[NSMutableArray addObject:](v26, "addObject:", v32);
            }

            id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v36,  v50,  16LL);
          }

          while (v29);
        }

        os_unfair_lock_lock(&v35->_lock);
        -[NSMutableArray addObjectsFromArray:](v35->_requests, "addObjectsFromArray:", v26);
        uint64_t Object = PKLogFacilityTypeGetObject(23LL);
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Maps update requests queued %@",  buf,  0xCu);
        }

        os_unfair_lock_unlock(&v35->_lock);
        -[PDMapsBrandAndMerchantUpdater _executeNextRequestIfPossible](v35, "_executeNextRequestIfPossible");
      }
    }
  }
}

- (void)_startNextMapsUpdatesRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  mapService = self->_mapService;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 mapIdentifiers]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDMapsBrandAndMerchantUpdater traits](self, "traits"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForIdentifiers:traits:](mapService, "ticketForIdentifiers:traits:", v8, v9));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006DA4;
  v12[3] = &unk_1006390F0;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 submitWithHandler:v12 networkActivity:0];
}

- (void)_brandAndMerchantInformationForMapItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  __int128 v46 = (void (**)(id, id, id))a4;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v6;
  id v53 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v53)
  {
    uint64_t v7 = *(void *)v58;
    uint64_t v49 = *(void *)v58;
    v50 = self;
    do
    {
      for (i = 0LL; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _geoMapItem]);
        uint64_t v55 = objc_claimAutoreleasedReturnValue([v10 _mapsCategoryId]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 _walletCategoryIdentifier]);
        id v12 = objc_alloc(off_100703618());
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 _walletPlaceStyling]);
        id v56 = [v12 initWithStyleAttributes:v13];

        v54 = (void *)v11;
        uint64_t v14 = PKMerchantCategoryFromString(v11);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "_bestWalletHeroImageForSize:allowSmaller:",  1,  1.79769313e308,  1.79769313e308));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 _walletHeroImageProviderName]);
        if (!v15)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdater _bestHeroImageForMapItem:size:allowSmaller:]( self,  "_bestHeroImageForMapItem:size:allowSmaller:",  v10,  1LL,  1.79769313e308,  1.79769313e308));
          uint64_t v17 = objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdater _heroImageProviderNameForMapItem:]( self,  "_heroImageProviderNameForMapItem:",  v10));

          uint64_t v16 = (void *)v17;
        }

        unsigned int v18 = [v9 _isMapItemTypeBrand];
        dataSource = self->_dataSource;
        id v20 = [v9 _muid];
        if (v18)
        {
          uint64_t v21 = (PKMapsBrand *)objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdaterDataSource mapsBrandWithIdentifier:]( dataSource,  "mapsBrandWithIdentifier:",  v20));
          if (!v21) {
            uint64_t v21 = objc_alloc_init(&OBJC_CLASS___PKMapsBrand);
          }
          -[PKMapsBrand setIdentifier:](v21, "setIdentifier:", [v9 _muid]);
          -[PKMapsBrand setResultProviderIdentifier:]( v21,  "setResultProviderIdentifier:",  [v9 _resultProviderID]);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
          -[PKMapsBrand setName:](v21, "setName:", v22);

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 phoneNumber]);
          -[PKMapsBrand setPhoneNumber:](v21, "setPhoneNumber:", v23);

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 url]);
          -[PKMapsBrand setURL:](v21, "setURL:", v24);

          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0));
          -[PKMapsBrand setLogoURL:](v21, "setLogoURL:", v25);

          -[PKMapsBrand setCategory:](v21, "setCategory:", v14);
          id v26 = (void *)v55;
          -[PKMapsBrand setDetailedCategory:](v21, "setDetailedCategory:", v55);
          if (v56)
          {
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v56,  1LL,  0LL));
            -[PKMapsBrand setStylingInfoData:](v21, "setStylingInfoData:", v27);
          }

          -[PKMapsBrand setHeroImageURL:](v21, "setHeroImageURL:", v15);
          -[PKMapsBrand setHeroImageAttributionName:](v21, "setHeroImageAttributionName:", v16);
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          -[PKMapsBrand setLastProcessedDate:](v21, "setLastProcessedDate:", v28);

          if (-[PKMapsBrand isValid](v21, "isValid"))
          {
            uint64_t Object = PKLogFacilityTypeGetObject(23LL);
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v21;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating maps brand %@", buf, 0xCu);
            }

            -[PDMapsBrandAndMerchantUpdaterDataSource updateMapsBrand:](self->_dataSource, "updateMapsBrand:", v21);
            -[NSMutableArray addObject:](v47, "addObject:", v21);
          }
        }

        else
        {
          uint64_t v52 = v14;
          uint64_t v21 = (PKMapsBrand *)objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdaterDataSource mapsMerchantWithIdentifier:]( dataSource,  "mapsMerchantWithIdentifier:",  v20));
          if (!v21) {
            uint64_t v21 = objc_alloc_init(&OBJC_CLASS___PKMapsMerchant);
          }
          -[PKMapsBrand setIdentifier:](v21, "setIdentifier:", [v9 _muid]);
          -[PKMapsBrand setResultProviderIdentifier:]( v21,  "setResultProviderIdentifier:",  [v9 _resultProviderID]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
          -[PKMapsBrand setName:](v21, "setName:", v31);

          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v9 phoneNumber]);
          -[PKMapsBrand setPhoneNumber:](v21, "setPhoneNumber:", v32);

          v33 = (void *)objc_claimAutoreleasedReturnValue([v9 url]);
          -[PKMapsBrand setURL:](v21, "setURL:", v33);

          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v9 placemark]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 location]);
          -[PKMapsBrand setLocation:](v21, "setLocation:", v35);

          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v9 _placeCardContact]);
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 postalAddresses]);
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 firstObject]);
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 value]);
          -[PKMapsBrand setPostalAddress:](v21, "setPostalAddress:", v39);

          -[PKMapsBrand setCategory:](v21, "setCategory:", v52);
          id v26 = (void *)v55;
          -[PKMapsBrand setDetailedCategory:](v21, "setDetailedCategory:", v55);
          if (v56)
          {
            __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v56,  1LL,  0LL));
            -[PKMapsBrand setStylingInfoData:](v21, "setStylingInfoData:", v40);
          }

          -[PKMapsBrand setHeroImageURL:](v21, "setHeroImageURL:", v15);
          -[PKMapsBrand setHeroImageAttributionName:](v21, "setHeroImageAttributionName:", v16);
          __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          -[PKMapsBrand setLastProcessedDate:](v21, "setLastProcessedDate:", v41);

          uint64_t v7 = v49;
          self = v50;
          if (-[PKMapsBrand isValid](v21, "isValid"))
          {
            uint64_t v42 = PKLogFacilityTypeGetObject(23LL);
            __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Updating maps merchant %@",  buf,  0xCu);
            }

            -[PDMapsBrandAndMerchantUpdaterDataSource updateMapsMerchant:](v50->_dataSource, "updateMapsMerchant:", v21);
            -[NSMutableArray addObject:](v48, "addObject:", v21);
          }
        }
      }

      id v53 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }

    while (v53);
  }

  if (v46)
  {
    id v44 = -[NSMutableArray copy](v48, "copy");
    id v45 = -[NSMutableArray copy](v47, "copy");
    v46[2](v46, v44, v45);
  }
}

- (id)traits
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_traits)
  {
    id v4 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(-[MKMapService defaultTraits](self->_mapService, "defaultTraits"));
    traits = self->_traits;
    self->_traits = v4;

    -[GEOMapServiceTraits setWantsBrandIcon:](self->_traits, "setWantsBrandIcon:", 1LL);
    -[GEOMapServiceTraits setSupportsBrandFallback:](self->_traits, "setSupportsBrandFallback:", 1LL);
  }

  os_unfair_lock_unlock(p_lock);
  return self->_traits;
}

- (id)_bestHeroImageForMapItem:(id)a3 size:(CGSize)a4 allowSmaller:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _photos]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  if (!-[PDMapsBrandAndMerchantUpdater _validHeroImageForPhoto:](self, "_validHeroImageForPhoto:", v11)) {
    goto LABEL_5;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bestPhotoForSize:allowSmaller:", v5, width, height));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 url]);

  if (!v13)
  {

LABEL_5:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_bestHeroBrandIconURLForSize:allowSmaller:", v5, width, height));
    goto LABEL_6;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 url]);

LABEL_6:
  return v14;
}

- (id)_heroImageProviderNameForMapItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _photos]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (-[PDMapsBrandAndMerchantUpdater _validHeroImageForPhoto:](self, "_validHeroImageForPhoto:", v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attribution]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 providerName]);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)_validHeroImageForPhoto:(id)a3
{
  id v3 = a3;
  int BOOL = GEOConfigGetBOOL( GeoServicesConfig_WalletHeroRequiresHighQuality[0],  GeoServicesConfig_WalletHeroRequiresHighQuality[1]);
  int v5 = GEOConfigGetBOOL( GeoServicesConfig_WalletHeroRequiresBusinessProvided[0],  GeoServicesConfig_WalletHeroRequiresBusinessProvided[1]);
  int v6 = v5;
  if (BOOL)
  {
    unsigned int v7 = [v3 highQuality];
    if ((v7 & v6 & 1) == 0) {
      goto LABEL_7;
    }
  }

  else if (!v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }

  LOBYTE(v7) = [v3 businessProvided];
LABEL_7:

  return v7;
}

- (void)_executeNextRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_coalesingRequests || self->_currentRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    id v4 = (PKPaymentTransactionMapsUpdateProcessorRequest *)objc_claimAutoreleasedReturnValue( -[NSMutableArray firstObject]( self->_requests,  "firstObject"));
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    int v6 = self->_currentRequest;
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0LL);
      int v6 = self->_currentRequest;
    }

    unsigned int v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(23LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionMapsUpdateProcessorRequest configurations](v7, "configurations"));
        *(_DWORD *)buf = 138412546;
        id v13 = v7;
        __int16 v14 = 2048;
        id v15 = [v10 count];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting maps update request %@ with %ld items",  buf,  0x16u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100007974;
      v11[3] = &unk_100639118;
      void v11[4] = self;
      -[PDMapsBrandAndMerchantUpdater _startNextMapsUpdatesRequest:completion:]( self,  "_startNextMapsUpdatesRequest:completion:",  v7,  v11);
    }
  }

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFString *)v6;
  id v9 = v8;
  if (v8 == @"PDMapsBrandAndMerchantUpdaterActivityIdentifier"
    || v8
    && (unsigned int v10 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"PDMapsBrandAndMerchantUpdaterActivityIdentifier"),  v9,  v10))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dateByAddingTimeInterval:-2592000.0]);

    uint64_t Object = PKLogFacilityTypeGetObject(23LL);
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Starting maps merchant brand and merchant updater scheduled activity for maps data last updated prior to %@.",  buf,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdaterDataSource mapsMerchantsWithLastUpdatedDateFromStartDate:endDate:limit:]( self->_dataSource,  "mapsMerchantsWithLastUpdatedDateFromStartDate:endDate:limit:",  0LL,  v12,  50LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDMapsBrandAndMerchantUpdaterDataSource mapsBrandsWithLastUpdatedDateFromStartDate:endDate:limit:]( self->_dataSource,  "mapsBrandsWithLastUpdatedDateFromStartDate:endDate:limit:",  0LL,  v12,  50LL));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v16 count];
      id v18 = [v15 count];
      *(_DWORD *)buf = 134218240;
      id v49 = v17;
      __int16 v50 = 2048;
      id v51 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating %ld maps brands and %ld maps merchants",  buf,  0x16u);
    }

    id v37 = v7;

    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v20 = v15;
    id v21 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v21)
    {
      id v23 = v21;
      uint64_t v24 = *(void *)v43;
      do
      {
        __int16 v25 = 0LL;
        do
        {
          if (*(void *)v43 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = objc_msgSend( (id)objc_opt_class(self, v22),  "_configurationForMapsMerchant:",  *(void *)(*((void *)&v42 + 1) + 8 * (void)v25));
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          -[NSMutableSet addObject:](v19, "addObject:", v27);

          __int16 v25 = (char *)v25 + 1;
        }

        while (v23 != v25);
        id v23 = [v20 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }

      while (v23);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v28 = v16;
    id v29 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v29)
    {
      id v31 = v29;
      uint64_t v32 = *(void *)v39;
      do
      {
        v33 = 0LL;
        do
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(v28);
          }
          id v34 = objc_msgSend( (id)objc_opt_class(self, v30),  "_configurationForMapsBrand:",  *(void *)(*((void *)&v38 + 1) + 8 * (void)v33));
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          -[NSMutableSet addObject:](v19, "addObject:", v35);

          v33 = (char *)v33 + 1;
        }

        while (v31 != v33);
        id v31 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }

      while (v31);
    }

    if (-[NSMutableSet count](v19, "count"))
    {
      id v36 = -[NSMutableSet copy](v19, "copy");
      -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfigurations:](self, "updateMapsDataForConfigurations:", v36);
    }

    id v7 = v37;
  }
}

- (void).cxx_destruct
{
}

@end