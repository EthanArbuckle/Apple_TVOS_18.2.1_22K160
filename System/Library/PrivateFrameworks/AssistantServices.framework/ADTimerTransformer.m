@interface ADTimerTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADTimerTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_ad_timerRequestRepresentation"));
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  if (a4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "ad_aceResponseCommandGenericErrorRepresentation", a3));
  }
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "_ad_timerResponseForResponse:", a3));
  }
  return v5;
}

@end