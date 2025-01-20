@interface UMUser
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
- (BOOL)hasDataToSync;
- (BOOL)hasManagedCredentials;
- (BOOL)inFirstLoginSession;
- (BOOL)isAdminUser;
- (BOOL)isAuditor;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUser:(id)a3;
- (BOOL)isLoginUser;
- (BOOL)isPrimaryUser;
- (BOOL)isTransientUser;
- (BOOL)shouldFetchAttributes;
- (NSArray)allUserPersonas;
- (NSArray)languages;
- (NSDate)creationDate;
- (NSDate)firstLoginEndDate;
- (NSDate)firstLoginStartDate;
- (NSDate)lastCachedLoginEndDate;
- (NSDate)lastCachedLoginStartDate;
- (NSDate)lastLoginDate;
- (NSDate)lastLogoutEndDate;
- (NSDate)lastLogoutStartDate;
- (NSDate)lastRemoteAuthDate;
- (NSError)debugErrorCausingLogout;
- (NSError)errorCausingLogout;
- (NSString)alternateDSID;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)userAuxiliaryString;
- (NSString)username;
- (NSURL)homeDirectoryURL;
- (NSURL)photoURL;
- (UMUser)init;
- (double)passcodeBackOffInterval;
- (id)_photo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)userPersonaFromIdentityString:(id)a3;
- (unint64_t)dataQuota;
- (unint64_t)dataUsed;
- (unint64_t)passcodeLockGracePeriod;
- (unint64_t)passcodeType;
- (unint64_t)userType;
- (unsigned)gid;
- (unsigned)uid;
- (void)refetchUser;
- (void)setAlternateDSID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDataQuota:(unint64_t)a3;
- (void)setDataUsed:(unint64_t)a3;
- (void)setDebugErrorCausingLogout:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setErrorCausingLogout:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setFirstLoginEndDate:(id)a3;
- (void)setFirstLoginStartDate:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setGivenName:(id)a3;
- (void)setHasDataToSync:(BOOL)a3;
- (void)setHasManagedCredentials:(BOOL)a3;
- (void)setHomeDirectoryURL:(id)a3;
- (void)setIsAdminUser:(BOOL)a3;
- (void)setIsAuditor:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsLoginUser:(BOOL)a3;
- (void)setIsPrimaryUser:(BOOL)a3;
- (void)setIsTransientUser:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setLastCachedLoginEndDate:(id)a3;
- (void)setLastCachedLoginStartDate:(id)a3;
- (void)setLastLoginDate:(id)a3;
- (void)setLastLogoutEndDate:(id)a3;
- (void)setLastLogoutStartDate:(id)a3;
- (void)setLastRemoteAuthDate:(id)a3;
- (void)setPasscodeLockGracePeriod:(unint64_t)a3;
- (void)setPasscodeType:(unint64_t)a3;
- (void)setPhotoURL:(id)a3;
- (void)setShouldFetchAttributes:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUserAuxiliaryString:(id)a3;
- (void)setUsername:(id)a3;
- (void)set_photo:(id)a3;
@end

@implementation UMUser

- (UMUser)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UMUser;
  result = -[UMUser init](&v3, sel_init);
  if (result)
  {
    result->_passcodeType = 3LL;
    result->_shouldFetchAttributes = 1;
  }

  return result;
}

- (unsigned)gid
{
  return self->_gid;
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSURL)photoURL
{
  return self->_photoURL;
}

