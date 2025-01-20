@interface UAUserActivityAdvertisableItem
- (BOOL)alwaysEligible;
- (BOOL)alwaysPick;
- (BOOL)eligibleInBackground;
- (BOOL)eligibleToAdvertise;
- (BOOL)eligibleToAlwaysAdvertise;
- (BOOL)isDirty;
- (BOOL)needsUpdateBeforeAdvertising;
- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4;
- (BOOL)update:(id)a3;
- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3;
- (NSString)proxiedBundleIdentifier;
- (UAUserActivityAdvertisableItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 client:(id)a6;
- (UAUserActivityAdvertisableItem)initWithUserActivityInfo:(id)a3 client:(id)a4;
- (UAUserActivityClientProcess)client;
- (id)provenance;
- (id)webpageURL;
- (int64_t)alwaysPickValue;
- (void)setClient:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation UAUserActivityAdvertisableItem

- (UAUserActivityAdvertisableItem)initWithUserActivityInfo:(id)a3 client:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UAUserActivityAdvertisableItem;
  v7 = -[UAUserActivityAdvertisableItem initWithUserActivityInfo:](&v10, "initWithUserActivityInfo:", a3);
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_client, v6);
  }

  return v8;
}

- (UAUserActivityAdvertisableItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 client:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UAUserActivityAdvertisableItem;
  v11 = -[UAUserActivityAdvertisableItem initWithUUID:type:options:](&v15, "initWithUUID:type:options:", a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_client, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 teamID]);
    -[UAUserActivityAdvertisableItem setTeamIdentifier:](v12, "setTeamIdentifier:", v13);
  }

  return v12;
}

- (id)webpageURL
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UAUserActivityAdvertisableItem;
  id v2 = -[UAUserActivityAdvertisableItem webpageURL](&v4, "webpageURL");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setWebpageURL:(id)a3
{
  id v4 = a3;
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem webpageURL](self, "webpageURL")),
        unsigned __int8 v6 = [v4 isEqual:v5],
        v5,
        (v6 & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___UAUserActivityAdvertisableItem;
    -[UAUserActivityAdvertisableItem setWebpageURL:](&v7, "setWebpageURL:", v4);
  }
}

- (BOOL)alwaysPick
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  unsigned int v4 = [v3 allowedToUseLSAlwaysPick];

  if (!v4) {
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:UAUserActivityAlwaysPickKey]);

  if (v6) {
    BOOL v7 = (uint64_t)[v6 integerValue] > 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)alwaysPickValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:UAUserActivityAlwaysPickKey]);

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client")),
        unsigned int v6 = [v5 allowedToUseLSAlwaysPick],
        v5,
        v6))
  {
    id v7 = [v4 integerValue];
  }

  else
  {
    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (BOOL)alwaysEligible
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:UAAlwaysAdvertise]);

  if (v4
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    && [v4 integerValue])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    unsigned __int8 v7 = [v6 allowedToUseUAAlwaysAdvertise];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)eligibleInBackground
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:UAUserActivityEligibleEvenWhenInBackgroundKey]);

  if ((uint64_t)[v4 integerValue] >= 1
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client")),
        unsigned int v6 = [v5 allowedToUseEligibleEvenWhenInBackground],
        v5,
        v6))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    unsigned __int8 v8 = [v7 allowedToUseEligibleEvenWhenInBackground];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)provenance
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
    id v7 = [v6 pid];
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem activityType](self, "activityType"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem dynamicActivityType](self, "dynamicActivityType"));
    id v10 = (void *)v9;
    v11 = &stru_1000BE738;
    if (v9) {
      v11 = (const __CFString *)v9;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UA:%@-%d/%@-%@",  v4,  v7,  v8,  v11));
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem activityType](self, "activityType"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem dynamicActivityType](self, "dynamicActivityType"));
    unsigned int v6 = (void *)v13;
    v14 = &stru_1000BE738;
    if (v13) {
      v14 = (const __CFString *)v13;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UA:%@/%@-%@",  v4,  v5,  v14));
  }

  return v12;
}

- (NSString)proxiedBundleIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem options](self, "options"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);
  }

  else
  {
    unsigned int v6 = 0LL;
  }

  return (NSString *)v6;
}

