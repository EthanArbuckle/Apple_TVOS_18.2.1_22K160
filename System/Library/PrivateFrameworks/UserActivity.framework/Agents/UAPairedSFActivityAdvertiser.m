@interface UAPairedSFActivityAdvertiser
- (SFActivityAdvertiserDelegate)delegate;
- (SFPeerDevice)peer;
- (UAPairedSFActivityAdvertiser)initWithDelegate:(id)a3;
- (UAPairedSFActivityScanner)pairedScanner;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)fetchLoginIDWithCompletionHandler:(id)a3;
- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3;
- (void)payloadRequestFromPeer:(id)a3 advertisementPayload:(id)a4 command:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setPairedScanner:(id)a3;
@end

@implementation UAPairedSFActivityAdvertiser

- (UAPairedSFActivityAdvertiser)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UAPairedSFActivityAdvertiser;
  v5 = -[UAPairedSFActivityAdvertiser init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[UAPairedSFActivityAdvertiser setDelegate:](v5, "setDelegate:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SFPeerDevice peerForSelf](&OBJC_CLASS___SFPeerDevice, "peerForSelf"));
    peer = v6->_peer;
    v6->_peer = (SFPeerDevice *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAPairedSFActivityAdvertiser peer](v6, "peer"));
    [v9 setName:@"PairedAdvertiser"];
  }

  return v6;
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAPairedSFActivityAdvertiser pairedScanner](self, "pairedScanner"));

  if (v8)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100035A30;
    block[3] = &unk_1000BCE78;
    block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100035B44;
  v8[3] = &unk_1000BD290;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035CEC;
  block[3] = &unk_1000BD878;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035E68;
  block[3] = &unk_1000BCDE0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)payloadRequestFromPeer:(id)a3 advertisementPayload:(id)a4 command:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035FB4;
  block[3] = &unk_1000BD8C8;
  void block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v10;
  id v24 = v13;
  id v16 = v13;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

- (UAPairedSFActivityScanner)pairedScanner
{
  return (UAPairedSFActivityScanner *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPairedScanner:(id)a3
{
}

- (SFActivityAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityAdvertiserDelegate *)a3;
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end