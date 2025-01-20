@interface ADBiomeStreamProcessor
+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 account:(id)a5;
+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 userId:(id)a5;
+ (id)processorForBMSiriUserAggregationId:(id)a3 userId:(id)a4;
+ (id)processorForBMSiriUserSeed:(id)a3 userId:(id)a4;
- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 account:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9;
- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 userId:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9;
- (id)_merge:(id)a3 with:(id)a4;
- (id)_mergeRemotes:(id)a3;
- (id)_processPerDeviceEvents:(id)a3;
- (id)fetchIdItemPair;
- (id)fetchLocalIdItemPair;
@end

@implementation ADBiomeStreamProcessor

- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 userId:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  if (v15)
  {
    v21 = -[BMAccount initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___BMAccount),  "initWithAccountIdentifier:",  v15);
    v22 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:]( self,  "initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:",  v20,  v19,  v18,  v17,  v21,  v16,  a9);

    v23 = v22;
  }

  else
  {
    v24 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:]( self,  "initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:",  v20,  v19,  v18,  v17,  0LL,  v16,  a9);

    v23 = v24;
  }

  return v23;
}

- (ADBiomeStreamProcessor)initWithStream:(id)a3 fromBM:(id)a4 toBM:(id)a5 time:(id)a6 account:(id)a7 homeId:(id)a8 remoteDeviceTypes:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v37 = a7;
  id v20 = a8;
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v42 = v16;
    __int16 v43 = 2112;
    id v44 = v20;
    __int16 v45 = 2112;
    id v46 = v37;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Initializing BiomeProcessor for stream:%@ homeId:%@ accountId:%@",  buf,  0x20u);
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___ADBiomeStreamProcessor;
  v22 = -[ADBiomeStreamProcessor init](&v40, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_stream, a3);
    id v24 = objc_retainBlock(v17);
    id fromBMMapper = v23->_fromBMMapper;
    v23->_id fromBMMapper = v24;

    id v26 = objc_retainBlock(v18);
    id toBMMapper = v23->_toBMMapper;
    v23->_id toBMMapper = v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem calendar](&OBJC_CLASS___ADSynchronizedIdItem, "calendar"));
    calendar = v23->_calendar;
    v23->_calendar = (NSCalendar *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem alignToMidnight:](&OBJC_CLASS___ADSynchronizedIdItem, "alignToMidnight:", v19));
    today = v23->_today;
    v23->_today = (NSDate *)v30;

    objc_storeStrong((id *)&v23->_accountId, a7);
    objc_storeStrong((id *)&v23->_homeId, a8);
    homeId = v23->_homeId;
    if (homeId)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_1001A2C58;
      v38[3] = &unk_1004F4CF8;
      v33 = v38;
      a7 = &v39;
      id v39 = v20;
    }

    else
    {
      v33 = 0LL;
    }

    v34 = objc_retainBlock(v33);
    id homeFilter = v23->_homeFilter;
    v23->_id homeFilter = v34;

    v23->_remoteDeviceTypes = a9;
    if (homeId) {
  }
    }

  return v23;
}

- (id)fetchIdItemPair
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ADBiomeStreamProcessor fetchLocalIdItemPair](self, "fetchLocalIdItemPair"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1001A2BF8;
  v51[3] = &unk_1004F4D20;
  v51[4] = self;
  v4 = objc_retainBlock(v51);
  if (self->_accountId)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___BMPublisherOptions);
    stream = self->_stream;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", self->_accountId));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[BMStream publishersForAccounts:deviceTypes:includeLocal:options:useCase:pipeline:]( stream,  "publishersForAccounts:deviceTypes:includeLocal:options:useCase:pipeline:",  v7,  self->_remoteDeviceTypes,  0LL,  v5,  @"PrivacyFriendlyAnalyticsIdentifiersProvider",  v4));

    id v9 = objc_alloc(&OBJC_CLASS___BMPublishers);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 publishers]);
    id v11 = [v9 initWithPublishers:v10];
  }

  else
  {
    v12 = self->_stream;
    id v50 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream remoteDevicesWithError:](v12, "remoteDevicesWithError:", &v50));
    id v5 = v50;
    if (v5)
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Fetching list of remote devices failed: %@",  buf,  0xCu);
      }
    }

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = (uint64_t)v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Known remote devices: %@", buf, 0xCu);
    }

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1001A2C04;
    v49[3] = &unk_1004F4D48;
    v49[4] = self;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v49));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v16]);

    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = (uint64_t)v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Filtered remote devices: %@", buf, 0xCu);
    }

    id v18 = self->_stream;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 10LL));
    LOWORD(v48) = 1;
    id v11 = (id)objc_claimAutoreleasedReturnValue( -[BMStream publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:]( v18,  "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:",  v8,  @"PrivacyFriendlyAnalyticsIdentifiersProvider",  0LL,  0LL,  v10,  0LL,  v48,  v4));
  }

  id v19 = v11;

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[ADBiomeStreamProcessor _mergeRemotes:](self, "_mergeRemotes:", v19));
  v21 = (void *)v20;
  if (!(v3 | v20))
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "No local or remote entries", buf, 2u);
    }

    v23 = 0LL;
    goto LABEL_36;
  }

  if (v20)
  {
    if (!v3)
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v21;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Only remote entry is present: %@",  buf,  0xCu);
      }

      v23 = -[ADSynchronizedIdItemPair initWithRemote:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItemPair),  "initWithRemote:",  v21);
      goto LABEL_28;
    }

    v23 = (ADSynchronizedIdItemPair *)objc_claimAutoreleasedReturnValue([(id)v3 adoptRemoteIfEarly:v20]);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 != (ADSynchronizedIdItemPair *)v3)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v3;
        __int16 v54 = 2112;
        uint64_t v55 = (uint64_t)v21;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Discarding local: %@; keeping remote: %@",
          buf,
          0x16u);
      }

