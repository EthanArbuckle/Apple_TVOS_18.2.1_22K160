@interface CWFEventID
+ (BOOL)supportsSecureCoding;
+ (id)eventIDWithType:(int64_t)a3 interfaceName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventID:(id)a3;
- (CWFEventID)initWithCoder:(id)a3;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CWFEventID

+ (id)eventIDWithType:(int64_t)a3 interfaceName:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(&OBJC_CLASS___CWFEventID);
  objc_msgSend_setType_(v6, v7, a3, v8, v9);
  objc_msgSend_setInterfaceName_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

- (id)description
{
  v6 = (void *)NSString;
  sub_186451AFC(self->_type, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)@"type=%@, intf=%@", v9, v10, v7, self->_interfaceName);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqualToEventID:(id)a3
{
  id v4 = a3;
  int64_t type = self->_type;
  if (type == objc_msgSend_type(v4, v6, v7, v8, v9))
  {
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v4, v10, v11, v12, v13);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (interfaceName == v19)
    {
      char isEqual = 1;
    }

    else if (self->_interfaceName)
    {
      objc_msgSend_interfaceName(v4, v15, v16, v17, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = self->_interfaceName;
        objc_msgSend_interfaceName(v4, v20, v21, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(v25, v27, (uint64_t)v26, v28, v29);
      }

      else
      {
        char isEqual = 0;
      }
    }

    else
    {
      char isEqual = 0;
    }
  }

  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFEventID *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToEventID = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToEventID = objc_msgSend_isEqualToEventID_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToEventID = 0;
  }

  return isEqualToEventID;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return objc_msgSend_hash(self->_interfaceName, a2, v2, v3, v4) ^ type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = (void *)objc_msgSend_allocWithZone_(CWFEventID, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setType_(v11, v12, self->_type, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v9 = a3;
  objc_msgSend_encodeInteger_forKey_(v9, v5, type, (uint64_t)@"_type", v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_interfaceName, (uint64_t)@"_interfaceName", v8);
}

- (CWFEventID)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CWFEventID;
  uint64_t v8 = -[CWFEventID init](&v15, sel_init);
  if (v8)
  {
    v8->_int64_t type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)@"_type", v6, v7);
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)@"_interfaceName", v11);
    interfaceName = v8->_interfaceName;
    v8->_interfaceName = (NSString *)v12;
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end