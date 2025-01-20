@interface APSTopicState
- (APSConnectionServer)connectionServer;
- (APSTopicAttributes)attributes;
- (APSTopicState)initWithTopicName:(id)a3 connectionServer:(id)a4 attributes:(id)a5 topicHash:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSData)topicHash;
- (NSString)topicName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)currentFilter;
- (int64_t)desiredFilter;
- (void)setCurrentFilter:(int64_t)a3;
- (void)setDesiredFilter:(int64_t)a3;
@end

@implementation APSTopicState

- (APSTopicState)initWithTopicName:(id)a3 connectionServer:(id)a4 attributes:(id)a5 topicHash:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___APSTopicState;
  v15 = -[APSTopicState init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topicName, a3);
    objc_storeStrong((id *)&v16->_topicHash, a6);
    objc_storeWeak((id *)&v16->_connectionServer, v12);
    objc_storeStrong((id *)&v16->_attributes, a5);
    v16->_currentFilter = 0LL;
    v16->_desiredFilter = 0LL;
  }

  return v16;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___APSTopicState;
  id v3 = -[APSTopicState description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionServer);
  __int128 v13 = *(_OWORD *)&self->_topicName;
  attributes = self->_attributes;
  v7 = sub_1000619A4(self->_currentFilter);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_1000619A4(self->_desiredFilter);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ connectionServer=%@, topicName=%@, topicHash=%@, attributes=%@, currentFilter=%@, desiredFilter=%@",  v4,  WeakRetained,  v13,  attributes,  v8,  v10));

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___APSTopicState);
  objc_storeStrong((id *)&v4->_topicName, self->_topicName);
  objc_storeStrong((id *)&v4->_topicHash, self->_topicHash);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionServer);
  objc_storeWeak((id *)&v4->_connectionServer, WeakRetained);

  objc_storeStrong((id *)&v4->_attributes, self->_attributes);
  v4->_currentFilter = self->_currentFilter;
  v4->_desiredFilter = self->_desiredFilter;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (APSTopicState *)a3;
  v6 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (self == v4)
  {
    LOBYTE(v17) = 1;
    goto LABEL_28;
  }

  uint64_t v7 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState topicName](v8, "topicName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState topicName](self, "topicName"));
    if ([v9 isEqualToString:v10])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState topicHash](v8, "topicHash"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState topicHash](self, "topicHash"));
      if ([v11 isEqualToData:v12])
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState connectionServer](v8, "connectionServer"));
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState connectionServer](self, "connectionServer"));
        if ([v13 isEqual:v14])
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](v8, "attributes"));
          id v15 = [v31 filter];
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](self, "attributes"));
          if (v15 == [v32 filter])
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](v8, "attributes"));
            unsigned int v16 = [v30 isDarkWakeEnabled];
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](self, "attributes"));
            if (v16 == [v29 isDarkWakeEnabled])
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](v8, "attributes"));
              unsigned int v19 = [v28 isPushWakeEnabled];
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](self, "attributes"));
              if (v19 == [v27 isPushWakeEnabled])
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](v8, "attributes"));
                unsigned int v20 = [v26 isCriticalWakeEnabled];
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](self, "attributes"));
                if (v20 == [v25 isCriticalWakeEnabled])
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](v8, "attributes"));
                  unsigned int v23 = [v24 isUltraConstrainedEnabled];
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicState attributes](self, "attributes"));
                  unsigned int v17 = v23 ^ [v21 isUltraConstrainedEnabled] ^ 1;
                }

                else
                {
                  LOBYTE(v17) = 0;
                }

                objc_super v18 = v31;
              }

              else
              {
                LOBYTE(v17) = 0;
                objc_super v18 = v31;
              }
            }

            else
            {
              LOBYTE(v17) = 0;
              objc_super v18 = v31;
            }
          }

          else
          {
            LOBYTE(v17) = 0;
            objc_super v18 = v31;
          }
        }

        else
        {
          LOBYTE(v17) = 0;
        }
      }

      else
      {
        LOBYTE(v17) = 0;
      }
    }

    else
    {
      LOBYTE(v17) = 0;
    }
  }

  else
  {
LABEL_10:
    LOBYTE(v17) = 0;
  }

- (APSConnectionServer)connectionServer
{
  return (APSConnectionServer *)objc_loadWeakRetained((id *)&self->_connectionServer);
}

- (NSString)topicName
{
  return self->_topicName;
}

- (NSData)topicHash
{
  return self->_topicHash;
}

- (APSTopicAttributes)attributes
{
  return self->_attributes;
}

- (int64_t)currentFilter
{
  return self->_currentFilter;
}

- (void)setCurrentFilter:(int64_t)a3
{
  self->_currentFilter = a3;
}

- (int64_t)desiredFilter
{
  return self->_desiredFilter;
}

- (void)setDesiredFilter:(int64_t)a3
{
  self->_desiredFilter = a3;
}

- (void).cxx_destruct
{
}

@end