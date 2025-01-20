@interface UADiagnosticManager
+ (id)sharedManager;
- (UADiagnosticManager)init;
- (id)firstPartyActivityTypeOrUnknown:(id)a3;
- (unint64_t)roundNum:(unint64_t)a3 to:(unint64_t)a4;
- (void)submitDidSendLocalPasteboard:(id)a3;
- (void)submitRemotePasteboardBecameAvailable;
- (void)submitRemotePasteboardBecameUnavailable:(unint64_t)a3;
- (void)submitRemotePasteboardTypeInfoRequested:(id)a3;
- (void)submitRemotePasteboardWasRequested:(id)a3;
- (void)submitUserActivityBecameCurrent:(id)a3 withToken:(id *)a4;
- (void)submitUserActivityWasContinuedInfo:(id)a3;
- (void)submitUserActivityWasDiscovered:(id)a3;
- (void)submitUserActivityWasSuggestedInfo:(id)a3;
@end

@implementation UADiagnosticManager

+ (id)sharedManager
{
  if (qword_1000DE380 != -1) {
    dispatch_once(&qword_1000DE380, &stru_1000BD9C0);
  }
  return (id)qword_1000DE378;
}

- (UADiagnosticManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UADiagnosticManager;
  return -[UADiagnosticManager init](&v3, "init");
}

- (void)submitUserActivityBecameCurrent:(id)a3 withToken:(id *)a4
{
  id v6 = a3;
  if (!a4
    || (__int128 v7 = *(_OWORD *)&a4->var0[4],
        v14[0] = *(_OWORD *)a4->var0,
        v14[1] = v7,
        v8 = sub_10004A37C(v14),
        (v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8)) == 0LL))
  {
    v9 = @"unknown";
  }

  v10 = objc_alloc_init(&OBJC_CLASS___UAActivityBecameCurrentEvent);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UADiagnosticManager firstPartyActivityTypeOrUnknown:](self, "firstPartyActivityTypeOrUnknown:", v6));
  -[UAActivityBecameCurrentEvent setActivityType:](v10, "setActivityType:", v11);

  -[UAActivityBecameCurrentEvent setBundleIdentifier:](v10, "setBundleIdentifier:", v9);
  -[UAAnalyticsEvent sendEvent](v10, "sendEvent");
  os_log_t v12 = sub_100039584(@"Diagnostic");
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(v14[0]) = 138477827;
    *(void *)((char *)v14 + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Submitted UAActivityBecameCurrentEvent: %{private}@",  (uint8_t *)v14,  0xCu);
  }
}

- (void)submitUserActivityWasDiscovered:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___UAActivityWasDiscoveredEvent);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UADiagnosticManager firstPartyActivityTypeOrUnknown:](self, "firstPartyActivityTypeOrUnknown:", v4));

  -[UAActivityWasDiscoveredEvent setActivityType:](v5, "setActivityType:", v6);
  -[UAAnalyticsEvent sendEvent](v5, "sendEvent");
  os_log_t v7 = sub_100039584(@"Diagnostic");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138477827;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Submitted UAActivityWasDiscoveredEvent: %{private}@",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)submitUserActivityWasSuggestedInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[UAActivityWasSuggestedEvent initWithAnalyticsInfo:]( objc_alloc(&OBJC_CLASS___UAActivityWasSuggestedEvent),  "initWithAnalyticsInfo:",  v3);

    -[UAActivityWasSuggestedEvent sendEvent](v4, "sendEvent");
    os_log_t v5 = sub_100039584(@"Diagnostic");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138477827;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Submitted UAActivityWasSuggestedEvent: %{private}@",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)submitUserActivityWasContinuedInfo:(id)a3
{
  id v3 = a3;
  if (([v3 payloadRequested] & 1) != 0 || !objc_msgSend(v3, "isCancelled"))
  {
    os_log_t v5 = -[UAActivityWasContinuedEvent initWithAnalyticsInfo:]( objc_alloc(&OBJC_CLASS___UAActivityWasContinuedEvent),  "initWithAnalyticsInfo:",  v3);
    -[UAAnalyticsEvent sendEvent](v5, "sendEvent");
    os_log_t v6 = sub_100039584(@"Diagnostic");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
      int v9 = 138412547;
      v10 = v8;
      __int16 v11 = 2113;
      os_log_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Submitted UAActivityWasContinuedEvent for %@: %{private}@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else
  {
    os_log_t v4 = sub_100039584(@"Diagnostic");
    os_log_t v5 = (UAActivityWasContinuedEvent *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "Not reporting activity was continued becasuse payload was never requested.",  (uint8_t *)&v9,  2u);
    }
  }
}

- (id)firstPartyActivityTypeOrUnknown:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@":com.apple."] & 1) != 0
    || ([v3 hasPrefix:@"com.apple."] & 1) != 0
    || [v3 isEqualToString:@"NSUserActivityTypeBrowsingWeb"])
  {
    os_log_t v4 = (__CFString *)v3;
  }

  else
  {
    os_log_t v4 = @"unknown";
  }

  os_log_t v5 = sub_100039584(@"Diagnostic");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138478083;
    id v9 = v3;
    __int16 v10 = 2113;
    __int16 v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Metric AT for %{private}@ is %{private}@",  (uint8_t *)&v8,  0x16u);
  }

  return v4;
}

- (void)submitRemotePasteboardWasRequested:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  os_log_t v4 = sub_100039584(@"Diagnostic");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v7 = sub_10005BF18(v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138477827;
    __int16 v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Submitted UARemotePasteboardWasRequestedEvent: %{private}@",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)submitDidSendLocalPasteboard:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  os_log_t v4 = sub_100039584(@"Diagnostic");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v7 = sub_10005BF18(v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138477827;
    __int16 v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Submitted UARemotePasteboardDidSendLocalEvent: %{private}@",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)submitRemotePasteboardTypeInfoRequested:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  os_log_t v4 = sub_100039584(@"Diagnostic");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v7 = sub_10005BF18(v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = 138477827;
    __int16 v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Submitted UARemotePasteboardTypeInfoRequestedEvent: %{private}@",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)submitRemotePasteboardBecameAvailable
{
  v2 = objc_alloc_init(&OBJC_CLASS___UARemotePasteboardBecameAvailableEvent);
  -[UAAnalyticsEvent sendEvent](v2, "sendEvent");
  os_log_t v3 = sub_100039584(@"Diagnostic");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAAnalyticsEvent description](v2, "description"));
    id v6 = sub_10005BF18(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138477827;
    int v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Submitted UARemotePasteboardBecameAvailableEvent: %{private}@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)submitRemotePasteboardBecameUnavailable:(unint64_t)a3
{
  os_log_t v4 = objc_alloc_init(&OBJC_CLASS___UARemotePasteboardBecameUnavailableEvent);
  -[UARemotePasteboardBecameUnavailableEvent setReason:](v4, "setReason:", a3);
  -[UAAnalyticsEvent sendEvent](v4, "sendEvent");
  os_log_t v5 = sub_100039584(@"Diagnostic");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138477827;
    int v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Submitted UARemotePasteboardBecameUnavailableEvent: %{private}@",  (uint8_t *)&v7,  0xCu);
  }
}

- (unint64_t)roundNum:(unint64_t)a3 to:(unint64_t)a4
{
  return (unint64_t)(ceil((double)a3 / (double)a4) * (double)a4);
}

@end