@interface OTEscrowTranslation
+ (BOOL)supportedRestorePath:(id)a3;
+ (id)CDPRecordContextToDictionary:(id)a3;
+ (id)_dateWithSecureBackupDateString:(id)a3;
+ (id)_stringWithSecureBackupDate:(id)a3;
+ (id)cdpRecoveryInformationToDictionary:(id)a3;
+ (id)dictionaryToCDPRecordContext:(id)a3;
+ (id)dictionaryToCDPRecoveryInformation:(id)a3;
+ (id)dictionaryToEscrowAuthenticationInfo:(id)a3;
+ (id)dictionaryToEscrowRecord:(id)a3;
+ (id)dictionaryToMetadata:(id)a3;
+ (id)escrowAuthenticationInfoToDictionary:(id)a3;
+ (id)escrowRecordToDictionary:(id)a3;
+ (id)metadataToDictionary:(id)a3;
@end

@implementation OTEscrowTranslation

+ (id)dictionaryToEscrowAuthenticationInfo:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___OTEscrowAuthenticationInformation);
    getkSecureBackupAuthenticationAppleID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationAppleid:](v4, "setAuthenticationAppleid:", v6);

    getkSecureBackupAuthenticationAuthToken();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationAuthToken:](v4, "setAuthenticationAuthToken:", v8);

    getkSecureBackupAuthenticationDSID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationDsid:](v4, "setAuthenticationDsid:", v10);

    getkSecureBackupAuthenticationEscrowProxyURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationEscrowproxyUrl:](v4, "setAuthenticationEscrowproxyUrl:", v12);

    getkSecureBackupAuthenticationiCloudEnvironment();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationIcloudEnvironment:]( v4,  "setAuthenticationIcloudEnvironment:",  v14);

    getkSecureBackupAuthenticationPassword();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setAuthenticationPassword:](v4, "setAuthenticationPassword:", v16);

    getkSecureBackupFMiPUUIDKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setFmipUuid:](v4, "setFmipUuid:", v18);

    getkSecureBackupFMiPRecoveryKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v19];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setFmipRecovery:](v4, "setFmipRecovery:", [v20 BOOLValue]);

    getkSecureBackupIDMSRecoveryKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v21];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowAuthenticationInformation setIdmsRecovery:](v4, "setIdmsRecovery:", [v22 BOOLValue]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)escrowAuthenticationInfoToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 authenticationAppleid];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v5 isEqualToString:&stru_18A04F9E0];

    if ((v6 & 1) == 0)
    {
      [v3 authenticationAppleid];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationAppleID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v7 forKeyedSubscript:v8];
    }

    [v3 authenticationAuthToken];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v9 isEqualToString:&stru_18A04F9E0];

    if ((v10 & 1) == 0)
    {
      [v3 authenticationAuthToken];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationAuthToken();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v11 forKeyedSubscript:v12];
    }

    [v3 authenticationDsid];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v13 isEqualToString:&stru_18A04F9E0];

    if ((v14 & 1) == 0)
    {
      [v3 authenticationDsid];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationDSID();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v15 forKeyedSubscript:v16];
    }

    [v3 authenticationEscrowproxyUrl];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v17 isEqualToString:&stru_18A04F9E0];

    if ((v18 & 1) == 0)
    {
      [v3 authenticationEscrowproxyUrl];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationEscrowProxyURL();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v19 forKeyedSubscript:v20];
    }

    [v3 authenticationIcloudEnvironment];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    char v22 = [v21 isEqualToString:&stru_18A04F9E0];

    if ((v22 & 1) == 0)
    {
      [v3 authenticationIcloudEnvironment];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationiCloudEnvironment();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v23 forKeyedSubscript:v24];
    }

    [v3 authenticationPassword];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    char v26 = [v25 isEqualToString:&stru_18A04F9E0];

    if ((v26 & 1) == 0)
    {
      [v3 authenticationPassword];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupAuthenticationPassword();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v27 forKeyedSubscript:v28];
    }

    [v3 fmipUuid];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    char v30 = [v29 isEqualToString:&stru_18A04F9E0];

    if ((v30 & 1) == 0)
    {
      [v3 fmipUuid];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupFMiPUUIDKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v31 forKeyedSubscript:v32];
    }

    int v33 = [v3 fmipRecovery];
    uint64_t v34 = MEMORY[0x189604A80];
    uint64_t v35 = MEMORY[0x189604A88];
    if (v33) {
      uint64_t v36 = MEMORY[0x189604A88];
    }
    else {
      uint64_t v36 = MEMORY[0x189604A80];
    }
    getkSecureBackupFMiPRecoveryKey();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v36 forKeyedSubscript:v37];

    else {
      uint64_t v38 = v34;
    }
    getkSecureBackupIDMSRecoveryKey();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v38 forKeyedSubscript:v39];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)dictionaryToCDPRecoveryInformation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___OTCDPRecoveryInformation);
    getkSecureBackupPassphraseKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v5];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setRecoverySecret:](v4, "setRecoverySecret:", v6);

    getkSecureBackupUseCachedPassphraseKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUseCachedSecret:](v4, "setUseCachedSecret:", [v8 BOOLValue]);

    getkSecureBackupRecoveryKeyKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v9];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setRecoveryKey:](v4, "setRecoveryKey:", v10);

    getkSecureBackupUsesRecoveryKeyKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUsePreviouslyCachedRecoveryKey:]( v4,  "setUsePreviouslyCachedRecoveryKey:",  [v12 BOOLValue]);

    getkSecureBackupSilentRecoveryAttemptKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v13];
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setSilentRecoveryAttempt:]( v4,  "setSilentRecoveryAttempt:",  [v14 BOOLValue]);

    getkSecureBackupContainsiCDPDataKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setContainsIcdpData:](v4, "setContainsIcdpData:", [v16 BOOLValue]);

    getkSecureBackupUsesMultipleiCSCKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v17];
    char v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setUsesMultipleIcsc:](v4, "setUsesMultipleIcsc:", [v18 BOOLValue]);

    getkSecureBackupNonViableRepairKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v19];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCDPRecoveryInformation setNonViableRepair:](v4, "setNonViableRepair:", [v20 BOOLValue]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)cdpRecoveryInformationToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 recoverySecret];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPassphraseKey();
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKeyedSubscript:v6];

    int v7 = [v3 useCachedSecret];
    uint64_t v8 = MEMORY[0x189604A80];
    uint64_t v9 = MEMORY[0x189604A88];
    if (v7) {
      uint64_t v10 = MEMORY[0x189604A88];
    }
    else {
      uint64_t v10 = MEMORY[0x189604A80];
    }
    getkSecureBackupUseCachedPassphraseKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:v11];

    [v3 recoveryKey];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecoveryKeyKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v12 forKeyedSubscript:v13];

    else {
      uint64_t v14 = v8;
    }
    getkSecureBackupUsesRecoveryKeyKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKeyedSubscript:v15];

    else {
      uint64_t v16 = v8;
    }
    getkSecureBackupSilentRecoveryAttemptKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKeyedSubscript:v17];

    else {
      uint64_t v18 = v8;
    }
    getkSecureBackupContainsiCDPDataKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v18 forKeyedSubscript:v19];

    else {
      uint64_t v20 = v8;
    }
    getkSecureBackupUsesMultipleiCSCKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKeyedSubscript:v21];

    else {
      uint64_t v22 = v8;
    }
    getkSecureBackupNonViableRepairKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:v23];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new();
  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
  [v4 dateFromString:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setTimeZone:v8];

    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [v4 dateFromString:v3];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v9 = v7;

  return v9;
}

