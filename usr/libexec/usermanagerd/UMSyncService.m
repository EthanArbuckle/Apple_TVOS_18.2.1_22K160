@interface UMSyncService
+ (id)sharedService;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5;
- (id)externalizeUserDictionary:(id)a3;
- (id)remoteServiceName;
- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5;
- (void)MKBUserSessionSetInternalTest:(BOOL)a3 withReply:(id)a4;
- (void)addSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5;
- (void)bundleIdentifiersForPersona:(id)a3 completionHandler:(id)a4;
- (void)clearSyncBubbleUserswithReply:(id)a3;
- (void)configureLoginUIWithUserSessionCount:(int)a3 reply:(id)a4;
- (void)createUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 withOpaqueData:(id)a6 reply:(id)a7;
- (void)currentSyncBubbleIDwithReply:(id)a3;
- (void)dataMigrationSetup:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6;
- (void)deleteUserSessionBlobwithReply:(id)a3;
- (void)deleteUserSessionSecureBlobwithReply:(id)a3;
- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5;
- (void)fetchPersonaGenerationNumberWithCompletionHandler:(id)a3;
- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4;
- (void)foregroundUserSessionAttributesWithReply:(id)a3;
- (void)getUserSessionAttributes:(id)a3 reply:(id)a4;
- (void)grantSandboxExtensionForPersonaWithUniqueString:(id)a3 completionHandler:(id)a4;
- (void)isLoginSessionwithReply:(id)a3;
- (void)limitNumberOfUserSessions:(int)a3 withReply:(id)a4;
- (void)listAllUserSessionIDsWithAReply:(id)a3;
- (void)listSyncBubbleUserswithReply:(id)a3;
- (void)listSyncServiceSourcesForUserSession:(id)a3 withReply:(id)a4;
- (void)loadUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6;
- (void)migrateGuestUserVolume:(id)a3 withReply:(id)a4;
- (void)migrateSharedAndPrimaryUserVolumeWithReply:(id)a3;
- (void)mountUserSessionVolumeforID:(int)a3 withReply:(id)a4;
- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6;
- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5;
- (void)removeSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5;
- (void)removeUserSession:(id)a3 reply:(id)a4;
- (void)replacePersonaMachPortVoucher:(id)a3 withAccountID:(id)a4 generationSet:(BOOL)a5 forPid:(int)a6 withReply:(id)a7;
- (void)retrieveUserSessionBlobwithReply:(id)a3;
- (void)retrieveUserSessionSecureBackupBlobwithReply:(id)a3;
- (void)setBundlesIdentifiers:(id)a3 forPersona:(id)a4 completionHandler:(id)a5;
- (void)setUserKeybagOpaqueData:(id)a3 keybagBlob:(id)a4 withReply:(id)a5;
- (void)setUserSessionAttributes:(id)a3 reply:(id)a4;
- (void)setUserSessionSecureBackupBlob:(id)a3 withReply:(id)a4;
- (void)startUserSyncBubble:(int)a3 withReply:(id)a4;
- (void)stoptUserSyncBubble:(int)a3 withReply:(id)a4;
- (void)switchBlockTasksInfoWithReply:(id)a3;
- (void)switchToLoginUIUserSessionWithReply:(id)a3;
- (void)switchToUserSession:(id)a3 withOpaqueData:(id)a4 reply:(id)a5;
- (void)unloadUserSession:(id)a3 reply:(id)a4;
- (void)unmountUserSessionVolumeforID:(int)a3 withReply:(id)a4;
- (void)userKeybagOpaqueData:(id)a3 KeybagBlobwithReply:(id)a4;
- (void)userSessionDeviceConfigurationInfo:(int)a3 withReply:(id)a4;
- (void)userSessionLRUInfoWithReply:(id)a3;
@end

@implementation UMSyncService

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064440;
  block[3] = &unk_1000CCDB8;
  block[4] = a1;
  if (qword_1000DBB78 != -1) {
    dispatch_once(&qword_1000DBB78, block);
  }
  return (id)qword_1000DBB70;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:v3]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    unsigned __int8 v7 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)remoteServiceName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceName]);

  return v3;
}

- (BOOL)retrievePasscodeFromFileHandle:(id)a3 ofLength:(unint64_t)a4 withbaseaddress:(char *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!a4)
  {
LABEL_16:
    BOOL v9 = 1;
    goto LABEL_17;
  }

  if (read((int)[v7 fileDescriptor], a5, a4) != a4)
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v10 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = 0LL;
      unsigned int v11 = sub_100053B4C(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        __int16 v16 = 0;
        v13 = (const char *)_os_log_send_and_compose_impl( v12,  &v17,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "Failed to read the retrievePasscodeFromFileHandle",  &v16,  2);
        v14 = (char *)v13;
        if (v13) {
          sub_100053B7C(v13);
        }
      }

      else
      {
        v14 = 0LL;
      }

      free(v14);
    }

    goto LABEL_16;
  }

  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (id)externalizeUserDictionary:(id)a3
{
  id v3 = [a3 mutableCopy];
  v4 = v3;
  if (v3)
  {
    [v3 removeObjectForKey:kUMUserSessionKeybagOpaqueDataKey];
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)loadUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x3032000000LL;
  v82 = sub_100064F30;
  v83 = sub_100064F40;
  id v84 = 0LL;
  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  v76 = sub_100064F30;
  v77 = sub_100064F40;
  id v78 = 0LL;
  vm_address_t address = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v13 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v71 = 0LL;
    unsigned int v14 = sub_100053B4C(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFE;
    }
    if ((_DWORD)v15)
    {
      __int16 v70 = 0;
      __int16 v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v71,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "loadUserSession: Start",  &v70,  2);
      uint64_t v17 = (char *)v16;
      if (v16) {
        sub_100053B7C(v16);
      }
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    free(v17);
  }

  if (!-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.load"))
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v23 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = 0LL;
      unsigned int v24 = sub_100053B4C(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v24 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        __int16 v70 = 0;
        LODWORD(v59) = 2;
        v26 = (const char *)_os_log_send_and_compose_impl( v25,  &v71,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "Entitlement failure",  &v70,  v59);
        v27 = (char *)v26;
        if (v26) {
          sub_100053B7C(v26);
        }
      }

      else
      {
        v27 = 0LL;
      }

      free(v27);
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
LABEL_74:
    v50 = (void *)v74[5];
    v74[5] = v34;

    if (v12)
    {
LABEL_88:
      v12[2](v12, 0LL, v74[5]);
      goto LABEL_89;
    }

    goto LABEL_89;
  }

  if (vm_page_size < a5)
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v18 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = 0LL;
      unsigned int v19 = sub_100053B4C(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v19 & 0xFFFFFFFE;
      }
      if ((_DWORD)v20)
      {
        __int16 v70 = 0;
        LODWORD(v59) = 2;
        v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v71,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "Long Secret, can't handle ...",  &v70,  v59);
        v22 = (char *)v21;
        if (v21) {
          sub_100053B7C(v21);
        }
      }

      else
      {
        v22 = 0LL;
      }

      free(v22);
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  7LL,  0LL));
    goto LABEL_74;
  }

  if (a5)
  {
    if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
    {
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      v28 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v71 = 0LL;
        unsigned int v29 = sub_100053B4C(1);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = v29 & 0xFFFFFFFE;
        }
        if ((_DWORD)v30)
        {
          __int16 v70 = 0;
          LODWORD(v59) = 2;
          v31 = (const char *)_os_log_send_and_compose_impl( v30,  &v71,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "FAILED to allocate VM",  &v70,  v59);
          v32 = (char *)v31;
          if (v31) {
            sub_100053B7C(v31);
          }
        }

        else
        {
          v32 = 0LL;
        }

        free(v32);
      }

      uint64_t v51 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
      v52 = (void *)v74[5];
      v74[5] = v51;

      vm_address_t address = 0LL;
      goto LABEL_88;
    }

    vm_address_t v33 = address;
    if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:]( self,  "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:",  v11,  a5,  address))
    {
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      v35 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v71 = 0LL;
        unsigned int v36 = sub_100053B4C(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v37 = v36;
        }
        else {
          uint64_t v37 = v36 & 0xFFFFFFFE;
        }
        if ((_DWORD)v37)
        {
          __int16 v70 = 0;
          LODWORD(v59) = 2;
          v38 = (const char *)_os_log_send_and_compose_impl( v37,  &v71,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "Failed to retrieve Passcode",  &v70,  v59);
          v39 = (char *)v38;
          if (v38) {
            sub_100053B7C(v38);
          }
        }

        else
        {
          v39 = 0LL;
        }

        free(v39);
      }

      uint64_t v53 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
      v54 = (void *)v74[5];
      v74[5] = v53;

      vm_map_t v55 = mach_task_self_;
      vm_address_t v56 = address;
      vm_size_t v57 = vm_page_size;
      if (vm_page_size >= a5) {
        rsize_t v58 = a5;
      }
      else {
        rsize_t v58 = vm_page_size;
      }
      memset_s((void *)address, v58, 0, v58);
      vm_deallocate(v55, v56, v57);
      goto LABEL_88;
    }
  }

  else
  {
    vm_address_t v33 = 0LL;
  }

  v40 = (dispatch_queue_s *)qword_1000DBD48;
  block = _NSConcreteStackBlock;
  uint64_t v61 = 3221225472LL;
  v62 = sub_100064F48;
  v63 = &unk_1000CD738;
  vm_address_t v68 = v33;
  unint64_t v69 = a5;
  id v64 = v10;
  v65 = self;
  v66 = &v79;
  v67 = &v73;
  dispatch_sync(v40, &block);
  vm_address_t v41 = address;
  if (address)
  {
    vm_map_t v42 = mach_task_self_;
    vm_size_t v43 = vm_page_size;
    if (vm_page_size >= a5) {
      rsize_t v44 = a5;
    }
    else {
      rsize_t v44 = vm_page_size;
    }
    memset_s((void *)address, v44, 0, v44);
    vm_deallocate(v42, v41, v43);
  }

  v12[2](v12, v80[5], v74[5]);
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v45 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v71 = 0LL;
    unsigned int v46 = sub_100053B4C(1);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v47 = v46;
    }
    else {
      uint64_t v47 = v46 & 0xFFFFFFFE;
    }
    if ((_DWORD)v47)
    {
      __int16 v70 = 0;
      LODWORD(v59) = 2;
      v48 = (const char *)_os_log_send_and_compose_impl( v47,  &v71,  0LL,  0LL,  &_mh_execute_header,  v45,  0LL,  "loadUserSession: End",  &v70,  v59,  block,  v61,  v62,  v63);
      v49 = (char *)v48;
      if (v48) {
        sub_100053B7C(v48);
      }
    }

    else
    {
      v49 = 0LL;
    }

    free(v49);
  }

