@interface DMDRequestAirPlayMirroringOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRequestAirPlayMirroringOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRequestAirPlayMirroringRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5B08;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAirPlayManager shared](&OBJC_CLASS___DMDAirPlayManager, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationName]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationDeviceID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 password]);
  [v4 scanWaitInterval];
  double v10 = v9;
  id v11 = [v4 force];

  id v17 = 0LL;
  LOBYTE(v4) = [v5 startAirPlaySessionWithDestinationName:v6 destinationDeviceID:v7 password:v8 scanWaitTime:3 sessi onType:v11 force:&v17 error:v10];
  id v12 = v17;

  if ((v4 & 1) != 0)
  {
    -[DMDRequestAirPlayMirroringOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    if (v12)
    {
      NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
      id v19 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      uint64_t v14 = DMFErrorWithCodeAndUserInfo(113LL, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[DMDRequestAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v15);
    }

    else
    {
      uint64_t v16 = DMFErrorWithCodeAndUserInfo(113LL, 0LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[DMDRequestAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v13);
    }
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDRequestAirPlayMirroringOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationName]);
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationDeviceID]);

    if (v8) {
      goto LABEL_5;
    }
    if (a4)
    {
      uint64_t v10 = DMFErrorWithCodeAndUserInfo(1300LL, 0LL);
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_9;
    }

@end