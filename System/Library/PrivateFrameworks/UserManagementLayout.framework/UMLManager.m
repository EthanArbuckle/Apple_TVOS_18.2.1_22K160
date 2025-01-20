@interface UMLManager
+ (id)sharedManager;
- (BOOL)addNewUser:(id)a3 toUserManifest:(id)a4 saveToPath:(id)a5;
- (BOOL)createPrimaryUserLayoutWithOnUserVolumePath:(id)a3 fromSystemVolumePath:(id)a4 withError:(id *)a5;
- (BOOL)createUserLayoutForUserwithUserID:(int)a3 withAKSSetup:(BOOL)a4 onUserVolumePath:(id)a5 fromSystemVolumePath:(id)a6 withError:(id *)a7;
- (BOOL)removeAnUser:(id)a3 fromUserManifest:(id)a4 saveToPath:(id)a5;
- (BOOL)saveManifest:(id)a3 toPath:(id)a4;
- (BOOL)updatePrimaryUser:(id)a3 onSharedDataVolumePath:(id)a4 withDiskNode:(id)a5 withVolumeuuid:(id)a6 withVolumeName:(id)a7 withError:(id *)a8;
- (BOOL)updateUser:(id)a3 inManifest:(id)a4 withDiskNode:(id)a5 volumeUUID:(id)a6 volumeName:(id)a7 withSharedDataVolumePath:(id)a8 withError:(id *)a9;
- (id)createPrimaryUserOnSharedDataVolumePath:(id)a3 withError:(id *)a4;
- (id)loadManifestFromSharedDataVolumePath:(id)a3;
- (id)readUserManifestOnSharedDataVolumePath:(id)a3 withError:(id *)a4;
@end

@implementation UMLManager

+ (id)sharedManager
{
  if (qword_18C725910 != -1) {
    dispatch_once(&qword_18C725910, &unk_18A27E1B8);
  }
  return (id)qword_18C725908;
}

- (id)createPrimaryUserOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithInt:501];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v7 forKey:@"MKBUserSessionID"];

  [MEMORY[0x189607968] numberWithInt:501];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v8 forKey:@"MKBUserSessionGroupID"];

  [v6 setValue:@"UserSessionOther" forKey:@"MKBUserTypeKey"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionShortName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionFirstName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionLastName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionName"];
  [v6 setValue:@"mobile" forKey:@"MKBUserSessionDisplayName"];
  [v6 setValue:@"en_US" forKey:@"MKBUserSessionLanguage"];
  [MEMORY[0x189607AB8] UUID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 UUIDString];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v10 forKey:@"MKBUserSessionUUID"];

  [MEMORY[0x189607AB8] UUID];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v12 forKey:@"MKBUserSessionAlternateUUID"];

  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:1.0];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 description];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v14 forKey:@"MKBUserSessionCreateTimeStamp"];

  [v13 description];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v15 forKey:@"MKBUserSessionLoginTimeStamp"];

  [MEMORY[0x189607968] numberWithBool:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v16 forKey:@"MKBUserSessionLoginUser"];

  [MEMORY[0x189607968] numberWithBool:0];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v17 forKey:@"MKBUserSessionDirty"];

  [MEMORY[0x189607968] numberWithBool:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v18 forKey:@"MKBUserSessionForeground"];

  [MEMORY[0x189607968] numberWithBool:1];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v19 forKey:@"MKBUserSessionisPrimary"];

  [MEMORY[0x189607968] numberWithBool:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v20 forKey:@"MKBUserSessionisAdminKey"];

  [v6 setValue:@"/var/mobile" forKey:@"MKBUserSessionLibinfoHomeDir"];
  uint64_t v21 = +[UMLUser userFromManifestDictionary:](&OBJC_CLASS___UMLUser, "userFromManifestDictionary:", v6);
  if (v21)
  {
    v22 = (void *)v21;
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    v23 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = v13;
      v25 = v11;
      id v26 = v5;
      uint64_t v56 = 0LL;
      unsigned int v27 = sub_18878BC68();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        unsigned int v28 = v27;
      }
      else {
        unsigned int v28 = v27 & 0xFFFFFFFE;
      }
      if (v28)
      {
        __int16 v55 = 0;
        LODWORD(v53) = 2;
        v52 = &v55;
        uint64_t v29 = _os_log_send_and_compose_impl();
        v30 = (void *)v29;
        if (v29) {
          sub_18878BC90(v29);
        }
      }

      else
      {
        v30 = 0LL;
      }

      free(v30);
      id v5 = v26;
      v11 = v25;
      v13 = v24;
    }

    [v22 userManifestDictionary];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      if (self) {
        manifest = self->_manifest;
      }
      else {
        manifest = 0LL;
      }
      if (-[UMLManager addNewUser:toUserManifest:saveToPath:]( self,  "addNewUser:toUserManifest:saveToPath:",  v6,  manifest,  v5,  v52,  v53))
      {
        if (qword_18C725920 != -1) {
          dispatch_once(&qword_18C725920, &unk_18A27E200);
        }
        v38 = (os_log_s *)(id)qword_18C725918;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v56 = 0LL;
          unsigned int v39 = sub_18878BC68();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            unsigned int v40 = v39;
          }
          else {
            unsigned int v40 = v39 & 0xFFFFFFFE;
          }
          if (v40)
          {
            __int16 v55 = 0;
            uint64_t v41 = _os_log_send_and_compose_impl();
            v42 = (void *)v41;
            if (v41) {
              sub_18878BC90(v41);
            }
          }

          else
          {
            v42 = 0LL;
          }

          free(v42);
        }

