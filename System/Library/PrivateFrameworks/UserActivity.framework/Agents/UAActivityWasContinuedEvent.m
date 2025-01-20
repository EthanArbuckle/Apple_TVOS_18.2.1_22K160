@interface UAActivityWasContinuedEvent
- (UAActivityWasContinuedEvent)initWithAnalyticsInfo:(id)a3;
- (UAUserActivityAnalyticsInfo)info;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (id)stringForInteraction;
- (void)setInfo:(id)a3;
@end

@implementation UAActivityWasContinuedEvent

- (UAActivityWasContinuedEvent)initWithAnalyticsInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UAActivityWasContinuedEvent;
  v5 = -[UAActivityWasContinuedEvent init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[UAActivityWasContinuedEvent setInfo:](v5, "setInfo:", v4);
  }

  return v6;
}

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasContinued";
}

- (id)eventPayload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
  }

  else
  {
    v62 = (__CFString *)&off_1000C46C0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteDeviceType]);

  if (!v8)
  {
    os_log_t v9 = sub_100039584(0LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No remote device type set", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
    [v11 setRemoteDeviceType:@"Unknown"];
  }

  v64[0] = @"activityType";
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent reportedActivityType](self, "reportedActivityType"));
  v61 = (void *)v12;
  if (v12) {
    v13 = (const __CFString *)v12;
  }
  else {
    v13 = @"-";
  }
  v65[0] = v13;
  v64[1] = @"bundleIdentifier";
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v60 bundleIdentifier]);
  v59 = (void *)v14;
  if (v14) {
    v15 = (const __CFString *)v14;
  }
  else {
    v15 = @"-";
  }
  v65[1] = v15;
  v64[2] = @"suggestedActionType";
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v58 suggestedActionType]));
  v57 = (void *)v16;
  if (v16) {
    v17 = (const __CFString *)v16;
  }
  else {
    v17 = @"-";
  }
  v65[2] = v17;
  v64[3] = @"payloadSize";
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v56 payloadSize]));
  v55 = (void *)v18;
  if (v18) {
    v19 = (const __CFString *)v18;
  }
  else {
    v19 = @"-";
  }
  v65[3] = v19;
  v64[4] = @"transferSpeed";
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  [v54 transferSpeed];
  uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v20)));
  v53 = (void *)v21;
  if (v21) {
    v22 = (const __CFString *)v21;
  }
  else {
    v22 = @"-";
  }
  v65[4] = v22;
  v64[5] = @"transferDurationSec";
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  [v52 transferDuration];
  uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v51 = (void *)v23;
  if (v23) {
    v24 = (const __CFString *)v23;
  }
  else {
    v24 = @"-";
  }
  v65[5] = v24;
  v64[6] = @"canceled";
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v50 isCancelled]));
  v49 = (void *)v25;
  if (v25) {
    v26 = (const __CFString *)v25;
  }
  else {
    v26 = @"-";
  }
  v65[6] = v26;
  v64[7] = @"broweserFallback";
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 isBrowserFallback]));
  v28 = (void *)v27;
  if (v27) {
    v29 = (const __CFString *)v27;
  }
  else {
    v29 = @"-";
  }
  v65[7] = v29;
  v64[8] = @"webToNative";
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 webToNative]));
  v32 = (void *)v31;
  if (v31) {
    v33 = (const __CFString *)v31;
  }
  else {
    v33 = @"-";
  }
  v65[8] = v33;
  v64[9] = @"supportsContinuityStreams";
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v34 supportsContinuityStreams]));
  v36 = (void *)v35;
  if (v35) {
    v37 = (const __CFString *)v35;
  }
  else {
    v37 = @"-";
  }
  v65[9] = v37;
  v64[10] = @"remoteDeviceType";
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 remoteDeviceType]);
  v40 = (void *)v39;
  if (v39) {
    v41 = (const __CFString *)v39;
  }
  else {
    v41 = @"-";
  }
  if (v62) {
    v42 = v62;
  }
  else {
    v42 = @"-";
  }
  v65[10] = v41;
  v65[11] = v42;
  v64[11] = @"errorCode";
  v64[12] = @"interactionType";
  uint64_t v43 = objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent stringForInteraction](self, "stringForInteraction"));
  v44 = (void *)v43;
  if (v43) {
    v45 = (const __CFString *)v43;
  }
  else {
    v45 = @"-";
  }
  v65[12] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  13LL));

  return v46;
}

- (id)reportedActivityType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activityType]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent firstPartyActivityTypeOrUnknown:](self, "firstPartyActivityTypeOrUnknown:", v4));

  return v5;
}

- (id)stringForInteraction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityWasContinuedEvent info](self, "info"));
  uint64_t v3 = (uint64_t)[v2 interactionType];

  id v4 = @"unknown";
  v5 = @"spotlight";
  if (v3 != 805306369) {
    v5 = @"unknown";
  }
  if (v3 == 805306368) {
    v6 = @"proxy-object";
  }
  else {
    v6 = v5;
  }
  if (v3 == 536870913) {
    v7 = @"multi-tasker";
  }
  else {
    v7 = @"unknown";
  }
  if (v3 == 0x20000000) {
    objc_super v8 = @"lock-screen";
  }
  else {
    objc_super v8 = v7;
  }
  if (v3 <= 805306367) {
    os_log_t v9 = v8;
  }
  else {
    os_log_t v9 = v6;
  }
  if (v3 == 268435458) {
    id v4 = @"notification-center";
  }
  if (v3 == 268435457) {
    id v4 = @"dock";
  }
  if (v3 == 0x10000000) {
    id v4 = @"command-tab";
  }
  if (v3 <= 0x1FFFFFFF) {
    return (id)v4;
  }
  else {
    return (id)v9;
  }
}

- (UAUserActivityAnalyticsInfo)info
{
  return (UAUserActivityAnalyticsInfo *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end