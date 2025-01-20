@interface IDSDXPCKeyTransparency
- (IDSDXPCKeyTransparency)initWithQueue:(id)a3 connection:(id)a4;
- (IDSDXPCKeyTransparency)initWithQueue:(id)a3 connection:(id)a4 transparencyVerifier:(id)a5;
- (IDSKeyTransparencyVerifier)transparencyVerifier;
- (IDSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (void)cacheClearRequest:(id)a3;
- (void)fetchKTRegistrationStatusWithCompletion:(id)a3;
- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5;
- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4;
- (void)getCurrentRegistrationStateWithCompletion:(id)a3;
- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4;
- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate;
- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransparencyVerifier:(id)a3;
@end

@implementation IDSDXPCKeyTransparency

- (IDSDXPCKeyTransparency)initWithQueue:(id)a3 connection:(id)a4 transparencyVerifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 hasEntitlement:kIDSKeyTransparencyOptInCheckEntitlement])
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___IDSDXPCKeyTransparency;
    v12 = -[IDSDXPCKeyTransparency init](&v17, "init");
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      objc_storeStrong(p_isa + 2, a5);
      objc_storeStrong(p_isa + 3, a4);
    }

    self = p_isa;
    v14 = self;
  }

  else
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Missing KT Opt-In Check entitlement -- failing creation of IDSDXPCRegistration collaborator {connection: %@}",  buf,  0xCu);
    }

    v14 = 0LL;
  }

  return v14;
}

- (IDSDXPCKeyTransparency)initWithQueue:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
  id v9 = -[IDSDXPCKeyTransparency initWithQueue:connection:transparencyVerifier:]( self,  "initWithQueue:connection:transparencyVerifier:",  v7,  v6,  v8);

  return v9;
}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
}

- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4
{
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
}

- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "__imArrayByApplyingBlock:", &stru_1008F9450));
  -[IDSKeyTransparencyVerifier fetchPeerVerificationInfoForApplication:forURIs:withCompletion:]( self->_transparencyVerifier,  "fetchPeerVerificationInfoForApplication:forURIs:withCompletion:",  v9,  v10,  v8);
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4
{
}

- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5
{
}

- (void)fetchKTRegistrationStatusWithCompletion:(id)a3
{
}

- (void)registrationDataNeedsUpdate
{
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
}

- (void)cacheClearRequest:(id)a3
{
  id v4 = a3;
  p_connection = (uint64_t *)&self->_connection;
  if ((-[IDSXPCConnection hasEntitlement:]( self->_connection,  "hasEntitlement:",  kIDSKeyTransparencyCacheClearRequestEntitlement) & 1) != 0)
  {
    -[IDSKeyTransparencyVerifier cacheClearRequest:](self->_transparencyVerifier, "cacheClearRequest:", v4);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100699870(p_connection, v6);
    }
  }
}

- (void)getCurrentRegistrationStateWithCompletion:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSKeyTransparencyVerifier)transparencyVerifier
{
  return self->_transparencyVerifier;
}

- (void)setTransparencyVerifier:(id)a3
{
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end