@interface DMDStopAirPlayMirroringOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDStopAirPlayMirroringOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFStopAirPlayMirroringRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5D18;
}

- (void)runWithRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAirPlayManager shared](&OBJC_CLASS___DMDAirPlayManager, "shared", a3));
  id v11 = 0LL;
  unsigned __int8 v5 = [v4 stopAirPlaySessionOfType:3 error:&v11];
  id v6 = v11;

  if ((v5 & 1) != 0)
  {
    -[DMDStopAirPlayMirroringOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    if (v6)
    {
      NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
      id v13 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      uint64_t v8 = DMFErrorWithCodeAndUserInfo(114LL, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[DMDStopAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }

    else
    {
      uint64_t v10 = DMFErrorWithCodeAndUserInfo(114LL, 0LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[DMDStopAirPlayMirroringOperation endOperationWithError:](self, "endOperationWithError:", v7);
    }
  }
}

@end