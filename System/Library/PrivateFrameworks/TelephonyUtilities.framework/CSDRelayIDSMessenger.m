@interface CSDRelayIDSMessenger
- (CSDRelayIDSMessengerDelegate)delegate;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSDRelayIDSMessenger

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (CSDRelayIDSMessengerDelegate)delegate
{
  return (CSDRelayIDSMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end