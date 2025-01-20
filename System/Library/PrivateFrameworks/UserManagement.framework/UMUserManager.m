@interface UMUserManager
+ (id)sharedManager;
- (BOOL)canAccessUserProperties;
- (BOOL)haveValidPersonaContextForIDString:(id)a3;
- (BOOL)haveValidPersonaContextForPersonaUniqueString:(id)a3;
- (BOOL)isLoginSession;
- (BOOL)isMultiUser;
- (BOOL)isSharedIPad;
- (BOOL)migrateGuestUserVolume:(id)a3 withError:(id *)a4;
- (BOOL)migrateSharedAndPrimaryUserVolumeWithError:(id *)a3;
- (BOOL)personaLoginWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5;
- (BOOL)personaLogoutWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5;
- (BOOL)setBundleIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 withError:(id *)a5;
- (BOOL)setKeybagOpaqueDataForUser:(id)a3 withOpaqueData:(id)a4 withError:(id *)a5;
- (BOOL)userExists:(id)a3;
- (NSArray)allUsers;
- (NSArray)allUsersUnfiltered;
- (UMUser)currentUser;
- (UMUser)loginUser;
- (UMUserManager)init;
- (UMUserPersona)currentPersona;
- (id)bundleIdentifiersforPersonaWithPersonaUniqueString:(id)a3 withError:(id *)a4;
- (id)currentUserSwitchContext;
- (id)keybagOpaqueDataForUser:(id)a3 withError:(id *)a4;
- (id)listAllPersonaAttributesWithError:(id *)a3;
- (id)listAllPersonaWithAttributes;
- (unint64_t)maxNumberOfUsers;
- (unint64_t)personaGenerationIdentifierWithError:(id *)a3;
- (unint64_t)userQuotaSize;
- (void)createUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)createUserPersona:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)createUserPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 completionHandler:(id)a6;
- (void)currentUserSwitchContextHasBeenUsed;
- (void)deleteUser:(id)a3 completionHandler:(id)a4;
- (void)deleteUserPersonaWithIDString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithPersonaUniqueString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithProfileInfo:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)deleteUserPersonaWithType:(int)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)disableUser:(id)a3 completionHandler:(id)a4;
- (void)disableUserPersonaWithProfileInfo:(id)a3 completionHandler:(id)a4;
- (void)fetchAllPersonasForAllUsersWithCompletionHandler:(id)a3;
- (void)fetchAllPersonasWithCompletionHandler:(id)a3;
- (void)fetchAsidMapOfAllUsersWithCompletionHandler:(id)a3;
- (void)fetchBundleIdentifierForPersonaWithIDString:(id)a3 completionHandler:(id)a4;
- (void)fetchBundleIdentifierForPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)fetchBundleIdentifierForType:(int)a3 completionHandler:(id)a4;
- (void)fetchMultiPersonaBundleIdentifierWithcompletionHandler:(id)a3;
- (void)fetchPersonaWithIDString:(id)a3 CompletionHandler:(id)a4;
- (void)fetchPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4;
- (void)fetchPersonaWithType:(int)a3 CompletionHandler:(id)a4;
- (void)loadUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5;
- (void)loginUICheckInWithCompletionHandler:(id)a3;
- (void)logoutToLoginSessionWithCompletionHandler:(id)a3;
- (void)registerCriticalUserSwitchStakeHolder:(id)a3;
- (void)registerPersonaListUpdateObserver:(id)a3 completionHandler:(id)a4;
- (void)registerPersonaListUpdateObserver:(id)a3 withMachService:(id)a4 completionHandler:(id)a5;
- (void)registerUserListUpdateObserver:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4;
- (void)resumeQuotas;
- (void)resumeSync;
- (void)setBundlesIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 completionHandler:(id)a5;
- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaType:(int)a4 completionHandler:(id)a5;
- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaWithIDString:(id)a4 completionHandler:(id)a5;
- (void)setMultiPersonaBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setupUMUserSessionProvisioning:(id)a3 WithCompletionHandler:(id)a4;
- (void)suspendQuotasWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)terminateSyncWithCompletionHandler:(id)a3;
- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5;
- (void)userInteractionIsEnabled;
- (void)userListDidUpdate;
@end

