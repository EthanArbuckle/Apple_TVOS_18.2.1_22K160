@interface NRDOrphanedConnection
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation NRDOrphanedConnection

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self)
  {
    v4 = self->_nrUUID;
    connection = self->_connection;
  }

  else
  {
    v4 = 0LL;
    connection = 0LL;
  }

  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[OrphanedConnection:%@,%@]", v4, connection);

  return v6;
}

- (unint64_t)hash
{
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0LL;
  }
  v4 = nrUUID;
  id v5 = -[NSUUID hash](v4, "hash");
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0LL;
  }
  unint64_t v7 = (unint64_t)connection + (void)v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v8 = nrUUID;
    if (v6) {
      v9 = (void *)v6[1];
    }
    else {
      v9 = 0LL;
    }
    id v10 = v9;
    if (!-[NSUUID isEqual:](v8, "isEqual:", v10))
    {
      BOOL v13 = 0;
      goto LABEL_13;
    }

    if (self)
    {
      connection = self->_connection;
      if (v6)
      {
LABEL_9:
        v12 = (OS_xpc_object *)v6[2];
LABEL_10:
        BOOL v13 = connection == v12;
LABEL_13:

        goto LABEL_14;
      }
    }

    else
    {
      connection = 0LL;
      if (v6) {
        goto LABEL_9;
      }
    }

    v12 = 0LL;
    goto LABEL_10;
  }

  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
}

@end