@interface SFAccessControlEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)canRead;
- (BOOL)canWrite;
- (BOOL)isOwner;
- (NSString)bundleID;
- (SFAccessControlEntry)initWithBundleID:(id)a3 owner:(BOOL)a4 canRead:(BOOL)a5 canWrite:(BOOL)a6;
- (SFAccessControlEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBundleID:(id)a3;
- (void)setCanRead:(BOOL)a3;
- (void)setCanWrite:(BOOL)a3;
- (void)setOwner:(BOOL)a3;
@end

@implementation SFAccessControlEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAccessControlEntry)initWithBundleID:(id)a3 owner:(BOOL)a4 canRead:(BOOL)a5 canWrite:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SFAccessControlEntry;
  v11 = -[SFAccessControlEntry init](&v18, sel_init);
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    accessControlEntryInternal = v11->_accessControlEntryInternal;
    v14 = (void *)accessControlEntryInternal[1];
    accessControlEntryInternal[1] = v12;

    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFE | a4;
    if (v7) {
      char v15 = 2;
    }
    else {
      char v15 = 0;
    }
    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFD | v15;
    if (v6) {
      char v16 = 4;
    }
    else {
      char v16 = 0;
    }
    *((_BYTE *)v11->_accessControlEntryInternal + 16) = *((_BYTE *)v11->_accessControlEntryInternal + 16) & 0xFB | v16;
  }

  return v11;
}

- (SFAccessControlEntry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFAccessControlEntry;
  return -[SFAccessControlEntry init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithBundleID:*((void *)self->_accessControlEntryInternal + 1) owner:*((_BYTE *)self->_accessControlEntryInternal + 16) & 1 canRead:(*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 1) & 1 canWrite:(*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 2) & 1];
}

- (BOOL)isOwner
{
  return *((_BYTE *)self->_accessControlEntryInternal + 16) & 1;
}

- (void)setOwner:(BOOL)a3
{
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFE | a3;
}

- (BOOL)canRead
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 1) & 1;
}

- (void)setCanRead:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFD | v3;
}

- (BOOL)canWrite
{
  return (*((unsigned __int8 *)self->_accessControlEntryInternal + 16) >> 2) & 1;
}

- (void)setCanWrite:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self->_accessControlEntryInternal + 16) = *((_BYTE *)self->_accessControlEntryInternal + 16) & 0xFB | v3;
}

- (NSString)bundleID
{
  return (NSString *)(id)[*((id *)self->_accessControlEntryInternal + 1) copy];
}

- (void)setBundleID:(id)a3
{
  uint64_t v4 = [a3 copy];
  accessControlEntryInternal = self->_accessControlEntryInternal;
  BOOL v6 = (void *)accessControlEntryInternal[1];
  accessControlEntryInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end