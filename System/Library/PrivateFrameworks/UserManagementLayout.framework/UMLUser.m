@interface UMLUser
+ (id)userFromManifestDictionary:(id)a3;
- (BOOL)hasSyncBag;
- (BOOL)isAdminUser;
- (BOOL)isAuditor;
- (BOOL)isDirty;
- (BOOL)isDisabledUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isLoginUser;
- (BOOL)isPrimaryUser;
- (BOOL)isValidClassTypeinDictionary:(id)a3 withKey:(id)a4 withType:(Class)a5;
- (BOOL)needsMount;
- (NSData)dataValue;
- (NSData)keybagOpaqueData;
- (NSData)opaqueData;
- (NSDate)cachedLoginEnd;
- (NSDate)cachedLoginStart;
- (NSDate)creationDate;
- (NSDate)firstLoginEnd;
- (NSDate)firstLoginStart;
- (NSDate)lastLoginEnd;
- (NSDate)lastLoginStart;
- (NSString)alternateDSID;
- (NSString)diskNode;
- (NSString)displayName;
- (NSString)fileInfoPath;
- (NSString)firstName;
- (NSString)homeDirPath;
- (NSString)lastName;
- (NSString)libInfoPath;
- (NSString)userLanguauge;
- (NSString)userType;
- (NSString)userUUID;
- (NSString)username;
- (NSString)volumeUUID;
- (UMLUser)init;
- (id)userManifestDictionary;
- (int)gid;
- (int)gracePeriod;
- (int)uid;
- (int64_t)apnsID;
- (unint64_t)hash;
- (unsigned)version;
- (void)setAlternateDSID:(id)a3;
- (void)setApnsID:(int64_t)a3;
- (void)setCachedLoginEnd:(id)a3;
- (void)setCachedLoginStart:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDiskNode:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFileInfoPath:(id)a3;
- (void)setFirstLoginEnd:(id)a3;
- (void)setFirstLoginStart:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setGid:(int)a3;
- (void)setGracePeriod:(int)a3;
- (void)setHasSyncBag:(BOOL)a3;
- (void)setHomeDirPath:(id)a3;
- (void)setIsAdminUser:(BOOL)a3;
- (void)setIsAuditor:(BOOL)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsDisabledUser:(BOOL)a3;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsLoginUser:(BOOL)a3;
- (void)setIsPrimaryUser:(BOOL)a3;
- (void)setKeybagOpaqueData:(id)a3;
- (void)setLastLoginEnd:(id)a3;
- (void)setLastLoginStart:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLibInfoPath:(id)a3;
- (void)setNeedsMount:(BOOL)a3;
- (void)setOpaqueData:(id)a3;
- (void)setUid:(int)a3;
- (void)setUserLanguauge:(id)a3;
- (void)setUserType:(id)a3;
- (void)setUserUUID:(id)a3;
- (void)setUsername:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVolumeUUID:(id)a3;
@end

@implementation UMLUser

