@interface UAMockActivityAdvertiser
- (SFActivityAdvertiserDelegate)delegate;
- (UAActivityReplay)controller;
- (UAMockActivityAdvertiser)initWithController:(id)a3;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)fetchLoginIDWithCompletionHandler:(id)a3;
- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UAMockActivityAdvertiser

- (UAMockActivityAdvertiser)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UAMockActivityAdvertiser;
  v6 = -[UAMockActivityAdvertiser init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
  [v8 doAdvertiseAdvertisementPayload:v7 options:v6];
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pairedPeer]);

  if (v6)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v9 pairedPeer]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    v4[2](v4, v8, 0LL);

    v4 = (void (**)(id, void *, void))v7;
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -1LL,  0LL));
    ((void (*)(void (**)(id, void *, void), void))v4[2])(v4, 0LL);
  }
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (!v16) {
    goto LABEL_6;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 pairedPeer]);
  if (!v8)
  {

    goto LABEL_6;
  }

  id v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pairedPeer]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
  unsigned int v13 = [v12 isEqual:v16];

  if (!v13)
  {
LABEL_6:
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -1LL,  0LL));
    v6[2](v6, 0LL, v14);
    goto LABEL_7;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertiser controller](self, "controller"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pairedPeer]);
  ((void (**)(id, void *, void *))v6)[2](v6, v15, 0LL);

LABEL_7:
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
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

- (UAActivityReplay)controller
{
  return (UAActivityReplay *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end