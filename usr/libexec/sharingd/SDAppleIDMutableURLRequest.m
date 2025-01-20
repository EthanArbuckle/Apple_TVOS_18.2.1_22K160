@interface SDAppleIDMutableURLRequest
- (SDAppleIDMutableURLRequest)initWithURL:(id)a3 gsToken:(id)a4;
@end

@implementation SDAppleIDMutableURLRequest

- (SDAppleIDMutableURLRequest)initWithURL:(id)a3 gsToken:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAppleIDMutableURLRequest;
  v7 = -[SDAppleIDMutableURLRequest initWithURL:](&v10, "initWithURL:", a3);
  v8 = v7;
  if (v7)
  {
    -[SDAppleIDMutableURLRequest setHTTPShouldHandleCookies:](v7, "setHTTPShouldHandleCookies:", 0LL);
    -[SDAppleIDMutableURLRequest setHTTPMethod:](v8, "setHTTPMethod:", @"POST");
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:]( v8,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
    if (qword_100657050 != -1) {
      dispatch_once(&qword_100657050, &stru_1005CE148);
    }
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:]( v8,  "setValue:forHTTPHeaderField:",  qword_100657048,  @"X-Mme-Client-Info");
    if (qword_100657060 != -1) {
      dispatch_once(&qword_100657060, &stru_1005CE168);
    }
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:]( v8,  "setValue:forHTTPHeaderField:",  qword_100657058,  @"X-Mme-Device-ID");
    -[SDAppleIDMutableURLRequest setValue:forHTTPHeaderField:]( v8,  "setValue:forHTTPHeaderField:",  v6,  @"X-Apple-GS-Token");
  }

  return v8;
}

@end