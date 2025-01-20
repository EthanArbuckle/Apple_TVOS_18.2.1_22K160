@interface AKSatoriController
- (AKCASatoriReporter)analyticsReport;
- (AKSatoriController)initWithClient:(id)a3;
- (void)fetchRealUserLikelihoodForRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)setAnalyticsReport:(id)a3;
- (void)warmUpVerificationSessionWithCompletionHandler:(id)a3;
@end

@implementation AKSatoriController

- (AKSatoriController)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKSatoriController;
  v6 = -[AKSatoriController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)warmUpVerificationSessionWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
    (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
  }

- (void)fetchRealUserLikelihoodForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (AKCASatoriReporter)analyticsReport
{
  return self->_analyticsReport;
}

- (void)setAnalyticsReport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end