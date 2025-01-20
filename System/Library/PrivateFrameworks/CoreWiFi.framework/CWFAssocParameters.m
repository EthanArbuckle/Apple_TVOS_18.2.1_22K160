@interface CWFAssocParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)findAndJoinNetwork;
- (BOOL)forceBSSID;
- (BOOL)has6GHzOnlyBSS;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssocParameters:(id)a3;
- (BOOL)rememberUponSuccessfulAssociation;
- (CWFAssocParameters)initWithCoder:(id)a3;
- (CWFEAPCredentials)EAPCredentials;
- (CWFNetworkProfile)knownNetworkProfile;
- (CWFScanResult)scanResult;
- (NSString)colocatedScopeID;
- (NSString)password;
- (SFRemoteHotspotDevice)remoteHotspotDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bandPreference;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBandPreference:(int64_t)a3;
- (void)setColocatedScopeID:(id)a3;
- (void)setEAPCredentials:(id)a3;
- (void)setFindAndJoinNetwork:(BOOL)a3;
- (void)setForceBSSID:(BOOL)a3;
- (void)setHas6GHzOnlyBSS:(BOOL)a3;
- (void)setKnownNetworkProfile:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRememberUponSuccessfulAssociation:(BOOL)a3;
- (void)setRemoteHotspotDevice:(id)a3;
- (void)setScanResult:(id)a3;
@end

@implementation CWFAssocParameters

- (id)description
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_( v6,  v7,  (uint64_t)@"scanResult=%@, profile=%@, hasPassword=%d, eap=%@, remember=%d, forceBSSID=%d, bandPref=%ld, colocatedScopeID=%@",  v8,  v9,  self->_scanResult,  self->_knownNetworkProfile,  self->_password != 0,  self->_EAPCredentials,  self->_rememberUponSuccessfulAssociation,  self->_forceBSSID,  self->_bandPreference,  self->_colocatedScopeID);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)@"has6GHzOnlyBSS=%d", v11, v12, self->_has6GHzOnlyBSS);
  objc_msgSend_appendFormat_( v6,  v13,  (uint64_t)@", remoteHotspotDevice=%@, findAndJoinNetwork=%d",  v14,  v15,  self->_remoteHotspotDevice,  self->_findAndJoinNetwork);
  return v6;
}