@implementation UMUserManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F3FDF0;
  block[3] = &unk_189DD45B8;
  block[4] = a1;
  if (qword_18C49E248 != -1) {
    dispatch_once(&qword_18C49E248, block);
  }
  return (id)qword_18C49E250;
}

- (UMUserManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMUserManager;
  result = -[UMUserManager init](&v3, sel_init);
  if (result) {
    result->_switchIsOccurring = 0;
  }
  return result;
}

- (BOOL)isMultiUser
{
  return sub_185F38E68();
}

- (BOOL)isSharedIPad
{
  return sub_185F38E68();
}

- (BOOL)isLoginSession
{
  return sub_185F3DEA4();
}

- (unint64_t)maxNumberOfUsers
{
  return sub_185F39024();
}

- (unint64_t)userQuotaSize
{
  return sub_185F39364();
}

- (BOOL)canAccessUserProperties
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_185F3FF08;
  block[3] = &unk_189DD4900;
  block[4] = self;
  if (qword_18C682B80 != -1) {
    dispatch_once(&qword_18C682B80, block);
  }
  return (byte_18C682B78 & 1) == 0;
}

- (UMUser)currentUser
{
  return (UMUser *)sub_185F394F8();
}

- (UMUser)loginUser
{
  return (UMUser *)sub_185F39584();
}

- (void)userListDidUpdate
{
  if (self)
  {
    p_userListUpdateObserver = &self->_userListUpdateObserver;
    id WeakRetained = objc_loadWeakRetained((id *)p_userListUpdateObserver);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)p_userListUpdateObserver);
      objc_msgSend_userListDidUpdate(v8, v5, v6, v7);
    }
  }

- (void)loadUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_185F3644C();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_185F4020C;
  v15[3] = &unk_189DD4978;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  sub_185F3672C((uint64_t)v11, self, v15);
}

- (void)createUser:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_185F3644C();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_185F40464;
  v15[3] = &unk_189DD4978;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  sub_185F3672C((uint64_t)v11, self, v15);
}

- (void)deleteUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3644C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F406E8;
  v11[3] = &unk_189DD49A0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)disableUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3644C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F40948;
  v11[3] = &unk_189DD49C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)registerUserListUpdateObserver:(id)a3
{
  id obj = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ does not implement necessary observer methods",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)obj);
  }
  id v10 = obj;
  if (self)
  {
    objc_storeWeak((id *)&self->_userListUpdateObserver, obj);
    id v10 = obj;
  }
}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v62[0] = MEMORY[0x1895F87A8];
  v62[1] = 3221225472LL;
  v62[2] = sub_185F40D64;
  v62[3] = &unk_189DD49F0;
  v62[4] = self;
  id v8 = v7;
  id v63 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x186E2FEC4](v62);
  if (!objc_msgSend_isSharedIPad(self, v10, v11, v12))
  {
    unint64_t v30 = 0LL;
    goto LABEL_6;
  }

  sub_185F43760();
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v13, @"Switch to login screen", v14, v15, v16, v17, v18, v19, v60);

  if (self)
  {
    if (self->_switchIsOccurring)
    {
      sub_185F43760();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A40((uint64_t)v23, @"A switch was already initiated", v24, v25, v26, v27, v28, v29, v61);

      unint64_t v30 = 5LL;
LABEL_6:
      sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *))v9)[2](v9, v31);
      goto LABEL_7;
    }

    self->_switchIsOccurring = 1;
  }

  if (v6)
  {
    objc_msgSend_currentUser(self, v20, v21, v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend_mutableCopy(v32, v33, v34, v35);

    objc_msgSend_setErrorCausingLogout_(v36, v37, (uint64_t)v6, v38);
    objc_msgSend_setDebugErrorCausingLogout_(v36, v39, (uint64_t)v6, v40);
    objc_msgSend_commitChanges(v36, v41, v42, v43);
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"An error caused this switch",  v44,  v45,  v46,  v47,  v48,  v49,  v61);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F46B40((uint64_t)v50, @"Error: %@", v51, v52, v53, v54, v55, v56, (uint64_t)v6);
    sub_185F438D0();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v57, v50);
  }

  sub_185F4773C();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v31, v58, (uint64_t)v9, v59);
