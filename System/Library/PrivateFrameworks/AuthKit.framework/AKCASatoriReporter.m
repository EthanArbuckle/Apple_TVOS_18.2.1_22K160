@interface AKCASatoriReporter
- (AKCASatoriReporter)initWithRequestID:(id)a3;
- (void)didCompleteVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4;
- (void)didCompleteWithSuccess:(BOOL)a3 authorizationAlreadyComplete:(BOOL)a4;
- (void)didPerformVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4;
@end

@implementation AKCASatoriReporter

- (AKCASatoriReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKCASatoriReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, "initWithEvent:", @"com.apple.AuthKit.TiburonSatori");
  v6 = v5;
  if (v5) {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"requestID");
  }

  return v6;
}

- (void)didCompleteWithSuccess:(BOOL)a3 authorizationAlreadyComplete:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a4));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v6,  @"availableLateAfterAuthComplete");

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, @"wasSuccess");
}

- (void)didPerformVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v6,  @"performVerificationSuccess");

  -[AKCAReporter machAbsoluteTimeToTimeInterval:](self, "machAbsoluteTimeToTimeInterval:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v7,  @"performVerificationDuration");
}

- (void)didCompleteVerificationWithSuccess:(BOOL)a3 duration:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, @"verificationResults");

  -[AKCAReporter machAbsoluteTimeToTimeInterval:](self, "machAbsoluteTimeToTimeInterval:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v7,  @"verificationResultsDuration");
}

@end