LABEL_28:
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Publishing the selected entries",  buf,  2u);
      }

      if (self->_accountId)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream sourceWithAccount:](self->_stream, "sourceWithAccount:"));
        id toBMMapper = (uint64_t (**)(id, void *))self->_toBMMapper;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair current](v23, "current"));
        uint64_t v32 = toBMMapper[2](toBMMapper, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        [v29 sendEvent:v33];

        v34 = (uint64_t (**)(id, void *))self->_toBMMapper;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair next](v23, "next"));
        uint64_t v36 = v34[2](v34, v35);
        id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        [v29 sendEvent:v37];
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BMStream source](self->_stream, "source"));
      id v39 = (uint64_t (**)(id, void *))self->_toBMMapper;
      objc_super v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair current](v23, "current"));
      uint64_t v41 = v39[2](v39, v40);
      id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      [v38 sendEvent:v42];

      __int16 v43 = (uint64_t (**)(id, void *))self->_toBMMapper;
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair next](v23, "next"));
      uint64_t v45 = v43[2](v43, v44);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      [v38 sendEvent:v46];

      goto LABEL_36;
    }

    if (v25)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = (uint64_t)v21;
      __int16 v54 = 2112;
      uint64_t v55 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Discarding remote: %@; keeping local: %@",
        buf,
        0x16u);
    }

    v23 = (ADSynchronizedIdItemPair *)v3;
  }

  else
  {
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Only local entry is present: %@",  buf,  0xCu);
    }

    v23 = (ADSynchronizedIdItemPair *)(id)v3;
  }

- (id)fetchLocalIdItemPair
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1001A2954;
  id v19 = sub_1001A2964;
  id v20 = 0LL;
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Processing local events", buf, 2u);
  }

  id v4 = [[BMPublisherOptions alloc] initWithStartDate:0 endDate:0 maxEvents:10 lastN:0 reversed:1];
  accountId = self->_accountId;
  stream = self->_stream;
  if (accountId) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[BMStream publisherForAccount:device:withUseCase:options:]( stream,  "publisherForAccount:device:withUseCase:options:",  accountId,  0LL,  @"PrivacyFriendlyAnalyticsIdentifiersProvider",  v4));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[BMStream publisherWithUseCase:options:]( stream,  "publisherWithUseCase:options:",  @"PrivacyFriendlyAnalyticsIdentifiersProvider",  v4));
  }
  v8 = (void *)v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADBiomeStreamProcessor _processPerDeviceEvents:](self, "_processPerDeviceEvents:", v7));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001A2B0C;
  v13[3] = &unk_1004F4D90;
  v13[4] = &v15;
  id v10 = [v9 sinkWithCompletion:&stru_1004F4D68 receiveInput:v13];

  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)_merge:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Attempting to merge %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 selectEarliest:v6]);
    id v10 = v5;
    if ((id)v9 != v5)
    {
      id v11 = (void *)v9;
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        id v15 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Merged into %@", (uint8_t *)&v14, 0xCu);
      }

      id v10 = v11;
    }
  }

  else
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Starting merge with %@",  (uint8_t *)&v14,  0xCu);
    }

    id v10 = v6;
  }

  return v10;
}

