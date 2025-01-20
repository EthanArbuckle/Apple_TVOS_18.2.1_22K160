@interface DACRoleServiceClient
- (BOOL)isEqual:(id)a3;
- (DACRoleServiceClient)initWithConnection:(id)a3;
- (id)description;
@end

@implementation DACRoleServiceClient

- (DACRoleServiceClient)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DACRoleServiceClient;
  v3 = -[DACServiceClient initWithConnection:](&v7, "initWithConnection:", a3);
  v4 = v3;
  if (v3)
  {
    cluster = v3->_cluster;
    v3->_cluster = 0LL;
  }

  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, %@>",  v5,  self,  v6));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DACRoleServiceClient;
  if (-[DACServiceClient isEqual:](&v21, "isEqual:", v5))
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___DACRoleServiceClient, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = (id *)v5;
      if (!self)
      {
LABEL_29:

        goto LABEL_30;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
      if (![v9 isEqual:v10])
      {
        LOBYTE(self) = 0;
LABEL_28:

        goto LABEL_29;
      }

      v11 = self->_cluster;
      if (!v11 && (!v8 || (id v20 = v8[3]) == 0LL))
      {
        id v20 = 0LL;
        LOBYTE(self) = 1;
        goto LABEL_26;
      }

      v12 = self->_cluster;
      if (v12)
      {
        v13 = self->_cluster;
        if (v8) {
          id v14 = v8[3];
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

      id v15 = v8[3];
      if (v15)
      {
        v16 = v15;
        self = (DACRoleServiceClient *)self->_cluster;
        id v17 = v8[3];
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