@interface IDSEncryptionHelpers
+ (BOOL)areDataProtectionKeysAvailableForService:(id)a3 withDataProtectionClass:(unsigned int)a4 fromDevice:(id)a5;
+ (id)decryptDataWithAESKey:(id)a3 data:(id)a4;
+ (id)decryptLocalDeliveryPayload:(id)a3 forService:(id)a4 withDataProtectionClass:(unsigned int)a5 fromDevice:(id)a6 encryptionType:(int64_t)a7 priority:(int64_t)a8 error:(id *)a9;
+ (id)encryptDataWithAESKey:(id)a3 data:(id)a4;
+ (id)encryptLocalDeliveryPayload:(id)a3 toDevice:(id)a4 forService:(id)a5 withDataProtectionClass:(unsigned int)a6 encryptionType:(int64_t)a7 priority:(int64_t)a8 error:(int64_t *)a9;
+ (void)logEncryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9 encrypt:(BOOL)a10 remote:(BOOL)a11 priority:(int64_t)a12;
@end

@implementation IDSEncryptionHelpers

+ (void)logEncryptionErrorForToken:(id)a3 deviceID:(id)a4 forURI:(id)a5 fromURI:(id)a6 forService:(id)a7 messageData:(id)a8 type:(int64_t)a9 encrypt:(BOOL)a10 remote:(BOOL)a11 priority:(int64_t)a12
{
  id v118 = a3;
  id v117 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v114 = a8;
  v20 = @"Decryption";
  if (a10)
  {
    v20 = @"Encryption";
    v21 = @"encrypt";
  }

  else
  {
    v21 = @"decrypt";
  }

  v116 = v20;
  v115 = v21;
  if (a9)
  {
    uint64_t v22 = OSLogHandleForIDSCategory("Encryption");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "******************************************************************",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v24) && _IDSShouldLog(0LL, @"Encryption")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"******************************************************************");
    }
    uint64_t v25 = OSLogHandleForIDSCategory("Encryption");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v121 = (int64_t)v116;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "*******************  %@ Error ****************************",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v27) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v109 = v116;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"*******************  %@ Error ****************************");
    }

    uint64_t v28 = OSLogHandleForIDSCategory("Encryption");
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "******************************************************************",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v30) && _IDSShouldLog(0LL, @"Encryption")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"******************************************************************");
    }
    uint64_t v31 = OSLogHandleForIDSCategory("Encryption");
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v121 = a12;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "***  Priority: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v33) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v109 = (void *)a12;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"***  Priority: %ld");
    }

    uint64_t v34 = OSLogHandleForIDSCategory("Encryption");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v118 rawToken]);
      uint64_t v37 = IDSLoggableDescriptionForTokenOnService(v36, v19);
      id v38 = (id)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)buf = 138412290;
      int64_t v121 = (int64_t)v38;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "***     Token: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v39) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v118 rawToken]);
      uint64_t v41 = IDSLoggableDescriptionForTokenOnService(v40, v19);
      v109 = (void *)objc_claimAutoreleasedReturnValue(v41);
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"***     Token: %@");
    }

    uint64_t v42 = OSLogHandleForIDSCategory("Encryption");
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v121 = (int64_t)v117;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "*** Device ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v44) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v109 = v117;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"*** Device ID: %@");
    }

    uint64_t v45 = OSLogHandleForIDSCategory("Encryption");
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v121 = (int64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "***      From: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v47) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v109 = v18;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"***      From: %@");
    }

    uint64_t v48 = OSLogHandleForIDSCategory("Encryption");
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v121 = (int64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "***        To: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v50) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v109 = v17;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"***        To: %@");
    }

    uint64_t v51 = OSLogHandleForIDSCategory("Encryption");
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "***", buf, 2u);
    }

    switch(a9)
    {
      case -1LL:
        uint64_t v103 = OSLogHandleForIDSCategory("Encryption");
        v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "  Unknown encryption type error? This is non-sensical",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v105)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"  Unknown encryption type error? This is non-sensical");
        }

        break;
      case 1LL:
      case 4LL:
      case 5LL:
        uint64_t v54 = OSLogHandleForIDSCategory("Encryption");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v116;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Public/Private %@ failed :(", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v56)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          v109 = v116;
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Public/Private %@ failed :(");
        }

        v57 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance", v109));
        v110 = (void *)objc_claimAutoreleasedReturnValue([v57 publicKeyForURI:v17 pushToken:v118 fromURI:v18 service:v19]);

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPublicKeyStorage sharedInstance](&OBJC_CLASS___IDSPublicKeyStorage, "sharedInstance"));
        v112 = (void *)objc_claimAutoreleasedReturnValue([v58 publicDeviceIdentityContainerForDeviceID:v117]);

        v59 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
        v111 = (void *)objc_claimAutoreleasedReturnValue([v59 publicMessageProtectionData]);

        v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
        id v61 = [v60 copyMessageProtectionIdentity];

        id v113 = v118;
        id v62 = v17;
        id v63 = v18;
        id v64 = v19;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
        v66 = (void *)objc_claimAutoreleasedReturnValue([v65 publicKeyForURI:v62 pushToken:v113 fromURI:v63 service:v64]);

        if (!v66) {
          goto LABEL_67;
        }
        CFTypeRef cf = 0LL;
        if (qword_1009BED08 != -1) {
          dispatch_once(&qword_1009BED08, &stru_1008FC838);
        }
        if (off_1009BED00)
        {
          v67 = (const void *)off_1009BED00(0LL, v66, &cf);
          if (cf)
          {
            uint64_t v68 = OSLogHandleForIDSCategory("Warning");
            v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              int64_t v121 = (int64_t)v66;
              __int16 v122 = 2112;
              CFTypeRef v123 = cf;
              _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "Failed creating public identity from data: %@  (Error: %@)",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v70))
            {
              _IDSWarnV(@"IDSFoundation", @"Failed creating public identity from data: %@  (Error: %@)");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed creating public identity from data: %@  (Error: %@)");
              _IDSLogTransport( @"Warning",  @"IDS",  @"Failed creating public identity from data: %@  (Error: %@)");
            }

            if (cf) {
              CFRelease(cf);
            }
          }
        }

        else
        {
LABEL_67:
          v67 = 0LL;
        }

        v71 = (void *)objc_claimAutoreleasedReturnValue([v112 legacyPublicIdentity]);
        uint64_t v72 = OSLogHandleForIDSCategory("Encryption");
        v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v61;
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  " => Current local publicIdentity: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v74)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @" => Current local publicIdentity: %@");
        }

        uint64_t v75 = OSLogHandleForIDSCategory("Encryption");
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v111;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  " => Current local publicIdentity data: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v77)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @" => Current local publicIdentity data: %@");
        }

        uint64_t v78 = OSLogHandleForIDSCategory("Encryption");
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v67;
          _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  " => Current remote publicIdentity for token: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v80)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @" => Current remote publicIdentity for token: %@");
        }

        uint64_t v81 = OSLogHandleForIDSCategory("Encryption");
        v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v71;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  " => Current remote publicIdentity for device: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v83)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @" => Current remote publicIdentity for device: %@");
        }

        if (v67) {
          CFRelease(v67);
        }
        if (v61) {
          CFRelease(v61);
        }
        uint64_t v84 = OSLogHandleForIDSCategory("Encryption");
        v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v110;
          _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  " => Current remote public key data for token: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v86)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @" => Current remote public key data for token: %@");
        }

        uint64_t v87 = OSLogHandleForIDSCategory("Encryption");
        v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v112;
          _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  " => Current remote public key data for device: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v89)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @" => Current remote public key data for device: %@");
        }

        uint64_t v90 = OSLogHandleForIDSCategory("Encryption");
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          int64_t v121 = (int64_t)v115;
          __int16 v122 = 2112;
          CFTypeRef v123 = v114;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, " => Data we tried to %@: %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v92)
          && _IDSShouldLog(1LL, @"Encryption"))
        {
          _IDSLogV(1LL, @"IDSFoundation", @"Encryption", @" => Data we tried to %@: %@");
        }

        uint64_t v93 = OSLogHandleForIDSCategory("Encryption");
        v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          v95 = @"NO";
          if (a11) {
            v95 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v95;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, " => Is remote: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v96)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @" => Is remote: %@");
        }

        uint64_t v97 = OSLogHandleForIDSCategory("Encryption");
        v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v121 = (int64_t)v113;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, " => Token: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v99)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @" => Token: %@");
        }

        break;
      case 2LL:
        uint64_t v106 = OSLogHandleForIDSCategory("Encryption");
        v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "  Plain text encryption error? This is non-sensical",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v108)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"  Plain text encryption error? This is non-sensical");
        }

        break;
      default:
        break;
    }

    uint64_t v100 = OSLogHandleForIDSCategory("Encryption");
    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "******************************************************************",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v102) && _IDSShouldLog(0LL, @"Encryption")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"******************************************************************");
    }
  }
}

