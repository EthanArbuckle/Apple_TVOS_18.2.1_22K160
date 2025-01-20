@interface UMDPersonaManifestPersona
- (BOOL)isEqual:(id)a3;
- (UMDPersonaManifestPersona)init;
- (unint64_t)hash;
@end

@implementation UMDPersonaManifestPersona

- (UMDPersonaManifestPersona)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMDPersonaManifestPersona;
  result = -[UMDPersonaManifestPersona init](&v3, "init");
  if (!result) {
    sub_1000A9C18();
  }
  result->_type = 1000;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (UMDPersonaManifestPersona *)a3;
  if (self == v5)
  {
    unsigned __int8 v13 = 1;
    goto LABEL_107;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UMDPersonaManifestPersona);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    unsigned __int8 v13 = 0;
    goto LABEL_107;
  }

  v7 = v5;
  v8 = v7;
  if (self)
  {
    unsigned int type = self->_type;
    if (v7)
    {
LABEL_5:
      unsigned int v10 = v7->_type;
      goto LABEL_6;
    }
  }

  else
  {
    unsigned int type = 0;
    if (v7) {
      goto LABEL_5;
    }
  }

  unsigned int v10 = 0;
LABEL_6:
  unsigned int v147 = v10;
  unsigned int v148 = type;
  if (type != v10)
  {
    uint64_t v146 = 0LL;
    int v149 = 0;
    uint64_t v145 = 0LL;
    uint64_t v144 = 0LL;
    memset(v134, 0, sizeof(v134));
    uint64_t v143 = 0LL;
    uint64_t v142 = 0LL;
    uint64_t v141 = 0LL;
    int v14 = 0;
    uint64_t v140 = 0LL;
    int v15 = 0;
    uint64_t v139 = 0LL;
    uint64_t v138 = 0LL;
    int v133 = 0;
    uint64_t v137 = 0LL;
    int v16 = 0;
    uint64_t v136 = 0LL;
    int v17 = 0;
    uint64_t v135 = 0LL;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    unsigned __int8 v13 = 0;
    goto LABEL_30;
  }

  if (!self || (v11 = self->_uuid) == 0LL)
  {
    if (!v8 || (v21 = v8->_uuid) == 0LL)
    {
      v127 = 0LL;
      v124 = 0LL;
      uint64_t v146 = 0x100000000LL;
      if (self) {
        goto LABEL_22;
      }
LABEL_112:
      unsigned int kernelID = 0;
      if (v8) {
        goto LABEL_23;
      }
      goto LABEL_113;
    }

    v124 = v21;
    if (self) {
      v12 = self->_uuid;
    }
    else {
      v12 = 0LL;
    }
    v127 = 0LL;
    HIDWORD(v146) = 1;
    goto LABEL_19;
  }

  v127 = v11;
  v12 = self->_uuid;
  HIDWORD(v146) = 0;
  if (v8)
  {
LABEL_19:
    v132 = v12;
    uunsigned int uid = v8->_uuid;
    goto LABEL_20;
  }

  v132 = v12;
  uunsigned int uid = 0LL;
LABEL_20:
  v126 = uuid;
  LODWORD(v146) = 1;
  if (!-[NSUUID isEqual:](v132, "isEqual:"))
  {
LABEL_29:
    int v149 = 0;
    uint64_t v145 = 0LL;
    uint64_t v144 = 0LL;
    memset(v134, 0, sizeof(v134));
    uint64_t v143 = 0LL;
    uint64_t v142 = 0LL;
    uint64_t v141 = 0LL;
    int v14 = 0;
    uint64_t v140 = 0LL;
    int v15 = 0;
    uint64_t v139 = 0LL;
    uint64_t v138 = 0LL;
    int v133 = 0;
    uint64_t v137 = 0LL;
    int v16 = 0;
    uint64_t v136 = 0LL;
    int v17 = 0;
    uint64_t v135 = 0LL;
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    unsigned __int8 v13 = 0;
    goto LABEL_30;
  }

  if (!self) {
    goto LABEL_112;
  }
LABEL_22:
  unsigned int kernelID = self->_kernelID;
  if (v8)
  {
LABEL_23:
    unsigned int v24 = v8->_kernelID;
    goto LABEL_24;
  }

- (unint64_t)hash
{
  if (self)
  {
    uint64_t type = self->_type;
    uunsigned int uid = self->_uuid;
  }

  else
  {
    uint64_t type = 0LL;
    uunsigned int uid = 0LL;
  }

  v42 = uuid;
  v5 = (char *)-[NSUUID hash](v42, "hash") + type;
  if (self)
  {
    v5 += self->_kernelID;
    nickname = self->_nickname;
  }

  else
  {
    nickname = 0LL;
  }

  v41 = nickname;
  v7 = &v5[-[NSString hash](v41, "hash")];
  if (self) {
    bundleIDs = self->_bundleIDs;
  }
  else {
    bundleIDs = 0LL;
  }
  v40 = bundleIDs;
  v9 = (char *)-[NSSet hash](v40, "hash") + (void)v7;
  if (self) {
    observers = self->_observers;
  }
  else {
    observers = 0LL;
  }
  v39 = observers;
  v11 = (char *)-[NSSet hash](v39, "hash") + (void)v9;
  if (self)
  {
    v11 += self->_isDeleting + (unint64_t)self->_isDisabled;
    displayName = self->_displayName;
  }

  else
  {
    displayName = 0LL;
  }

  unsigned __int8 v13 = displayName;
  int v14 = &v11[-[NSString hash](v13, "hash")];
  if (self) {
    createTime = self->_createTime;
  }
  else {
    createTime = 0LL;
  }
  int v16 = createTime;
  int v17 = (char *)-[NSDate hash](v16, "hash") + (void)v14;
  if (self) {
    loginTime = self->_loginTime;
  }
  else {
    loginTime = 0LL;
  }
  int v19 = loginTime;
  int v20 = (char *)-[NSDate hash](v19, "hash") + (void)v17;
  if (self) {
    volumeUUID = self->_volumeUUID;
  }
  else {
    volumeUUID = 0LL;
  }
  v22 = volumeUUID;
  v23 = (char *)-[NSUUID hash](v22, "hash") + (void)v20;
  if (self) {
    homeUUID = self->_homeUUID;
  }
  else {
    homeUUID = 0LL;
  }
  v25 = homeUUID;
  v26 = (char *)-[NSUUID hash](v25, "hash") + (void)v23;
  if (self) {
    homeDir = self->_homeDir;
  }
  else {
    homeDir = 0LL;
  }
  int v28 = homeDir;
  int v29 = (char *)-[NSString hash](v28, "hash") + (void)v26;
  if (self) {
    deviceNode = self->_deviceNode;
  }
  else {
    deviceNode = 0LL;
  }
  int v31 = deviceNode;
  int v32 = (char *)-[NSString hash](v31, "hash") + (void)v29;
  if (self) {
    userUUID = self->_userUUID;
  }
  else {
    userUUID = 0LL;
  }
  v34 = userUUID;
  v35 = (char *)-[NSUUID hash](v34, "hash") + (void)v32;
  if (self)
  {
    v35 += self->_uid + (unint64_t)self->_gid;
    encryptedVolumeKey = self->_encryptedVolumeKey;
  }

  else
  {
    encryptedVolumeKey = 0LL;
  }

  v37 = &v35[(void)-[NSData hash](encryptedVolumeKey, "hash")];

  return (unint64_t)v37;
}

- (void).cxx_destruct
{
}

@end