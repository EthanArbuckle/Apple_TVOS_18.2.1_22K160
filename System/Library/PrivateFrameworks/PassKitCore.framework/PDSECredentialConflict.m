@interface PDSECredentialConflict
- (BOOL)isEqual:(id)a3;
- (PDSECredentialConflict)init;
- (unint64_t)hash;
@end

@implementation PDSECredentialConflict

- (PDSECredentialConflict)init
{
  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDSECredentialConflict, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    BOOL v8 = self->_type == v7[1];
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return PKObjectHash(&type, 8uLL);
}

@end