- (BOOL)update:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  -[UAUserActivityAdvertisableItem setTitle:](self, "setTitle:", v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 payloads]);
  -[UAUserActivityAdvertisableItem setPayloads:](self, "setPayloads:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
  -[UAUserActivityAdvertisableItem setExpirationDate:](self, "setExpirationDate:", v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 webpageURL]);
  -[UAUserActivityAdvertisableItem setWebpageURL:](self, "setWebpageURL:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 referrerURL]);
  -[UAUserActivityAdvertisableItem setReferrerURL:](self, "setReferrerURL:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 targetContentIdentifier]);
  -[UAUserActivityAdvertisableItem setTargetContentIdentifier:](self, "setTargetContentIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentIdentifier]);
  -[UAUserActivityAdvertisableItem setPersistentIdentifier:](self, "setPersistentIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  -[UAUserActivityAdvertisableItem setOptions:](self, "setOptions:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 when]);
  -[UAUserActivityAdvertisableItem setWhen:](self, "setWhen:", v13);

  -[UAUserActivityAdvertisableItem setEligibleForHandoff:]( self,  "setEligibleForHandoff:",  [v4 eligibleForHandoff]);
  -[UAUserActivityAdvertisableItem setEligibleForSearch:]( self,  "setEligibleForSearch:",  [v4 eligibleForSearch]);
  id v14 = [v4 eligibleForPublicIndexing];

  -[UAUserActivityAdvertisableItem setEligibleForPublicIndexing:](self, "setEligibleForPublicIndexing:", v14);
  return 1;
}

- (BOOL)eligibleToAdvertise
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
  unsigned int v5 = [v3 isEligibleToAdvertiseWithUUID:v4];

  if (!v5) {
    return -[UAUserActivityAdvertisableItem eligibleToAlwaysAdvertise](self, "eligibleToAlwaysAdvertise") | v5;
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem expirationDate](self, "expirationDate"));
  if (!v6) {
    return -[UAUserActivityAdvertisableItem eligibleToAlwaysAdvertise](self, "eligibleToAlwaysAdvertise") | v5;
  }
  id v7 = (void *)v6;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem expirationDate](self, "expirationDate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unint64_t v10 = (unint64_t)[v8 compare:v9];

  if ((v10 & 0x8000000000000000LL) == 0) {
    return -[UAUserActivityAdvertisableItem eligibleToAlwaysAdvertise](self, "eligibleToAlwaysAdvertise") | v5;
  }
  os_log_t v12 = sub_100039584(0LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem statusString](self, "statusString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem expirationDate](self, "expirationDate"));
    int v18 = 138543875;
    v19 = v15;
    __int16 v20 = 2113;
    v21 = v16;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "-- item %{public}@/%{private}@ not eligible, because it has expired (on %{public}@)",  (uint8_t *)&v18,  0x20u);
  }

  return 0;
}

- (BOOL)eligibleToAlwaysAdvertise
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
  unsigned __int8 v5 = [v3 isEligibleToAlwaysAdvertiseWithUUID:v4];

  return v5;
}

- (BOOL)isDirty
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
  unsigned __int8 v5 = [v3 isDirtyActivityWithUUID:v4];

  return v5;
}

- (BOOL)needsUpdateBeforeAdvertising
{
  return 0;
}

- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  os_log_t v7 = sub_100039584(0LL);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 auditToken]);
    int v18 = 138543618;
    v19 = v10;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "requestPayload...:, %{public}@ from client application %{public}@",  (uint8_t *)&v18,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
    unsigned __int8 v16 = [v14 askSourceProcessToUpdateActivityWithUUID:v15 evenIfClean:v4 completionHandler:v6];
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 auditToken]);
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = (int)[v10 pid];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "wasResumedOnAnotherDevice, %{public}@ to client pid=%ld",  (uint8_t *)&v16,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
  if (v11)
  {
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem client](self, "client"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](self, "uuid"));
    unsigned __int8 v14 = [v12 didResumeUserActivityWithUUID:v13 completionHandler:v4];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (UAUserActivityClientProcess)client
{
  return (UAUserActivityClientProcess *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end