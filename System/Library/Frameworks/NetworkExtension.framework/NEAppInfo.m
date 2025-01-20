@interface NEAppInfo
+ (BOOL)supportsSecureCoding;
- (NEAppInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEAppInfo

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeInt:self->_pid forKey:@"Pid"];
    [v5 encodeObject:self->_uuid forKey:@"UUID"];
    [v5 encodeObject:self->_bundleID forKey:@"BundleID"];
    [v5 encodeObject:self->_appVersion forKey:@"AppVersion"];
    cdHash = self->_cdHash;
  }

  else
  {
    [v5 encodeInt:0 forKey:@"Pid"];
    [v5 encodeObject:0 forKey:@"UUID"];
    [v5 encodeObject:0 forKey:@"BundleID"];
    [v5 encodeObject:0 forKey:@"AppVersion"];
    cdHash = 0LL;
  }

  [v5 encodeObject:cdHash forKey:@"CDHash"];
}

- (NEAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEAppInfo;
  id v5 = -[NEAppInfo init](&v15, sel_init);
  if (v5)
  {
    v5->_pid = [v4 decodeIntForKey:@"Pid"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v7, v6, 16LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleID"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v9, v8, 24LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppVersion"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v11, v10, 32LL);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CDHash"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v13, v12, 40LL);
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    uint64_t pid = self->_pid;
    id v5 = self->_uuid;
    v6 = self->_bundleID;
    SEL v7 = self->_appVersion;
    v8 = self->_cdHash;
    BOOL v9 = self->_cdHash != 0LL;
  }

  else
  {
    v8 = 0LL;
    v6 = 0LL;
    uint64_t pid = 0LL;
    id v5 = 0LL;
    SEL v7 = 0LL;
    BOOL v9 = 0LL;
  }

  v10 = (void *)[v3 initWithFormat:@"\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n", pid, v5, v6, v7, v8, v9];

  return v10;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    uint64_t pid = self->_pid;
    id v5 = self->_uuid;
    v6 = self->_bundleID;
    SEL v7 = self->_appVersion;
    v8 = self->_cdHash;
    BOOL v9 = self->_cdHash != 0LL;
  }

  else
  {
    v8 = 0LL;
    v6 = 0LL;
    uint64_t pid = 0LL;
    id v5 = 0LL;
    SEL v7 = 0LL;
    BOOL v9 = 0LL;
  }

  v10 = (void *)[v3 initWithFormat:@"\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n", pid, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (self)
  {
    int pid = self->_pid;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int pid = 0;
  if (v4) {
LABEL_3:
  }
    v4[2] = pid;
LABEL_4:
  if (self)
  {
    uuid = self->_uuid;
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  uuid = 0LL;
  if (v4) {
LABEL_6:
  }
    objc_setProperty_nonatomic_copy(v4, v5, uuid, 16LL);
LABEL_7:
  if (self)
  {
    bundleID = self->_bundleID;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  bundleID = 0LL;
  if (v6) {
LABEL_9:
  }
    objc_setProperty_nonatomic_copy(v6, v5, bundleID, 24LL);
LABEL_10:
  if (self)
  {
    appVersion = self->_appVersion;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  appVersion = 0LL;
  if (v6) {
LABEL_12:
  }
    objc_setProperty_nonatomic_copy(v6, v5, appVersion, 32LL);
LABEL_13:
  if (!self)
  {
    cdHash = 0LL;
    if (!v6) {
      return v6;
    }
    goto LABEL_15;
  }

  cdHash = self->_cdHash;
  if (v6) {
LABEL_15:
  }
    objc_setProperty_nonatomic_copy(v6, v5, cdHash, 40LL);
  return v6;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end