- (BOOL)isEqualToAssocParameters:(id)a3
{
  id v6 = a3;
  scanResult = self->_scanResult;
  objc_msgSend_scanResult(v6, v8, v9, v10, v11);
  v16 = (CWFScanResult *)objc_claimAutoreleasedReturnValue();
  if (scanResult != v16)
  {
    if (!self->_scanResult
      || (objc_msgSend_scanResult(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v26 = 0;
      goto LABEL_72;
    }

    uint64_t v3 = (void *)v17;
    v22 = self->_scanResult;
    objc_msgSend_scanResult(v6, v18, v19, v20, v21);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      BOOL v26 = 0;
LABEL_71:

      goto LABEL_72;
    }
  }

  knownNetworkProfile = self->_knownNetworkProfile;
  objc_msgSend_knownNetworkProfile(v6, v12, v13, v14, v15);
  v32 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  if (knownNetworkProfile != v32)
  {
    if (!self->_knownNetworkProfile)
    {
      BOOL v26 = 0;
LABEL_46:

      goto LABEL_70;
    }

    uint64_t v33 = objc_msgSend_knownNetworkProfile(v6, v28, v29, v30, v31);
    if (!v33) {
      goto LABEL_68;
    }
    v155 = (void *)v33;
    v38 = self->_knownNetworkProfile;
    uint64_t v39 = objc_msgSend_knownNetworkProfile(v6, v34, v35, v36, v37);
    v40 = v38;
    v41 = (void *)v39;
    if ((objc_msgSend_isEqual_(v40, v42, v39, v43, v44) & 1) == 0)
    {

LABEL_67:
      goto LABEL_68;
    }

    v153 = v41;
  }

  password = self->_password;
  objc_msgSend_password(v6, v28, v29, v30, v31);
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (password == v50)
  {
    v154 = password;
LABEL_19:
    EAPCredentials = self->_EAPCredentials;
    uint64_t v64 = objc_msgSend_EAPCredentials(v6, v46, v47, v48, v49);
    v152 = EAPCredentials;
    BOOL v69 = EAPCredentials == (CWFEAPCredentials *)v64;
    v70 = (CWFEAPCredentials *)v64;
    if (v69)
    {
      v150 = v4;
    }

    else
    {
      if (!self->_EAPCredentials)
      {
        BOOL v26 = 0;
        goto LABEL_42;
      }

      uint64_t v71 = objc_msgSend_EAPCredentials(v6, v65, v66, v67, v68);
      if (!v71) {
        goto LABEL_61;
      }
      v148 = (void *)v71;
      v150 = v4;
      v76 = self->_EAPCredentials;
      uint64_t v77 = objc_msgSend_EAPCredentials(v6, v72, v73, v74, v75);
      v78 = v76;
      v79 = (void *)v77;
      if ((objc_msgSend_isEqual_(v78, v80, v77, v81, v82) & 1) == 0)
      {

        uint64_t v4 = v150;
        if (v154 == v50)
        {

          goto LABEL_65;
        }

        goto LABEL_63;
      }

      v147 = v79;
    }

    int rememberUponSuccessfulAssociation = self->_rememberUponSuccessfulAssociation;
    if (rememberUponSuccessfulAssociation != objc_msgSend_rememberUponSuccessfulAssociation( v6,  v65,  v66,  v67,  v68)
      || (int forceBSSID = self->_forceBSSID, forceBSSID != objc_msgSend_forceBSSID(v6, v84, v85, v86, v87))
      || (int64_t bandPreference = self->_bandPreference, bandPreference != objc_msgSend_bandPreference(v6, v89, v90, v91, v92))
      || (int has6GHzOnlyBSS = self->_has6GHzOnlyBSS,
          has6GHzOnlyBSS != objc_msgSend_has6GHzOnlyBSS(v6, v94, v95, v96, v97)))
    {
      BOOL v26 = 0;
      uint64_t v4 = v150;
      if (v152 == v70) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }

    colocatedScopeID = self->_colocatedScopeID;
    objc_msgSend_colocatedScopeID(v6, v99, v100, v101, v102);
    v104 = (NSString *)objc_claimAutoreleasedReturnValue();
    v146 = v104;
    if (colocatedScopeID == v104)
    {
      v145 = colocatedScopeID;
LABEL_50:
      remoteHotspotDevice = self->_remoteHotspotDevice;
      objc_msgSend_remoteHotspotDevice(v6, v105, v106, v107, v108);
      v122 = (SFRemoteHotspotDevice *)objc_claimAutoreleasedReturnValue();
      v144 = v122;
      if (remoteHotspotDevice != v122)
      {
        if (!self->_remoteHotspotDevice)
        {
          BOOL v26 = 0;
          uint64_t v4 = v150;
          goto LABEL_74;
        }

        uint64_t v127 = objc_msgSend_remoteHotspotDevice(v6, v123, v124, v125, v126);
        if (!v127)
        {

          BOOL v26 = 0;
          v104 = v146;
          uint64_t v4 = v150;
          if (v145 != v146) {
            goto LABEL_76;
          }
          goto LABEL_79;
        }

        v140 = self->_remoteHotspotDevice;
        v141 = (void *)v127;
        uint64_t v132 = objc_msgSend_remoteHotspotDevice(v6, v128, v129, v130, v131);
        v133 = v140;
        v139 = (void *)v132;
        if (!objc_msgSend_isEqual_(v133, v134, v132, v135, v136))
        {
          BOOL v26 = 0;
          uint64_t v4 = v150;
LABEL_57:

          goto LABEL_75;
        }
      }

      int findAndJoinNetwork = self->_findAndJoinNetwork;
      BOOL v26 = findAndJoinNetwork == objc_msgSend_findAndJoinNetwork(v6, v123, v124, v125, v126);
      v122 = v144;
      BOOL v69 = remoteHotspotDevice == v144;
      uint64_t v4 = v150;
      if (!v69) {
        goto LABEL_57;
      }
LABEL_74:

LABEL_75:
      v104 = v146;
      if (v145 != v146)
      {
LABEL_76:

        goto LABEL_77;
      }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAssocParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToAssocParameters = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAssocParameters = objc_msgSend_isEqualToAssocParameters_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToAssocParameters = 0;
  }

  return isEqualToAssocParameters;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_scanResult, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_knownNetworkProfile, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = objc_msgSend_hash(self->_password, v12, v13, v14, v15);
  unint64_t v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_EAPCredentials, v17, v18, v19, v20) ^ self->_rememberUponSuccessfulAssociation ^ (unint64_t)self->_forceBSSID ^ self->_bandPreference ^ self->_has6GHzOnlyBSS;
  uint64_t v26 = objc_msgSend_hash(self->_colocatedScopeID, v22, v23, v24, v25);
  return v21 ^ v26 ^ objc_msgSend_hash(self->_remoteHotspotDevice, v27, v28, v29, v30) ^ self->_findAndJoinNetwork;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFAssocParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setScanResult_(v11, v12, (uint64_t)self->_scanResult, v13, v14);
  objc_msgSend_setKnownNetworkProfile_(v11, v15, (uint64_t)self->_knownNetworkProfile, v16, v17);
  objc_msgSend_setPassword_(v11, v18, (uint64_t)self->_password, v19, v20);
  objc_msgSend_setEAPCredentials_(v11, v21, (uint64_t)self->_EAPCredentials, v22, v23);
  objc_msgSend_setRememberUponSuccessfulAssociation_(v11, v24, self->_rememberUponSuccessfulAssociation, v25, v26);
  objc_msgSend_setForceBSSID_(v11, v27, self->_forceBSSID, v28, v29);
  objc_msgSend_setBandPreference_(v11, v30, self->_bandPreference, v31, v32);
  objc_msgSend_setColocatedScopeID_(v11, v33, (uint64_t)self->_colocatedScopeID, v34, v35);
  objc_msgSend_setHas6GHzOnlyBSS_(v11, v36, self->_has6GHzOnlyBSS, v37, v38);
  objc_msgSend_setRemoteHotspotDevice_(v11, v39, (uint64_t)self->_remoteHotspotDevice, v40, v41);
  objc_msgSend_setFindAndJoinNetwork_(v11, v42, self->_findAndJoinNetwork, v43, v44);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  scanResult = self->_scanResult;
  id v27 = a3;
  objc_msgSend_encodeObject_forKey_(v27, v5, (uint64_t)scanResult, (uint64_t)@"_scanResult", v6);
  objc_msgSend_encodeObject_forKey_( v27,  v7,  (uint64_t)self->_knownNetworkProfile,  (uint64_t)@"_knownNetworkProfile",  v8);
  objc_msgSend_encodeObject_forKey_(v27, v9, (uint64_t)self->_password, (uint64_t)@"_password", v10);
  objc_msgSend_encodeObject_forKey_(v27, v11, (uint64_t)self->_EAPCredentials, (uint64_t)@"_EAPCredentials", v12);
  objc_msgSend_encodeBool_forKey_( v27,  v13,  self->_rememberUponSuccessfulAssociation,  (uint64_t)@"_rememberUponSuccessfulAssociation",  v14);
  objc_msgSend_encodeBool_forKey_(v27, v15, self->_forceBSSID, (uint64_t)@"_forceBSSID", v16);
  objc_msgSend_encodeInteger_forKey_(v27, v17, self->_bandPreference, (uint64_t)@"_bandPreference", v18);
  objc_msgSend_encodeObject_forKey_( v27,  v19,  (uint64_t)self->_colocatedScopeID,  (uint64_t)@"_colocatedScopeID",  v20);
  objc_msgSend_encodeBool_forKey_(v27, v21, self->_has6GHzOnlyBSS, (uint64_t)@"_has6GHzOnlyBSS", v22);
  objc_msgSend_encodeObject_forKey_( v27,  v23,  (uint64_t)self->_remoteHotspotDevice,  (uint64_t)@"_remoteHotspotDevice",  v24);
  objc_msgSend_encodeBool_forKey_(v27, v25, self->_findAndJoinNetwork, (uint64_t)@"_findAndJoinNetwork", v26);
}

- (CWFAssocParameters)initWithCoder:(id)a3
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___CWFAssocParameters;
  v5 = -[CWFAssocParameters init](&v55, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_scanResult", v8);
    scanResult = v5->_scanResult;
    v5->_scanResult = (CWFScanResult *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_knownNetworkProfile", v13);
    knownNetworkProfile = v5->_knownNetworkProfile;
    v5->_knownNetworkProfile = (CWFNetworkProfile *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)@"_password", v18);
    password = v5->_password;
    v5->_password = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)@"_EAPCredentials", v23);
    EAPCredentials = v5->_EAPCredentials;
    v5->_EAPCredentials = (CWFEAPCredentials *)v24;

    v5->_int rememberUponSuccessfulAssociation = objc_msgSend_decodeBoolForKey_( v4,  v26,  (uint64_t)@"_rememberUponSuccessfulAssociation",  v27,  v28);
    v5->_int forceBSSID = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)@"_forceBSSID", v30, v31);
    v5->_int64_t bandPreference = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)@"_bandPreference", v33, v34);
    uint64_t v35 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)@"_colocatedScopeID", v37);
    colocatedScopeID = v5->_colocatedScopeID;
    v5->_colocatedScopeID = (NSString *)v38;

    v5->_int has6GHzOnlyBSS = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)@"_has6GHzOnlyBSS", v41, v42);
    if (!qword_18C4A4310)
    {
      __int128 v60 = xmmword_189E5D658;
      uint64_t v61 = 0LL;
      qword_18C4A4310 = _sl_dlopen();
    }

    if (qword_18C4A4310)
    {
      uint64_t v56 = 0LL;
      uint64_t v57 = &v56;
      uint64_t v58 = 0x2050000000LL;
      uint64_t v47 = (void *)qword_18C4A4318;
      uint64_t v59 = qword_18C4A4318;
      if (!qword_18C4A4318)
      {
        *(void *)&__int128 v60 = MEMORY[0x1895F87A8];
        *((void *)&v60 + 1) = 3221225472LL;
        uint64_t v61 = sub_1864E5484;
        uint64_t v62 = &unk_189E5B480;
        v63 = &v56;
        sub_1864E5484((uint64_t)&v60, v43, v44, v45, v46);
        uint64_t v47 = (void *)v57[3];
      }

      id v48 = v47;
      _Block_object_dispose(&v56, 8);
      uint64_t v49 = objc_opt_class();
      uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, (uint64_t)@"_remoteHotspotDevice", v51);
      remoteHotspotDevice = v5->_remoteHotspotDevice;
      v5->_remoteHotspotDevice = (SFRemoteHotspotDevice *)v52;
    }

    v5->_int findAndJoinNetwork = objc_msgSend_decodeBoolForKey_(v4, v43, (uint64_t)@"_findAndJoinNetwork", v45, v46);
  }

  return v5;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (CWFNetworkProfile)knownNetworkProfile
{
  return self->_knownNetworkProfile;
}

