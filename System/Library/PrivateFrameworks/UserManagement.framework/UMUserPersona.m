@interface UMUserPersona
+ (BOOL)currentPersonaMatchesPath:(id)a3;
+ (id)currentPersona;
- (BOOL)commitChanges;
- (BOOL)commitChangesWithError:(id *)a3;
- (BOOL)isDataSeparatedPersona;
- (BOOL)isDefaultPersona;
- (BOOL)isDisabled;
- (BOOL)isEnterprisePersona;
- (BOOL)isEqualToPersona:(id)a3;
- (BOOL)isGuestPersona;
- (BOOL)isPersonalPersona;
- (BOOL)isSystemPersona;
- (NSString)userPersonaNickName;
- (NSString)userPersonaUniqueString;
- (UMUserPersona)init;
- (id)copyCurrentPersonaContextWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createPersonaContextForBackgroundProcessingWithIdentityString:(id)a3;
- (id)createPersonaContextForBackgroundProcessingWithPersonaUniqueString:(id)a3;
- (id)generateAndRestorePersonaContextWithIdentityString:(id)a3;
- (id)generateAndRestorePersonaContextWithPersonaUniqueString:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)restorePersonaWithSavedPersonaContext:(id)a3;
- (unint64_t)userPersonaType;
- (unsigned)gid;
- (unsigned)uid;
- (void)setGid:(unsigned int)a3;
- (void)setIsDataSeparatedPersona:(BOOL)a3;
- (void)setIsDefaultPersona:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsEnterprisePersona:(BOOL)a3;
- (void)setIsGuestPersona:(BOOL)a3;
- (void)setIsPersonalPersona:(BOOL)a3;
- (void)setIsSystemPersona:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUserPersonaNickName:(id)a3;
- (void)setUserPersonaType:(unint64_t)a3;
- (void)setUserPersonaUniqueString:(id)a3;
@end

@implementation UMUserPersona

+ (id)currentPersona
{
  return (id)objc_opt_new();
}

+ (BOOL)currentPersonaMatchesPath:(id)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (v3)
  {
    if ((sub_185F38E68() & 1) == 0)
    {
      if (objc_msgSend_getCString_maxLength_encoding_(v3, v4, (uint64_t)v34, 1024, 4))
      {
        v5 = realpath_DARWIN_EXTSN(v34, 0LL);
        if (v5)
        {
          v6 = v5;
          uint64_t v57 = 0LL;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v52 = 0u;
          __int128 v51 = 0u;
          __int128 v50 = 0u;
          __int128 v49 = 0u;
          __int128 v48 = 0u;
          __int128 v47 = 0u;
          __int128 v46 = 0u;
          __int128 v45 = 0u;
          __int128 v44 = 0u;
          __int128 v43 = 0u;
          __int128 v42 = 0u;
          __int128 v41 = 0u;
          __int128 v40 = 0u;
          __int128 v39 = 0u;
          __int128 v38 = 0u;
          __int128 v37 = 0u;
          __int128 v36 = 0u;
          int v35 = 1;
          uint64_t current_persona = voucher_get_current_persona();
          if ((_DWORD)current_persona != -1)
          {
            uint64_t v10 = current_persona;
            if ((kpersona_info() & 0x80000000) != 0)
            {
              int v18 = *__error();
              sub_185F436A0();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v18);
              sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not get current persona Info for id:%d with error:%s",  v20,  v21,  v22,  v23,  v24,  v25,  v10);
LABEL_16:
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              sub_185F43A98((uint64_t)v19, v16);

              LOBYTE(v16) = 0;
              goto LABEL_19;
            }

            if (DWORD1(v36) == 2)
            {
              if ((kpersona_getpath() & 0x80000000) == 0)
              {
                objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)v33, v12);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15) {
                  LOBYTE(v16) = objc_msgSend_hasPrefix_(v3, v13, (uint64_t)v15, v14);
                }
                else {
                  LOBYTE(v16) = 0;
                }

                goto LABEL_19;
              }

              int v26 = *__error();
              sub_185F436A0();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v26);
              sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not get persona path for id:%d with error:%s",  v27,  v28,  v29,  v30,  v31,  v32,  v10);
              goto LABEL_16;
            }
          }

          LODWORD(v16) = objc_msgSend_hasPrefix_(v3, v8, (uint64_t)@"/private/var/PersonaVolumes", v9) ^ 1;
LABEL_19:
          free(v6);
          goto LABEL_12;
        }
      }
    }
  }

  LOBYTE(v16) = 0;
LABEL_12:

  return (char)v16;
}

