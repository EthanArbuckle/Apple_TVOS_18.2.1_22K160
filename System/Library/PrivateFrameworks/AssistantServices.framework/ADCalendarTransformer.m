@interface ADCalendarTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADCalendarTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  v9 = (void (**)(id, id))a4;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SACalendarShowNextEvent);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0) {
    v8 = objc_alloc_init(&OBJC_CLASS___AFShowNextEventRequest);
  }
  else {
    v8 = 0LL;
  }
  v9[2](v9, v8);
}

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
LABEL_8:
    v12 = v14;
    goto LABEL_9;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (![v10 isEqualToString:@"com.apple.siri.calendar.Error"])
  {

    goto LABEL_7;
  }

  id v11 = [v8 code];

  if (v11 != (id)100)
  {
LABEL_7:
    v14 = (SACommandSucceeded *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ad_aceResponseCommandGenericErrorRepresentation"));
    goto LABEL_8;
  }

  v12 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 aceId]);
  -[SACommandFailed setRefId:](v12, "setRefId:", v13);

  -[SACommandFailed setErrorCode:](v12, "setErrorCode:", SACalendarNoEventsFoundErrorCode);
  -[SACommandFailed setReason:](v12, "setReason:", @"No matching event was found");
LABEL_9:

  return v12;
}

@end