- (NSString)userAuxiliaryString
{
  return self->_userAuxiliaryString;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (NSDate)lastRemoteAuthDate
{
  return self->_lastRemoteAuthDate;
}

- (BOOL)isLoginUser
{
  return self->_isLoginUser;
}

- (BOOL)isAuditor
{
  return self->_isAuditor;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (BOOL)isTransientUser
{
  return self->_isTransientUser;
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (BOOL)isAdminUser
{
  return self->_isAdminUser;
}

- (BOOL)inFirstLoginSession
{
  return !self->_firstLoginEndDate || !self->_lastCachedLoginStartDate;
}

- (unint64_t)passcodeLockGracePeriod
{
  return self->_passcodeLockGracePeriod;
}

- (NSArray)languages
{
  return self->_languages;
}

- (BOOL)hasManagedCredentials
{
  return self->_hasManagedCredentials;
}

- (NSError)errorCausingLogout
{
  return self->_errorCausingLogout;
}

- (NSError)debugErrorCausingLogout
{
  return self->_debugErrorCausingLogout;
}

- (unint64_t)passcodeType
{
  return self->_passcodeType;
}

- (NSDate)firstLoginStartDate
{
  return self->_firstLoginStartDate;
}

- (NSDate)firstLoginEndDate
{
  return self->_firstLoginEndDate;
}

- (NSDate)lastCachedLoginStartDate
{
  return self->_lastCachedLoginStartDate;
}

- (NSDate)lastCachedLoginEndDate
{
  return self->_lastCachedLoginEndDate;
}

- (NSDate)lastLogoutStartDate
{
  return self->_lastLogoutStartDate;
}

- (NSDate)lastLogoutEndDate
{
  return self->_lastLogoutEndDate;
}

- (double)passcodeBackOffInterval
{
  return sub_185F3B3F4((uint64_t)&OBJC_CLASS___UMMobileKeyBag, self);
}

- (BOOL)hasDataToSync
{
  return self->_hasDataToSync;
}

- (unint64_t)dataQuota
{
  int v5 = objc_msgSend_uid(self, a2, v2, v3);
  if (v5 == getuid())
  {
    p_dataQuota = (unint64_t *)v11;
    sub_185F54F20(self, v6, v7, v8, (uint64_t)v11);
  }

  else
  {
    sub_185F548EC(self, 0LL);
    p_dataQuota = &self->_dataQuota;
  }

  return *p_dataQuota;
}

- (unint64_t)dataUsed
{
  int v5 = objc_msgSend_uid(self, a2, v2, v3);
  if (v5 == getuid())
  {
    sub_185F54F20(self, v6, v7, v8, (uint64_t)&v11);
    p_dataUsed = (unint64_t *)&v12;
  }

  else
  {
    sub_185F548EC(self, 0LL);
    p_dataUsed = &self->_dataUsed;
  }

  return *p_dataUsed;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  if (!self->_displayName)
  {
    objc_msgSend_givenName(self, a2, v2, v3);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_5:
      v10 = (void *)objc_opt_new();
      objc_msgSend_givenName(self, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGivenName_(v10, v15, (uint64_t)v14, v16);

      objc_msgSend_familyName(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFamilyName_(v10, v21, (uint64_t)v20, v22);

      objc_msgSend_localizedStringFromPersonNameComponents_style_options_( MEMORY[0x1896079A8],  v23,  (uint64_t)v10,  0,  0);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      displayName = self->_displayName;
      self->_displayName = v24;

      return self->_displayName;
    }

    objc_msgSend_familyName(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9) {
      goto LABEL_5;
    }
  }

  return self->_displayName;
}

- (unint64_t)userType
{
  return sub_185F39008();
}

- (id)description
{
  int v5 = (void *)NSString;
  uint64_t v6 = objc_msgSend_uid(self, a2, v2, v3);
  return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)@"%p(UID: %d)", v8, self, v6);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UMUser *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4) {
      char isEqualToUser = 1;
    }
    else {
      char isEqualToUser = objc_msgSend_isEqualToUser_(self, v5, (uint64_t)v4, v6);
    }
  }

  else
  {
    char isEqualToUser = 0;
  }

  return isEqualToUser;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_alternateDSID(self, v5, v6, v7);
  if (v8
    && (uint64_t v12 = (void *)v8,
        objc_msgSend_alternateDSID(v4, v9, v10, v11),
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend_alternateDSID(self, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_alternateDSID(v4, v15, v16, v17);
  }

  else
  {
    uint64_t v21 = objc_msgSend_username(self, v9, v10, v11);
    if (!v21
      || (v25 = (void *)v21,
          objc_msgSend_username(v4, v22, v23, v24),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v26,
          v25,
          !v26))
    {
      int v32 = objc_msgSend_uid(self, v22, v23, v24);
      char isEqualToString = v32 == objc_msgSend_uid(v4, v33, v34, v35);
      goto LABEL_9;
    }

    objc_msgSend_username(self, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_username(v4, v27, v28, v29);
  }

  v30 = (void *)v18;
  char isEqualToString = objc_msgSend_isEqualToString_(v14, v19, v18, v20);

LABEL_9:
  return isEqualToString;
}

- (void)refetchUser
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40( (uint64_t)v3,  @"Force Marking UMUser with UID:%d to refetch Attributes on next access",  v4,  v5,  v6,  v7,  v8,  v9,  self->_uid);

  self->_shouldFetchAttributes = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_opt_new();
  sub_185F5540C((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_opt_new();
  sub_185F5540C((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return ((uint64_t (*)(UMUser *, char *, void))MEMORY[0x189616718])(self, sel_commitChangesWithError_, 0LL);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = sub_185F3E1B4((uint64_t)&OBJC_CLASS___UMMobileKeyBag, v4, a3);
  objc_sync_exit(v4);

  return (char)a3;
}

- (NSArray)allUserPersonas
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v2, (uint64_t)v4, v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return (NSArray *)v5;
}

- (id)userPersonaFromIdentityString:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)@"DEADDEAD-DEAD-DEAD-DEAD-DEADDEADDEAD", v3))
  {
    sub_185F39EE8();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setAlternateDSID:(id)a3
{
}

- (void)setHomeDirectoryURL:(id)a3
{
}

- (void)setUsername:(id)a3
{
}

- (void)setGivenName:(id)a3
{
}

- (void)setFamilyName:(id)a3
{
}

- (void)setPhotoURL:(id)a3
{
}

- (void)setUserAuxiliaryString:(id)a3
{
}

- (void)setCreationDate:(id)a3
{
}

- (void)setLastLoginDate:(id)a3
{
}

- (void)setLastRemoteAuthDate:(id)a3
{
}

- (void)setPasscodeType:(unint64_t)a3
{
  self->_passcodeType = a3;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setIsTransientUser:(BOOL)a3
{
  self->_isTransientUser = a3;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (void)setPasscodeLockGracePeriod:(unint64_t)a3
{
  self->_passcodeLockGracePeriod = a3;
}

- (void)setLanguages:(id)a3
{
}

- (void)setHasManagedCredentials:(BOOL)a3
{
  self->_hasManagedCredentials = a3;
}

- (void)setDataQuota:(unint64_t)a3
{
  self->_dataQuota = a3;
}

- (void)setDataUsed:(unint64_t)a3
{
  self->_dataUsed = a3;
}

- (void)setHasDataToSync:(BOOL)a3
{
  self->_hasDataToSync = a3;
}

- (void)setErrorCausingLogout:(id)a3
{
}

- (id)_photo
{
  return self->__photo;
}

- (void)set_photo:(id)a3
{
}

- (BOOL)shouldFetchAttributes
{
  return self->_shouldFetchAttributes;
}

- (void)setShouldFetchAttributes:(BOOL)a3
{
  self->_shouldFetchAttributes = a3;
}

- (void)setFirstLoginStartDate:(id)a3
{
}

- (void)setFirstLoginEndDate:(id)a3
{
}

- (void)setLastCachedLoginStartDate:(id)a3
{
}

- (void)setLastCachedLoginEndDate:(id)a3
{
}

- (void)setLastLogoutStartDate:(id)a3
{
}

- (void)setLastLogoutEndDate:(id)a3
{
}

- (void)setDebugErrorCausingLogout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end