LABEL_7:
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = (uint64_t)sub_185F40F24;
  v28[3] = (uint64_t)&unk_189DD49F0;
  v28[4] = (uint64_t)self;
  id v5 = v4;
  id v29 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x186E2FEC4](v28);
  if (!objc_msgSend_isSharedIPad(self, v7, v8, v9))
  {
    unint64_t v24 = 0LL;
    goto LABEL_6;
  }

  sub_185F43818();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v10, @"Switch to login screen", v11, v12, v13, v14, v15, v16, v28[0]);

  if (!self)
  {
LABEL_8:
    sub_185F4773C();
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logoutToLoginSessionWithCompletionHandler_(v25, v26, (uint64_t)v6, v27);
    goto LABEL_9;
  }

  if (!self->_switchIsOccurring)
  {
    self->_switchIsOccurring = 1;
    goto LABEL_8;
  }

  sub_185F43818();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v17, @"A switch was already initiated", v18, v19, v20, v21, v22, v23, v28[0]);

  unint64_t v24 = 5LL;
LABEL_6:
  sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v6)[2](v6, v25);
LABEL_9:
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v93[0] = MEMORY[0x1895F87A8];
  v93[1] = 3221225472LL;
  v93[2] = (uint64_t)sub_185F4133C;
  v93[3] = (uint64_t)&unk_189DD49F0;
  v93[4] = (uint64_t)self;
  id v17 = v16;
  id v94 = v17;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x186E2FEC4](v93);
  if (!objc_msgSend_isSharedIPad(self, v19, v20, v21))
  {
    uint64_t v32 = sub_185F436A0();
    v39 = (void *)v32;
    uint64_t v40 = @"NOT IN MULTISUER/LOGINUSER directswitch not Supported";
    goto LABEL_5;
  }

  objc_msgSend_currentUser(self, v22, v23, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  int isLoginUser = objc_msgSend_isLoginUser(v25, v26, v27, v28);

  if (isLoginUser)
  {
    uint64_t v32 = sub_185F436A0();
    v39 = (void *)v32;
    uint64_t v40 = @"directswitch from LoginUI User notsupported";
LABEL_5:
    sub_185F43A40(v32, v40, v33, v34, v35, v36, v37, v38, v93[0]);

    unint64_t v41 = 0LL;
LABEL_6:
    sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v41);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  if (!objc_msgSend_userExists_(self, v30, (uint64_t)v12, v31))
  {
    sub_185F436A0();
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40((uint64_t)v52, @"directswitch non existing user", v53, v54, v55, v56, v57, v58, v93[0]);

    unint64_t v41 = 2LL;
    goto LABEL_6;
  }

  if (self)
  {
    BOOL switchIsOccurring = self->_switchIsOccurring;
    uint64_t v44 = sub_185F436A0();
    uint64_t v51 = (void *)v44;
    if (switchIsOccurring)
    {
      sub_185F43A40(v44, @"switch(from directswitch) was already initiated", v45, v46, v47, v48, v49, v50, v93[0]);

      unint64_t v41 = 5LL;
      goto LABEL_6;
    }

    sub_185F46CA8( (uint64_t)&OBJC_CLASS___UMLogMessage,  v12,  @"DirectSwitch to user",  v46,  v47,  v48,  v49,  v50,  v93[0]);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v51, v59);

    self->_BOOL switchIsOccurring = 1;
  }

  else
  {
    sub_185F436A0();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F46CA8( (uint64_t)&OBJC_CLASS___UMLogMessage,  v12,  @"DirectSwitch to user",  v87,  v88,  v89,  v90,  v91,  v93[0]);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v86, v92);
  }

  sub_185F3B034((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v12, v13);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F436A0();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v12, @"loaduser NO ERROR", v60, v61, v62, v63, v64, v93[0]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v65, v67);

    v71 = (void *)objc_msgSend_mutableCopy(v12, v68, v69, v70);
    objc_msgSend_setDebugErrorCausingLogout_(v71, v72, 0, v73);
    objc_msgSend_commitChanges(v71, v74, v75, v76);
    sub_185F436A0();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F46CA8( (uint64_t)&OBJC_CLASS___UMLogMessage,  v12,  @"calling xpcserver direct switch user",  v78,  v79,  v80,  v81,  v82,  v93[0]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v77, v83);

    sub_185F4773C();
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_directSwitchToUser_passcodeData_context_preferences_completionHandler_( v84,  v85,  (uint64_t)v12,  (uint64_t)v13,  v14,  v15,  v18);

    goto LABEL_8;
  }

  sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v12, @"load user failed", v60, v61, v62, v63, v64, v93[0]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v65, v66);

