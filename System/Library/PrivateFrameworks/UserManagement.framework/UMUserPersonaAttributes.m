@interface UMUserPersonaAttributes
+ (id)currentContextIdentifier;
+ (id)personaAttributes;
+ (id)personaAttributesForPersonaType:(unint64_t)a3;
+ (id)personaAttributesForPersonaType:(unint64_t)a3 withError:(id *)a4;
+ (id)personaAttributesForPersonaUniqueString:(id)a3;
+ (id)personaAttributesForPersonaUniqueString:(id)a3 withError:(id *)a4;
+ (id)setUpPersonaAttributesWithDictionary:(id)a3;
- (BOOL)isDataSeparatedPersona;
- (BOOL)isDefaultPersona;
- (BOOL)isDisabled;
- (BOOL)isEnterprisePersona;
- (BOOL)isGuestPersona;
- (BOOL)isPersonalPersona;
- (BOOL)isSystemPersona;
- (BOOL)isUniversalPersona;
- (NSArray)userPersonaBundleIDList;
- (NSDate)creationDate;
- (NSDate)lastDisableDate;
- (NSDate)lastEnableDate;
- (NSDate)lastLoginDate;
- (NSString)userPersonaDisplayName;
- (NSString)userPersonaUniqueString;
- (NSURL)personaLayoutPathURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sandboxExtensionForPersonaLayoutPath;
- (unint64_t)userPersonaType;
- (unsigned)userPersona_id;
- (void)setCreationDate:(id)a3;
- (void)setIsDataSeparatedPersona:(BOOL)a3;
- (void)setIsDefaultPersona:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsEnterprisePersona:(BOOL)a3;
- (void)setIsGuestPersona:(BOOL)a3;
- (void)setIsPersonalPersona:(BOOL)a3;
- (void)setIsSystemPersona:(BOOL)a3;
- (void)setIsUniversalPersona:(BOOL)a3;
- (void)setLastDisableDate:(id)a3;
- (void)setLastEnableDate:(id)a3;
- (void)setLastLoginDate:(id)a3;
- (void)setPersonaLayoutPathURL:(id)a3;
- (void)setUserPersonaBundleIDList:(id)a3;
- (void)setUserPersonaDisplayName:(id)a3;
- (void)setUserPersonaType:(unint64_t)a3;
- (void)setUserPersonaUniqueString:(id)a3;
- (void)setUserPersona_id:(unsigned int)a3;
@end

@implementation UMUserPersonaAttributes