LABEL_89:
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
}

- (void)unloadUserSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100064F30;
  vm_address_t v33 = sub_100064F40;
  id v34 = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v8 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = 0LL;
    unsigned int v9 = sub_100053B4C(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      __int16 v27 = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v28,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "unloadUserSession: Start",  &v27,  2);
      uint64_t v12 = (char *)v11;
      if (v11) {
        sub_100053B7C(v11);
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    free(v12);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.load"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100065614;
    block[3] = &unk_1000CD760;
    block[4] = &v29;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    v7[2](v7, v30[5]);
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v13 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = 0LL;
      unsigned int v14 = sub_100053B4C(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        __int16 v27 = 0;
        LODWORD(v25) = 2;
        __int16 v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v28,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "unloadUserSession: End",  &v27,  v25);
        uint64_t v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      free(v17);
    }
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v18 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = 0LL;
      unsigned int v19 = sub_100053B4C(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v19 & 0xFFFFFFFE;
      }
      if ((_DWORD)v20)
      {
        __int16 v27 = 0;
        LODWORD(v25) = 2;
        v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v28,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "Entitlement failure",  &v27,  v25);
        v22 = (char *)v21;
        if (v21) {
          sub_100053B7C(v21);
        }
      }

      else
      {
        v22 = 0LL;
      }

      free(v22);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    unsigned int v24 = (void *)v30[5];
    v30[5] = v23;

    if (v7) {
      v7[2](v7, v30[5]);
    }
  }

  _Block_object_dispose(&v29, 8);
}

- (void)createUserSession:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 withOpaqueData:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, uint64_t, uint64_t))a7;
  uint64_t v83 = 0LL;
  id v84 = &v83;
  uint64_t v85 = 0x3032000000LL;
  v86 = sub_100064F30;
  v87 = sub_100064F40;
  id v88 = 0LL;
  uint64_t v77 = 0LL;
  id v78 = &v77;
  uint64_t v79 = 0x3032000000LL;
  v80 = sub_100064F30;
  uint64_t v81 = sub_100064F40;
  id v82 = 0LL;
  vm_address_t address = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  __int16 v16 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v75 = 0LL;
    unsigned int v17 = sub_100053B4C(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = v17 & 0xFFFFFFFE;
    }
    if ((_DWORD)v18)
    {
      __int16 v74 = 0;
      unsigned int v19 = (const char *)_os_log_send_and_compose_impl( v18,  &v75,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "createUserSession: Start",  &v74,  2);
      uint64_t v20 = (char *)v19;
      if (v19) {
        sub_100053B7C(v19);
      }
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    free(v20);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.load"))
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000DBB98 != -1) {
          dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
        }
        vm_address_t v33 = (os_log_s *)(id)qword_1000DBB90;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v75 = 0LL;
          unsigned int v34 = sub_100053B4C(1);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v35 = v34;
          }
          else {
            uint64_t v35 = v34 & 0xFFFFFFFE;
          }
          if ((_DWORD)v35)
          {
            __int16 v74 = 0;
            LODWORD(v72) = 2;
            unsigned int v36 = (const char *)_os_log_send_and_compose_impl( v35,  &v75,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "createUserSession with SECRET passcode",  &v74,  v72);
            uint64_t v37 = (char *)v36;
            if (v36) {
              sub_100053B7C(v36);
            }
          }

          else
          {
            uint64_t v37 = 0LL;
          }

          free(v37);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000DBB98 != -1) {
            dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
          }
          v45 = (os_log_s *)(id)qword_1000DBB90;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v75 = 0LL;
            unsigned int v46 = sub_100053B4C(1);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v47 = v46;
            }
            else {
              uint64_t v47 = v46 & 0xFFFFFFFE;
            }
            if ((_DWORD)v47)
            {
              __int16 v74 = 0;
              LODWORD(v72) = 2;
              v48 = (const char *)_os_log_send_and_compose_impl( v47,  &v75,  0LL,  0LL,  &_mh_execute_header,  v45,  0LL,  "FAILED to allocate VM",  &v74,  v72);
              v49 = (char *)v48;
              if (v48) {
                sub_100053B7C(v48);
              }
            }

            else
            {
              v49 = 0LL;
            }

            free(v49);
          }

          uint64_t v55 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
          vm_address_t v56 = (void *)v78[5];
          v78[5] = v55;

          vm_address_t address = 0LL;
          goto LABEL_110;
        }

        if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:]( self,  "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:",  v13,  a5,  address))
        {
          if (qword_1000DBB98 != -1) {
            dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
          }
          v50 = (os_log_s *)(id)qword_1000DBB90;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v75 = 0LL;
            unsigned int v51 = sub_100053B4C(1);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v52 = v51;
            }
            else {
              uint64_t v52 = v51 & 0xFFFFFFFE;
            }
            if ((_DWORD)v52)
            {
              __int16 v74 = 0;
              LODWORD(v72) = 2;
              uint64_t v53 = (const char *)_os_log_send_and_compose_impl( v52,  &v75,  0LL,  0LL,  &_mh_execute_header,  v50,  0LL,  "Failed to retrieve Passcode",  &v74,  v72);
              v54 = (char *)v53;
              if (v53) {
                sub_100053B7C(v53);
              }
            }

            else
            {
              v54 = 0LL;
            }

            free(v54);
          }

          uint64_t v66 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
          v67 = (void *)v78[5];
          v78[5] = v66;

          vm_map_t v68 = mach_task_self_;
          vm_address_t v69 = address;
          vm_size_t v70 = vm_page_size;
          if (vm_page_size >= a5) {
            rsize_t v71 = a5;
          }
          else {
            rsize_t v71 = vm_page_size;
          }
          memset_s((void *)address, v71, 0, v71);
          vm_deallocate(v68, v69, v70);
          goto LABEL_110;
        }
      }

      else
      {
        if (qword_1000DBB98 != -1) {
          dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
        }
        v38 = (os_log_s *)(id)qword_1000DBB90;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v75 = 0LL;
          unsigned int v39 = sub_100053B4C(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v40 = v39;
          }
          else {
            uint64_t v40 = v39 & 0xFFFFFFFE;
          }
          if ((_DWORD)v40)
          {
            __int16 v74 = 0;
            LODWORD(v72) = 2;
            vm_address_t v41 = (const char *)_os_log_send_and_compose_impl( v40,  &v75,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "createUserSession with NULL passcode",  &v74,  v72);
            vm_map_t v42 = (char *)v41;
            if (v41) {
              sub_100053B7C(v41);
            }
          }

          else
          {
            vm_map_t v42 = 0LL;
          }

          free(v42);
        }
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100066170;
      block[3] = &unk_1000CD360;
      block[4] = &v83;
      void block[5] = &v77;
      dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
      vm_address_t v57 = address;
      if (address)
      {
        vm_map_t v58 = mach_task_self_;
        vm_size_t v59 = vm_page_size;
        if (vm_page_size >= a5) {
          rsize_t v60 = a5;
        }
        else {
          rsize_t v60 = vm_page_size;
        }
        memset_s((void *)address, v60, 0, v60);
        vm_deallocate(v58, v57, v59);
      }

      v15[2](v15, v84[5], v78[5]);
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      uint64_t v61 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v75 = 0LL;
        unsigned int v62 = sub_100053B4C(1);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v63 = v62;
        }
        else {
          uint64_t v63 = v62 & 0xFFFFFFFE;
        }
        if ((_DWORD)v63)
        {
          __int16 v74 = 0;
          LODWORD(v72) = 2;
          id v64 = (const char *)_os_log_send_and_compose_impl( v63,  &v75,  0LL,  0LL,  &_mh_execute_header,  v61,  0LL,  "createUserSession: End",  &v74,  v72);
          v65 = (char *)v64;
          if (v64) {
            sub_100053B7C(v64);
          }
        }

        else
        {
          v65 = 0LL;
        }

        free(v65);
      }
    }

    else
    {
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      v21 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v75 = 0LL;
        unsigned int v22 = sub_100053B4C(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v23 = v22;
        }
        else {
          uint64_t v23 = v22 & 0xFFFFFFFE;
        }
        if ((_DWORD)v23)
        {
          __int16 v74 = 0;
          LODWORD(v72) = 2;
          unsigned int v24 = (const char *)_os_log_send_and_compose_impl( v23,  &v75,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "Long Secret, can't handle ...",  &v74,  v72);
          uint64_t v25 = (char *)v24;
          if (v24) {
            sub_100053B7C(v24);
          }
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        free(v25);
      }

      uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  7LL,  0LL));
      rsize_t v44 = (void *)v78[5];
      v78[5] = v43;

      if (v15) {
LABEL_110:
      }
        v15[2](v15, 0LL, v78[5]);
    }
  }

  else
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    __int16 v27 = (void *)v78[5];
    v78[5] = v26;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v28 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v75 = 0LL;
      unsigned int v29 = sub_100053B4C(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = v29 & 0xFFFFFFFE;
      }
      if ((_DWORD)v30)
      {
        __int16 v74 = 0;
        LODWORD(v72) = 2;
        uint64_t v31 = (const char *)_os_log_send_and_compose_impl( v30,  &v75,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "Entitlement failure",  &v74,  v72);
        v32 = (char *)v31;
        if (v31) {
          sub_100053B7C(v31);
        }
      }

      else
      {
        v32 = 0LL;
      }

      free(v32);
    }

    if (v15) {
      goto LABEL_110;
    }
  }

  _Block_object_dispose(&v77, 8);

  _Block_object_dispose(&v83, 8);
}

