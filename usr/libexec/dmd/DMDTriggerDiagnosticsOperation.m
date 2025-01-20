@interface DMDTriggerDiagnosticsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDTriggerDiagnosticsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFTriggerDiagnosticsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5D60;
}

- (void)runWithRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPowerAssertion assertionForOperation:]( &OBJC_CLASS___DMDPowerAssertion,  "assertionForOperation:",  @"DMDTriggerDiagnosticsOperation: run"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005B5A4;
  v8[3] = &unk_10009D820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

@end