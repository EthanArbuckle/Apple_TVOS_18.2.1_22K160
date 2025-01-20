@interface RPNFCTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isConnected;
- (BOOL)isInitiator;
- (NSDate)connectionDate;
- (NSError)error;
- (NSString)description;
- (NSUUID)identifier;
- (RPIdentity)remoteIdentity;
- (RPNFCTransaction)initWithCoder:(id)a3;
- (RPNFCTransaction)initWithRole:(int64_t)a3;
- (RPNFCTransactionDelegate)delegate;
- (RPNearFieldTapEvent)tapEvent;
- (RPTransportServiceHandoverMessage)localAuthenticationMessage;
- (RPTransportServiceHandoverMessage)localValidationMessage;
- (RPTransportServiceHandoverMessage)remoteAuthenticationMessage;
- (RPTransportServiceHandoverMessage)remoteValidationMessage;
- (int64_t)role;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setLocalAuthenticationMessage:(id)a3;
- (void)setLocalValidationMessage:(id)a3;
- (void)setRemoteAuthenticationMessage:(id)a3;
- (void)setRemoteIdentity:(id)a3;
- (void)setRemoteValidationMessage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTapEvent:(id)a3;
@end

@implementation RPNFCTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNFCTransaction)initWithRole:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPNFCTransaction;
  v4 = -[RPNFCTransaction init](&v10, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v4->_role = a3;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    connectionDate = v4->_connectionDate;
    v4->_connectionDate = (NSDate *)v7;

    v4->_state = 0LL;
  }

  return v4;
}

- (void)setError:(id)a3
{
  id v12 = a3;
  BOOL v5 = (id)-[RPNFCTransaction state](self, "state") == (id)2;
  v6 = v12;
  if (!v5)
  {
    error = self->_error;
    v8 = (NSError *)v12;
    v9 = error;
    if (v9 == v8)
    {
    }

    else
    {
      objc_super v10 = v9;
      if ((v8 == 0LL) != (v9 != 0LL))
      {
        unsigned __int8 v11 = -[NSError isEqual:](v8, "isEqual:", v9);

        v6 = v12;
        if ((v11 & 1) != 0) {
          goto LABEL_10;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_error, a3);
      -[RPNFCTransaction setState:](self, "setState:", 1LL);
    }

    v6 = v12;
  }

- (void)setTapEvent:(id)a3
{
  id v6 = a3;
  tapEvent = self->_tapEvent;
  v13 = (RPNearFieldTapEvent *)v6;
  v8 = tapEvent;
  if (v8 == v13)
  {
  }

  else
  {
    if ((v13 == 0LL) != (v8 != 0LL))
    {
      unsigned __int8 v9 = -[RPNearFieldTapEvent isEqual:](v13, "isEqual:", v8);

      objc_super v10 = v13;
      if ((v9 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      objc_super v10 = v13;
    }

    if (!v10)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v11 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 65, @"clearing an existing tap event is not permitted:%@", 0 object file lineNumber description];
    }

    if (self->_tapEvent)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 66, @"update an existing tap event is not permitted:%@", self->_tapEvent object file lineNumber description];
    }

    objc_storeStrong((id *)&self->_tapEvent, a3);
    -[RPNFCTransaction setState:](self, "setState:", 2LL);
  }

  objc_super v10 = v13;
LABEL_13:
}

- (void)setRemoteAuthenticationMessage:(id)a3
{
  id v5 = a3;
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  uint64_t v7 = remoteAuthenticationMessage;
  if (v7 == v14)
  {

    objc_super v10 = v14;
  }

  else
  {
    if ((v14 == 0LL) != (v7 != 0LL))
    {
      unsigned __int8 v8 = -[RPTransportServiceHandoverMessage isEqual:](v14, "isEqual:", v7);

      unsigned __int8 v9 = v14;
      if ((v8 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      unsigned __int8 v9 = v14;
    }

    if (!v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 75, @"clearing an existing authentication message is not permitted:%@", 0 object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    if (self->_remoteAuthenticationMessage)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 76, @"update an existing authentication message is not permitted:%@", self->_remoteAuthenticationMessage object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    unsigned __int8 v11 = v9;
    objc_super v10 = self->_remoteAuthenticationMessage;
    self->_remoteAuthenticationMessage = v11;
  }

  unsigned __int8 v9 = v14;
LABEL_13:
}

- (void)setRemoteValidationMessage:(id)a3
{
  id v5 = a3;
  remoteValidationMessage = self->_remoteValidationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  uint64_t v7 = remoteValidationMessage;
  if (v7 == v14)
  {

    objc_super v10 = v14;
  }

  else
  {
    if ((v14 == 0LL) != (v7 != 0LL))
    {
      unsigned __int8 v8 = -[RPTransportServiceHandoverMessage isEqual:](v14, "isEqual:", v7);

      unsigned __int8 v9 = v14;
      if ((v8 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      unsigned __int8 v9 = v14;
    }

    if (!v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 84, @"clearing an existing validation message is not permitted:%@", 0 object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    if (self->_remoteValidationMessage)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 85, @"update an existing validation message is not permitted:%@", self->_remoteValidationMessage object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    unsigned __int8 v11 = v9;
    objc_super v10 = self->_remoteValidationMessage;
    self->_remoteValidationMessage = v11;
  }

  unsigned __int8 v9 = v14;
LABEL_13:
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[RPNFCTransaction delegate](self, "delegate"));
    [v4 didChangeStateForTransaction:self];
  }

- (void)setRemoteIdentity:(id)a3
{
  id v5 = a3;
  remoteIdentity = self->_remoteIdentity;
  v14 = (RPIdentity *)v5;
  uint64_t v7 = remoteIdentity;
  if (v7 == v14)
  {

    objc_super v10 = v14;
  }

  else
  {
    if ((v14 == 0LL) != (v7 != 0LL))
    {
      unsigned __int8 v8 = -[RPIdentity isEqual:](v14, "isEqual:", v7);

      unsigned __int8 v9 = v14;
      if ((v8 & 1) != 0) {
        goto LABEL_13;
      }
    }

    else
    {

      unsigned __int8 v9 = v14;
    }

    if (!v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 100, @"clearing an existing identity is not permitted:%@", 0 object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    if (self->_remoteIdentity)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 101, @"update an existing identity is not permitted:%@", self->_remoteIdentity object file lineNumber description];

      unsigned __int8 v9 = v14;
    }

    unsigned __int8 v11 = v9;
    objc_super v10 = self->_remoteIdentity;
    self->_remoteIdentity = v11;
  }

  unsigned __int8 v9 = v14;
LABEL_13:
}

- (RPNFCTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = -[RPNFCTransaction init](self, "init");
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSUUID, v5, v6);
    NSDecodeObjectIfPresent(v4, @"identifier", v8, &v7->_identifier);
    id v9 = v4;

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate, v10, v11);
    NSDecodeObjectIfPresent(v9, @"connectionDate", v12, &v7->_connectionDate);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___RPNearFieldTapEvent, v13, v14);
    NSDecodeObjectIfPresent(v9, @"tapEvent", v15, &v7->_tapEvent);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSError, v16, v17);
    NSDecodeObjectIfPresent(v9, @"error", v18, &v7->_error);
    id v19 = v9;

    v20 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v11 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v11;
  }

  int64_t state = self->_state;
  if (state)
  {
    [v11 encodeInteger:state forKey:@"state"];
    id v4 = v11;
  }

  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    [v11 encodeObject:connectionDate forKey:@"connectionDate"];
    id v4 = v11;
  }

  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    [v11 encodeObject:tapEvent forKey:@"tapEvent"];
    id v4 = v11;
  }

  error = self->_error;
  if (error)
  {
    [v11 encodeObject:error forKey:@"error"];
    id v4 = v11;
  }

  int64_t role = self->_role;
  if (role)
  {
    [v11 encodeInteger:role forKey:@"role"];
    id v4 = v11;
  }
}

