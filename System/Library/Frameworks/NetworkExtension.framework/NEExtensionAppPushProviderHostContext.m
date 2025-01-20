@interface NEExtensionAppPushProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendOutgoingCallMessage:(id)a3 completionHandler:(id)a4;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionAppPushProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4369 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4369, &__block_literal_global_4370);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4371;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4366 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4366, &__block_literal_global_71);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_4367;
}

void __72__NEExtensionAppPushProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EBBD0];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4367;
  _extensionAuxiliaryHostProtocol_protocol_4367 = v0;
}

void __74__NEExtensionAppPushProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EBB70];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4371;
  _extensionAuxiliaryVendorProtocol_protocol_4371 = v0;
}

- (int)requiredEntitlement
{
  return 32;
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 startConnectionWithProviderConfig:v7 completionHandler:v6];
}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 stopWithReason:v4 completionHandler:v6];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setProviderConfiguration:v4];
}

- (void)sendOutgoingCallMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 sendOutgoingCallMessage:v7 completionHandler:v6];
}

- (void)sendTimerEvent
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendTimerEvent];
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didReceiveIncomingCallWithUserInfo:v4];
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didReceivePushToTalkMessageWithUserInfo:v4];
}

@end