- (void)dataMigrationSetup:(id)a3 withSecret:(id)a4 oldSize:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  uint64_t v70 = 0LL;
  rsize_t v71 = &v70;
  uint64_t v72 = 0x3032000000LL;
  uint64_t v73 = sub_100064F30;
  __int16 v74 = sub_100064F40;
  id v75 = 0LL;
  vm_address_t address = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  id v13 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v68 = 0LL;
    unsigned int v14 = sub_100053B4C(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFE;
    }
    if ((_DWORD)v15)
    {
      v67[0] = 0;
      __int16 v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v68,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "dataMigrationSetup: Start",  v67,  2);
      unsigned int v17 = (char *)v16;
      if (v16) {
        sub_100053B7C(v16);
      }
    }

    else
    {
      unsigned int v17 = 0LL;
    }

    free(v17);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.migration"))
  {
    if (vm_page_size >= a5)
    {
      if (a5)
      {
        if (qword_1000DBB98 != -1) {
          dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
        }
        uint64_t v30 = (os_log_s *)(id)qword_1000DBB90;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v68 = 0LL;
          unsigned int v31 = sub_100053B4C(1);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = v31 & 0xFFFFFFFE;
          }
          if ((_DWORD)v32)
          {
            v67[0] = 0;
            LODWORD(v65) = 2;
            vm_address_t v33 = (const char *)_os_log_send_and_compose_impl( v32,  &v68,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "dataMigrationSetup with SECRET passcode",  v67,  v65);
            unsigned int v34 = (char *)v33;
            if (v33) {
              sub_100053B7C(v33);
            }
          }

          else
          {
            unsigned int v34 = 0LL;
          }

          free(v34);
        }

        if (vm_allocate(mach_task_self_, &address, vm_page_size, -268435455))
        {
          if (qword_1000DBB98 != -1) {
            dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
          }
          vm_map_t v42 = (os_log_s *)(id)qword_1000DBB90;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v68 = 0LL;
            unsigned int v43 = sub_100053B4C(1);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v44 = v43;
            }
            else {
              uint64_t v44 = v43 & 0xFFFFFFFE;
            }
            if ((_DWORD)v44)
            {
              v67[0] = 0;
              LODWORD(v65) = 2;
              v45 = (const char *)_os_log_send_and_compose_impl( v44,  &v68,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "FAILED to allocate VM",  v67,  v65);
              unsigned int v46 = (char *)v45;
              if (v45) {
                sub_100053B7C(v45);
              }
            }

            else
            {
              unsigned int v46 = 0LL;
            }

            free(v46);
          }

          uint64_t v52 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
          uint64_t v53 = (void *)v71[5];
          v71[5] = v52;

          vm_address_t address = 0LL;
          goto LABEL_105;
        }

        if (-[UMSyncService retrievePasscodeFromFileHandle:ofLength:withbaseaddress:]( self,  "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:",  v11,  a5,  address))
        {
          if (qword_1000DBB98 != -1) {
            dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
          }
          uint64_t v47 = (os_log_s *)(id)qword_1000DBB90;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v68 = 0LL;
            unsigned int v48 = sub_100053B4C(1);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v49 = v48;
            }
            else {
              uint64_t v49 = v48 & 0xFFFFFFFE;
            }
            if ((_DWORD)v49)
            {
              v67[0] = 0;
              LODWORD(v65) = 2;
              v50 = (const char *)_os_log_send_and_compose_impl( v49,  &v68,  0LL,  0LL,  &_mh_execute_header,  v47,  0LL,  "Failed to retrieve Passcode",  v67,  v65);
              unsigned int v51 = (char *)v50;
              if (v50) {
                sub_100053B7C(v50);
              }
            }

            else
            {
              unsigned int v51 = 0LL;
            }

            free(v51);
          }

          uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
          rsize_t v60 = (void *)v71[5];
          v71[5] = v59;

          vm_map_t v61 = mach_task_self_;
          vm_address_t v62 = address;
          vm_size_t v63 = vm_page_size;
          if (vm_page_size >= a5) {
            rsize_t v64 = a5;
          }
          else {
            rsize_t v64 = vm_page_size;
          }
          memset_s((void *)address, v64, 0, v64);
          vm_deallocate(v61, v62, v63);
          goto LABEL_105;
        }
      }

      else
      {
        if (qword_1000DBB98 != -1) {
          dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
        }
        uint64_t v35 = (os_log_s *)(id)qword_1000DBB90;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v68 = 0LL;
          unsigned int v36 = sub_100053B4C(1);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v37 = v36;
          }
          else {
            uint64_t v37 = v36 & 0xFFFFFFFE;
          }
          if ((_DWORD)v37)
          {
            v67[0] = 0;
            LODWORD(v65) = 2;
            v38 = (const char *)_os_log_send_and_compose_impl( v37,  &v68,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "dataMigrationSetup with NULL passcode",  v67,  v65);
            unsigned int v39 = (char *)v38;
            if (v38) {
              sub_100053B7C(v38);
            }
          }

          else
          {
            unsigned int v39 = 0LL;
          }

          free(v39);
        }
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100066D64;
      block[3] = &unk_1000CD760;
      block[4] = &v70;
      dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
      v12[2](v12, v71[5]);
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      v54 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v68 = 0LL;
        unsigned int v55 = sub_100053B4C(1);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v56 = v55;
        }
        else {
          uint64_t v56 = v55 & 0xFFFFFFFE;
        }
        if ((_DWORD)v56)
        {
          v67[0] = 0;
          LODWORD(v65) = 2;
          vm_address_t v57 = (const char *)_os_log_send_and_compose_impl( v56,  &v68,  0LL,  0LL,  &_mh_execute_header,  v54,  0LL,  "dataMigrationSetup: End",  v67,  v65);
          vm_map_t v58 = (char *)v57;
          if (v57) {
            sub_100053B7C(v57);
          }
        }

        else
        {
          vm_map_t v58 = 0LL;
        }

        free(v58);
      }
    }

    else
    {
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      uint64_t v18 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v68 = 0LL;
        unsigned int v19 = sub_100053B4C(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = v19 & 0xFFFFFFFE;
        }
        if ((_DWORD)v20)
        {
          v67[0] = 0;
          LODWORD(v65) = 2;
          v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v68,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "Long Secret, can't handle ...",  v67,  v65);
          unsigned int v22 = (char *)v21;
          if (v21) {
            sub_100053B7C(v21);
          }
        }

        else
        {
          unsigned int v22 = 0LL;
        }

        free(v22);
      }

      uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  7LL,  0LL));
      vm_address_t v41 = (void *)v71[5];
      v71[5] = v40;

      if (v12) {
LABEL_105:
      }
        v12[2](v12, v71[5]);
    }
  }

  else
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    unsigned int v24 = (void *)v71[5];
    v71[5] = v23;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v25 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v68 = 0LL;
      unsigned int v26 = sub_100053B4C(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v26 & 0xFFFFFFFE;
      }
      if ((_DWORD)v27)
      {
        v67[0] = 0;
        LODWORD(v65) = 2;
        uint64_t v28 = (const char *)_os_log_send_and_compose_impl( v27,  &v68,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "Entitlement failure",  v67,  v65);
        unsigned int v29 = (char *)v28;
        if (v28) {
          sub_100053B7C(v28);
        }
      }

      else
      {
        unsigned int v29 = 0LL;
      }

      free(v29);
    }

    if (v12) {
      goto LABEL_105;
    }
  }

  _Block_object_dispose(&v70, 8);
}