- (BOOL)updatePrimaryUser:(id)a3 onSharedDataVolumePath:(id)a4 withDiskNode:(id)a5 withVolumeuuid:(id)a6 withVolumeName:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14 && v16 && v17)
  {
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    v19 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v20 = sub_18878BC68();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = v20 & 0xFFFFFFFE;
      }
      if (v21)
      {
        LODWORD(v31) = 2;
        uint64_t v22 = _os_log_send_and_compose_impl();
        v23 = (void *)v22;
        if (v22) {
          sub_18878BC90(v22);
        }
      }

      else
      {
        v23 = 0LL;
      }

      free(v23);
    }

    if (self) {
      manifest = self->_manifest;
    }
    else {
      manifest = 0LL;
    }
    LOBYTE(a8) = -[UMLManager updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:]( self,  "updateUser:inManifest:withDiskNode:volumeUUID:volumeName:withSharedDataVolumePath:withError:",  v14,  manifest,  v16,  v17,  v18,  v15,  a8,  v31);
  }

  else
  {
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    v24 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      unsigned int v25 = sub_18878BC68();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        unsigned int v26 = v25;
      }
      else {
        unsigned int v26 = v25 & 0xFFFFFFFE;
      }
      if (v26)
      {
        uint64_t v27 = _os_log_send_and_compose_impl();
        unsigned int v28 = (void *)v27;
        if (v27) {
          sub_18878BC90(v27);
        }
      }

      else
      {
        unsigned int v28 = 0LL;
      }

      free(v28);
    }

    if (a8)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a8) = 0;
      id v14 = 0LL;
    }
  }

  return (char)a8;
}

- (BOOL)createPrimaryUserLayoutWithOnUserVolumePath:(id)a3 fromSystemVolumePath:(id)a4 withError:(id *)a5
{
  return -[UMLManager createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:]( self,  "createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:",  501LL,  1LL,  a3,  a4,  a5);
}

- (void).cxx_destruct
{
}

- (BOOL)createUserLayoutForUserwithUserID:(int)a3 withAKSSetup:(BOOL)a4 onUserVolumePath:(id)a5 fromSystemVolumePath:(id)a6 withError:(id *)a7
{
  BOOL v9 = a4;
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v11 && v12)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@/System/Library/Templates/User/", v12];
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    id v15 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v66 = 0LL;
      unsigned int v16 = sub_18878BC68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        *(_DWORD *)v63 = 138412546;
        *(void *)&v63[4] = v14;
        __int16 v64 = 2112;
        id v65 = v11;
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

    if (self) {
      se = self->_se;
    }
    else {
      se = 0LL;
    }
    uint64_t v27 = se;
    sub_188787DD0((uint64_t)v27);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1895F87A8];
    v61[1] = 3221225472LL;
    v61[2] = sub_18878D134;
    v61[3] = &unk_18A27E1E0;
    int v62 = a3;
    v61[4] = self;
    uint64_t v29 = (void *)v14;
    char v30 = [v28 clonePath:v14 toPath:v11 error:a7 handler:v61];

    if ((v30 & 1) != 0)
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v31 = v29;
      unsigned int v32 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v66 = 0LL;
        unsigned int v33 = sub_18878BC68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          *(_DWORD *)v63 = 138543618;
          *(void *)&v63[4] = v29;
          __int16 v64 = 2114;
          id v65 = v11;
          uint64_t v35 = _os_log_send_and_compose_impl();
          v36 = (void *)v35;
          if (v35) {
            sub_18878BC90(v35);
          }
        }

        else
        {
          v36 = 0LL;
        }

        free(v36);
      }

      if (!v9)
      {
        if (qword_18C725920 != -1) {
          dispatch_once(&qword_18C725920, &unk_18A27E200);
        }
        v37 = (os_log_s *)(id)qword_18C725918;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_99;
        }
        *(void *)v63 = 0LL;
        unsigned int v47 = sub_18878BC68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          unsigned int v48 = v47;
        }
        else {
          unsigned int v48 = v47 & 0xFFFFFFFE;
        }
        if (v48)
        {
          LOWORD(v66) = 0;
          goto LABEL_86;
        }

