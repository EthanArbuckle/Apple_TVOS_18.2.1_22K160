@interface __NSPlaceholderFileSecurity
+ (BOOL)supportsSecureCoding;
+ (id)immutablePlaceholder;
- (__NSPlaceholderFileSecurity)init;
- (__NSPlaceholderFileSecurity)initWithCoder:(id)a3;
- (__NSPlaceholderFileSecurity)initWithFileSec:(_filesec *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSPlaceholderFileSecurity

+ (id)immutablePlaceholder
{
  return &___immutablePlaceholderFileSecurity;
}

- (__NSPlaceholderFileSecurity)initWithFileSec:(_filesec *)a3
{
  if (self == (__NSPlaceholderFileSecurity *)&___immutablePlaceholderFileSecurity) {
    return (__NSPlaceholderFileSecurity *)+[__NSFileSecurity __new:](&OBJC_CLASS_____NSFileSecurity, "__new:", a3);
  }
  else {
    return 0LL;
  }
}

- (__NSPlaceholderFileSecurity)init
{
  result = (__NSPlaceholderFileSecurity *)filesec_init();
  if (result) {
    return -[__NSPlaceholderFileSecurity initWithFileSec:](self, "initWithFileSec:", result);
  }
  return result;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (__NSPlaceholderFileSecurity)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (![a3 allowsKeyedCoding])
  {

    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  @"FileSecurity cannot be decoded by non-keyed archivers",  0LL));
  }

  v5 = @"NSCocoaErrorDomain";
  uint64_t v6 = [a3 decodeBytesForKey:@"NS.filesec" returnedLength:&__size];
  if (!v6)
  {
    v8 = &off_189B40150;
    CFIndex v9 = 4865LL;
    goto LABEL_6;
  }

  size_t v7 = __size;
  if (__size - 10313 < 0xFFFFFFFFFFFFD7FFLL)
  {
    v8 = &off_189B40178;
    CFIndex v9 = 4864LL;
LABEL_6:

    CFErrorRef v10 = CFErrorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v5, v9, (CFDictionaryRef)v8);
    [a3 failWithError:CFAutorelease(v10)];
    return 0LL;
  }

  v13 = (const void *)v6;
  if (__size < 0x449)
  {
    v14 = v20;
  }

  else
  {
    v14 = malloc(__size);
    if (!v14)
    {
      v5 = @"NSPOSIXErrorDomain";
      CFIndex v9 = *__error();
      v8 = &off_189B401A0;
      goto LABEL_6;
    }
  }

  memcpy(v14, v13, v7);
  v15 = filesec_init();
  v16 = v15;
  if (!v15)
  {
    v5 = @"NSPOSIXErrorDomain";
    v11 = 0LL;
    CFIndex v9 = *__error();
    v8 = &off_189B401C8;
    goto LABEL_44;
  }

  int v17 = *(_DWORD *)v14;
  if ((*(_DWORD *)v14 & 1) != 0)
  {
    LODWORD(obj_p) = v14[1];
    if (filesec_set_property(v15, FILESEC_OWNER, &obj_p))
    {
      v5 = @"NSPOSIXErrorDomain";
      v11 = 0LL;
      CFIndex v9 = *__error();
      v8 = &off_189B401F0;
      goto LABEL_44;
    }

    int v17 = *(_DWORD *)v14;
  }

  if ((v17 & 2) != 0)
  {
    LODWORD(obj_p) = v14[2];
    if (filesec_set_property(v16, FILESEC_GROUP, &obj_p))
    {
      v5 = @"NSPOSIXErrorDomain";
      v11 = 0LL;
      CFIndex v9 = *__error();
      v8 = &off_189B40218;
      goto LABEL_44;
    }

    int v17 = *(_DWORD *)v14;
  }

  if ((v17 & 0x10) != 0)
  {
    LOWORD(obj_p) = v14[3];
    if (filesec_set_property(v16, FILESEC_MODE, &obj_p))
    {
      v5 = @"NSPOSIXErrorDomain";
      v11 = 0LL;
      CFIndex v9 = *__error();
      v8 = &off_189B40240;
      goto LABEL_44;
    }

    int v17 = *(_DWORD *)v14;
  }

  if ((v17 & 4) != 0)
  {
    if (filesec_set_property(v16, FILESEC_UUID, v14 + 4))
    {
      v5 = @"NSPOSIXErrorDomain";
      v11 = 0LL;
      CFIndex v9 = *__error();
      v8 = &off_189B40268;
      goto LABEL_44;
    }

    int v17 = *(_DWORD *)v14;
  }

  if ((v17 & 8) != 0)
  {
    if (filesec_set_property(v16, FILESEC_GRPUUID, v14 + 6))
    {
      v5 = @"NSPOSIXErrorDomain";
      v11 = 0LL;
      CFIndex v9 = *__error();
      v8 = &off_189B40290;
      goto LABEL_44;
    }

    int v17 = *(_DWORD *)v14;
  }

  if ((v17 & 0x20) == 0) {
    goto LABEL_35;
  }
  if (!memchr(v14 + 8, 0, __size - 64))
  {
    v8 = &off_189B402B8;
LABEL_42:
    CFIndex v9 = 4864LL;
    goto LABEL_43;
  }

  obj_p = acl_from_text((const char *)v14 + 64);
  if (!obj_p)
  {
    v8 = &off_189B402E0;
    goto LABEL_42;
  }

  if (!filesec_set_property(v16, FILESEC_ACL, &obj_p))
  {
    acl_free(obj_p);
LABEL_35:
    v11 = -[__NSPlaceholderFileSecurity initWithFileSec:](self, "initWithFileSec:", v16, obj_p);
    v8 = &off_189B40128;
    CFIndex v9 = 4864LL;
    goto LABEL_44;
  }

  v5 = @"NSPOSIXErrorDomain";
  CFIndex v9 = *__error();
  v8 = &off_189B40308;
LABEL_43:
  v11 = 0LL;
LABEL_44:
  if (v14 != (void *)v20) {
    free(v14);
  }
  if (!v11)
  {
    if (v16) {
      filesec_free(v16);
    }
    goto LABEL_6;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = __CFLookUpClass("NSFileSecurity");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized FileSecurity object",  v6);
  size_t v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  +[__NSPlaceholderFileSecurity supportsSecureCoding](v8, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = __CFLookUpClass("NSFileSecurity");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized FileSecurity object",  v6);
  size_t v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  return (id)-[NSFileSecurity _cfTypeID](v8, v9);
}

@end