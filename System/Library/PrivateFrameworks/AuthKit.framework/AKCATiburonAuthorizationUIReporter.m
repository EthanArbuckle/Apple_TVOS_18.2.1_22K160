@interface AKCATiburonAuthorizationUIReporter
- (AKCATiburonAuthorizationUIReporter)initWithRequestID:(id)a3;
- (void)didSelectAnonymousEmail:(BOOL)a3 didCancel:(BOOL)a4;
- (void)setModifiedName;
@end

@implementation AKCATiburonAuthorizationUIReporter

- (AKCATiburonAuthorizationUIReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKCATiburonAuthorizationUIReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, "initWithEvent:", @"com.apple.AuthKit.TiburonAuthorizationUI");
  v6 = v5;
  if (v5)
  {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"requestID");
    -[AKCAReporter setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"modifiedName");
  }

  return v6;
}

- (void)setModifiedName
{
}

- (void)didSelectAnonymousEmail:(BOOL)a3 didCancel:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, @"useAnonymous");

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, @"didCancel");
}

@end