- (id)readUserManifestOnSharedDataVolumePath:(id)a3 withError:(id *)a4
{
  uint64_t v5 = -[UMLManager loadManifestFromSharedDataVolumePath:](self, "loadManifestFromSharedDataVolumePath:", a3);
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:5 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)loadManifestFromSharedDataVolumePath:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  objc_msgSend(MEMORY[0x189607940], "stringWithString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendString:@"/keybags/usersession.kb"];
  if (self) {
    se = self->_se;
  }
  else {
    se = 0LL;
  }
  v6 = se;
  sub_188787DD0((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = 0LL;
  [v7 dataWithContentsOfFile:v4 error:&v20];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v20;

  if (!v8)
  {
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    v13 = (os_log_s *)(id)qword_18C725918;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    unsigned int v14 = sub_18878BC68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (v15)
    {
LABEL_25:
      uint64_t v18 = _os_log_send_and_compose_impl();
      v19 = (void *)v18;
      if (v18) {
        sub_18878BC90(v18);
      }
      goto LABEL_28;
    }

- (BOOL)addNewUser:(id)a3 toUserManifest:(id)a4 saveToPath:(id)a5
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    [v9 users];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v37 = v10;
      unsigned int v38 = v9;
      int v14 = 0;
      char v15 = 0;
      uint64_t v16 = *(void *)v42;
      do
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = v14;
        do
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend( *(id *)(*((void *)&v41 + 1) + 8 * v17),  "objectForKeyedSubscript:",  @"MKBUserSessionID",  v35,  v36);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 objectForKeyedSubscript:@"MKBUserSessionID"];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            if (qword_18C725920 != -1) {
              dispatch_once(&qword_18C725920, &unk_18A27E200);
            }
            unsigned int v21 = (os_log_s *)(id)qword_18C725918;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v40 = 0LL;
              unsigned int v22 = sub_18878BC68();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
                unsigned int v23 = v22;
              }
              else {
                unsigned int v23 = v22 & 0xFFFFFFFE;
              }
              if (v23)
              {
                __int16 v39 = 0;
                LODWORD(v36) = 2;
                uint64_t v35 = &v39;
                uint64_t v24 = _os_log_send_and_compose_impl();
                BOOL v25 = (void *)v24;
                if (v24) {
                  sub_18878BC90(v24);
                }
              }

              else
              {
                BOOL v25 = 0LL;
              }

              free(v25);
            }

            [v38 users];
            unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 replaceObjectAtIndex:v18 + v17 withObject:v8];

            char v15 = 1;
          }

          ++v17;
        }

        while (v13 != v17);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
        int v14 = v18 + v17;
      }

      while (v13);

      id v9 = v38;
      id v10 = v37;
      if ((v15 & 1) != 0) {
        goto LABEL_38;
      }
    }

    else
    {
    }

    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    unsigned int v28 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = 0LL;
      unsigned int v29 = sub_18878BC68();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
        unsigned int v30 = v29;
      }
      else {
        unsigned int v30 = v29 & 0xFFFFFFFE;
      }
      if (v30)
      {
        __int16 v39 = 0;
        LODWORD(v36) = 2;
        uint64_t v35 = &v39;
        uint64_t v31 = _os_log_send_and_compose_impl();
        unsigned int v32 = (void *)v31;
        if (v31) {
          sub_18878BC90(v31);
        }
      }

      else
      {
        unsigned int v32 = 0LL;
      }

      free(v32);
    }

    [v9 users];
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 addObject:v8];

LABEL_38:
    BOOL v27 = -[UMLManager saveManifest:toPath:](self, "saveManifest:toPath:", v9, v10, v35, v36);
    goto LABEL_39;
  }

  BOOL v27 = 0;
LABEL_39:

  return v27;
}

