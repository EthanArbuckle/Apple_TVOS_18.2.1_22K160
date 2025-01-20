@interface SDSession
- (BOOL)sessionCreated;
- (NSData)dhSecretKey;
- (NSData)readKey;
- (NSData)writeKey;
- (NSMutableArray)sendDataQueue;
- (NSUUID)identifier;
- (NSUUID)peerIdentifier;
- (SFSession)clientSession;
- (id)description;
- (unint64_t)readNonce;
- (unint64_t)writeNonce;
- (void)setClientSession:(id)a3;
- (void)setDhSecretKey:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setReadKey:(id)a3;
- (void)setReadNonce:(unint64_t)a3;
- (void)setSendDataQueue:(id)a3;
- (void)setSessionCreated:(BOOL)a3;
- (void)setWriteKey:(id)a3;
- (void)setWriteNonce:(unint64_t)a3;
@end

@implementation SDSession

- (id)description
{
  id v20 = 0LL;
  NSAppendPrintF(&v20, "SDSession %{ptr}", self);
  id v3 = v20;
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    id v19 = v3;
    NSAppendPrintF(&v19, ", ID %@", identifier);
    id v6 = v19;

    v4 = v6;
  }

  peerIdentifier = self->_peerIdentifier;
  if (peerIdentifier)
  {
    id v18 = v4;
    NSAppendPrintF(&v18, ", Peer %@", peerIdentifier);
    id v8 = v18;

    v4 = v8;
  }

  clientSession = self->_clientSession;
  if (clientSession)
  {
    id v17 = v4;
    NSAppendPrintF(&v17, ", %@", clientSession);
    id v10 = v17;

    v4 = v10;
  }

  id v16 = v4;
  if (self->_sessionCreated) {
    v11 = "yes";
  }
  else {
    v11 = "no";
  }
  NSAppendPrintF(&v16, ", SessionCreated %s", v11);
  id v12 = v16;

  if (-[NSMutableArray count](self->_sendDataQueue, "count"))
  {
    id v15 = v12;
    NSAppendPrintF(&v15, ", %ld pending sends", -[NSMutableArray count](self->_sendDataQueue, "count"));
    id v13 = v15;

    id v12 = v13;
  }

  return v12;
}

- (SFSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)dhSecretKey
{
  return self->_dhSecretKey;
}

- (void)setDhSecretKey:(id)a3
{
}

- (NSData)readKey
{
  return self->_readKey;
}

- (void)setReadKey:(id)a3
{
}

- (unint64_t)readNonce
{
  return self->_readNonce;
}

- (void)setReadNonce:(unint64_t)a3
{
  self->_readNonce = a3;
}

- (NSData)writeKey
{
  return self->_writeKey;
}

- (void)setWriteKey:(id)a3
{
}

- (unint64_t)writeNonce
{
  return self->_writeNonce;
}

- (void)setWriteNonce:(unint64_t)a3
{
  self->_writeNonce = a3;
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSMutableArray)sendDataQueue
{
  return self->_sendDataQueue;
}

- (void)setSendDataQueue:(id)a3
{
}

- (BOOL)sessionCreated
{
  return self->_sessionCreated;
}

- (void)setSessionCreated:(BOOL)a3
{
  self->_sessionCreated = a3;
}

- (void).cxx_destruct
{
}

@end