+ (id)personaAttributes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2 && (objc_msgSend_userPersonaUniqueString(v2, v3, v4, v5), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    objc_msgSend_personaAttributesForPersonaUniqueString_(UMUserPersonaAttributes, v3, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if (objc_msgSend_userPersonaType(v6, v3, v4, v5))
  {
    uint64_t v13 = objc_msgSend_userPersonaType(v6, v10, v11, v12);
    objc_msgSend_personaAttributesForPersonaType_(UMUserPersonaAttributes, v14, v13, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)setUpPersonaAttributesWithDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___UMUserPersonaAttributes);
    objc_msgSend_setPersonaLayoutPathURL_(v4, v5, 0, v6);
    objc_msgSend_objectForKeyedSubscript_(v3, v7, (uint64_t)kUMUserPersonaUniqueStringKey, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(v4, v10, (uint64_t)v9, v11);

    objc_msgSend_objectForKeyedSubscript_(v3, v12, (uint64_t)kUMUserPersonaIDKey, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    if (v14)
    {
      uint64_t v19 = objc_msgSend_integerValue(v14, v15, v16, v17);
      objc_msgSend_setUserPersona_id_(v4, v20, v19, v21);
    }

    objc_msgSend_objectForKeyedSubscript_(v3, v15, (uint64_t)kUMUserPersonaTypeKey, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    if (v22)
    {
      uint64_t v27 = objc_msgSend_integerValue(v22, v23, v24, v25);
      objc_msgSend_setUserPersonaType_(v4, v28, v27, v29);
    }

    else
    {
      objc_msgSend_setUserPersonaType_(v4, v23, 1000, v25);
    }

    objc_msgSend_setIsPersonalPersona_(v4, v30, 0, v31);
    objc_msgSend_setIsEnterprisePersona_(v4, v32, 0, v33);
    objc_msgSend_setIsUniversalPersona_(v4, v34, 0, v35);
    objc_msgSend_setIsSystemPersona_(v4, v36, 0, v37);
    objc_msgSend_setIsDefaultPersona_(v4, v38, 0, v39);
    objc_msgSend_setIsGuestPersona_(v4, v40, 0, v41);
    objc_msgSend_setIsDataSeparatedPersona_(v4, v42, 0, v43);
    if (objc_msgSend_userPersonaType(v4, v44, v45, v46))
    {
      if (objc_msgSend_userPersonaType(v4, v47, v48, v49) == 6)
      {
        objc_msgSend_setIsGuestPersona_(v4, v50, 1, v52);
        objc_msgSend_setIsDataSeparatedPersona_(v4, v53, 1, v54);
      }

      else if (objc_msgSend_userPersonaType(v4, v50, v51, v52) == 4)
      {
        objc_msgSend_setIsUniversalPersona_(v4, v57, 1, v59);
      }

      else if (objc_msgSend_userPersonaType(v4, v57, v58, v59) == 3)
      {
        objc_msgSend_setIsSystemPersona_(v4, v60, 1, v62);
      }

      else if (objc_msgSend_userPersonaType(v4, v60, v61, v62) == 5)
      {
        objc_msgSend_setIsDefaultPersona_(v4, v55, 1, v56);
      }
    }

    else
    {
      objc_msgSend_setIsPersonalPersona_(v4, v47, 1, v49);
    }

    objc_msgSend_setIsDisabled_(v4, v55, 0, v56);
    objc_msgSend_objectForKeyedSubscript_(v3, v63, (uint64_t)kUMUserPersonaDisabledKey, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v65;
    objc_msgSend_objectForKeyedSubscript_(v3, v66, (uint64_t)kUMUserPersonaDisplayNameKey, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaDisplayName_(v4, v71, (uint64_t)v70, v72);

    objc_msgSend_objectForKeyedSubscript_(v3, v73, (uint64_t)kUMUserPersonaBundleIDsKey, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaBundleIDList_(v4, v76, (uint64_t)v75, v77);

    objc_msgSend_objectForKeyedSubscript_(v3, v78, kUMUserSessionHomeDirKey, v79);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x189604030], v80, (uint64_t)v82, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPersonaLayoutPathURL_(v4, v84, (uint64_t)v83, v85);
    }

    objc_msgSend_objectForKeyedSubscript_(v3, v80, kUMUserSessionCreateTimeStampKey, v81);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v4, v87, (uint64_t)v86, v88);

    objc_msgSend_setLastEnableDate_(v4, v89, 0, v90);
    objc_msgSend_setLastDisableDate_(v4, v91, 0, v92);
    objc_msgSend_setLastLoginDate_(v4, v93, 0, v94);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaUniqueString_withError_(a1, a2, (uint64_t)a3, 0);
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3 withError:(id *)a4
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v7 = v5;
  if (a4) {
    *a4 = 0LL;
  }
  if (v5)
  {
    v34 = kUMUserPersonaUniqueStringKey;
    v35[0] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v6, (uint64_t)v35, (uint64_t)&v34, 1);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4773C();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    sub_185F4DD5C(v9, v8, &v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v33;

    if (!v11 && v10) {
      goto LABEL_6;
    }
    objc_msgSend_domain(v11, v12, v13, v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x189607688], v18))
    {
      uint64_t v22 = objc_msgSend_code(v11, v19, v20, v21);

      if (v22 == 2)
      {
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"No persona found with unique string %@",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v7);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = sub_185F436A0();
LABEL_13:
        uint64_t v31 = (void *)v30;
        sub_185F43A98(v30, v29);

        if (a4)
        {
          *a4 = v11;

          uint64_t v15 = 0LL;
          goto LABEL_15;
        }

        if (!v10)
        {
          uint64_t v15 = 0LL;
          v10 = v11;
          goto LABEL_16;
        }

+ (id)personaAttributesForPersonaType:(unint64_t)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaType_withError_(a1, a2, a3, 0);
}

+ (id)personaAttributesForPersonaType:(unint64_t)a3 withError:(id *)a4
{
  v35[1] = *MEMORY[0x1895F89C0];
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v6 = 0LL;
  if (a3 <= 6 && ((1LL << a3) & 0x59) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], a2, a3, (uint64_t)a4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = kUMUserPersonaTypeKey;
    v35[0] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v8, (uint64_t)v35, (uint64_t)&v34, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F4773C();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    sub_185F4DD5C(v10, v9, &v33);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v33;

    if (v11 && !v12)
    {
      objc_msgSend_setUpPersonaAttributesWithDictionary_(UMUserPersonaAttributes, v13, (uint64_t)v11, v15);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v6;
    }

    objc_msgSend_domain(v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x189607688], v18))
    {
      uint64_t v22 = objc_msgSend_code(v12, v19, v20, v21);

      if (v22 == 2)
      {
        sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"No persona found for the type %lu",  v23,  v24,  v25,  v26,  v27,  v28,  a3);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = sub_185F436A0();
LABEL_13:
        uint64_t v31 = (void *)v30;
        sub_185F43A98(v30, v29);

        if (a4) {
          *a4 = v12;
        }

        uint64_t v6 = 0LL;
        goto LABEL_16;
      }
    }

    else
    {
    }

    sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"personaAttributesForPersonaType for type:%lu failed with error %@",  v23,  v24,  v25,  v26,  v27,  v28,  a3);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = sub_185F438D0();
    goto LABEL_13;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_opt_new();
  sub_185F44698(v4, self);
  return v4;
}

