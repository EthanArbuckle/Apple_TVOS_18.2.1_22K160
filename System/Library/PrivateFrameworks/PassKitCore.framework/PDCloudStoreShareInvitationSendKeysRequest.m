@interface PDCloudStoreShareInvitationSendKeysRequest
- (BOOL)canCoalesceRequest:(id)a3;
- (NSString)recipientHandle;
- (PDCloudStoreShareInvitationSendKeysRequest)initWithInvitation:(id)a3 recipientHandle:(id)a4 completion:(id)a5;
- (PKCloudStoreZoneInvitation)invitation;
- (id)description;
@end

@implementation PDCloudStoreShareInvitationSendKeysRequest

- (PDCloudStoreShareInvitationSendKeysRequest)initWithInvitation:(id)a3 recipientHandle:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCloudStoreShareInvitationSendKeysRequest;
  v11 = -[PDCloudStoreShareInvitationRequest initWithType:completion:](&v14, "initWithType:completion:", 3LL, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_invitation, a3);
    objc_storeStrong((id *)&v12->_recipientHandle, a4);
  }

  return v12;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)3)
  {
    id v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientHandle]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 invitation]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKCloudStoreZoneInvitation zoneName](self->_invitation, "zoneName"));
    id v10 = v8;
    v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {
    }

    else
    {
      if (!v10 || !v11)
      {

        goto LABEL_21;
      }

      unsigned int v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13) {
        goto LABEL_21;
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 containerIdentifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKCloudStoreZoneInvitation containerIdentifier](self->_invitation, "containerIdentifier"));
    id v17 = v15;
    id v18 = v16;
    if (v17 == v18)
    {

LABEL_16:
      id v10 = self->_recipientHandle;
      v21 = v6;
      v12 = v21;
      if (v10 == v21)
      {
        unsigned __int8 v14 = 1;
      }

      else
      {
        unsigned __int8 v14 = 0;
        if (v21 && v10) {
          unsigned __int8 v14 = -[NSString isEqualToString:](v10, "isEqualToString:", v21);
        }
      }

      goto LABEL_22;
    }

    v19 = v18;
    if (v17 && v18)
    {
      unsigned __int8 v20 = [v17 isEqualToString:v18];

      if ((v20 & 1) == 0)
      {
        unsigned __int8 v14 = 0;
LABEL_23:

        goto LABEL_24;
      }

      goto LABEL_16;
    }

LABEL_21:
    unsigned __int8 v14 = 0;
LABEL_22:

    goto LABEL_23;
  }

  unsigned __int8 v14 = 0;
LABEL_24:

  return v14;
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
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"invitation: '%@'; ", self->_invitation);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"recipientHandle: '%@'; ", self->_recipientHandle);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
}

- (PKCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void).cxx_destruct
{
}

@end