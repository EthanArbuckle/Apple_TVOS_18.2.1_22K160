@interface AMSUIDAirplaneModeInquiry
+ (NSURL)settingsURL;
- (AMSUIDAirplaneModeInquiryDelegate)delegate;
- (BOOL)isEnabled;
- (void)setDelegate:(id)a3;
@end

@implementation AMSUIDAirplaneModeInquiry

+ (NSURL)settingsURL
{
  return 0LL;
}

- (BOOL)isEnabled
{
  return 0;
}

- (AMSUIDAirplaneModeInquiryDelegate)delegate
{
  return (AMSUIDAirplaneModeInquiryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end