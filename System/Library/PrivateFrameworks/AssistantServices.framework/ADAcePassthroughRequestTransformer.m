@interface ADAcePassthroughRequestTransformer
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADAcePassthroughRequestTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[ADAcePassthroughSiriRequest initWithClientBoundCommand:]( objc_alloc(&OBJC_CLASS___ADAcePassthroughSiriRequest),  "initWithClientBoundCommand:",  v7);

  (*((void (**)(id, ADAcePassthroughSiriRequest *))a4 + 2))(v6, v8);
}

@end