LABEL_7:
  ((void (**)(void, void *))v18)[2](v18, v42);
LABEL_8:
}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginUICheckInWithCompletionHandler_(v6, v4, (uint64_t)v3, v5);
}

- (void)registerUserSwitchStakeHolder:(id)a3
{
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  id v24 = a3;
  id v6 = (void (**)(id, void))a4;
  sub_185F43818();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v7, @"Register user switch stakeholder", v8, v9, v10, v11, v12, v13, v23);

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ does not implement necessary stakeholder methods",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v24);
  }
  if (objc_msgSend_isSharedIPad(self, v14, v15, v16))
  {
    sub_185F4773C();
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerUserSwitchStakeHolder_completionHandler_(v21, v22, (uint64_t)v24, (uint64_t)v6);
  }

  else if (v6)
  {
    v6[2](v6, 0LL);
  }
}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  sub_185F43818();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v6, @"Register user sync stakeholder", v7, v8, v9, v10, v11, v12, v21);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ does not implement necessary stakeholder methods",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v22);
  }
  sub_185F4773C();
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(v19, v20, (uint64_t)v22, (uint64_t)v5);
}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  sub_185F4773C();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterStakeHolder_status_reason_(v10, v9, (uint64_t)v8, a4, v7);
}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  uint64_t v18 = (void (**)(void))a3;
  sub_185F43818();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v4, @"Terminate sync", v5, v6, v7, v8, v9, v10, v17);

  if (objc_msgSend_isSharedIPad(self, v11, v12, v13))
  {
    sub_185F4773C();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_terminateSyncWithCompletionHandler_(v14, v15, (uint64_t)v18, v16);
  }

  else if (v18)
  {
    v18[2]();
  }
}

- (void)resumeSync
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"Resume sync", v4, v5, v6, v7, v8, v9, v16);

  if (objc_msgSend_isSharedIPad(self, v10, v11, v12))
  {
    sub_185F4773C();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resumeSync(v17, v13, v14, v15);
  }

- (UMUserPersona)currentPersona
{
  return sub_185F39EE8();
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
}

- (void)createUserPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  sub_185F4773C();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4CF54((uint64_t)v12, v11, v10, a5, v9);
}

- (void)deleteUserPersonaWithIDString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteUserPersonaWithPersonaUniqueString:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1895F89C0];
  uint64_t v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a3;
  uint64_t v7 = (void *)MEMORY[0x189603F68];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, (uint64_t)&v14, 1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F4D0EC((uint64_t)v13, v12, (uint64_t)v9, v8);
}

- (void)deleteUserPersonaWithType:(int)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)MEMORY[0x189607968];
  id v8 = a5;
  id v9 = a4;
  objc_msgSend_numberWithInt_(v7, v10, v6, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = kUMUserPersonaTypeKey;
  v17[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v13, (uint64_t)v17, (uint64_t)&v16, 1);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D0EC((uint64_t)v15, v14, (uint64_t)v9, v8);
}

- (void)deleteUserPersonaWithProfileInfo:(id)a3 passcodeData:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  sub_185F4773C();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4D0EC((uint64_t)v10, v9, (uint64_t)v8, v7);
}

- (void)disableUserPersonaWithProfileInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  sub_185F4773C();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4D25C((uint64_t)v7, v6, v5);
}

- (void)fetchPersonaWithIDString:(id)a3 CompletionHandler:(id)a4
{
}

- (void)fetchPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, (uint64_t)&v11, 1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F4DBE8((uint64_t)v10, v9, v6);
}

- (void)fetchPersonaWithType:(int)a3 CompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189607968];
  id v6 = a4;
  objc_msgSend_numberWithInt_(v5, v7, v4, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = kUMUserPersonaTypeKey;
  v14[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v10, (uint64_t)v14, (uint64_t)&v13, 1);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4DBE8((uint64_t)v12, v11, v6);
}

- (void)fetchAllPersonasWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4D3CC((uint64_t)v4, v3);
}

- (void)fetchAllPersonasForAllUsersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4D524((uint64_t)v4, v3);
}

- (void)fetchAsidMapOfAllUsersWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4E374((uint64_t)v4, v3);
}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaWithIDString:(id)a4 completionHandler:(id)a5
{
}

- (void)setBundlesIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1895F89C0];
  uint64_t v14 = kUMUserPersonaUniqueStringKey;
  v15[0] = a4;
  id v7 = (void *)MEMORY[0x189603F68];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v11, (uint64_t)v15, (uint64_t)&v14, 1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F4E4CC((uint64_t)v13, v10, v12, v8);
}

- (void)setBundlesIdentifiers:(id)a3 forUniquePersonaType:(int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v17[1] = *MEMORY[0x1895F89C0];
  id v7 = (void *)MEMORY[0x189607968];
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_numberWithInt_(v7, v10, v5, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = kUMUserPersonaTypeKey;
  v17[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v13, (uint64_t)v17, (uint64_t)&v16, 1);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4E4CC((uint64_t)v15, v9, v14, v8);
}

- (void)setMultiPersonaBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  sub_185F4773C();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4EB94((uint64_t)v7, v6, v5);
}

- (void)fetchBundleIdentifierForPersonaWithIDString:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchBundleIdentifierForPersonaWithPersonaUniqueString:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = kUMUserPersonaUniqueStringKey;
  v12[0] = a3;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v12, (uint64_t)&v11, 1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_185F4EA20((uint64_t)v10, v9, v6);
}

- (void)fetchBundleIdentifierForType:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189607968];
  id v6 = a4;
  objc_msgSend_numberWithInt_(v5, v7, v4, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = kUMUserPersonaTypeKey;
  v14[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v10, (uint64_t)v14, (uint64_t)&v13, 1);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4773C();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4EA20((uint64_t)v12, v11, v6);
}

- (void)fetchMultiPersonaBundleIdentifierWithcompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F4ED04((uint64_t)v4, v3);
}

- (id)bundleIdentifiersforPersonaWithPersonaUniqueString:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_isSharedIPad(self, v7, v8, v9))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607688], 45, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    sub_185F4773C();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = 0LL;
    sub_185F4EE5C(v13, v6, &v15);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v15;

    if (!a4) {
      goto LABEL_7;
    }
  }

  if (v11) {
    *a4 = v11;
  }
LABEL_7:

  return v12;
}

- (BOOL)setBundleIdentifiers:(id)a3 forPersonaWithPersonaUniqueString:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_isSharedIPad(self, v10, v11, v12))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    sub_185F4773C();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = 0LL;
    BOOL v15 = sub_185F4E650(v16, v8, v9, &v18);
    id v14 = v18;

    if (!a5) {
      goto LABEL_7;
    }
  }

  if (v14) {
    *a5 = v14;
  }
LABEL_7:

  return v15;
}