+ (id)_stringWithSecureBackupDate:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new();
  [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setTimeZone:v5];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  [v4 stringFromDate:v3];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dictionaryToMetadata:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadata);
    [v3 objectForKeyedSubscript:@"BackupKeybagDigest"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBackupKeybagDigest:](v4, "setBackupKeybagDigest:", v5);

    getkSecureBackupUsesMultipleiCSCKey();
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v6];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setSecureBackupUsesMultipleIcscs:]( v4,  "setSecureBackupUsesMultipleIcscs:",  [v7 BOOLValue]);

    getkSecureBackupBottleIDKey();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBottleId:](v4, "setBottleId:", v9);

    [v3 objectForKeyedSubscript:@"bottleValid"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBottleValidity:](v4, "setBottleValidity:", v10);

    [v3 objectForKeyedSubscript:@"com.apple.securebackup.timestamp"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[OTEscrowTranslation _dateWithSecureBackupDateString:]( &OBJC_CLASS___OTEscrowTranslation,  "_dateWithSecureBackupDateString:",  v11);
    v67 = v12;
    [v12 timeIntervalSince1970];
    -[OTEscrowRecordMetadata setSecureBackupTimestamp:](v4, "setSecureBackupTimestamp:", (unint64_t)v13);
    getkSecureBackupEscrowedSPKIKey();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setEscrowedSpki:](v4, "setEscrowedSpki:", v15);

    getkSecureBackupPeerInfoDataKey();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setPeerInfo:](v4, "setPeerInfo:", v17);

    getkSecureBackupSerialNumberKey();
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setSerial:](v4, "setSerial:", v19);

    getkSecureBackupBuildVersionKey();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v20];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecordMetadata setBuild:](v4, "setBuild:", v21);

    getkSecureBackupPasscodeGenerationKey();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataPasscodeGeneration);
      -[OTEscrowRecordMetadata setPasscodeGeneration:](v4, "setPasscodeGeneration:", v24);

      getkSecureBackupPasscodeGenerationKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectForKeyedSubscript:v25];
      char v26 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v27 = [v26 longLongValue];
      v28 = -[OTEscrowRecordMetadata passcodeGeneration](v4, "passcodeGeneration");
      [v28 setValue:v27];
    }

    getkSecureBackupClientMetadataKey();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v29];
    char v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataClientMetadata);
    -[OTEscrowRecordMetadata setClientMetadata:](v4, "setClientMetadata:", v31);

    [v30 objectForKeyedSubscript:@"device_platform"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v32 longLongValue];
    -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 setDevicePlatform:v33];

    [v30 objectForKeyedSubscript:@"SecureBackupMetadataTimestamp"];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _dateWithSecureBackupDateString:]( &OBJC_CLASS___OTEscrowTranslation,  "_dateWithSecureBackupDateString:",  v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

    [v36 timeIntervalSince1970];
    unint64_t v38 = (unint64_t)v37;
    v39 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v39 setSecureBackupMetadataTimestamp:v38];

    getkSecureBackupNumericPassphraseLengthKey();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 objectForKeyedSubscript:v40];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v42 = [v41 longLongValue];
    v43 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v43 setSecureBackupNumericPassphraseLength:v42];

    getkSecureBackupUsesComplexPassphraseKey();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 objectForKeyedSubscript:v44];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v45 BOOLValue];
    v47 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v47 setSecureBackupUsesComplexPassphrase:v46];

    getkSecureBackupUsesNumericPassphraseKey();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 objectForKeyedSubscript:v48];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v49 BOOLValue];
    v51 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v51 setSecureBackupUsesNumericPassphrase:v50];

    [v30 objectForKeyedSubscript:@"device_color"];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v53 setDeviceColor:v52];

    [v30 objectForKeyedSubscript:@"device_enclosure_color"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v55 setDeviceEnclosureColor:v54];

    [v30 objectForKeyedSubscript:@"device_mid"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v57 setDeviceMid:v56];

    [v30 objectForKeyedSubscript:@"device_model"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v59 setDeviceModel:v58];

    [v30 objectForKeyedSubscript:@"device_model_class"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v61 setDeviceModelClass:v60];

    [v30 objectForKeyedSubscript:@"device_model_version"];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v63 setDeviceModelVersion:v62];

    [v30 objectForKeyedSubscript:@"device_name"];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[OTEscrowRecordMetadata clientMetadata](v4, "clientMetadata");
    [v65 setDeviceName:v64];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)dictionaryToEscrowRecord:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecord);
    getkSecureBackupEscrowDateKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v5];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 timeIntervalSince1970];
    -[OTEscrowRecord setCreationDate:](v4, "setCreationDate:", (unint64_t)v7);
    [v3 objectForKeyedSubscript:@"metadata"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation dictionaryToMetadata:](&OBJC_CLASS___OTEscrowTranslation, "dictionaryToMetadata:", v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setEscrowInformationMetadata:](v4, "setEscrowInformationMetadata:", v9);

    getkSecureBackupRemainingAttemptsKey();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[OTEscrowRecord setRemainingAttempts:](v4, "setRemainingAttempts:", [v11 longLongValue]);
    getkSecureBackupRecordLabelKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v12];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setLabel:](v4, "setLabel:", v13);

    getkSecureBackupRecordStatusKey();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecordStatus:]( v4,  "setRecordStatus:",  [v15 isEqualToString:@"valid"] ^ 1);

    [v3 objectForKeyedSubscript:@"silentAttemptAllowed"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setSilentAttemptAllowed:]( v4,  "setSilentAttemptAllowed:",  [v16 BOOLValue]);

    [v3 objectForKeyedSubscript:@"FEDERATIONID"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setFederationId:](v4, "setFederationId:", v17);

    [v3 objectForKeyedSubscript:@"EXPECTEDFEDERATIONID"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setExpectedFederationId:](v4, "setExpectedFederationId:", v18);

    getkSecureBackupRecordIDKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v19];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecordId:](v4, "setRecordId:", v20);

    getkSecureBackupPeerInfoSerialNumberKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setSerialNumber:](v4, "setSerialNumber:", v22);

    getkSecureBackupCoolOffEndKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      getkSecureBackupCoolOffEndKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectForKeyedSubscript:v25];
      char v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTEscrowRecord setCoolOffEnd:](v4, "setCoolOffEnd:", [v26 longLongValue]);
    }

    getkSecureBackupRecoveryStatusKey();
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKeyedSubscript:v27];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTEscrowRecord setRecoveryStatus:](v4, "setRecoveryStatus:", [v28 intValue]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)metadataToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKeyedSubscript:v6];

    [v3 backupKeybagDigest];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:@"BackupKeybagDigest"];

    uint64_t v8 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithUnsignedLongLong:",  objc_msgSend(v3, "secureBackupUsesMultipleIcscs"));
    getkSecureBackupUsesMultipleiCSCKey();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKeyedSubscript:v9];

    [v3 bottleId];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupBottleIDKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:v11];

    [v3 bottleValidity];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v12 forKeyedSubscript:@"bottleValid"];

    objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)objc_msgSend(v3, "secureBackupTimestamp"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _stringWithSecureBackupDate:]( &OBJC_CLASS___OTEscrowTranslation,  "_stringWithSecureBackupDate:",  v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKeyedSubscript:@"com.apple.securebackup.timestamp"];

    [v3 escrowedSpki];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupEscrowedSPKIKey();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v15 forKeyedSubscript:v16];

    [v3 peerInfo];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPeerInfoDataKey();
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v17 forKeyedSubscript:v18];

    [v3 serial];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupSerialNumberKey();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:v20];

    [v3 build];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupBuildVersionKey();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:v22];

    [v3 passcodeGeneration];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = [v23 hasValue];

    if ((_DWORD)v22)
    {
      v24 = (void *)MEMORY[0x189607968];
      [v3 passcodeGeneration];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithUnsignedLongLong:", objc_msgSend(v25, "value"));
      char v26 = (void *)objc_claimAutoreleasedReturnValue();
      getkSecureBackupPasscodeGenerationKey();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v26 forKeyedSubscript:v27];
    }

    id v28 = objc_alloc(MEMORY[0x189607968]);
    [v3 clientMetadata];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    char v30 = (void *)objc_msgSend(v28, "initWithUnsignedLongLong:", objc_msgSend(v29, "devicePlatform"));
    getkSecureBackupClientMetadataKey();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v31];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 setObject:v30 forKeyedSubscript:@"device_platform"];

    uint64_t v33 = (void *)MEMORY[0x189603F50];
    [v3 clientMetadata];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v33,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)objc_msgSend(v34, "secureBackupMetadataTimestamp"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation _stringWithSecureBackupDate:]( &OBJC_CLASS___OTEscrowTranslation,  "_stringWithSecureBackupDate:",  v35);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    double v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v37];
    unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 setObject:v36 forKeyedSubscript:@"SecureBackupMetadataTimestamp"];

    id v39 = objc_alloc(MEMORY[0x189607968]);
    [v3 clientMetadata];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend( v39,  "initWithUnsignedLongLong:",  objc_msgSend(v40, "secureBackupNumericPassphraseLength"));
    getkSecureBackupClientMetadataKey();
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v42];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupNumericPassphraseLengthKey();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 setObject:v41 forKeyedSubscript:v44];

    id v45 = objc_alloc(MEMORY[0x189607968]);
    [v3 clientMetadata];
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithUnsignedLongLong:", objc_msgSend(v46, "secureBackupUsesComplexPassphrase"));
    getkSecureBackupClientMetadataKey();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v48];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesComplexPassphraseKey();
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 setObject:v47 forKeyedSubscript:v50];

    id v51 = objc_alloc(MEMORY[0x189607968]);
    [v3 clientMetadata];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithUnsignedLongLong:", objc_msgSend(v52, "secureBackupUsesNumericPassphrase"));
    getkSecureBackupClientMetadataKey();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v54];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupUsesNumericPassphraseKey();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 setObject:v53 forKeyedSubscript:v56];

    [v3 clientMetadata];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 deviceColor];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v59];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 setObject:v58 forKeyedSubscript:@"device_color"];

    [v3 clientMetadata];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 deviceEnclosureColor];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v63];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v64 setObject:v62 forKeyedSubscript:@"device_enclosure_color"];

    [v3 clientMetadata];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 deviceMid];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v67];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    [v68 setObject:v66 forKeyedSubscript:@"device_mid"];

    [v3 clientMetadata];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    [v69 deviceModel];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v71];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    [v72 setObject:v70 forKeyedSubscript:@"device_model"];

    [v3 clientMetadata];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v73 deviceModelClass];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v75];
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    [v76 setObject:v74 forKeyedSubscript:@"device_model_class"];

    [v3 clientMetadata];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 deviceModelVersion];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v79];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    [v80 setObject:v78 forKeyedSubscript:@"device_model_version"];

    [v3 clientMetadata];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 deviceName];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupClientMetadataKey();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:v83];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    [v84 setObject:v82 forKeyedSubscript:@"device_name"];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)escrowRecordToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)objc_msgSend(v3, "creationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupEscrowDateKey();
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v5 forKeyedSubscript:v6];

    [v3 escrowInformationMetadata];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation metadataToDictionary:](&OBJC_CLASS___OTEscrowTranslation, "metadataToDictionary:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v8 forKeyedSubscript:@"metadata"];

    uint64_t v9 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithUnsignedLongLong:",  objc_msgSend(v3, "remainingAttempts"));
    getkSecureBackupRemainingAttemptsKey();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKeyedSubscript:v10];

    [v3 label];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecordLabelKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:v12];

    else {
      double v13 = @"valid";
    }
    getkSecureBackupRecordStatusKey();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v13 forKeyedSubscript:v14];

    v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithUnsignedLongLong:",  objc_msgSend(v3, "silentAttemptAllowed"));
    [v4 setObject:v15 forKeyedSubscript:@"silentAttemptAllowed"];

    [v3 federationId];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKeyedSubscript:@"FEDERATIONID"];

    [v3 expectedFederationId];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v17 forKeyedSubscript:@"EXPECTEDFEDERATIONID"];

    [v3 recordId];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecordIDKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v18 forKeyedSubscript:v19];

    [v3 serialNumber];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupPeerInfoSerialNumberKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKeyedSubscript:v21];

    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v3, "coolOffEnd"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupCoolOffEndKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:v23];

    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v3, "recoveryStatus"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    getkSecureBackupRecoveryStatusKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v24 forKeyedSubscript:v25];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)dictionaryToCDPRecordContext:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    v4 = objc_alloc_init(&OBJC_CLASS___OTICDPRecordContext);
    v5 = +[OTEscrowTranslation dictionaryToEscrowAuthenticationInfo:]( &OBJC_CLASS___OTEscrowTranslation,  "dictionaryToEscrowAuthenticationInfo:",  v3);
    -[OTICDPRecordContext setAuthInfo:](v4, "setAuthInfo:", v5);

    +[OTEscrowTranslation dictionaryToCDPRecoveryInformation:]( &OBJC_CLASS___OTEscrowTranslation,  "dictionaryToCDPRecoveryInformation:",  v3);
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTICDPRecordContext setCdpInfo:](v4, "setCdpInfo:", v6);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)CDPRecordContextToDictionary:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x18960AF90] isCloudServicesAvailable])
  {
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 authInfo];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation escrowAuthenticationInfoToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "escrowAuthenticationInfoToDictionary:",  v5);
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addEntriesFromDictionary:v6];

    [v3 cdpInfo];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OTEscrowTranslation cdpRecoveryInformationToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "cdpRecoveryInformationToDictionary:",  v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addEntriesFromDictionary:v8];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (BOOL)supportedRestorePath:(id)a3
{
  id v5 = a3;
  [v5 authInfo];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v6 idmsRecovery] & 1) == 0)
  {
    [v5 authInfo];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 fmipUuid];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [v5 authInfo];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 fmipUuid];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v4 isEqualToString:&stru_18A04F9E0])
      {
        LOBYTE(v7) = 0;
        goto LABEL_8;
      }
    }

    [v5 authInfo];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 fmipRecovery])
    {

      LOBYTE(v7) = 0;
      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }

@end