@interface PurchaseOwner
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PurchaseOwner

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PurchaseOwner;
  id v3 = -[PurchaseOwner description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: {type = %ld; DSID = %@}",
                   v4,
                   self->_ownerType,
                   self->_purchaserDSID));

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSNumber hash](self->_purchaserDSID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PurchaseOwner *)a3;
  v6 = v4;
  if (v4)
  {
    if (self == v4)
    {
      LOBYTE(self) = 1;
      goto LABEL_14;
    }

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___PurchaseOwner, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v10 = v8;
      if (!self)
      {
LABEL_13:

        goto LABEL_14;
      }

      purchaserDSID = self->_purchaserDSID;
      v12 = (NSNumber *)objc_getProperty(v8, v9, 16LL, 1);
      if (purchaserDSID == v12)
      {
        v14 = purchaserDSID;
      }

      else
      {
        v14 = v12;
        if (!-[NSNumber isEqual:](self->_purchaserDSID, "isEqual:", objc_getProperty(v10, v13, 16LL, 1)))
        {
          LOBYTE(self) = 0;
LABEL_12:

          goto LABEL_13;
        }
      }

      LOBYTE(self) = self->_ownerType == v10->_ownerType;
      goto LABEL_12;
    }
  }

  LOBYTE(self) = 0;
LABEL_14:

  return (char)self;
}

- (void).cxx_destruct
{
}

@end