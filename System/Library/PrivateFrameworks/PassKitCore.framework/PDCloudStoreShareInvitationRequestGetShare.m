@interface PDCloudStoreShareInvitationRequestGetShare
- (BOOL)canCoalesceRequest:(id)a3;
- (NSString)containerName;
- (NSString)zoneName;
- (PDCloudStoreShareInvitationRequestGetShare)initWithZoneName:(id)a3 containerName:(id)a4 completion:(id)a5;
- (id)description;
@end

@implementation PDCloudStoreShareInvitationRequestGetShare

- (PDCloudStoreShareInvitationRequestGetShare)initWithZoneName:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCloudStoreShareInvitationRequestGetShare;
  v11 = -[PDCloudStoreShareInvitationRequest initWithType:completion:](&v14, "initWithType:completion:", 5LL, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zoneName, a3);
    objc_storeStrong((id *)&v12->_containerName, a4);
  }

  return v12;
}

- (BOOL)canCoalesceRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)5)
  {
    id v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 containerName]);
    zoneName = self->_zoneName;
    id v9 = v6;
    id v10 = zoneName;
    if (v9 == v10)
    {
    }

    else
    {
      v11 = v10;
      LOBYTE(v12) = 0;
      if (!v9 || !v10)
      {
        objc_super v14 = v9;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }

      unsigned int v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v12) {
        goto LABEL_16;
      }
    }

    containerName = self->_containerName;
    objc_super v14 = v7;
    v15 = containerName;
    v11 = v15;
    if (v14 == v15)
    {
      LOBYTE(v12) = 1;
    }

    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v15) {
        LOBYTE(v12) = -[NSString isEqualToString:](v14, "isEqualToString:", v15);
      }
    }

    goto LABEL_15;
  }

  LOBYTE(v12) = 0;
LABEL_17:

  return v12;
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
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
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