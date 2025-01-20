@interface UAPairedSFActivityScanner
- (BOOL)sendFoundDevice;
- (SFActivityScannerDelegate)delegate;
- (SFPeerDevice)peer;
- (UAPairedSFActivityAdvertiser)pairedAdvertiser;
- (UAPairedSFActivityScanner)initWithDelegate:(id)a3;
- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7;
- (void)receiveAdvertisement:(id)a3 options:(id)a4 fromPeer:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPairedAdvertiser:(id)a3;
- (void)setSendFoundDevice:(BOOL)a3;
@end

@implementation UAPairedSFActivityScanner

- (UAPairedSFActivityScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UAPairedSFActivityScanner;
  v5 = -[UAPairedSFActivityScanner init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[UAPairedSFActivityScanner setDelegate:](v5, "setDelegate:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SFPeerDevice peerForSelf](&OBJC_CLASS___SFPeerDevice, "peerForSelf"));
    peer = v6->_peer;
    v6->_peer = (SFPeerDevice *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPairedSFActivityScanner peer](v6, "peer"));
    [v9 setName:@"PairedAdvertiser"];
  }

  return v6;
}

- (void)receiveAdvertisement:(id)a3 options:(id)a4 fromPeer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100036280;
  v16[3] = &unk_1000BD8F0;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v20 = self;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100036438;
  v18[3] = &unk_1000BD918;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, v18);
}

- (UAPairedSFActivityAdvertiser)pairedAdvertiser
{
  return (UAPairedSFActivityAdvertiser *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPairedAdvertiser:(id)a3
{
}

- (SFActivityScannerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityScannerDelegate *)a3;
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)sendFoundDevice
{
  return self->_sendFoundDevice;
}

- (void)setSendFoundDevice:(BOOL)a3
{
  self->_sendFoundDevice = a3;
}

- (void).cxx_destruct
{
}

@end