- (BOOL)removeAnUser:(id)a3 fromUserManifest:(id)a4 saveToPath:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v8 userManifestDictionary], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = (void *)v11;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    [v9 users];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v24 = self;
      id v25 = v10;
      unsigned int v26 = v9;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v18 objectForKeyedSubscript:@"MKBUserSessionID"];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 objectForKeyedSubscript:@"MKBUserSessionID"];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            id v9 = v26;
            [v26 users];
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 removeObject:v18];

            id v10 = v25;
            BOOL v21 = -[UMLManager saveManifest:toPath:](v24, "saveManifest:toPath:", v26, v25);
            goto LABEL_15;
          }
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v15) {
          continue;
        }
        break;
      }

      BOOL v21 = 0;
      id v10 = v25;
      id v9 = v26;
    }

    else
    {
      BOOL v21 = 0;
    }

- (BOOL)updateUser:(id)a3 inManifest:(id)a4 withDiskNode:(id)a5 volumeUUID:(id)a6 volumeName:(id)a7 withSharedDataVolumePath:(id)a8 withError:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  [v14 userManifestDictionary];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = v19;
  if (v19)
  {
    [v19 setValue:v16 forKey:@"MKBUserSessionVolumeDeviceNode"];
    [v20 setValue:v17 forKey:@"MKBUserSessionVolumeUUID"];
    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    BOOL v21 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = v18;
      uint64_t v51 = 0LL;
      unsigned int v23 = sub_18878BC68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        unsigned int v24 = v23;
      }
      else {
        unsigned int v24 = v23 & 0xFFFFFFFE;
      }
      if (v24)
      {
        __int16 v50 = 0;
        LODWORD(v49) = 2;
        unsigned int v48 = &v50;
        uint64_t v25 = _os_log_send_and_compose_impl();
        unsigned int v26 = (void *)v25;
        if (v25) {
          sub_18878BC90(v25);
        }
      }

      else
      {
        unsigned int v26 = 0LL;
      }

      free(v26);
      id v18 = v22;
    }

    if (-[UMLManager addNewUser:toUserManifest:saveToPath:]( self,  "addNewUser:toUserManifest:saveToPath:",  v20,  v15,  v18))
    {
      [v14 setDiskNode:v16];
      [v14 setVolumeUUID:v17];
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v32 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = 0LL;
        unsigned int v33 = sub_18878BC68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          __int16 v50 = 0;
          uint64_t v35 = _os_log_send_and_compose_impl();
          uint64_t v36 = (void *)v35;
          if (v35) {
            sub_18878BC90(v35);
          }
        }

        else
        {
          uint64_t v36 = 0LL;
        }

        free(v36);
      }

      BOOL v46 = 1;
      goto LABEL_53;
    }

    if (qword_18C725920 != -1) {
      dispatch_once(&qword_18C725920, &unk_18A27E200);
    }
    id v37 = (os_log_s *)(id)qword_18C725918;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = 0LL;
      unsigned int v38 = sub_18878BC68();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        __int16 v50 = 0;
        LODWORD(v49) = 2;
        unsigned int v48 = &v50;
        uint64_t v40 = _os_log_send_and_compose_impl();
        __int128 v41 = (void *)v40;
        if (v40) {
          sub_18878BC90(v40);
        }
      }

      else
      {
        __int128 v41 = 0LL;
      }

      free(v41);
    }

    __int128 v42 = a9;
    if (a9)
    {
      __int128 v43 = (void *)MEMORY[0x189607870];
      uint64_t v44 = *MEMORY[0x189607688];
      uint64_t v45 = 5LL;
      goto LABEL_52;
    }

