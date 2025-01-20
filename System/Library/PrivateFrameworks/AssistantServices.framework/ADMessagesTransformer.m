@interface ADMessagesTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADMessagesTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ((objc_opt_respondsToSelector(v6, "_ad_getMessagesRequestValueWithCompletionHandler:") & 1) != 0) {
    objc_msgSend(v6, "_ad_getMessagesRequestValueWithCompletionHandler:", v5);
  }
}

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  if (a4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "ad_aceResponseCommandGenericErrorRepresentation", a3));
  }
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "_ad_replyCommandValue", a3));
  }
  return v5;
}

@end