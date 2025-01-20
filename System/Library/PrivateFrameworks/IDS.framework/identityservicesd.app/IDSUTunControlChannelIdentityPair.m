@interface IDSUTunControlChannelIdentityPair
- (IDSMPFullLegacyIdentity)localFullIdentity;
- (IDSMPPublicLegacyIdentity)remotePublicIdentity;
- (IDSUTunControlChannelIdentityPair)initWithLocalFullIdentity:(id)a3 remotePublicIdentity:(id)a4;
- (id)description;
@end

@implementation IDSUTunControlChannelIdentityPair

- (IDSUTunControlChannelIdentityPair)initWithLocalFullIdentity:(id)a3 remotePublicIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSUTunControlChannelIdentityPair;
  v9 = -[IDSUTunControlChannelIdentityPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localFullIdentity, a3);
    objc_storeStrong((id *)&v10->_remotePublicIdentity, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannelIdentityPair localFullIdentity](self, "localFullIdentity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunControlChannelIdentityPair remotePublicIdentity](self, "remotePublicIdentity"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p local: %@ remote: %@>",  v5,  self,  v6,  v7));

  return v8;
}

- (IDSMPFullLegacyIdentity)localFullIdentity
{
  return self->_localFullIdentity;
}

- (IDSMPPublicLegacyIdentity)remotePublicIdentity
{
  return self->_remotePublicIdentity;
}

- (void).cxx_destruct
{
}

@end