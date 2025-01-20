@interface AKCAPiggybackReporter
- (AKCAPiggybackReporter)initWithRequestID:(id)a3;
- (id)piggybackResultString:(unint64_t)a3;
- (void)didCancelRequesting;
- (void)didCircleTimeout;
- (void)didEscapeRequesting;
- (void)didFinishAccepting;
@end

@implementation AKCAPiggybackReporter

- (AKCAPiggybackReporter)initWithRequestID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AKCAPiggybackReporter;
  v5 = -[AKCAReporter initWithEvent:](&v8, "initWithEvent:", @"com.apple.AuthKit.Piggyback");
  v6 = v5;
  if (v5) {
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"requestID");
  }

  return v6;
}

- (void)didCircleTimeout
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 0LL));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, @"piggybackResult");

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didFinishAccepting
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 1LL));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, @"piggybackResult");

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didCancelRequesting
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 2LL));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, @"piggybackResult");

  -[AKCAReporter sendReport](self, "sendReport");
}

- (void)didEscapeRequesting
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKCAPiggybackReporter piggybackResultString:](self, "piggybackResultString:", 3LL));
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, @"piggybackResult");

  -[AKCAReporter sendReport](self, "sendReport");
}

- (id)piggybackResultString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"circleTimeout";
  }
  else {
    return off_1001C9E68[a3 - 1];
  }
}

@end