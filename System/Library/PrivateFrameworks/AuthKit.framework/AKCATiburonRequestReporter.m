@interface AKCATiburonRequestReporter
- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3;
- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4;
@end

@implementation AKCATiburonRequestReporter

- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___AKCATiburonRequestReporter;
  v5 = -[AKCAReporter initWithEvent:](&v24, "initWithEvent:", @"com.apple.AuthKit.TiburonRequest");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"requestID");

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
    if (v8) {
      v9 = &__kCFBooleanTrue;
    }
    else {
      v9 = &__kCFBooleanFalse;
    }
    -[AKCAReporter setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v9,  @"includesAuthorizationRequest");

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 passwordRequest]);
    if (v10) {
      v11 = &__kCFBooleanTrue;
    }
    else {
      v11 = &__kCFBooleanFalse;
    }
    -[AKCAReporter setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v11,  @"includesPasswordRequest");

    if ([v4 _isRapportLogin])
    {
      v12 = @"tv";
    }

    else if ([v4 _isFirstPartyLogin] {
           && ([v4 _isWebLogin] & 1) != 0)
    }
    {
      v12 = @"appleweb";
    }

    else if ([v4 _isWebLogin])
    {
      v12 = @"web";
    }

    else if ([v4 _isFirstPartyLogin])
    {
      v12 = @"apple";
    }

    else
    {
      v12 = @"app";
    }

    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, @"originClientType");
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientID]);
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, @"clientID");

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 _proxiedClientAppID]);
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, @"appID");

      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 teamID]);
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, @"teamID");

      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
      BOOL v20 = [v19 existingStatus] != (id)1;

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, @"isFirstTimeAuth");

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 _isEligibleForUpgradeFromPassword]));
      -[AKCAReporter setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v22,  @"isUpgradeFromPassword");
    }
  }

  return v5;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AKAuthorizationRequest, v9);
  int isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___AKPasswordRequest, v13);
  int v15 = objc_opt_isKindOfClass(v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", isKindOfClass & 1));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v16,  @"authorizationRequestSuccess");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15 & 1));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v17,  @"passwordRequestSuccess");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, @"errorDomain");

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v19, @"errorCode");

  uint64_t v20 = AKErrorUnderlyingError(v6);
  id v27 = (id)objc_claimAutoreleasedReturnValue(v20);

  v21 = v27;
  if (v27)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v22,  @"underlyingErrorDomain");

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v27 code]));
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v23,  @"underlyingErrorCode");

    v21 = v27;
  }

  if (((isKindOfClass | v15) & 1) != 0)
  {
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"clientID"));

    if (v24) {
      -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  @"<akredacted>",  @"clientID");
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"appID"));

    if (v25) {
      -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  @"<akredacted>",  @"appID");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"teamID"));

    v21 = v27;
    if (v26)
    {
      -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  @"<akredacted>",  @"teamID");
      v21 = v27;
    }
  }
}

@end