- (void)migrateSharedAndPrimaryUserVolumeWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v41 = 0LL;
  vm_map_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  uint64_t v44 = sub_100064F30;
  v45 = sub_100064F40;
  id v46 = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v5 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = 0LL;
    unsigned int v6 = sub_100053B4C(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      LOWORD(v33) = 0;
      v8 = (const char *)_os_log_send_and_compose_impl( v7,  &v37,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "migrateSharedAndPrimaryUserVolume: Start",  &v33,  2);
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100053B7C(v8);
      }
    }

    else
    {
      unsigned int v9 = 0LL;
    }

    free(v9);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.migration"))
  {
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    uint64_t v40 = 0LL;
    uint64_t v33 = 0LL;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100067330;
    block[3] = &unk_1000CD788;
    block[4] = &v37;
    void block[5] = &v33;
    void block[6] = &v41;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    if (*((_BYTE *)v34 + 24))
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100067800;
      v29[3] = &unk_1000CD360;
      v29[4] = &v37;
      v29[5] = &v41;
      dispatch_sync((dispatch_queue_t)qword_1000DBD60, v29);
    }

    else
    {
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      unsigned int v17 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = 0LL;
        unsigned int v18 = sub_100053B4C(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = v18 & 0xFFFFFFFE;
        }
        if ((_DWORD)v19)
        {
          v30[0] = 0;
          LODWORD(v28) = 2;
          uint64_t v20 = (const char *)_os_log_send_and_compose_impl( v19,  &v31,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "Unable to find the primary UUID string, returning error, ENOENT",  v30,  v28);
          v21 = (char *)v20;
          if (v20) {
            sub_100053B7C(v20);
          }
        }

        else
        {
          v21 = 0LL;
        }

        free(v21);
      }
    }

    if (*((_BYTE *)v34 + 24))
    {
      unsigned int v22 = (const void *)v38[3];
      if (v22)
      {
        CFRelease(v22);
        v38[3] = 0LL;
      }
    }

    v4[2](v4, v42[5]);
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v23 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = 0LL;
      unsigned int v24 = sub_100053B4C(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v24 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        v30[0] = 0;
        LODWORD(v28) = 2;
        unsigned int v26 = (const char *)_os_log_send_and_compose_impl( v25,  &v31,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "migrateSharedAndPrimaryUserVolume: End",  v30,  v28);
        uint64_t v27 = (char *)v26;
        if (v26) {
          sub_100053B7C(v26);
        }
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      free(v27);
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    id v11 = (void *)v42[5];
    v42[5] = v10;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v12 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        LOWORD(v33) = 0;
        LODWORD(v28) = 2;
        uint64_t v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v37,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "Volume Migration Entitlement failure",  &v33,  v28);
        __int16 v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        __int16 v16 = 0LL;
      }

      free(v16);
    }

    if (v4) {
      v4[2](v4, v42[5]);
    }
  }

  _Block_object_dispose(&v41, 8);
}

- (void)migrateGuestUserVolume:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v8 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = 0LL;
    unsigned int v9 = sub_100053B4C(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      LOWORD(v58) = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v63,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "migrateGuestUserVolume: Start",  &v58,  2);
      id v12 = (char *)v11;
      if (v11) {
        sub_100053B7C(v11);
      }
    }

    else
    {
      id v12 = 0LL;
    }

    free(v12);
  }

  uint64_t v63 = 0LL;
  rsize_t v64 = &v63;
  uint64_t v65 = 0x3032000000LL;
  uint64_t v66 = sub_100064F30;
  v67 = sub_100064F40;
  id v68 = 0LL;
  int v62 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.migration"))
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v14 = [v13 processIdentifier];

    unsigned int v15 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v62, v14);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    LODWORD(v13) = sub_100046494((uint64_t)[v16 processIdentifier]);

    uint64_t v58 = 0LL;
    uint64_t v59 = &v58;
    uint64_t v60 = 0x2020000000LL;
    uint64_t v61 = 0LL;
    uint64_t v54 = 0LL;
    unsigned int v55 = &v54;
    uint64_t v56 = 0x2020000000LL;
    char v57 = 0;
    unsigned int v17 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100068154;
    block[3] = &unk_1000CD7B0;
    unsigned int v51 = v15;
    int v52 = v62;
    int v53 = (int)v13;
    unsigned int v48 = &v58;
    id v18 = v6;
    id v47 = v18;
    uint64_t v49 = &v63;
    v50 = &v54;
    dispatch_sync(v17, block);
    if (*((_BYTE *)v55 + 24))
    {
      uint64_t v19 = (dispatch_queue_s *)qword_1000DBD60;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100068208;
      v42[3] = &unk_1000CD7D8;
      uint64_t v43 = (os_log_s *)v18;
      uint64_t v44 = &v58;
      v45 = &v63;
      dispatch_sync(v19, v42);
      uint64_t v20 = (const void *)v59[3];
      if (v20)
      {
        CFRelease(v20);
        v59[3] = 0LL;
      }

      v21 = v43;
      p_name = (char **)(&OBJC_PROTOCOL___UMMobileKeyBagProviding + 8);
    }

    else
    {
      p_name = &OBJC_PROTOCOL___UMMobileKeyBagProviding.name;
      if (qword_1000DBB98 != -1) {
        dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
      }
      v21 = (os_log_s *)(id)qword_1000DBB90;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = 0LL;
        unsigned int v30 = sub_100053B4C(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = v30 & 0xFFFFFFFE;
        }
        if ((_DWORD)v31)
        {
          v40[0] = 0;
          LODWORD(v39) = 2;
          uint64_t v32 = (const char *)_os_log_send_and_compose_impl( v31,  &v41,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "Unable to diskString for the persona returning error..",  v40,  v39);
          uint64_t v33 = (char *)v32;
          if (v32) {
            sub_100053B7C(v32);
          }
        }

        else
        {
          uint64_t v33 = 0LL;
        }

        free(v33);
      }
    }

    unsigned int v34 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = 0LL;
      unsigned int v35 = sub_100053B4C(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = v35 & 0xFFFFFFFE;
      }
      if ((_DWORD)v36)
      {
        v40[0] = 0;
        LODWORD(v39) = 2;
        uint64_t v37 = (const char *)_os_log_send_and_compose_impl( v36,  &v41,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "migrateGuestUserVolume: End",  v40,  v39);
        v38 = (char *)v37;
        if (v37) {
          sub_100053B7C(v37);
        }
      }

      else
      {
        v38 = 0LL;
      }

      free(v38);
    }

    v7[2](v7, v64[5]);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
  }

  else
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    unsigned int v24 = (void *)v64[5];
    v64[5] = v23;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v25 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = 0LL;
      unsigned int v26 = sub_100053B4C(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v26 & 0xFFFFFFFE;
      }
      if ((_DWORD)v27)
      {
        LOWORD(v54) = 0;
        LODWORD(v39) = 2;
        uint64_t v28 = (const char *)_os_log_send_and_compose_impl( v27,  &v58,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "Volume Migration Entitlement failure",  &v54,  v39);
        unsigned int v29 = (char *)v28;
        if (v28) {
          sub_100053B7C(v28);
        }
      }

      else
      {
        unsigned int v29 = 0LL;
      }

      free(v29);
    }

    if (v7) {
      v7[2](v7, v64[5]);
    }
  }

  _Block_object_dispose(&v63, 8);
}

