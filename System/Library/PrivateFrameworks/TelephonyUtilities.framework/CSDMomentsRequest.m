@interface CSDMomentsRequest
- (CSDAVCMomentsRequest)avcRequest;
- (CSDMomentsControllerSession)session;
- (CSDMomentsRequest)init;
- (CSDMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4;
@end

@implementation CSDMomentsRequest

- (CSDAVCMomentsRequest)avcRequest
{
  return (CSDAVCMomentsRequest *)(id)sub_1002B165C();
}

- (CSDMomentsControllerSession)session
{
  return (CSDMomentsControllerSession *)sub_1002B168C();
}

- (CSDMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4
{
  return (CSDMomentsRequest *)sub_1002B169C((uint64_t)a3, (uint64_t)a4);
}

- (CSDMomentsRequest)init
{
}

- (void).cxx_destruct
{
}

@end