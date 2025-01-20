@interface CLTileDownloadTaskDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
@end

@implementation CLTileDownloadTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  if (objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a4, "originalRequest", a3), "URL"), "scheme"),  "isEqualToString:",  @"https")
    && (objc_msgSend(objc_msgSend(objc_msgSend(a6, "URL"), "scheme"), "isEqualToString:", @"http") & 1) != 0)
  {
    a6 = 0LL;
  }

  (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

@end