- (void)removeUserSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_100064F30;
  uint64_t v39 = sub_100064F40;
  id v40 = 0LL;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v8 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = 0LL;
    unsigned int v9 = sub_100053B4C(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v9 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      __int16 v33 = 0;
      id v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v34,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "removeUserSession: Start",  &v33,  2);
      id v12 = (char *)v11;
      if (v11) {
        sub_100053B7C(v11);
      }
    }

    else
    {
      id v12 = 0LL;
    }

    free(v12);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.delete"))
  {
    unsigned int v13 = (dispatch_queue_s *)qword_1000DBD48;
    block = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    unsigned int v29 = sub_100068B64;
    unsigned int v30 = &unk_1000CD800;
    id v31 = v6;
    uint64_t v32 = &v35;
    dispatch_sync(v13, &block);
    v7[2](v7, v36[5]);
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v14 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = 0LL;
      unsigned int v15 = sub_100053B4C(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = v15 & 0xFFFFFFFE;
      }
      if ((_DWORD)v16)
      {
        __int16 v33 = 0;
        LODWORD(v26) = 2;
        unsigned int v17 = (const char *)_os_log_send_and_compose_impl( v16,  &v34,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "removeUserSession: End",  &v33,  v26,  block,  v28,  v29,  v30);
        id v18 = (char *)v17;
        if (v17) {
          sub_100053B7C(v17);
        }
      }

      else
      {
        id v18 = 0LL;
      }

      free(v18);
    }
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v20 = (void *)v36[5];
    v36[5] = v19;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    v21 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = 0LL;
      unsigned int v22 = sub_100053B4C(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v22 & 0xFFFFFFFE;
      }
      if ((_DWORD)v23)
      {
        __int16 v33 = 0;
        LODWORD(v26) = 2;
        unsigned int v24 = (const char *)_os_log_send_and_compose_impl( v23,  &v34,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "Entitlement failure",  &v33,  v26);
        uint64_t v25 = (char *)v24;
        if (v24) {
          sub_100053B7C(v24);
        }
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      free(v25);
    }

    if (v7) {
      v7[2](v7, v36[5]);
    }
  }

  _Block_object_dispose(&v35, 8);
}

- (void)listAllUserSessionIDsWithAReply:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  v5 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = 0LL;
    unsigned int v6 = sub_100053B4C(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      __int16 v23 = 0;
      v8 = (const char *)_os_log_send_and_compose_impl( v7,  &v24,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "listAllUserSessionIDsWithAReply: Start",  &v23,  2);
      unsigned int v9 = (char *)v8;
      if (v8) {
        sub_100053B7C(v8);
      }
    }

    else
    {
      unsigned int v9 = 0LL;
    }

    free(v9);
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.info"))
  {
    uint64_t v10 = (void *)sub_10001AB64();
    if (v10) {
      id v11 = 0LL;
    }
    else {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
    }
    v4[2](v4, v10, v11);
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    unsigned int v17 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = 0LL;
      unsigned int v18 = sub_100053B4C(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v18 & 0xFFFFFFFE;
      }
      if ((_DWORD)v19)
      {
        __int16 v23 = 0;
        LODWORD(v22) = 2;
        uint64_t v20 = (const char *)_os_log_send_and_compose_impl( v19,  &v24,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "listAllUserSessionIDsWithAReply: End",  &v23,  v22);
        v21 = (char *)v20;
        if (v20) {
          sub_100053B7C(v20);
        }
      }

      else
      {
        v21 = 0LL;
      }

      free(v21);
    }
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v12 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        __int16 v23 = 0;
        LODWORD(v22) = 2;
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v24,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "Entitlement failure",  &v23,  v22);
        uint64_t v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      free(v16);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, 0LL, v11);
    }
  }
}

- (void)retrieveUserSessionBlobwithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  unsigned int v18 = sub_100064F30;
  uint64_t v19 = sub_100064F40;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_100064F30;
  unsigned int v13 = sub_100064F40;
  id v14 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.retrieve"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006916C;
    v8[3] = &unk_1000CD360;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v8);
    uint64_t v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  uint64_t v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

- (void)deleteUserSessionBlobwithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_100064F30;
  id v12 = sub_100064F40;
  id v13 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.retrieve"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006954C;
    v7[3] = &unk_1000CD360;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  uint64_t v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)switchToUserSession:(id)a3 withOpaqueData:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100064F30;
  uint64_t v22 = sub_100064F40;
  id v23 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.switch"))
  {
    uint64_t v11 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100069A28;
    block[3] = &unk_1000CD828;
    uint64_t v17 = &v18;
    id v15 = v8;
    id v16 = v9;
    dispatch_sync(v11, block);
    v10[2](v10, v19[5]);
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    id v13 = (void *)v19[5];
    v19[5] = v12;

    if (v10) {
      v10[2](v10, v19[5]);
    }
  }

  _Block_object_dispose(&v18, 8);
}

- (void)setUserSessionSecureBackupBlob:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100064F30;
  uint64_t v25 = sub_100064F40;
  id v26 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.securebackup"))
  {
    id v8 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006A02C;
    block[3] = &unk_1000CD800;
    id v17 = v6;
    uint64_t v18 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v22[5]);
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v10 = (void *)v22[5];
    v22[5] = v9;

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v11 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = 0LL;
      unsigned int v12 = sub_100053B4C(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v13)
      {
        __int16 v19 = 0;
        id v14 = (const char *)_os_log_send_and_compose_impl( v13,  &v20,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "Entitlement error for setUserSessionSecureBackupBlob",  &v19,  2);
        id v15 = (char *)v14;
        if (v14) {
          sub_100053B7C(v14);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      free(v15);
    }

    if (v7) {
      v7[2](v7, v22[5]);
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (void)setUserKeybagOpaqueData:(id)a3 keybagBlob:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100064F30;
  uint64_t v25 = sub_100064F40;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.keybagopaquedata"))
  {
    uint64_t v11 = (dispatch_queue_s *)qword_1000DBD48;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006A4A4;
    v14[3] = &unk_1000CD850;
    id v17 = v19;
    id v15 = v8;
    id v16 = v9;
    uint64_t v18 = &v21;
    dispatch_sync(v11, v14);
    v10[2](v10, v22[5]);
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;

    if (v10) {
      v10[2](v10, v22[5]);
    }
  }

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)userKeybagOpaqueData:(id)a3 KeybagBlobwithReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100064F30;
  uint64_t v25 = sub_100064F40;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_100064F30;
  __int16 v19 = sub_100064F40;
  id v20 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.keybagopaquedata")
    || -[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.keystore.device"))
  {
    id v8 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006A8DC;
    block[3] = &unk_1000CD878;
    uint64_t v13 = &v15;
    id v12 = v6;
    id v14 = &v21;
    dispatch_sync(v8, block);
    v7[2](v7, v16[5], v22[5]);
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v10 = (void *)v22[5];
    v22[5] = v9;

    if (v7) {
      v7[2](v7, v16[5], v22[5]);
    }
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)retrieveUserSessionSecureBackupBlobwithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_100064F30;
  __int16 v19 = sub_100064F40;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_100064F30;
  uint64_t v13 = sub_100064F40;
  id v14 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.securebackup"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006ACCC;
    v8[3] = &unk_1000CD360;
    v8[4] = &v9;
    v8[5] = &v15;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v8);
    uint64_t v5 = v10[5];
LABEL_5:
    v4[2](v4, v5, v16[5]);
    goto LABEL_6;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  uint64_t v7 = (void *)v16[5];
  v16[5] = v6;

  if (v4)
  {
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

- (void)deleteUserSessionSecureBlobwithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_100064F30;
  id v12 = sub_100064F40;
  id v13 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.securebackup"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006B0AC;
    v7[3] = &unk_1000CD360;
    v7[4] = v14;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v7);
LABEL_4:
    v4[2](v4, v9[5]);
    goto LABEL_5;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  uint64_t v6 = (void *)v9[5];
  v9[5] = v5;

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
}

- (void)getUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100064F30;
  id v26 = sub_100064F40;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  __int16 v19 = sub_100064F30;
  id v20 = sub_100064F40;
  id v21 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.info"))
  {
    uint64_t v8 = (dispatch_queue_s *)qword_1000DBD48;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006B5AC;
    v11[3] = &unk_1000CD8A0;
    id v12 = v6;
    id v13 = self;
    id v14 = &v22;
    uint64_t v15 = &v16;
    dispatch_sync(v8, v11);
    v7[2](v7, v23[5], v17[5]);
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v10 = (void *)v17[5];
    v17[5] = v9;

    if (v7) {
      v7[2](v7, 0LL, v17[5]);
    }
  }

  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)setUserSessionAttributes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_100064F30;
  uint64_t v35 = sub_100064F40;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100064F30;
  unsigned int v29 = sub_100064F40;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100064F30;
  uint64_t v23 = sub_100064F40;
  id v24 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.info"))
  {
    if (v6)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 objectForKey:kUMUserSessionIDKey]);
      uint64_t v9 = (void *)v20[5];
      v20[5] = v8;
    }

    uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006B950;
    block[3] = &unk_1000CD8C8;
    id v14 = v6;
    uint64_t v15 = self;
    uint64_t v16 = &v31;
    uint64_t v17 = &v25;
    uint64_t v18 = &v19;
    dispatch_sync(v10, block);
    v7[2](v7, v32[5], v26[5]);
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    id v12 = (void *)v26[5];
    v26[5] = v11;

    if (v7) {
      v7[2](v7, 0LL, v26[5]);
    }
  }

  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

- (void)foregroundUserSessionAttributesWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100064F30;
  uint64_t v16 = sub_100064F40;
  id v17 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100064F30;
  uint64_t v10 = sub_100064F40;
  id v11 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BD10;
  block[3] = &unk_1000CD878;
  void block[4] = self;
  void block[5] = &v6;
  void block[6] = &v12;
  dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
  v4[2](v4, v7[5], v13[5]);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

- (void)configureLoginUIWithUserSessionCount:(int)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_100064F30;
  uint64_t v34 = sub_100064F40;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100064F30;
  uint64_t v28 = sub_100064F40;
  id v29 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.loginwindow"))
  {
    if (!_os_feature_enabled_impl("UserManagement", "LocalUserEnrollment"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006C2D8;
      block[3] = &unk_1000CD8F0;
      int v21 = a3;
      void block[5] = &v30;
      void block[6] = &v24;
      void block[4] = self;
      dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
      v6[2](v6, v25[5], v31[5]);
      goto LABEL_30;
    }

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v7 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = 0LL;
      unsigned int v8 = sub_100053B4C(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        __int16 v22 = 0;
        uint64_t v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v23,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "LOCAL USER ENROLLMENT FEATURE ENABLED, WILL NOT BE ABLE TO PROVISION THE DEVICE; REMOVE FE"
                              "ATURE FLAG AND TRY AGAIN",
                              &v22,
                              2);
        id v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        id v11 = 0LL;
      }

      free(v11);
    }

    if (qword_1000DBBA8 != -1) {
      dispatch_once(&qword_1000DBBA8, &stru_1000CDAC0);
    }
    id v13 = (os_log_s *)(id)qword_1000DBBA0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = 0LL;
      unsigned int v14 = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        __int16 v22 = 0;
        LODWORD(v19) = 2;
        uint64_t v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v23,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "LOCAL USER ENROLLMENT FEATURE ENABLED, WILL NOT BE ABLE TO PROVISION DEVICE; REMOVE FEATUR"
                              "E FLAG AND TRY AGAIN - NOT SUPPORTED",
                              &v22,
                              v19);
        id v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        id v17 = 0LL;
      }

      free(v17);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  }

  uint64_t v18 = (void *)v31[5];
  v31[5] = v12;

  if (v6) {
    v6[2](v6, 0LL, v31[5]);
  }
LABEL_30:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

- (void)switchToLoginUIUserSessionWithReply:(id)a3
{
  uint64_t v7 = (void (**)(id, void *))a3;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.loginwindow"))
  {
    int v4 = sub_10002992C();
    if (v4) {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v4,  0LL));
    }
    else {
      uint64_t v5 = 0LL;
    }
    uint64_t v6 = v7;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v6 = v7;
    if (!v7) {
      goto LABEL_9;
    }
  }

  v6[2](v6, v5);
LABEL_9:
}

- (void)addSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006C988;
    block[3] = &unk_1000CD918;
    int v16 = a4;
    id v14 = v8;
    uint64_t v15 = &v17;
    dispatch_sync(v10, block);
    uint64_t v11 = *((int *)v18 + 6);
    if ((_DWORD)v11) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v11,  0LL));
    }
    else {
      uint64_t v12 = 0LL;
    }
    v9[2](v9, v12);
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v9) {
      v9[2](v9, v12);
    }
  }

  _Block_object_dispose(&v17, 8);
}

- (void)removeSyncServiceSource:(id)a3 toUserSession:(int)a4 withReply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    uint64_t v10 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006CD88;
    block[3] = &unk_1000CD918;
    int v16 = a4;
    id v14 = v8;
    uint64_t v15 = &v17;
    dispatch_sync(v10, block);
    uint64_t v11 = *((int *)v18 + 6);
    if ((_DWORD)v11) {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v11,  0LL));
    }
    else {
      uint64_t v12 = 0LL;
    }
    v9[2](v9, v12);
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v9) {
      v9[2](v9, v12);
    }
  }

  _Block_object_dispose(&v17, 8);
}

- (void)startUserSyncBubble:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006D168;
    v9[3] = &unk_1000CD458;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      id v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)stoptUserSyncBubble:(int)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006D5A0;
    v9[3] = &unk_1000CD458;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      id v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)MKBUserSessionSetInternalTest:(BOOL)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006D9DC;
    v9[3] = &unk_1000CD940;
    BOOL v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      id v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)currentSyncBubbleIDwithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006DF70;
    block[3] = &unk_1000CD760;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    uint64_t v5 = *((unsigned int *)v9 + 6);
    if ((_DWORD)v5 == -1)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    v4[2](v4, v5, v6);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, *((unsigned int *)v9 + 6), v6);
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void)listSyncServiceSourcesForUserSession:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = -1;
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_100064F30;
  uint64_t v19 = sub_100064F40;
  id v20 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    if (v6)
    {
      uint64_t v8 = (dispatch_queue_s *)qword_1000DBD48;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006E2DC;
      block[3] = &unk_1000CD7D8;
      id v12 = v6;
      uint64_t v13 = &v15;
      int v14 = &v21;
      dispatch_sync(v8, block);
      uint64_t v9 = *((int *)v22 + 6);
      if ((_DWORD)v9) {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v9,  0LL));
      }
      else {
        uint64_t v10 = 0LL;
      }
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    }

    v7[2](v7, v16[5], v10);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v7) {
      v7[2](v7, v16[5], v10);
    }
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

- (void)listSyncBubbleUserswithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  int v11 = sub_100064F30;
  id v12 = sub_100064F40;
  id v13 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E790;
    block[3] = &unk_1000CD760;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    uint64_t v5 = v9[5];
    if (v5)
    {
      id v6 = 0LL;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      uint64_t v5 = v9[5];
    }

    v4[2](v4, v5, v6);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, 0LL, v6);
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void)clearSyncBubbleUserswithReply:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E940;
    block[3] = &unk_1000CD760;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    uint64_t v5 = *((int *)v9 + 6);
    if ((_DWORD)v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v5,  0LL));
    }
    else {
      id v6 = 0LL;
    }
    v4[2](v4, v6);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, v6);
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void)limitNumberOfUserSessions:(int)a3 withReply:(id)a4
{
  uint64_t v8 = a4;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    if (sub_1000315D8(a3) == -1) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    }
    else {
      id v6 = 0LL;
    }
    uint64_t v7 = (void (*)(void))v8[2];
    goto LABEL_8;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  if (v8)
  {
    uint64_t v7 = (void (*)(void))v8[2];
LABEL_8:
    v7();
  }
}

- (void)switchBlockTasksInfoWithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100064F30;
  int v16 = sub_100064F40;
  id v17 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006EDE4;
    v7[3] = &unk_1000CD360;
    v7[4] = &v12;
    v7[5] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v7);
    uint64_t v5 = *((int *)v9 + 6);
    if ((_DWORD)v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v5,  0LL));
    }
    else {
      id v6 = 0LL;
    }
    v4[2](v4, v13[5], v6);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, 0LL, v6);
    }
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)userSessionLRUInfoWithReply:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  int v11 = sub_100064F30;
  uint64_t v12 = sub_100064F40;
  id v13 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006F0B0;
    block[3] = &unk_1000CD760;
    void block[4] = &v8;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, block);
    uint64_t v5 = v9[5];
    if (v5)
    {
      id v6 = 0LL;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      uint64_t v5 = v9[5];
    }

    v4[2](v4, v5, v6);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v4) {
      v4[2](v4, 0LL, v6);
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void)mountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006F270;
    v9[3] = &unk_1000CD458;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      uint64_t v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)unmountUserSessionVolumeforID:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.synctest"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006F560;
    v9[3] = &unk_1000CD458;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      uint64_t v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)isLoginSessionwithReply:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100064F30;
  int v24 = sub_100064F40;
  id v25 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.loginwindow"))
  {
    uint64_t v5 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006F8C4;
    block[3] = &unk_1000CD968;
    int v14 = &v16;
    uint64_t v15 = &v20;
    id v6 = v4;
    id v13 = v6;
    dispatch_sync(v5, block);
    uint64_t v7 = *((int *)v17 + 6);
    if ((_DWORD)v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
      uint64_t v9 = (void *)v21[5];
      v21[5] = v8;
    }

    (*((void (**)(id, uint64_t))v6 + 2))(v6, v21[5]);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    uint64_t v11 = (void *)v21[5];
    v21[5] = v10;

    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, v21[5]);
    }
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)userSessionDeviceConfigurationInfo:(int)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.mkb.usersession.deviceconfig"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006FABC;
    v9[3] = &unk_1000CD458;
    int v10 = a3;
    v9[4] = &v11;
    dispatch_sync((dispatch_queue_t)qword_1000DBD48, v9);
    uint64_t v7 = *((int *)v12 + 6);
    if ((_DWORD)v7) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    else {
      uint64_t v8 = 0LL;
    }
    v6[2](v6, v8);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      v6[2](v6, v8);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)replacePersonaMachPortVoucher:(id)a3 withAccountID:(id)a4 generationSet:(BOOL)a5 forPid:(int)a6 withReply:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  int v14 = (void (**)(id, uint64_t, uint64_t))a7;
  uint64_t v52 = 0LL;
  int v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  unsigned int v55 = sub_100064F30;
  uint64_t v56 = sub_100064F40;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = sub_100064F30;
  v50 = sub_100064F40;
  id v51 = 0LL;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x2020000000LL;
  int v45 = 22;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  int v43 = 0;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  int v41 = 0;
  if (v9)
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v15 = (id)qword_1000DBB90;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v59 = 0LL;
      LODWORD(v16) = sub_100053B4C(1);
      id v17 = (os_log_s *)v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        uint64_t v16 = v16;
      }
      else {
        uint64_t v16 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v16)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[UMSyncService remoteServiceName](self, "remoteServiceName"));
        *(_DWORD *)uint64_t v58 = 138412290;
        *(void *)&v58[4] = v18;
        int v19 = (char *)_os_log_send_and_compose_impl( v16,  &v59,  0LL,  0LL,  &_mh_execute_header,  v17,  2LL,  "Remote Service replacePersonaMachPortVoucher requested by %@",  v58,  12);

        if (v19) {
          sub_100053B7C(v19);
        }
      }

      else
      {

        int v19 = 0LL;
      }

      free(v19);
    }

    goto LABEL_24;
  }

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.background"))
  {
LABEL_24:
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v26 = sub_100046494((uint64_t)[v25 processIdentifier]);

    uint64_t v27 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007034C;
    block[3] = &unk_1000CD990;
    int v38 = a6;
    id v31 = v12;
    uint64_t v33 = &v52;
    id v32 = v13;
    uint64_t v34 = v42;
    int v39 = v26;
    id v35 = v44;
    id v36 = v40;
    uint64_t v37 = &v46;
    dispatch_sync(v27, block);
    v14[2](v14, v47[5], v53[5]);

    goto LABEL_25;
  }

  if (qword_1000DBB98 != -1) {
    dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
  }
  uint64_t v20 = (os_log_s *)(id)qword_1000DBB90;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t v58 = 0LL;
    unsigned int v21 = sub_100053B4C(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v21 & 0xFFFFFFFE;
    }
    if ((_DWORD)v22)
    {
      LODWORD(v59) = 67109120;
      HIDWORD(v59) = a6;
      uint64_t v23 = (const char *)_os_log_send_and_compose_impl( v22,  v58,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "replacePersonaVoucher with no entitlement from pid:%d",  &v59);
      int v24 = (char *)v23;
      if (v23) {
        sub_100053B7C(v23);
      }
    }

    else
    {
      int v24 = 0LL;
    }

    free(v24);
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  id v29 = (void *)v53[5];
  v53[5] = v28;

  if (v14) {
    v14[2](v14, v47[5], v53[5]);
  }
LABEL_25:
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v29 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetch"))
  {
    unsigned int v7 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v29, v4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v9 = sub_100046494((uint64_t)[v8 processIdentifier]);

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    int v10 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = 0LL;
      unsigned int v11 = sub_100053B4C(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        int v30 = 67109120;
        int v31 = v4;
        id v13 = (const char *)_os_log_send_and_compose_impl( v12,  &v28,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "In UMSyncServer: fetchPersonaListforPid from pid:%d",  &v30);
        int v14 = (char *)v13;
        if (v13) {
          sub_100053B7C(v13);
        }
      }

      else
      {
        int v14 = 0LL;
      }

      free(v14);
    }

    uint64_t v20 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100070EAC;
    block[3] = &unk_1000CD9B8;
    int v24 = v4;
    unsigned int v25 = v7;
    int v26 = v29;
    int v27 = v9;
    id v23 = v6;
    dispatch_sync(v20, block);

    unsigned int v21 = 0LL;
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v15 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = 0LL;
      unsigned int v16 = sub_100053B4C(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        int v30 = 67109120;
        int v31 = v4;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v28,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "In UMSyncServer: fetchPersonaListforPid entitlement failure:%d",  &v30);
        int v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        int v19 = 0LL;
      }

      free(v19);
    }

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v21);
    }
  }
}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0LL;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100064F30;
  int v29 = sub_100064F40;
  id v30 = 0LL;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetch"))
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    unsigned int v7 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = 0LL;
      unsigned int v8 = sub_100053B4C(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        int v31 = 67109120;
        int v32 = a3;
        int v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v24,  0LL,  0LL,  &_mh_execute_header,  v7,  2LL,  "In UMSyncServer: fetchAllUsersPersonaListforPid from pid:%d",  &v31);
        unsigned int v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        unsigned int v11 = 0LL;
      }

      free(v11);
    }

    uint64_t v17 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100071490;
    block[3] = &unk_1000CD9E0;
    int v23 = a3;
    uint64_t v22 = &v25;
    id v21 = v6;
    dispatch_sync(v17, block);
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v12 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v31 = 67109120;
        int v32 = a3;
        id v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v24,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "In UMSyncServer: fetchAllUsersPersonaListforPid entitlement failure:%d",  &v31);
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        unsigned int v16 = 0LL;
      }

      free(v16);
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    int v19 = (void *)v26[5];
    v26[5] = v18;

    if (v6) {
      (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0LL, v26[5]);
    }
  }

  _Block_object_dispose(&v25, 8);
}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetch"))
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    unsigned int v7 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = 0LL;
      unsigned int v8 = sub_100053B4C(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        LOWORD(v19[0]) = 0;
        int v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v18,  0LL,  0LL,  &_mh_execute_header,  v7,  2LL,  "In UMSyncServer: ASID Map not supported on this platform",  v19,  2);
        unsigned int v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        unsigned int v11 = 0LL;
      }

      free(v11);
    }

    if (v6)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
LABEL_28:
      v6[2](v6, 0LL, v17);
      goto LABEL_29;
    }

    uint64_t v17 = 0LL;
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v12 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        v19[0] = 67109120;
        v19[1] = a3;
        id v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v18,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "In UMSyncServer: fetchAsidMapforPid entitlement failure:%d",  v19);
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        unsigned int v16 = 0LL;
      }

      free(v16);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    if (v6) {
      goto LABEL_28;
    }
  }

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  uint64_t v37 = 0LL;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_100064F30;
  int v41 = sub_100064F40;
  id v42 = 0LL;
  int v36 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetch"))
  {
    if (v8) {
      goto LABEL_28;
    }
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    int v10 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0LL;
      unsigned int v11 = sub_100053B4C(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        LOWORD(v43[0]) = 0;
        unsigned int v13 = (const char *)_os_log_send_and_compose_impl( v12,  &v35,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "In UMSyncServer: entitlement OK, but invalid profileInfo",  v43,  2);
        uint64_t v14 = (char *)v13;
        if (v13) {
          sub_100053B7C(v13);
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      free(v14);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v15 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0LL;
      unsigned int v16 = sub_100053B4C(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        v43[0] = 67109120;
        v43[1] = v6;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v35,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "In UMSyncServer: fetchPersona entitlement failure:%d",  v43);
        int v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        int v19 = 0LL;
      }

      free(v19);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  }

  id v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v9) {
      v9[2](v9, 0LL);
    }
  }

  else
  {
    unsigned int v22 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v36, v6);
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v24 = sub_100046494((uint64_t)[v23 processIdentifier]);

    uint64_t v25 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100071DB8;
    block[3] = &unk_1000CDA08;
    id v26 = v8;
    int v31 = v6;
    unsigned int v32 = v22;
    int v33 = v36;
    int v34 = v24;
    id v28 = v26;
    id v30 = &v37;
    int v29 = v9;
    dispatch_sync(v25, block);
  }

  _Block_object_dispose(&v37, 8);
}

- (void)fetchPersonaGenerationNumberWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v6 = [v5 processIdentifier];

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetch"))
  {
    unsigned int v7 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007232C;
    block[3] = &unk_1000CD0E0;
    id v15 = v4;
    dispatch_sync(v7, block);
  }

  else
  {
    if (qword_1000DBBB8 != -1) {
      dispatch_once(&qword_1000DBBB8, &stru_1000CDAE0);
    }
    id v8 = (os_log_s *)(id)qword_1000DBBB0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        v17[0] = 67109120;
        v17[1] = v6;
        unsigned int v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v16,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "Failed to fetch persona generation number: pid is missing entitlement: %d",  v17);
        uint64_t v12 = (char *)v11;
        if (v11) {
          sub_100053B7C(v11);
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      free(v12);
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v13);
  }
}