+ (id)encryptDataWithAESKey:(id)a3 data:(id)a4
{
  return sub_10019C754(1, a4, a3);
}

+ (id)decryptDataWithAESKey:(id)a3 data:(id)a4
{
  return sub_10019C754(0, a4, a3);
}

+ (id)encryptLocalDeliveryPayload:(id)a3 toDevice:(id)a4 forService:(id)a5 withDataProtectionClass:(unsigned int)a6 encryptionType:(int64_t)a7 priority:(int64_t)a8 error:(int64_t *)a9
{
  uint64_t v9 = *(void *)&a6;
  id v12 = a3;
  v13 = (__CFError *)a4;
  id v14 = a5;
  uint64_t v15 = OSLogHandleForIDSCategory("AOVERCEncryption");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Incoming Encryption Request", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v17)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Incoming Encryption Request");
  }

  if (qword_1009BECC8 != -1) {
    dispatch_once(&qword_1009BECC8, &stru_1008FC798);
  }
  if (qword_1009BECD8 != -1) {
    dispatch_once(&qword_1009BECD8, &stru_1008FC7B8);
  }
  uint64_t v83 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pairedDeviceForUniqueID:v13]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 publicClassAKey]);
  uint64_t v21 = OSLogHandleForIDSCategory("AOVERCEncryption");
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFErrorRef v85 = v13;
    __int16 v86 = 2112;
    uint64_t v87 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Public Key for Device Class A for UniqueID %@: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v23)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Public Key for Device Class A for UniqueID %@: %@");
  }

  uint64_t v24 = OSLogHandleForIDSCategory("AOVERCEncryption");
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
    uint64_t v27 = (__CFError *)(id)objc_claimAutoreleasedReturnValue([v26 encryptionClassAKey]);
    *(_DWORD *)buf = 138412290;
    CFErrorRef v85 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Public Key for My Class A key is %@:",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v28)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v29 encryptionClassAKey]);
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Public Key for My Class A key is %@:");
  }

  if (!off_1009BECD0 || (uint64_t v30 = (__CFError *)off_1009BECD0(0LL, v20, &v83)) == 0LL)
  {
    uint64_t v43 = OSLogHandleForIDSCategory("AOVERCEncryption");
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v85 = v83;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Public Identity Fetch Error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v45)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Public Identity Fetch Error: %@");
    }

    goto LABEL_50;
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v32 = (__CFError *)[v31 latestCopyMessageProtectionIdentityForDataProtectionClass:v9];

  if (!v32)
  {
    uint64_t v46 = OSLogHandleForIDSCategory("AOVERCEncryption");
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = IDSDataProtectionClassStringFromDataProtectionClass(v9);
      v49 = (__CFError *)objc_claimAutoreleasedReturnValue(v48);
      *(_DWORD *)buf = 138412290;
      CFErrorRef v85 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch full identify for data protection class %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v50)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      uint64_t v51 = IDSDataProtectionClassStringFromDataProtectionClass(v9);
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(v51);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Unable to fetch full identify for data protection class %@");
    }

    goto LABEL_50;
  }

  uint64_t v33 = OSLogHandleForIDSCategory("AOVERCEncryption");
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFErrorRef v85 = v32;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v35)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Using full identity: %@");
  }

  uint64_t v36 = OSLogHandleForIDSCategory("AOVERCEncryption");
  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFErrorRef v85 = v30;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Fetched device public identity: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v38)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Fetched device public identity: %@");
  }

  uint64_t v39 = malloc(0x10uLL);
  if (SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v39))
  {
    uint64_t v40 = OSLogHandleForIDSCategory("AOVERCEncryption");
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Failed To Generate Key", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v42)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Failed To Generate Key");
    }

    free(v39);
