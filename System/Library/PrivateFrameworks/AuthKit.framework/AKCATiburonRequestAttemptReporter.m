@interface AKCATiburonRequestAttemptReporter
- (AKCATiburonRequestAttemptReporter)initWithRequestID:(id)a3;
- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4;
@end

@implementation AKCATiburonRequestAttemptReporter

- (AKCATiburonRequestAttemptReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKCATiburonRequestAttemptReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, "initWithEvent:", @"com.apple.AuthKit.TiburonAttempt");
  v6 = v5;
  if (v5) {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"requestID");
  }

  return v6;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AKAuthorizationRequest, v9);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedRequest]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___AKPasswordRequest, v13);
  LOBYTE(v7) = objc_opt_isKindOfClass(v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", isKindOfClass & 1));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v15,  @"authorizationRequestSuccess");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7 & 1));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v16,  @"passwordRequestSuccess");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v17, @"errorDomain");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, @"errorCode");

  uint64_t v19 = AKErrorUnderlyingError(v6);
  id v22 = (id)objc_claimAutoreleasedReturnValue(v19);

  if (v22)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v20,  @"underlyingErrorDomain");

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v22 code]));
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v21,  @"underlyingErrorCode");
  }
}

@end