- (void)setKnownNetworkProfile:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (CWFEAPCredentials)EAPCredentials
{
  return self->_EAPCredentials;
}

- (void)setEAPCredentials:(id)a3
{
}

- (BOOL)rememberUponSuccessfulAssociation
{
  return self->_rememberUponSuccessfulAssociation;
}

- (void)setRememberUponSuccessfulAssociation:(BOOL)a3
{
  self->_int rememberUponSuccessfulAssociation = a3;
}

- (int64_t)bandPreference
{
  return self->_bandPreference;
}

- (void)setBandPreference:(int64_t)a3
{
  self->_int64_t bandPreference = a3;
}

- (NSString)colocatedScopeID
{
  return self->_colocatedScopeID;
}

- (void)setColocatedScopeID:(id)a3
{
}

- (BOOL)forceBSSID
{
  return self->_forceBSSID;
}

- (void)setForceBSSID:(BOOL)a3
{
  self->_int forceBSSID = a3;
}

- (BOOL)has6GHzOnlyBSS
{
  return self->_has6GHzOnlyBSS;
}

- (void)setHas6GHzOnlyBSS:(BOOL)a3
{
  self->_int has6GHzOnlyBSS = a3;
}

- (SFRemoteHotspotDevice)remoteHotspotDevice
{
  return self->_remoteHotspotDevice;
}

- (void)setRemoteHotspotDevice:(id)a3
{
}

- (BOOL)findAndJoinNetwork
{
  return self->_findAndJoinNetwork;
}

- (void)setFindAndJoinNetwork:(BOOL)a3
{
  self->_int findAndJoinNetwork = a3;
}

- (void).cxx_destruct
{
}

@end