@interface SDActivityEncryptionKeyRequestRecord
- (NSUUID)previousKeyIdentifier;
- (RPCompanionLinkClient)linkClient;
- (id)description;
- (void)dealloc;
- (void)setLinkClient:(id)a3;
- (void)setPreviousKeyIdentifier:(id)a3;
@end

@implementation SDActivityEncryptionKeyRequestRecord

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDActivityEncryptionKeyRequestRecord;
  -[SDActivityEncryptionKeyRequestRecord dealloc](&v3, "dealloc");
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
  previousKeyIdentifier = self->_previousKeyIdentifier;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDActivityEncryptionKeyRequestRecord;
  id v9 = -[SDActivityRequestRecord description](&v13, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, previousKeyIdentifier:%@, %@%@>",  v7,  self,  previousKeyIdentifier,  v4,  v10));

  return v11;
}

- (NSUUID)previousKeyIdentifier
{
  return self->_previousKeyIdentifier;
}

- (void)setPreviousKeyIdentifier:(id)a3
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