- (UMLUser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UMLUser;
  v2 = -[UMLUser init](&v6, sel_init);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UMLUser *)a3;
  if (self == v4)
  {
    char v10 = 1;
    goto LABEL_104;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_104;
  }

  v5 = v4;
  int64_t v6 = -[UMLUser uid](self, "uid");
  if ((_DWORD)v6 != -[UMLUser uid](v5, "uid")
    || (int64_t v6 = -[UMLUser gid](self, "gid"), (_DWORD)v6 != -[UMLUser gid](v5, "gid"))
    || (int64_t v6 = -[UMLUser apnsID](self, "apnsID"), v6 != -[UMLUser apnsID](v5, "apnsID")))
  {
    uint64_t v133 = 0LL;
    uint64_t v134 = 0LL;
    int v120 = 0;
    uint64_t v131 = 0LL;
    uint64_t v132 = 0LL;
    memset(v119, 0, sizeof(v119));
    uint64_t v129 = 0LL;
    uint64_t v130 = 0LL;
    uint64_t v127 = 0LL;
    uint64_t v128 = 0LL;
    uint64_t v125 = 0LL;
    uint64_t v126 = 0LL;
    uint64_t v123 = 0LL;
    uint64_t v124 = 0LL;
    int v11 = 0;
    uint64_t v122 = 0LL;
    int v12 = 0;
    int v13 = 0;
    BOOL v121 = 0;
    memset(v118, 0, sizeof(v118));
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    goto LABEL_13;
  }

  uint64_t v7 = -[UMLUser userUUID](self, "userUUID");
  int64_t v6 = v7 == 0;
  v117 = (void *)v7;
  LODWORD(v134) = v7 == 0;
  if (v7 || (-[UMLUser userUUID](v5, "userUUID"), (v113 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v8 = -[UMLUser userUUID](self, "userUUID");
    v115 = -[UMLUser userUUID](v5, "userUUID");
    v116 = v8;
    if (!objc_msgSend(v8, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      int v120 = 0;
      uint64_t v131 = 0LL;
      uint64_t v132 = 0LL;
      memset(v119, 0, sizeof(v119));
      uint64_t v129 = 0LL;
      uint64_t v130 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v128 = 0LL;
      uint64_t v125 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      int v13 = 0;
      BOOL v121 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      uint64_t v133 = 1LL;
      goto LABEL_13;
    }

    int v9 = 1;
  }

  else
  {
    v113 = 0LL;
    int v9 = 0;
  }
  v114 = -[UMLUser alternateDSID](self, "alternateDSID");
  LODWORD(v133) = v9;
  HIDWORD(v133) = v114 == 0LL;
  if (v114
    || (-[UMLUser alternateDSID](v5, "alternateDSID"), (v109 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v26 = -[UMLUser alternateDSID](self, "alternateDSID");
    v111 = -[UMLUser alternateDSID](v5, "alternateDSID");
    v112 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      memset(v119, 0, sizeof(v119));
      uint64_t v130 = 0LL;
      uint64_t v131 = 0LL;
      uint64_t v128 = 0LL;
      uint64_t v129 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v124 = 0LL;
      uint64_t v125 = 0LL;
      uint64_t v122 = 0LL;
      uint64_t v123 = 0LL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      uint64_t v132 = 1LL;
      goto LABEL_13;
    }

    int v27 = 1;
  }

  else
  {
    v109 = 0LL;
    int v27 = 0;
  }
  v110 = -[UMLUser userType](self, "userType");
  LODWORD(v132) = v27;
  HIDWORD(v132) = v110 == 0LL;
  if (v110 || (-[UMLUser userType](v5, "userType"), (v105 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v28 = -[UMLUser userType](self, "userType");
    v107 = -[UMLUser userType](v5, "userType");
    v108 = v28;
    if (!objc_msgSend(v28, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v129 = 0LL;
      uint64_t v130 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v128 = 0LL;
      uint64_t v125 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      memset(v118, 0, sizeof(v118));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      *(_DWORD *)v119 = 1;
      uint64_t v131 = 1LL;
      goto LABEL_13;
    }

    int v29 = 1;
  }

  else
  {
    v105 = 0LL;
    int v29 = 0;
  }

  uint64_t v30 = -[UMLUser username](self, "username");
  HIDWORD(v131) = v30 == 0;
  v106 = (void *)v30;
  LODWORD(v131) = v29;
  if (v30 || (-[UMLUser username](v5, "username"), (v101 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v31 = -[UMLUser username](self, "username");
    v103 = -[UMLUser username](v5, "username");
    v104 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v128 = 0LL;
      uint64_t v129 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v124 = 0LL;
      uint64_t v125 = 0LL;
      memset(v118, 0, 32);
      uint64_t v122 = 0LL;
      uint64_t v123 = 0LL;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      *(_DWORD *)v119 = 1;
      v118[4] = 1LL;
      uint64_t v130 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v130) = 1;
  }

  else
  {
    v101 = 0LL;
    LODWORD(v130) = 0;
  }

  uint64_t v32 = -[UMLUser firstName](self, "firstName");
  HIDWORD(v130) = v32 == 0;
  v102 = (void *)v32;
  if (v32 || (-[UMLUser firstName](v5, "firstName"), (v97 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v33 = -[UMLUser firstName](self, "firstName");
    v99 = -[UMLUser firstName](v5, "firstName");
    v100 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v127 = 0LL;
      uint64_t v128 = 0LL;
      uint64_t v125 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      memset(v118, 0, 28);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      uint64_t v129 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v129) = 1;
  }

  else
  {
    v97 = 0LL;
    LODWORD(v129) = 0;
  }
  v98 = -[UMLUser lastName](self, "lastName");
  HIDWORD(v129) = v98 == 0LL;
  if (v98 || (-[UMLUser lastName](v5, "lastName"), (v93 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v34 = -[UMLUser lastName](self, "lastName");
    v95 = -[UMLUser lastName](v5, "lastName");
    v96 = v34;
    if (!objc_msgSend(v34, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v126 = 0LL;
      uint64_t v127 = 0LL;
      uint64_t v124 = 0LL;
      uint64_t v125 = 0LL;
      memset(v118, 0, 24);
      uint64_t v122 = 0LL;
      uint64_t v123 = 0LL;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      LODWORD(v118[3]) = 1;
      uint64_t v128 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v128) = 1;
  }

  else
  {
    v93 = 0LL;
    LODWORD(v128) = 0;
  }

  uint64_t v35 = -[UMLUser displayName](self, "displayName");
  HIDWORD(v128) = v35 == 0;
  v94 = (void *)v35;
  if (v35 || (-[UMLUser displayName](v5, "displayName"), (v89 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v36 = -[UMLUser displayName](self, "displayName");
    v91 = -[UMLUser displayName](v5, "displayName");
    v92 = v36;
    if (!objc_msgSend(v36, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      uint64_t v125 = 0LL;
      uint64_t v126 = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      memset(v118, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      uint64_t v127 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v127) = 1;
  }

  else
  {
    v89 = 0LL;
    LODWORD(v127) = 0;
  }

  uint64_t v37 = -[UMLUser userLanguauge](self, "userLanguauge");
  HIDWORD(v127) = v37 == 0;
  v90 = (void *)v37;
  if (v37
    || (-[UMLUser userLanguauge](v5, "userLanguauge"), (v85 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v38 = -[UMLUser userLanguauge](self, "userLanguauge");
    v87 = -[UMLUser userLanguauge](v5, "userLanguauge");
    v88 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      v118[1] = 0LL;
      uint64_t v124 = 0LL;
      uint64_t v125 = 0LL;
      v118[0] = 0LL;
      uint64_t v122 = 0LL;
      uint64_t v123 = 0LL;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      LODWORD(v118[2]) = 1;
      uint64_t v126 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v126) = 1;
  }

  else
  {
    v85 = 0LL;
    LODWORD(v126) = 0;
  }

  uint64_t v39 = -[UMLUser fileInfoPath](self, "fileInfoPath");
  HIDWORD(v126) = v39 == 0;
  v86 = (void *)v39;
  if (v39 || (-[UMLUser fileInfoPath](v5, "fileInfoPath"), (v81 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v40 = -[UMLUser fileInfoPath](self, "fileInfoPath");
    v83 = -[UMLUser fileInfoPath](v5, "fileInfoPath");
    v84 = v40;
    if (!objc_msgSend(v40, "isEqual:"))
    {
      HIDWORD(v134) = 1;
      *(void *)((char *)v118 + 4) = 0LL;
      uint64_t v123 = 0LL;
      uint64_t v124 = 0LL;
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      LODWORD(v118[0]) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      HIDWORD(v118[1]) = 1;
      LODWORD(v118[2]) = 1;
      uint64_t v125 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v125) = 1;
  }

  else
  {
    v81 = 0LL;
    LODWORD(v125) = 0;
  }

  uint64_t v41 = -[UMLUser libInfoPath](self, "libInfoPath");
  HIDWORD(v125) = v41 == 0;
  v82 = (void *)v41;
  if (v41 || (-[UMLUser libInfoPath](v5, "libInfoPath"), (v77 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    v42 = -[UMLUser libInfoPath](self, "libInfoPath");
    v79 = -[UMLUser libInfoPath](v5, "libInfoPath");
    v80 = v42;
    HIDWORD(v134) = 1;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      v118[0] = 0LL;
      uint64_t v122 = 0LL;
      uint64_t v123 = 0LL;
      int v11 = 0;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001LL;
      uint64_t v124 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v124) = 1;
  }

  else
  {
    v77 = 0LL;
    LODWORD(v124) = 0;
  }

  uint64_t v43 = -[UMLUser diskNode](self, "diskNode");
  HIDWORD(v124) = v43 == 0;
  v78 = (void *)v43;
  if (v43 || (-[UMLUser diskNode](v5, "diskNode"), (v73 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    int64_t v6 = -[UMLUser diskNode](self, "diskNode");
    v75 = -[UMLUser diskNode](v5, "diskNode");
    v76 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      int v11 = 0;
      uint64_t v122 = 0LL;
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001LL;
      v118[0] = 0x100000000LL;
      uint64_t v123 = 1LL;
      goto LABEL_13;
    }

    LODWORD(v123) = 1;
  }

  else
  {
    v73 = 0LL;
    LODWORD(v123) = 0;
  }

  uint64_t v44 = -[UMLUser volumeUUID](self, "volumeUUID");
  HIDWORD(v123) = v44 == 0;
  v74 = (void *)v44;
  v54 = v5;
  if (v44 || (-[UMLUser volumeUUID](v5, "volumeUUID"), (v69 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    int64_t v6 = -[UMLUser volumeUUID](self, "volumeUUID");
    v71 = -[UMLUser volumeUUID](v5, "volumeUUID");
    v72 = (void *)v6;
    HIDWORD(v134) = 1;
    if (!objc_msgSend((id)v6, "isEqual:"))
    {
      int v12 = 0;
      *(void *)&v119[4] = 0LL;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v10 = 0;
      int v120 = 1;
      BOOL v121 = 0;
      HIDWORD(v118[4]) = 0;
      *(_DWORD *)v119 = 1;
      *(void *)((char *)&v118[3] + 4) = 0x100000001LL;
      *(void *)((char *)&v118[2] + 4) = 0x100000001LL;
      LODWORD(v118[2]) = 1;
      v118[1] = 0x100000001LL;
      v118[0] = 0x100000000LL;
      int v11 = 1;
      uint64_t v122 = 1LL;
LABEL_206:
      v5 = v54;
      goto LABEL_13;
    }

    LODWORD(v122) = 1;
  }

  else
  {
    v69 = 0LL;
    LODWORD(v122) = 0;
  }

  uint64_t v45 = -[UMLUser homeDirPath](self, "homeDirPath");
  HIDWORD(v122) = v45 == 0;
  v70 = (void *)v45;
  if (!v45)
  {
    v65 = -[UMLUser homeDirPath](v5, "homeDirPath");
    if (!v65)
    {
      v65 = 0LL;
      *(_DWORD *)&v119[8] = 0;
      goto LABEL_188;
    }
  }
  v46 = -[UMLUser homeDirPath](self, "homeDirPath");
  v67 = -[UMLUser homeDirPath](v54, "homeDirPath");
  v68 = v46;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v46, "isEqual:"))
  {
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    BOOL v121 = 0;
    *(_DWORD *)v119 = 1;
    *(void *)&v119[4] = 0x100000000LL;
    v118[4] = 1LL;
    v118[3] = 0x100000001LL;
    v118[2] = 0x100000001LL;
    v118[1] = 0x100000001LL;
    v118[0] = 0x100000000LL;
    int v11 = 1;
    int v12 = 1;
    goto LABEL_206;
  }

  *(_DWORD *)&v119[8] = 1;
LABEL_188:
  uint64_t v47 = -[UMLUser opaqueData](self, "opaqueData");
  BOOL v121 = v47 == 0;
  v66 = (void *)v47;
  if (!v47)
  {
    v61 = -[UMLUser opaqueData](v54, "opaqueData");
    if (!v61)
    {
      v61 = 0LL;
      LODWORD(v118[0]) = 0;
      goto LABEL_194;
    }
  }
  v48 = -[UMLUser opaqueData](self, "opaqueData");
  v63 = -[UMLUser opaqueData](v54, "opaqueData");
  v64 = v48;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v48, "isEqual:"))
  {
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    *(void *)v119 = 1LL;
    v118[4] = 1LL;
    v118[3] = 0x100000001LL;
    v118[2] = 0x100000001LL;
    v118[1] = 0x100000001LL;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    v118[0] = 0x100000001LL;
    goto LABEL_206;
  }

  LODWORD(v118[0]) = 1;
LABEL_194:
  uint64_t v49 = -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  *(_DWORD *)&v119[4] = v49 == 0;
  v62 = (void *)v49;
  if (!v49)
  {
    v58 = -[UMLUser keybagOpaqueData](v54, "keybagOpaqueData");
    if (!v58)
    {
      v58 = 0LL;
      HIDWORD(v118[4]) = 0;
      goto LABEL_200;
    }
  }
  v50 = -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  v59 = -[UMLUser keybagOpaqueData](v54, "keybagOpaqueData");
  v60 = v50;
  HIDWORD(v134) = 1;
  if (!objc_msgSend(v50, "isEqual:"))
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    int v120 = 1;
    *(_DWORD *)v119 = 1;
    v118[4] = 0x100000001LL;
    v118[3] = 0x100000001LL;
    v118[2] = 0x100000001LL;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001LL;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    goto LABEL_206;
  }

  HIDWORD(v118[4]) = 1;
LABEL_200:
  int64_t v6 = -[UMLUser needsMount](self, "needsMount");
  if ((_DWORD)v6 != -[UMLUser needsMount](v54, "needsMount")
    || (int64_t v6 = -[UMLUser isForeground](self, "isForeground"), (_DWORD)v6 != -[UMLUser isForeground](v54, "isForeground"))
    || (int64_t v6 = -[UMLUser isDirty](self, "isDirty"), (_DWORD)v6 != -[UMLUser isDirty](v54, "isDirty"))
    || (int64_t v6 = -[UMLUser isPrimaryUser](self, "isPrimaryUser"),
        (_DWORD)v6 != -[UMLUser isPrimaryUser](v54, "isPrimaryUser"))
    || (int64_t v6 = -[UMLUser isAdminUser](self, "isAdminUser"), (_DWORD)v6 != -[UMLUser isAdminUser](v54, "isAdminUser")))
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v10 = 0;
    HIDWORD(v134) = 1;
    int v120 = 1;
    *(_DWORD *)v119 = 1;
    LODWORD(v118[4]) = 1;
    v118[3] = 0x100000001LL;
    v118[2] = 0x100000001LL;
    HIDWORD(v118[0]) = 1;
    v118[1] = 0x100000001LL;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    goto LABEL_206;
  }

  uint64_t v51 = -[UMLUser creationDate](self, "creationDate");
  BOOL v53 = v51 == 0;
  v57 = (void *)v51;
  if (!v51)
  {
    v55 = -[UMLUser creationDate](v54, "creationDate");
    if (!v55)
    {
      v57 = 0LL;
      v55 = 0LL;
      int v17 = 0;
      HIDWORD(v134) = 1;
      int v120 = 1;
      *(_DWORD *)v119 = 1;
      LODWORD(v118[4]) = 1;
      v118[3] = 0x100000001LL;
      v118[2] = 0x100000001LL;
      HIDWORD(v118[0]) = 1;
      v118[1] = 0x100000001LL;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      char v10 = 1;
      goto LABEL_206;
    }
  }
  v52 = -[UMLUser creationDate](self, "creationDate");
  v5 = v54;
  int64_t v6 = -[UMLUser creationDate](v54, "creationDate");
  v56 = v52;
  char v10 = [v52 isEqual:v6];
  int v17 = 1;
  HIDWORD(v134) = 1;
  int v120 = 1;
  *(_DWORD *)v119 = 1;
  LODWORD(v118[4]) = 1;
  v118[3] = 0x100000001LL;
  v118[2] = 0x100000001LL;
  HIDWORD(v118[0]) = 1;
  v118[1] = 0x100000001LL;
  int v11 = 1;
  int v12 = 1;
  int v13 = 1;
  int v14 = 1;
  int v15 = 1;
  int v16 = v53;
LABEL_13:
  if (v17)
  {
    int v18 = v14;
    int v19 = v13;
    int v20 = v12;
    int v21 = v11;
    v22 = v5;
    int v23 = v15;
    int v24 = v16;

    int v16 = v24;
    int v15 = v23;
    v5 = v22;
    int v11 = v21;
    int v12 = v20;
    int v13 = v19;
    int v14 = v18;
  }

  if (v16) {

  }
  if (v15) {
  if (HIDWORD(v118[4]))
  }
  {
  }

  if (*(_DWORD *)&v119[4]) {

  }
  if (v14) {
  if (LODWORD(v118[0]))
  }
  {
  }

  if (v121) {

  }
  if (v13) {
  if (*(_DWORD *)&v119[8])
  }
  {
  }

  if (HIDWORD(v122)) {

  }
  if (v12) {
  if ((_DWORD)v122)
  }
  {
  }

  if (HIDWORD(v123)) {

  }
  if (v11) {
  if ((_DWORD)v123)
  }
  {
  }

  if (HIDWORD(v124)) {

  }
  if (HIDWORD(v118[0])) {
  if ((_DWORD)v124)
  }
  {
  }

  if (HIDWORD(v125)) {

  }
  if (LODWORD(v118[1])) {
  if ((_DWORD)v125)
  }
  {
  }

  if (HIDWORD(v126)) {

  }
  if (HIDWORD(v118[1])) {
  if ((_DWORD)v126)
  }
  {
  }

  if (HIDWORD(v127)) {

  }
  if (LODWORD(v118[2])) {
  if ((_DWORD)v127)
  }
  {
  }

  if (HIDWORD(v128)) {

  }
  if (HIDWORD(v118[2])) {
  if ((_DWORD)v128)
  }
  {
  }

  if (HIDWORD(v129)) {

  }
  if (LODWORD(v118[3])) {
  if ((_DWORD)v129)
  }
  {
  }

  if (HIDWORD(v130)) {

  }
  if (HIDWORD(v118[3])) {
  if ((_DWORD)v130)
  }
  {
  }

  if (HIDWORD(v131)) {

  }
  if (LODWORD(v118[4]))
  {

    if (!(_DWORD)v131) {
      goto LABEL_91;
    }
  }

  else if (!(_DWORD)v131)
  {
LABEL_91:
    if (!HIDWORD(v132)) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }

  if (HIDWORD(v132)) {
LABEL_92:
  }

LABEL_93:
  if (*(_DWORD *)v119)
  {

    if (!(_DWORD)v132) {
      goto LABEL_95;
    }
  }

  else if (!(_DWORD)v132)
  {
LABEL_95:
    if (!HIDWORD(v133)) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }

  if (HIDWORD(v133)) {
LABEL_96:
  }

LABEL_97:
  if (v120)
  {

    if (!(_DWORD)v133) {
      goto LABEL_99;
    }
LABEL_112:

    if (!(_DWORD)v134) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }

  if ((_DWORD)v133) {
    goto LABEL_112;
  }
LABEL_99:
  if ((_DWORD)v134) {
LABEL_100:
  }

LABEL_101:
  if (HIDWORD(v134)) {

  }
LABEL_104:
  return v10;
}

- (unint64_t)hash
{
  int v3 = -[UMLUser uid](self, "uid");
  int v4 = -[UMLUser gid](self, "gid") + v3;
  int64_t v5 = -[UMLUser apnsID](self, "apnsID") + v4;
  -[UMLUser userUUID](self, "userUUID");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v43 hash];
  v42 = -[UMLUser alternateDSID](self, "alternateDSID");
  uint64_t v7 = v6 + [v42 hash];
  -[UMLUser userType](self, "userType");
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = v5 + v7 + [v41 hash];
  v40 = -[UMLUser username](self, "username");
  uint64_t v9 = [v40 hash];
  -[UMLUser firstName](self, "firstName");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9 + [v39 hash];
  v38 = -[UMLUser lastName](self, "lastName");
  uint64_t v11 = v10 + [v38 hash];
  -[UMLUser displayName](self, "displayName");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v12 = v8 + v11 + [v37 hash];
  v36 = -[UMLUser userLanguauge](self, "userLanguauge");
  uint64_t v13 = [v36 hash];
  -[UMLUser fileInfoPath](self, "fileInfoPath");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v13 + [v14 hash];
  -[UMLUser libInfoPath](self, "libInfoPath");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v15 + [v16 hash];
  -[UMLUser diskNode](self, "diskNode");
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v17 + [v18 hash];
  -[UMLUser volumeUUID](self, "volumeUUID");
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v21 = v12 + v19 + [v20 hash];
  v22 = -[UMLUser homeDirPath](self, "homeDirPath");
  uint64_t v23 = [v22 hash];
  -[UMLUser opaqueData](self, "opaqueData");
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = v23 + [v24 hash];
  v26 = -[UMLUser keybagOpaqueData](self, "keybagOpaqueData");
  uint64_t v27 = v21 + v25 + [v26 hash];
  uint64_t v28 = v27 + -[UMLUser needsMount](self, "needsMount");
  uint64_t v29 = v28 + -[UMLUser isForeground](self, "isForeground");
  uint64_t v30 = v29 + -[UMLUser isDirty](self, "isDirty");
  uint64_t v31 = v30 + -[UMLUser isPrimaryUser](self, "isPrimaryUser");
  uint64_t v32 = v31 + -[UMLUser isAdminUser](self, "isAdminUser");
  v33 = -[UMLUser creationDate](self, "creationDate");
  unint64_t v34 = v32 + [v33 hash];

  return v34;
}

- (int)uid
{
  return self->_uid;
}

- (void)setUid:(int)a3
{
  self->_uid = a3;
}

- (int)gid
{
  return self->_gid;
}

- (void)setGid:(int)a3
{
  self->_gid = a3;
}

- (int64_t)apnsID
{
  return self->_apnsID;
}

- (void)setApnsID:(int64_t)a3
{
  self->_apnsID = a3;
}

- (NSString)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
}

- (NSString)userType
{
  return self->_userType;
}

- (void)setUserType:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)userLanguauge
{
  return self->_userLanguauge;
}

- (void)setUserLanguauge:(id)a3
{
}

- (NSString)fileInfoPath
{
  return self->_fileInfoPath;
}

- (void)setFileInfoPath:(id)a3
{
}

- (NSString)libInfoPath
{
  return self->_libInfoPath;
}

- (void)setLibInfoPath:(id)a3
{
}

- (NSString)diskNode
{
  return self->_diskNode;
}

- (void)setDiskNode:(id)a3
{
}

- (NSString)volumeUUID
{
  return self->_volumeUUID;
}

- (void)setVolumeUUID:(id)a3
{
}

- (NSString)homeDirPath
{
  return self->_homeDirPath;
}

- (void)setHomeDirPath:(id)a3
{
}

- (NSData)opaqueData
{
  return self->_opaqueData;
}

- (void)setOpaqueData:(id)a3
{
}

- (NSData)keybagOpaqueData
{
  return self->_keybagOpaqueData;
}

- (void)setKeybagOpaqueData:(id)a3
{
}

- (BOOL)needsMount
{
  return self->_needsMount;
}

- (void)setNeedsMount:(BOOL)a3
{
  self->_needsMount = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (BOOL)isAdminUser
{
  return self->_isAdminUser;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (NSDate)lastLoginStart
{
  return self->_lastLoginStart;
}

- (void)setLastLoginStart:(id)a3
{
}

- (NSDate)lastLoginEnd
{
  return self->_lastLoginEnd;
}

- (void)setLastLoginEnd:(id)a3
{
}

- (BOOL)isDisabledUser
{
  return self->_isDisabledUser;
}

- (void)setIsDisabledUser:(BOOL)a3
{
  self->_isDisabledUser = a3;
}

- (BOOL)isLoginUser
{
  return self->_isLoginUser;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (BOOL)isAuditor
{
  return self->_isAuditor;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (BOOL)hasSyncBag
{
  return self->_hasSyncBag;
}

- (void)setHasSyncBag:(BOOL)a3
{
  self->_hasSyncBag = a3;
}

- (int)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(int)a3
{
  self->_gracePeriod = a3;
}

- (NSDate)firstLoginStart
{
  return self->_firstLoginStart;
}

- (void)setFirstLoginStart:(id)a3
{
}

- (NSDate)firstLoginEnd
{
  return self->_firstLoginEnd;
}

- (void)setFirstLoginEnd:(id)a3
{
}

- (NSDate)cachedLoginStart
{
  return self->_cachedLoginStart;
}

- (void)setCachedLoginStart:(id)a3
{
}

- (NSDate)cachedLoginEnd
{
  return self->_cachedLoginEnd;
}

- (void)setCachedLoginEnd:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isValidClassTypeinDictionary:(id)a3 withKey:(id)a4 withType:(Class)a5
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v6 = 1;
  }

  else
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    uint64_t v7 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_18878BC68();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        uint64_t v10 = _os_log_send_and_compose_impl();
        uint64_t v11 = (void *)v10;
        if (v10) {
          sub_18878BC90(v10);
        }
      }

      else
      {
        uint64_t v11 = 0LL;
      }

      free(v11);
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (id)userFromManifestDictionary:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(&OBJC_CLASS___UMLUser);
  -[UMLUser setUid:](v4, "setUid:", sub_1887843FC(v3, (uint64_t)@"MKBUserSessionID", 0LL));
  if (*__error() == 2)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int64_t v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v6 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7) {
      goto LABEL_171;
    }
LABEL_173:
    v76 = 0LL;
LABEL_174:
    free(v76);
LABEL_175:

    v77 = 0LL;
    goto LABEL_176;
  }

  if (qword_18C725930 != -1) {
    dispatch_once(&qword_18C725930, &unk_18A27E220);
  }
  unsigned int v8 = (os_log_s *)(id)qword_18C725928;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = sub_18878BC68();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v9 &= ~1u;
    }
    if (v9)
    {
      uint64_t v10 = v8;
      -[UMLUser uid](v4, "uid");
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (v11) {
        sub_18878BC90((uint64_t)v11);
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    free(v11);
  }

  -[UMLUser setGid:](v4, "setGid:", sub_1887843FC(v3, (uint64_t)@"MKBUserSessionGroupID", 0LL));
  if (*__error() == 2)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int64_t v5 = (os_log_s *)(id)qword_18C725928;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_175;
    }
    unsigned int v12 = sub_18878BC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v12 & 0xFFFFFFFE;
    }
    if (!v13) {
      goto LABEL_173;
    }
    goto LABEL_171;
  }

  if (qword_18C725930 != -1) {
    dispatch_once(&qword_18C725930, &unk_18A27E220);
  }
  int v14 = (os_log_s *)(id)qword_18C725928;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = sub_18878BC68();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      v15 &= ~1u;
    }
    if (v15)
    {
      int v16 = v14;
      -[UMLUser gid](v4, "gid");
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (v17) {
        sub_18878BC90((uint64_t)v17);
      }
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    free(v17);
  }

  -[UMLUser setApnsID:](v4, "setApnsID:", sub_188784504(v3, (uint64_t)@"MKBUserSessionAPNSID", 0LL));
  if (*__error() == 2)
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v18 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v19 = sub_18878BC68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        int64_t v21 = (void *)_os_log_send_and_compose_impl();
        if (!v21) {
          goto LABEL_58;
        }
        goto LABEL_56;
      }

      goto LABEL_57;
    }
  }

  else
  {
    if (qword_18C725930 != -1) {
      dispatch_once(&qword_18C725930, &unk_18A27E220);
    }
    int v18 = (os_log_s *)(id)qword_18C725928;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v22 = sub_18878BC68();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        v22 &= ~1u;
      }
      if (v22)
      {
        uint64_t v23 = v18;
        -[UMLUser apnsID](v4, "apnsID");
        int64_t v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_58:
          free(v21);
          goto LABEL_59;
        }

- (id)userManifestDictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUser uid](self, "uid"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"MKBUserSessionID"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUser gid](self, "gid"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:@"MKBUserSessionGroupID"];

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:@"MKBUserSessionAPNSID"];

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[UMLUser apnsID](self, "apnsID"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:@"MKBUserSessionAPNSID"];

  -[UMLUser userUUID](self, "userUUID");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:@"MKBUserSessionUUID"];

  -[UMLUser alternateDSID](self, "alternateDSID");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UMLUser alternateDSID](self, "alternateDSID");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v10 forKeyedSubscript:@"MKBUserSessionAlternateUUID"];
  }

  -[UMLUser userType](self, "userType");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v11 forKeyedSubscript:@"MKBUserTypeKey"];

  -[UMLUser username](self, "username");
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKeyedSubscript:@"MKBUserSessionShortName"];

  -[UMLUser firstName](self, "firstName");
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKeyedSubscript:@"MKBUserSessionFirstName"];

  -[UMLUser lastName](self, "lastName");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKeyedSubscript:@"MKBUserSessionLastName"];

  -[UMLUser displayName](self, "displayName");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v15 forKeyedSubscript:@"MKBUserSessionDisplayName"];

  -[UMLUser libInfoPath](self, "libInfoPath");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKeyedSubscript:@"MKBUserSessionLibinfoHomeDir"];

  -[UMLUser homeDirPath](self, "homeDirPath");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v17 forKeyedSubscript:@"MKBUserSessionHomeDir"];

  if (-[UMLUser needsMount](self, "needsMount"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser needsMount](self, "needsMount"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKeyedSubscript:@"MKBUserSessionNeedsMount"];
  }

  if (-[UMLUser isForeground](self, "isForeground"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isForeground](self, "isForeground"));
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v19 forKeyedSubscript:@"MKBUserSessionForeground"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v20 forKeyedSubscript:@"MKBUserSessionDirty"];

  -[UMLUser creationDate](self, "creationDate");
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v21 forKeyedSubscript:@"MKBUserSessionCreateTimeStamp"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isPrimaryUser](self, "isPrimaryUser"));
  int v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v22 forKeyedSubscript:@"MKBUserSessionisPrimary"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isAdminUser](self, "isAdminUser"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v23 forKeyedSubscript:@"MKBUserSessionisAdminKey"];

  -[UMLUser lastLoginStart](self, "lastLoginStart");
  int v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[UMLUser lastLoginStart](self, "lastLoginStart");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v25 forKeyedSubscript:@"MKBUserSessionCachedLoginStartTime"];
  }
  v26 = -[UMLUser lastLoginEnd](self, "lastLoginEnd");
  if (v26)
  {
    -[UMLUser lastLoginEnd](self, "lastLoginEnd");
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v27 forKeyedSubscript:@"MKBUserSessionCachedLoginEndTime"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isDirty](self, "isDirty"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v28 forKeyedSubscript:@"MKBUserSessionDirty"];

  if (-[UMLUser isDisabledUser](self, "isDisabledUser"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isDisabledUser](self, "isDisabledUser"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v29 forKeyedSubscript:@"MKBUserSessionDisabled"];
  }

  if (-[UMLUser isLoginUser](self, "isLoginUser"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isLoginUser](self, "isLoginUser"));
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v30 forKeyedSubscript:@"MKBUserSessionLoginUser"];
  }

  if (-[UMLUser isAuditor](self, "isAuditor"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser isAuditor](self, "isAuditor"));
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v31 forKeyedSubscript:@"MKBUserSessionAuditor"];
  }

  if (-[UMLUser hasSyncBag](self, "hasSyncBag"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[UMLUser hasSyncBag](self, "hasSyncBag"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v32 forKeyedSubscript:@"MKBUserSessionHasSyncBag"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUser gracePeriod](self, "gracePeriod"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v33 forKeyedSubscript:@"MKBUserSessionRequiresPasscode"];

  -[UMLUser firstLoginStart](self, "firstLoginStart");
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[UMLUser firstLoginStart](self, "firstLoginStart");
    int v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v35 forKeyedSubscript:@"MKBUserSessionFirstLoginStartTime"];
  }
  v36 = -[UMLUser firstLoginEnd](self, "firstLoginEnd");
  if (v36)
  {
    -[UMLUser firstLoginEnd](self, "firstLoginEnd");
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v37 forKeyedSubscript:@"MKBUserSessionFirstLoginEndTime"];
  }

  -[UMLUser cachedLoginStart](self, "cachedLoginStart");
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[UMLUser cachedLoginStart](self, "cachedLoginStart");
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v39 forKeyedSubscript:@"MKBUserSessionCachedLoginStartTime"];
  }
  v40 = -[UMLUser cachedLoginEnd](self, "cachedLoginEnd");
  if (v40)
  {
    -[UMLUser cachedLoginEnd](self, "cachedLoginEnd");
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v41 forKeyedSubscript:@"MKBUserSessionCachedLoginEndTime"];
  }

  return v3;
}

@end