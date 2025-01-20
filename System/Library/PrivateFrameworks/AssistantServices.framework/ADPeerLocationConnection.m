@interface ADPeerLocationConnection
- (ADPeerLocationConnection)init;
- (ADPeerLocationConnection)initWithDelegate:(id)a3;
- (void)getBestLocationWithCompletion:(id)a3;
- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5;
- (void)peerConnection:(id)a3 peerAvailabilityDidChange:(BOOL)a4;
- (void)peerLocationPolicySuggestsClearingCachedLocation:(id)a3;
@end

@implementation ADPeerLocationConnection

- (ADPeerLocationConnection)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADPeerLocationConnection;
  v5 = -[ADPeerLocationConnection init](&v15, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("ADPeerLocationConnection", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v10 = [[ADPeerConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.location" forRequests:j__objc_msgSend__ADPBLocationRequestType requireConnectedPeer:1];
    peerConnection = v5->_peerConnection;
    v5->_peerConnection = v10;

    -[ADPeerConnection setDelegate:forRequestTypes:]( v5->_peerConnection,  "setDelegate:forRequestTypes:",  v5,  sub_10029EEC8);
    v12 = objc_alloc_init(&OBJC_CLASS___ADPeerLocationPolicy);
    locationPolicy = v5->_locationPolicy;
    v5->_locationPolicy = v12;

    -[ADPeerLocationPolicy setDelegate:](v5->_locationPolicy, "setDelegate:", v5);
  }

  return v5;
}

- (ADPeerLocationConnection)init
{
  return -[ADPeerLocationConnection initWithDelegate:](self, "initWithDelegate:", 0LL);
}

- (void)getBestLocationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100115B20;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)peerLocationPolicySuggestsClearingCachedLocation:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100115AE0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)peerConnection:(id)a3 handlePBSubclass:(id)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100115A14;
  v5[3] = &unk_1004F3E00;
  v5[4] = self;
  objc_msgSend(a4, "_ad_performForPeerLocationWithCompletion:", v5);
}

- (void)peerConnection:(id)a3 peerAvailabilityDidChange:(BOOL)a4
{
  if (!a4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100115A08;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(queue, block);
  }

- (void).cxx_destruct
{
}

@end