LABEL_50:
    id v52 = 0LL;
    goto LABEL_51;
  }

  uint64_t v54 = OSLogHandleForIDSCategory("AOVERCEncryption");
  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Symmestric key generated Sucessfully", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v56)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Symmestric key generated Sucessfully");
  }

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_10019D714;
  v82[3] = &unk_1008FC7D8;
  v82[4] = v39;
  uint64_t v80 = -[NSData initWithBytesNoCopy:length:deallocator:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:deallocator:",  v39,  16LL,  v82);
  uint64_t v57 = OSLogHandleForIDSCategory("AOVERCEncryption");
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Symmestric key converted to NSData sucessfully",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v59)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Symmestric key converted to NSData sucessfully");
  }

  v60 = sub_10019C754(1, v12, v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue(v60);
  if (v79)
  {
    uint64_t v61 = OSLogHandleForIDSCategory("AOVERCEncryption");
    id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Data encrypted with Symmestric key sucessfully",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v63)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Data encrypted with Symmestric key sucessfully");
    }
  }

  id v64 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  CFErrorRef err = 0LL;
  if (off_1009BECC0 && (off_1009BECC0(v80, v32, v30, v64, &err) & 1) != 0)
  {
    if (v64)
    {
      uint64_t v65 = OSLogHandleForIDSCategory("AOVERCEncryption");
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Encryption Success", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v67)
        && _IDSShouldLog(0LL, @"AOVERCEncryption"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Encryption Success");
      }

      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v64,  @"ekd",  v79,  @"sed",  0LL));
      uint64_t v69 = JWEncodeDictionary(v68);
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

      goto LABEL_89;
    }
  }

  else
  {
    uint64_t v71 = OSLogHandleForIDSCategory("AOVERCEncryption");
    uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v85 = err;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "   Public/Private encryption failed with error: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v73)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"   Public/Private encryption failed with error: %@");
    }

    if (a9)
    {
      *a9 = 201LL;
      if (CFErrorGetCode(err) == -25304)
      {
        uint64_t v74 = OSLogHandleForIDSCategory("Warning");
        uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v76))
        {
          _IDSWarnV( @"IDSFoundation",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
          _IDSLogTransport( @"Warning",  @"IDS",  @"   ********* Security reported invalid local item ref, this is bad - we're purging this, and please file this radar");
        }
      }
    }
  }

  uint64_t v70 = 0LL;