- (BOOL)saveManifest:(id)a3 toPath:(id)a4
{
  v61[3] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [MEMORY[0x189607940] stringWithString:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607940] stringWithString:v7];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 appendString:@"/keybags/usersession.kb"];
    [v9 appendString:@"/keybags"];
    if (self) {
      se = self->_se;
    }
    else {
      se = 0LL;
    }
    sub_188787DD0((uint64_t)se);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v11 fileExistsAtPath:v9 isDirectory:0];

    if ((v12 & 1) == 0)
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v13 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0LL;
        unsigned int v14 = sub_18878BC68();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          unsigned int v57 = &v59;
          uint64_t v16 = _os_log_send_and_compose_impl();
          id v17 = (void *)v16;
          if (v16) {
            sub_18878BC90(v16);
          }
        }

        else
        {
          id v17 = 0LL;
        }

        free(v17);
      }

      if (self) {
        v19 = self->_se;
      }
      else {
        v19 = 0LL;
      }
      sub_188787DD0((uint64_t)v19);
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = [v20 makePath:v9 mode:448 error:0];

      if ((v21 & 1) == 0)
      {
        if (qword_18C725920 != -1) {
          dispatch_once(&qword_18C725920, &unk_18A27E200);
        }
        __int128 v27 = (os_log_s *)(id)qword_18C725918;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v61[0] = 0LL;
          unsigned int v28 = sub_18878BC68();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            unsigned int v29 = v28;
          }
          else {
            unsigned int v29 = v28 & 0xFFFFFFFE;
          }
          if (v29)
          {
            LOWORD(v59) = 0;
            uint64_t v30 = _os_log_send_and_compose_impl();
            uint64_t v31 = (void *)v30;
            if (v30) {
              sub_18878BC90(v30);
            }
          }

          else
          {
            uint64_t v31 = 0LL;
          }

          free(v31);
        }

        BOOL v18 = 0;
        goto LABEL_96;
      }

      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      id v22 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v61[0] = 0LL;
        unsigned int v23 = sub_18878BC68();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = v23 & 0xFFFFFFFE;
        }
        if (v24)
        {
          LOWORD(v59) = 0;
          LODWORD(v58) = 2;
          unsigned int v57 = &v59;
          uint64_t v25 = _os_log_send_and_compose_impl();
          unsigned int v26 = (void *)v25;
          if (v25) {
            sub_18878BC90(v25);
          }
        }

        else
        {
          unsigned int v26 = 0LL;
        }

        free(v26);
      }
    }

    objc_msgSend(v6, "dataValue", v57, v58);
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v32 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v61[0] = 0LL;
        unsigned int v33 = sub_18878BC68();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = v33 & 0xFFFFFFFE;
        }
        if (v34)
        {
          LOWORD(v59) = 0;
          uint64_t v35 = _os_log_send_and_compose_impl();
          uint64_t v36 = (void *)v35;
          if (v35) {
            sub_18878BC90(v35);
          }
        }

        else
        {
          uint64_t v36 = 0LL;
        }

        free(v36);
      }

      if (self) {
        __int128 v42 = self->_se;
      }
      else {
        __int128 v42 = 0LL;
      }
      __int128 v43 = v42;
      sub_188787DD0((uint64_t)v43);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      id v60 = 0LL;
      int v45 = [v44 atomicallyWriteData:v27 toPath:v8 error:&v60];
      id v37 = (os_log_s *)v60;

      if (v45)
      {
        if (qword_18C725920 != -1) {
          dispatch_once(&qword_18C725920, &unk_18A27E200);
        }
        BOOL v46 = (os_log_s *)(id)qword_18C725918;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v61[0] = 0LL;
          unsigned int v47 = sub_18878BC68();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            unsigned int v48 = v47;
          }
          else {
            unsigned int v48 = v47 & 0xFFFFFFFE;
          }
          if (v48)
          {
            LOWORD(v59) = 0;
            uint64_t v49 = _os_log_send_and_compose_impl();
            __int16 v50 = (void *)v49;
            if (v49) {
              sub_18878BC90(v49);
            }
          }

          else
          {
            __int16 v50 = 0LL;
          }

          free(v50);
        }

        BOOL v18 = 1;
        goto LABEL_95;
      }

      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      uint64_t v51 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v59 = 0LL;
        unsigned int v52 = sub_18878BC68();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          unsigned int v53 = v52;
        }
        else {
          unsigned int v53 = v52 & 0xFFFFFFFE;
        }
        if (v53)
        {
          LODWORD(v61[0]) = 138412290;
          *(void *)((char *)v61 + 4) = v37;
          uint64_t v54 = _os_log_send_and_compose_impl();
          uint64_t v55 = (void *)v54;
          if (v54) {
            sub_18878BC90(v54);
          }
        }

        else
        {
          uint64_t v55 = 0LL;
        }

        free(v55);
      }
    }

    else
    {
      if (qword_18C725920 != -1) {
        dispatch_once(&qword_18C725920, &unk_18A27E200);
      }
      id v37 = (os_log_s *)(id)qword_18C725918;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v61[0] = 0LL;
        unsigned int v38 = sub_18878BC68();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          unsigned int v39 = v38;
        }
        else {
          unsigned int v39 = v38 & 0xFFFFFFFE;
        }
        if (v39)
        {
          LOWORD(v59) = 0;
          uint64_t v40 = _os_log_send_and_compose_impl();
          __int128 v41 = (void *)v40;
          if (v40) {
            sub_18878BC90(v40);
          }
        }

        else
        {
          __int128 v41 = 0LL;
        }

        free(v41);
      }
    }

    BOOL v18 = 0;
LABEL_95:

LABEL_96:
    goto LABEL_97;
  }

  BOOL v18 = 0;
LABEL_97:

  return v18;
}

@end