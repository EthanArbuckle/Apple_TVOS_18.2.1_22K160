@interface UMLUserManifest
+ (id)manifestFromData:(id)a3;
- (NSData)dataValue;
- (NSMutableArray)lruList;
- (NSMutableArray)syncUserList;
- (NSMutableArray)users;
- (NSString)fsVolumeType;
- (UMLUserManifest)init;
- (int)deviceConfig;
- (int)lastBootedUser;
- (int)loginuiCheck;
- (int)maxUsers;
- (int)networkBG;
- (int)userSessionType;
- (int)version;
- (int64_t)apnsIDStart;
- (int64_t)maxUserSize;
- (unint64_t)generation;
- (void)setApnsIDStart:(int64_t)a3;
- (void)setDeviceConfig:(int)a3;
- (void)setFsVolumeType:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setLastBootedUser:(int)a3;
- (void)setLoginuiCheck:(int)a3;
- (void)setLruList:(id)a3;
- (void)setMaxUserSize:(int64_t)a3;
- (void)setMaxUsers:(int)a3;
- (void)setNetworkBG:(int)a3;
- (void)setSyncUserList:(id)a3;
- (void)setUserSessionType:(int)a3;
- (void)setUsers:(id)a3;
- (void)setVersion:(int)a3;
@end

@implementation UMLUserManifest

- (UMLUserManifest)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UMLUserManifest;
  v2 = -[UMLUserManifest init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v2->_networkBG = 0;
    *(_OWORD *)&v2->_deviceConfig = xmmword_188792C80;
    fsVolumeType = v2->_fsVolumeType;
    v2->_apnsIDStart = 1LL;
    v2->_fsVolumeType = (NSString *)@"UserVolumeAPFSNative";
    v2->_maxUserSize = 0LL;

    uint64_t v5 = objc_opt_new();
    users = v3->_users;
    v3->_users = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    syncUserList = v3->_syncUserList;
    v3->_syncUserList = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    lruList = v3->_lruList;
    v3->_lruList = (NSMutableArray *)v9;

    v11 = v3;
  }

  return v3;
}

