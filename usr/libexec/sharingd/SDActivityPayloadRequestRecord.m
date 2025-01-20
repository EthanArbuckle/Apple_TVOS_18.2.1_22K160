@interface SDActivityPayloadRequestRecord
- (NSData)advertisementPayload;
- (NSString)command;
- (RPCompanionLinkClient)linkClient;
- (id)description;
- (void)dealloc;
- (void)setAdvertisementPayload:(id)a3;
- (void)setCommand:(id)a3;
- (void)setLinkClient:(id)a3;
@end

@implementation SDActivityPayloadRequestRecord

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDActivityPayloadRequestRecord;
  -[SDActivityPayloadRequestRecord dealloc](&v3, "dealloc");
}

- (id)description
{
  linkClient = self->_linkClient;
  if (linkClient) {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"linkClient: <%@>, ",  linkClient));
  }
  else {
    v4 = &stru_1005E3958;
  }
  v5 = (objc_class *)objc_opt_class(self, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = SFHexStringForData(self->_advertisementPayload);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  command = self->_command;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SDActivityPayloadRequestRecord;
  id v11 = -[SDActivityRequestRecord description](&v15, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, advertisementPayload:%@, command:%@, %@%@>",  v7,  self,  v9,  command,  v4,  v12));

  return v13;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end