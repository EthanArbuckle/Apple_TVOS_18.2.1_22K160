@interface DACLifecycleServiceClient
- (BOOL)isEqual:(id)a3;
- (DACLifecycleServiceClient)initWithConnection:(id)a3;
- (id)description;
@end

@implementation DACLifecycleServiceClient

- (DACLifecycleServiceClient)initWithConnection:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DACLifecycleServiceClient;
  v3 = -[DACServiceClient initWithConnection:](&v9, "initWithConnection:", a3);
  v4 = v3;
  if (v3)
  {
    subscribedCluster = v3->_subscribedCluster;
    v3->_subscribedCluster = 0LL;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    assertions = v4->_assertions;
    v4->_assertions = (NSMutableDictionary *)v6;
  }

  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, %@>",  v5,  self,  v6));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DACLifecycleServiceClient;
  if (-[DACServiceClient isEqual:](&v21, "isEqual:", v5))
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___DACLifecycleServiceClient, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = (id *)v5;
      if (!self)
      {
LABEL_29:

        goto LABEL_30;
      }

      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      if (![v9 isEqual:v10])
      {
        LOBYTE(self) = 0;
LABEL_28:

        goto LABEL_29;
      }

      v11 = self->_subscribedCluster;
      if (!v11 && (!v8 || (id v20 = v8[4]) == 0LL))
      {
        id v20 = 0LL;
        LOBYTE(self) = 1;
        goto LABEL_26;
      }

      v12 = self->_subscribedCluster;
      if (v12)
      {
        v13 = self->_subscribedCluster;
        if (v8) {
          id v14 = v8[4];
        }
        else {
          id v14 = 0LL;
        }
        id v3 = v14;
        if ((-[COCluster isEqual:](v13, "isEqual:", v3) & 1) != 0)
        {

          LOBYTE(self) = 1;
          goto LABEL_23;
        }

        v19 = v13;
        if (!v8)
        {
          LOBYTE(self) = 0;
          goto LABEL_22;
        }
      }

      else if (!v8)
      {
        LOBYTE(self) = 0;
        goto LABEL_23;
      }

      id v15 = v8[4];
      if (v15)
      {
        v16 = v15;
        self = (DACLifecycleServiceClient *)self->_subscribedCluster;
        id v17 = v8[4];
        LOBYTE(self) = [v17 isEqual:self];

        if (!v12)
        {
LABEL_23:
          if (v11)
          {
LABEL_27:

            goto LABEL_28;
          }

- (void).cxx_destruct
{
}

@end