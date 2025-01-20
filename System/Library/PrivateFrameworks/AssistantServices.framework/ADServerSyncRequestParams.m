@interface ADServerSyncRequestParams
- (ADServerSyncRequestParams)initWithAssistantId:(id)a3 sharedUserId:(id)a4 syncType:(id)a5 clientGeneration:(id)a6 clusterId:(id)a7 triggerType:(int64_t)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)assistantId;
- (NSString)clientGeneration;
- (NSString)clusterId;
- (NSString)sharedUserId;
- (NSString)syncType;
- (id)description;
- (int64_t)triggerType;
- (unint64_t)hash;
@end

@implementation ADServerSyncRequestParams

- (ADServerSyncRequestParams)initWithAssistantId:(id)a3 sharedUserId:(id)a4 syncType:(id)a5 clientGeneration:(id)a6 clusterId:(id)a7 triggerType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ADServerSyncRequestParams;
  v19 = -[ADServerSyncRequestParams init](&v31, "init");
  if (v19)
  {
    v20 = (NSString *)[v14 copy];
    assistantId = v19->_assistantId;
    v19->_assistantId = v20;

    v22 = (NSString *)[v15 copy];
    sharedUserId = v19->_sharedUserId;
    v19->_sharedUserId = v22;

    v24 = (NSString *)[v16 copy];
    syncType = v19->_syncType;
    v19->_syncType = v24;

    v26 = (NSString *)[v17 copy];
    clientGeneration = v19->_clientGeneration;
    v19->_clientGeneration = v26;

    v28 = (NSString *)[v18 copy];
    clusterId = v19->_clusterId;
    v19->_clusterId = v28;

    v19->_triggerType = a8;
  }

  return v19;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"ADServerSyncRequestParams: AssistantId -> %@, SharedUserId -> %@, SyncType -> %@, ClientGeneration -> %@, ClusterId -> %@, Trigger Type -> %ld",  self->_assistantId,  self->_sharedUserId,  self->_syncType,  self->_clientGeneration,  self->_clusterId,  self->_triggerType);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADServerSyncRequestParams *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADServerSyncRequestParams);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      assistantId = self->_assistantId;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams assistantId](v6, "assistantId"));
      v9 = assistantId;
      v10 = v8;
      if (v9 == v10)
      {
      }

      else
      {
        v11 = v10;
        if (!v9 || !v10) {
          goto LABEL_34;
        }
        unsigned int v12 = -[NSString isEqual:](v9, "isEqual:", v10);

        if (!v12) {
          goto LABEL_35;
        }
      }

      sharedUserId = self->_sharedUserId;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams sharedUserId](v6, "sharedUserId"));
      v9 = sharedUserId;
      id v16 = v15;
      if (v9 == v16)
      {
      }

      else
      {
        v11 = v16;
        if (!v9 || !v16) {
          goto LABEL_34;
        }
        unsigned int v17 = -[NSString isEqual:](v9, "isEqual:", v16);

        if (!v17) {
          goto LABEL_35;
        }
      }

      syncType = self->_syncType;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams syncType](v6, "syncType"));
      v9 = syncType;
      v20 = v19;
      if (v9 == v20)
      {
      }

      else
      {
        v11 = v20;
        if (!v9 || !v20) {
          goto LABEL_34;
        }
        unsigned int v21 = -[NSString isEqual:](v9, "isEqual:", v20);

        if (!v21) {
          goto LABEL_35;
        }
      }

      clientGeneration = self->_clientGeneration;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams clientGeneration](v6, "clientGeneration"));
      v9 = clientGeneration;
      v24 = v23;
      if (v9 == v24)
      {
      }

      else
      {
        v11 = v24;
        if (!v9 || !v24) {
          goto LABEL_34;
        }
        unsigned int v25 = -[NSString isEqual:](v9, "isEqual:", v24);

        if (!v25) {
          goto LABEL_35;
        }
      }

      clusterId = self->_clusterId;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADServerSyncRequestParams clusterId](v6, "clusterId"));
      v9 = clusterId;
      v28 = v27;
      if (v9 == v28)
      {

LABEL_39:
        id triggerType = (id)self->_triggerType;
        BOOL v13 = triggerType == (id)-[ADServerSyncRequestParams triggerType](v6, "triggerType");
        goto LABEL_36;
      }

      v11 = v28;
      if (v9 && v28)
      {
        unsigned int v29 = -[NSString isEqual:](v9, "isEqual:", v28);

        if (v29) {
          goto LABEL_39;
        }
LABEL_35:
        BOOL v13 = 0;
LABEL_36:

        goto LABEL_37;
      }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_assistantId, "hash");
  v4 = (char *)-[NSString hash](self->_sharedUserId, "hash") + 32 * v3 - v3;
  int64_t v5 = (_BYTE *)-[NSString hash](self->_syncType, "hash") - v4 + 32LL * (void)v4;
  int64_t v6 = -[NSString hash](self->_clientGeneration, "hash") + 32 * v5 - v5;
  NSUInteger v7 = -[NSString hash](self->_clusterId, "hash");
  return self->_triggerType - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (NSString)syncType
{
  return self->_syncType;
}

- (NSString)clientGeneration
{
  return self->_clientGeneration;
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (NSString)clusterId
{
  return self->_clusterId;
}

- (void).cxx_destruct
{
}

@end