- (id)listAllPersonaAttributesWithError:(id *)a3
{
  id v4 = a3;
  uint64_t v78 = *MEMORY[0x1895F89C0];
  if (a3) {
    *a3 = 0LL;
  }
  if (objc_msgSend_isSharedIPad(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], 45, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }

  sub_185F4773C();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v76 = 0LL;
  sub_185F4D67C(v7, &v76);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v76;

  if (!v8)
  {
LABEL_25:
    id obj = 0LL;
    id v22 = 0LL;
    id v65 = (id)MEMORY[0x189604A58];
    if (!v4) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }

  uint64_t v68 = (uint64_t)v4;
  uint64_t v12 = (void *)MEMORY[0x189603FA8];
  uint64_t v13 = objc_msgSend_count(v8, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v12, v14, v13, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id obj = v8;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v72, (uint64_t)v77, 16);
  if (v18)
  {
    uint64_t v21 = v18;
    id v22 = 0LL;
    uint64_t v23 = *(void *)v73;
    id v24 = &kUMUserSessionCloudLoginTimeStampKey;
LABEL_8:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v73 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * v25);
      objc_msgSend_objectForKeyedSubscript_(v26, v19, (uint64_t)kUMUserPersonaUniqueStringKey, v20);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27) {
        break;
      }
      objc_msgSend_objectForKeyedSubscript_(v26, v28, v24[58], v29);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend_objectForKeyedSubscript_(v26, v37, v24[58], v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v43 = v39;
        if (v39)
        {
          int v44 = objc_msgSend_integerValue(v39, v40, v41, v42);
          id v70 = v6;
          uint64_t v46 = objc_msgSend_personaAttributesForPersonaType_withError_( UMUserPersonaAttributes,  v45,  v44,  (uint64_t)&v70);
          id v33 = v70;

          if (!v46)
          {

LABEL_30:
            id v22 = 0LL;
            id v65 = (id)MEMORY[0x189604A58];
            id v6 = v33;
            goto LABEL_31;
          }

          objc_msgSend_addObject_(v16, v47, v46, v48);
          id v22 = (void *)v46;
          id v6 = v33;
        }

        else
        {
          sub_185F436A0();
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Invalid Persona type",  v58,  v59,  v60,  v61,  v62,  v63,  v68);
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
          sub_185F43A98((uint64_t)v57, v64);
        }

        goto LABEL_21;
      }

      sub_185F436A0();
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Invalid Persona attrib",  v50,  v51,  v52,  v53,  v54,  v55,  v68);
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v49, v56);

LABEL_22:
      if (v21 == ++v25)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v72, (uint64_t)v77, 16);
        if (v21) {
          goto LABEL_8;
        }
        goto LABEL_28;
      }
    }

    objc_msgSend_objectForKeyedSubscript_(v26, v28, (uint64_t)kUMUserPersonaUniqueStringKey, v29);
    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v71 = v6;
    uint64_t v32 = objc_msgSend_personaAttributesForPersonaUniqueString_withError_( UMUserPersonaAttributes,  v31,  (uint64_t)v30,  (uint64_t)&v71);
    id v33 = v71;

    if (!v32) {
      goto LABEL_30;
    }
    objc_msgSend_addObject_(v16, v34, v32, v35);
    id v6 = v33;
    id v22 = (void *)v32;
LABEL_21:
    id v24 = (void *)&kUMUserSessionCloudLoginTimeStampKey;
    goto LABEL_22;
  }

  id v22 = 0LL;
LABEL_28:

  id v65 = v16;
LABEL_31:
  id v4 = (id *)v68;

  if (v68)
  {
LABEL_32:
    if (v6) {
      *id v4 = v6;
    }
  }

- (unint64_t)personaGenerationIdentifierWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = sub_185F36A7C((uint64_t)v4, a3);

  return v5;
}

- (id)listAllPersonaWithAttributes
{
  int v4 = 4;
  while (1)
  {
    objc_msgSend_listAllPersonaAttributesWithError_(self, a2, 0, v2);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v5) {
      break;
    }
  }

  id v7 = v5;
LABEL_6:

  return v6;
}

- (BOOL)haveValidPersonaContextForIDString:(id)a3
{
  return ((uint64_t (*)(UMUserManager *, char *, id))MEMORY[0x189616718])( self,  sel_haveValidPersonaContextForPersonaUniqueString_,  a3);
}

