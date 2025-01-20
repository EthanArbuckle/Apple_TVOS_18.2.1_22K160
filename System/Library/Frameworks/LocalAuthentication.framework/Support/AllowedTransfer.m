@interface AllowedTransfer
- (AllowedTransfer)initWithReceiverAuditTokenData:(id)a3 sender:(id)a4;
- (AllowedTransfer)initWithSender:(id)a3;
- (AllowedTransfer)initWithServerToken:(id)a3 sender:(id)a4;
- (BOOL)isReceiver:(id)a3 allowedToConnectWithServerToken:(id)a4 senderAuditTokenData:(id)a5;
- (id)description;
@end

@implementation AllowedTransfer

- (AllowedTransfer)initWithReceiverAuditTokenData:(id)a3 sender:(id)a4
{
  id v7 = a3;
  v8 = -[AllowedTransfer initWithSender:](self, "initWithSender:", a4);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_receiverAuditTokenData, a3);
  }

  return v9;
}

- (AllowedTransfer)initWithServerToken:(id)a3 sender:(id)a4
{
  id v7 = a3;
  v8 = -[AllowedTransfer initWithSender:](self, "initWithSender:", a4);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_serverToken, a3);
  }

  return v9;
}

- (AllowedTransfer)initWithSender:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AllowedTransfer;
  v6 = -[AllowedTransfer init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sender, a3);
  }

  return v7;
}

- (id)description
{
  if (self->_receiverAuditTokenData)
  {
    id v3 = -[Caller pid](self->_sender, "pid");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Caller auditTokenData](self->_sender, "auditTokenData"));
    id v5 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<AllowedTransfer SPID: %d SAT: %x RAT: %x>",  v3,  [v4 hash],  -[NSData hash](self->_receiverAuditTokenData, "hash"));
  }

  else
  {
    if (!self->_serverToken)
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___AllowedTransfer;
      id v9 = -[AllowedTransfer description](&v10, "description");
      return (id)objc_claimAutoreleasedReturnValue(v9);
    }

    id v6 = -[Caller pid](self->_sender, "pid");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Caller auditTokenData](self->_sender, "auditTokenData"));
    id v5 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<AllowedTransfer SPID: %d SAT: %x ST: %x>",  v6,  [v4 hash],  -[NSData hash](self->_serverToken, "hash"));
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v7;
}

- (BOOL)isReceiver:(id)a3 allowedToConnectWithServerToken:(id)a4 senderAuditTokenData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_receiverAuditTokenData)
  {
    if (self->_serverToken)
    {
      unsigned __int8 v10 = objc_msgSend(v9, "isEqualToData:");
      goto LABEL_6;
    }

- (void).cxx_destruct
{
}

@end