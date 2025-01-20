@interface DMDSendEventOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSendEventOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSendEventRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5B50;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___DMDEventStreamEvent);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 eventType]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 details]);
    v9 = -[DMDEventStreamEvent initWithEventType:details:](v6, "initWithEventType:details:", v7, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 inReplyTo]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEventStreamEvent eventStatusMessageWithPayloadIdentifier:]( v9,  "eventStatusMessageWithPayloadIdentifier:",  v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v17 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005505C;
    v16[3] = &unk_10009E850;
    v16[4] = self;
    [v12 sendEvents:v13 organizationIdentifier:v14 completionHandler:v16];
  }

  else
  {
    uint64_t v15 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v9 = (DMDEventStreamEvent *)objc_claimAutoreleasedReturnValue(v15);
    -[DMDSendEventOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDSendEventOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v20 = DMFInvalidParameterErrorKey;
    v21 = @"request.organizationIdentifier";
    v10 = &v21;
    v11 = &v20;
    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 inReplyTo]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    v19 = @"request.inRepyTo";
    v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 eventType]);

  if (!v9)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    v17 = @"request.eventType";
    v10 = &v17;
    v11 = &v16;
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(1LL, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_13:
    LOBYTE(a4) = 0;
    goto LABEL_14;
  }

  LOBYTE(a4) = 1;
LABEL_14:

  return (char)a4;
}

@end