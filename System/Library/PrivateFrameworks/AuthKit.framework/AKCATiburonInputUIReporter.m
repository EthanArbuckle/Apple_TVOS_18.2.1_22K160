@interface AKCATiburonInputUIReporter
- (AKCATiburonInputUIReporter)initWithRequestID:(id)a3;
- (void)_clearMutuallyExclusiveProperties:(BOOL)a3;
- (void)didComplete:(BOOL)a3;
- (void)didModifyName:(BOOL)a3;
- (void)didSelectAnonymousEmail:(BOOL)a3;
- (void)didSelectAppleID:(BOOL)a3;
- (void)didSelectPasswordCredential:(BOOL)a3;
- (void)didShowAppleID:(BOOL)a3;
- (void)setPasswordCredentialCount:(unint64_t)a3;
@end

@implementation AKCATiburonInputUIReporter

- (AKCATiburonInputUIReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKCATiburonInputUIReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, "initWithEvent:", @"com.apple.AuthKit.TiburonAuthorizationUI");
  v6 = v5;
  if (v5)
  {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"requestID");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_1001D8CB0,  @"passwordCredentialCount");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"didShowAppleID");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"useAnonymous");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"useAppleID");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"usePasswordCredential");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"modifiedName");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"didCancel");
  }

  return v6;
}

- (void)setPasswordCredentialCount:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v4,  @"passwordCredentialCount");
}

- (void)didShowAppleID:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"didShowAppleID");
}

- (void)didSelectAnonymousEmail:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"useAnonymous");
}

- (void)didSelectAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, @"useAppleID");
}

- (void)didSelectPasswordCredential:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCATiburonInputUIReporter _clearMutuallyExclusiveProperties:](self, "_clearMutuallyExclusiveProperties:");
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, @"usePasswordCredential");
}

- (void)didModifyName:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"modifiedName");
}

- (void)didComplete:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"didCancel");
}

- (void)_clearMutuallyExclusiveProperties:(BOOL)a3
{
  if (a3)
  {
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"useAppleID");
    -[AKCAReporter setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"usePasswordCredential");
  }

@end