+ (id)currentContextIdentifier
{
  int v2 = sub_185F38E68();
  objc_msgSend_sharedManager(UMUserManager, v3, v4, v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (!v2)
  {
    objc_msgSend_currentPersona(v6, v7, v8, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      uint64_t v19 = objc_msgSend_userPersonaUniqueString(v11, v20, v21, v22);
      goto LABEL_6;
    }

- (id)description
{
  uint64_t v5 = (void *)NSString;
  objc_msgSend_userPersonaUniqueString(self, a2, v2, v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_userPersona_id(self, v7, v8, v9);
  objc_msgSend_stringWithFormat_( v5,  v11,  (uint64_t)@"%p(Persona Unique String: %@, Persona ID:%d)",  v12,  self,  v6,  v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)sandboxExtensionForPersonaLayoutPath
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    sub_185F4773C();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userPersonaUniqueString(self, v7, v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F50688(v6, v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (void)setUserPersonaUniqueString:(id)a3
{
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

- (unsigned)userPersona_id
{
  return self->_userPersona_id;
}

- (void)setUserPersona_id:(unsigned int)a3
{
  self->_userPersona_id = a3;
}

- (NSURL)personaLayoutPathURL
{
  return self->_personaLayoutPathURL;
}

- (void)setPersonaLayoutPathURL:(id)a3
{
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (BOOL)isUniversalPersona
{
  return self->_isUniversalPersona;
}

- (void)setIsUniversalPersona:(BOOL)a3
{
  self->_isUniversalPersona = a3;
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

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSArray)userPersonaBundleIDList
{
  return self->_userPersonaBundleIDList;
}

- (void)setUserPersonaBundleIDList:(id)a3
{
}

- (NSString)userPersonaDisplayName
{
  return self->_userPersonaDisplayName;
}

- (void)setUserPersonaDisplayName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (void)setLastLoginDate:(id)a3
{
}

- (NSDate)lastDisableDate
{
  return self->_lastDisableDate;
}

- (void)setLastDisableDate:(id)a3
{
}

- (NSDate)lastEnableDate
{
  return self->_lastEnableDate;
}

- (void)setLastEnableDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end