- (void)bundleIdentifiersForPersona:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  uint64_t v37 = 0LL;
  int v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_100064F30;
  int v41 = sub_100064F40;
  id v42 = 0LL;
  int v36 = -1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = [v8 processIdentifier];

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.fetchbundle"))
  {
    if (v6) {
      goto LABEL_28;
    }
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v10 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0LL;
      unsigned int v11 = sub_100053B4C(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        LOWORD(v43[0]) = 0;
        unsigned int v13 = (const char *)_os_log_send_and_compose_impl( v12,  &v35,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "In UMSyncServer: entitlement OK, but invalid profileInfo",  v43,  2);
        uint64_t v14 = (char *)v13;
        if (v13) {
          sub_100053B7C(v13);
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      free(v14);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v15 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = 0LL;
      unsigned int v16 = sub_100053B4C(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        v43[0] = 67109120;
        v43[1] = (_DWORD)v9;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v35,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "In UMSyncServer: bundleIdentifiersForPersona entitlement failure:%d",  v43);
        int v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        int v19 = 0LL;
      }

      free(v19);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
  }

  id v21 = (void *)v38[5];
  v38[5] = v20;

LABEL_28:
  if (v38[5])
  {
    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    unsigned int v22 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v36, v9);
    int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v24 = sub_100046494((uint64_t)[v23 processIdentifier]);

    uint64_t v25 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100072778;
    block[3] = &unk_1000CDA08;
    id v26 = v6;
    int v31 = (int)v9;
    unsigned int v32 = v22;
    int v33 = v36;
    int v34 = v24;
    id v28 = v26;
    id v30 = &v37;
    int v29 = v7;
    dispatch_sync(v25, block);
  }

  _Block_object_dispose(&v37, 8);
}

- (void)setBundlesIdentifiers:(id)a3 forPersona:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  id v51 = sub_100064F30;
  uint64_t v52 = sub_100064F40;
  id v53 = 0LL;
  int v47 = -1;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = [v11 processIdentifier];

  if (!-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.setbundle"))
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v18 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = 0LL;
      unsigned int v19 = sub_100053B4C(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v19 & 0xFFFFFFFE;
      }
      if ((_DWORD)v20)
      {
        v54[0] = 67109120;
        v54[1] = (_DWORD)v12;
        id v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v46,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "In UMSyncServer: bundleIdentifiersForPersona entitlement failure:%d",  v54);
        unsigned int v22 = (char *)v21;
        if (v21) {
          sub_100053B7C(v21);
        }
      }

      else
      {
        unsigned int v22 = 0LL;
      }

      free(v22);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    goto LABEL_40;
  }

  if (!v9)
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    unsigned int v13 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = 0LL;
      unsigned int v14 = sub_100053B4C(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        LOWORD(v54[0]) = 0;
        unsigned int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v46,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "In UMSyncServer: entitlement OK, but invalid profileInfo",  v54,  2);
        uint64_t v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      free(v17);
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    uint64_t v25 = (void *)v49[5];
    v49[5] = v24;
  }

  if (!v8)
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    id v26 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = 0LL;
      unsigned int v27 = sub_100053B4C(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = v27 & 0xFFFFFFFE;
      }
      if ((_DWORD)v28)
      {
        LOWORD(v54[0]) = 0;
        LODWORD(v36) = 2;
        int v29 = (const char *)_os_log_send_and_compose_impl( v28,  &v46,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "In UMSyncServer: entitlement OK, but invalid bundleArray",  v54,  v36);
        id v30 = (char *)v29;
        if (v29) {
          sub_100053B7C(v29);
        }
      }

      else
      {
        id v30 = 0LL;
      }

      free(v30);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
LABEL_40:
    int v31 = (void *)v49[5];
    v49[5] = v23;
  }

  if (v49[5])
  {
    if (v10) {
      v10[2](v10);
    }
  }

  else
  {
    unsigned int v32 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v47, v12);
    int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v34 = sub_100046494((uint64_t)[v33 processIdentifier]);

    uint64_t v35 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100073040;
    block[3] = &unk_1000CDA30;
    id v38 = v9;
    int v42 = (int)v12;
    unsigned int v43 = v32;
    int v44 = v47;
    int v45 = v34;
    id v39 = v8;
    int v41 = &v48;
    id v40 = v10;
    dispatch_sync(v35, block);
  }

  _Block_object_dispose(&v48, 8);
}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v31 = 0LL;
  unsigned int v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  int v34 = sub_100064F30;
  uint64_t v35 = sub_100064F40;
  id v36 = 0LL;
  int v30 = -1;
  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.observer"))
  {
    unsigned int v10 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v30, v6);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v12 = sub_100046494((uint64_t)[v11 processIdentifier]);

    unsigned int v13 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007368C;
    block[3] = &unk_1000CDA58;
    id v14 = v8;
    unsigned int v26 = v10;
    int v27 = v30;
    int v28 = v12;
    id v23 = v14;
    uint64_t v25 = &v31;
    id v24 = v9;
    dispatch_sync(v13, block);
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v15 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = 0LL;
      unsigned int v16 = sub_100053B4C(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        v37[0] = 67109120;
        v37[1] = v6;
        uint64_t v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v29,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "Entitlement Failure for pid:%d",  v37);
        unsigned int v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        unsigned int v19 = 0LL;
      }

      free(v19);
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    id v21 = (void *)v32[5];
    v32[5] = v20;

    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v32[5]);
    }
  }

  _Block_object_dispose(&v31, 8);
}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }

- (void)grantSandboxExtensionForPersonaWithUniqueString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0LL;
  int v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  uint64_t v46 = sub_100064F30;
  int v47 = sub_100064F40;
  id v48 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v9 = [v8 processIdentifier];

  if (-[UMSyncService remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.usermanagerd.persona.grantSandboxExtension"))
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    unsigned int v11 = v10;
    if (v10)
    {
      [v10 auditToken];
    }

    else
    {
      __int128 v42 = 0u;
      __int128 v41 = 0u;
    }

    int v40 = -1;
    unsigned int v17 = -[UMSyncService asidForClient:withAuid:withPid:](self, "asidForClient:withAuid:withPid:", 0LL, &v40, v9);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v19 = sub_100046494((uint64_t)[v18 processIdentifier]);

    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    uint64_t v20 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = 0LL;
      unsigned int v21 = sub_100053B4C(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = v21 & 0xFFFFFFFE;
      }
      if ((_DWORD)v22)
      {
        int v49 = 138413058;
        id v50 = v6;
        __int16 v51 = 1024;
        int v52 = (int)v9;
        __int16 v53 = 1024;
        unsigned int v54 = v17;
        __int16 v55 = 1024;
        int v56 = v40;
        id v23 = (const char *)_os_log_send_and_compose_impl( v22,  &v39,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "In RDServer: grantSandboxExtensionForPersona:persona:%@, pid:%d, asid:%d, auid:%d",  &v49,  30);
        id v24 = (char *)v23;
        if (v23) {
          sub_100053B7C(v23);
        }
      }

      else
      {
        id v24 = 0LL;
      }

      free(v24);
    }

    int v27 = (dispatch_queue_s *)qword_1000DBD48;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100073F6C;
    block[3] = &unk_1000CDA80;
    unsigned int v33 = v17;
    int v34 = v40;
    int v35 = v19;
    id v28 = v6;
    __int128 v36 = v41;
    __int128 v37 = v42;
    int v38 = (int)v9;
    id v30 = v28;
    unsigned int v32 = &v43;
    id v31 = v7;
    dispatch_sync(v27, block);
  }

  else
  {
    if (qword_1000DBB98 != -1) {
      dispatch_once(&qword_1000DBB98, &stru_1000CDAA0);
    }
    int v12 = (os_log_s *)(id)qword_1000DBB90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)&__int128 v41 = 0LL;
      unsigned int v13 = sub_100053B4C(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v13 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v49 = 67109120;
        LODWORD(v50) = (_DWORD)v9;
        uint64_t v15 = (const char *)_os_log_send_and_compose_impl( v14,  &v41,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "In RDServer: grantSandboxExtensionForPersona entitlement failure:%d",  &v49);
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100053B7C(v15);
        }
      }

      else
      {
        unsigned int v16 = 0LL;
      }

      free(v16);
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  0LL));
    unsigned int v26 = (void *)v44[5];
    v44[5] = v25;

    if (v7) {
      (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0LL, v44[5]);
    }
  }

  _Block_object_dispose(&v43, 8);
}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4) {
    *a4 = -1;
  }
  return -1;
}

@end