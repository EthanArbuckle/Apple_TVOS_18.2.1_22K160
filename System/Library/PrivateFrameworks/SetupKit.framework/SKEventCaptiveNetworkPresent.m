@interface SKEventCaptiveNetworkPresent
- (NSString)captiveInterfaceIdentifier;
- (NSString)captiveSSID;
- (NSURL)captiveURL;
- (SKEventCaptiveNetworkPresent)initWithCaptiveURL:(id)a3 interfaceIdentifier:(id)a4 ssid:(id)a5;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKEventCaptiveNetworkPresent

- (SKEventCaptiveNetworkPresent)initWithCaptiveURL:(id)a3 interfaceIdentifier:(id)a4 ssid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[SKEvent initWithEventType:](self, "initWithEventType:", 200LL);
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    captiveInterfaceIdentifier = v11->_captiveInterfaceIdentifier;
    v11->_captiveInterfaceIdentifier = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    captiveSSID = v11->_captiveSSID;
    v11->_captiveSSID = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    captiveURL = v11->_captiveURL;
    v11->_captiveURL = (NSURL *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v3 = 0LL;
  }

  CUAppendF();
  id v4 = v3;

  CUAppendF();
  id v5 = v4;

  CUAppendF();
  v6 = (__CFString *)v5;

  v7 = &stru_18A2823D0;
  if (v6) {
    v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (NSString)captiveInterfaceIdentifier
{
  return self->_captiveInterfaceIdentifier;
}

- (NSString)captiveSSID
{
  return self->_captiveSSID;
}

- (NSURL)captiveURL
{
  return self->_captiveURL;
}

- (void).cxx_destruct
{
}

@end