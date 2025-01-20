@interface SASmsDraftShow
- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3;
@end

@implementation SASmsDraftShow

- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = objc_alloc(&OBJC_CLASS___STShowDraftMessageRequest);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SASmsDraftShow smsIdentifier](self, "smsIdentifier"));
    id v7 = [v6 _initWithDraftMessageIdentifier:v8];
    (*((void (**)(id, id))a3 + 2))(v5, v7);
  }

@end