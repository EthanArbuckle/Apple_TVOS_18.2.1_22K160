@interface PDCloudStoreShareInvitationRequestDeclineRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (BOOL)shouldAlertRecipient;
- (NSString)containerName;
- (NSString)handle;
- (NSString)zoneName;
- (PDCloudStoreShareInvitationRequestDeclineRequest)initWithHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (id)description;
- (void)setShouldAlertRecipient:(BOOL)a3;
@end

@implementation PDCloudStoreShareInvitationRequestDeclineRequest

- (PDCloudStoreShareInvitationRequestDeclineRequest)initWithHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDCloudStoreShareInvitationRequestDeclineRequest;
  v14 = -[PDCloudStoreShareInvitationRequest initWithType:completion:](&v17, "initWithType:completion:", 4LL, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_handle, a3);
    objc_storeStrong((id *)&v15->_zoneName, a4);
    objc_storeStrong((id *)&v15->_containerName, a5);
  }

  return v15;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)4)
  {
    id v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 containerName]);
    zoneName = self->_zoneName;
    v10 = v6;
    id v11 = zoneName;
    if (v10 == v11)
    {
    }

    else
    {
      id v12 = v11;
      if (!v10 || !v11)
      {

        goto LABEL_22;
      }

      unsigned int v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13) {
        goto LABEL_22;
      }
    }

    containerName = self->_containerName;
    v16 = v8;
    objc_super v17 = containerName;
    if (v16 == v17)
    {
    }

    else
    {
      v18 = v17;
      if (!v16 || !v17) {
        goto LABEL_21;
      }
      unsigned int v19 = -[NSString isEqualToString:](v16, "isEqualToString:", v17);

      if (!v19) {
        goto LABEL_22;
      }
    }

    v16 = self->_handle;
    v20 = v7;
    v18 = v20;
    if (v16 == v20)
    {

LABEL_26:
      int shouldAlertRecipient = self->_shouldAlertRecipient;
      BOOL v14 = shouldAlertRecipient == [v5 shouldAlertRecipient];
      goto LABEL_23;
    }

    if (v20 && v16)
    {
      unsigned int v21 = -[NSString isEqualToString:](v16, "isEqualToString:", v20);

      if (v21) {
        goto LABEL_26;
      }
LABEL_22:
      BOOL v14 = 0;
LABEL_23:

      goto LABEL_24;
    }

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  unint64_t v5 = -[PDCloudStoreShareInvitationRequest type](self, "type");
  if (v5 - 1 > 6) {
    v6 = @"acceptKeys";
  }
  else {
    v6 = off_100647930[v5 - 1];
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"type: '%@'; ", v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"zoneName: '%@'; ", self->_zoneName);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"containerName: '%@'; ", self->_containerName);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"handle: '%@'; ", self->_handle);
  if (self->_shouldAlertRecipient) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"shouldAlertRecipient: '%@'; ", v7);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
}

- (BOOL)shouldAlertRecipient
{
  return self->_shouldAlertRecipient;
}

- (void)setShouldAlertRecipient:(BOOL)a3
{
  self->_int shouldAlertRecipient = a3;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void).cxx_destruct
{
}

@end