- (BOOL)isInitiator
{
  return self->_role == 1;
}

- (NSString)description
{
  id v41 = 0LL;
  NSAppendPrintF(&v41, "RPNFCTransaction\n");
  id v3 = v41;
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    id v40 = v3;
    uint64_t v6 = identifier;
    NSAppendPrintF(&v40, "ID %@\n", v6);
    id v7 = v40;

    id v4 = v7;
  }

  id v39 = v4;
  uint64_t v8 = RPNearFieldTransactionStateDescription(self->_state);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  NSAppendPrintF(&v39, "State %@\n", v9);
  id v10 = v39;

  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    id v38 = v10;
    uint64_t v12 = connectionDate;
    NSAppendPrintF(&v38, "ConnectionDate %@\n", v12);
    id v13 = v38;

    id v10 = v13;
  }

  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    id v37 = v10;
    uint64_t v15 = tapEvent;
    NSAppendPrintF(&v37, "TapEvent %@\n", v15);
    id v16 = v37;

    id v10 = v16;
  }

  remoteIdentity = self->_remoteIdentity;
  if (remoteIdentity)
  {
    id v36 = v10;
    uint64_t v18 = remoteIdentity;
    NSAppendPrintF(&v36, "RemoteIdentity %@\n", v18);
    id v19 = v36;

    id v10 = v19;
  }

  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  if (remoteAuthenticationMessage)
  {
    id v35 = v10;
    v21 = remoteAuthenticationMessage;
    NSAppendPrintF(&v35, "RemoteAuthenticationMessage %@\n", v21);
    id v22 = v35;

    id v10 = v22;
  }

  remoteValidationMessage = self->_remoteValidationMessage;
  if (remoteValidationMessage)
  {
    id v34 = v10;
    v24 = remoteValidationMessage;
    NSAppendPrintF(&v34, "RemoteValidationMessage %@\n", v24);
    id v25 = v34;

    id v10 = v25;
  }

  error = self->_error;
  if (error)
  {
    id v33 = v10;
    v27 = error;
    NSAppendPrintF(&v33, "Error %@\n", v27);
    id v28 = v33;

    id v10 = v28;
  }

  id v32 = v10;
  if (self->_role == 1) {
    v29 = @"Initiator";
  }
  else {
    v29 = @"Receiver";
  }
  NSAppendPrintF(&v32, "Role %@\n", v29);
  id v30 = v32;

  return (NSString *)v30;
}

- (RPNFCTransactionDelegate)delegate
{
  return (RPNFCTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (int64_t)state
{
  return self->_state;
}

- (RPNearFieldTapEvent)tapEvent
{
  return self->_tapEvent;
}

- (RPIdentity)remoteIdentity
{
  return self->_remoteIdentity;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)role
{
  return self->_role;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (RPTransportServiceHandoverMessage)localAuthenticationMessage
{
  return self->_localAuthenticationMessage;
}

- (void)setLocalAuthenticationMessage:(id)a3
{
}

- (RPTransportServiceHandoverMessage)localValidationMessage
{
  return self->_localValidationMessage;
}

- (void)setLocalValidationMessage:(id)a3
{
}

- (RPTransportServiceHandoverMessage)remoteAuthenticationMessage
{
  return self->_remoteAuthenticationMessage;
}

- (RPTransportServiceHandoverMessage)remoteValidationMessage
{
  return self->_remoteValidationMessage;
}

- (void).cxx_destruct
{
}

@end