- (UMUserPersona)init
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___UMUserPersona;
  v2 = -[UMUserPersona init](&v27, sel_init);
  if (v2)
  {
    char v3 = sub_185F38E68();
    uint64_t v35 = 0LL;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    memset(v34, 0, sizeof(v34));
    int v28 = 2;
    uint64_t current_persona = voucher_get_current_persona();
    if ((v3 & 1) == 0)
    {
      uint64_t v5 = current_persona;
      if ((_DWORD)current_persona != -1)
      {
        if ((kpersona_info() & 0x80000000) == 0)
        {
          int v6 = DWORD1(v29);
          *((_DWORD *)v2 + 6) = HIDWORD(v35);
          *((_DWORD *)v2 + 7) = -101;
          v2[23] = 0;
          switch(v6)
          {
            case 2:
              uint64_t v7 = 6LL;
              *(_DWORD *)(v2 + 17) = 0;
              *(_WORD *)(v2 + 21) = 257;
              v8 = (void *)*((void *)v2 + 5);
              uint64_t v9 = @"Guest";
              goto LABEL_12;
            case 4:
              uint64_t v7 = 3LL;
              *(_DWORD *)(v2 + 17) = 0x10000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((void *)v2 + 5);
              uint64_t v9 = @"System";
              goto LABEL_12;
            case 5:
              *(_WORD *)(v2 + 17) = 256;
              *(_DWORD *)(v2 + 19) = 0;
              uint64_t v21 = (void *)*((void *)v2 + 5);
              *((void *)v2 + 5) = @"Personal";
              *((void *)v2 + 6) = 0LL;

              goto LABEL_13;
            case 6:
              uint64_t v7 = 5LL;
              *(_DWORD *)(v2 + 17) = 0x1000000;
              *(_WORD *)(v2 + 21) = 0;
              v8 = (void *)*((void *)v2 + 5);
              uint64_t v9 = @"Default";
LABEL_12:
              *((void *)v2 + 5) = v9;
              *((void *)v2 + 6) = v7;

LABEL_13:
              uint64_t v24 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)v34 + 4, v23);
              uint64_t v20 = (void *)*((void *)v2 + 4);
              *((void *)v2 + 4) = v24;
              break;
            default:
              goto LABEL_8;
          }

          goto LABEL_14;
        }

        uint64_t v10 = __error();
        strerror(*v10);
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Could not get current persona Info for id:%d with error:%s",  v11,  v12,  v13,  v14,  v15,  v16,  v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F436A0();
        int v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_185F43A98((uint64_t)v18, v17);
      }
    }

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (NSString)userPersonaNickName
{
  return self->_userPersonaNickName;
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (id)copyCurrentPersonaContextWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  return objc_alloc_init(&OBJC_CLASS___UMUserPersonaContext);
}

- (id)restorePersonaWithSavedPersonaContext:(id)a3
{
  if (a3) {
    objc_msgSend_contextAdopt(a3, a2, (uint64_t)a3, v3);
  }
  return 0LL;
}

- (id)generateAndRestorePersonaContextWithIdentityString:(id)a3
{
  return (id)((uint64_t (*)(UMUserPersona *, char *, id))MEMORY[0x189616718])( self,  sel_generateAndRestorePersonaContextWithPersonaUniqueString_,  a3);
}

- (id)generateAndRestorePersonaContextWithPersonaUniqueString:(id)a3
{
  id v4 = a3;
  if (sub_185F38E68())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v5, *MEMORY[0x189607688], 45, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    uint64_t v15 = sub_185F565C0;
    uint64_t v16 = sub_185F565D0;
    id v17 = 0LL;
    sub_185F3654C();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = sub_185F565D8;
    v9[3] = &unk_189DD5490;
    id v10 = v4;
    uint64_t v11 = &v12;
    sub_185F3681C((uint64_t)v7, self, v9);

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (id)createPersonaContextForBackgroundProcessingWithIdentityString:(id)a3
{
  return (id)((uint64_t (*)(UMUserPersona *, char *, id))MEMORY[0x189616718])( self,  sel_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_,  a3);
}

- (id)createPersonaContextForBackgroundProcessingWithPersonaUniqueString:(id)a3
{
  id v3 = a3;
  if (sub_185F38E68())
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v4, *MEMORY[0x189607688], 45, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v26 = 0LL;
    sub_185F436A0();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"setup voucher for background work with account:%@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v3);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v6, v13);

    int v14 = mach_voucher_persona_self();
    if (!v14) {
      uint64_t v15 = (const char *)HIDWORD(v26);
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v15, *MEMORY[0x189607630], v14, 0);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F436A0();
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Failed to get existing mach voucher Port with error:%@",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v16);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A98((uint64_t)v17, v24);

    id v5 = v16;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_opt_new();
  sub_185F56948((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_opt_new();
  sub_185F56948((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return ((uint64_t (*)(UMUserPersona *, char *, void))MEMORY[0x189616718])( self,  sel_commitChangesWithError_,  0LL);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  return 0;
}

- (BOOL)isEqualToPersona:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v8 = objc_msgSend_userPersonaType(self, v5, v6, v7);
    if (v8 <= 6 && ((1LL << v8) & 0x69) != 0)
    {
      char v12 = 0;
      BOOL v13 = 1;
    }

    else
    {
      char v12 = 1;
      BOOL v13 = v8 != 1000;
    }

    unint64_t v15 = objc_msgSend_userPersonaType(v4, v9, v10, v11);
    if (v15 <= 6 && ((1LL << v15) & 0x69) != 0)
    {
      if ((v12 & 1) == 0)
      {
        objc_msgSend_userPersonaUniqueString(self, v16, v17, v18);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userPersonaUniqueString(v4, v21, v22, v23);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqualToString = objc_msgSend_isEqualToString_(v20, v25, (uint64_t)v24, v26);

        goto LABEL_15;
      }

      BOOL v19 = 1;
    }

    else
    {
      BOOL v19 = v15 != 1000;
    }

    char isEqualToString = !v13 && !v19;
  }

  else
  {
    char isEqualToString = 0;
  }

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (BOOL)isSystemPersona
{
  return self->_isSystemPersona;
}

- (void)setIsSystemPersona:(BOOL)a3
{
  self->_isSystemPersona = a3;
}

- (BOOL)isDefaultPersona
{
  return self->_isDefaultPersona;
}

- (void)setIsDefaultPersona:(BOOL)a3
{
  self->_isDefaultPersona = a3;
}

- (BOOL)isGuestPersona
{
  return self->_isGuestPersona;
}

- (void)setIsGuestPersona:(BOOL)a3
{
  self->_isGuestPersona = a3;
}

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setUserPersonaUniqueString:(id)a3
{
}

- (void)setUserPersonaNickName:(id)a3
{
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

- (void).cxx_destruct
{
}

@end