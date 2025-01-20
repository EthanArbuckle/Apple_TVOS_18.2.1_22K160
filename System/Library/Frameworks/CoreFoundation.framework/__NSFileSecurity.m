@interface __NSFileSecurity
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)__new:(_filesec *)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)clearProperties:(unint64_t)a3;
- (BOOL)copyAccessControlList:(_acl *)a3;
- (BOOL)getGroup:(unsigned int *)a3;
- (BOOL)getGroupUUID:(unsigned __int8 *)(a3;
- (BOOL)getMode:(unsigned __int16 *)a3;
- (BOOL)getOwner:(unsigned int *)a3;
- (BOOL)getOwnerUUID:(unsigned __int8 *)(a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setAccessControlList:(_acl *)a3;
- (BOOL)setGroup:(unsigned int)a3;
- (BOOL)setGroupUUID:(unsigned __int8)a3[16];
- (BOOL)setMode:(unsigned __int16)a3;
- (BOOL)setOwner:(unsigned int)a3;
- (BOOL)setOwnerUUID:(unsigned __int8)a3[16];
- (__NSFileSecurity)initWithCoder:(id)a3;
- (_filesec)_filesec;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSFileSecurity

+ (id)__new:(_filesec *)a3
{
  id result = (id)__CFAllocateObject((objc_class *)a1, 0LL);
  *((void *)result + 1) = a3;
  return result;
}

- (_filesec)_filesec
{
  return self->_filesec;
}

- (BOOL)getOwner:(unsigned int *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_OWNER, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)setOwner:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unsigned int v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_OWNER, &v4) == 0;
}

- (BOOL)getGroup:(unsigned int *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_GROUP, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)setGroup:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unsigned int v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_GROUP, &v4) == 0;
}

- (BOOL)getMode:(unsigned __int16 *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_MODE, &v6);
  if (!property) {
    *a3 = v6;
  }
  return property == 0;
}

- (BOOL)setMode:(unsigned __int16)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unsigned __int16 v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_MODE, &v4) == 0;
}

- (BOOL)getOwnerUUID:(unsigned __int8 *)(a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_UUID, &v6);
  if (!property) {
    *(_OWORD *)a3 = v6;
  }
  return property == 0;
}

- (BOOL)setOwnerUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_UUID, a3) == 0;
}

- (BOOL)getGroupUUID:(unsigned __int8 *)(a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_GRPUUID, &v6);
  if (!property) {
    *(_OWORD *)a3 = v6;
  }
  return property == 0;
}

- (BOOL)setGroupUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_GRPUUID, a3) == 0;
}

- (BOOL)copyAccessControlList:(_acl *)a3
{
  acl[1] = *(acl_t *)MEMORY[0x1895F89C0];
  int property = filesec_get_property(self->_filesec, FILESEC_ACL, acl);
  if (!property)
  {
    uint64_t v5 = acl_dup(acl[0]);
    *a3 = v5;
    if (v5) {
      acl_free(acl[0]);
    }
    else {
      *a3 = acl[0];
    }
  }

  return property == 0;
}

- (BOOL)setAccessControlList:(_acl *)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  filesec = self->_filesec;
  v7[0] = a3;
  unsigned __int16 v4 = v7;
  if (!a3) {
    unsigned __int16 v4 = 0LL;
  }
  if (a3 == (_acl *)1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = (uint64_t)v4;
  }
  return filesec_set_property(filesec, FILESEC_ACL, (const void *)v5) == 0;
}

- (BOOL)clearProperties:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 1) != 0)
  {
    BOOL v5 = filesec_unset_property(self->_filesec, FILESEC_OWNER) == 0;
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v5 = 1;
    if ((a3 & 2) == 0) {
      goto LABEL_7;
    }
  }

  if (filesec_unset_property(self->_filesec, FILESEC_GROUP)) {
    BOOL v5 = 0;
  }