LABEL_89:
  CFRelease(v32);
  CFRelease(v30);
  if (err) {
    CFRelease(err);
  }

  id v52 = v70;
LABEL_51:

  return v52;
}

+ (id)decryptLocalDeliveryPayload:(id)a3 forService:(id)a4 withDataProtectionClass:(unsigned int)a5 fromDevice:(id)a6 encryptionType:(int64_t)a7 priority:(int64_t)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a5;
  id v12 = a3;
  id v80 = a4;
  id v81 = a6;
  uint64_t v13 = OSLogHandleForIDSCategory("AOVERCEncryption");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Incoming Decryption Request", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Incoming Decryption Request");
  }

  uint64_t v16 = JWDecodeDictionary(v12);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (!v17)
  {
    uint64_t v18 = OSLogHandleForIDSCategory("AOVERCEncryption");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received payload is not a dictionary, failing decryption",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v20)
      && _IDSShouldLog(0LL, @"AOVERCEncryption"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Received payload is not a dictionary, failing decryption");
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 _dataForKey:@"ekd"]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 _dataForKey:@"sed"]);
  if ([v21 length] && objc_msgSend(v22, "length"))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[IDSMessageHashStore sharedInstance](&OBJC_CLASS___IDSMessageHashStore, "sharedInstance"));
    id v23 = v21;
    if (qword_1009BED18 != -1) {
      dispatch_once(&qword_1009BED18, &stru_1008FC858);
    }
    if (off_1009BED10)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      id v25 = [v24 latestCopyMessageProtectionIdentityForDataProtectionClass:2];

      *(void *)buf = 0LL;
      v26 = (void *)off_1009BED10(v23, v25, buf);
      if (v25) {
        CFRelease(v25);
      }

      if (v26 && ![v79 containsMessageHash:v26])
      {
        [v79 addMessageHash:v26];
        uint64_t v83 = 0LL;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pairedDeviceForUniqueID:v81]);
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v28 publicClassAKey]);

        uint64_t v29 = OSLogHandleForIDSCategory("AOVERCEncryption");
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v81;
          __int16 v85 = 2112;
          __int16 v86 = v78;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Public Key for Device Class A for UniqueID %@: %@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v31)
          && _IDSShouldLog(0LL, @"AOVERCEncryption"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Public Key for Device Class A for UniqueID %@: %@");
        }

        uint64_t v32 = OSLogHandleForIDSCategory("AOVERCEncryption");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 encryptionClassAKey]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Public Key for My Class A key is %@:",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v36)
          && _IDSShouldLog(0LL, @"AOVERCEncryption"))
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
          uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v37 encryptionClassAKey]);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Public Key for My Class A key is %@:");
        }

        if (qword_1009BECE8 != -1) {
          dispatch_once(&qword_1009BECE8, &stru_1008FC7F8);
        }
        if (qword_1009BECF8 != -1) {
          dispatch_once(&qword_1009BECF8, &stru_1008FC818);
        }
        if (off_1009BECE0 && (uint64_t v38 = (const void *)off_1009BECE0(0LL, v78, &v83)) != 0LL)
        {
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
          CFTypeRef cf = [v39 latestCopyMessageProtectionIdentityForDataProtectionClass:v10];

          if (cf)
          {
            uint64_t v40 = OSLogHandleForIDSCategory("AOVERCEncryption");
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = cf;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v42)
              && _IDSShouldLog(0LL, @"AOVERCEncryption"))
            {
              _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Using full identity: %@");
            }

            uint64_t v43 = OSLogHandleForIDSCategory("AOVERCEncryption");
            uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Fetched device public identity: %@",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v45)
              && _IDSShouldLog(0LL, @"AOVERCEncryption"))
            {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Fetched device public identity: %@");
            }

            uint64_t v46 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
            id v82 = 0LL;
            if (off_1009BECF0 && (off_1009BECF0(v23, v38, cf, v46, &v82) & 1) != 0)
            {
              if (v46)
              {
                uint64_t v47 = OSLogHandleForIDSCategory("AOVERCEncryption");
                uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Symmetric Key Decryption Success",  buf,  2u);
                }

                if (os_log_shim_legacy_logging_enabled(v49)
                  && _IDSShouldLog(0LL, @"AOVERCEncryption"))
                {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Symmetric Key Decryption Success");
                }

                uint64_t v50 = sub_10019C754(0, v22, v46);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                if (v51)
                {
                  uint64_t v52 = OSLogHandleForIDSCategory("AOVERCEncryption");
                  uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Symmetric Key Payload Decryption Success",  buf,  2u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v54)
                    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
                  {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Symmetric Key Payload Decryption Success");
                  }

                  id v55 = v51;
                }

                goto LABEL_98;
              }
            }

            else
            {
              uint64_t v66 = OSLogHandleForIDSCategory("AOVERCEncryption");
              uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v82;
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "   Public/Private decryption failed with error: %@",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v68)
                && _IDSShouldLog(0LL, @"AOVERCEncryption"))
              {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"   Public/Private decryption failed with error: %@");
              }

              if (a9)
              {
                uint64_t v51 = 0LL;
                *a9 = v82;
LABEL_98:
                CFRelease(cf);
                CFRelease(v38);
                goto LABEL_99;
              }
            }

            uint64_t v51 = 0LL;
            goto LABEL_98;
          }

          uint64_t v69 = OSLogHandleForIDSCategory("AOVERCEncryption");
          uint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v71 = IDSDataProtectionClassStringFromDataProtectionClass(v10);
            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v72;
            _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch full identify for data protection class %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v73)
            && _IDSShouldLog(0LL, @"AOVERCEncryption"))
          {
            uint64_t v74 = IDSDataProtectionClassStringFromDataProtectionClass(v10);
            uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(v74);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Unable to fetch full identify for data protection class %@");
          }
        }

        else
        {
          uint64_t v63 = OSLogHandleForIDSCategory("AOVERCEncryption");
          id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v83;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Public Identity Fetch Error: %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v65)
            && _IDSShouldLog(0LL, @"AOVERCEncryption"))
          {
            _IDSLogV(0LL, @"IDSFoundation", @"AOVERCEncryption", @"Public Identity Fetch Error: %@");
          }
        }

        uint64_t v51 = 0LL;
LABEL_99:

LABEL_77:
        goto LABEL_78;
      }
    }

    else
    {

      v26 = 0LL;
    }

    uint64_t v59 = OSLogHandleForIDSCategory("IDSMessageHashStore");
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Received duplicate payload, returning early",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v61)
      && _IDSShouldLog(0LL, @"IDSMessageHashStore"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSMessageHashStore",  @"Received duplicate payload, returning early");
    }

    [v79 updateCreationDateForHash:v26];
    uint64_t v51 = 0LL;
    goto LABEL_77;
  }

  uint64_t v56 = OSLogHandleForIDSCategory("AOVERCEncryption");
  uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Received invalid payload for decryption, failing",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v58)
    && _IDSShouldLog(0LL, @"AOVERCEncryption"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"AOVERCEncryption",  @"Received invalid payload for decryption, failing");
  }

  uint64_t v51 = 0LL;
LABEL_78:

  return v51;
}

+ (BOOL)areDataProtectionKeysAvailableForService:(id)a3 withDataProtectionClass:(unsigned int)a4 fromDevice:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pairedDeviceForUniqueID:v6]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicClassAKey]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v11 = [v10 latestCopyMessageProtectionIdentityForDataProtectionClass:v5];

  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12;

  return v13;
}

@end