- (NSData)dataValue
{
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest deviceConfig](self, "deviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"DEVICECONFIG"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest lastBootedUser](self, "lastBootedUser"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:@"BOOTEDUSER"];

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[UMLUserManifest apnsIDStart](self, "apnsIDStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:@"APNSID"];

  -[UMLUserManifest fsVolumeType](self, "fsVolumeType");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:@"MKBUserSessionVolumeFSType"];

  if ((-[UMLUserManifest maxUsers](self, "maxUsers") & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest maxUsers](self, "maxUsers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:@"MAXUSER"];
  }

  if (-[UMLUserManifest maxUserSize](self, "maxUserSize") >= 1)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[UMLUserManifest maxUserSize](self, "maxUserSize"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKeyedSubscript:@"MAXUSERSIZE"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest userSessionType](self, "userSessionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKeyedSubscript:@"USESSTYPE"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest loginuiCheck](self, "loginuiCheck"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v11 forKeyedSubscript:@"LOGINCHECKIN"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest networkBG](self, "networkBG"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKeyedSubscript:@"DEVICENETWORKBG"];

  -[UMLUserManifest syncUserList](self, "syncUserList");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = (void *)MEMORY[0x189607968];
    v16 = -[UMLUserManifest syncUserList](self, "syncUserList");
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v17 forKeyedSubscript:@"SYNCENT"];
    v18 = -[UMLUserManifest syncUserList](self, "syncUserList");
    sub_188784B2C((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v19 forKeyedSubscript:@"SYNCBLOB"];
  }
  v20 = -[UMLUserManifest lruList](self, "lruList");
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = (void *)MEMORY[0x189607968];
    v23 = -[UMLUserManifest lruList](self, "lruList");
    objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v24 forKeyedSubscript:@"LRUENT"];
    v25 = -[UMLUserManifest lruList](self, "lruList");
    sub_188784B2C((uint64_t)v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v26 forKeyedSubscript:@"LRUBLOB"];
  }
  v27 = -[UMLUserManifest users](self, "users");
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = (void *)MEMORY[0x189607968];
    v30 = -[UMLUserManifest users](self, "users");
    objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v31 forKeyedSubscript:@"NUMENT"];
    v32 = -[UMLUserManifest users](self, "users");
    sub_188784B2C((uint64_t)v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v33 forKeyedSubscript:@"BLOB"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[UMLUserManifest version](self, "version"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v34 forKeyedSubscript:@"UserManifestVersion"];

  sub_1887849B0((uint64_t)v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v35;
}

+ (id)manifestFromData:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (qword_18C7258F8 != -1) {
      dispatch_once(&qword_18C7258F8, &unk_18A27E198);
    }
    v10 = (os_log_s *)(id)qword_18C7258F0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_18878BC68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        uint64_t v14 = (void *)v13;
        if (v13) {
          sub_18878BC90(v13);
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      free(v14);
    }

    v4 = 0LL;
    goto LABEL_54;
  }

  v4 = objc_alloc_init(&OBJC_CLASS___UMLUserManifest);
  -[UMLUserManifest setVersion:](v4, "setVersion:", sub_1887843FC(v3, (uint64_t)@"UserManifestVersion", 1LL));
  if (*__error() == 2)
  {
    if (qword_18C7258F8 != -1) {
      dispatch_once(&qword_18C7258F8, &unk_18A27E198);
    }
    uint64_t v5 = (os_log_s *)(id)qword_18C7258F0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = sub_18878BC68();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = v6 & 0xFFFFFFFE;
      }
      if (v7)
      {
        uint64_t v8 = _os_log_send_and_compose_impl();
        uint64_t v9 = (void *)v8;
        if (v8) {
          sub_18878BC90(v8);
        }
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      free(v9);
    }
  }

  -[UMLUserManifest setDeviceConfig:](v4, "setDeviceConfig:", sub_1887843FC(v3, (uint64_t)@"DEVICECONFIG", 0LL));
  if (*__error() == 2)
  {
    if (qword_18C7258F8 != -1) {
      dispatch_once(&qword_18C7258F8, &unk_18A27E198);
    }
    v15 = (os_log_s *)(id)qword_18C7258F0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_18878BC68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18) {
          sub_18878BC90(v18);
        }
      }

      else
      {
        v19 = 0LL;
      }

      free(v19);
    }
  }

  -[UMLUserManifest setLastBootedUser:](v4, "setLastBootedUser:", sub_1887843FC(v3, (uint64_t)@"BOOTEDUSER", 0LL));
  -[UMLUserManifest setApnsIDStart:](v4, "setApnsIDStart:", sub_188784504(v3, (uint64_t)@"APNSID", 1LL));
  sub_18878460C(v3, (uint64_t)@"MKBUserSessionVolumeFSType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UMLUserManifest setFsVolumeType:](v4, "setFsVolumeType:", v20);

  -[UMLUserManifest fsVolumeType](v4, "fsVolumeType");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21) {
    -[UMLUserManifest setFsVolumeType:](v4, "setFsVolumeType:", @"UserVolumeAPFSNative");
  }
  -[UMLUserManifest setMaxUsers:](v4, "setMaxUsers:", sub_1887843FC(v3, (uint64_t)@"MAXUSER", 0xFFFFFFFFLL));
  -[UMLUserManifest setMaxUserSize:](v4, "setMaxUserSize:", sub_188784504(v3, (uint64_t)@"MAXUSERSIZE", 0LL));
  -[UMLUserManifest setUserSessionType:](v4, "setUserSessionType:", sub_1887843FC(v3, (uint64_t)@"USESSTYPE", 0LL));
  -[UMLUserManifest setLoginuiCheck:](v4, "setLoginuiCheck:", sub_1887843FC(v3, (uint64_t)@"LOGINCHECKIN", 0LL));
  -[UMLUserManifest setNetworkBG:](v4, "setNetworkBG:", sub_1887843FC(v3, (uint64_t)@"DEVICENETWORKBG", 0LL));
  if ((int)sub_1887843FC(v3, (uint64_t)@"NUMENT", 0LL) >= 1)
  {
    sub_188784934(v3, (uint64_t)@"BLOB");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188784F24((uint64_t)v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = (void *)[v23 mutableCopy];
      -[UMLUserManifest setUsers:](v4, "setUsers:", v25);
    }
  }

  if ((int)sub_1887843FC(v3, (uint64_t)@"SYNCENT", 0LL) >= 1)
  {
    sub_188784934(v3, (uint64_t)@"SYNCBLOB");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188784F24((uint64_t)v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = v27;
    if (v27)
    {
      v29 = (void *)[v27 mutableCopy];
      -[UMLUserManifest setSyncUserList:](v4, "setSyncUserList:", v29);
    }
  }

  if ((int)sub_1887843FC(v3, (uint64_t)@"LRUENT", 0LL) >= 1)
  {
    sub_188784934(v3, (uint64_t)@"LRUBLOB");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    sub_188784F24((uint64_t)v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = (void *)[v30 mutableCopy];
      -[UMLUserManifest setLruList:](v4, "setLruList:", v32);
    }

LABEL_54:
  }

  return v4;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (int)lastBootedUser
{
  return self->_lastBootedUser;
}

- (void)setLastBootedUser:(int)a3
{
  self->_lastBootedUser = a3;
}

- (int)deviceConfig
{
  return self->_deviceConfig;
}

- (void)setDeviceConfig:(int)a3
{
  self->_deviceConfig = a3;
}

- (int64_t)apnsIDStart
{
  return self->_apnsIDStart;
}

- (void)setApnsIDStart:(int64_t)a3
{
  self->_apnsIDStart = a3;
}

- (NSString)fsVolumeType
{
  return self->_fsVolumeType;
}

- (void)setFsVolumeType:(id)a3
{
}

- (int)maxUsers
{
  return self->_maxUsers;
}

- (void)setMaxUsers:(int)a3
{
  self->_maxUsers = a3;
}

- (int64_t)maxUserSize
{
  return self->_maxUserSize;
}

- (void)setMaxUserSize:(int64_t)a3
{
  self->_maxUserSize = a3;
}

- (int)userSessionType
{
  return self->_userSessionType;
}

- (void)setUserSessionType:(int)a3
{
  self->_userSessionType = a3;
}

- (int)loginuiCheck
{
  return self->_loginuiCheck;
}

- (void)setLoginuiCheck:(int)a3
{
  self->_loginuiCheck = a3;
}

- (int)networkBG
{
  return self->_networkBG;
}

- (void)setNetworkBG:(int)a3
{
  self->_networkBG = a3;
}

- (NSMutableArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSMutableArray)syncUserList
{
  return self->_syncUserList;
}

- (void)setSyncUserList:(id)a3
{
}

- (NSMutableArray)lruList
{
  return self->_lruList;
}

- (void)setLruList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end