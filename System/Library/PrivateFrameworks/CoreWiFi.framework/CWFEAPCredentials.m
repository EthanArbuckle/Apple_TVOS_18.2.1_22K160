@interface CWFEAPCredentials
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEAPCredentials:(id)a3;
- (CWFEAPCredentials)initWithCoder:(id)a3;
- (NSString)password;
- (NSString)username;
- (__SecIdentity)TLSIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)TLSIdentityHandle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPassword:(id)a3;
- (void)setTLSIdentity:(__SecIdentity *)a3;
- (void)setTLSIdentityHandle:(void *)a3;
- (void)setUsername:(id)a3;
@end

@implementation CWFEAPCredentials

- (void)dealloc
{
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFRelease(TLSIdentityHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CWFEAPCredentials;
  -[CWFEAPCredentials dealloc](&v4, sel_dealloc);
}

- (__SecIdentity)TLSIdentity
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  CFTypeRef arg = 0LL;
  if (!self->_TLSIdentityHandle) {
    return 0LL;
  }
  if (!qword_18C68E838)
  {
    __int128 v8 = xmmword_189E5C658;
    uint64_t v9 = 0LL;
    qword_18C68E838 = _sl_dlopen();
  }

  if (!qword_18C68E838) {
    return 0LL;
  }
  sub_18648DA50((uint64_t)self->_TLSIdentityHandle, (const char *)&arg, v2, v3, v4);
  result = (__SecIdentity *)arg;
  if (arg) {
    return (__SecIdentity *)CFAutorelease(arg);
  }
  return result;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFRelease(TLSIdentityHandle);
  }
  if (!a3) {
    goto LABEL_8;
  }
  if (!qword_18C68E838) {
    qword_18C68E838 = _sl_dlopen();
  }
  if (qword_18C68E838) {
    sub_18648DC18((uint64_t)a3, a2, (uint64_t)a3, v3, v4);
  }
  else {
LABEL_8:
  }
    __int128 v8 = 0LL;
  self->_TLSIdentityHandle = v8;
}

- (void)TLSIdentityHandle
{
  result = (void *)objc_msgSend_TLSIdentity(self, a2, v2, v3, v4);
  if (result)
  {
    uint64_t v10 = result;
    if (!qword_18C68E838) {
      qword_18C68E838 = _sl_dlopen();
    }
    if (qword_18C68E838)
    {
      sub_18648DC18((uint64_t)v10, v6, v7, v8, v9);
      if (result) {
        return (void *)CFAutorelease(result);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)setTLSIdentityHandle:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle != a3)
  {
    CFTypeRef cf = 0LL;
    if (a3)
    {
      if (!qword_18C68E838)
      {
        __int128 v12 = xmmword_189E5C658;
        uint64_t v13 = 0LL;
        qword_18C68E838 = _sl_dlopen();
      }

      if (qword_18C68E838)
      {
        sub_18648DA50((uint64_t)a3, (const char *)&cf, (uint64_t)a3, v3, v4);
        if (cf)
        {
          objc_msgSend_setTLSIdentity_(self, v8, (uint64_t)cf, v9, v10);
          CFRelease(cf);
        }

        return;
      }

      TLSIdentityHandle = self->_TLSIdentityHandle;
    }

    if (TLSIdentityHandle) {
      CFRelease(TLSIdentityHandle);
    }
    self->_TLSIdentityHandle = 0LL;
  }

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_( NSString,  a2,  (uint64_t)@"hasUsername=%d, hasPassword=%d, hasIdentity=%d",  v2,  v3,  self->_username != 0,  self->_password != 0,  self->_TLSIdentityHandle != 0);
}

- (BOOL)isEqualToEAPCredentials:(id)a3
{
  id v6 = a3;
  v15 = (const void *)objc_msgSend_TLSIdentity(v6, v7, v8, v9, v10);
  if (v15)
  {
    if (!qword_18C68E838) {
      qword_18C68E838 = _sl_dlopen();
    }
    if (qword_18C68E838)
    {
      sub_18648DC18((uint64_t)v15, v11, v12, v13, v14);
      v15 = v16;
    }

    else
    {
      v15 = 0LL;
    }
  }

  TLSIdentityHandle = self->_TLSIdentityHandle;
  if (TLSIdentityHandle == v15) {
    goto LABEL_11;
  }
  char isEqual = 0;
  if (v15 && TLSIdentityHandle)
  {
    if (!CFEqual(TLSIdentityHandle, v15))
    {
      char isEqual = 0;
      goto LABEL_26;
    }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFEAPCredentials *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToEAPCredentials = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToEAPCredentials = objc_msgSend_isEqualToEAPCredentials_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToEAPCredentials = 0;
  }

  return isEqualToEAPCredentials;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_username, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_password, v7, v8, v9, v10);
  CFHashCode TLSIdentityHandle = (CFHashCode)self->_TLSIdentityHandle;
  if (TLSIdentityHandle) {
    CFHashCode TLSIdentityHandle = CFHash((CFTypeRef)TLSIdentityHandle);
  }
  return v11 ^ v6 ^ TLSIdentityHandle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFEAPCredentials, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUsername_(v11, v12, (uint64_t)self->_username, v13, v14);
  objc_msgSend_setPassword_(v11, v15, (uint64_t)self->_password, v16, v17);
  uint64_t v22 = objc_msgSend_TLSIdentity(self, v18, v19, v20, v21);
  objc_msgSend_setTLSIdentity_(v11, v23, v22, v24, v25);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)username, (uint64_t)@"_username", v6);
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_password, (uint64_t)@"_password", v8);
  objc_msgSend_encodeObject_forKey_( v11,  v9,  (uint64_t)self->_TLSIdentityHandle,  (uint64_t)@"_TLSIdentityHandle",  v10);
}

- (CWFEAPCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CWFEAPCredentials;
  v5 = -[CWFEAPCredentials init](&v20, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_username", v8);
    username = v5->_username;
    v5->_username = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_password", v13);
    password = v5->_password;
    v5->_password = (NSString *)v14;

    objc_msgSend_decodePropertyListForKey_(v4, v16, (uint64_t)@"_TLSIdentityHandle", v17, v18);
    v5->_CFHashCode TLSIdentityHandle = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
}

@end