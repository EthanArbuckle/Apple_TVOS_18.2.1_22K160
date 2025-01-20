@interface TVPDaemon
- (void)didReceiveAuthenticationFailureForPersonID:(id)a3;
@end

@implementation TVPDaemon

- (void)didReceiveAuthenticationFailureForPersonID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDaemon delegate](self, "delegate"));
  [v5 mediaStreamDaemonAuthFailed:self personID:v4];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPDaemon;
  -[TVPDaemon didReceiveAuthenticationFailureForPersonID:](&v6, "didReceiveAuthenticationFailureForPersonID:", v4);
}

@end