- (id)_mergeRemotes:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_1001A2954;
  uint64_t v17 = sub_1001A2964;
  id v18 = 0LL;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  int v12 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 merge]);
  v9[6] = &v13;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001A296C;
  v10[3] = &unk_1004F4DB8;
  v10[4] = v11;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001A2AB0;
  v9[3] = &unk_1004F4DE0;
  v9[4] = self;
  v9[5] = v11;
  id v6 = [v5 sinkWithCompletion:v10 receiveInput:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)_processPerDeviceEvents:(id)a3
{
  id v4 = a3;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  int v27 = 0;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  int v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  int v23 = 0;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  int v21 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  int v19 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001A25EC;
  v17[3] = &unk_1004F4E08;
  v17[4] = self;
  v17[5] = v26;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 filterWithIsIncluded:v17]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001A2708;
  v16[3] = &unk_1004F4E30;
  v16[4] = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mapWithTransform:v16]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001A2758;
  v15[3] = &unk_1004F4E58;
  v15[4] = v20;
  v15[5] = v18;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 filterWithIsIncluded:v15]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001A278C;
  v14[3] = &unk_1004F4E80;
  v14[4] = self;
  v14[5] = v24;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filterWithIsIncluded:v14]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001A27D8;
  v13[3] = &unk_1004F4EA8;
  v13[4] = self;
  void v13[5] = v22;
  v13[6] = v20;
  v13[7] = v18;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mapWithTransform:v13]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001A2944;
  v12[3] = &unk_1004F4ED0;
  v12[4] = self;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reduceWithInitial:0 nextPartialResult:v12]);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  return v10;
}

- (void).cxx_destruct
{
}

+ (id)processorForBMSiriUserSeed:(id)a3 userId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Initializing UserSeed BiomeStreamProcessor for userId:%@",  buf,  0xCu);
  }

  BOOL v8 = objc_alloc(&OBJC_CLASS___ADBiomeStreamProcessor);
  uint64_t v10 = BiomeLibrary(v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 Siri]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 AnalyticsIdentifiers]);
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UserSeed]);
  uint64_t v15 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:userId:homeId:remoteDeviceTypes:]( v8,  "initWithStream:fromBM:toBM:time:userId:homeId:remoteDeviceTypes:",  v14,  &stru_1004F4BA8,  &stru_1004F4BE8,  v6,  v5,  0LL,  94LL);

  return v15;
}

+ (id)processorForBMSiriUserAggregationId:(id)a3 userId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Initializing UserAggregationId BiomeStreamProcessor for userId:%@",  buf,  0xCu);
  }

  BOOL v8 = objc_alloc(&OBJC_CLASS___ADBiomeStreamProcessor);
  uint64_t v10 = BiomeLibrary(v8, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 Siri]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 AnalyticsIdentifiers]);
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UserAggregationId]);
  uint64_t v15 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:userId:homeId:remoteDeviceTypes:]( v8,  "initWithStream:fromBM:toBM:time:userId:homeId:remoteDeviceTypes:",  v14,  &stru_1004F4C28,  &stru_1004F4C68,  v6,  v5,  0LL,  94LL);

  return v15;
}

+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 userId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Initializing HomeSeed BiomeStreamProcessor for homeId:%@ userId:%@",  (uint8_t *)&v15,  0x16u);
  }

  if (v10)
  {
    int v12 = -[BMAccount initWithAltDSID:](objc_alloc(&OBJC_CLASS___BMAccount), "initWithAltDSID:", v10);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 processorForBMSiriHomeSeed:v8 homeId:v9 account:v12]);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 processorForBMSiriHomeSeed:v8 homeId:v9 account:0]);
  }

  return v13;
}

+ (id)processorForBMSiriHomeSeed:(id)a3 homeId:(id)a4 account:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Initializing HomeSeed BiomeStreamProcessor for homeId:%@ account:%@",  buf,  0x16u);
  }

  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  id v24 = sub_1001A3298;
  int v25 = &unk_1004F4CD0;
  id v26 = v7;
  id v11 = v7;
  int v12 = objc_retainBlock(&v22);
  uint64_t v13 = objc_alloc(&OBJC_CLASS___ADBiomeStreamProcessor);
  uint64_t v15 = BiomeLibrary(v13, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 Siri]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 AnalyticsIdentifiers]);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 HomeSeed]);
  id v20 = -[ADBiomeStreamProcessor initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:]( v13,  "initWithStream:fromBM:toBM:time:account:homeId:remoteDeviceTypes:",  v19,  &stru_1004F4CA8,  v12,  v9,  v8,  v11,  160LL,  v22,  v23,  v24,  v25);

  return v20;
}

@end