LABEL_7:
  if ((v3 & 4) != 0)
  {
    if (filesec_unset_property(self->_filesec, FILESEC_MODE)) {
      BOOL v5 = 0;
    }
    if ((v3 & 8) == 0)
    {
LABEL_9:
      if ((v3 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }

  else if ((v3 & 8) == 0)
  {
    goto LABEL_9;
  }

  if (filesec_unset_property(self->_filesec, FILESEC_UUID)) {
    BOOL v5 = 0;
  }
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      return v5;
    }
    goto LABEL_11;
  }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  filesec = self->_filesec;
  if (filesec) {
    filesec_free(filesec);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSFileSecurity;
  -[__NSFileSecurity dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  char v3 = -[__NSFileSecurity _filesec](self, "_filesec");
  if (v3)
  {
    objc_super v4 = v3;
    if (filesec_get_property(v3, FILESEC_OWNER, v11)) {
      unint64_t v2 = 1LL;
    }
    else {
      unint64_t v2 = 3LL;
    }
    if (!filesec_get_property(v4, FILESEC_GROUP, v10)) {
      v2 |= 4uLL;
    }
    if (!filesec_get_property(v4, FILESEC_UUID, v9)) {
      v2 |= 8uLL;
    }
    if (!filesec_get_property(v4, FILESEC_MODE, v8)) {
      v2 |= 0x10uLL;
    }
    if (!filesec_get_property(v4, FILESEC_ACL, &obj_p))
    {
      acl_free(obj_p);
      v2 |= 0x20uLL;
    }

    if (!filesec_get_property(v4, FILESEC_GRPUUID, &v6)) {
      v2 |= 0x40uLL;
    }
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = -[__NSFileSecurity _filesec](self, "_filesec");
  uint64_t v6 = [a3 _filesec];
  uint64_t v7 = (_filesec *)v6;
  if (!v5 || !v6) {
    return ((unint64_t)v5 | v6) == 0;
  }
  int property = filesec_get_property(v5, FILESEC_OWNER, &acl);
  if ((property == 0) == (filesec_get_property(v7, FILESEC_OWNER, &v26) != 0)
    || !property && (_DWORD)acl != (_DWORD)v26)
  {
    return 0;
  }

  int v9 = filesec_get_property(v5, FILESEC_GROUP, &acl);
  if ((v9 == 0) == (filesec_get_property(v7, FILESEC_GROUP, &v26) != 0) || !v9 && (_DWORD)acl != (_DWORD)v26) {
    return 0;
  }
  int v10 = filesec_get_property(v5, FILESEC_MODE, &acl);
  if ((v10 == 0) == (filesec_get_property(v7, FILESEC_MODE, &v26) != 0)
    || !v10 && (unsigned __int16)acl != (unsigned __int16)v26)
  {
    return 0;
  }

  int v11 = filesec_get_property(v5, FILESEC_UUID, &acl);
  if ((v11 == 0) == (filesec_get_property(v7, FILESEC_UUID, &v26) != 0)) {
    return 0;
  }
  if (!v11 && (acl != v26 || v29 != v27)) {
    return 0;
  }
  int v12 = filesec_get_property(v5, FILESEC_GRPUUID, &acl);
  if ((v12 == 0) == (filesec_get_property(v7, FILESEC_GRPUUID, &v26) != 0)) {
    return 0;
  }
  if (!v12 && (acl != v26 || v29 != v27)) {
    return 0;
  }
  int v13 = filesec_get_property(v5, FILESEC_ACL, &acl);
  int v14 = filesec_get_property(v7, FILESEC_ACL, &v26);
  int v15 = v14;
  if (v14 | v13)
  {
    BOOL v16 = (v13 == 0) == (v14 == 0);
    if (v13) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }

  v20 = acl_to_text(acl, &len_p);
  v21 = acl_to_text(v26, &v24);
  v22 = v21;
  if (v20 && v21)
  {
    BOOL v23 = len_p == v24 && memcmp(v20, v21, len_p) == 0;
    goto LABEL_43;
  }

  BOOL v23 = 0;
  BOOL v16 = 0;
  if (v20)
  {
LABEL_43:
    acl_free(v20);
    BOOL v16 = v23;
  }

  if (v22) {
    acl_free(v22);
  }
LABEL_46:
  acl_free(acl);
LABEL_47:
  if (!v15) {
    acl_free(v26);
  }
  return v16;
}

- (id)description
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  char v3 = -[__NSFileSecurity _filesec](self, "_filesec");
  objc_super v4 = v3;
  if (!v3)
  {
LABEL_47:
    id result = (id)CFStringCreateWithFormat(0LL, 0LL, @"<FileSecurity %p> [%p]", self, v4);
    if (!result) {
      return result;
    }
    return (id)_CFAutoreleasePoolAddObject();
  }

  int property = filesec_get_property(v3, FILESEC_OWNER, &v31);
  int v6 = filesec_get_property(v4, FILESEC_GROUP, &v30);
  int v24 = filesec_get_property(v4, FILESEC_MODE, &v29);
  int v7 = filesec_get_property(v4, FILESEC_UUID, &v28);
  int v8 = filesec_get_property(v4, FILESEC_GRPUUID, &v27);
  int v9 = filesec_get_property(v4, FILESEC_ACL, &acl);
  if (v7)
  {
    CFUUIDRef cf = 0LL;
    if (v8)
    {
LABEL_4:
      CFUUIDRef v10 = 0LL;
      goto LABEL_7;
    }
  }

  else
  {
    CFUUIDRef cf = CFUUIDCreateFromUUIDBytes(0LL, v28);
    if (v8) {
      goto LABEL_4;
    }
  }

  CFUUIDRef v10 = CFUUIDCreateFromUUIDBytes(0LL, v27);
LABEL_7:
  int v22 = v9;
  if (v9)
  {
    v21 = 0LL;
    int v11 = @"(null)";
    if (property)
    {
LABEL_9:
      CFStringRef v12 = @"(null)";
      goto LABEL_20;
    }
  }

  else
  {
    if (acl == (acl_t)1)
    {
      int v11 = @"_FILESEC_REMOVE_ACL";
    }

    else
    {
      int v13 = acl_to_text(acl, &len_p);
      if (v13)
      {
        int v14 = v13;
        CFStringRef v15 = CFStringCreateWithBytes(0LL, (const UInt8 *)v13, len_p, 0x8000100u, 0);
        acl_free(v14);
      }

      else
      {
        CFStringRef v15 = 0LL;
      }

      if (v15) {
        int v11 = v15;
      }
      else {
        int v11 = @"(acl_to_text failed)";
      }
    }

    v21 = v11;
    if (property) {
      goto LABEL_9;
    }
  }

  CFStringRef v12 = CFStringCreateWithFormat(0LL, 0LL, @"%d", v31);
LABEL_20:
  int v16 = v6;
  if (v6) {
    CFStringRef v17 = @"(null)";
  }
  else {
    CFStringRef v17 = CFStringCreateWithFormat(0LL, 0LL, @"%d", v30);
  }
  if (v24) {
    CFStringRef v18 = @"(null)";
  }
  else {
    CFStringRef v18 = CFStringCreateWithFormat(0LL, 0LL, @"%d", v29);
  }
  CFStringRef v19 = 0LL;
  if (v12 && v17 && v18) {
    CFStringRef v19 = CFStringCreateWithFormat( 0LL,  0LL,  @"<FileSecurity %p> [%p] {FILESEC_OWNER = %@, FILESEC_GROUP = %@, FILESEC_MODE = %@, FILESEC_UUID = %@, FILESEC_GRPUUID = %@, FILESEC_ACL = %@}",  self,  v4,  v12,  v17,  v18,  cf,  v10,  v11,  v21);
  }
  if (!property && v12) {
    CFRelease(v12);
  }
  if (!v16 && v17) {
    CFRelease(v17);
  }
  if (!v24 && v18) {
    CFRelease(v18);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v22)
  {
    if (!v19) {
      goto LABEL_47;
    }
  }

  else
  {
    acl_free(acl);
    CFRelease(v21);
    if (!v19) {
      goto LABEL_47;
    }
  }

  return (id)_CFAutoreleasePoolAddObject();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = filesec_dup(-[__NSFileSecurity _filesec](self, "_filesec"));
  if (result) {
    return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFileSec:", result);
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[__NSPlaceholderFileSecurity immutablePlaceholder]( &OBJC_CLASS_____NSPlaceholderFileSecurity,  "immutablePlaceholder",  a3);
}

- (void)encodeWithCoder:(id)a3
{
  len_p[1] = *MEMORY[0x1895F89C0];
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  @"NSFileSecurity cannot be encoded by non-keyed archivers",  0LL));
  }
  uint64_t v5 = -[__NSFileSecurity _filesec](self, "_filesec");
  len_p[0] = 0LL;
  if (filesec_get_property(v5, FILESEC_ACL, &acl))
  {
    int v6 = (char *)CFAllocatorAllocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 72LL, 0LL);
    if (!v6) {
      return;
    }
    int v7 = v6;
    *((void *)v6 + 8) = 0LL;
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *(_OWORD *)int v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *(_DWORD *)int v6 = 0;
    size_t v8 = 72LL;
    v6[64] = 0;
    goto LABEL_8;
  }

  int v9 = acl_to_text(acl, len_p);
  if (!v9)
  {
LABEL_20:
    acl_free(acl);
    return;
  }

  CFUUIDRef v10 = v9;
  size_t v8 = len_p[0] + 65;
  int v11 = (char *)CFAllocatorAllocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, len_p[0] + 65, 0LL);
  if (!v11)
  {
    free(v10);
    goto LABEL_20;
  }

  int v7 = v11;
  bzero(v11, v8);
  *(_DWORD *)int v7 = 0;
  strlcpy(v7 + 64, v10, len_p[0] + 1);
  *(_DWORD *)v7 |= 0x20u;
  free(v10);
  acl_free(acl);
LABEL_8:
  if (!filesec_get_property(v5, FILESEC_OWNER, &v14))
  {
    *((void *)v7 + 1) = v14;
    *(_DWORD *)v7 |= 1u;
  }

  if (!filesec_get_property(v5, FILESEC_GROUP, &v13))
  {
    *((void *)v7 + 2) = v13;
    *(_DWORD *)v7 |= 2u;
  }

  if (!filesec_get_property(v5, FILESEC_MODE, &v12))
  {
    *((void *)v7 + 3) = v12;
    *(_DWORD *)v7 |= 0x10u;
  }

  if (!filesec_get_property(v5, FILESEC_UUID, v7 + 32)) {
    *(_DWORD *)v7 |= 4u;
  }
  if (!filesec_get_property(v5, FILESEC_GRPUUID, v7 + 48)) {
    *(_DWORD *)v7 |= 8u;
  }
  [a3 encodeBytes:v7 length:v8 forKey:@"NS.filesec"];
  CFAllocatorDeallocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7);
}

- (__NSFileSecurity)initWithCoder:(id)a3
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end