- (BOOL)haveValidPersonaContextForPersonaUniqueString:(id)a3
{
  id v4 = a3;
  objc_msgSend_currentPersona(self, v5, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend_userPersonaUniqueString(v8, v9, v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = objc_msgSend_compare_(v13, v14, (uint64_t)v4, v15) == 0;
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)personaLoginWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  if (a5)
  {
    *a5 = 0LL;
    id v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 45, 0);
    *a5 = v6;
  }

  return 0;
}

- (BOOL)personaLogoutWithUserODuuid:(id)a3 withUid:(unsigned int)a4 WithError:(id *)a5
{
  if (a5)
  {
    *a5 = 0LL;
    id v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], a2, *MEMORY[0x189607688], 45, 0);
    *a5 = v6;
  }

  return 0;
}

- (void)registerPersonaListUpdateObserver:(id)a3 completionHandler:(id)a4
{
}

- (void)registerPersonaListUpdateObserver:(id)a3 withMachService:(id)a4 completionHandler:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  sub_185F43818();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Registering registerPersonaListUpdateObserver",  v11,  v12,  v13,  v14,  v15,  v16,  v28);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v10, v17);

  if (objc_msgSend_isSharedIPad(self, v18, v19, v20))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ does not implement necessary observer methods",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v29);
    }
    sub_185F4773C();
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4FD58(v27, v29, v8, v9);
  }
}

- (void)setupUMUserSessionProvisioning:(id)a3 WithCompletionHandler:(id)a4
{
  id v4 = (void (**)(id, void, id))a4;
  sub_185F43818();
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"TVOS: Provisioning TV for multiuser",  v6,  v7,  v8,  v9,  v10,  v11,  v14);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v5, v12);

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0LL, v15);
}

- (BOOL)migrateSharedAndPrimaryUserVolumeWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Migration of SDV & User volume  Requested",  v5,  v6,  v7,  v8,  v9,  v10,  v24);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v4, v11);

  id v26 = 0LL;
  int v12 = sub_185F3C49C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, &v26);
  id v13 = v26;
  sub_185F436A0();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v21 = @"Migration of SDV & User volume  Completed";
  }

  else
  {
    uint64_t v25 = (uint64_t)v13;
    uint64_t v21 = @"Migration of SDV & User volume  failed with error:%@";
  }

  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v25);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v20, v22);

  if (a3) {
    *a3 = v13;
  }

  return v12;
}

- (BOOL)migrateGuestUserVolume:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  sub_185F436A0();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Migration of PersonaVolume of Persona:%@ requested",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v6, v13);

  id v27 = 0LL;
  int v14 = sub_185F3C714((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v5, &v27);

  id v15 = v27;
  sub_185F436A0();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    uint64_t v23 = @"Migration of PersonaVolume  Completed";
  }

  else
  {
    uint64_t v26 = (uint64_t)v15;
    uint64_t v23 = @"Migration of PersonaVolume failed with error:%@";
  }

  sub_185F468A0((uint64_t)&OBJC_CLASS___UMLogMessage, v23, v16, v17, v18, v19, v20, v21, v26);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A98((uint64_t)v22, v24);

  if (a4) {
    *a4 = v15;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (NSArray)allUsers
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_185F42E2C;
  uint64_t v11 = sub_185F42E3C;
  id v12 = 0LL;
  sub_185F3663C();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = sub_185F42E44;
  v6[3] = &unk_189DD4A18;
  v6[4] = &v7;
  sub_185F3681C((uint64_t)v3, self, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)allUsersUnfiltered
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_185F42E2C;
  uint64_t v11 = sub_185F42E3C;
  id v12 = 0LL;
  sub_185F3663C();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = sub_185F42FA4;
  v6[3] = &unk_189DD4A18;
  v6[4] = &v7;
  sub_185F3681C((uint64_t)v3, self, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)userExists:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  objc_msgSend_allUsers(self, v5, v6, v7, 0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend_isEqualToUser_(*(void **)(*((void *)&v16 + 1) + 8 * i), v10, (uint64_t)v4, v11))
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }

- (id)keybagOpaqueDataForUser:(id)a3 withError:(id *)a4
{
  return sub_185F3D79C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, a3, a4);
}

- (BOOL)setKeybagOpaqueDataForUser:(id)a3 withOpaqueData:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_userExists_(self, v10, (uint64_t)v8, v11))
  {
    char v13 = sub_185F3DB8C((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v8, v9, a5);
    id v14 = 0LL;
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v12, *MEMORY[0x189607688], 2, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    char v13 = 0;
    if (a5 && v14)
    {
      id v14 = v14;
      char v13 = 0;
      *a5 = v14;
    }
  }

  return v13;
}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  id v20 = a3;
  sub_185F43818();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v3, @"Register critical user switch stakeholder", v4, v5, v6, v7, v8, v9, v19);

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0) {
    sub_185F384F8( (uint64_t)&OBJC_CLASS___UMAbort,  @"%@ does not implement necessary stakeholder methods",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v20);
  }
  sub_185F4773C();
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerCriticalUserSwitchStakeHolder_(v16, v17, (uint64_t)v20, v18);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v63 = MEMORY[0x1895F87A8];
  uint64_t v64 = 3221225472LL;
  id v65 = sub_185F4356C;
  id v66 = &unk_189DD49F0;
  v67 = self;
  id v17 = v16;
  id v68 = v17;
  uint64_t v18 = (void (**)(void, void))MEMORY[0x186E2FEC4](&v63);
  if (objc_msgSend_isSharedIPad(self, v19, v20, v21))
  {
    objc_msgSend_currentUser(self, v22, v23, v24, v63, v64, v65, v66, v67);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    int isLoginUser = objc_msgSend_isLoginUser(v25, v26, v27, v28);

    if (!isLoginUser)
    {
      unint64_t v42 = 0LL;
      goto LABEL_12;
    }
  }

  if (!objc_msgSend_isSharedIPad(self, v22, v23, v24, v63)
    || !objc_msgSend_isLoginUser(v12, v30, v31, v32))
  {
    if (objc_msgSend_userExists_(self, v30, (uint64_t)v12, v32))
    {
      if (self)
      {
        BOOL switchIsOccurring = self->_switchIsOccurring;
        uint64_t v34 = sub_185F43760();
        uint64_t v41 = (void *)v34;
        if (switchIsOccurring)
        {
          sub_185F43A40(v34, @"A switch was already initiated", v35, v36, v37, v38, v39, v40, v63);

          unint64_t v42 = 5LL;
LABEL_12:
          sub_185F37354((uint64_t)&OBJC_CLASS___UMError, v42);
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }

        sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v12, @"Switch to user", v36, v37, v38, v39, v40, v63);
        int v44 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v41, v44);

        self->_BOOL switchIsOccurring = 1;
      }

      else
      {
        sub_185F43760();
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F46CA8((uint64_t)&OBJC_CLASS___UMLogMessage, v12, @"Switch to user", v57, v58, v59, v60, v61, v63);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v56, v62);
      }

      sub_185F3B034((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v12, v13);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        uint64_t v48 = (void *)objc_msgSend_mutableCopy(v12, v45, v46, v47);
        objc_msgSend_setDebugErrorCausingLogout_(v48, v49, 0, v50);
        objc_msgSend_commitChanges(v48, v51, v52, v53);
        sub_185F4773C();
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_( v54,  v55,  (uint64_t)v12,  (uint64_t)v13,  v14,  v15,  v18);

        goto LABEL_14;
      }

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v3 = a3;
  sub_185F4773C();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_suspendQuotasWithCompletionHandler_(v6, v4, (uint64_t)v3, v5);
}

- (void)resumeQuotas
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resumeQuotas(v5, v2, v3, v4);
}

- (void)userInteractionIsEnabled
{
  if (objc_msgSend_isSharedIPad(self, a2, v2, v3))
  {
    sub_185F4773C();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userInteractionIsEnabled(v7, v4, v5, v6);
  }

- (id)currentUserSwitchContext
{
  return sub_185F3A96C();
}

- (void)currentUserSwitchContextHasBeenUsed
{
}

@end