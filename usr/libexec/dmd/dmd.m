LABEL_8:
    v13 = v13;
    v19 = v13;
    goto LABEL_14;
  }

  v13 = (id)objc_opt_new(&OBJC_CLASS___DMFInstallConfigurationRequest);
  [v13 setProfile:v8];
  [v13 setType:0];
  v23 = 0LL;
  v14 = +[DMDInstallConfigurationOperation validateRequest:error:]( &OBJC_CLASS___DMDInstallConfigurationOperation,  "validateRequest:error:",  v13,  &v23);
  v15 = v23;
  if ((v14 & 1) != 0) {
    goto LABEL_8;
  }
  v16 = DMFConfigurationEngineLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100060178(v15);
  }
LABEL_11:

  if (a4)
  {
    v15 = v15;
    v19 = 0LL;
    *a4 = v15;
  }

  else
  {
    v19 = 0LL;
  }
}

    v3 = 0LL;
    goto LABEL_9;
  }

  v3 = 4LL;
LABEL_9:

  return v3;
}

    v9 = 0;
    goto LABEL_9;
  }

LABEL_5:
  v9 = 1;
LABEL_9:

  return v9;
}

    v9 = 0;
    goto LABEL_9;
  }

LABEL_5:
  v9 = 1;
LABEL_9:

  return v9;
}

LABEL_14:
  return v19;
}

    goto LABEL_15;
  }

  v10 = 0;
LABEL_15:

  return v10;
}

      v12 = 0;
      goto LABEL_15;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);

    if (!v11)
    {
      if (a4)
      {
        v18 = DMFInvalidParameterErrorKey;
        v19 = @"request.originator";
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        v15 = DMFErrorWithCodeAndUserInfo(1LL, v14);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
      }

      goto LABEL_14;
    }
  }

  v12 = 1;
LABEL_15:

  return v12;
}

  v25 = v23;

  return v25;
}

  return v24;
}

void sub_100002C18( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002C38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002D00(id a1)
{
  v4[0] = CEMQuery_activeManagedUsers;
  v4[1] = CEMQuery_maximumResidentUsers;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000CCB20;
  qword_1000CCB20 = v2;
}

void sub_100002DF0(id a1)
{
  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_organizationInfo;
  void v4[2] = CEMQuery_mdmOptions;
  v4[3] = CEMQuery_lastCloudBackupDate;
  v4[4] = CEMQuery_awaitingConfiguration;
  v4[5] = CEMQuery_iTunesStoreAccountIsActive;
  v4[6] = CEMQuery_iTunesStoreAccountHash;
  v4[7] = CEMQuery_deviceName;
  v4[8] = CEMQuery_osVersion;
  v4[9] = CEMQuery_buildVersion;
  v4[10] = CEMQuery_modelName;
  v4[11] = CEMQuery_model;
  v4[12] = CEMQuery_productName;
  v4[13] = CEMQuery_marketingName;
  v4[14] = CEMQuery_serialNumber;
  v4[15] = CEMQuery_deviceCapacity;
  v4[16] = CEMQuery_availableDeviceCapacity;
  v4[17] = CEMQuery_IMEI;
  v4[18] = CEMQuery_MEID;
  v4[19] = CEMQuery_modemFirmwareVersion;
  v4[20] = CEMQuery_cellularTechnology;
  v4[21] = CEMQuery_batteryLevel;
  v4[22] = CEMQuery_isSupervised;
  v4[23] = CEMQuery_isMultiUser;
  v4[24] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[25] = CEMQuery_isActivationLockEnabled;
  v4[26] = CEMQuery_isDoNotDisturbInEffect;
  v4[27] = CEMQuery_deviceID;
  v4[28] = CEMQuery_easDeviceIdentifier;
  v4[29] = CEMQuery_isCloudBackupEnabled;
  v4[30] = CEMQuery_activeManagedUsers;
  v4[31] = CEMQuery_isMDMLostModeEnabled;
  v4[32] = CEMQuery_maximumResidentUsers;
  v4[33] = CEMQuery_diagnosticSubmissionEnabled;
  v4[34] = CEMQuery_appAnalyticsEnabled;
  v4[35] = CEMQuery_ICCID;
  v4[36] = CEMQuery_bluetoothMAC;
  v4[37] = CEMQuery_wiFiMAC;
  v4[38] = CEMQuery_ethernetMACs;
  v4[39] = CEMQuery_currentCarrierNetwork;
  v4[40] = CEMQuery_simCarrierNetwork;
  v4[41] = CEMQuery_subscriberCarrierNetwork;
  v4[42] = CEMQuery_carrierSettingsVersion;
  v4[43] = CEMQuery_phoneNumber;
  v4[44] = CEMQuery_dataRoamingEnabled;
  v4[45] = CEMQuery_voiceRoamingEnabled;
  v4[46] = CEMQuery_personalHotspotEnabled;
  v4[47] = CEMQuery_isNetworkTethered;
  v4[48] = CEMQuery_isRoaming;
  v4[49] = CEMQuery_subscriberMCC;
  v4[50] = CEMQuery_subscriberMNC;
  v4[51] = CEMQuery_currentMCC;
  v4[52] = CEMQuery_currentMNC;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 53LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000CCB30;
  qword_1000CCB30 = v2;
}

void sub_1000031B4(id a1)
{
  v4[0] = CEMQuery_iTunesStoreAccountIsActive;
  v4[1] = CEMQuery_iTunesStoreAccountHash;
  void v4[2] = CEMQuery_pushToken;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 3LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000CCB40;
  qword_1000CCB40 = v2;
}

void sub_1000032B4(id a1)
{
  v4[0] = CEMQuery_organizationInfo;
  v4[1] = CEMQuery_mdmOptions;
  void v4[2] = CEMQuery_pushToken;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 3LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_1000CCB50;
  qword_1000CCB50 = v2;
}

void sub_1000033DC(id a1)
{
  v3[0] = CEMQuery_UDID;
  v3[1] = CEMQuery_lastCloudBackupDate;
  v4[0] = DMFDeviceUniqueIdentifierKey;
  v4[1] = DMFDeviceLastCloudBackupDateKey;
  v3[2] = CEMQuery_awaitingConfiguration;
  v3[3] = CEMQuery_iTunesStoreAccountIsActive;
  void v4[2] = DMFDeviceAwaitingConfigurationKey;
  void v4[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  v3[4] = CEMQuery_iTunesStoreAccountHash;
  v3[5] = CEMQuery_deviceName;
  v4[4] = DMFDeviceiTunesStoreAccountHashKey;
  v4[5] = DMFDeviceNameKey;
  v3[6] = CEMQuery_osVersion;
  v3[7] = CEMQuery_buildVersion;
  v4[6] = DMFDeviceOSVersionKey;
  v4[7] = DMFDeviceBuildVersionKey;
  v3[8] = CEMQuery_modelName;
  v3[9] = CEMQuery_model;
  v4[8] = DMFDeviceModelNameKey;
  v4[9] = DMFDeviceModelKey;
  v3[10] = CEMQuery_productName;
  v3[11] = CEMQuery_marketingName;
  v4[10] = DMFDeviceProductNameKey;
  v4[11] = DMFDeviceMarketingNameKey;
  v3[12] = CEMQuery_serialNumber;
  v3[13] = CEMQuery_deviceCapacity;
  v4[12] = DMFDeviceSerialNumberKey;
  v4[13] = DMFDeviceCapacityKey;
  v3[14] = CEMQuery_availableDeviceCapacity;
  v3[15] = CEMQuery_IMEI;
  v4[14] = DMFDeviceAvailableCapacityKey;
  v4[15] = DMFDeviceIMEIKey;
  v3[16] = CEMQuery_MEID;
  v3[17] = CEMQuery_modemFirmwareVersion;
  v4[16] = DMFDeviceMEIDKey;
  v4[17] = DMFDeviceModemFirmwareVersionKey;
  v3[18] = CEMQuery_cellularTechnology;
  v3[19] = CEMQuery_batteryLevel;
  v4[18] = DMFDeviceCellularTechnologyKey;
  v4[19] = DMFDeviceBatteryLevelKey;
  v3[20] = CEMQuery_isSupervised;
  v3[21] = CEMQuery_isMultiUser;
  v4[20] = DMFDeviceIsSupervisedKey;
  v4[21] = DMFDeviceIsEphemeralMultiUserKey;
  v3[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v3[23] = CEMQuery_isActivationLockEnabled;
  v4[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v4[23] = DMFDeviceIsActivationLockEnabledKey;
  v3[24] = CEMQuery_isDoNotDisturbInEffect;
  v3[25] = CEMQuery_deviceID;
  v4[24] = DMFDeviceIsDNDInEffectKey;
  v4[25] = DMFDeviceIdentifierKey;
  v3[26] = CEMQuery_easDeviceIdentifier;
  v3[27] = CEMQuery_isCloudBackupEnabled;
  v4[26] = DMFDeviceEASIdentifierKey;
  v4[27] = DMFDeviceIsCloudBackupEnabledKey;
  v3[28] = CEMQuery_isMDMLostModeEnabled;
  v3[29] = CEMQuery_maximumResidentUsers;
  v4[28] = DMFDeviceIsLostModeEnabledKey;
  v4[29] = DMFDeviceMaximumResidentUsersKey;
  v3[30] = CEMQuery_diagnosticSubmissionEnabled;
  v3[31] = CEMQuery_appAnalyticsEnabled;
  v4[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v4[31] = DMFDeviceAppAnalyticsEnabledKey;
  v3[32] = CEMQuery_ICCID;
  v3[33] = CEMQuery_bluetoothMAC;
  v4[32] = DMFDeviceICCIDKey;
  v4[33] = DMFDeviceBluetoothMACKey;
  v3[34] = CEMQuery_wiFiMAC;
  v3[35] = CEMQuery_currentCarrierNetwork;
  v4[34] = DMFDeviceWiFiMACKey;
  v4[35] = DMFDeviceCurrentCarrierNetworkKey;
  v3[36] = CEMQuery_simCarrierNetwork;
  v3[37] = CEMQuery_subscriberCarrierNetwork;
  v4[36] = DMFDeviceSIMCarrierNetworkKey;
  v4[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v3[38] = CEMQuery_carrierSettingsVersion;
  v3[39] = CEMQuery_phoneNumber;
  v4[38] = DMFDeviceCarrierSettingsVersionKey;
  v4[39] = DMFDevicePhoneNumberKey;
  v3[40] = CEMQuery_dataRoamingEnabled;
  v3[41] = CEMQuery_voiceRoamingEnabled;
  v4[40] = DMFDeviceDataRoamingEnabledKey;
  v4[41] = DMFDeviceVoiceRoamingEnabledKey;
  v3[42] = CEMQuery_personalHotspotEnabled;
  v3[43] = CEMQuery_isNetworkTethered;
  v4[42] = DMFDevicePersonalHotspotEnabledKey;
  v4[43] = DMFDeviceIsNetworkTetheredKey;
  v3[44] = CEMQuery_isRoaming;
  v3[45] = CEMQuery_subscriberMCC;
  v4[44] = DMFDeviceIsRoamingKey;
  v4[45] = DMFDeviceSubscriberMCCKey;
  v3[46] = CEMQuery_subscriberMNC;
  v3[47] = CEMQuery_currentMCC;
  v4[46] = DMFDeviceSubscriberMNCKey;
  v4[47] = DMFDeviceCurrentMCCKey;
  v3[48] = CEMQuery_currentMNC;
  v4[48] = DMFDeviceCurrentMNCKey;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  49LL));
  uint64_t v2 = (void *)qword_1000CCB60;
  qword_1000CCB60 = v1;
}

void sub_100003A60(id a1)
{
  v3[0] = DMFDeviceUniqueIdentifierKey;
  v3[1] = DMFDeviceLastCloudBackupDateKey;
  v4[0] = CEMQuery_UDID;
  v4[1] = CEMQuery_lastCloudBackupDate;
  v3[2] = DMFDeviceAwaitingConfigurationKey;
  v3[3] = DMFDeviceiTunesStoreAccountIsActiveKey;
  void v4[2] = CEMQuery_awaitingConfiguration;
  void v4[3] = CEMQuery_iTunesStoreAccountIsActive;
  v3[4] = DMFDeviceiTunesStoreAccountHashKey;
  v3[5] = DMFDeviceNameKey;
  v4[4] = CEMQuery_iTunesStoreAccountHash;
  v4[5] = CEMQuery_deviceName;
  v3[6] = DMFDeviceOSVersionKey;
  v3[7] = DMFDeviceBuildVersionKey;
  v4[6] = CEMQuery_osVersion;
  v4[7] = CEMQuery_buildVersion;
  v3[8] = DMFDeviceModelNameKey;
  v3[9] = DMFDeviceModelKey;
  v4[8] = CEMQuery_modelName;
  v4[9] = CEMQuery_model;
  v3[10] = DMFDeviceProductNameKey;
  v3[11] = DMFDeviceMarketingNameKey;
  v4[10] = CEMQuery_productName;
  v4[11] = CEMQuery_marketingName;
  v3[12] = DMFDeviceSerialNumberKey;
  v3[13] = DMFDeviceCapacityKey;
  v4[12] = CEMQuery_serialNumber;
  v4[13] = CEMQuery_deviceCapacity;
  v3[14] = DMFDeviceAvailableCapacityKey;
  v3[15] = DMFDeviceIMEIKey;
  v4[14] = CEMQuery_availableDeviceCapacity;
  v4[15] = CEMQuery_IMEI;
  v3[16] = DMFDeviceMEIDKey;
  v3[17] = DMFDeviceModemFirmwareVersionKey;
  v4[16] = CEMQuery_MEID;
  v4[17] = CEMQuery_modemFirmwareVersion;
  v3[18] = DMFDeviceCellularTechnologyKey;
  v3[19] = DMFDeviceBatteryLevelKey;
  v4[18] = CEMQuery_cellularTechnology;
  v4[19] = CEMQuery_batteryLevel;
  v3[20] = DMFDeviceIsSupervisedKey;
  v3[21] = DMFDeviceIsEphemeralMultiUserKey;
  v4[20] = CEMQuery_isSupervised;
  v4[21] = CEMQuery_isMultiUser;
  v3[22] = DMFDeviceIsDeviceLocatorServiceEnabledKey;
  v3[23] = DMFDeviceIsActivationLockEnabledKey;
  v4[22] = CEMQuery_isDeviceLocatorServiceEnabled;
  v4[23] = CEMQuery_isActivationLockEnabled;
  v3[24] = DMFDeviceIsDNDInEffectKey;
  v3[25] = DMFDeviceIdentifierKey;
  v4[24] = CEMQuery_isDoNotDisturbInEffect;
  v4[25] = CEMQuery_deviceID;
  v3[26] = DMFDeviceEASIdentifierKey;
  v3[27] = DMFDeviceIsCloudBackupEnabledKey;
  v4[26] = CEMQuery_easDeviceIdentifier;
  v4[27] = CEMQuery_isCloudBackupEnabled;
  v3[28] = DMFDeviceIsLostModeEnabledKey;
  v3[29] = DMFDeviceMaximumResidentUsersKey;
  v4[28] = CEMQuery_isMDMLostModeEnabled;
  v4[29] = CEMQuery_maximumResidentUsers;
  v3[30] = DMFDeviceDiagnosticSubmissionEnabledKey;
  v3[31] = DMFDeviceAppAnalyticsEnabledKey;
  v4[30] = CEMQuery_diagnosticSubmissionEnabled;
  v4[31] = CEMQuery_appAnalyticsEnabled;
  v3[32] = DMFDeviceICCIDKey;
  v3[33] = DMFDeviceBluetoothMACKey;
  v4[32] = CEMQuery_ICCID;
  v4[33] = CEMQuery_bluetoothMAC;
  v3[34] = DMFDeviceWiFiMACKey;
  v3[35] = DMFDeviceCurrentCarrierNetworkKey;
  v4[34] = CEMQuery_wiFiMAC;
  v4[35] = CEMQuery_currentCarrierNetwork;
  v3[36] = DMFDeviceSIMCarrierNetworkKey;
  v3[37] = DMFDeviceSubscriberCarrierNetworkKey;
  v4[36] = CEMQuery_simCarrierNetwork;
  v4[37] = CEMQuery_subscriberCarrierNetwork;
  v3[38] = DMFDeviceCarrierSettingsVersionKey;
  v3[39] = DMFDevicePhoneNumberKey;
  v4[38] = CEMQuery_carrierSettingsVersion;
  v4[39] = CEMQuery_phoneNumber;
  v3[40] = DMFDeviceDataRoamingEnabledKey;
  v3[41] = DMFDeviceVoiceRoamingEnabledKey;
  v4[40] = CEMQuery_dataRoamingEnabled;
  v4[41] = CEMQuery_voiceRoamingEnabled;
  v3[42] = DMFDevicePersonalHotspotEnabledKey;
  v3[43] = DMFDeviceIsNetworkTetheredKey;
  v4[42] = CEMQuery_personalHotspotEnabled;
  v4[43] = CEMQuery_isNetworkTethered;
  v3[44] = DMFDeviceIsRoamingKey;
  v3[45] = DMFDeviceSubscriberMCCKey;
  v4[44] = CEMQuery_isRoaming;
  v4[45] = CEMQuery_subscriberMCC;
  v3[46] = DMFDeviceSubscriberMNCKey;
  v3[47] = DMFDeviceCurrentMCCKey;
  v4[46] = CEMQuery_subscriberMNC;
  v4[47] = CEMQuery_currentMCC;
  v3[48] = DMFDeviceCurrentMNCKey;
  v4[48] = CEMQuery_currentMNC;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  49LL));
  uint64_t v2 = (void *)qword_1000CCB70;
  qword_1000CCB70 = v1;
}

LABEL_11:
  return v14;
}
}

LABEL_27:
}

int64_t sub_10000A2C4(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = DMFDeclarationPayloadIdentifierKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

id sub_10000B3C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) activationPredicateObserverDidTrigger:*(void *)(a1 + 40)];
}

LABEL_33:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](&OBJC_CLASS___NSCalendar, "calendarWithIdentifier:", v4));
  return v7;
}

void sub_10000B7E4(_Unwind_Exception *a1)
{
}

void sub_10000B8A0(_Unwind_Exception *a1)
{
}

void sub_10000B92C(_Unwind_Exception *a1)
{
}

void sub_10000B9FC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) uniqueIdentifier]);
  [v1 activationPredicateObserverManager:v2 didObserveChangeForPredicateWithIdentifier:v3];
}

void sub_10000BAA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000BAB8(id a1, NSString *a2, DMDActivationPredicateObserver *a3, BOOL *a4)
{
}

LABEL_29:
      v17 = 0LL;
      goto LABEL_30;
    }

    v24 = objc_opt_class(&OBJC_CLASS___CEMPredicateAll);
    if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
    {
      v20 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadPredicates]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager _subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:]( self,  "_subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:",  v25,  v7));

      v26 = [v22 count];
      v27 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadPredicates]);
      v28 = [v27 count];

      if (v26 != v28) {
        goto LABEL_29;
      }
      v29 = &OBJC_CLASS___DMDActivationPredicateAll;
    }

    else
    {
      v30 = objc_opt_class(&OBJC_CLASS___CEMPredicateAny);
      if ((objc_opt_isKindOfClass(v6, v30) & 1) == 0)
      {
        v17 = 0LL;
        goto LABEL_17;
      }

      v20 = v6;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadPredicates]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[DMDActivationPredicateObserverManager _subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:]( self,  "_subPredicateObserversForCompoundSubPredicates:withUniqueIdentifier:",  v31,  v7));

      v32 = [v22 count];
      v33 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadPredicates]);
      v34 = [v33 count];

      if (v32 != v34) {
        goto LABEL_29;
      }
      v29 = &OBJC_CLASS___DMDActivationPredicateAny;
    }

    v23 = (DMDActivationPredicateNot *)[[v29 alloc] initWithDelegate:self uniqueIdentifier:v7 subPredicateObservers:v22 predicate:v20];
    goto LABEL_28;
  }

  v9 = -[DMDActivationBudgetObserver initWithDelegate:uniqueIdentifier:budgetPredicate:]( objc_alloc(&OBJC_CLASS___DMDActivationBudgetObserver),  "initWithDelegate:uniqueIdentifier:budgetPredicate:",  self,  v7,  v6);
LABEL_16:
  v17 = v9;
LABEL_17:

  return v17;
}

void sub_10000C6C4(id a1)
{
  id v1 = -[DMDAirPlayManager initPrivate](objc_alloc(&OBJC_CLASS___DMDAirPlayManager), "initPrivate");
  uint64_t v2 = (void *)qword_1000CCB78;
  qword_1000CCB78 = (uint64_t)v1;
}

void sub_10000CB48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

uint64_t sub_10000CB68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000CB78(uint64_t a1)
{
}

void sub_10000CB80(void *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    obj[3] = v2;
    obj[4] = v3;
    v5 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v6 = a1[8];
    uint64_t v7 = a1[6];
    uint64_t v8 = *(void *)(a1[7] + 8LL);
    obj[0] = *(id *)(v8 + 40);
    [v5 _setOutputDevices:v4 forSessionType:v6 password:v7 error:obj];
    objc_storeStrong((id *)(v8 + 40), obj[0]);
  }
}

void sub_10000D3F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000D428(uint64_t a1)
{
  double v1 = *(double *)(a1 + 64);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000D4B8;
  v5[3] = &unk_10009D8F8;
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  __int128 v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  __int128 v6 = v4;
  MRAVReconnaissanceSessionBeginSearch(v2, v5, v1);
}

uint64_t sub_10000D4B8(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4)
{
  if (cf)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFRetain(cf);
  }

  else if (a4)
  {
    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    uint64_t v12 = a4;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    uint64_t v6 = DMFErrorWithCodeAndUserInfo(1301LL, v5);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D6FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10000D71C(uint64_t a1, void *a2)
{
  id result = [a2 count];
  if (!result) {
    return result;
  }
  unint64_t v5 = 0LL;
  while (1)
  {
    values = (void *)CFArrayGetValueAtIndex((CFArrayRef)a2, v5);
    if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
      break;
    }
    uint64_t v14 = (void *)MRAVOutputDeviceCopyName();
    unsigned int v15 = [v14 isEqualToString:*(void *)(a1 + 40)];

    if (v15) {
      goto LABEL_16;
    }
LABEL_14:
    ++v5;
    id result = [a2 count];
  }

  uint64_t v6 = (void *)MRAVOutputDeviceCopyMACAddress();
  uint64_t v7 = +[NSData dataWithBytes:length:]( NSData, "dataWithBytes:length:", ether_aton((const char *)[*(id *)(a1 + 40) UTF8String]), objc_msgSend(v6, "length"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v6;
  id v10 = [v9 bytes];
  id v11 = v8;
  id v12 = [v11 bytes];
  if (![v9 length])
  {
LABEL_12:

    goto LABEL_14;
  }

  v13 = 0LL;
  do
  {
    if ((char *)[v9 length] - 1 <= v13)
    {
    }

    else if (v13[(void)v10] != v13[(void)v12])
    {
      goto LABEL_12;
    }

    ++v13;
  }

  while ([v9 length] > v13);

LABEL_16:
  CFArrayRef v16 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  CFTypeRef v17 = CFAutorelease(v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000D97C(id a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(DMDiphoneOSAppController)) initPrivate];
  uint64_t v2 = (void *)qword_1000CCB88;
  qword_1000CCB88 = (uint64_t)v1;
}

void sub_10000DD0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id sub_10000DD38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained manifest]);

  return v2;
}

void sub_10000DFBC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a2 bundleIdentifier]);
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_10000F668(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _metadataForBundleIdentifier:*(void *)(a1 + 40)]);
  if (v7) {
    goto LABEL_4;
  }
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _newMetadataDictionary];
LABEL_4:
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Attributes"]);
    [v8 setObject:v5 forKeyedSubscript:@"Removable"];

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v18 = 0LL;
    unsigned __int8 v11 = [v9 _setMetadata:v7 forBundleIdentifier:v10 error:&v18];
    id v12 = v18;
    v13 = v12;
    if ((v11 & 1) == 0 && !v12)
    {
      uint64_t v14 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    uint64_t v15 = *(void *)(a1 + 48);
    if (v15)
    {
      if (v6) {
        id v16 = v6;
      }
      else {
        id v16 = v13;
      }
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v16);
    }

    goto LABEL_13;
  }

  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v6);
  }
LABEL_13:
}

void sub_10000F780(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = DMFAppLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006090C(a1);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
LABEL_5:
    v8();
    goto LABEL_13;
  }

  if (a2 != 3)
  {
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13 != a2)
    {
      uint64_t v14 = *(void **)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000F920;
      v15[3] = &unk_10009DA08;
      id v16 = v14;
      id v18 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 40);
      +[IXAppInstallCoordinator setRemovability:forAppWithBundleID:byClient:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "setRemovability:forAppWithBundleID:byClient:completion:",  v13,  v16,  3LL,  v15);

      goto LABEL_13;
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    goto LABEL_5;
  }

  uint64_t v9 = DMFErrorWithCodeAndUserInfo(5000LL, 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = DMFAppLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000608A0(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_13:
}

void sub_10000F920(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DMFAppLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000608A0(a1);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v6();
}

void sub_100011010( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t sub_100011030(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011040(uint64_t a1)
{
}

void sub_100011048(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _metadataByBundleIdentifier]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 allKeys]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

LABEL_30:
LABEL_31:
        uint64_t v8 = v15;

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (!v7) {
        goto LABEL_35;
      }
    }
  }

  uint64_t v8 = 0LL;
LABEL_35:
}

void sub_1000120CC(id a1)
{
  v22[0] = &off_1000A5DF0;
  v22[1] = &off_1000A5E08;
  v23[0] = &off_1000A5E80;
  v23[1] = &off_1000A5DD8;
  v24[0] = &off_1000A5E68;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  v25[0] = v9;
  v24[1] = &off_1000A5DD8;
  v20[0] = &off_1000A5E98;
  v20[1] = &off_1000A5EB0;
  v21[0] = &off_1000A5DF0;
  v21[1] = &off_1000A5E68;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  v25[1] = v1;
  v24[2] = &off_1000A5E08;
  v18[0] = &off_1000A5E98;
  v18[1] = &off_1000A5EB0;
  v19[0] = &off_1000A5DF0;
  v19[1] = &off_1000A5E68;
  v18[2] = &off_1000A5DF0;
  v18[3] = &off_1000A5DD8;
  v19[2] = &off_1000A5E80;
  v19[3] = &off_1000A5E50;
  v18[4] = &off_1000A5E08;
  v19[4] = &off_1000A5E50;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));
  v25[2] = v2;
  v24[3] = &off_1000A5E20;
  v16[0] = &off_1000A5DD8;
  v16[1] = &off_1000A5E08;
  v17[0] = &off_1000A5E50;
  v17[1] = &off_1000A5E50;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  v25[3] = v3;
  v24[4] = &off_1000A5EC8;
  v14[0] = &off_1000A5EB0;
  v14[1] = &off_1000A5E08;
  v15[0] = &off_1000A5E68;
  v15[1] = &off_1000A5DD8;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  v25[4] = v4;
  v24[5] = &off_1000A5DF0;
  v12[0] = &off_1000A5EB0;
  v12[1] = &off_1000A5E08;
  v13[0] = &off_1000A5E68;
  v13[1] = &off_1000A5DD8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  v25[5] = v5;
  v24[6] = &off_1000A5E80;
  v10[0] = &off_1000A5EB0;
  v10[1] = &off_1000A5E08;
  v11[0] = &off_1000A5E68;
  v11[1] = &off_1000A5DD8;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  v25[6] = v6;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  7LL));
  uint64_t v8 = (void *)qword_1000CCB98;
  qword_1000CCB98 = v7;
}

void sub_1000129B0(id a1)
{
  v3[0] = &off_1000A5E08;
  v3[1] = &off_1000A5EE0;
  v4[0] = &off_1000A5DD8;
  v4[1] = &off_1000A5E08;
  v3[2] = &off_1000A5E98;
  v3[3] = &off_1000A5E20;
  void v4[2] = &off_1000A5DF0;
  void v4[3] = &off_1000A5EF8;
  v3[4] = &off_1000A5EB0;
  v3[5] = &off_1000A5F10;
  v4[4] = &off_1000A5E68;
  v4[5] = &off_1000A5E08;
  v3[6] = &off_1000A5DF0;
  v3[7] = &off_1000A5E68;
  v4[6] = &off_1000A5E80;
  v4[7] = &off_1000A5EF8;
  v3[8] = &off_1000A5DD8;
  v4[8] = &off_1000A5EF8;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  9LL));
  uint64_t v2 = (void *)qword_1000CCBA8;
  qword_1000CCBA8 = v1;
}

void sub_100012D80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_100012DA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _metadataByBundleIdentifier]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100013010( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23)
{
}

void sub_100013044(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _metadataByBundleIdentifier]);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = a1 + 32;
  [v5 setObject:v2 forKeyedSubscript:v7];

  id v8 = objc_loadWeakRetained(v3);
  uint64_t v9 = *(void *)(*(void *)(v6 + 24) + 8LL);
  id obj = *(id *)(v9 + 40);
  LOBYTE(WeakRetained) = [v8 writeManagementInformationToDiskWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(v6 + 16) + 8LL) + 24LL) = (_BYTE)WeakRetained;

  if (!*(_BYTE *)(*(void *)(*(void *)(v6 + 16) + 8LL) + 24LL))
  {
    uint64_t v12 = DMFAppLog(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100060DF8(v6, v13, v14, v15, v16, v17, v18, v19);
    }
  }

void sub_1000133FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
    uint64_t v13 = a4;
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(2604LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v8);
  }

  else
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v6 = 0LL;
    [v10 _getEnterpriseAppMetadataFromData:a2 completion:v11];
  }
}

void sub_1000138E4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void sub_100013928( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100013A58(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (![v8 updateState])
        {
          uint64_t v9 = *(void **)(a1 + 32);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
          [v9 addObject:v10];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v5);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_100013BFC;
  v15[3] = &unk_10009DBF0;
  uint64_t v11 = *(void **)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void **)(a1 + 64);
  id v17 = v12;
  uint64_t v18 = v13;
  id v19 = v14;
  id v20 = *(id *)(a1 + 72);
  [v11 getUpdatesWithCompletionBlock:v15];
}

void sub_100013BFC(id *a1, void *a2)
{
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        if (![v7 updateState])
        {
          id v8 = a1[4];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
          [v8 addObject:v9];
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v4);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] bundleIdentifiers]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100013F38;
  v37[3] = &unk_10009DB38;
  id v11 = a1[5];
  id v12 = a1[6];
  id v38 = v11;
  id v39 = v12;
  id v13 = v10;
  id v40 = v13;
  id v41 = a1[7];
  uint64_t v14 = objc_retainBlock(v37);
  uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v16 = [a1[5] type];
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = sub_100013FE0;
  v35[4] = sub_100013FF0;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1[5] propertyKeys]);
  uint64_t v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue([a1[6] _allPropertyKeys]);
  }
  id v36 = v19;

  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1[6] jobManager]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100014088;
  v25[3] = &unk_10009DBC8;
  id v21 = a1[5];
  v33 = v35;
  id v26 = v21;
  v30 = &stru_10009DB78;
  __int128 v22 = v14;
  id v31 = v22;
  id v34 = v16;
  id v27 = a1[4];
  __int128 v23 = v15;
  id v24 = a1[6];
  v28 = v23;
  id v29 = v24;
  id v32 = a1[8];
  [v20 getJobsUsingBlock:v25];

  _Block_object_dispose(v35, 8);
}

void sub_100013F18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_100013F38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) managedAppsOnly]
    && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) managementInformationForBundleIdentifier:v5]),
        v7,
        !v7))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    id v8 = *(void **)(a1 + 48);
    else {
      uint64_t v9 = 1LL;
    }
  }

  return v9;
}

uint64_t sub_100013FE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100013FF0(uint64_t a1)
{
}

BOOL sub_100013FF8(id a1, ASDJob *a2)
{
  uint64_t v2 = a2;
  if (-[ASDJob storeItemID](v2, "storeItemID"))
  {
    BOOL v3 = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASDJob bundleID](v2, "bundleID"));
    if ([v4 hasPrefix:@"com.apple."])
    {
      id v5 = [[LSApplicationRecord alloc] initWithBundleIdentifierOfSystemPlaceholder:v4 error:0];
      BOOL v3 = v5 != 0LL;
    }

    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

void sub_100014088(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) managedAppsOnly])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) arrayByAddingObject:@"managementInformation"]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v10);
        id v12 = objc_autoreleasePoolPush();
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
        int v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
        uint64_t v15 = *(void *)(a1 + 72);
        id v16 = (DMFApp *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 storeItemID]));
        uint64_t v17 = 1LL;
        if (!v14) {
          uint64_t v17 = 2LL;
        }
        uint64_t v18 = *(void *)(a1 + 96) & v17;

        if (v18)
        {
          id v16 = -[DMFApp initWithJob:hasUpdateAvailable:propertyKeys:]( [DMFApp alloc],  "initWithJob:hasUpdateAvailable:propertyKeys:",  v11,  [*(id *)(a1 + 40) containsObject:v13],  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
          [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v13];
LABEL_13:
        }

        objc_autoreleasePoolPop(v12);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }

    while (v8);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000144F8;
  v52[3] = &unk_10009DBA0;
  uint64_t v19 = *(void *)(a1 + 96);
  v52[4] = *(void *)(a1 + 56);
  uint64_t v57 = v19;
  id v55 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 88);
  id v53 = v20;
  uint64_t v56 = v21;
  id v54 = *(id *)(a1 + 48);
  __int128 v22 = objc_retainBlock(v52);
  id v23 = [(id)objc_opt_class(*(void *)(a1 + 56)) enumeratorForOrdinaryApps];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v64[0] = v24;
  id v25 = [(id)objc_opt_class(*(void *)(a1 + 56)) enumeratorForUserAppPlaceholders];
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v64[1] = v26;
  id v27 = [(id)objc_opt_class(*(void *)(a1 + 56)) enumeratorForSystemAppPlaceholders];
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v64[2] = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 3LL));

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v41 = v29;
  id v30 = [v41 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v43 = *(void *)v49;
    do
    {
      id v32 = 0LL;
      do
      {
        if (*(void *)v49 != v43) {
          objc_enumerationMutation(v41);
        }
        v33 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v32);
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v34 = v33;
        id v35 = [v34 countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v45;
          do
          {
            id v38 = 0LL;
            do
            {
              if (*(void *)v45 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v38);
              id v40 = objc_autoreleasePoolPush();
              ((void (*)(void *, uint64_t))v22[2])(v22, v39);
              objc_autoreleasePoolPop(v40);
              id v38 = (char *)v38 + 1;
            }

            while (v36 != v38);
            id v36 = [v34 countByEnumeratingWithState:&v44 objects:v62 count:16];
          }

          while (v36);
        }

        id v32 = (char *)v32 + 1;
      }

      while (v32 != v31);
      id v31 = [v41 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }

    while (v31);
  }

  (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
}

void sub_1000144F8(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 compatibilityObject]);
    if ((*(void *)(a1 + 72) & (unint64_t)[*(id *)(a1 + 32) appTypeFromProxy:v4]) != 0)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 itemID]);
      LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v3, v6);

      if ((_DWORD)v5)
      {
        id v7 = -[DMFApp initWithApplicationRecord:hasUpdateAvailable:propertyKeys:]( [DMFApp alloc],  "initWithApplicationRecord:hasUpdateAvailable:propertyKeys:",  v8,  [*(id *)(a1 + 40) containsObject:v3],  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v3];
      }
    }
  }
}

void sub_1000146C8(id a1)
{
  v3[0] = @"type";
  v3[1] = @"displayName";
  v3[2] = @"bundleIdentifier";
  v3[3] = @"storeItemIdentifier";
  v3[4] = @"externalVersionIdentifier";
  v3[5] = @"distributorIdentifier";
  v3[6] = @"version";
  v3[7] = @"shortVersion";
  v3[8] = @"staticUsage";
  void v3[9] = @"dynamicUsage";
  v3[10] = @"onDemandResourcesUsage";
  v3[11] = @"sharedUsage";
  v3[12] = @"installationState";
  v3[13] = @"isPlaceholder";
  v3[14] = @"isRestricted";
  v3[15] = @"isBlocked";
  v3[16] = @"isUserBasedVPP";
  v3[17] = @"isDeviceBasedVPP";
  v3[18] = @"isLicenseExpired";
  v3[19] = @"isLicenseRevoked";
  v3[20] = @"isUPP";
  v3[21] = @"isValidated";
  v3[22] = @"isAppClip";
  v3[23] = @"isAppStoreVendable";
  v3[24] = @"isBetaApp";
  v3[25] = @"isAdHocCodeSigned";
  v3[26] = @"hasUpdateAvailable";
  v3[27] = @"VPNUUIDString";
  v3[28] = @"cellularSliceUUIDString";
  v3[29] = @"contentFilterUUIDString";
  v3[30] = @"DNSProxyUUIDString";
  v3[31] = @"relayUUIDString";
  v3[32] = @"associatedDomains";
  v3[33] = @"associatedDomainsEnableDirectDownloads";
  v3[34] = @"removable";
  v3[35] = @"tapToPayScreenLock";
  v3[36] = @"allowUserToHide";
  v3[37] = @"allowUserToLock";
  v3[38] = @"configuration";
  v3[39] = @"feedback";
  v3[40] = @"sourceIdentifier";
  v3[41] = @"managementInformation";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 42LL));
  uint64_t v2 = (void *)qword_1000CCBB8;
  qword_1000CCBB8 = v1;
}

void sub_1000149B8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0LL);
  }

  else
  {
    if (v8)
    {
      NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
      id v16 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      uint64_t v12 = DMFErrorWithCodeAndUserInfo(1005LL, v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
    }

    else
    {
      uint64_t v14 = DMFErrorWithCodeAndUserInfo(1005LL, 0LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

void sub_100014C58(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!v4)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
LABEL_6:
    v3();
    goto LABEL_7;
  }

  if (!*(_BYTE *)(a1 + 56))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) _installUserAppForRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_7:
}

void sub_100014E08(uint64_t a1, void *a2)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
      LOBYTE(v9) = [v9 isEqualToString:v10];

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void **)(a1 + 40);
    __int128 v22 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_100015008;
    v16[3] = &unk_10009DCB0;
    id v17 = *(id *)(a1 + 48);
    [v12 resumeJobsWithIDs:v13 completionBlock:v16];
  }

  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = DMFErrorWithCodeAndUserInfo(1003LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }
}

void sub_100015008(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0LL);
  }

  else
  {
    if (v5)
    {
      NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
      id v13 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      uint64_t v9 = DMFErrorWithCodeAndUserInfo(1003LL, v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    }

    else
    {
      uint64_t v11 = DMFErrorWithCodeAndUserInfo(1003LL, 0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

void sub_100015318(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (id v4 = [*(id *)(a1 + 32) allowFreePurchases], (_DWORD)v4))
  {
    uint64_t v6 = DMFAppLog(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Install free app for request: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    [*(id *)(a1 + 40) _downloadAppForRequest:*(void *)(a1 + 32) type:3 completion:*(void *)(a1 + 48)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_1000154F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    uint64_t v11 = a4;
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(1005LL, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
  }

  else
  {
    int v9 = *(void (**)(uint64_t, void))(v4 + 16);
    id v6 = 0LL;
    v9(v4, 0LL);
  }
}

void sub_1000156F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100015718(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:"_updateForegroundBundleIdentifiers" withObject:0 waitUntilDone:0];
}

void sub_100015798(id a1)
{
  id v3 = (id)objc_opt_new(&OBJC_CLASS___ASDJobManagerOptions);
  [v3 setShouldFilterExternalOriginatedDownloads:0];
  uint64_t v1 = -[ASDJobManager initWithOptions:](objc_alloc(&OBJC_CLASS___ASDJobManager), "initWithOptions:", v3);
  uint64_t v2 = (void *)qword_1000CCBC8;
  qword_1000CCBC8 = (uint64_t)v1;
}

void sub_100015830(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___ASDUpdatesService);
  uint64_t v2 = (void *)qword_1000CCBD8;
  qword_1000CCBD8 = (uint64_t)v1;
}

void sub_100015BCC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void, void))(v3 + 16))(*(void *)(a1 + 32), 0LL);
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a2 authenticatedAccount]);
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0LL);
  }

void sub_100015E84(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v12 = DMFAppLog(v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    id v15 = [(id)objc_opt_class(*(void *)(a1 + 32)) changeTypeAsString:a4];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v20 = 138544130;
    __int128 v21 = v14;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v16;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Send app store request result: success: %{public}@, metadata: %{public}@, change type: %{public}@, error: %{public}@",  (uint8_t *)&v20,  0x2Au);
  }

  if (v10)
  {
    id v17 = 0LL;
    uint64_t v18 = 0LL;
    id v19 = v10;
  }

  else
  {
    id v17 = v9;
    uint64_t v18 = a4;
    id v19 = 0LL;
  }

  (*(void (**)(void, id, uint64_t, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v17, v18, v19);
}

void sub_10001640C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    id v9 = a2;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v5 = DMFErrorWithCodeAndUserInfo(1005LL, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
  }

  else
  {
    uint64_t v7 = *(void (**)(uint64_t, void))(v2 + 16);
    id v4 = 0LL;
    v7(v2, 0LL);
  }
}

void sub_1000165F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a2 bundleIdentifier]);
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_100016D98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100016DB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016DC0(uint64_t a1)
{
}

void sub_100016DC8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v7 = v5;
  if (a3 != 1)
  {
    uint64_t v8 = DMFAppLog(v5, v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100060F2C();
    }
  }

  if (v7)
  {
    uint64_t v10 = a1 + 32;
    _CFPreferencesAppSynchronizeWithContainer(*(void *)(a1 + 32), v7);
    uint64_t v11 = (void *)_CFPreferencesCopyAppValueWithContainer(@"com.apple.feedback.managed", *(void *)(a1 + 32), v7);
    if (v11)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v11, v12);
      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v16 = v11;
        id v17 = *(os_log_s **)(v15 + 40);
        *(void *)(v15 + 40) = v16;
      }

      else
      {
        uint64_t v19 = DMFAppLog(isKindOfClass, v14);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100060EC4(v10, v17, v20, v21, v22, v23, v24, v25);
        }
      }
    }
  }

  else
  {
    uint64_t v18 = DMFAppLog(v5, v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_100060E60();
    }
  }
}

void sub_100017084( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000170A4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v7 = v5;
  if (a3 != 1)
  {
    uint64_t v8 = DMFAppLog(v5, v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100060FFC();
    }
  }

  if (v7)
  {
    _CFPreferencesSetAppValueWithContainer(@"com.apple.feedback.managed", a1[5], a1[4], v7);
    _CFPreferencesAppSynchronizeWithContainer(a1[4], v7);
    _CFPreferencesPostValuesChangedInDomains(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a1[4]));
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v10 = DMFAppLog(v5, v6);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100060F98();
    }
  }
}

void sub_1000174C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___DMDAppMetadata);
  -[DMDAppMetadata setIsStoreApp:](v4, "setIsStoreApp:", 1LL);
  -[DMDAppMetadata setBundleIdentifier:](v4, "setBundleIdentifier:", *(void *)(a1 + 32));
  -[DMDAppMetadata setStoreItemIdentifier:](v4, "setStoreItemIdentifier:", *(void *)(a1 + 40));
  [*(id *)(a1 + 48) _applyStoreDictionary:v3 toAppMetadata:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppMetadata bundleIdentifier](v4, "bundleIdentifier"));
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v8 = DMFAppLog(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Get metadata with device lookup for bundle identifier: %{public}@, store item identifier: %{public}@, persona: %{public}@",  buf,  0x20u);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void **)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100017698;
    v19[3] = &unk_10009DE80;
    id v17 = *(id *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 48);
    id v21 = v17;
    v19[4] = v18;
    uint64_t v20 = v4;
    [v15 sendAppRequestWithBundleIdentifier:v13 storeItemIdentifier:v14 personaIdentifier:v16 type:2 skipDownloads:1 completion:v19];
  }
}

void sub_100017698(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v9 = v7;
  if (v7)
  {
    uint64_t v10 = DMFAppLog(v7, v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100061068((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

    (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL, v9);
  }

  else
  {
    [*(id *)(a1 + 32) _applyStoreDictionary:a2 toAppMetadata:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) setNeedsRedownload:a3 == 4];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);

    uint64_t v19 = *(void *)(a1 + 48);
    if (v18)
    {
      (*(void (**)(void, void, void))(v19 + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0LL);
    }

    else
    {
      uint64_t v20 = DMFErrorWithCodeAndUserInfo(2606LL, 0LL);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0LL, v21);
    }
  }
}

void sub_100017A80(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_100017A8C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100017B50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    uint64_t v20 = a3;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint64_t v9 = DMFErrorWithCodeAndUserInfo(1006LL, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v10);
  }

  else
  {
    id v11 = 0LL;
    id v8 = [[SSAuthenticationContext alloc] initWithAccount:v5];
    id v12 = objc_alloc(&OBJC_CLASS___SSRedeemCodesRequest);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v10 = [v12 initWithRedeemCodes:v13];

    [v10 setAuthenticationContext:v8];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_100017CFC;
    v15[3] = &unk_10009DF18;
    id v14 = *(id *)(a1 + 40);
    id v16 = 0LL;
    id v17 = v14;
    [v10 startWithRedeemResponseBlock:v15];
  }
}

void sub_100017CFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
      uint64_t v14 = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      uint64_t v10 = DMFErrorWithCodeAndUserInfo(1006LL, v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
    }

    else
    {
      uint64_t v12 = DMFErrorWithCodeAndUserInfo(1006LL, 0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
    }
  }

  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(a1 + 40), 0LL);
  }
}

void sub_100017EE8(uint64_t a1, void *a2)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
      LOBYTE(v9) = [v9 isEqualToString:v10];

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v22 = v11;
    NSErrorUserInfoKey v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_1000180E8;
    v16[3] = &unk_10009DCB0;
    id v17 = *(id *)(a1 + 48);
    [v12 cancelJobsWithIDs:v13 completionBlock:v16];
  }

  else
  {
LABEL_9:

LABEL_12:
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = DMFErrorWithCodeAndUserInfo(1100LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
  }
}

void sub_1000180E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0LL);
  }

  else
  {
    if (v5)
    {
      NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
      id v13 = v5;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      uint64_t v9 = DMFErrorWithCodeAndUserInfo(1100LL, v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
    }

    else
    {
      uint64_t v11 = DMFErrorWithCodeAndUserInfo(1100LL, 0LL);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

void sub_1000182E0(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v6 = a3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"DMDAppController+Remove+iphoneOS.m", 60, @"Assertion couldn't be acquired: %@", v6 object file lineNumber description];
  }

  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000183CC;
  v8[3] = &unk_10009DD00;
  v8[4] = v5;
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  [v5 _uninstallAppWithBundleIdentifier:v9 completion:v8];
}

void sub_1000183CC(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v3 removeTerminationAssertionForBundleIdentifier:v4];
  (*(void (**)(void))(a1[6] + 16LL))();
}

uint64_t sub_100018514(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100018AA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) _updateEndedForLifeCycle:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100018D60(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = DMFAppLog(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006113C(a1, (uint64_t)v4, v8);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DMF successfully restarted app: %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

void sub_10001905C(_Unwind_Exception *a1)
{
}

void sub_1000190F8(_Unwind_Exception *a1)
{
}

void sub_10001914C(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)qword_1000CCBE8;
  qword_1000CCBE8 = (uint64_t)v1;
}

void sub_10001993C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_10001995C(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 0LL));
  v12[0] = v1;
  v13[0] = &off_1000A5F28;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 1LL));
  v12[1] = v2;
  v13[1] = &off_1000A5F40;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 2LL));
  void v12[2] = v3;
  void v13[2] = &off_1000A5F58;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 3LL));
  v12[3] = v4;
  v13[3] = &off_1000A5F70;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 4LL));
  v12[4] = v5;
  v13[4] = &off_1000A5F88;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 5LL));
  v12[5] = v6;
  v13[5] = &off_1000A5FA0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 6LL));
  v12[6] = v7;
  v13[6] = &off_1000A5FB8;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 7LL));
  v12[7] = v8;
  v13[7] = &off_1000A5FD0;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApp stringForInstallationState:](&OBJC_CLASS___DMFApp, "stringForInstallationState:", 8LL));
  v12[8] = v9;
  v13[8] = &off_1000A5FE8;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  9LL));
  uint64_t v11 = (void *)qword_1000CCBF8;
  qword_1000CCBF8 = v10;
}

void sub_100019B60(uint64_t a1)
{
  uint64_t v2 = (void *)qword_1000CCBF8;
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 currentState]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v4]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 unsignedIntegerValue];
}

void sub_100019D30( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t sub_100019D50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100019D60(uint64_t a1)
{
}

void sub_100019D68(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v6 currentState]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 name]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100019E44(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "willStartInstallingForLifeCycle:") & 1) != 0) {
          [v12 willStartInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001A058(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didStartInstallingForLifeCycle:") & 1) != 0) {
          [v12 didStartInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001A26C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didPauseInstallingForLifeCycle:") & 1) != 0) {
          [v12 didPauseInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001A480(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didResumeInstallingForLifeCycle:") & 1) != 0) {
          [v12 didResumeInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001A694(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didCancelInstallingForLifeCycle:") & 1) != 0) {
          [v12 didCancelInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001A8A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFailInstallingForLifeCycle:") & 1) != 0) {
          [v12 didFailInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001AABC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishInstallingForLifeCycle:") & 1) != 0) {
          [v12 didFinishInstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001ACD0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "willStartUpdatingForLifeCycle:") & 1) != 0) {
          [v12 willStartUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001AEE4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didStartUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didStartUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001B0F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didPauseUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didPauseUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001B30C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didResumeUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didResumeUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001B520(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didCancelUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didCancelUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001B734(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFailUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didFailUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001B948(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishUpdatingForLifeCycle:") & 1) != 0) {
          [v12 didFinishUpdatingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001BB5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "willStartUninstallingForLifeCycle:") & 1) != 0) {
          [v12 willStartUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001BD70(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFailUninstallingForLifeCycle:") & 1) != 0) {
          [v12 didFailUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001BF84(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CATStateMachineEvent eventWithTrigger:context:]( &OBJC_CLASS___CATStateMachineEvent,  "eventWithTrigger:context:",  v4,  0LL));
  [v2 transitionWithTriggeringEvent:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(a1 + 32) setLastModified:v6];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        NSErrorUserInfoKey v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "didFinishUninstallingForLifeCycle:") & 1) != 0) {
          [v12 didFinishUninstallingForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

void sub_10001C1B8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  [v2 addPointer:*(void *)(a1 + 40)];
}

void sub_10001C290(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  id v2 = [v8 count];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0LL;
    while (1)
    {
      id v5 = *(id *)(a1 + 40);
      if (v3 == (id)++v4) {
        goto LABEL_8;
      }
    }

    [v8 removePointerAtIndex:v4];
    if (![v8 count])
    {
      id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      [v6 _removeLifeCycleForBundleIdentifier:v7];
    }
  }

void sub_10001C3B8(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v7, "didChangeInstallingProgressForLifeCycle:") & 1) != 0) {
          [v7 didChangeInstallingProgressForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_10001C544(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v7, "didChangeUpdatingProgressForLifeCycle:") & 1) != 0) {
          [v7 didChangeUpdatingProgressForLifeCycle:*(void *)(a1 + 32)];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_10001C79C(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v7, "didResetStateForLifeCycle:state:") & 1) != 0) {
          [v7 didResetStateForLifeCycle:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }
}

void sub_10001CEA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)4)
  {
    uint64_t v7 = DMFAppLog(4LL, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installed -> applicationsWillInstall -> willStartUpdating",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) willStartUpdating];
  }

  else if (v2)
  {
    uint64_t v10 = DMFAppLog(v2, v3);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v14 = 138543618;
      __int128 v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillInstall -> <no change>",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    uint64_t v4 = DMFAppLog(0LL, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalled -> applicationsWillInstall -> willStartInstalling",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) willStartInstalling];
  }

void sub_10001D0C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) currentState];
  switch((unint64_t)v4)
  {
    case 0uLL:
      uint64_t v6 = DMFAppLog(v4, v5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v32 = 138543362;
        v33 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalled -> applicationInstallsDidStart -> willStartInstalling -> didStartInstalling",  (uint8_t *)&v32,  0xCu);
      }

      [*(id *)(a1 + 32) willStartInstalling];
      goto LABEL_8;
    case 1uLL:
      uint64_t v9 = DMFAppLog(v4, v5);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v32 = 138543362;
        v33 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartInstalling",  (uint8_t *)&v32,  0xCu);
      }

LABEL_8:
      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_27;
    case 4uLL:
      uint64_t v16 = DMFAppLog(v4, v5);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v32 = 138543362;
        v33 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installed -> applicationInstallsDidStart -> willStartUpdating -> didStartUpdating",  (uint8_t *)&v32,  0xCu);
      }

      [*(id *)(a1 + 32) willStartUpdating];
      goto LABEL_17;
    case 5uLL:
      uint64_t v19 = DMFAppLog(v4, v5);
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v32 = 138543362;
        v33 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] queued -> applicationInstallsDidStart -> didStartUpdating",  (uint8_t *)&v32,  0xCu);
      }

LABEL_17:
      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_27;
    case 8uLL:
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 appState]);
      if ([v22 isDowngraded])
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 appState]);
        unsigned int v24 = [v23 isPlaceholder];

        if (v24)
        {
          uint64_t v27 = DMFAppLog(v25, v26);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
            int v32 = 138543362;
            v33 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> didFinishUninstalling (special case)",  (uint8_t *)&v32,  0xCu);
          }

          id v25 = [*(id *)(a1 + 32) didFinishUninstalling];
        }
      }

      else
      {
      }

      uint64_t v30 = DMFAppLog(v25, v26);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v32 = 138543362;
        v33 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalling -> applicationInstallsDidStart -> <no change> (not special case)",  (uint8_t *)&v32,  0xCu);
      }

      goto LABEL_26;
    default:
      uint64_t v12 = DMFAppLog(v4, v5);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
        int v32 = 138543618;
        v33 = v14;
        __int16 v34 = 2114;
        id v35 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidStart -> <no change>",  (uint8_t *)&v32,  0x16u);
      }

LABEL_26:
LABEL_27:
      return;
  }

void sub_10001D500(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)6)
  {
    uint64_t v7 = DMFAppLog(6LL, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] updating -> applicationInstallsDidChange -> didChangeUpdatingProgress",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didChangeUpdatingProgress];
  }

  else if (v2 == (id)2)
  {
    uint64_t v4 = DMFAppLog(2LL, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installing -> applicationInstallsDidChange -> didChangeInstallingProgress",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didChangeInstallingProgress];
  }

  else
  {
    uint64_t v10 = DMFAppLog(v2, v3);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v14 = 138543618;
      __int128 v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidChange -> <no change>",  (uint8_t *)&v14,  0x16u);
    }
  }

void sub_10001D724(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)6)
  {
    uint64_t v7 = DMFAppLog(6LL, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] updating -> applicationInstallsDidPause -> didPauseUpdating",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didPauseUpdating];
  }

  else if (v2 == (id)2)
  {
    uint64_t v4 = DMFAppLog(2LL, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installing -> applicationInstallsDidPause -> didPauseInstalling",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didPauseInstalling];
  }

  else
  {
    uint64_t v10 = DMFAppLog(v2, v3);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v14 = 138543618;
      __int128 v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidPause -> <no change>",  (uint8_t *)&v14,  0x16u);
    }
  }

void sub_10001D948(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  if (v2 == (id)7)
  {
    uint64_t v7 = DMFAppLog(7LL, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] update paused -> applicationInstallsDidResume -> didResumeUpdating",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didResumeUpdating];
  }

  else if (v2 == (id)3)
  {
    uint64_t v4 = DMFAppLog(3LL, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installation paused -> applicationInstallsDidResume -> didResumeInstalling",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didResumeInstalling];
  }

  else
  {
    uint64_t v10 = DMFAppLog(v2, v3);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v14 = 138543618;
      __int128 v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidResume -> <no change>",  (uint8_t *)&v14,  0x16u);
    }
  }

void sub_10001DB6C(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 5) < 3)
  {
    uint64_t v7 = DMFAppLog(v2, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationInstallsDidCancel -> didCancelUpdating",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelUpdating];
  }

  else if ((unint64_t)(v2 - 1) > 2)
  {
    uint64_t v10 = DMFAppLog(v2, v3);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v14 = 138543618;
      __int128 v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationInstallsDidCancel -> <no change>",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    uint64_t v4 = DMFAppLog(v2, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v14 = 138543362;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationInstallsDid Cancel -> didCancelInstalling",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelInstalling];
  }

void sub_10001DD98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  switch((unint64_t)v2)
  {
    case 1uLL:
      uint64_t v10 = DMFAppLog(v2, v3);
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v20 = 138543362;
        __int128 v21 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installation queued -> applicationsDidFailToInstall -> didStartInstalling -> didFailInstalling",  (uint8_t *)&v20,  0xCu);
      }

      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
      uint64_t v4 = DMFAppLog(v2, v3);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v20 = 138543362;
        __int128 v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <installing | installation paused> -> applicationsDidFailToInstall -> didFailInstalling",  (uint8_t *)&v20,  0xCu);
      }

LABEL_11:
      [*(id *)(a1 + 32) didFailInstalling];
      return;
    case 5uLL:
      uint64_t v17 = DMFAppLog(v2, v3);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v20 = 138543362;
        __int128 v21 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] update queued -> applicationsDidFailToInstall -> didStartUpdating -> didFailUpdating",  (uint8_t *)&v20,  0xCu);
      }

      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_18;
    case 6uLL:
    case 7uLL:
      uint64_t v7 = DMFAppLog(v2, v3);
      __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v20 = 138543362;
        __int128 v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <updating | update paused> -> applicationsDidFailToInstall -> didFailUpdating",  (uint8_t *)&v20,  0xCu);
      }

LABEL_18:
      [*(id *)(a1 + 32) didFailUpdating];
      break;
    default:
      uint64_t v13 = DMFAppLog(v2, v3);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
        int v20 = 138543618;
        __int128 v21 = v15;
        __int16 v22 = 2114;
        uint64_t v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToInstall -> <no change>",  (uint8_t *)&v20,  0x16u);
      }

      break;
  }

void sub_10001E0B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  switch((unint64_t)v2)
  {
    case 1uLL:
      uint64_t v4 = DMFAppLog(v2, v3);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installation queued -> applicationsDidInstall -> didStartInstalling -> didFinishInstalling",  (uint8_t *)&v26,  0xCu);
      }

      [*(id *)(a1 + 32) didStartInstalling];
      goto LABEL_11;
    case 2uLL:
      uint64_t v7 = DMFAppLog(v2, v3);
      __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installing -> applicationsDidInstall -> didFinishInstalling",  (uint8_t *)&v26,  0xCu);
      }

      goto LABEL_11;
    case 3uLL:
      uint64_t v10 = DMFAppLog(v2, v3);
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installation paused -> applicationsDidInstall -> didResumeInstalling -> didFinishInstalling",  (uint8_t *)&v26,  0xCu);
      }

      [*(id *)(a1 + 32) didResumeInstalling];
LABEL_11:
      [*(id *)(a1 + 32) didFinishInstalling];
      return;
    case 5uLL:
      uint64_t v17 = DMFAppLog(v2, v3);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] update queued -> applicationsDidInstall -> didStartUpdating -> didFinishUpdating",  (uint8_t *)&v26,  0xCu);
      }

      [*(id *)(a1 + 32) didStartUpdating];
      goto LABEL_24;
    case 6uLL:
      uint64_t v20 = DMFAppLog(v2, v3);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] updating -> applicationsDidInstall -> didFinishUpdating",  (uint8_t *)&v26,  0xCu);
      }

      goto LABEL_24;
    case 7uLL:
      uint64_t v23 = DMFAppLog(v2, v3);
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v26 = 138543362;
        uint64_t v27 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] update paused -> applicationsDidInstall -> didResumeUpdating -> didFinishUpdating",  (uint8_t *)&v26,  0xCu);
      }

      [*(id *)(a1 + 32) didResumeUpdating];
LABEL_24:
      [*(id *)(a1 + 32) didFinishUpdating];
      break;
    default:
      uint64_t v13 = DMFAppLog(v2, v3);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
        int v26 = 138543618;
        uint64_t v27 = v15;
        __int16 v28 = 2114;
        id v29 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidInstall -> <no change>",  (uint8_t *)&v26,  0x16u);
      }

      break;
  }

void sub_10001E4A8(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 1) < 3)
  {
    uint64_t v7 = DMFAppLog(v2, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v17 = 138543362;
      __int128 v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsWillUninst all -> didCancelInstalling",  (uint8_t *)&v17,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelInstalling];
  }

  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)4)
    {
      uint64_t v10 = DMFAppLog(4LL, v3);
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v17 = 138543362;
        __int128 v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] installed -> applicationsWillUninstall -> willStartUninstalling",  (uint8_t *)&v17,  0xCu);
      }

      [*(id *)(a1 + 32) willStartUninstalling];
    }

    else
    {
      uint64_t v13 = DMFAppLog(v2, v3);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
        int v17 = 138543618;
        __int128 v18 = v15;
        __int16 v19 = 2114;
        uint64_t v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsWillUninstall -> <no change>",  (uint8_t *)&v17,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v4 = DMFAppLog(v2, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v17 = 138543362;
      __int128 v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsWillUninstall -> didCancelUpdating",  (uint8_t *)&v17,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelUpdating];
  }

void sub_10001E74C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentState];
  uint64_t v4 = DMFAppLog(v2, v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == (id)8)
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v10 = 138543362;
      __int128 v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalling -> applicationsDidFailToUninstall -> didFailUninstalling",  (uint8_t *)&v10,  0xCu);
    }

    [*(id *)(a1 + 32) didFailUninstalling];
  }

  else
  {
    if (v6)
    {
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
      int v10 = 138543618;
      __int128 v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidFailToUninstall -> <no change>",  (uint8_t *)&v10,  0x16u);
    }
  }

void sub_10001E8E8(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) currentState];
  if ((unint64_t)(v2 - 1) < 3)
  {
    uint64_t v7 = DMFAppLog(v2, v3);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v17 = 138543362;
      __int128 v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <installation queued | installing | installation paused> -> applicationsDidUninsta ll -> didCancelInstalling",  (uint8_t *)&v17,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelInstalling];
  }

  else if ((unint64_t)(v2 - 5) >= 3)
  {
    if (v2 == (char *)8)
    {
      uint64_t v10 = DMFAppLog(8LL, v3);
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        int v17 = 138543362;
        __int128 v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] uninstalling -> applicationsDidUninstall -> didFinishUninstalling",  (uint8_t *)&v17,  0xCu);
      }

      [*(id *)(a1 + 32) didFinishUninstalling];
    }

    else
    {
      uint64_t v13 = DMFAppLog(v2, v3);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentStateName]);
        int v17 = 138543618;
        __int128 v18 = v15;
        __int16 v19 = 2114;
        uint64_t v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <%{public}@> -> applicationsDidUninstall -> <no change>",  (uint8_t *)&v17,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v4 = DMFAppLog(v2, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
      int v17 = 138543362;
      __int128 v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "lifecycle event: [%{public}@] <update queued | updating | update paused> -> applicationsDidUninstall -> didCancelUpdating",  (uint8_t *)&v17,  0xCu);
    }

    [*(id *)(a1 + 32) didCancelUpdating];
  }

LABEL_13:
}

          __int128 v11 = obj;
          unsigned int v24 = 0LL;
          goto LABEL_14;
        }

        id v36 = v15;
        uint64_t v37 = v16;
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        [v19 setStateDictionary:v22];

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, v23);

        int v17 = (char *)v17 + 1;
      }

      while (v13 != v17);
      __int128 v11 = obj;
      uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  unsigned int v24 = v10;
LABEL_14:

  return v24;
}

          uint64_t v13 = obj;
          uint64_t v23 = 0LL;
          goto LABEL_14;
        }

        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v22);

        int v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      uint64_t v13 = obj;
      __int128 v15 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v23 = v12;
LABEL_14:

  return v23;
}

id sub_10001F04C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v4, "endOperationWithError:");
  }
  else {
    return [v4 runWithRequest:*(void *)(a1 + 40) bundleIdentifier:a2];
  }
}

void sub_10001F274(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v37 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMAssetBase declarationForPayload:error:]( &OBJC_CLASS___CEMAssetBase,  "declarationForPayload:error:",  v8,  &v37));
  id v10 = v37;

  if (v9)
  {
    uint64_t v12 = objc_opt_respondsToSelector(v9, "dmf_installAssetOperationWithReferenceResolver:error:");
    if ((v12 & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unknownPayloadKeys]);
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

      if ([v14 count])
      {
        __int128 v15 = *(void **)(a1 + 32);
        uint64_t v43 = DMFDeclarationStateReasonKey;
        v40[0] = DMFDeclarationStateReasonKey;
        v40[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v41[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v41[1] = v14;
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
        __int128 v42 = v16;
        int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
        __int128 v44 = v17;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
        [v15 addStatusEntriesFromDictionary:v18];
      }

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetResolver]);
      id v36 = v10;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dmf_installAssetOperationWithReferenceResolver:error:", v19, &v36));
      id v21 = v36;

      uint64_t v23 = DMFConfigurationEngineLog(v22);
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = v24;
      if (v20)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          *(_DWORD *)buf = 138543362;
          uint64_t v39 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@: Asset will install", buf, 0xCu);
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
        [v27 prepareToRunOperation:v20 withContext:0 withDatabase:v28];

        [v20 addTarget:*(void *)(a1 + 32) selector:"installOperationDidFinish:asset:" forOperationEvents:6 userInfo:v9];
        [*(id *)(a1 + 32) enqueueOperation:v20];
      }

      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100061318();
        }

        [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v21];
      }

      id v10 = v21;
    }

    else
    {
      uint64_t v31 = DMFConfigurationEngineLog(v12);
      int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1000613A8();
      }

      v33 = *(void **)(a1 + 32);
      uint64_t v34 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v33 endOperationMarkingPayloadMetadata:v6 failedWithError:v35];
    }
  }

  else
  {
    uint64_t v29 = DMFConfigurationEngineLog(v11);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100061288();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
}

void sub_10001F6FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = DMFConfigurationEngineLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061488();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Installed asset successfully",  buf,  0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v16 = DMFCommandStateStatusKey;
    uint64_t v17 = DMFDeclarationStatusInstalled;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    [v13 addStatusEntriesFromDictionary:v14];

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) resultObject]);
    if (v15) {
      [v6 setInstallMetadata:v15];
    }
    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_10001F910( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_10001F9A8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v37 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMAssetBase declarationForPayload:error:]( &OBJC_CLASS___CEMAssetBase,  "declarationForPayload:error:",  v8,  &v37));
  id v10 = v37;

  if (v9)
  {
    uint64_t v12 = objc_opt_respondsToSelector(v9, "dmf_removeAssetOperationWithInstallMetadata:error:");
    if ((v12 & 1) != 0)
    {
      id v13 = [v6 installed];
      if ((v13 & 1) != 0)
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 installMetadata]);
        id v36 = v10;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dmf_removeAssetOperationWithInstallMetadata:error:", v14, &v36));
        id v16 = v36;

        uint64_t v18 = DMFConfigurationEngineLog(v17);
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v20 = v19;
        if (v15)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
            *(_DWORD *)buf = 138543362;
            id v41 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%{public}@: Installed asset will be removed",  buf,  0xCu);
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
          [v22 prepareToRunOperation:v15 withContext:0 withDatabase:v23];

          [v15 addTarget:*(void *)(a1 + 32) selector:"removeOperationDidFinish:asset:" forOperationEvents:6 userInfo:v9];
          [*(id *)(a1 + 32) enqueueOperation:v15];
        }

        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_100061518();
          }

          [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v16];
        }

        id v10 = v16;
      }

      else
      {
        uint64_t v31 = DMFConfigurationEngineLog(v13);
        int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          *(_DWORD *)buf = 138543362;
          id v41 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Uninstalled asset did remove successfully",  buf,  0xCu);
        }

        uint64_t v34 = *(void **)(a1 + 32);
        uint64_t v38 = DMFDeclarationStateStatusKey;
        uint64_t v39 = DMFDeclarationStatusRemoved;
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
        [v34 addStatusEntriesFromDictionary:v35];

        [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
      }
    }

    else
    {
      uint64_t v26 = DMFConfigurationEngineLog(v12);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000613A8();
      }

      __int16 v28 = *(void **)(a1 + 32);
      uint64_t v29 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      [v28 endOperationMarkingPayloadMetadata:v6 failedWithError:v30];
    }
  }

  else
  {
    uint64_t v24 = DMFConfigurationEngineLog(v11);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100061288();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }
}

void sub_10001FE04(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = DMFConfigurationEngineLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000615A8();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removed asset successfully",  buf,  0xCu);
    }

    id v13 = *(void **)(a1 + 32);
    uint64_t v15 = DMFCommandStateStatusKey;
    uint64_t v16 = DMFDeclarationStatusRemoved;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    [v13 addStatusEntriesFromDictionary:v14];

    [v6 setInstallMetadata:0];
    [v6 setInstalled:0];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_1000201C8(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v2 = (void *)qword_1000CCC08;
  qword_1000CCC08 = (uint64_t)v1;
}

void sub_100020460(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v54 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMCommandBase commandForPayload:error:]( &OBJC_CLASS___CEMCommandBase,  "commandForPayload:error:",  v8,  &v54));
  id v10 = v54;

  if (v9)
  {
    id v12 = [v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingCommand];
    if ((v12 & 1) != 0)
    {
      id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 unknownPayloadKeys]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);

      if ([v15 count])
      {
        uint64_t v62 = DMFCommandStateReasonKey;
        v59[0] = DMFCommandStateReasonCodeKey;
        v59[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v60[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v60[1] = v15;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
        __int128 v61 = v16;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v61, 1LL));
        v63 = v17;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
        -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v18);

        [*(id *)(a1 + 32) addStatusEntriesFromDictionary:v13];
      }

      __int128 v50 = v13;
      id v19 = v9;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 organization]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      [v20 setOrganizationIdentifier:v22];

      [v20 setAssetProvidersByPayloadIdentifier:0];
      id v53 = v10;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dmf_executeRequestWithContext:error:", v20, &v53));
      id v24 = v53;

      if (!v24)
      {
        if (v23)
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
          id v52 = 0LL;
          id v36 = (objc_class *)[v35 operationClassForRequest:v23 error:&v52];
          id v24 = v52;

          if (!v36)
          {
            uint64_t v47 = DMFConfigurationEngineLog(v37);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_100061794();
            }
            goto LABEL_8;
          }

          id v25 = [[v36 alloc] initWithRequest:v23];
          uint64_t v38 = (uint64_t)v25;
        }

        else
        {
          id v51 = 0LL;
          uint64_t v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dmf_executeOperationWithContext:error:", v20, &v51));
          id v25 = v51;
          id v24 = v25;
        }

        if (v38)
        {
          __int128 v48 = v15;
          uint64_t v39 = (void *)v38;
          uint64_t v40 = DMFConfigurationEngineLog(v25);
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
            *(_DWORD *)buf = 138543362;
            __int128 v58 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "%{public}@: Execute command will start",  buf,  0xCu);
          }

          if (objc_msgSend(v19, "dmf_requestExecutesWithoutReturning"))
          {
            uint64_t v43 = *(void **)(a1 + 32);
            uint64_t v55 = DMFCommandStateStatusKey;
            uint64_t v56 = DMFCommandStatusExecuted;
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
            [v43 addStatusEntriesFromDictionary:v44];

            [v6 setInstalled:1];
            [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
          }

          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskOperationProvider", v48, v50));
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
          [v45 prepareToRunOperation:v39 withContext:0 withDatabase:v46];

          [v39 addTarget:*(void *)(a1 + 32) selector:"operationDidFinish:userInfo:" forOperationEvents:6 userInfo:v19];
          [*(id *)(a1 + 32) enqueueOperation:v39];

          uint64_t v15 = v49;
          goto LABEL_9;
        }
      }

      uint64_t v26 = DMFConfigurationEngineLog(v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100061708();
      }
LABEL_8:

      [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v24];
LABEL_9:

      id v10 = v24;
      goto LABEL_16;
    }

    uint64_t v30 = DMFConfigurationEngineLog(v12);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100061824();
    }

    int v32 = *(void **)(a1 + 32);
    uint64_t v33 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v32 endOperationMarkingPayloadMetadata:v6 failedWithError:v34];
  }

  else
  {
    uint64_t v28 = DMFConfigurationEngineLog(v11);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10006167C();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }

LABEL_16:
}

    if (v71[5])
    {
      id v25 = objc_alloc(&OBJC_CLASS___DMFOSUpdate);
      uint64_t v16 = -[DMFOSUpdate initWithDescriptor:](v25, "initWithDescriptor:", v71[5]);
      goto LABEL_43;
    }

    if (a5)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([(id)v65[5] domain]);
      uint64_t v27 = [v26 isEqualToString:PBSOSUpdateServiceErrorDomain];

      uint64_t v28 = (void *)v65[5];
      if (v27)
      {
        uint64_t v29 = [v28 code];
        uint64_t v30 = (void *)v65[5];
        if (v29 == (id)2)
        {
          if (v30)
          {
            v84 = NSUnderlyingErrorKey;
            v85 = v30;
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
            int v32 = DMFErrorWithCodeAndUserInfo(2214LL, v31);
            uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
            *a5 = v33;
          }

          else
          {
            __int128 v48 = DMFErrorWithCodeAndUserInfo(2214LL, 0LL);
            __int128 v49 = objc_claimAutoreleasedReturnValue(v48);
            *a5 = v49;
          }

          goto LABEL_42;
        }

        uint64_t v38 = [v30 code];
        uint64_t v39 = (void *)v65[5];
        if (v38 == (id)6)
        {
          if (v39)
          {
            v82 = NSUnderlyingErrorKey;
            v83 = v39;
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v83,  &v82,  1LL));
            id v41 = DMFErrorWithCodeAndUserInfo(2200LL, v40);
            __int128 v42 = objc_claimAutoreleasedReturnValue(v41);
            *a5 = v42;
          }

          else
          {
            id v53 = DMFErrorWithCodeAndUserInfo(2200LL, 0LL);
            id v54 = objc_claimAutoreleasedReturnValue(v53);
            *a5 = v54;
          }

          goto LABEL_42;
        }

        uint64_t v43 = [v39 code];
        __int128 v44 = v65[5];
        if (v43 == (id)7)
        {
          if (v44)
          {
            v80 = NSUnderlyingErrorKey;
            v81 = v44;
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
            __int128 v46 = DMFErrorWithCodeAndUserInfo(2207LL, v45);
            uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
            *a5 = v47;
          }

          else
          {
            uint64_t v55 = DMFErrorWithCodeAndUserInfo(2207LL, 0LL);
            uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
            *a5 = v56;
          }

          goto LABEL_42;
        }

        if (v44)
        {
          v78 = NSUnderlyingErrorKey;
          v79 = v44;
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
          id v51 = DMFErrorWithCodeAndUserInfo(2213LL, v50);
          id v52 = objc_claimAutoreleasedReturnValue(v51);
          *a5 = v52;

          goto LABEL_42;
        }
      }

      else if (v28)
      {
        v76 = NSUnderlyingErrorKey;
        v77 = v28;
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
        id v35 = DMFErrorWithCodeAndUserInfo(2214LL, v34);
        id v36 = objc_claimAutoreleasedReturnValue(v35);
        *a5 = v36;

        goto LABEL_42;
      }

      uint64_t v57 = DMFErrorWithCodeAndUserInfo(2213LL, 0LL);
      __int128 v58 = objc_claimAutoreleasedReturnValue(v57);
      *a5 = v58;
    }

void sub_100020AC4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = DMFConfigurationEngineLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061900();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Executed command successfully",  buf,  0xCu);
    }

    id v13 = *(void **)(a1 + 32);
    uint64_t v23 = DMFCommandStateStatusKey;
    uint64_t v24 = DMFCommandStatusExecuted;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v13 addStatusEntriesFromDictionary:v14];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingCommand])
    {
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) resultObject]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        id v19 = *(void **)(a1 + 32);
        uint64_t v21 = DMFDeclarationStatePayloadKey;
        uint64_t v22 = v18;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        [v19 addStatusEntriesFromDictionary:v20];
      }
    }

    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

uint64_t sub_100020D24()
{
  return v0;
}

void sub_1000214AC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v17 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMCommandBase commandForPayload:error:]( &OBJC_CLASS___CEMCommandBase,  "commandForPayload:error:",  v8,  &v17));
  id v10 = v17;

  uint64_t v12 = DMFConfigurationEngineLog(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v14) {
      sub_100061A50(v6, v13);
    }
  }

  else if (v14)
  {
    sub_100061990(v6, v10, v13);
  }

  id v15 = *(void **)(a1 + 32);
  uint64_t v18 = DMFCommandStateStatusKey;
  uint64_t v19 = DMFDeclarationStatusRemoved;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  [v15 addStatusEntriesFromDictionary:v16];

  [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
}

void sub_10002168C(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC18;
  qword_1000CCC18 = (uint64_t)&off_1000A5550;
}

void sub_100021718(uint64_t a1)
{
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) supportedConfigurationTypes]);
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v2);

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) supportedAssetTypes]);
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) supportedActivationTypes]);
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v4);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v7, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));
  BOOL v6 = (void *)qword_1000CCC28;
  qword_1000CCC28 = v5;
}

void sub_100021814(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC38;
  qword_1000CCC38 = (uint64_t)&off_1000A5568;
}

void sub_10002186C(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC48;
  qword_1000CCC48 = (uint64_t)&off_1000A5580;
}

void sub_1000218C4(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC58;
  qword_1000CCC58 = (uint64_t)&off_1000A5598;
}

void sub_10002191C(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC68;
  qword_1000CCC68 = (uint64_t)&off_1000A55B0;
}

void sub_100021974(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC78;
  qword_1000CCC78 = (uint64_t)&off_1000A55C8;
}

void sub_1000219CC(id a1)
{
  uint64_t v1 = (void *)qword_1000CCC88;
  qword_1000CCC88 = (uint64_t)&off_1000A55E0;
}

void sub_100021A24(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
  id v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFSetDeclarationsRequest));
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v6 URLForResource:@"DMDConfigurationDatabaseModel" withExtension:@"momd"]);
  id v4 = -[NSManagedObjectModel initWithContentsOfURL:](v1, "initWithContentsOfURL:", v3);
  uint64_t v5 = (void *)qword_1000CCC98;
  qword_1000CCC98 = (uint64_t)v4;
}

void sub_100021BA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100021BC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100021BD0(uint64_t a1)
{
}

void sub_100021BD8(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequest](&OBJC_CLASS___DMDConfigurationOrganization, "fetchRequest"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:0]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 description]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100021EFC(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
}

void sub_100022240( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_100022270(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v18 = [v9 count];
    uint64_t v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v18);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) eventStatusMessageWithPayloadIdentifier:v7]);
          -[NSMutableArray addObject:](v11, "addObject:", v17);

          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v14);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100022438;
    v19[3] = &unk_10009E328;
    v19[4] = v18;
    [WeakRetained sendEvents:v11 organizationIdentifier:v8 completionHandler:v19];
  }
}

void sub_100022438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = DMFConfigurationEngineLog(a1);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100061AE4(a1, v6, v7);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Successfully sent %lu events from subscription manager",  (uint8_t *)&v9,  0xCu);
  }
}

void sub_100022508(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained databaseInitializationOperationDidFinish];
}

void sub_100022744(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = DMFConfigurationEngineLog(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Engine did resume", v5, 2u);
  }

  [*(id *)(a1 + 32) delegateDidResume];
  [*(id *)(a1 + 32) enqueueDeclarationProcessingOperationIfNeeded];
  objc_autoreleasePoolPop(v2);
}

id sub_1000228CC(uint64_t a1)
{
  uint64_t v2 = DMFConfigurationEngineLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Engine will suspend", v6, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  [v4 setSuspended:1];

  return [*(id *)(a1 + 32) delegateWillSuspend];
}

void sub_100022C3C(uint64_t a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) organizationControllerByIdentifier]);
  objc_sync_enter(v3);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationControllerByIdentifier", 0));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) organization]);
        -[NSMutableArray addObject:](v2, "addObject:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_sync_exit(v3);
  uint64_t v10 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchConfigurationOrganizationsResultObject);
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKey:](v2, "valueForKey:", @"identifier"));
  id v13 = -[NSDictionary initWithObjects:forKeys:](v11, "initWithObjects:forKeys:", v2, v12);
  [v10 setOrganizationsByIdentifier:v13];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100022E18(_Unwind_Exception *a1)
{
}

void sub_100022F40(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventSubscriptionManager]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startDate]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) organizationIdentifier]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 eventStatusesByPayloadIdentifierSinceStartDate:v3 organizationIdentifier:v4]);

  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchStreamEventsResultObject);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100023068;
  v9[3] = &unk_10009E3C8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = v5;
  uint64_t v7 = v5;
  [v8 enumerateKeysAndObjectsUsingBlock:v9];
  [v6 setEventStatuses:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100023068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventIdentifiers]);
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventIdentifiers]);
    unsigned int v10 = [v9 containsObject:v5];

    if (v10)
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v11 = v6;
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          __int128 v15 = 0LL;
          do
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v15),  "eventStatusMessageWithPayloadIdentifier:",  v5,  (void)v17));
            [*(id *)(a1 + 40) addObject:v16];

            __int128 v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }

        while (v13);
      }
    }
  }
}

void sub_10002384C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  v10[0] = 0LL;
  v10[1] = v10;
  void v10[2] = 0x3032000000LL;
  v10[3] = sub_100023980;
  v10[4] = sub_100023990;
  id v11 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  id v4 = [v3 newBackgroundContext];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100023998;
  v6[3] = &unk_10009E418;
  id v7 = *(id *)(a1 + 40);
  int v9 = v10;
  id v5 = v4;
  id v8 = v5;
  [v5 performBlockAndWait:v6];
  [*(id *)(a1 + 32) enqueueDeclarationProcessingOperationIfNeeded];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  _Block_object_dispose(v10, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_100023968( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100023980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100023990(uint64_t a1)
{
}

void sub_100023998(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  a1[4]));
  uint64_t v3 = (uint64_t)(a1 + 6);
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:",  a1[4]));
    id v8 = (void *)a1[5];
    uint64_t v9 = *(void *)(a1[6] + 8LL);
    id v27 = *(id *)(v9 + 40);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 executeFetchRequest:v7 error:&v27]);
    objc_storeStrong((id *)(v9 + 40), v27);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)v15) setFailed:0];
          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }

      while (v13);
    }

    __int128 v16 = (void *)a1[5];
    uint64_t v17 = *(void *)(a1[6] + 8LL);
    id v22 = *(id *)(v17 + 40);
    unsigned __int8 v18 = [v16 save:&v22];
    objc_storeStrong((id *)(v17 + 40), v22);
    if ((v18 & 1) == 0)
    {
      uint64_t v20 = DMFConfigurationEngineLog(v19);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100061B50(v3);
      }
    }
  }
}

void sub_100023CB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100061BC8(v4);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100023E50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100061BC8(v4);
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resultObject]);
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v4);
}

void sub_10002406C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[DMDEventSubscriptionRegistration initWithContext:]( objc_alloc(&OBJC_CLASS___DMDEventSubscriptionRegistration),  "initWithContext:",  v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscriptionDeclaration]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) organizationIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 declarationIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 declarationServerHash]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:",  v6,  v7,  v8));

  id v30 = 0LL;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v9 error:&v30]);
  id v11 = v30;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  -[DMDEventSubscriptionRegistration setPayloadMetadata:](v4, "setPayloadMetadata:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](v4, "payloadMetadata"));
  if (v13)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 payloadEvents]);
    -[DMDEventSubscriptionRegistration setEvents:](v4, "setEvents:", v15);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 payloadSchedule]);
    -[DMDEventSubscriptionRegistration setSchedule:](v4, "setSchedule:", v16);

    id v29 = v11;
    unsigned __int8 v17 = [v3 save:&v29];
    id v18 = v29;

    if ((v17 & 1) != 0)
    {
      [*(id *)(a1 + 40) performSelectorOnMainThread:"updateEventSubscriptions" withObject:0 waitUntilDone:1];
    }

    else
    {
      uint64_t v27 = DMFConfigurationEngineLog(v19);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100061CB8(a1 + 32);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v11 = v18;
  }

  else
  {
    uint64_t v20 = DMFConfigurationEngineLog(v14);
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100061C40(a1 + 32);
    }

    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v31 = DMFConfigurationPayloadIdentifierErrorKey;
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v5 declarationIdentifier]);
    int v32 = v23;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    uint64_t v25 = DMFErrorWithCodeAndUserInfo(4004LL, v24);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v26);
  }
}

void sub_100024410(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 32;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) organizationIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscriptionDeclaration]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 declarationIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMDEventSubscriptionRegistration fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:]( &OBJC_CLASS___DMDEventSubscriptionRegistration,  "fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:",  v5,  v7));

  id v29 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v8 error:&v29]);
  id v10 = v29;
  id v11 = v10;
  if (v9)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          [v3 deleteObject:*(void *)(*((void *)&v25 + 1) + 8 * (void)v16)];
          __int128 v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v14);
    }

    id v24 = v11;
    unsigned __int8 v17 = [v3 save:&v24];
    id v18 = v24;

    if ((v17 & 1) == 0)
    {
      uint64_t v20 = DMFConfigurationEngineLog(v19);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100061DA8(v18);
      }
    }

    [*(id *)(a1 + 40) performSelectorOnMainThread:"updateEventSubscriptions" withObject:0 waitUntilDone:1];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v11 = v18;
  }

  else
  {
    uint64_t v22 = DMFConfigurationEngineLog(v10);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100061D30(v4);
    }
  }
}

void sub_10002480C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  id v3 = [v2 newBackgroundContext];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  *(void *)(a1 + 40)));
  id v49 = 0LL;
  uint64_t v43 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v4 error:&v49]);
  id v6 = v49;

  if (v5)
  {
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    if (v42)
    {
      uint64_t v37 = (void *)(a1 + 40);
      uint64_t v38 = a1;
      uint64_t v39 = v5;
      uint64_t v40 = v6;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id obj = *(id *)(a1 + 48);
      id v8 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v46;
        uint64_t v11 = DMFDeclarationEventsMessageInReplyToKey;
        uint64_t v12 = DMFDeclarationEventsMessageEventTypeKey;
        uint64_t v13 = DMFDeclarationEventsMessageEventTimestampKey;
        uint64_t v14 = DMFDeclarationEventsMessageEventPayloadKey;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v46 != v10) {
              objc_enumerationMutation(obj);
            }
            __int128 v16 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
            unsigned __int8 v17 = -[DMDSubscriptionEvent initWithContext:]( objc_alloc(&OBJC_CLASS___DMDSubscriptionEvent),  "initWithContext:",  v43);
            -[DMDSubscriptionEvent setOrganization:](v17, "setOrganization:", v42);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v11]);
            -[DMDSubscriptionEvent setPayloadIdentifier:](v17, "setPayloadIdentifier:", v18);

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v12]);
            -[DMDSubscriptionEvent setEventType:](v17, "setEventType:", v19);

            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v13]);
            -[DMDSubscriptionEvent setDate:](v17, "setDate:", v20);

            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);
            -[DMDSubscriptionEvent setDetails:](v17, "setDetails:", v21);
          }

          id v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        }

        while (v9);
      }

      id v44 = v40;
      unsigned int v22 = [v43 save:&v44];
      id v23 = v44;

      if (v22)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v25 postNotificationName:@"DMDConfigurationSourceEventsDidChange" object:*v37];
      }

      else
      {
        uint64_t v36 = DMFConfigurationEngineLog(v24);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
          sub_100061F04(v23);
        }
      }

      uint64_t v5 = v39;

      (*(void (**)(void))(*(void *)(v38 + 56) + 16LL))();
      id v6 = v23;
    }

    else
    {
      uint64_t v28 = DMFConfigurationEngineLog(0LL);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100061E98((uint64_t *)(a1 + 40), v29, v30);
      }

      uint64_t v31 = *(void *)(a1 + 56);
      uint64_t v32 = *(void *)(a1 + 40);
      uint64_t v51 = DMFConfigurationOrganizationIdentifierErrorKey;
      uint64_t v52 = v32;
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      uint64_t v34 = DMFErrorWithCodeAndUserInfo(4002LL, v33);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v35);
    }
  }

  else
  {
    uint64_t v26 = DMFConfigurationEngineLog(v7);
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100061E20(v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_10002521C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100025244(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100061FF4((uint64_t)v2);
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*v2 resultObject]);
  if ([v7 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained enqueueOperations:v7];
  }
}

void sub_100025930( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_100025CF4(_Unwind_Exception *a1)
{
}

void sub_100025D24(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequest]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequest"));
  __int128 v47 = @"identifier";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
  [v2 setPropertiesToFetch:v3];

  [v2 setResultType:2];
  id v42 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&v42]);
  id v5 = v42;
  id v6 = v5;
  if (!v4)
  {
    uint64_t v7 = DMFConfigurationEngineLog(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000622C4(v6);
    }
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 valueForKeyPath:@"identifier"]);
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  else {
    uint64_t v11 = &__NSArray0__struct;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequest]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequest"));
  __int128 v46 = @"organization";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  [v12 setRelationshipKeyPathsForPrefetching:v13];

  id v41 = v6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 execute:&v41]);
  id v15 = v41;

  if (v14)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v33 = v14;
      id v34 = v15;
      id v35 = v4;
      uint64_t v36 = v2;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          unsigned int v22 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 organization]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);

          if (v24)
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v24]);

            if (v26)
            {
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v24]);
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
              [v27 addObject:v28];
            }

            else
            {
              uint64_t v30 = objc_alloc(&OBJC_CLASS___NSMutableArray);
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
              uint64_t v31 = -[NSMutableArray initWithObjects:](v30, "initWithObjects:", v27, 0LL);
              [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v31 forKeyedSubscript:v24];
            }
          }

          else
          {
            uint64_t v29 = DMFConfigurationEngineLog(v25);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_FAULT)) {
              sub_100062250(v43, v22, &v44, (os_log_s *)v27);
            }
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v19);
      uint64_t v4 = v35;
      uint64_t v2 = v36;
      id v15 = v34;
      uint64_t v14 = v33;
    }
  }

  else
  {
    uint64_t v32 = DMFConfigurationEngineLog(v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_1000621D8(v15);
    }
  }
}

void sub_1000260E8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006233C(v2);
    }
  }
}

void sub_100026140(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = DMFConfigurationEngineLog(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000623BC(v2);
    }
  }
}

void sub_10002633C(id *a1)
{
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100023980;
  uint64_t v26 = sub_100023990;
  id v27 = 0LL;
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] organizationIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] database]);
  id v6 = [v5 newBackgroundContext];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_10002652C;
  v16[3] = &unk_10009E598;
  id v7 = v4;
  id v17 = v7;
  __int128 v21 = &v22;
  id v20 = a1[6];
  id v8 = v2;
  id v18 = v8;
  uint64_t v9 = v3;
  id v19 = v9;
  [v6 performBlockAndWait:v16];
  uint64_t v10 = v23[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_10002697C;
  v13[3] = &unk_10009E608;
  uint64_t v11 = (void (**)(id, NSMutableDictionary *, uint64_t, void *))a1[6];
  v13[4] = a1[5];
  uint64_t v12 = v9;
  uint64_t v14 = v12;
  id v15 = &v22;
  v11[2](v11, v8, v10, v13);

  _Block_object_dispose(&v22, 8);
}

void sub_100026508( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_10002652C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPayloadMetadata fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDPayloadMetadata,  "fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:",  *(void *)(a1 + 32)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&obj]);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    id v35 = v2;
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v34 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));
          id v15 = v14;
          if (v14) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          }
          id v17 = v16;

          -[NSMutableArray addObject:](v17, "addObject:", v12);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, v18);
        }

        id v9 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }

      while (v9);
    }

    __int128 v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v41 = v6;
    id v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
    if (v40)
    {
      uint64_t v37 = DMFDeclarationStatusMessageInReplyToKey;
      uint64_t v38 = *(void *)v48;
      uint64_t v36 = DMFDeclarationStatusMessageStatesKey;
      do
      {
        for (j = 0LL; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v41);
          }
          uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)j);
          id v42 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v20, v37);
          __int128 v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v20));
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v44;
            do
            {
              for (k = 0LL; k != v24; k = (char *)k + 1)
              {
                if (*(void *)v44 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)k);
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stateDictionary]);
                -[NSMutableArray addObject:](v21, "addObject:", v28);

                uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 stateChangeTimestamp]);
                uint64_t v30 = *(void **)(a1 + 48);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v27 objectID]);
                [v30 setObject:v29 forKeyedSubscript:v31];
              }

              id v24 = [v22 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }

            while (v24);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v21, v36);
          -[NSMutableArray addObject:](v39, "addObject:", v42);
        }

        id v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
      }

      while (v40);
    }

    uint64_t v4 = v34;
    id v2 = v35;
  }

  else
  {
    uint64_t v32 = DMFConfigurationEngineLog(v5);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10006243C(a1 + 64);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_10002697C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000624B4();
    }
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_100026A6C;
    v11[3] = &unk_10009E5C0;
    id v7 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v11));
    [v10 setQueuePriority:8];
    [*(id *)(a1 + 32) enqueueDatabaseModificationOperation:v10 completionHandler:&stru_10009E5E0];
  }
}

void sub_100026A6C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  id v3 = [v2 newBackgroundContext];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026B18;
  v7[3] = &unk_10009E418;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  [v6 performBlockAndWait:v7];
}

void sub_100026B18(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata fetchRequest](&OBJC_CLASS___DMDPayloadMetadata, "fetchRequest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allKeys]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self IN %@",  v3));
  [v2 setPredicate:v4];

  uint64_t v5 = a1 + 48;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v6 + 40);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&obj]);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
  {
    uint64_t v24 = DMFConfigurationEngineLog(v8);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100062518(v5);
    }
    goto LABEL_14;
  }

  uint64_t v25 = a1 + 48;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectID]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);
        [v14 setLastStatusReportTimestamp:v17];
      }

      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v11);
  }

  id v18 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v26 = *(id *)(v19 + 40);
  unsigned __int8 v20 = [v18 save:&v26];
  objc_storeStrong((id *)(v19 + 40), v26);
  if ((v20 & 1) == 0)
  {
    uint64_t v22 = DMFConfigurationEngineLog(v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100062590(v25);
    }
LABEL_14:
  }
}

void sub_100026D68(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = DMFConfigurationEngineLog(v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100062608(v3);
    }
  }
}

void sub_100026DBC(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = DMFConfigurationEngineLog(v2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100062680(v3);
    }
  }
}

void sub_100026F24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) organizationIdentifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[DMDSubscriptionEvent fetchRequestMatchingEventsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDSubscriptionEvent,  "fetchRequestMatchingEventsFromOrganizationWithIdentifier:",  v4));

  id v33 = 0LL;
  id v26 = v3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v5 error:&v33]);
  id v7 = v33;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v9 = DMFConfigurationEngineLog(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000626F8(a1 + 32, v8, v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  uint64_t v25 = v8;
  id v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dictionaryRepresentation", v25));
        if (v19) {
          -[NSMutableArray addObject:](v11, "addObject:", v19);
        }
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectID]);
        if (v20) {
          -[NSMutableArray addObject:](v12, "addObject:", v20);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }

    while (v15);
  }

  uint64_t v34 = DMFDeclarationStatusMessagesKey;
  id v35 = v11;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000271E4;
  v27[3] = &unk_10009E650;
  uint64_t v22 = *(void *)(a1 + 48);
  v27[4] = *(void *)(a1 + 40);
  __int128 v28 = v12;
  id v23 = *(void (**)(uint64_t, void *, void, void *))(v22 + 16);
  uint64_t v24 = v12;
  v23(v22, v21, 0LL, v27);
}

void sub_1000271E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000627B8();
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000272A8;
    v8[3] = &unk_10009E0E8;
    uint64_t v9 = (os_log_s *)*(id *)(a1 + 40);
    [v7 performBackgroundTask:v8];

    uint64_t v6 = v9;
  }
}

void sub_1000272A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectWithID:*(void *)(*((void *)&v16 + 1) + 8 * (void)v8)]);
        [v3 deleteObject:v9];

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  id v15 = 0LL;
  unsigned __int8 v10 = [v3 save:&v15];
  id v11 = v15;
  uint64_t v12 = v11;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = DMFConfigurationEngineLog(v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10006281C();
    }
  }
}

void sub_1000274E0(_Unwind_Exception *a1)
{
}

void sub_100027888(_Unwind_Exception *a1)
{
}

void sub_100027AF0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100027AFC(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL);
}

uint64_t sub_100027B10(uint64_t a1)
{
  return *(void *)a1;
}

void sub_100027B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadMetadataObjectID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectWithID:v4]);

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 outgoingPayloadMetadataReferences]);
  id v8 = [v7 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v62;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 installMetadata]);
        if (!v13)
        {
          id v42 = *(void **)(a1 + 32);
          uint64_t v43 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
          id v18 = (id)objc_claimAutoreleasedReturnValue(v43);
          [v42 endOperationWithError:v18];
          goto LABEL_19;
        }

        id v14 = (void *)v13;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v15);
      }

      id v9 = [v7 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 payload]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadDictionary]);
  id v60 = 0LL;
  id v18 = (id)objc_claimAutoreleasedReturnValue( +[CEMConfigurationBase declarationForPayload:error:]( &OBJC_CLASS___CEMConfigurationBase,  "declarationForPayload:error:",  v17,  &v60));
  id v7 = v60;

  if (v18)
  {
    id v20 = [v18 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration];
    if ((v20 & 1) != 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 unknownPayloadKeys]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);

      if ([v22 count])
      {
        uint64_t v56 = *(void **)(a1 + 32);
        uint64_t v70 = DMFDeclarationStateReasonKey;
        v67[0] = DMFDeclarationStateReasonKey;
        v67[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v68[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v68[1] = v22;
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  2LL));
        v69 = v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
        v71 = v24;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
        [v56 addStatusEntriesFromDictionary:v25];
      }

      uint64_t v57 = v22;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v5 organization]);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      [v26 setOrganizationIdentifier:v28];

      [v26 setAssetProvidersByPayloadIdentifier:v6];
      id v18 = v18;
      id v59 = v7;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dmf_installRequestWithContext:error:", v26, &v59));
      id v30 = v59;

      if (v29)
      {
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
        id v58 = v30;
        id v33 = (objc_class *)[v32 operationClassForRequest:v29 error:&v58];
        id v55 = v58;

        uint64_t v35 = DMFConfigurationEngineLog(v34);
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        uint64_t v37 = v36;
        if (v33)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
            *(_DWORD *)buf = 138543362;
            v66 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%{public}@: Configuration will install",  buf,  0xCu);
          }

          id v39 = [[v33 alloc] initWithRequest:v29];
          id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
          id v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
          [v40 prepareToRunOperation:v39 withContext:0 withDatabase:v41];

          [v39 addTarget:*(void *)(a1 + 32) selector:"installationOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v18];
          [*(id *)(a1 + 32) enqueueOperation:v39];

          id v30 = v55;
          goto LABEL_33;
        }

        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1000629A0();
        }

        __int128 v53 = *(void **)(a1 + 32);
        __int128 v54 = v5;
        id v30 = v55;
      }

      else
      {
        uint64_t v51 = DMFConfigurationEngineLog(v31);
        __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          sub_100062910();
        }

        __int128 v53 = *(void **)(a1 + 32);
        __int128 v54 = v5;
      }

      [v53 endOperationMarkingPayloadMetadata:v54 failedWithError:v30];
LABEL_33:

      id v7 = v30;
      goto LABEL_19;
    }

    uint64_t v46 = DMFConfigurationEngineLog(v20);
    __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100062A2C();
    }

    __int128 v48 = *(void **)(a1 + 32);
    uint64_t v49 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    [v48 endOperationMarkingPayloadMetadata:v5 failedWithError:v50];
  }

  else
  {
    uint64_t v44 = DMFConfigurationEngineLog(v19);
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100062880();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v5 failedWithError:v7];
  }

LABEL_19:
}

void sub_1000281FC(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  id v8 = a1 + 5;
  id v7 = a1[5];
  if (!v7)
  {
LABEL_7:
    uint64_t v16 = DMFConfigurationEngineLog(v7);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Configuration did install successfully ",  buf,  0xCu);
    }

    id v19 = a1[4];
    uint64_t v31 = DMFDeclarationStateStatusKey;
    uint64_t v32 = DMFDeclarationStatusInstalled;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    [v19 addStatusEntriesFromDictionary:v20];

    if ([a1[6] conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v21 = a1[6];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([a1[7] resultObject]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([a1[4] payloadContext]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dmf_statusForResult:context:", v22, v23));

      if (v24)
      {
        id v25 = a1[4];
        uint64_t v29 = DMFDeclarationStatePayloadKey;
        id v30 = v24;
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
        [v25 addStatusEntriesFromDictionary:v26];
      }
    }

    [v6 setInstalled:1];
    [a1[4] endOperationWithPayloadMetadata:v6];
    goto LABEL_18;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v9 isEqualToString:DMFErrorDomain])
  {
    id v10 = [*v8 code];

    if (v10 == (id)1900)
    {
      uint64_t v12 = DMFConfigurationEngineLog(v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*v8 verboseDescription]);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v14;
        __int16 v35 = 2114;
        uint64_t v36 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Ignoring expected removal error: %{public}@",  buf,  0x16u);
      }

      goto LABEL_7;
    }
  }

  else
  {
  }

  uint64_t v27 = DMFConfigurationEngineLog(v11);
  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_100062B04();
  }

  [a1[4] endOperationMarkingPayloadMetadata:v6 failedWithError:a1[5]];
LABEL_18:
}

uint64_t sub_100028528()
{
  return objc_opt_class(v0);
}

void sub_100029BF0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v60 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMConfigurationBase declarationForPayload:error:]( &OBJC_CLASS___CEMConfigurationBase,  "declarationForPayload:error:",  v8,  &v60));
  id v10 = v60;

  if (v9)
  {
    id v12 = [v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration];
    if ((v12 & 1) == 0)
    {
      uint64_t v33 = DMFConfigurationEngineLog(v12);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100062A2C();
      }

      __int16 v35 = *(void **)(a1 + 32);
      uint64_t v36 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v36);
      [v35 endOperationMarkingPayloadMetadata:v6 failedWithError:v14];
      goto LABEL_30;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unknownPayloadKeys]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

    if ([v14 count])
    {
      id v15 = *(void **)(a1 + 32);
      uint64_t v70 = DMFDeclarationStateReasonKey;
      v67[0] = DMFCommandStateReasonCodeKey;
      v67[1] = DMFCEMReasonCodeUnknownPayloadKeys;
      v68[0] = DMFCEMReasonCodeUnknownPayloadKeys;
      v68[1] = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  2LL));
      v69 = v16;
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
      v71 = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
      [v15 addStatusEntriesFromDictionary:v18];
    }

    id v19 = [v6 installed];
    if ((v19 & 1) == 0)
    {
      uint64_t v37 = DMFConfigurationEngineLog(v19);
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        *(_DWORD *)buf = 138543362;
        v66 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Uninstalled configuration did remove successfully",  buf,  0xCu);
      }

      id v40 = *(void **)(a1 + 32);
      uint64_t v63 = DMFDeclarationStateStatusKey;
      uint64_t v64 = DMFDeclarationStatusRemoved;
      id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
      [v40 addStatusEntriesFromDictionary:v41];

      [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
      goto LABEL_30;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 organization]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
    [v20 setOrganizationIdentifier:v22];

    [v20 setAssetProvidersByPayloadIdentifier:0];
    id v23 = v9;
    id v59 = v10;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dmf_removeRequestWithContext:error:", v20, &v59));
    id v25 = v59;

    if (v24 || !v25)
    {
      if (!v24)
      {
        uint64_t v52 = DMFConfigurationEngineLog(v26);
        __int128 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          *(_DWORD *)buf = 138543362;
          v66 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Installed configuration did remove successfully",  buf,  0xCu);
        }

        __int128 v54 = *(void **)(a1 + 32);
        uint64_t v61 = DMFDeclarationStateStatusKey;
        uint64_t v62 = DMFDeclarationStatusRemoved;
        id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
        [v54 addStatusEntriesFromDictionary:v55];

        [v6 setInstalled:0];
        [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
        goto LABEL_29;
      }

      id v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
      id v58 = v25;
      uint64_t v43 = (objc_class *)[v42 operationClassForRequest:v24 error:&v58];
      id v56 = v58;

      uint64_t v45 = DMFConfigurationEngineLog(v44);
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      __int128 v47 = v46;
      if (v43)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          *(_DWORD *)buf = 138543362;
          v66 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "%{public}@: Installed configuration will remove",  buf,  0xCu);
        }

        id v49 = [[v43 alloc] initWithRequest:v24];
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
        [v50 prepareToRunOperation:v49 withContext:0 withDatabase:v51];

        [v49 addTarget:*(void *)(a1 + 32) selector:"removalOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v23];
        [*(id *)(a1 + 32) enqueueOperation:v49];

        id v25 = v56;
        goto LABEL_29;
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100062D48();
      }

      uint64_t v29 = *(void **)(a1 + 32);
      id v30 = v6;
      id v25 = v56;
    }

    else
    {
      uint64_t v27 = DMFConfigurationEngineLog(v26);
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100062CB8();
      }

      uint64_t v29 = *(void **)(a1 + 32);
      id v30 = v6;
    }

    objc_msgSend(v29, "endOperationMarkingPayloadMetadata:failedWithError:", v30, v25, v56);
LABEL_29:

    id v10 = v25;
LABEL_30:

    goto LABEL_31;
  }

  uint64_t v31 = DMFConfigurationEngineLog(v11);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_100062C28();
  }

  [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
LABEL_31:
}

void sub_10002A32C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = DMFConfigurationEngineLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100062DD4();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Configuration did remove successfully",  buf,  0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v23 = DMFDeclarationStateStatusKey;
    uint64_t v24 = DMFDeclarationStatusRemoved;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v13 addStatusEntriesFromDictionary:v14];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) resultObject]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        id v19 = *(void **)(a1 + 32);
        uint64_t v21 = DMFDeclarationStatePayloadKey;
        uint64_t v22 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        [v19 addStatusEntriesFromDictionary:v20];
      }
    }

    [v6 setInstalled:0];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_10002A6D0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadDictionary]);
  id v50 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CEMConfigurationBase declarationForPayload:error:]( &OBJC_CLASS___CEMConfigurationBase,  "declarationForPayload:error:",  v8,  &v50));
  id v10 = v50;

  if (v9)
  {
    id v12 = [v9 conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration];
    if ((v12 & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 unknownPayloadKeys]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

      if ([v14 count])
      {
        id v15 = *(void **)(a1 + 32);
        uint64_t v56 = DMFDeclarationStateReasonKey;
        v53[0] = DMFCommandStateReasonCodeKey;
        v53[1] = DMFCEMReasonCodeUnknownPayloadKeys;
        v54[0] = DMFCEMReasonCodeUnknownPayloadKeys;
        v54[1] = v14;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  2LL));
        id v55 = v16;
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
        uint64_t v57 = v17;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
        [v15 addStatusEntriesFromDictionary:v18];
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 organization]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
      [v19 setOrganizationIdentifier:v21];

      [v19 setAssetProvidersByPayloadIdentifier:0];
      id v22 = v9;
      id v49 = v10;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dmf_replaceRequestWithContext:error:", v19, &v49));
      id v24 = v49;

      if (v23)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
        id v48 = v24;
        uint64_t v27 = (objc_class *)[v26 operationClassForRequest:v23 error:&v48];
        id v47 = v48;

        uint64_t v29 = DMFConfigurationEngineLog(v28);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        uint64_t v31 = v30;
        if (v27)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
            *(_DWORD *)buf = 138543362;
            uint64_t v52 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%{public}@: Configuration will replace",  buf,  0xCu);
          }

          id v33 = [[v27 alloc] initWithRequest:v23];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) taskOperationProvider]);
          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
          [v34 prepareToRunOperation:v33 withContext:0 withDatabase:v35];

          [v33 addTarget:*(void *)(a1 + 32) selector:"installationOperationDidFinish:userInfo:" forOperationEvents:6 userInfo:v22];
          [*(id *)(a1 + 32) enqueueOperation:v33];

          id v24 = v47;
          goto LABEL_23;
        }

        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100062F84();
        }

        uint64_t v45 = *(void **)(a1 + 32);
        uint64_t v46 = v6;
        id v24 = v47;
      }

      else
      {
        uint64_t v43 = DMFConfigurationEngineLog(v25);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100062EF4();
        }

        uint64_t v45 = *(void **)(a1 + 32);
        uint64_t v46 = v6;
      }

      objc_msgSend(v45, "endOperationMarkingPayloadMetadata:failedWithError:", v46, v24, v47);
LABEL_23:

      id v10 = v24;
      goto LABEL_24;
    }

    uint64_t v38 = DMFConfigurationEngineLog(v12);
    id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100062A2C();
    }

    id v40 = *(void **)(a1 + 32);
    uint64_t v41 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    [v40 endOperationMarkingPayloadMetadata:v6 failedWithError:v42];
  }

  else
  {
    uint64_t v36 = DMFConfigurationEngineLog(v11);
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100062E64();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:v10];
  }

LABEL_24:
}

  if ((_DWORD)v9) {
    uint64_t v27 = 1LL;
  }
  else {
    uint64_t v27 = v22;
  }
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
  [v28 setRunAsUser:v27];

LABEL_28:
  if (a7) {
    *a7 = v16;
  }
  if (v16) {
    uint64_t v29 = 0LL;
  }
  else {
    uint64_t v29 = v15;
  }
  id v30 = v29;

  return v30;
}

void sub_10002AC64(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadMetadataObjectID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithID:v5]);

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = DMFConfigurationEngineLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100063010();
    }

    [*(id *)(a1 + 32) endOperationMarkingPayloadMetadata:v6 failedWithError:*(void *)(a1 + 40)];
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Configuration did replace successfully",  buf,  0xCu);
    }

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v23 = DMFDeclarationStateStatusKey;
    uint64_t v24 = DMFDeclarationStatusInstalled;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v13 addStatusEntriesFromDictionary:v14];

    if ([*(id *)(a1 + 48) conformsToProtocol:&OBJC_PROTOCOL___DMDRequestProvidingConfiguration])
    {
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) resultObject]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadContext]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dmf_statusForResult:context:", v16, v17));

      if (v18)
      {
        id v19 = *(void **)(a1 + 32);
        uint64_t v21 = DMFDeclarationStatePayloadKey;
        id v22 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        [v19 addStatusEntriesFromDictionary:v20];
      }
    }

    [v6 setInstalled:1];
    [*(id *)(a1 + 32) endOperationWithPayloadMetadata:v6];
  }
}

void sub_10002B02C(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DMDSecureUnarchiveFromConfigurationSourceDataTransformer);
  +[DMDSecureUnarchiveFromConfigurationSourceDataTransformer setValueTransformer:forName:]( &OBJC_CLASS___DMDSecureUnarchiveFromConfigurationSourceDataTransformer,  "setValueTransformer:forName:",  v1,  @"DMDSecureUnarchiveFromConfigurationSourceDataTransformer");
}

void sub_10002B0B8(id a1)
{
  v3[0] = objc_opt_class(&OBJC_CLASS___NSXPCListenerEndpoint);
  v3[1] = objc_opt_class(&OBJC_CLASS___DMFReportingRequirements);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 2LL));
  id v2 = (void *)qword_1000CCCB0;
  qword_1000CCCB0 = v1;
}

void sub_10002B1C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = DMFConfigurationEngineLog(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000630A0(a1, v7);
    }

    [*(id *)(a1 + 40) assetResolutionFailedWithError:v7];
    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetReference]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_10002B2D0;
    v13[3] = &unk_10009E6C0;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v14 = 0LL;
    uint64_t v15 = v11;
    id v16 = v12;
    [v5 configurationEngineRequestedAsset:v10 completion:v13];
  }
}

void sub_10002B2D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = DMFConfigurationEngineLog(v6);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100063150(a1, v6);
    }

    [*(id *)(a1 + 48) assetResolutionFailedWithError:*(void *)(a1 + 32)];
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetIdentifier]);
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}@ successfully resolved asset %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    [*(id *)(a1 + 48) assetResolutionDidSucceedWithAssetURL:v5];
  }

  [*(id *)(a1 + 40) endOperationWithResultObject:0];
}

void sub_10002B47C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10002BF90( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002C080(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = DMFConfigurationEngineLog(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100063394(a1, v8);
    }
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:DMFDeclarationEventsMessagesKey]);
    id v14 = [v13 count];

    if (v14)
    {
      id v16 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10002C248;
      v19[3] = &unk_10009E738;
      id v20 = 0LL;
      uint64_t v21 = v16;
      id v22 = v7;
      id v23 = v10;
      [v16 fetchRemoteProxy:v19];

      goto LABEL_7;
    }

    uint64_t v17 = DMFConfigurationEngineLog(v15);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@ skipping events because there are no updates to report",  buf,  0xCu);
    }
  }

  [*(id *)(a1 + 32) endOperationWithResultObject:0];
LABEL_7:
}

void sub_10002C248(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = DMFConfigurationEngineLog(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006342C(a1, v6);
    }

    [*(id *)(a1 + 40) endOperationWithResultObject:0];
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_10002C324;
    v10[3] = &unk_10009E710;
    uint64_t v9 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 56);
    [a2 configurationEventsDidChange:v9 completion:v10];
  }
}

void sub_10002C324(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DMFConfigurationEngineLog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000634C4(a1, v3);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@ successfully sent events",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
  [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_10002C820(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = DMFConfigurationEngineLog(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006355C(a1, v8);
    }
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:DMFDeclarationStatusMessagesKey]);
    id v14 = [v13 count];

    if (v14)
    {
      id v16 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10002C9E0;
      v19[3] = &unk_10009E788;
      void v19[4] = v16;
      id v20 = v7;
      id v21 = v10;
      [v16 fetchRemoteProxy:v19];

      goto LABEL_7;
    }

    uint64_t v17 = DMFConfigurationEngineLog(v15);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
      *(_DWORD *)buf = 138543362;
      id v23 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@ skipping status update because there are no updates to report",  buf,  0xCu);
    }
  }

  [*(id *)(a1 + 32) endOperationWithResultObject:0];
LABEL_7:
}

void sub_10002C9E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = DMFConfigurationEngineLog(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000635F4(a1, v6);
    }

    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_10002CAB8;
    v10[3] = &unk_10009E710;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [a2 configurationStatusDidChange:v9 completion:v10];
  }
}

void sub_10002CAB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DMFConfigurationEngineLog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006368C(a1, v3);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@ successfully sent status updates",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
  [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_10002CD5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFConfigurationEngineLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Connected successfully to anonymous connection",  buf,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100063724((uint64_t)v6, v9);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_10002CE8C;
    v13[3] = &unk_10009E7B0;
    id v10 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    void v13[4] = v12;
    id v14 = v6;
    [v10 _tryConnectingToNamedService:1 completion:v13];
  }
}

void sub_10002CE8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFConfigurationEngineLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Connected successfully to named connection",  v11,  2u);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100063798(a1, v9);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  }

  v10();
}

void sub_10002D1FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10002D214(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002D224(uint64_t a1)
{
}

void sub_10002D22C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_10002D26C(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;
}

id sub_10002D4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10002D7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10002E784(id a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(DMDtvOSDeviceController)) initPrivate];
  uint64_t v2 = (void *)qword_1000CCCC0;
  qword_1000CCCC0 = (uint64_t)v1;
}

void sub_10002EFB0(_Unwind_Exception *a1)
{
}

void sub_10002EFF0(uint64_t a1)
{
  uint64_t v2 = DMFConfigurationEngineLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Detected keychain lock change", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained keybagLockStateDidChange];
}

void sub_10002F06C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained keybagLockStateDidChange];

  uint64_t v3 = DMFConfigurationEngineLog(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Detected keychain first unlock", v5, 2u);
  }
}

void sub_10002F0E4(uint64_t a1)
{
  uint64_t v2 = DMFConfigurationEngineLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Detected network change", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained networkDidChange];
}

uint64_t DMDPolicyFromDeclarationMode(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_8;
  }
  if (([v1 isEqualToString:DMFDeclarationPayloadModeDisallowed] & 1) == 0)
  {
    if ([v2 isEqualToString:DMFDeclarationPayloadModeAsk])
    {
      uint64_t v3 = 2LL;
      goto LABEL_9;
    }

    if ([v2 isEqualToString:DMFDeclarationPayloadModeWarn])
    {
      uint64_t v3 = 1LL;
      goto LABEL_9;
    }

uint64_t DMDDeclarationModeIsValid(void *a1)
{
  uint64_t v1 = DMFDeclarationPayloadModeOverride;
  id v2 = a1;
  unsigned int v3 = [v2 isEqualToString:v1];
  unsigned int v4 = [v2 isEqualToString:DMFDeclarationPayloadModeDisallowed];
  unsigned int v5 = [v2 isEqualToString:DMFDeclarationPayloadModeAsk];
  unsigned int v6 = [v2 isEqualToString:DMFDeclarationPayloadModeWarn];
  unsigned int v7 = [v2 isEqualToString:DMFDeclarationPayloadModeAllowed];

  if (v2) {
    int v8 = v3;
  }
  else {
    int v8 = 1;
  }
  if (v8 | v4 | v5) {
    return v2 != 0LL;
  }
  else {
    return v6 | v7;
  }
}

LABEL_20:
}

      id v22 = v12 != 0LL;
      uint64_t v24 = 5LL;
      goto LABEL_23;
    }

    id v22 = 1;
LABEL_22:
    uint64_t v24 = 4800LL;
    goto LABEL_23;
  }

  id v22 = v12 != 0LL;
  if (v12) {
    id v23 = v21;
  }
  else {
    id v23 = 1;
  }
  if ((v23 & 1) == 0) {
    goto LABEL_22;
  }
  if (!(_DWORD)v9) {
    goto LABEL_24;
  }
LABEL_12:
  if (!v22 && v19 != (_DWORD)v9)
  {
    id v22 = 0;
    uint64_t v24 = 4801LL;
LABEL_23:
    uint64_t v25 = DMFErrorWithCodeAndUserInfo(v24, 0LL);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);

    id v16 = (id)v26;
  }

void sub_100030210(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = v3;
  if (v3)
  {
    uint64_t v5 = DMFConfigurationEngineLog(v3);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100063B04(v4);
    }

    [*(id *)(a1 + 32) endOperationWithError:v4];
  }

  else
  {
    unsigned int v7 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000302CC;
    v8[3] = &unk_10009E650;
    id v9 = 0LL;
    id v10 = v7;
    [v7 fixupDatabaseWithCompletionHandler:v8];
  }
}

void sub_1000302CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = DMFConfigurationEngineLog(a1);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100063B80(a1);
    }

    [*(id *)(a1 + 40) setError:*(void *)(a1 + 32)];
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "successfully loaded configuration database",  v7,  2u);
    }
  }

void sub_1000307D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DMFConfigurationEngineLog(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 verboseDescription]);
      *(_DWORD *)buf = 138543618;
      id v29 = v5;
      __int16 v30 = 2114;
      uint64_t v31 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "unable to load persistent store %{public}@: %{public}@",  buf,  0x16u);
    }

    [*(id *)(a1 + 32) addObject:v6];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100063D24((uint64_t)v5, v9);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  unsigned int v12 = [v11 isEqualToString:NSSQLiteStoreType];

  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
    id v25 = 0LL;
    unsigned __int8 v14 = [v13 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v25];
    id v15 = v25;

    if ((v14 & 1) == 0)
    {
      uint64_t v17 = DMFConfigurationEngineLog(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100063C74((uint64_t)v5, v15, v18);
      }
    }
  }

  [*(id *)(a1 + 40) removeObject:v5];
  if (![*(id *)(a1 + 40) count])
  {
    id v19 = [*(id *)(a1 + 32) count];
    uint64_t v20 = *(void *)(a1 + 48);
    if (v19)
    {
      uint64_t v26 = DMFErrorFailedConfigurationDatabaseStoreKey;
      id v21 = [*(id *)(a1 + 32) copy];
      id v27 = v21;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      uint64_t v23 = DMFErrorWithCodeAndUserInfo(4007LL, v22);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v24);
    }

    else
    {
      (*(void (**)(void, void))(v20 + 16))(*(void *)(a1 + 48), 0LL);
    }
  }
}

void sub_100030AE0(uint64_t a1, void *a2)
{
  id v34 = a2;
  uint64_t v35 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentStoreCoordinator]);

  __int128 v42 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v39 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v36 persistentStores]);
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v36 metadataForPersistentStore:v9]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:@"DMDEngineDatabaseFixedDigitalHealthUsageEventMetadataKey"]);
        unsigned __int8 v12 = [v11 BOOLValue];

        if ((v12 & 1) == 0)
        {
          uint64_t v14 = DMFConfigurationEngineLog(v13);
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v9;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "persistent store %{public}@ has not been fixed up yet",  buf,  0xCu);
          }

          char v6 = 1;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }

    while (v5);

    if ((v6 & 1) != 0)
    {
      uint64_t v17 = DMFConfigurationEngineLog(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100063D98(v18);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[DMDEventSubscriptionRegistration fetchRequest]( &OBJC_CLASS___DMDEventSubscriptionRegistration,  "fetchRequest"));
      id v38 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 execute:&v38]);
      id v21 = v38;
      id v22 = v21;
      if (v20)
      {
        uint64_t v23 = *(void **)(v35 + 32);
        id v37 = v22;
        unsigned __int8 v24 = [v23 updateMetadataForManagedObjectContext:v34 error:&v37];
        id v25 = v37;

        uint64_t v26 = *(void *)(v35 + 40);
        if ((v24 & 1) != 0)
        {
          (*(void (**)(void, void))(v26 + 16))(*(void *)(v35 + 40), 0LL);
LABEL_31:

          goto LABEL_32;
        }

        if (v25)
        {
          NSErrorUserInfoKey v43 = NSUnderlyingErrorKey;
          id v44 = v25;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          uint64_t v31 = DMFErrorWithCodeAndUserInfo(4007LL, v28);
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v31);
        }

        else
        {
          uint64_t v33 = DMFErrorWithCodeAndUserInfo(4007LL, 0LL);
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v33);
          uint64_t v28 = v30;
        }

        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v30);
        id v22 = v25;
        if (!v25)
        {
LABEL_30:

          id v25 = v22;
          goto LABEL_31;
        }
      }

      else
      {
        uint64_t v27 = *(void *)(v35 + 40);
        if (v21)
        {
          NSErrorUserInfoKey v45 = NSUnderlyingErrorKey;
          id v46 = v21;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
          uint64_t v29 = DMFErrorWithCodeAndUserInfo(4007LL, v28);
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        }

        else
        {
          uint64_t v32 = DMFErrorWithCodeAndUserInfo(4007LL, 0LL);
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v32);
          uint64_t v28 = v30;
        }

        (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v30);
        if (!v22) {
          goto LABEL_30;
        }
      }

      goto LABEL_30;
    }
  }

  else
  {
  }

  (*(void (**)(void))(*(void *)(v35 + 40) + 16LL))();
LABEL_32:
}

void sub_100030ED0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14, uint64_t a15, void (*a16)(void *a1, uint64_t a2), void *a17, id a18, uint64_t a19, id a20, id a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, __int16 buf)
{
  if (a2 == 1)
  {
    id v37 = objc_begin_catch(exception_object);
    uint64_t v38 = DMFConfigurationEngineLog(v37);
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "configuration database has been deprecated, destroying persistent stores and reloading",  (uint8_t *)&buf,  2u);
    }

    __int128 v40 = *(void **)(a10 + 32);
    a22 = 0LL;
    unsigned __int8 v41 = [v40 destroyPersistentStoresWithError:&a22];
    id v42 = a22;

    if ((v41 & 1) != 0)
    {
      a14 = _NSConcreteStackBlock;
      a15 = 3221225472LL;
      a16 = sub_10003102C;
      a17 = &unk_10009E8E8;
      NSErrorUserInfoKey v43 = *(void **)(a10 + 32);
      a21 = *(id *)(a10 + 40);
      id v44 = v42;
      uint64_t v45 = *(void *)(a10 + 32);
      a18 = v44;
      a19 = v45;
      a20 = a9;
      [v43 loadPersistentStoresWithCompletionHandler:&a14];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a10 + 40) + 16LL))();
    }

    objc_end_catch();
    JUMPOUT(0x100030E84LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10003102C(void *a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void, void))(a1[7] + 16LL))(a1[7], a1[4]);
  }

  else
  {
    id v3 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v13 = 0LL;
    unsigned __int8 v5 = [v3 updateMetadataForManagedObjectContext:v4 error:&v13];
    id v6 = v13;
    uint64_t v7 = v6;
    uint64_t v8 = a1[7];
    if ((v5 & 1) != 0)
    {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0LL);
    }

    else
    {
      if (v6)
      {
        NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
        id v15 = v6;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
        uint64_t v10 = DMFErrorWithCodeAndUserInfo(4007LL, v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
      }

      else
      {
        uint64_t v12 = DMFErrorWithCodeAndUserInfo(4007LL, 0LL);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
      }
    }
  }

id sub_1000318A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) performDatabaseModificationOperationWithManagedObjectContext:*(void *)(a1 + 40)];
}

LABEL_23:
              id v15 = v51;
              NSErrorUserInfoKey v14 = v52;
              p_cache = (void **)(&OBJC_CLASS___CEMImageAssetInstallMetadata + 16);
            }

            else
            {
              unsigned __int8 v41 = DMFConfigurationEngineLog(v24);
              log = (os_log_t)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                id v44 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v23 verboseDescription]);
                *(_DWORD *)buf = 138543618;
                v76 = v44;
                v77 = 2114;
                v78 = v45;
                _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to deserialize configuration engine model: %{public}@",  buf,  0x16u);
              }
            }

            id v19 = v57;

            uint64_t v12 = v23;
          }

          objc_autoreleasePoolPop(v19);
          uint64_t v17 = (char *)v17 + 1;
        }

        while (v17 != v14);
        NSErrorUserInfoKey v14 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      }

      while (v14);
    }
  }

  else
  {
    id v46 = DMFConfigurationEngineLog(v11);
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100063F48(v12);
    }

    if (a5)
    {
      uint64_t v12 = v12;
      *a5 = v12;
    }
  }

  return v49 != 0LL;
}

LABEL_119:
              v145 = (char *)v145 + 1;
              v136 = (uint64_t)v299;
            }

            while (v145 != v142);
            v142 = [v295 countByEnumeratingWithState:&v348 objects:v373 count:16];
          }

          while (v142);
        }

        v202 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
        v203 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationPayloadMetadata,  "fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:",  v202));

        v204 = (void *)objc_claimAutoreleasedReturnValue([v203 execute:v136]);
        v205 = v204;
        if (v204)
        {
          v342 = 0u;
          v343 = 0u;
          v340 = 0u;
          v341 = 0u;
          v316 = v204;
          v206 = v204;
          v207 = [v206 countByEnumeratingWithState:&v340 objects:v371 count:16];
          if (v207)
          {
            v208 = v207;
            v209 = *(void *)v341;
            v210 = DMFDeclarationStateStatusKey;
            v211 = DMFDeclarationStatusInactive;
            do
            {
              for (k = 0LL; k != v208; k = (char *)k + 1)
              {
                if (*(void *)v341 != v209) {
                  objc_enumerationMutation(v206);
                }
                v213 = *(void **)(*((void *)&v340 + 1) + 8LL * (void)k);
                v369 = v210;
                v370 = v211;
                v214 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v370,  &v369,  1LL));
                [v213 setStateDictionary:v214];
              }

              v208 = [v206 countByEnumeratingWithState:&v340 objects:v371 count:16];
            }

            while (v208);
          }

          v215 = (void *)objc_claimAutoreleasedReturnValue([v298 identifier]);
          v216 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:",  v215));

          v217 = (void *)objc_claimAutoreleasedReturnValue([v216 execute:v299]);
          v218 = v217;
          if (v217)
          {
            v338 = 0u;
            v339 = 0u;
            v336 = 0u;
            v337 = 0u;
            v219 = v217;
            v220 = [v219 countByEnumeratingWithState:&v336 objects:v368 count:16];
            uint64_t v12 = v289;
            v141 = v314;
            if (v220)
            {
              v221 = v220;
              v222 = *(void *)v337;
              do
              {
                for (m = 0LL; m != v221; m = (char *)m + 1)
                {
                  if (*(void *)v337 != v222) {
                    objc_enumerationMutation(v219);
                  }
                  [v289 deleteObject:*(void *)(*((void *)&v336 + 1) + 8 * (void)m)];
                }

                v221 = [v219 countByEnumeratingWithState:&v336 objects:v368 count:16];
              }

              while (v221);
            }

            v225 = DMFConfigurationEngineLog(v224);
            v226 = (os_log_s *)objc_claimAutoreleasedReturnValue(v225);
            v227 = os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG);

            if (v227)
            {
              v305 = v218;
              objb = v216;
              v229 = DMFConfigurationEngineLog(v228);
              v230 = (os_log_s *)objc_claimAutoreleasedReturnValue(v229);
              if (os_log_type_enabled(v230, OS_LOG_TYPE_DEBUG)) {
                sub_1000645E0();
              }

              v334 = 0u;
              v335 = 0u;
              v332 = 0u;
              v333 = 0u;
              v231 = v287;
              v232 = [v231 countByEnumeratingWithState:&v332 objects:v367 count:16];
              if (v232)
              {
                v233 = v232;
                v234 = *(void *)v333;
                do
                {
                  v235 = 0LL;
                  do
                  {
                    if (*(void *)v333 != v234) {
                      objc_enumerationMutation(v231);
                    }
                    v236 = *(os_log_s **)(*((void *)&v332 + 1) + 8LL * (void)v235);
                    v237 = DMFConfigurationEngineLog(v232);
                    v238 = (os_log_s *)objc_claimAutoreleasedReturnValue(v237);
                    if (os_log_type_enabled(v238, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v236;
                      _os_log_debug_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v235 = (char *)v235 + 1;
                  }

                  while (v233 != v235);
                  v232 = [v231 countByEnumeratingWithState:&v332 objects:v367 count:16];
                  v233 = v232;
                }

                while (v232);
              }

              v240 = DMFConfigurationEngineLog(v239);
              v241 = (os_log_s *)objc_claimAutoreleasedReturnValue(v240);
              if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG)) {
                sub_1000645B4();
              }

              v330 = 0u;
              v331 = 0u;
              v328 = 0u;
              v329 = 0u;
              v242 = v286;
              v243 = [v242 countByEnumeratingWithState:&v328 objects:v366 count:16];
              if (v243)
              {
                v244 = v243;
                v245 = *(void *)v329;
                do
                {
                  v246 = 0LL;
                  do
                  {
                    if (*(void *)v329 != v245) {
                      objc_enumerationMutation(v242);
                    }
                    v247 = *(os_log_s **)(*((void *)&v328 + 1) + 8LL * (void)v246);
                    v248 = DMFConfigurationEngineLog(v243);
                    v249 = (os_log_s *)objc_claimAutoreleasedReturnValue(v248);
                    if (os_log_type_enabled(v249, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v247;
                      _os_log_debug_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v246 = (char *)v246 + 1;
                  }

                  while (v244 != v246);
                  v243 = [v242 countByEnumeratingWithState:&v328 objects:v366 count:16];
                  v244 = v243;
                }

                while (v243);
              }

              v251 = DMFConfigurationEngineLog(v250);
              v252 = (os_log_s *)objc_claimAutoreleasedReturnValue(v251);
              if (os_log_type_enabled(v252, OS_LOG_TYPE_DEBUG)) {
                sub_100064588();
              }

              v326 = 0u;
              v327 = 0u;
              v324 = 0u;
              v325 = 0u;
              v253 = v219;
              v254 = [v253 countByEnumeratingWithState:&v324 objects:v365 count:16];
              v218 = v305;
              if (v254)
              {
                v255 = v254;
                v256 = *(void *)v325;
                do
                {
                  v257 = 0LL;
                  do
                  {
                    if (*(void *)v325 != v256) {
                      objc_enumerationMutation(v253);
                    }
                    v258 = *(os_log_s **)(*((void *)&v324 + 1) + 8LL * (void)v257);
                    v259 = DMFConfigurationEngineLog(v254);
                    v260 = (os_log_s *)objc_claimAutoreleasedReturnValue(v259);
                    if (os_log_type_enabled(v260, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v258;
                      _os_log_debug_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v257 = (char *)v257 + 1;
                  }

                  while (v255 != v257);
                  v254 = [v253 countByEnumeratingWithState:&v324 objects:v365 count:16];
                  v255 = v254;
                }

                while (v254);
              }

              v262 = DMFConfigurationEngineLog(v261);
              v263 = (os_log_s *)objc_claimAutoreleasedReturnValue(v262);
              if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG)) {
                sub_10006455C();
              }

              v322 = 0u;
              v323 = 0u;
              v320 = 0u;
              v321 = 0u;
              v264 = v308;
              v265 = -[os_log_s countByEnumeratingWithState:objects:count:]( v264,  "countByEnumeratingWithState:objects:count:",  &v320,  v364,  16LL);
              if (v265)
              {
                v266 = v265;
                v267 = *(void *)v321;
                do
                {
                  v268 = 0LL;
                  do
                  {
                    if (*(void *)v321 != v267) {
                      objc_enumerationMutation(v264);
                    }
                    v269 = *(os_log_s **)(*((void *)&v320 + 1) + 8LL * (void)v268);
                    v270 = DMFConfigurationEngineLog(v265);
                    v271 = (os_log_s *)objc_claimAutoreleasedReturnValue(v270);
                    if (os_log_type_enabled(v271, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v269;
                      _os_log_debug_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v268 = (char *)v268 + 1;
                  }

                  while (v266 != v268);
                  v265 = -[os_log_s countByEnumeratingWithState:objects:count:]( v264,  "countByEnumeratingWithState:objects:count:",  &v320,  v364,  16LL);
                  v266 = v265;
                }

                while (v265);
              }

              v273 = DMFConfigurationEngineLog(v272);
              v274 = (os_log_s *)objc_claimAutoreleasedReturnValue(v273);
              if (os_log_type_enabled(v274, OS_LOG_TYPE_DEBUG)) {
                sub_1000642A0();
              }

              uint64_t v12 = v289;
              v216 = objb;
              v141 = v314;
            }

            v275 = v308;
            v99 = v285;
            v101 = v286;
          }

          else
          {
            v281 = DMFConfigurationEngineLog(0LL);
            v282 = (os_log_s *)objc_claimAutoreleasedReturnValue(v281);
            uint64_t v12 = v289;
            v141 = v314;
            v101 = v286;
            if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR)) {
              sub_1000644E4((uint64_t)v299);
            }

            v275 = 0LL;
            v99 = v285;
          }

          v205 = v316;
        }

        else
        {
          v280 = DMFConfigurationEngineLog(0LL);
          v216 = (void *)objc_claimAutoreleasedReturnValue(v280);
          v99 = v285;
          v101 = v286;
          if (os_log_type_enabled((os_log_t)v216, OS_LOG_TYPE_ERROR)) {
            sub_10006446C(v136);
          }
          v275 = 0LL;
          uint64_t v12 = v289;
        }
      }

      else
      {
        v279 = DMFConfigurationEngineLog(v139);
        v203 = (void *)objc_claimAutoreleasedReturnValue(v279);
        v141 = v314;
        if (os_log_type_enabled((os_log_t)v203, OS_LOG_TYPE_ERROR)) {
          sub_10006446C((uint64_t)v299);
        }
        v275 = 0LL;
        uint64_t v12 = v289;
        v99 = v285;
        v101 = v286;
      }

      v277 = v298;
    }

    else
    {
      v278 = DMFConfigurationEngineLog(v102);
      v288 = (os_log_s *)objc_claimAutoreleasedReturnValue(v278);
      if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR)) {
        sub_1000643F4((uint64_t)a7);
      }
      v275 = 0LL;
      v277 = v298;
      v141 = v314;
    }

LABEL_206:
  }

  else
  {
    v275 = 0LL;
    v277 = v298;
  }

  return v275;
}

void sub_100035920( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10003595C(uint64_t a1, uint64_t a2)
{
  return a2;
}

  ;
}

int64_t sub_100036118(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = DMFDeclarationPayloadIdentifierKey;
  unsigned __int8 v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", v4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));

  id v8 = [v6 compare:v7];
  return (int64_t)v8;
}

void sub_10003661C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) request]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 organizationIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  v3));

  id v48 = 0LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v48]);
  id v6 = v48;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 organizationIdentifier]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v8, v9));

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v2 machServiceName]);
      id v12 = [v11 length];

      if (v12)
      {
        id v40 = v6;
        unsigned __int8 v41 = v5;
        id v42 = v4;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v39 = v7;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentConfigurationSources]);
        id v14 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v45;
LABEL_6:
          uint64_t v17 = 0LL;
          while (1)
          {
            if (*(void *)v45 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            unsigned __int8 v20 = [v19 isEqualToString:v10];

            if ((v20 & 1) != 0) {
              break;
            }
            if (v15 == (id)++v17)
            {
              id v15 = [v13 countByEnumeratingWithState:&v44 objects:v49 count:16];
              if (v15) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }

          uint64_t v26 = v18;

          uint64_t v7 = v39;
          if (v26) {
            goto LABEL_19;
          }
        }

        else
        {
LABEL_12:

          uint64_t v7 = v39;
        }

        uint64_t v26 = -[DMDConfigurationSource initWithContext:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSource),  "initWithContext:",  *(void *)(a1 + 40));
        -[DMDConfigurationSource setOrganization:](v26, "setOrganization:", v7);
LABEL_19:
        -[DMDConfigurationSource setIdentifier:](v26, "setIdentifier:", v10);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v2 configurationSourceName]);
        -[DMDConfigurationSource setDisplayName:](v26, "setDisplayName:", v27);

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v2 machServiceName]);
        -[DMDConfigurationSource setMachServiceName:](v26, "setMachServiceName:", v28);

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v2 reportingRequirements]);
        -[DMDConfigurationSource setReportingRequirements:](v26, "setReportingRequirements:", v29);

        uint64_t v23 = -[DMDConfigurationSourceRepresentation initWithConfigurationSource:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceRepresentation),  "initWithConfigurationSource:",  v26);
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v2 listenerEndpoint]);
        -[DMDConfigurationSourceRepresentation setListenerEndpoint:](v23, "setListenerEndpoint:", v30);

        unsigned __int8 v5 = v41;
        uint64_t v4 = v42;
        id v6 = v40;
      }

      else
      {
        uint64_t v23 = objc_opt_new(&OBJC_CLASS___DMDConfigurationSourceRepresentation);
        -[DMDConfigurationSourceRepresentation setIdentifier:](v23, "setIdentifier:", v10);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v2 organizationIdentifier]);
        -[DMDConfigurationSourceRepresentation setOrganizationIdentifier:](v23, "setOrganizationIdentifier:", v31);

        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v2 configurationSourceName]);
        -[DMDConfigurationSourceRepresentation setDisplayName:](v23, "setDisplayName:", v32);

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v2 machServiceName]);
        -[DMDConfigurationSourceRepresentation setMachServiceName:](v23, "setMachServiceName:", v33);

        id v34 = (void *)objc_claimAutoreleasedReturnValue([v2 listenerEndpoint]);
        -[DMDConfigurationSourceRepresentation setListenerEndpoint:](v23, "setListenerEndpoint:", v34);

        uint64_t v26 = (DMDConfigurationSource *)objc_claimAutoreleasedReturnValue([v2 reportingRequirements]);
        -[DMDConfigurationSourceRepresentation setReportingRequirements:](v23, "setReportingRequirements:", v26);
      }

      uint64_t v35 = *(void **)(a1 + 40);
      id v43 = v6;
      unsigned __int8 v36 = [v35 save:&v43];
      id v37 = v43;

      uint64_t v38 = *(void **)(a1 + 32);
      if ((v36 & 1) != 0) {
        [v38 performSelectorOnMainThread:"delegateUpdatedDeclarationSourceAndEndOperation:" withObject:v23 waitUntilDone:0];
      }
      else {
        [v38 setError:v37];
      }
      id v6 = v37;
    }

    else
    {
      uint64_t v50 = DMFConfigurationOrganizationIdentifierErrorKey;
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v2 organizationIdentifier]);
      uint64_t v10 = (void *)v21;
      id v22 = @"(null)";
      if (v21) {
        id v22 = (const __CFString *)v21;
      }
      uint64_t v51 = v22;
      uint64_t v23 = (DMDConfigurationSourceRepresentation *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      uint64_t v24 = DMFErrorWithCodeAndUserInfo(4002LL, v23);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [*(id *)(a1 + 32) setError:v25];
    }
  }

  else
  {
    [*(id *)(a1 + 32) setError:v6];
  }
}

LABEL_51:
          }

          v102 = [v97 countByEnumeratingWithState:&v110 objects:v131 count:16];
        }

        while (v102);
      }

      uint64_t v7 = v90;
      uint64_t v16 = v91;
      self = v94;
      unsigned __int8 v36 = v96;
      id v34 = v93;
      id v58 = v98;
    }

    else
    {
      v81 = DMFConfigurationEngineLog(v59);
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      uint64_t v7 = v90;
      id v34 = v93;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_100064AB4(v93);
      }

      -[DMDEngineUpdateDeclarationsOperation setError:](v94, "setError:", v93);
      uint64_t v16 = v91;
      unsigned __int8 v36 = v96;
    }

    if (v58) {
      goto LABEL_65;
    }
  }

  else
  {
    v79 = DMFConfigurationEngineLog(v43);
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    uint64_t v16 = v91;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100064A3C(v42);
    }

    -[DMDEngineUpdateDeclarationsOperation setError:](self, "setError:", v42);
    id v34 = v42;
  }

LABEL_70:
}

LABEL_9:
    id v15 = [v10 caseInsensitiveCompare:@"Daily"];
    if (v15)
    {
      uint64_t v16 = DMFConfigurationEngineLog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100064BA4((uint64_t)v10, v17);
      }
    }

    id v14 = 3LL;
    goto LABEL_17;
  }

  id v14 = 1LL;
LABEL_17:
  v5->_frequency = v14;
  id v18 = objc_claimAutoreleasedReturnValue([v8 payloadLocalTime]);
  id v19 = (void *)v18;
  if (v18) {
    unsigned __int8 v20 = (__CFString *)v18;
  }
  else {
    unsigned __int8 v20 = @"00:00";
  }
  objc_storeStrong((id *)&v5->_localTime, v20);

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 payloadSpread]);
  id v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (_UNKNOWN **)v21;
  }
  else {
    uint64_t v23 = &off_1000A6018;
  }
  objc_storeStrong((id *)&v5->_spread, v23);

  uint64_t v24 = objc_claimAutoreleasedReturnValue([v8 payloadDay]);
  day = v5->_day;
  v5->_day = (NSNumber *)v24;

LABEL_24:
  return v5;
}

    id v11 = 0;
    goto LABEL_10;
  }

  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v9 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_4:
  id v11 = 0;
  *a3 = v10;
LABEL_10:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t sub_100038504(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000387EC(_Unwind_Exception *a1)
{
}

void sub_100038874(uint64_t a1)
{
  id v2 = (const char *)[@"com.apple.alarm" UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003896C;
  handler[3] = &unk_10009E9B8;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v2, &_dispatch_main_q, handler);
  id v3 = (const char *)[@"com.apple.distnoted.matching" UTF8String];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100038B74;
  v6[3] = &unk_10009E9B8;
  void v6[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v3, &_dispatch_main_q, v6);

  uint64_t v4 = (const char *)[@"com.apple.notifyd.matching" UTF8String];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100038D60;
  v5[3] = &unk_10009E9B8;
  void v5[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v4, &_dispatch_main_q, v5);
}

void sub_10003896C(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received xpc stream event (alarm) with name: %{public}@",  buf,  0xCu);
  }

  if (v5)
  {
    xpc_set_event([@"com.apple.alarm" UTF8String], string, 0);
    id v6 = *(id *)(*(void *)(a1 + 32) + 8LL);
    objc_sync_enter(v6);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 8LL);
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "handleAlarmWithIdentifier:") & 1) != 0) {
            objc_msgSend(v11, "handleAlarmWithIdentifier:", v5, (void)v12);
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }

    objc_sync_exit(v6);
  }
}

void sub_100038B50(_Unwind_Exception *a1)
{
}

void sub_100038B74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, _xpc_event_key_name));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, (const char *)[@"UserInfo" UTF8String]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

  if (v7) {
    id v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  }
  else {
    id v8 = 0LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received xpc stream event (distributed notification matching) with name: %{public}@ user info: %{public}@",  buf,  0x16u);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_100038D14;
  v13[3] = &unk_10009E9E0;
  id v14 = v5;
  id v15 = v8;
  id v11 = v8;
  id v12 = v5;
  [v9 _dispatchToListenerForKey:v12 inMap:v10 withBlock:v13];
}

void sub_100038D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "handleDistributedNotificationWithName:userInfo:") & 1) != 0) {
    [v3 handleDistributedNotificationWithName:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
  }
}

void sub_100038D60(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received xpc stream event (notify matching) with name: %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100038E94;
  v8[3] = &unk_10009EA08;
  id v9 = v4;
  id v7 = v4;
  [v5 _dispatchToListenerForKey:v7 inMap:v6 withBlock:v8];
}

void sub_100038E94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "handleNotifyMatchingNotificationWithName:") & 1) != 0) {
    [v3 handleNotifyMatchingNotificationWithName:*(void *)(a1 + 32)];
  }
}

void sub_100039064(_Unwind_Exception *exception_object)
{
}

void sub_1000391E4(_Unwind_Exception *a1)
{
}

void sub_100039820( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_100039844(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([WeakRetained eventsHandler]);

  if (v4) {
    ((void (**)(void, void, void, id))v4)[2](v4, *(void *)(a1 + 32), *(void *)(a1 + 40), v5);
  }
}

void sub_1000399CC(void *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 organizationIdentifier]);
  unsigned int v5 = [v4 isEqual:a1[4]];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 eventStatusesSinceStartDate:a1[6]]);
    id v7 = (void *)a1[5];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 payloadIdentifier]);
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

void sub_100039C84(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer);
  +[DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer setValueTransformer:forName:]( &OBJC_CLASS___DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer,  "setValueTransformer:forName:",  v1,  @"DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer");
}

void sub_100039D10(id a1)
{
  v3[0] = objc_opt_class(&OBJC_CLASS___CEMEventSubscriptionDeclaration_Schedule);
  v3[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  void v3[2] = objc_opt_class(&OBJC_CLASS___CEMEventBase);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  id v2 = (void *)qword_1000CCCE0;
  qword_1000CCCE0 = v1;
}

void sub_10003A358( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10003A374(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 streamEventsHandler]);
  [v4 startNotificationStreamWithEventsHandler:v5];
}

void sub_10003A3C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained lastDateScheduleElapsed]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained eventStatusesSinceStartDate:v1]);

  id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([WeakRetained streamEventsHandler]);
  ((void (**)(void, void *))v3)[2](v3, v2);

  id v4 = objc_opt_new(&OBJC_CLASS___NSDate);
  [WeakRetained setLastDateScheduleElapsed:v4];
}

void sub_10003A52C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 eventStatusRollupSinceStartDate:*(void *)(a1 + 32)]);
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 40) addObject:v4];
    id v4 = v5;
  }
}

void sub_10003A730(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  if (a3)
  {
    [v5 endOperationWithError:a3];
  }

  else
  {
    id v6 = [[DMFFetchAppsResultObject alloc] initWithAppsByBundleIdentifier:v7];
    [v5 endOperationWithResultObject:v6];
  }
}

void sub_10003AAB4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  else {
    objc_msgSend( *(id *)(a1 + 48),  "_fetchAppsForBundleIdentifier:type:completion:",  v5,  objc_msgSend(*(id *)(a1 + 32), "type"),  *(void *)(a1 + 40));
  }
}

void sub_10003AB24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v62 = [v5 mutableCopy];
    id v61 = v5;
    if ([*(id *)(a1 + 32) managedAppsOnly])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifiers]);
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) managedBundleIdentifiers]);
      id v10 = [v9 countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v73;
        id v59 = v9;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v73 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)i);
            id v15 = objc_autoreleasePoolPush();
            if (!v8 || [v8 containsObject:v14])
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v14, v59));

              if (!v16)
              {
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppLifeCycle lifeCycleForBundleIdentifier:]( &OBJC_CLASS___DMDAppLifeCycle,  "lifeCycleForBundleIdentifier:",  v14));
                if (![v17 currentState])
                {
                  __int16 v18 = objc_opt_new(&OBJC_CLASS___DMFApp);
                  -[DMFApp setType:](v18, "setType:", 0LL);
                  -[DMFApp setBundleIdentifier:](v18, "setBundleIdentifier:", v14);
                  -[DMFApp setInstallationState:](v18, "setInstallationState:", 0LL);
                  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) VPNUUIDStringForBundleIdentifier:v14]);
                  -[DMFApp setVPNUUIDString:](v18, "setVPNUUIDString:", v19);

                  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cellularSliceUUIDStringForBundleIdentifier:v14]);
                  -[DMFApp setCellularSliceUUIDString:](v18, "setCellularSliceUUIDString:", v20);

                  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) contentFilterUUIDStringForBundleIdentifier:v14]);
                  -[DMFApp setContentFilterUUIDString:](v18, "setContentFilterUUIDString:", v21);

                  id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) DNSProxyUUIDStringForBundleIdentifier:v14]);
                  -[DMFApp setDNSProxyUUIDString:](v18, "setDNSProxyUUIDString:", v22);

                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) relayUUIDStringForBundleIdentifier:v14]);
                  -[DMFApp setRelayUUIDString:](v18, "setRelayUUIDString:", v23);

                  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) associatedDomainsForBundleIdentifier:v14]);
                  -[DMFApp setAssociatedDomains:](v18, "setAssociatedDomains:", v24);

                  id v25 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) associatedDomainsEnableDirectDownloadsForBundleIdentifier:v14]);
                  -[DMFApp setAssociatedDomainsEnableDirectDownloads:]( v18,  "setAssociatedDomainsEnableDirectDownloads:",  v25);

                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) removabilityForBundleIdentifier:v14]);
                  -[DMFApp setRemovable:](v18, "setRemovable:", v26);

                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tapToPayScreenLockForBundleIdentifier:v14]);
                  -[DMFApp setTapToPayScreenLock:](v18, "setTapToPayScreenLock:", v27);

                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allowUserToHideForBundleIdentifier:v14]);
                  -[DMFApp setAllowUserToHide:](v18, "setAllowUserToHide:", v28);

                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allowUserToLockForBundleIdentifier:v14]);
                  -[DMFApp setAllowUserToLock:](v18, "setAllowUserToLock:", v29);

                  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) configurationForBundleIdentifier:v14]);
                  -[DMFApp setConfiguration:](v18, "setConfiguration:", v30);

                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) feedbackForBundleIdentifier:v14]);
                  -[DMFApp setFeedback:](v18, "setFeedback:", v31);

                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) managementInformationForBundleIdentifier:v14]);
                  -[DMFApp setManagementInformation:](v18, "setManagementInformation:", v32);

                  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sourceIdentifierForBundleIdentifier:v14]);
                  -[DMFApp setSourceIdentifier:](v18, "setSourceIdentifier:", v33);

                  id v9 = v59;
                  [v62 setObject:v18 forKeyedSubscript:v14];

                  id v5 = v61;
                }
              }
            }

            objc_autoreleasePoolPop(v15);
          }

          id v11 = [v9 countByEnumeratingWithState:&v72 objects:v80 count:16];
        }

        while (v11);
      }

      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      id v34 = v5;
      id v35 = [v34 countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v69;
        do
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v69 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)j);
            id v40 = objc_autoreleasePoolPush();
            unsigned __int8 v41 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v39]);
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 managementInformation]);

            if (!v42) {
              [v62 setObject:0 forKeyedSubscript:v39];
            }
            objc_autoreleasePoolPop(v40);
          }

          id v36 = [v34 countByEnumeratingWithState:&v68 objects:v79 count:16];
        }

        while (v36);
      }

      id v5 = v61;
    }

    if ([*(id *)(a1 + 32) deleteFeedback])
    {
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      id v43 = v62;
      id v44 = [v43 countByEnumeratingWithState:&v64 objects:v78 count:16];
      if (v44)
      {
        id v45 = v44;
        id v7 = 0LL;
        uint64_t v46 = *(void *)v65;
        uint64_t v60 = 138543362LL;
        do
        {
          __int128 v47 = 0LL;
          id v48 = v7;
          do
          {
            if (*(void *)v65 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)v47);
            uint64_t v50 = objc_autoreleasePoolPush();
            uint64_t v51 = *(void **)(a1 + 40);
            id v63 = v48;
            unsigned __int8 v52 = [v51 setFeedback:0 forBundleIdentifier:v49 error:&v63];
            id v7 = v63;

            if ((v52 & 1) == 0)
            {
              uint64_t v55 = DMFAppLog(v53, v54);
              uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v77 = v49;
                _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Could not delete feedback for bundle identifier: %{public}@",  buf,  0xCu);
              }
            }

            objc_autoreleasePoolPop(v50);
            __int128 v47 = (char *)v47 + 1;
            id v48 = v7;
          }

          while (v45 != v47);
          id v45 = [v43 countByEnumeratingWithState:&v64 objects:v78 count:16];
        }

        while (v45);
      }

      else
      {
        id v7 = 0LL;
      }

      id v5 = v61;
    }

    else
    {
      id v7 = 0LL;
    }

    uint64_t v57 = *(void *)(a1 + 48);
    id v58 = objc_msgSend(v62, "copy", v60);
    (*(void (**)(uint64_t, id, void))(v57 + 16))(v57, v58, 0LL);
  }
}

void sub_10003BE64(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }

  else
  {
    id v5 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchDeclarationsResultObject);
    [v5 setPayloadDescriptions:v6];
    [*(id *)(a1 + 32) endOperationWithResultObject:v5];
  }
}

id sub_10003C620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "endOperationWithError:");
  }
  else {
    return [v3 endOperationWithResultObject:a2];
  }
}

id sub_10003D684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "endOperationWithError:");
  }
  else {
    return [v3 endOperationWithResultObject:a2];
  }
}

void sub_10003DA38(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
      unsigned int v11 = [v8 appCoordinatorExistsForBundleIdentifier:v9 persona:v10];

      if (!v11)
      {
        [*(id *)(a1 + 32) setMetadata:v6];
        [*(id *)(a1 + 32) _runWithRequest:*(void *)(a1 + 40)];
        goto LABEL_11;
      }

      uint64_t v14 = DMFAppLog(v12, v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
        int v19 = 138543362;
        unsigned __int8 v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Abandoning install because of existing install coordinator for bundle identifier %{public}@",  (uint8_t *)&v19,  0xCu);
      }

      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = 2616LL;
    }

    else
    {
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = 2606LL;
    }

    [v17 endOperationWithDMFErrorCode:v18];
  }

LABEL_2:
  uint64_t v13 = 1;
LABEL_8:

  return v13;
}

id sub_10003DEC4(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10003E124(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10003E30C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &__NSArray0__struct));
  id v2 = (void *)qword_1000CCCF0;
  qword_1000CCCF0 = v1;
}

void sub_10003E660(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    uint64_t v9 = v1;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v4 = DMFErrorWithCodeAndUserInfo(2002LL, v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v2 endOperationWithError:v5];
  }

  else
  {
    uint64_t v6 = DMFErrorWithCodeAndUserInfo(2002LL, 0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v2, "endOperationWithError:");
  }

void sub_10003FB04(id a1)
{
  id v3 = @"whitelistedAppBundleIDs";
  uint64_t v4 = MCFeatureAppLockBundleIDs;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
  id v2 = (void *)qword_1000CCD00;
  qword_1000CCD00 = v1;
}

id sub_10003FE28(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

LABEL_10:
}

void *sub_100041560(void *result, uint64_t a2)
{
  if (result[4])
  {
    id v2 = result;
    uint64_t v3 = DMFErrorWithCodeAndUserInfo(a2, 0LL);
    id result = (id)objc_claimAutoreleasedReturnValue(v3);
    *(void *)v2[4] = result;
  }

  return result;
}

void sub_100041BC8(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"%@ is about to install and manage the app “%@” from the App Store.\nYour iTunes account will not be charged for this app." value:&stru_10009F768 table:@"DMFNotifications"]);
  uint64_t v3 = (void *)qword_1000CCD10;
  qword_1000CCD10 = v2;
}

void sub_100041E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = DMFAppLog(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Start redeeming app with bundle identifier: %{public}@",  buf,  0xCu);
  }

  [*(id *)(a1 + 40) _setState:2];
  id v7 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100041F34;
  v8[3] = &unk_10009ECB0;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v6;
  id v10 = *(id *)(a1 + 32);
  [v7 startRedeemingAppWithCode:v9 completion:v8];
}

void sub_100041F34(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    [*(id *)(a1 + 32) _setUnusedRedemptionCode:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
    [*(id *)(a1 + 32) _resetRemovabilityWithBundleIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _resetTapToPayScreenLock];
    [*(id *)(a1 + 32) endOperationWithError:v4];
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    [v3 sendManagedAppsChangedNotification];

    [*(id *)(a1 + 32) _endOperationWithBundleIdentifier:*(void *)(a1 + 48)];
  }
}

void sub_1000421D8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  [v3 _setState:11];
  [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  [v4 _resetRemovabilityWithBundleIdentifier:v6];

  [*(id *)(a1 + 32) _resetTapToPayScreenLock];
  [*(id *)(a1 + 32) endOperationWithError:v7];
}

void sub_100042270(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) removable]);
  [v2 _setRemovability:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tapToPayScreenLock]);
  [v4 _setTapToPayScreenLock:v5];

  uint64_t v8 = DMFAppLog(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) host]);
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Start installing enterprise app with manifest URL from: %{public}@",  buf,  0xCu);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  unsigned int v11 = *(void **)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_1000423EC;
  v14[3] = &unk_10009ED00;
  id v15 = v11;
  id v16 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v13;
  [v15 startInstallingEnterpriseAppWithManifestURL:v12 completion:v14];
}

void sub_1000423EC(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
    [v3 updateBundleIDPersonaIDMappingForPersonaID:v4 addingBundleID:0 completionHandler:0];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 48) _setState:6];
    [*(id *)(a1 + 48) _applyManagementPiecesForRequest:*(void *)(a1 + 40)];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    [v5 sendManagedAppsChangedNotification];

    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v6 _endOperationWithBundleIdentifier:v8];
  }
}

void sub_1000424C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) metadata]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000425A0;
  v7[3] = &unk_10009ED50;
  uint64_t v6 = *(void **)(a1 + 56);
  void v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  id v9 = *(id *)(a1 + 64);
  [v2 updateBundleIDPersonaIDMappingForPersonaID:v3 addingBundleID:v5 completionHandler:v7];
}

void sub_1000425A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000651B8();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
    id v13 = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(1003LL, v9);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100042784(int8x16_t *a1, uint64_t a2)
{
  uint64_t v3 = DMFAppLog(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Start installing system app with bundle identifier: %{public}@",  buf,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000428A0;
  v8[3] = &unk_10009E650;
  int8x16_t v7 = a1[2];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  [v6 installSystemAppWithBundleIdentifier:(id)v7.i64[0] completion:v8];
}

void sub_1000428A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (v3)
  {
    [v4 _showInstallationFailurePromptIfNeeded];
    [*(id *)(a1 + 32) endOperationWithError:v5];
  }

  else
  {
    [v4 _endOperationWithBundleIdentifier:*(void *)(a1 + 40)];
  }
}

void sub_100042AEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = DMFAppLog(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [(id)objc_opt_class(*(void *)(a1 + 40)) descriptionForChangeType:a2];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543874;
    uint64_t v78 = v9;
    __int16 v79 = 2114;
    v80 = v11;
    __int16 v81 = 2114;
    id v82 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SINF swap attempt complete for %{public}@, change type = %{public}@, error = %{public}@",  buf,  0x20u);
  }

  if (a2 == 4)
  {
    uint64_t v16 = DMFAppLog(v12, v13);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v78 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Attempting to re-download of device-licensed app: %{public}@",  buf,  0xCu);
    }

    [*(id *)(a1 + 40) _redownloadDeviceAppForRequest:*(void *)(a1 + 48)];
  }

  else
  {
    if (a2)
    {
      BOOL v15 = 1;
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
      else {
        BOOL v15 = 1;
      }
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
    unsigned int v20 = [v19 isUserLicensed];

    if (v20 && v15)
    {
      uint64_t v23 = DMFAppLog(v21, v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v78 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Attempting to re-download a user-licensed app where we know the license exists: %{public}@",  buf,  0xCu);
      }

      [*(id *)(a1 + 40) _redownloadUserAppForRequest:*(void *)(a1 + 48)];
    }

    else
    {
      id v26 = [*(id *)(a1 + 48) allowFreePurchases];
      if ((v26 & 1) != 0)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
        unsigned __int8 v29 = [v28 userIsSignedIn];
        __int16 v30 = *(void **)(a1 + 40);
        if ((v29 & 1) != 0)
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 metadata]);
          unsigned __int8 v32 = [v31 isFree];

          if ((v32 & 1) != 0)
          {
            uint64_t v35 = DMFAppLog(v33, v34);
            id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              uint64_t v78 = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Attempting to purchase free app: %{public}@",  buf,  0xCu);
            }

            [*(id *)(a1 + 40) _purchaseFreeAppForRequest:*(void *)(a1 + 48)];
          }

          else
          {
            [*(id *)(a1 + 40) _setState:1];
            [*(id *)(a1 + 40) _applyManagementPiecesForRequest:*(void *)(a1 + 48)];
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
            unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) removable]);
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 bundleIdentifier]);
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472LL;
            v71[2] = sub_100043074;
            v71[3] = &unk_10009E850;
            id v72 = *(id *)(a1 + 48);
            [v51 setRemovability:v52 forBundleIdentifier:v54 completion:v71];

            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) tapToPayScreenLock]);
            uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
            id v58 = (void *)objc_claimAutoreleasedReturnValue([v57 bundleIdentifier]);
            __int128 v66 = _NSConcreteStackBlock;
            uint64_t v67 = 3221225472LL;
            __int128 v68 = sub_1000430D8;
            __int128 v69 = &unk_10009E850;
            id v70 = *(id *)(a1 + 48);
            [v55 setTapToPayScreenLock:v56 forBundleIdentifier:v58 completion:&v66];

            id v59 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppController sharedController]( &OBJC_CLASS___DMDAppController,  "sharedController",  v66,  v67,  v68,  v69));
            [v59 sendManagedAppsChangedNotification];

            uint64_t v60 = *(void **)(a1 + 40);
            uint64_t v73 = DMFBundleIdentifierErrorKey;
            id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 metadata]);
            id v62 = (void *)objc_claimAutoreleasedReturnValue([v61 bundleIdentifier]);
            __int128 v74 = v62;
            id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
            uint64_t v64 = DMFErrorWithCodeAndUserInfo(1001LL, v63);
            __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
            [v60 endOperationWithError:v65];
          }
        }

        else
        {
          [v30 _promptToSignInAndInstallAppForRequest:*(void *)(a1 + 48)];
        }
      }

      else
      {
        uint64_t v38 = DMFAppLog(v26, v27);
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_100065244(a1, v39, v40, v41, v42, v43, v44, v45);
        }

        uint64_t v46 = *(void **)(a1 + 40);
        uint64_t v75 = DMFBundleIdentifierErrorKey;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v46 metadata]);
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
        v76 = v47;
        id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
        uint64_t v49 = DMFErrorWithCodeAndUserInfo(2605LL, v48);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        [v46 endOperationWithError:v50];
      }
    }
  }
}

void sub_100043074(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000652AC();
    }
  }
}

void sub_1000430D8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100065328();
    }
  }
}

void sub_1000432E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v7 = v5;
  if (v5)
  {
    uint64_t v8 = DMFAppLog(v5, v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000653A4();
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v10();
}

void sub_100043530(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _setState:11];
  [*(id *)(a1 + 32) _showInstallationFailurePromptIfNeeded];
  [*(id *)(a1 + 32) endOperationWithError:v4];
}

void sub_100043584(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v9 = DMFAppLog(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    int v28 = 138543618;
    unsigned __int8 v29 = v12;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "appstored response for: %{public}@, metadata=%{public}@",  (uint8_t *)&v28,  0x16u);
  }

  if (v7)
  {
    uint64_t v15 = DMFAppLog(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
      int v28 = 138543618;
      unsigned __int8 v29 = v18;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error getting app: %{public}@, %{public}@",  (uint8_t *)&v28,  0x16u);
    }

    int v19 = *(void **)(a1 + 40);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) personaIdentifier]);
    [v19 updateBundleIDPersonaIDMappingForPersonaID:v20 addingBundleID:0 completionHandler:0];

    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
    [v21 _resetRemovabilityWithBundleIdentifier:v23];

    [*(id *)(a1 + 32) _resetTapToPayScreenLock];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) _setState:6];
    [*(id *)(a1 + 32) _applyManagementPiecesForRequest:*(void *)(a1 + 48)];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    [v24 sendManagedAppsChangedNotification];

    uint64_t v25 = *(void **)(a1 + 32);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 metadata]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
    [v25 _endOperationWithBundleIdentifier:v27];
  }
}

void sub_1000437E4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) metadata]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_1000438E8;
  v10[3] = &unk_10009EDF0;
  id v6 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v13 = v6;
  id v11 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  id v12 = v7;
  uint64_t v15 = v8;
  id v14 = v9;
  [v2 updateBundleIDPersonaIDMappingForPersonaID:v3 addingBundleID:v5 completionHandler:v10];
}

void sub_1000438E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000651B8();
    }

    uint64_t v8 = *(void *)(a1 + 56);
    NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
    uint64_t v27 = v5;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(1003LL, v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }

  else
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) removable]);
    [v12 _setRemovability:v13];

    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tapToPayScreenLock]);
    [v14 _setTapToPayScreenLock:v15];

    uint64_t v18 = DMFAppLog(v16, v17);
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
      int v24 = 138543362;
      uint64_t v25 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "_downloadStoreAppForRequest persona:%{public}@",  (uint8_t *)&v24,  0xCu);
    }

    uint64_t v21 = *(void **)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 storeItemIdentifier]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
    [v22 sendAppRequestWithBundleIdentifier:0 storeItemIdentifier:v11 personaIdentifier:v23 type:*(void *)(a1 + 72) skipDownloads:0 completion:*(void *)(a1 + 64)];
  }
}

uint64_t sub_100044188(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lifeCycle]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v3 addObserver:v4];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_100044208(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  [*(id *)(a1 + 32) _setState:10];
  return [*(id *)(a1 + 32) endOperationWithDMFErrorCode:1000];
}

id sub_1000444C0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1) {
    return [v3 _showStorePromptToSignInAndInstallAppForRequest:*(void *)(a1 + 40)];
  }
  [v3 _setState:10];
  return [*(id *)(a1 + 32) endOperationWithDMFErrorCode:1000];
}

void sub_1000445F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) endOperationWithError:v6];
  }

  else if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000446E8;
    v9[3] = &unk_10009EE90;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = 0LL;
    id v11 = v7;
    [v8 getMetadataForAppRequest:v7 completion:v9];
  }

  else
  {
    [*(id *)(a1 + 32) _setState:11];
    [*(id *)(a1 + 32) endOperationWithDMFErrorCode:2608];
  }
}

id sub_1000446E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [v4 _setState:11];
    return [*(id *)(a1 + 32) endOperationWithError:*(void *)(a1 + 40)];
  }

  else
  {
    [v4 setMetadata:a2];
    return [*(id *)(a1 + 32) _installStoreAppForRequest:*(void *)(a1 + 48)];
  }

id sub_100044B54(uint64_t a1, void *a2)
{
  return [a2 setRedemptionCode:*(void *)(a1 + 32)];
}

id sub_100044C8C(uint64_t a1, void *a2)
{
  return [a2 setUnusedRedemptionCode:*(void *)(a1 + 32)];
}

void sub_100044FC4(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006559C();
    }
  }
}

void sub_100045090(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000655FC();
    }
  }
}

void sub_1000451AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006565C(a1);
    }
  }
}

void sub_1000452D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000656D0(a1);
    }
  }
}

  ;
}

uint64_t sub_100045354(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_1000454E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

    id v7 = *(void **)(a1 + 32);
    if (v6)
    {
      [v7 setMetadata:v8];
      [*(id *)(a1 + 32) _runWithRequest:*(void *)(a1 + 40)];
    }

    else
    {
      [v7 endOperationWithDMFErrorCode:2606];
    }
  }
}

void sub_1000457D0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 40) _setState:18 forBundleIdentifier:*(void *)(a1 + 48)];
    uint64_t v6 = DMFAppLog(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = v7;
    if (a2 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100065744(a1, v8, v9, v10, v11, v12, v13, v14);
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Request to manage app %{public}@ denied.",  (uint8_t *)&v19,  0xCu);
    }
  }

  else
  {
    uint64_t v15 = DMFAppLog(a1, 0LL);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v19 = 138543362;
      uint64_t v20 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Request to manage app %{public}@ approved by user.",  (uint8_t *)&v19,  0xCu);
    }

    [*(id *)(a1 + 40) _manageApp];
  }

uint64_t sub_100045A20(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) recordNewPrompt];
    [*(id *)(a1 + 32) writeTimestampsToFile];
    goto LABEL_5;
  }

  if (a2)
  {
LABEL_5:
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
    return v3();
  }

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  return v3();
}

uint64_t sub_100045CD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000460B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = DMFAppLog(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) personaIdentifier]);
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Associating app %{public}@ with persona %{public}@ in UserManagement",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_1000462F8(id a1, NSDictionary *a2, int64_t a3, NSError *a4)
{
  id v4 = a4;
  uint64_t v6 = v4;
  if (v4)
  {
    uint64_t v7 = DMFAppLog(v4, v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006585C((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void sub_1000464A0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000658C0();
    }
  }
}

void sub_1000465CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = v2;
  if (v2)
  {
    uint64_t v5 = DMFAppLog(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006592C();
    }
  }
}

  ;
}

void sub_100046B84(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _systemGroupContainerPathWithGroupIdentifier:@"systemgroup.com.apple.configurationprofiles"]);
  id v2 = (void *)qword_1000CCD20;
  qword_1000CCD20 = v1;

  if (qword_1000CCD20)
  {
    if ([(id)qword_1000CCD20 isEqualToString:@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles"]) {
      return;
    }
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_1000659D0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_100065998(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  int v19 = (void *)qword_1000CCD20;
  qword_1000CCD20 = (uint64_t)@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles";
}

void sub_100046CA0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileStorageDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"ManagementPromptPolicy.plist"]);
  id v2 = (void *)qword_1000CCD30;
  qword_1000CCD30 = v1;
}

void sub_100046D60(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileStorageDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"MDMAppManagement.plist"]);
  id v2 = (void *)qword_1000CCD40;
  qword_1000CCD40 = v1;
}

void sub_100046E20(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purchasedBooksDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Purchases.plist"]);
  id v2 = (void *)qword_1000CCD50;
  qword_1000CCD50 = v1;
}

void sub_100046EE0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _userDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"/Media/Books/Purchases"]);
  id v2 = (void *)qword_1000CCD60;
  qword_1000CCD60 = v1;
}

void sub_100046FA0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileStorageDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"ManagedBooks.plist"]);
  id v2 = (void *)qword_1000CCD70;
  qword_1000CCD70 = v1;
}

void sub_100047060(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _managedNonStoreBooksSystemGroupContainer]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Library"]);
  id v2 = (void *)qword_1000CCD80;
  qword_1000CCD80 = v1;
}

void sub_100047120(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedNonStoreBooksDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Managed.plist"]);
  id v2 = (void *)qword_1000CCD90;
  qword_1000CCD90 = v1;
}

void sub_1000471E0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileStorageDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"LostModeRequest.plist"]);
  id v2 = (void *)qword_1000CCDA0;
  qword_1000CCDA0 = v1;
}

void sub_1000472A0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileStorageDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"MDM.plist"]);
  id v2 = (void *)qword_1000CCDB0;
  qword_1000CCDB0 = v1;
}

void sub_10004736C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _systemProfileLibraryDirectory]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"ConfigurationProfiles"]);
  id v2 = (void *)qword_1000CCDC0;
  qword_1000CCDC0 = v1;
}

void sub_10004742C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) configurationProfilesSystemGroupContainer]);
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Library"]);
  id v2 = (void *)qword_1000CCDD0;
  qword_1000CCDD0 = v1;
}

void sub_1000475BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000475CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000476F8(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___CATOperationQueue);
  id v2 = (void *)qword_1000CCDE8;
  qword_1000CCDE8 = (uint64_t)v1;
}

uint64_t sub_100047D08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_34:
  return a6;
}

  unsigned __int8 v32 = [v9 containsObject:@"isPlaceholder"];
  uint64_t v33 = [v9 containsObject:@"isRestricted"];
  uint64_t v34 = v33;
  if ((v32 & 1) != 0 || v33)
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v12 appState]);
    id v36 = v35;
    if (v32) {
      -[DMFApp setIsPlaceholder:](v11, "setIsPlaceholder:", [v35 isPlaceholder]);
    }
    if (v34) {
      -[DMFApp setIsRestricted:](v11, "setIsRestricted:", [v36 isRestricted]);
    }
  }

  uint64_t v37 = [v9 containsObject:@"isUserBasedVPP"];
  uint64_t v38 = [v9 containsObject:@"isLicenseExpired"];
  uint64_t v39 = [v9 containsObject:@"isLicenseRevoked"];
  uint64_t v40 = v39;
  if ((v37 & 1) == 0 && (v38 & 1) == 0 && !v39) {
    goto LABEL_48;
  }
  uint64_t v41 = +[SSPurchaseReceipt vppStateFlagsWithProxy:]( &OBJC_CLASS___SSPurchaseReceipt,  "vppStateFlagsWithProxy:",  v12);
  uint64_t v42 = v41;
  if (!v37)
  {
    if (!v38) {
      goto LABEL_46;
    }
LABEL_71:
    -[DMFApp setIsLicenseExpired:](v11, "setIsLicenseExpired:", (v42 >> 2) & 1);
    if (!v40) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  -[DMFApp setIsUserBasedVPP:](v11, "setIsUserBasedVPP:", (v41 >> 1) & 1);
  if (v38) {
    goto LABEL_71;
  }
LABEL_46:
  if (v40) {
LABEL_47:
  }
    -[DMFApp setIsLicenseRevoked:](v11, "setIsLicenseRevoked:", (v42 >> 3) & 1);
LABEL_48:

LABEL_65:
  return v11;
}

LABEL_6:
}

    uint64_t v17 = DMFErrorWithCodeAndUserInfo(2004LL, 0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
    return 0LL;
  }

  st_size = v27.st_size;
  uint64_t v7 = mmap(0LL, v27.st_size, 1, 2, v5, 0LL);
  if (v7 == (void *)-1LL)
  {
    int v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      sub_100067288(v19, v20, v21, v22, v23, v24, v25, v26);
      if (!a4) {
        goto LABEL_9;
      }
    }

    else if (!a4)
    {
      goto LABEL_9;
    }

    goto LABEL_6;
  }

  uint64_t v8 = dispatch_data_create(v7, st_size, 0LL, _dispatch_data_destructor_munmap);
  return v8;
}

void sub_100049254(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DMDSecureUnarchiveFromPayloadMetadataDataTransformer);
  +[DMDSecureUnarchiveFromPayloadMetadataDataTransformer setValueTransformer:forName:]( &OBJC_CLASS___DMDSecureUnarchiveFromPayloadMetadataDataTransformer,  "setValueTransformer:forName:",  v1,  @"DMDSecureUnarchiveFromPayloadMetadataDataTransformer");
}

void sub_1000492E0(id a1)
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSObject);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v3, 1LL));
  id v2 = (void *)qword_1000CCE00;
  qword_1000CCE00 = v1;
}

void sub_10004982C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100049854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100049864(uint64_t a1)
{
}

void sub_10004986C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v7, "code") == (id)256)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSSQLiteErrorDomain]);
      unsigned int v11 = [v10 isEqualToNumber:&off_1000A6030];

      if (!v11)
      {
LABEL_8:
        uint64_t v16 = DMFPolicyLog(v12, v13, v14);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100065D40();
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

        if (v19)
        {
          NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
          uint64_t v37 = v21;
          id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        }

        else
        {
          id v22 = 0LL;
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
        uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v31,  [v7 code],  v22));
        uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v34 = *(void **)(v33 + 40);
        *(void *)(v33 + 40) = v32;

LABEL_17:
        goto LABEL_18;
      }

      uint64_t v15 = DMFPolicyLog(v12, v13, v14);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_100065DA4();
      }
    }

    goto LABEL_8;
  }

  [*(id *)(a1 + 32) setIsPersistentContainerLoaded:1];
  id v23 = [*(id *)(a1 + 40) newBackgroundContext];
  [*(id *)(a1 + 32) setInternalContext:v23];

  id v24 = [*(id *)(a1 + 40) newBackgroundContext];
  [*(id *)(a1 + 32) setRegistrationContext:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
  id v35 = 0LL;
  unsigned __int8 v26 = [v25 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v35];
  id v22 = v35;

  if ((v26 & 1) == 0)
  {
    uint64_t v30 = DMFPolicyLog(v27, v28, v29);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR)) {
      sub_100065CB4((uint64_t)v5, v22);
    }
    goto LABEL_17;
  }

LABEL_18:
}

uint64_t sub_100049C3C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t sub_100049D30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t sub_100049E24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_100049EE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = v6;
  if (!v6)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPolicyRegistration fetchRequest](&OBJC_CLASS___DMDPolicyRegistration, "fetchRequest"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  @"identifier",  v13));
    [v15 setPredicate:v16];

    id v50 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 execute:&v50]);
    id v18 = v50;
    uint64_t v21 = v18;
    if (!v17)
    {
      uint64_t v28 = DMFPolicyLog(v18, v19, v20);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100065DD0(v21);
      }

      uint64_t v30 = *(void *)(a1 + 48);
      uint64_t v31 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
      id v22 = (DMDPolicyRegistration *)objc_claimAutoreleasedReturnValue(v31);
      (*(void (**)(uint64_t, void, DMDPolicyRegistration *))(v30 + 16))(v30, 0LL, v22);
      goto LABEL_21;
    }

    id v48 = v17;
    if ([v17 count])
    {
      id v22 = (DMDPolicyRegistration *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
      uint64_t v25 = DMFPolicyLog(v22, v23, v24);
      unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        unsigned __int8 v52 = v22;
        __int16 v53 = 2114;
        uint64_t v54 = v13;
        uint64_t v27 = "Updating existing registration %{public}@ with identifier %{public}@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
      }
    }

    else
    {
      id v22 = -[DMDPolicyRegistration initWithContext:]( objc_alloc(&OBJC_CLASS___DMDPolicyRegistration),  "initWithContext:",  v5);
      uint64_t v34 = DMFPolicyLog(v22, v32, v33);
      unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        unsigned __int8 v52 = v22;
        __int16 v53 = 2114;
        uint64_t v54 = v13;
        uint64_t v27 = "Adding new registration %{public}@ with identifier %{public}@";
        goto LABEL_14;
      }
    }

    -[DMDPolicyRegistration setIdentifier:](v22, "setIdentifier:", v13);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyTypes]);
    -[DMDPolicyRegistration setPolicyTypes:](v22, "setPolicyTypes:", v35);
    NSErrorUserInfoKey v36 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[DMDPolicyRegistration setModificationDate:](v22, "setModificationDate:", v36);

    id v49 = v21;
    unsigned int v37 = [v5 save:&v49];
    id v38 = v49;

    if (v37)
    {
      uint64_t v42 = *(void **)(a1 + 40);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v35 allObjects]);
      [v42 requestPoliciesForTypes:v43 replyHandler:*(void *)(a1 + 48)];
    }

    else
    {
      uint64_t v44 = DMFPolicyLog(v39, v40, v41);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100065E48((uint64_t)v22, v38);
      }

      uint64_t v46 = *(void *)(a1 + 48);
      uint64_t v47 = DMFErrorWithCodeAndUserInfo(3901LL, 0LL);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v47);
      (*(void (**)(uint64_t, void, void *))(v46 + 16))(v46, 0LL, v43);
    }

    uint64_t v17 = v48;

    uint64_t v21 = v38;
LABEL_21:

    goto LABEL_22;
  }

  uint64_t v10 = DMFPolicyLog(v6, v7, v8);
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100065ED4(v9);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  NSErrorUserInfoKey v55 = NSUnderlyingErrorKey;
  uint64_t v56 = v9;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
  uint64_t v14 = DMFErrorWithCodeAndUserInfo(3901LL, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v15);
LABEL_22:
}

void sub_10004A374(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = a1[6];
    NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
    uint64_t v13 = a3;
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(3900LL, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0LL, v8);
  }

  else
  {
    uint64_t v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    id v11 = 0LL;
    id v6 = 0LL;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v9 _effectivePoliciesForTypes:v10 outError:&v11]);
    id v8 = v11;
    (*(void (**)(void, id, id))(a1[6] + 16LL))(a1[6], v5, v8);
  }
}

void sub_10004A858( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004A88C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](&OBJC_CLASS___DMDEffectivePolicy, "fetchRequest"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  @"type",  *(void *)(a1 + 32)));
    [v12 setPredicate:v13];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"priority",  0LL));
    v71[0] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"policy",  1LL));
    v71[1] = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
    [v12 setSortDescriptors:v16];

    id v69 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 execute:&v69]);
    id v18 = v69;
    uint64_t v21 = v18;
    if (v17)
    {
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v17);
      if (!-[NSMutableArray count](v8, "count"))
      {
LABEL_43:

        goto LABEL_44;
      }

      uint64_t v54 = v21;
      uint64_t v56 = v12;
      uint64_t v57 = a1;
      id v59 = v5;
      id v63 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
      NSErrorUserInfoKey v55 = v17;
      id v62 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
      unint64_t v64 = DMFLowestPolicyPriority;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v58 = v8;
      id obj = v8;
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v70,  16LL);
      if (v22)
      {
        id v23 = v22;
        id v24 = 0LL;
        id v25 = 0LL;
        uint64_t v26 = *(void *)v66;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v66 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
            id v30 = [v28 policy];
            id v31 = [v28 priority];
            id v32 = v31;
            if (v29)
            {
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v30));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v33, v29);

              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v32));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v34, v29);
            }

            else
            {
              unint64_t v35 = v64;
              unint64_t v64 = v35;
            }

            NSErrorUserInfoKey v36 = (void *)objc_claimAutoreleasedReturnValue([v28 excludedIdentifiers]);
            unsigned int v37 = v36;
            if (v36)
            {
              if (v24) {
                [v24 unionSet:v36];
              }
              else {
                id v24 = [v36 mutableCopy];
              }
            }
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v65,  v70,  16LL);
        }

        while (v23);
      }

      else
      {
        id v24 = 0LL;
        id v25 = 0LL;
      }

      if ([*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeCategory])
      {
        uint64_t v44 = v62;
        uint64_t v43 = v63;
        unsigned __int8 obja = [*(id *)(v57 + 40) isInLegacyDowntimeWithPolicies:v63 priorities:v62];
        id v8 = v58;
        uint64_t v12 = v56;
      }

      else
      {
        uint64_t v12 = v56;
        if (([*(id *)(a1 + 32) isEqualToString:DMFEffectivePolicyTypeApplicationCategory] & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", DMFEffectivePolicyTypeWebCategory))
        {
          unsigned __int8 obja = [*(id *)(a1 + 40) isInManagedSettingsDowntime];
        }

        else
        {
          unsigned __int8 obja = 0;
        }

        id v8 = v58;
        uint64_t v44 = v62;
        uint64_t v43 = v63;
      }

      id v45 = objc_alloc(&OBJC_CLASS___DMFEffectivePolicy);
      uint64_t v46 = *(void *)(v57 + 32);
      if (-[NSMutableDictionary count](v43, "count")) {
        uint64_t v47 = v43;
      }
      else {
        uint64_t v47 = 0LL;
      }
      if (-[NSMutableDictionary count](v44, "count")) {
        id v48 = v44;
      }
      else {
        id v48 = 0LL;
      }
      LOBYTE(v53) = obja;
      id v49 = [v45 initWithType:v46 defaultPolicy:v25 currentPoliciesByIdentifier:v47 defaultPriority:v64 prioritiesByIdentifier:v48 excludedIden tifiers:v24 downtimeEnforced:v53];
      uint64_t v50 = *(void *)(*(void *)(v57 + 56) + 8LL);
      uint64_t v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;

      unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v57 + 40) effectivePolicyCache]);
      [v52 setObject:*(void *)(*(void *)(*(void *)(v57 + 56) + 8) + 40) forKey:*(void *)(v57 + 32)];

      uint64_t v7 = 0LL;
      id v5 = v59;
      uint64_t v21 = v54;
      uint64_t v17 = v55;
    }

    else
    {
      uint64_t v38 = DMFPolicyLog(v18, v19, v20);
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100065FB0(v21);
      }

      uint64_t v40 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
      uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
      uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v43 = *(NSMutableDictionary **)(v42 + 40);
      *(void *)(v42 + 40) = v41;
    }

    goto LABEL_43;
  }

  NSErrorUserInfoKey v72 = NSUnderlyingErrorKey;
  id v73 = v6;
  id v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
  uint64_t v9 = DMFErrorWithCodeAndUserInfo(3900LL, v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
LABEL_44:
}

void sub_10004B040(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v77 = NSUnderlyingErrorKey;
    id v78 = v4;
    uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(3900LL, v7);
    uint64_t v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t, void, NSMutableSet *))(v6 + 16))(v6, 0LL, v9);
  }

  else
  {
    uint64_t v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v10 = *(id *)(a1 + 32);
    id v11 = [v10 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v69 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifierPolicyCache]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          if (v17) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, v15);
          }
          else {
            -[NSMutableSet addObject:](v9, "addObject:", v15);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v69 objects:v76 count:16];
      }

      while (v12);
    }

    if (-[NSMutableSet count](v9, "count"))
    {
      v75[0] = DMFEffectivePolicyTypeApplication;
      v75[1] = DMFEffectivePolicyTypeApplicationCategory;
      v75[2] = DMFEffectivePolicyTypeCategory;
      v75[3] = DMFEffectivePolicyTypeWeb;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 4LL));
      uint64_t v19 = *(void **)(a1 + 40);
      id v68 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _effectivePoliciesForTypes:v18 outError:&v68]);
      id v21 = v68;
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)(a1 + 48);
        uint64_t v24 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0LL, v25);

        id v5 = 0LL;
      }

      else
      {
        uint64_t v56 = v20;
        uint64_t v57 = v18;
        if ([v20 count])
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _fetchParentBundleIdentifiersForBundleIdentifiers:v9]);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9, "allObjects"));
          id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v29));

          id v31 = v28;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 allValues]);
          id v33 = [v32 countByEnumeratingWithState:&v59 objects:v73 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v60;
            do
            {
              for (j = 0LL; j != v34; j = (char *)j + 1)
              {
                if (*(void *)v60 != v35) {
                  objc_enumerationMutation(v32);
                }
                [v30 addObjectsFromArray:v37];
              }

              id v34 = [v32 countByEnumeratingWithState:&v59 objects:v73 count:16];
            }

            while (v34);
          }

          uint64_t v38 = *(void **)(a1 + 40);
          id v58 = 0LL;
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 _fetchCategoriesForBundleIdentifiers:v30 withError:&v58]);
          id v40 = v58;
          uint64_t v43 = v40;
          uint64_t v20 = v56;
          if (v39)
          {
            [*(id *)(a1 + 40) _appendPolicyForBundleIdentifiers:v9 toPolicies:v7 categories:v39 parentBundleIdentifiers:v31 policiesByType:v56];
            (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
            id v18 = v57;
            id v5 = 0LL;
          }

          else
          {
            NSErrorUserInfoKey v55 = v31;
            uint64_t v53 = DMFPolicyLog(v40, v41, v42);
            uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            id v18 = v57;
            id v5 = 0LL;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
              sub_100066028();
            }

            (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
            id v31 = v55;
          }
        }

        else
        {
          uint64_t v44 = DMFPolicyLog(0LL, v26, v27);
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "No policies are set, everything is OK",  buf,  2u);
          }

          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          uint64_t v46 = v9;
          id v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v63,  v74,  16LL);
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v64;
            do
            {
              for (k = 0LL; k != v48; k = (char *)k + 1)
              {
                if (*(void *)v64 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)k);
                unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifierPolicyCache]);
                [v52 setObject:&off_1000A6048 forKey:v51];

                -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_1000A6048,  v51);
              }

              id v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v63,  v74,  16LL);
            }

            while (v48);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
          id v18 = v57;
          id v5 = 0LL;
          uint64_t v20 = v56;
        }
      }
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      id v5 = 0LL;
    }
  }
}

void sub_10004BF70(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
    id v18 = a3;
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(3900LL, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v8);
  }

  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_10004C0BC;
    v14[3] = &unk_10009EB68;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    id v16 = v11;
    void v14[4] = v12;
    id v15 = v13;
    id v6 = 0LL;
    [v9 requestPoliciesForBundleIdentifiers:v10 replyHandler:v14];

    uint64_t v8 = v16;
  }
}

void sub_10004C0BC(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v34 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _effectivePolicyForType:DMFEffectivePolicyTypeCategory outError:&v34]);
    id v9 = v34;
    uint64_t v10 = *(void **)(a1 + 32);
    id v33 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 _effectivePolicyForType:DMFEffectivePolicyTypeApplicationCategory outError:&v33]);
    id v25 = v33;

    if (v8) {
      unsigned int v12 = [v8 downtimeEnforced];
    }
    else {
      unsigned int v12 = 0;
    }
    uint64_t v26 = v8;
    uint64_t v24 = v11;
    if (v11) {
      unsigned int v13 = objc_msgSend(v11, "downtimeEnforced", v11);
    }
    else {
      unsigned int v13 = 0;
    }
    uint64_t v14 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v28 count]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = *(id *)(a1 + 40);
    id v15 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = v12 | v13;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v20, v24));
          id v22 = +[DMFCommunicationPolicyMonitor communicationPolicyForApplicationPolicy:downtimeEnforced:]( &OBJC_CLASS___DMFCommunicationPolicyMonitor,  "communicationPolicyForApplicationPolicy:downtimeEnforced:",  v21,  v17);

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v22));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v23, v20);
        }

        id v16 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }

      while (v16);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v6 = v25;
  }
}

void sub_10004C3F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v52 = NSUnderlyingErrorKey;
    id v53 = v4;
    uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(3900LL, v7);
    id v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t, void, NSMutableSet *))(v6 + 16))(v6, 0LL, v9);
  }

  else
  {
    uint64_t v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
    id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v10 = *(id *)(a1 + 32);
    id v11 = [v10 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) categoryIdentifierPolicyCache]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          if (v17) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, v15);
          }
          else {
            -[NSMutableSet addObject:](v9, "addObject:", v15);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }

      while (v12);
    }

    if (-[NSMutableSet count](v9, "count"))
    {
      v50[0] = DMFEffectivePolicyTypeApplicationCategory;
      v50[1] = DMFEffectivePolicyTypeCategory;
      v50[2] = DMFEffectivePolicyTypeWebCategory;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 3LL));
      uint64_t v19 = *(void **)(a1 + 40);
      id v44 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _effectivePoliciesForTypes:v18 outError:&v44]);
      id v21 = v44;
      if (v21)
      {
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v23 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0LL, v24);
      }

      else if ([v20 count])
      {
        [*(id *)(a1 + 40) _appendPolicyForCategoryIdentifiers:v9 toPolicies:v7 policiesByType:v20];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }

      else
      {
        NSErrorUserInfoKey v36 = v20;
        unsigned int v37 = 0LL;
        uint64_t v38 = v18;
        uint64_t v27 = DMFPolicyLog(0LL, v25, v26);
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No policies are set, everything is OK",  buf,  2u);
        }

        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v29 = v9;
        id v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v39,  v49,  16LL);
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v40;
          do
          {
            for (j = 0LL; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v40 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)j);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "categoryIdentifierPolicyCache", v36, v37, v38));
              [v35 setObject:&off_1000A6048 forKey:v34];

              -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_1000A6048,  v34);
            }

            id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v39,  v49,  16LL);
          }

          while (v31);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        id v21 = v37;
        uint64_t v18 = v38;
        uint64_t v20 = v36;
      }
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    id v5 = 0LL;
  }
}

void sub_10004CC84(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSErrorUserInfoKey v62 = NSUnderlyingErrorKey;
    id v63 = v4;
    uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(3900LL, v7);
    id v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t, void, NSMutableSet *))(v6 + 16))(v6, 0LL, v9);
  }

  else
  {
    uint64_t v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
    id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v10 = *(id *)(a1 + 32);
    id v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v56 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) websiteURLsPolicyCache]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          if (v17) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, v15);
          }
          else {
            -[NSMutableSet addObject:](v9, "addObject:", v15);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }

      while (v12);
    }

    if (-[NSMutableSet count](v9, "count"))
    {
      v60[0] = DMFEffectivePolicyTypeApplication;
      v60[1] = DMFEffectivePolicyTypeCategory;
      void v60[2] = DMFEffectivePolicyTypeWeb;
      v60[3] = DMFEffectivePolicyTypeWebCategory;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 4LL));
      uint64_t v19 = *(void **)(a1 + 40);
      id v54 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _effectivePoliciesForTypes:v18 outError:&v54]);
      id v21 = v54;
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)(a1 + 48);
        uint64_t v24 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0LL, v25);

        id v5 = 0LL;
      }

      else if ([v20 count])
      {
        uint64_t v29 = *(void *)(a1 + 32);
        id v28 = *(void **)(a1 + 40);
        id v48 = 0LL;
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 _fetchCategoriesIfNeededForWebsiteURLs:v29 withError:&v48]);
        id v31 = v48;
        uint64_t v34 = v31;
        if (v30)
        {
          [*(id *)(a1 + 40) _appendPolicyForWebsiteURLs:v9 toPolicies:v7 categories:v30 policiesByType:v20];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
          id v5 = 0LL;
        }

        else
        {
          uint64_t v44 = DMFPolicyLog(v31, v32, v33);
          __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          id v5 = 0LL;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_10006608C();
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        }
      }

      else
      {
        __int128 v46 = v20;
        __int128 v47 = v18;
        uint64_t v35 = DMFPolicyLog(0LL, v26, v27);
        NSErrorUserInfoKey v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "No policies are set, everything is OK",  buf,  2u);
        }

        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        unsigned int v37 = v9;
        id v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v50;
          do
          {
            for (j = 0LL; j != v39; j = (char *)j + 1)
            {
              if (*(void *)v50 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)j);
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "websiteURLsPolicyCache", v46, v47));
              [v43 setObject:&off_1000A6048 forKey:v42];

              -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_1000A6048,  v42);
            }

            id v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
          }

          while (v39);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        uint64_t v18 = v47;
        id v5 = 0LL;
        uint64_t v20 = v46;
      }
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      id v5 = 0LL;
    }
  }
}

void sub_10004DA38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10004DA60(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  id v10 = *v7;
  NSMutableDictionary *v7 = v9;

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 56)];
}

void sub_10004DD00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004DD28(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  NSMutableDictionary *v7 = v9;

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) unlockWithCondition:*(void *)(a1 + 56)];
}

void sub_10004DEEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = v6;
  if (v6)
  {
    uint64_t v10 = DMFPolicyLog(v6, v7, v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100065ED4(v9);
    }

    uint64_t v12 = *(void *)(a1 + 72);
    NSErrorUserInfoKey v81 = NSUnderlyingErrorKey;
    id v82 = v9;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v82,  &v81,  1LL));
    uint64_t v14 = DMFErrorWithCodeAndUserInfo(3901LL, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](&OBJC_CLASS___DMDEffectivePolicy, "fetchRequest"));
    if ([*(id *)(a1 + 32) count]) {
      uint64_t v16 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K IN %@) AND (%K == %@) AND (%K == %@)",  @"identifier",  *(void *)(a1 + 32),  @"organizationIdentifier",  *(void *)(a1 + 40),  @"declarationIdentifier",  *(void *)(a1 + 48));
    }
    else {
      uint64_t v16 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil) AND (%K == %@) AND (%K == %@)",  @"identifier",  @"organizationIdentifier",  *(void *)(a1 + 40),  @"declarationIdentifier",  *(void *)(a1 + 48),  v55);
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v13 setPredicate:v17];

    id v77 = 0LL;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 execute:&v77]);
    id v19 = v77;
    uint64_t v15 = v19;
    if (v18)
    {
      __int128 v60 = v18;
      if ([*(id *)(a1 + 32) count])
      {
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        id obj = *(id *)(a1 + 32);
        id v63 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
        if (v63)
        {
          __int128 v56 = v15;
          __int128 v57 = v13;
          char v22 = 0;
          uint64_t v61 = *(void *)v74;
          uint64_t v62 = a1;
          id v59 = v5;
          do
          {
            for (i = 0LL; i != v63; i = (char *)i + 1)
            {
              if (*(void *)v74 != v61) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
              __int128 v69 = 0u;
              __int128 v70 = 0u;
              __int128 v71 = 0u;
              __int128 v72 = 0u;
              id v25 = v18;
              id v26 = [v25 countByEnumeratingWithState:&v69 objects:v79 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v70;
                while (2)
                {
                  for (j = 0LL; j != v26; j = (char *)j + 1)
                  {
                    if (*(void *)v70 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v29 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
                    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
                    unsigned int v31 = [v30 isEqual:v24];

                    if (v31)
                    {
                      id v26 = v29;
                      goto LABEL_25;
                    }
                  }

                  id v26 = [v25 countByEnumeratingWithState:&v69 objects:v79 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }

LABEL_25:
                id v5 = v59;
                uint64_t v18 = v60;
              }

              a1 = v62;
              if ([*(id *)(v62 + 56) _upsertPolicy:*(void *)(v62 + 80) forType:*(void *)(v62 + 64) identifier:v24 priority:*(void *)(v62 + 88) organizationIdentifier:*(void *)(v62 + 40) declarationIdentifie r:*(void *)(v62 + 48) policyToUpdate:v26 managedObjectContext:v5]) {
                char v22 = 1;
              }
            }

            id v63 = [obj countByEnumeratingWithState:&v73 objects:v80 count:16];
          }

          while (v63);
          int v32 = v22 & 1;
          uint64_t v13 = v57;
          id v9 = 0LL;
          uint64_t v15 = v56;
        }

        else
        {
          int v32 = 0;
        }
      }

      else if ([v18 count])
      {
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        id v38 = v18;
        id v39 = [v38 countByEnumeratingWithState:&v65 objects:v78 count:16];
        if (v39)
        {
          id v40 = v39;
          char v41 = 0;
          uint64_t v42 = *(void *)v66;
          do
          {
            for (k = 0LL; k != v40; k = (char *)k + 1)
            {
              if (*(void *)v66 != v42) {
                objc_enumerationMutation(v38);
              }
              if ([*(id *)(a1 + 56) _upsertPolicy:*(void *)(a1 + 80) forType:*(void *)(a1 + 64) identifier:0 priority:*(void *)(a1 + 88) organizationIdentifier:*(void *)(a1 + 40) declarationIdentifie r:*(void *)(a1 + 48) policyToUpdate:*(void *)(*((void *)&v65 + 1) + 8 * (void)k) managedObjectContext:v5]) {
                char v41 = 1;
              }
            }

            id v40 = [v38 countByEnumeratingWithState:&v65 objects:v78 count:16];
          }

          while (v40);
          int v32 = v41 & 1;
        }

        else
        {
          int v32 = 0;
        }

        uint64_t v18 = v60;
      }

      else
      {
        int v32 = [*(id *)(a1 + 56) _upsertPolicy:*(void *)(a1 + 80) forType:*(void *)(a1 + 64) identifier:0 priority:*(void *)(a1 + 88) organizationIdentifier:*(void *)(a1 + 40) declarationIdentifier:*(void *)(a1 + 48) pol icyToUpdate:0 managedObjectContext:v5];
      }

      id v64 = v15;
      unsigned int v44 = [v5 save:&v64];
      id v45 = v64;

      if (v44)
      {
        if (v32)
        {
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 64)));
          [*(id *)(a1 + 56) _handleChangesToPolicyTypes:v49];
        }

        (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      }

      else
      {
        uint64_t v50 = DMFPolicyLog(v46, v47, v48);
        __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_100066208(v45);
        }

        uint64_t v52 = *(void *)(a1 + 72);
        uint64_t v53 = DMFErrorWithCodeAndUserInfo(3901LL, 0LL);
        id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        (*(void (**)(uint64_t, void *))(v52 + 16))(v52, v54);
      }

      uint64_t v15 = v45;
    }

    else
    {
      uint64_t v33 = DMFPolicyLog(v19, v20, v21);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100066190(v15);
      }

      uint64_t v35 = *(void *)(a1 + 72);
      uint64_t v36 = DMFErrorWithCodeAndUserInfo(3900LL, 0LL);
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v37);
    }
  }
}

void sub_10004E758(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = v6;
  if (v6)
  {
    uint64_t v10 = DMFPolicyLog(v6, v7, v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100065ED4(v9);
    }

    uint64_t v12 = a1[7];
    NSErrorUserInfoKey v63 = NSUnderlyingErrorKey;
    id v64 = v9;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
    uint64_t v14 = DMFErrorWithCodeAndUserInfo(3901LL, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v15);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](&OBJC_CLASS___DMDEffectivePolicy, "fetchRequest"));
    __int128 v49 = a1;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND (%K == %@)",  @"organizationIdentifier",  a1[4],  @"declarationIdentifier",  a1[5]));
    [v13 setPredicate:v16];

    id v55 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 execute:&v55]);
    id v47 = v55;
    uint64_t v18 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v17 count]);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 type]);
          -[NSMutableSet addObject:](v18, "addObject:", v25);

          [v5 deleteObject:v24];
        }

        id v21 = [v19 countByEnumeratingWithState:&v51 objects:v62 count:16];
      }

      while (v21);
    }

    id v50 = v47;
    unsigned int v26 = [v5 save:&v50];
    id v15 = v50;

    if (v26)
    {
      id v30 = [v19 count];
      if (v30) {
        id v30 = [(id)v49[6] _handleChangesToPolicyTypes:v18];
      }
      uint64_t v33 = DMFPolicyLog(v30, v31, v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 componentsJoinedByString:@","]);
        uint64_t v37 = v49[5];
        *(_DWORD *)buf = 138543618;
        __int128 v57 = v36;
        __int16 v58 = 2114;
        uint64_t v59 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Successfully removed policy types %{public}@ for declaration %{public}@",  buf,  0x16u);
      }

      (*(void (**)(void))(v49[7] + 16LL))();
    }

    else
    {
      uint64_t v38 = DMFPolicyLog(v27, v28, v29);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      id v40 = v49;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
        unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v48 componentsJoinedByString:@","]);
        uint64_t v45 = v49[5];
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v15 verboseDescription]);
        *(_DWORD *)buf = 138543874;
        __int128 v57 = v44;
        __int16 v58 = 2114;
        uint64_t v59 = v45;
        id v40 = v49;
        __int16 v60 = 2114;
        uint64_t v61 = v46;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Error removing policies types %{public}@ for declaration %{public}@: %{public}@",  buf,  0x20u);
      }

      uint64_t v41 = v40[7];
      uint64_t v42 = DMFErrorWithCodeAndUserInfo(3901LL, 0LL);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v43);
    }
  }
}

void sub_10004EC54(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](&OBJC_CLASS___DMDEffectivePolicy, "fetchRequest"));
    id v6 = *(void **)(a1 + 32);
    if (!v6) {
      id v6 = &__NSArray0__struct;
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT (%K IN %@)",  @"organizationIdentifier",  v6));
    [v5 setPredicate:v7];

    [*(id *)(a1 + 40) _removeOrphanedPoliciesFromFetchRequest:v5 managedObjectContext:v8 completionHandler:*(void *)(a1 + 48)];
  }
}

void sub_10004EDC4(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEffectivePolicy fetchRequest](&OBJC_CLASS___DMDEffectivePolicy, "fetchRequest"));
    id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [*(id *)(a1 + 32) count]);
    uint64_t v7 = *(void **)(a1 + 32);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_10004EF10;
    uint64_t v14 = &unk_10009F1B0;
    id v15 = @"organizationIdentifier";
    uint64_t v16 = @"declarationIdentifier";
    id v8 = v6;
    uint64_t v17 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:&v11];
    if (-[NSMutableArray count](v8, "count"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v8));
      [v5 setPredicate:v9];
    }

    objc_msgSend( *(id *)(a1 + 40),  "_removeOrphanedPoliciesFromFetchRequest:managedObjectContext:completionHandler:",  v5,  v10,  *(void *)(a1 + 48),  v10,  v11,  v12,  v13,  v14);
  }
}

void sub_10004EF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) AND NOT (%K IN %@)",  *(void *)(a1 + 32),  a2,  *(void *)(a1 + 40),  a3));
  [*(id *)(a1 + 48) addObject:v4];
}

LABEL_28:
}

id sub_10004F490(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsRegisteredForPolicyTypes:*(void *)(a1 + 40)];
}

void sub_10004F53C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
    id v25 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(3900LL, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    uint64_t v12 = DMFPolicyLog(v9, v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000662F8(a1, v8);
    }
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = *(id *)(a1 + 32);
    id v14 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v8);
          }
          id v18 =  objc_msgSend( *(id *)(a1 + 40),  "_recalculateEffectivePolicyForType:outError:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)i),  0,  (void)v19);
        }

        id v15 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v15);
    }
  }
}

void sub_10004F744(uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "effectivePolicyCache", (void)v18));
        [v8 removeObjectForKey:v7];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMFApplicationPolicyMonitor policyTypes](&OBJC_CLASS___DMFApplicationPolicyMonitor, "policyTypes"));
  LODWORD(v9) = [v9 intersectsSet:v10];

  if ((_DWORD)v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifierPolicyCache]);
    [v11 removeAllObjects];
  }

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[DMFCategoryPolicyMonitor policyTypes]( &OBJC_CLASS___DMFCategoryPolicyMonitor,  "policyTypes",  (void)v18));
  LODWORD(v12) = [v12 intersectsSet:v13];

  if ((_DWORD)v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) categoryIdentifierPolicyCache]);
    [v14 removeAllObjects];
  }

  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMFWebsitePolicyMonitor policyTypes](&OBJC_CLASS___DMFWebsitePolicyMonitor, "policyTypes"));
  LODWORD(v15) = [v15 intersectsSet:v16];

  if ((_DWORD)v15)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) websiteURLsPolicyCache]);
    [v17 removeAllObjects];
  }

void sub_10004FC80(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingUnit:16 value:1 toDate:v4 options:0]);

  [*(id *)(a1 + 32) _enableEmergencyModeUntilDate:v3 referenceDate:v4 withCompletionHandler:*(void *)(a1 + 40)];
}

void sub_10004FDB4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:*(double *)(a1 + 48)]);
  [*(id *)(a1 + 32) _enableEmergencyModeUntilDate:v2 referenceDate:v3 withCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t sub_1000500EC(uint64_t a1)
{
  uint64_t v2 = notify_post((const char *)[DMFEmergencyModeChangedNotification UTF8String]);
  uint64_t v3 = DMFEmergencyModeLog(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling Emergency Mode", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100050238(uint64_t a1)
{
  uint64_t v2 = (void *)xpc_copy_event( [@"com.apple.alarm" UTF8String],  objc_msgSend(@"com.apple.dmd.emergency-mode.alarm", "UTF8String"));
  if (v2)
  {
    unint64_t date = xpc_dictionary_get_date(v2, (const char *)[@"Date" UTF8String]);
    if (date < 0x3B9ACA00)
    {
      uint64_t v4 = DMFEmergencyModeLog(date);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_1000664C4();
      }

      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = DMFErrorWithCodeAndUserInfo(3902LL, 0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v8);
      goto LABEL_16;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(date / 0x3B9ACA00)));
    id v11 = [v8 timeIntervalSinceNow];
    double v13 = v12;
    uint64_t v14 = DMFEmergencyModeLog(v11);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 <= 0.0)
    {
      if (v16)
      {
        int v20 = 138543618;
        __int128 v21 = v8;
        __int16 v22 = 2048;
        double v23 = v13;
        uint64_t v17 = "Emergency Mode ended on %{public}@, %f seconds ago";
        goto LABEL_14;
      }
    }

    else if (v16)
    {
      int v20 = 138543618;
      __int128 v21 = v8;
      __int16 v22 = 2048;
      double v23 = v13;
      uint64_t v17 = "Emergency Mode will end on %{public}@, %f seconds from now";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, 0x16u);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
    (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0LL);

LABEL_16:
    goto LABEL_17;
  }

  uint64_t v9 = DMFEmergencyModeLog(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Emergency Mode is not set",  (uint8_t *)&v20,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_17:
}

void sub_100050704(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", DMFEffectivePolicyTypeCategory));
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_1000508EC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", DMFEffectivePolicyTypeCategory));
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_100050940(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", DMFEffectivePolicyTypeApplication));
  [*(id *)(a1 + 32) _handleChangesToPolicyTypes:v2];
}

void sub_100050C74(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  id v2 = (void *)qword_1000CCE10;
  qword_1000CCE10 = v1;
}

id _assertionQueue()
{
  if (qword_1000CCE28 != -1) {
    dispatch_once(&qword_1000CCE28, &stru_10009F270);
  }
  return (id)qword_1000CCE20;
}

void sub_100050CE4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("DMDPowerAssertion Queue", 0LL);
  id v2 = (void *)qword_1000CCE20;
  qword_1000CCE20 = (uint64_t)v1;
}

id sub_100050E64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retain];
}

id sub_100050EFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _release];
}

void sub_100050F74(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isParked])
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Trying to park a power assertion that's already parked.",  0LL));
    objc_exception_throw(v2);
    -[DMDPowerAssertion unpark](v3, v4);
  }

  else
  {
    [*(id *)(a1 + 32) setIsParked:1];
    [*(id *)(a1 + 32) _release];
  }

void sub_100051048(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isParked])
  {
    [*(id *)(a1 + 32) setIsParked:0];
    [*(id *)(a1 + 32) _retain];
  }

  else
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Trying to unpark a power assertion that's not parked.",  0LL));
    objc_exception_throw(v2);
    -[DMDPowerAssertion _retain](v3, v4);
  }

id sub_100051414(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100051558(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_100051864(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }

  else
  {
    uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___DMFRefreshStatusResultObject);
    [v5 setNumberOfUpdates:v6];
    [*(id *)(a1 + 32) endOperationWithResultObject:v5];
  }
}

id sub_100051B70(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_100051DD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000665B0();
    }
    [*(id *)(a1 + 40) endOperationWithError:v3];
  }

  else
  {
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    uint64_t v5 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100051EB4;
    v8[3] = &unk_10009E650;
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    [v4 setTapToPayScreenLock:0 forBundleIdentifier:v6 completion:v8];
  }
}

void sub_100051EB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006661C();
    }
    [*(id *)(a1 + 40) endOperationWithError:v3];
  }

  else
  {
    SEL v4 = (void *)objc_opt_class(*(void *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    id v12 = 0LL;
    unsigned __int8 v6 = [v4 removeAppMetadataForBundleIdentifier:v5 error:&v12];
    id v7 = v12;
    id v8 = *(void **)(a1 + 40);
    if ((v6 & 1) != 0)
    {
      id v9 = (void *)objc_opt_class(v8);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      void v11[2] = sub_100051FA4;
      v11[3] = &unk_10009E850;
      uint64_t v10 = *(void *)(a1 + 32);
      v11[4] = *(void *)(a1 + 40);
      [v9 removeAppWithBundleIdentifier:v10 completion:v11];
    }

    else
    {
      [v8 endOperationWithError:v7];
    }
  }
}

void sub_100051FA4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v7 = NSUnderlyingErrorKey;
    id v8 = a2;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    uint64_t v5 = DMFErrorWithCodeAndUserInfo(1100LL, v4);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v2 endOperationWithError:v6];
  }

  else
  {
    id v4 = 0LL;
    [v2 endOperationWithResultObject:0];
  }
}

id sub_10005288C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = DMFAppLog(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Start uninstalling app with bundle identifier: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return [*(id *)(a1 + 40) startUninstallingAppWithBundleIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

id sub_10005293C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = DMFAppLog(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Start uninstalling app with bundle identifier: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return [*(id *)(a1 + 40) startUninstallingAppWithBundleIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

  ;
}

void sub_100052A04(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v9 - 96), 8) = a1;
}

void sub_100052DAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v17 = 0LL;
      unsigned __int8 v11 = [v9 _removeRestrictionsWithRequest:v10 error:&v17];
      id v12 = v17;
      unsigned __int8 v6 = v12;
      if ((v11 & 1) == 0)
      {
        double v13 = *(void **)(a1 + 32);
        if (!v12)
        {
          uint64_t v16 = DMFErrorWithCodeAndUserInfo(1900LL, 0LL);
          unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
          [v13 endOperationWithError:v6];
          goto LABEL_10;
        }

        NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
        id v19 = v12;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        uint64_t v14 = DMFErrorWithCodeAndUserInfo(1900LL, v8);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        [v13 endOperationWithError:v15];

        goto LABEL_3;
      }
    }

    else
    {
      unsigned __int8 v6 = 0LL;
    }

    [*(id *)(a1 + 32) endOperationWithResultObject:0];
    goto LABEL_10;
  }

  uint64_t v5 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
  id v21 = v3;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  uint64_t v7 = DMFErrorWithCodeAndUserInfo(1900LL, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 endOperationWithError:v8];
LABEL_3:

LABEL_10:
}

id sub_100053440(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100053A20(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10005405C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v7 = NSUnderlyingErrorKey;
    uint64_t v8 = a2;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    uint64_t v5 = DMFErrorWithCodeAndUserInfo(1900LL, v4);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v2 endOperationWithError:v6];
  }

  else
  {
    id v4 = 0LL;
    [v2 endOperationWithResultObject:0];
  }
}

id sub_10005505C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_1000554A4(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DMDServer);
  id v2 = (void *)qword_1000CCE40;
  qword_1000CCE40 = (uint64_t)v1;
}

id sub_100055BA4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) endOperationWithError:a2];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v4 sendManagedAppsChangedNotification];

  return [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_100055EF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100055F1C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained endOperationWithError:v5];
  }
  else {
    [WeakRetained endOperationWithResultObject:0];
  }
}

id sub_100056484(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_100056870(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) endOperationWithError:a2];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v4 sendManagedAppsChangedNotification];

  return [*(id *)(a1 + 32) endOperationWithResultObject:0];
}

void sub_1000571D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    NSErrorUserInfoKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066C70();
    }

    [*(id *)(a1 + 40) endOperationWithError:v5];
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    uint64_t v9 = DMFBundleIdentifierErrorKey;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    void v13[2] = sub_1000572E0;
    v13[3] = &unk_10009ECB0;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v8 setTapToPayScreenLock:0 forBundleIdentifier:v9 completion:v13];
  }
}

void sub_1000572E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    NSErrorUserInfoKey v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066D38();
    }

    [*(id *)(a1 + 40) endOperationWithError:v5];
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v23 = 0LL;
    unsigned __int8 v9 = +[DMDRemoveAppOperation removeAppMetadataForBundleIdentifier:error:]( &OBJC_CLASS___DMDRemoveAppOperation,  "removeAppMetadataForBundleIdentifier:error:",  v8,  &v23);
    id v10 = v23;
    if ((v9 & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      uint64_t v12 = *(void *)(a1 + 32);
      id v22 = 0LL;
      unsigned __int8 v13 = [v11 removePersonaMappingForBundleID:v12 error:&v22];
      id v14 = v22;

      if ((v13 & 1) == 0)
      {
        uint64_t v17 = DMFAppLog(v15, v16);
        NSErrorUserInfoKey v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100066CD4();
        }
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      [v19 sendManagedAppsChangedNotification];

      if ([*(id *)(a1 + 48) options])
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        void v21[2] = sub_10005749C;
        v21[3] = &unk_10009E850;
        uint64_t v20 = *(void *)(a1 + 32);
        v21[4] = *(void *)(a1 + 40);
        +[DMDRemoveAppOperation removeAppWithBundleIdentifier:completion:]( &OBJC_CLASS___DMDRemoveAppOperation,  "removeAppWithBundleIdentifier:completion:",  v20,  v21);
      }

      else
      {
        [*(id *)(a1 + 40) endOperationWithResultObject:0];
      }
    }

    else
    {
      [*(id *)(a1 + 40) endOperationWithError:v10];
    }
  }
}

void sub_10005749C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v7 = NSUnderlyingErrorKey;
    uint64_t v8 = a2;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    uint64_t v5 = DMFErrorWithCodeAndUserInfo(1100LL, v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v2 endOperationWithError:v6];
  }

  else
  {
    id v4 = 0LL;
    [v2 endOperationWithResultObject:0];
  }
}

void sub_1000577BC(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DMDSUManagerInstallTask_tvOS);
  id v2 = (void *)qword_1000CCE50;
  qword_1000CCE50 = (uint64_t)v1;
}

LABEL_42:
    uint64_t v16 = 0LL;
    goto LABEL_43;
  }

  if (!a5) {
    goto LABEL_42;
  }
  uint64_t v15 = DMFErrorWithCodeAndUserInfo(801LL, 0LL);
  uint64_t v16 = 0LL;
  *a5 = (id)objc_claimAutoreleasedReturnValue(v15);
LABEL_43:

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);

  return v16;
}

void sub_10005821C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005824C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005825C(uint64_t a1)
{
}

void sub_100058264(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100058504( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100058540(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(a1[4] + 8) + 40) setDownload:a2];
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

void sub_100058750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100058778(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_15:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v14;
}

void sub_1000589DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100058A08(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100058D0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100058D3C(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100059CE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

id sub_100059D0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained description]);

  return v2;
}

void sub_100059E34(id a1, NSNumber *a2, CATSerialOperationQueue *a3, BOOL *a4)
{
}

void sub_100059F58(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_nameForOperationGroup:", objc_msgSend(a2, "unsignedIntegerValue")));
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 operations]);

  [v7 appendFormat:@"\nGroup: %@\n%@", v9, v8];
}

LABEL_21:
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not get operation class for request: %{public}@",  buf,  0xCu);
    }

    NSErrorUserInfoKey v24 = 0LL;
  }

  return v24;
}

void sub_10005A50C(uint64_t a1)
{
  id v6 = 0LL;
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^DM[DF](\\w+)Request$",  0LL,  &v6));
  id v3 = v6;
  id v4 = (void *)qword_1000CCE60;
  qword_1000CCE60 = v2;

  if (!qword_1000CCE60)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"DMDTaskServerDelegate.m", 178, @"%@", v3 object file lineNumber description];
  }
}

void sub_10005AF8C(id a1)
{
  uint64_t v1 = (void *)qword_1000CCE70;
  qword_1000CCE70 = (uint64_t)&off_1000A6090;
}

void sub_10005B5A4(uint64_t a1)
{
  id v9 = 0LL;
  id v2 =  +[Libsysdiagnose sysdiagnoseWithMetadata:withError:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withError:",  0LL,  &v9);
  id v3 = v9;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(3000LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v5 endOperationWithError:v8];
  }

  else
  {
    MCSendDiagnosticsCollectedNotification();
    [*(id *)(a1 + 32) endOperationWithResultObject:0];
  }

  [*(id *)(a1 + 40) stayAliveThroughHereAtLeast];
}

void sub_10005B8C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v8 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) endOperationWithError:a3];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

    uint64_t v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 _runWithRequest:*(void *)(a1 + 40) metadata:v8];
    }
    else {
      [v7 endOperationWithDMFErrorCode:2606];
    }
  }
}

id sub_10005BC28(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 endOperationWithError:a2];
  }
  else {
    return [v3 _endOperationWithBundleIdentifier:*(void *)(a1 + 40)];
  }
}

void sub_10005C020(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) _setState:7 forBundleIdentifier:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _startUpdateAppForRequest:*(void *)(a1 + 48) metadata:*(void *)(a1 + 56)];
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) bundleIdentifier]);
    [v3 _setState:15 forBundleIdentifier:v4];
  }

void sub_10005C248(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _showUpdateFailurePromptIfNeededForRequest:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) endOperationWithError:v3];
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___DMFMDMv1UpdateAppRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = *(id *)(a1 + 40);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 VPNUUIDString]);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 cellularSliceUUIDString]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 contentFilterUUIDString]);
      NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue([v6 DNSProxyUUIDString]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 relayUUIDString]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedDomains]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedDomainsEnableDirectDownloads]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 allowUserToHide]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allowUserToLock]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
      id v10 = [v6 managementOptions];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceIdentifier]);
      [v28 setVPNUUIDString:v27 cellularSliceUUIDString:v26 contentFilterUUIDString:v25 DNSProxyUUIDString:v24 relayUUIDString:v23 associatedDo mains:v7 enableDirectDownloads:v22 allowUserToHide:v21 allowUserToLock:v8 configuration:v9 options:v10 sourceIdentifier:v11 forBundleIdentifier:*(void *)(a1 + 56)];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 removable]);
      uint64_t v14 = *(void *)(a1 + 56);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10005C550;
      v31[3] = &unk_10009E850;
      id v15 = v6;
      id v32 = v15;
      [v12 setRemovability:v13 forBundleIdentifier:v14 completion:v31];

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 tapToPayScreenLock]);
      uint64_t v18 = *(void *)(a1 + 56);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10005C5B4;
      v29[3] = &unk_10009E850;
      id v30 = v15;
      id v19 = v15;
      [v16 setTapToPayScreenLock:v17 forBundleIdentifier:v18 completion:v29];

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      [v20 sendManagedAppsChangedNotification];
    }

    [*(id *)(a1 + 32) _endOperationWithBundleIdentifier:*(void *)(a1 + 56)];
  }
}

void sub_10005C550(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066F90(a1, (uint64_t)v5, v7);
    }
  }
}

void sub_10005C5B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = DMFAppLog(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006701C(a1, (uint64_t)v5, v7);
    }
  }
}

id sub_10005CB20(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

id sub_10005CD9C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 endOperationWithError:a2];
  }
  else {
    return [v2 endOperationWithResultObject:0];
  }
}

void sub_10005D11C(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initPrivate];
  id v2 = (void *)qword_1000CCE80;
  qword_1000CCE80 = (uint64_t)v1;
}

void sub_10005D420(id *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] identifier]);
    int v9 = 138543362;
    id v10 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Adding user notification: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] notifications]);
  [v3 addObject:a1[4]];

  id v4 = [a1[6] copy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] completionsByIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] identifier]);
  [v5 setObject:v4 forKeyedSubscript:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1[5] notifications]);
  id v8 = [v7 count];

  if (v8 == (id)1) {
    [a1[5] _showNextNotification];
  }
}

void sub_10005D768(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notifications]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 defaultButtonTitle]);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 alternateButtonTitle]);
      if (v6)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 otherButtonTitle]);
        BOOL v8 = v7 != 0LL;

        uint64_t v6 = (void *)(32LL * v8);
      }

      else
      {
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    int v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _dictFromNotification:v3]);
    [v3 timeout];
    CFUserNotificationRef v11 = CFUserNotificationCreate(kCFAllocatorDefault, v10, (CFOptionFlags)v6, &error, v9);
    if (v11)
    {
      CFUserNotificationRef v12 = v11;
      [v3 setNotificationRef:v11];
      CFRelease(v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v12,  (CFUserNotificationCallBack)sub_10005D9AC,  0LL);
      if (RunLoopSource)
      {
        id v15 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v15, kCFRunLoopCommonModes);
        CFRelease(v15);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "User notification started: %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000671D4((uint64_t)v13);
        }
        [*(id *)(a1 + 32) _completeNotification:v3 response:4];
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100067190();
      }
      [*(id *)(a1 + 32) _completeNotification:v3 response:4];
    }
  }
}

void sub_10005D9AC(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[DMDUserNotificationController sharedController]( &OBJC_CLASS___DMDUserNotificationController,  "sharedController"));
  [v4 _notificationRef:a1 wasDismissedWithFlags:a2];
}

void sub_10005DBE4(uint64_t a1)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notifications", 0));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(id *)(*((void *)&v12 + 1) + 8 * v6);
      if ([v7 notificationRef] == *(id *)(a1 + 40)) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v8 = v7;

    if (!v8) {
      return;
    }
    unint64_t v9 = *(void *)(a1 + 48);
    if (v9 < 4) {
      unint64_t v10 = v9 + 1;
    }
    else {
      unint64_t v10 = 0LL;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CFUserNotificationRef v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "User notification ended: %{public}@",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) _completeNotification:v8 response:v10];
  }

  else
  {
LABEL_9:
    id v8 = v2;
  }
}

void sub_10005DEC0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    NSErrorUserInfoKey v7 = NSUnderlyingErrorKey;
    id v8 = a2;
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    uint64_t v5 = DMFErrorWithCodeAndUserInfo(3100LL, v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v2 endOperationWithError:v6];
  }

  else
  {
    id v4 = 0LL;
    [v2 endOperationWithResultObject:0];
  }
}

LABEL_32:
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 sharedUsage]);
      -[DMFApp setSharedUsage:](v11, "setSharedUsage:", v31);

      goto LABEL_33;
    }

LABEL_68:
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v30 onDemandResourcesUsage]);
    -[DMFApp setOnDemandResourcesUsage:](v11, "setOnDemandResourcesUsage:", v46);

    if (!v28) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }

uint64_t MCProfileFilterFlagsFromDMFProfileFilterFlags(uint64_t a1)
{
  if (a1) {
    return a1 & 0x3F;
  }
  else {
    return 3LL;
  }
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_autoreleasePoolPush();
  +[NSFileManager dmd_setUserDirSuffix:](&OBJC_CLASS___NSFileManager, "dmd_setUserDirSuffix:", "com.apple.dmd");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager dmd_userDarwinUserTempDirectoryURL]( &OBJC_CLASS___NSFileManager,  "dmd_userDarwinUserTempDirectoryURL"));
  [v4 getFileSystemRepresentation:v11 maxLength:1024];

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  NSErrorUserInfoKey v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v6);
  dispatch_source_set_event_handler(v7, &stru_10009F4C8);
  dispatch_activate(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDServer sharedServer](&OBJC_CLASS___DMDServer, "sharedServer"));
  [v8 run];

  objc_autoreleasePoolPop(v3);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v9 run];

  return 0;
}

void sub_10005F270(id a1)
{
  uint64_t v1 = DMFServerLog(a1);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "SIGTERM received, cleaning all outstanding XPC transactions",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

id DMDErrorChainFromError(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v15 = v1;
  if (v15)
  {
    uint64_t v3 = DMFDeclarationStateErrorChainLocalizedDescriptionKey;
    uint64_t v4 = DMFDeclarationStateErrorChainErrorDomainKey;
    uint64_t v5 = DMFDeclarationStateErrorChainErrorCodeKey;
    uint64_t v6 = v15;
    do
    {
      NSErrorUserInfoKey v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      [v7 setObject:v9 forKeyedSubscript:v3];

      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      [v7 setObject:v10 forKeyedSubscript:v4];

      CFUserNotificationRef v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
      [v7 setObject:v11 forKeyedSubscript:v5];

      -[NSMutableArray addObject:](v2, "addObject:", v7);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 objectForKey:NSUnderlyingErrorKey]);

      uint64_t v6 = (void *)v12;
    }

    while (v12);
  }

  id v13 = -[NSMutableArray copy](v2, "copy");

  return v13;
}

void sub_10005F64C(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[DMDPaths systemGroupContainerPath](&OBJC_CLASS___DMDPaths, "systemGroupContainerPath"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 URLByAppendingPathComponent:@"Library" isDirectory:1]);
  uint64_t v3 = (void *)qword_1000CCE90;
  qword_1000CCE90 = v2;
}

void sub_10005F7D8(id a1)
{
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000672C0();
    }
    uid_t v2 = getuid();
    uint64_t v3 = getpwuid(v2);
    if (!v3)
    {
      CFUserNotificationRef v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke"));
      uint64_t v13 = getuid();
      __int128 v14 = __error();
      id v15 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v14));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v11 handleFailureInFunction:v12, @"NSFileManager+DMDAdditions.m", 64, @"Failed to get passwd entry for uid %u: %@ (%d)", v13, v16, *__error() file lineNumber description];
    }

    pw_dir = v3->pw_dir;
  }

  if (!realpath_DARWIN_EXTSN(pw_dir, v17))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    NSErrorUserInfoKey v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_userHomeURL]_block_invoke"));
    id v8 = __error();
    unint64_t v9 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v8));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v6 handleFailureInFunction:v7, @"NSFileManager+DMDAdditions.m", 70, @"Failed to resolve user home directory: %@ (%d)", v10, *__error() file lineNumber description];
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v17,  1LL,  0LL));
  uint64_t v5 = (void *)qword_1000CCEA0;
  qword_1000CCEA0 = v4;
}

void sub_10005FA4C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dmd_userHomeURL"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"Library" isDirectory:1]);
  uid_t v2 = (void *)qword_1000CCEB0;
  qword_1000CCEB0 = v1;
}

void sub_10005FADC(id a1)
{
  if (!confstr(65537, v14, 0x400uLL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke"));
    uint64_t v5 = __error();
    uint64_t v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v5));
    NSErrorUserInfoKey v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v3 handleFailureInFunction:v4, @"NSFileManager+DMDAdditions.m", 91, @"Failed to initialize darwin user temp directory: %@ (%d)", v7, *__error() file lineNumber description];
  }

  if (!realpath_DARWIN_EXTSN(v14, v13))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_userDarwinUserTempDirectoryURL]_block_invoke"));
    unint64_t v10 = __error();
    CFUserNotificationRef v11 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v10));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v8 handleFailureInFunction:v9, @"NSFileManager+DMDAdditions.m", 94, @"Failed to resolve darwin user temp directory: %@ (%d)", v12, *__error() file lineNumber description];
  }

  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v13,  1LL,  0LL));
  uid_t v2 = (void *)qword_1000CCEC0;
  qword_1000CCEC0 = v1;
}

void sub_100060100(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Request validation failed for removing profile: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100060178(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Request validation failed for installing profile: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000601F0()
{
}

void sub_100060254(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "font asset data is nil", v1, 2u);
}

void sub_100060294(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "image asset data is nil", v1, 2u);
}

void sub_1000602D4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Request validation failed for setting policy: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002C2C();
}

void sub_100060350(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Request validation failed for removing policy: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002C2C();
}

void sub_1000603CC(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateType]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadCalendarIdentifier]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadNotificationTimes]);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadStartDay]);
  CFUserNotificationRef v11 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadStartTime]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadEndDay]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a2 payloadEndTime]);
  int v14 = 138545154;
  id v15 = v6;
  __int16 v16 = 2114;
  uint64_t v17 = v7;
  __int16 v18 = 2114;
  id v19 = v8;
  __int16 v20 = 2114;
  id v21 = v9;
  __int16 v22 = 2114;
  id v23 = v10;
  __int16 v24 = 2114;
  id v25 = v11;
  __int16 v26 = 2114;
  uint64_t v27 = v12;
  __int16 v28 = 2114;
  uint64_t v29 = v13;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Predicate type: %{public}@ with unique identifier: %{public}@ failed to extract predicate with payload calendar iden tifier: %{public}@, payload notifications times: %{public}@, payload start day: %{public}@, payload start time: %{pu blic}@, payload end day: %{public}@, payload end time: %{public}@",  (uint8_t *)&v14,  0x52u);
}

void sub_100060550(void *a1)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateType]);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  sub_100009D10();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_100060608(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateType]);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  sub_100009D20();
  sub_100009D10();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

void sub_1000606C0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateType]);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  os_log_type_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 endDate]);
  sub_100009D20();
  sub_100009D10();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x2Au);
}

void sub_10006079C()
{
}

void sub_1000607FC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not write app management plist, unknown error",  v1,  2u);
}

void sub_10006083C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000608A0(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_100013910();
  sub_1000138E4( (void *)&_mh_execute_header,  v1,  v2,  "Could not set removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@",  (void)v3,  DWORD2(v3));
  sub_100013920();
}

void sub_10006090C(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  sub_100013910();
  sub_1000138E4( (void *)&_mh_execute_header,  v1,  v2,  "Could not get removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@",  (void)v3,  DWORD2(v3));
  sub_100013920();
}

void sub_100060978()
{
}

void sub_1000609D8()
{
}

void sub_100060A38()
{
}

void sub_100060A98()
{
}

void sub_100060AF8()
{
}

void sub_100060B58()
{
}

void sub_100060BB8()
{
}

void sub_100060C18()
{
}

void sub_100060C78()
{
}

void sub_100060CD8()
{
}

void sub_100060D38()
{
}

void sub_100060D98()
{
}

void sub_100060DF8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100060E60()
{
}

void sub_100060EC4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100060F2C()
{
  uint64_t v3 = v0;
  sub_100017A8C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Could not acquire sandbox extension for app %{public}@ to read feedback. Attempting to read anyway. Error: %llu",  v2);
  sub_100013920();
}

void sub_100060F98()
{
}

void sub_100060FFC()
{
  uint64_t v4 = v0;
  sub_100017A8C( (void *)&_mh_execute_header,  v1,  v2,  "Could not acquire sandbox extension for app %{public}@ to write feedback. Attempting to write anyway. Error: %llu",  v3);
  sub_100013920();
}

void sub_100061068( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000610CC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Update foreground bundle identifiers: %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_100013920();
}

void sub_10006113C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "DMF could not restart app: %{public}@ with error: %{public}@",  (uint8_t *)&v4,  0x16u);
}

void sub_1000611C4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not initialize app lifecycle because no LSApplicationRecord for bundle identifier %{public}@, error: %{public}@",  (uint8_t *)&v3,  0x16u);
}

void sub_100061248(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "App requests must have only one of bundle identifier, store item identifier, or manifest URL",  v1,  2u);
}

void sub_100061288()
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize configuration payload for asset: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061318()
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize install operation for asset payload: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_1000613A8()
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  uint64_t v4 = (objc_class *)objc_opt_class(v1);
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDOperationProvidingAsset);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = 138543874;
  uint8_t v10 = v3;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  int v14 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%{public}@: Asset class (%{public}@) does not implement %{public}@",  (uint8_t *)&v9,  0x20u);
}

void sub_100061488()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Asset install operation failed: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061518()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize remove operation for installed asset payload: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_1000615A8()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to remove asset: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061638()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DMFBeginTransactionRequest is deprecated please use DMDActivityTransactionOperation instead",  v0,  2u);
}

void sub_10006167C()
{
  id v2 = [(id)sub_100020D24() verboseDescription];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize configuration payload for command: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061708()
{
  id v2 = [(id)sub_100020D24() verboseDescription];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to create request for command execution: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061794()
{
  id v2 = (objc_class *)objc_opt_class(v1);
  int v3 = NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue(v3);
  id v4 = [(id)sub_100020D24() identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v6,  v7,  "%{public}@: Failed to create operation from request for command execution: %{public}@",  v8,  v9,  v10,  v11,  v12);

  sub_10001F93C();
}

void sub_100061824()
{
  uint64_t v3 = sub_100020D24();
  id v4 = (objc_class *)objc_opt_class(v3);
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingCommand);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = 138543874;
  uint64_t v10 = v1;
  __int16 v11 = 2114;
  uint8_t v12 = v6;
  __int16 v13 = 2114;
  int v14 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%{public}@: %{public}@ does not conform to %{public}@",  (uint8_t *)&v9,  0x20u);
}

void sub_100061900()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Execute command failed: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100061990(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to initialize command payload for command removal %{public}@: %{public}@",  (uint8_t *)&v7,  0x16u);
}

void sub_100061A50(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Command did remove successfully %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_100061AE4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_100027AF0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to send %lu events from subscription manager",  (uint8_t *)&v4);
  sub_100013920();
}

void sub_100061B50(uint64_t a1)
{
  id v1 = [(id)sub_100027AFC(a1) verboseDescription];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Failed to clear failed state for existing declarations: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100061BC8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "process status operation failed with error: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100061C40(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) subscriptionDeclaration];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Failed to fetch payload metadata corresponding to %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100061CB8(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) subscriptionDeclaration];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Failed to save subscription to database %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100061D30(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) subscriptionDeclaration];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Failed to fetch registration corresponding to %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100061DA8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to delete subscription from database %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100061E20(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Could not fetch organizations from database: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100061E98(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_100027AF0( (void *)&_mh_execute_header,  a2,  a3,  "Could not find organization with identifier: %{public}@",  (uint8_t *)&v4);
  sub_100013920();
}

void sub_100061F04(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Failed to save event in database: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100061F7C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Engine will suspend due to error: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100061FF4(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) error];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Database processing operation failed with error: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_10006206C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to load organizations from database: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000620E8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to update subscription registrations: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100062160(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to load organizations from database: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000621D8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to fetch declarations while scrubbing policy orphans %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100062250(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_FAULT,  "Declaration %{public}@ does not belong to an organization",  a1,  0xCu);
}

void sub_1000622C4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to load organizations from database while scrubbing policy orphans: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_10006233C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 componentsJoinedByString:@","]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Found policies orphaned from any known organization. Removed identifiers %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000623BC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 componentsJoinedByString:@","]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Found policies orphaned from any known declarations. Removed identifiers %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_10006243C(uint64_t a1)
{
  id v1 = [(id)sub_100027AFC(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "failed to fetch declarations pending status update %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_1000624B4()
{
}

void sub_100062518(uint64_t a1)
{
  id v1 = [(id)sub_100027AFC(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "failed to fetch declarations to update their lastStatusUpdateTimestamp %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100062590(uint64_t a1)
{
  id v1 = [(id)sub_100027AFC(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "failed to save last updated timestamp in database %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100062608(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "declaration update operation failed with error: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100062680(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "status update operation failed with error: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000626F8(uint64_t a1, void *a2, os_log_s *a3)
{
  id v5 = [(id)sub_100027B10(a1) organizationIdentifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  int v8 = 138543618;
  uint8_t v9 = v6;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to fetch queued events for organization '%{public}@': %{public}@",  (uint8_t *)&v8,  0x16u);
}

void sub_1000627B8()
{
}

void sub_10006281C()
{
}

void sub_100062880()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize configuration payload for configuration install: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062910()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to create request for configuration install: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_1000629A0()
{
  uint64_t v2 = (objc_class *)sub_100028528();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@: Failed to create operation from request for configuration install for %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_100062A2C()
{
  uint64_t v3 = (objc_class *)sub_100028528();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDRequestProvidingConfiguration);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = 138543874;
  uint64_t v9 = v1;
  __int16 v10 = 2114;
  uint8_t v11 = v5;
  __int16 v12 = 2114;
  __int16 v13 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%{public}@: %{public}@ does not conform to %{public}@",  (uint8_t *)&v8,  0x20u);
}

void sub_100062B04()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Configuration failed install: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062B94(void *a1, const char *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 delegate]);
  uint64_t v4 = NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10001F924();
  sub_10001F910((void *)&_mh_execute_header, v6, v7, "%{public}@ does not respond to %{public}@", v8, v9, v10, v11, v12);

  sub_10001F93C();
}

void sub_100062C28()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize configuration payload for configuration remove: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062CB8()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to create request for installed configuration remove: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062D48()
{
  id v2 = (objc_class *)sub_100028528();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@: Failed to create operation from request for installed configuration removal: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_100062DD4()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Configuration failed remove: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062E64()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to initialize configuration payload for configuration replace: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062EF4()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Failed to create request for configuration replace: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100062F84()
{
  id v2 = (objc_class *)sub_100028528();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@: Failed to create configuration replace operation for request: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_100063010()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*v0 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@: Configuration failed replace: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_1000630A0(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10002B45C();
  sub_10002B47C( (void *)&_mh_execute_header,  v7,  v8,  "%{public}@ failed to initate connection to resolve asset %{public}@: %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_10002B490();
}

void sub_100063150(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10002B45C();
  sub_10002B47C( (void *)&_mh_execute_header,  v7,  v8,  "%{public}@ failed to resolve asset %{public}@: %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_10002B490();
}

void sub_100063200(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_10002BF90((void *)&_mh_execute_header, v2, v3, "Reporting status to %{public}@", v4, v5, v6, v7, 2u);

  sub_100002C2C();
}

void sub_10006327C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_10002BF90((void *)&_mh_execute_header, v2, v3, "Reporting events to %{public}@", v4, v5, v6, v7, 2u);

  sub_100002C2C();
}

void sub_1000632F8(os_log_s *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DMDConfigurationSourceControllerDelegate);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "delegate does not conform to %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_100063394(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to fetch events %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_10006342C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to send events remote proxy could not be created: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_1000634C4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to send events: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_10006355C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to fetch status update %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_1000635F4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to send status updates remote proxy coun't be created: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_10006368C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F924();
  sub_10001F910( (void *)&_mh_execute_header,  v5,  v6,  "%{public}@ failed to send status updates: %{public}@",  v7,  v8,  v9,  v10,  v11);

  sub_10001F93C();
}

void sub_100063724(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failing establishing anonymous connection with error: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100063798(uint64_t a1, os_log_s *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) machServiceName]);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failing establishing connection to named service %{public}@ with error: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_10006384C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Unexpected use of excludedIdentifiers",  v1,  2u);
}

void sub_10006388C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = @"com.apple.private.dmd.emergency-mode";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Client %{public}@ does not have required %{public}@ entitlement",  (uint8_t *)&v2,  0x16u);
}

void sub_100063914()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DMFEndTransactionRequest is deprecated please use DMDActivityTransactionOperation instead",  v0,  2u);
}

void sub_100063958(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 organizationIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "failed to fetch existing organizations with identifier “%{public}@”: %{public}@",  v6,  v7,  v8,  v9,  2u);

  sub_10001F93C();
}

void sub_1000639FC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "organization of type %{public}@ already exists",  (uint8_t *)&v2,  0xCu);
}

void sub_100063A70(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_10001F910( (void *)&_mh_execute_header,  v2,  v3,  "failed to fetch organizations of type “%{public}@”: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001F93C();
}

void sub_100063B04(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);

  sub_100002C2C();
}

void sub_100063B80(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) verboseDescription]);
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "failed to load persistent stores: %{public}@", v4, v5, v6, v7, 2u);

  sub_100002C2C();
}

void sub_100063C00(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "failed to remove legacy database: %{public}@",  a1,  0xCu);
}

void sub_100063C74(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Could not set persistent store backup flag %{public}@: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100063D24(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "successfully loaded persistent store: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100063D98(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "checking database for deprecated class",  v1,  2u);
}

void sub_100063DD8()
{
  id v2 = objc_msgSend((id)sub_10003595C(v0, v1), "verboseDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100035930();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@ failed to fetch configuration organizations: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100063E54(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Processing operation failed to commit changes: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100063ECC()
{
  id v2 = objc_msgSend((id)sub_10003595C(v0, v1), "verboseDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100035930();
  sub_10001F910((void *)&_mh_execute_header, v4, v5, "%{public}@ preprocessing failed: %{public}@", v6, v7, v8, v9, v10);

  sub_10001F93C();
}

void sub_100063F48(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to preproccess database while fetching all payloads: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100063FC0()
{
  id v3 = objc_msgSend((id)sub_10003595C(v1, v2), "verboseDescription");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100035930();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%{public}@ failed to fetch configurations: %{public}@",  v5,  0x16u);

  sub_10001F93C();
}

void sub_10006404C()
{
}

void sub_1000640BC()
{
  id v2 = objc_msgSend((id)sub_10003595C(v0, v1), "verboseDescription");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100035930();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "%{public}@ failed to write restrictions: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100064138(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch commands to execute %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_1000641B0(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch commands to remove %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_100064228(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch commands to delete %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_1000642A0()
{
}

void sub_1000642CC()
{
}

void sub_1000642F8()
{
}

void sub_100064324()
{
}

void sub_100064350()
{
}

void sub_10006437C(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v3, v4, "Failed to process activations: %{public}@", v5, v6, v7, v8, v9);

  sub_100002C2C();
}

void sub_1000643F4(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch declarations pending removal %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_10006446C(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch declarations pending install %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_1000644E4(uint64_t a1)
{
  id v1 = [(id)sub_100027B10(a1) verboseDescription];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v3,  v4,  "Processing: Failed to fetch declarations pending delete %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100002C2C();
}

void sub_10006455C()
{
}

void sub_100064588()
{
}

void sub_1000645B4()
{
}

void sub_1000645E0()
{
}

void sub_10006460C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 organizationIdentifier]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch payload metadata for organization %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_1000646A0(void *a1, void *a2, os_log_s *a3)
{
  id v5 = [a1 count];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 organizationIdentifier]);
  int v7 = 134218242;
  id v8 = v5;
  __int16 v9 = 2114;
  uint8_t v10 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Refreshed %lu status items for organization %{public}@",  (uint8_t *)&v7,  0x16u);
}

void sub_100064758(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to fetch existing declarations: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002C2C();
}

void sub_1000647D4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to initialize declarations: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002C2C();
}

void sub_100064850(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, 2u);

  sub_100002C2C();
}

void sub_1000648CC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100027AF0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to instantiate payload metadata from payload dictionary: %{public}@",  (uint8_t *)&v3);
}

void sub_100064938(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_100027AF0((void *)&_mh_execute_header, a2, v4, "Failed to save changes: %{public}@", (uint8_t *)&v5);
}

void sub_1000649C4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Failed to save changes: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100064A3C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to fetch existing declarations for update: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100064AB4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to initialize declarations for update: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100064B2C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Failed to fetch existing declarations for removal: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100064BA4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown event stream frequency %{public}@, defaulting to Daily",  (uint8_t *)&v2,  0xCu);
}

void sub_100064C18(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "fetch-os-update-status end with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100064C8C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Could not serialize profile: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100064D04(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Could not retrieve restrictions dictionary from payload: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100064D7C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Could not process restriction heuristics for payload: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100064DF4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Could not apply restrictions: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100064E6C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064ED4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064F3C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected type of data stored in LastCloudBackupDate. Ignoring.",  v0,  2u);
}

void sub_100064F80(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to set device name with error %d",  (uint8_t *)v1,  8u);
}

void sub_100064FFC(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error excluding %{public}@ from backup. Path does not exist.",  (uint8_t *)&v1,  0xCu);
}

void sub_100065078(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error excluding %{public}@ from backup %{public}@",  (uint8_t *)&v4,  0x16u);
}

void sub_10006511C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 metadata]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  sub_100002C48();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failing install app request because we are already prompting the user about bundle identifier: %{public}@",  v5,  0xCu);

  sub_10001F93C();
}

void sub_1000651B8()
{
  id v1 = [(id)sub_100045354(v0) metadata];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  sub_10004533C();
  sub_10001F910( (void *)&_mh_execute_header,  v4,  v5,  "Error associating app with persona: %{public}@, %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10001F93C();
}

void sub_100065244( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000652AC()
{
  id v1 = [(id)sub_100045354(v0) removable];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10004533C();
  sub_10001F910( (void *)&_mh_execute_header,  v3,  v4,  "Error attempting to set removability to %{public}@ Error: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_10001F93C();
}

void sub_100065328()
{
  id v1 = [(id)sub_100045354(v0) tapToPayScreenLock];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10004533C();
  sub_10001F910( (void *)&_mh_execute_header,  v3,  v4,  "Error attempting to set tap to pay screen lock to %{public}@ Error: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_10001F93C();
}

void sub_1000653A4()
{
}

void sub_100065404()
{
}

void sub_100065464(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Show user installation failure prompt",  v1,  2u);
}

void sub_1000654A4()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  v0));
  sub_10004533C();
  sub_10001F910( (void *)&_mh_execute_header,  v2,  v3,  "Could not mark app state as %{public}@ for bundle identifier: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_10001F93C();
}

void sub_10006552C(uint64_t a1)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  sub_100013910();
  sub_100017A8C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Could not update management info for bundle identifier: %{public}@, error: %{public}@",  (uint8_t *)&v2);
  sub_100013920();
}

void sub_10006559C()
{
}

void sub_1000655FC()
{
}

void sub_10006565C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v1;
  sub_100013910();
  sub_100017A8C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Error attempting to set removability to %{public}@ Error: %{public}@",  (uint8_t *)&v3);
  sub_100013920();
}

void sub_1000656D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v1;
  sub_100013910();
  sub_100017A8C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Error attempting to set tapToPayControlLock to %{public}@ Error: %{public}@",  (uint8_t *)&v3);
  sub_100013920();
}

void sub_100065744( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000657AC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  a1));
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  sub_100017A8C( (void *)&_mh_execute_header,  a3,  v6,  "Could not mark app state as %{public}@ for bundle identifier: %{public}@",  (uint8_t *)&v7);
}

void sub_10006585C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000658C0()
{
}

void sub_10006592C()
{
}

void sub_100065998( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000659D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065A58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065A90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065B0C(uint64_t a1, uint64_t a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "System group container for %{public}@ path is %{public}s",  (uint8_t *)&v2,  0x16u);
  sub_100013920();
}

void sub_100065B90(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  __int16 v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to fetch organization matching identifier (%{public}@): %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100065C40(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Payload has invalid type prefix (%{public}@) defaulting to generic payload metadata",  (uint8_t *)&v2,  0xCu);
}

void sub_100065CB4(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_100050A74();
  sub_10001F910( (void *)&_mh_execute_header,  v3,  v4,  "Could not set persistent store backup flag %{public}@: %{public}@",  v5,  v6,  v7,  v8,  2u);

  sub_10001F93C();
}

void sub_100065D40()
{
}

void sub_100065DA4()
{
}

void sub_100065DD0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Error fetching existing policy registration: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100065E48(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_100050A74();
  sub_10001F910( (void *)&_mh_execute_header,  v3,  v4,  "Error saving policy registration %{public}@: %{public}@",  v5,  v6,  v7,  v8,  2u);

  sub_10001F93C();
}

void sub_100065ED4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Error loading persistent store: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100065F4C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error recalculating effectivePolicy for type %{public}@: %{public}@",  buf,  0x16u);
}

void sub_100065FB0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Error fetching existing policy by type: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_100066028()
{
}

void sub_10006608C()
{
}

void sub_1000660F0(uint8_t *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = DMFPolicyUnlocalizedDisplayName(0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  *(_DWORD *)a1 = 138543362;
  *a2 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Requested website URL does not have a host, marking policy %{public}@",  a1,  0xCu);
}

void sub_100066164()
{
}

void sub_100066190(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Error fetching existing policies: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100066208(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18((void *)&_mh_execute_header, v2, v3, "Error saving policies: %{public}@", v4, v5, v6, v7, v8);

  sub_100002C2C();
}

void sub_100066280(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Error fetching orphanied policies: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000662F8(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 verboseDescription]);
  sub_100050A74();
  sub_10001F910( (void *)&_mh_execute_header,  v3,  v4,  "Error recalculating effectivePolicy for types %{public}@: %{public}@",  v5,  v6,  v7,  v8,  2u);

  sub_10001F93C();
}

void sub_100066384(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  sub_100002C48();
  sub_100002C18( (void *)&_mh_execute_header,  v2,  v3,  "Error fetching registrations to notify: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100002C2C();
}

void sub_1000663FC()
{
}

void sub_100066460()
{
}

void sub_1000664C4()
{
}

void sub_1000664FC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Client %@ does not have required com.apple.private.dmd.policy entitlement",  (uint8_t *)&v2,  0xCu);
}

void sub_100066570(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "unable to register configuration source because client doesn't have a valid entitlement for application-identifier",  v1,  2u);
}

void sub_1000665B0()
{
}

void sub_10006661C()
{
}

void sub_100066688()
{
}

void sub_1000666F0()
{
}

void sub_100066758()
{
}

void sub_1000667C0()
{
}

void sub_100066828()
{
}

void sub_100066890()
{
}

void sub_1000668F8()
{
}

void sub_100066960()
{
}

void sub_1000669C8()
{
}

void sub_100066A30()
{
}

void sub_100066A98()
{
}

void sub_100066B00()
{
}

void sub_100066B68(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 verboseDescription]);
  int v4 = 138543362;
  uint8_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not remove restrictions: %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_100066BFC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "remove-os-update end with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100066C70()
{
}

void sub_100066CD4()
{
}

void sub_100066D38()
{
}

void sub_100066D9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 40LL);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "could not get current software update status: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100066E20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100035920( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "remove software update failed: no error returned",  a5,  a6,  a7,  a8,  0);
}

void sub_100066E58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 40LL);
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "remove software update failed: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100066EDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066F14(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Operation did finish: %{public}@",  (uint8_t *)&v1,  0xCu);
}

void sub_100066F90(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) removable]);
  sub_10004533C();
  sub_100017A8C( (void *)&_mh_execute_header,  a3,  v5,  "Error attempting to set removability to %{public}@ Error: %{public}@",  v6);

  sub_10001F93C();
}

void sub_10006701C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tapToPayScreenLock]);
  sub_10004533C();
  sub_100017A8C( (void *)&_mh_execute_header,  a3,  v5,  "Error attempting to set tapToPayScreenLock to %{public}@ Error:%{public}@",  v6);

  sub_10001F93C();
}

void sub_1000670A8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Show user update failure prompt", v1, 2u);
}

void sub_1000670E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[DMFAppManagementInformation stringForState:]( &OBJC_CLASS___DMFAppManagementInformation,  "stringForState:",  a1));
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  sub_100017A8C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v4,  "Could not mark app state as %{public}@ for bundle identifier: %{public}@",  (uint8_t *)&v5);
}

void sub_100067190()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not get notification ref for user notification.",  v0,  2u);
}

void sub_1000671D4(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not get run loop source for user notification: %{public}@",  (uint8_t *)&v1,  0xCu);
}

void sub_100067250( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100067288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000672C0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "$HOME not set, falling back to using getpwuid",  v0,  2u);
}

id objc_msgSend__appendPolicyForBundleIdentifiers_toPolicies_categories_parentBundleIdentifiers_policiesByType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_appendPolicyForBundleIdentifiers:toPolicies:categories:parentBundleIdentifiers:policiesByType:");
}

id objc_msgSend__getMetadataForBundleIdentifier_storeItemIdentifier_personaIdentifier_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMetadataForBundleIdentifier:storeItemIdentifier:personaIdentifier:completion:");
}

id objc_msgSend__promptIfPermittedByPolicyToManageApp_appDisplayName_originator_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptIfPermittedByPolicyToManageApp:appDisplayName:originator:completion:");
}

id objc_msgSend__removeOrphanedPoliciesFromFetchRequest_managedObjectContext_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOrphanedPoliciesFromFetchRequest:managedObjectContext:completionHandler:");
}

id objc_msgSend__upsertPolicy_forType_identifier_priority_organizationIdentifier_declarationIdentifier_policyToUpdate_managedObjectContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_upsertPolicy:forType:identifier:priority:organizationIdentifier:declarationIdentifier:policyToUpdate:managedObjectContext:");
}

id objc_msgSend_activationPredicateObserverManager_didObserveChangeForPredicateWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationPredicateObserverManager:didObserveChangeForPredicateWithIdentifier:");
}

id objc_msgSend_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestri ctionChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_engineProcessingOperation_enqueuedOperationsForOrganizationWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineProcessingOperation:enqueuedOperationsForOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForActiveDeclarationFromOrganizationWithIdentifier_withIdentifier_serverHash_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:withIdentifier:serverHash:");
}

id objc_msgSend_fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier_withIdentifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:");
}

id objc_msgSend_fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier_payloadIdentifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestForDeclarationsFromOrganizationWithIdentifier_matchingPredicate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:");
}

id objc_msgSend_fetchRequestForDeclarationsFromOrganizationWithIdentifier_withIdentifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:withIdentifiers:");
}

id objc_msgSend_fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier_matchingPredicate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:");
}

id objc_msgSend_fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:");
}

id objc_msgSend_fetchRequestMatchingRegistrationFromOrganizationWithIdentifier_payloadIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:payloadIdentifier:");
}

id objc_msgSend_filterRestrictionDictionary_toIncludeOnlyRestrictionsThatDifferFromRestrictions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:");
}

id objc_msgSend_handleConfigurationSourceRegistrationRequest_clientIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConfigurationSourceRegistrationRequest:clientIdentifier:completionHandler:");
}

id objc_msgSend_initWithItemIdentifer_externalVersionIdentifier_bundleIdentifier_bundleVersion_skipDownloads_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:");
}

id objc_msgSend_initWithProductKey_humanReadableName_productName_version_build_downloadSize_installSize_isCritical_restartRequired_allowsInstallLater_isSplat_supplementalBuild_supplementalVersionExtra_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartReq uired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:");
}

id objc_msgSend_initWithSupportsBlockLevelEncryption_supportsFileLevelEncryption_passcodeIsSet_passcodeIsCompliantWithGlobalRestrictions_passcodeIsCompliantWithProfileRestrictions_passcodeLockGracePeriodEnforced_passcodeLockGracePeriod_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalR estrictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:");
}

id objc_msgSend_initWithType_defaultPolicy_currentPoliciesByIdentifier_defaultPriority_prioritiesByIdentifier_excludedIdentifiers_downtimeEnforced_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithType:defaultPolicy:currentPoliciesByIdentifier:defaultPriority:prioritiesByIdentifier:excludedIdentif iers:downtimeEnforced:");
}

id objc_msgSend_initWithType_identifier_payloadVersion_displayName_organization_payloadDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:identifier:payloadVersion:displayName:organization:payloadDescription:");
}

id objc_msgSend_initWithUUID_type_identifier_profileVersion_displayName_organization_profileDescription_isManaged_isLocked_hasRemovalPasscode_isEncrypted_signerCertificates_payloads_restrictions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:ha sRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:");
}

id objc_msgSend_prioritizedPoliciesForAppPolicy_appCategoryPolicy_bundleIdentifiers_categoryPolicy_categoryIdentifiers_webPolicy_webCategoryPolicy_webDomains_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "prioritizedPoliciesForAppPolicy:appCategoryPolicy:bundleIdentifiers:categoryPolicy:categoryIdentifiers:webPol icy:webCategoryPolicy:webDomains:");
}

id objc_msgSend_processCommandPayloadsInContext_forOrganization_enqueuedOperations_assetResolver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:");
}

id objc_msgSend_processDeclarationPayloadsInContext_forOrganization_enqueuedOperations_assetResolver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:");
}

id objc_msgSend_registerConfigurationSourceOperation_didUpdateRegistrationForConfigurationSource_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerConfigurationSourceOperation:didUpdateRegistrationForConfigurationSource:");
}

id objc_msgSend_removeEffectivePolicyFromOrganizationIdentifier_declarationIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEffectivePolicyFromOrganizationIdentifier:declarationIdentifier:completionHandler:");
}

id objc_msgSend_removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:completionHandler:");
}

id objc_msgSend_removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:completionHandler:");
}

id objc_msgSend_restrictionsAfterApplyingRestrictionsDictionary_toRestrictionsDictionary_outChangeDetected_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:");
}

id objc_msgSend_sendAppRequestWithBundleIdentifier_storeItemIdentifier_personaIdentifier_type_skipDownloads_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAppRequestWithBundleIdentifier:storeItemIdentifier:personaIdentifier:type:skipDownloads:completion:");
}

id objc_msgSend_setEffectivePolicy_forType_identifiers_priority_organizationIdentifier_declarationIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setEffectivePolicy:forType:identifiers:priority:organizationIdentifier:declarationIdentifier:completionHandler:");
}

id objc_msgSend_setVPNUUIDString_cellularSliceUUIDString_contentFilterUUIDString_DNSProxyUUIDString_relayUUIDString_associatedDomains_enableDirectDownloads_allowUserToHide_allowUserToLock_configuration_options_sourceIdentifier_forBundleIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associate dDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:");
}

id objc_msgSend_startAirPlaySessionWithDestinationName_destinationDeviceID_password_scanWaitTime_sessionType_force_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startAirPlaySessionWithDestinationName:destinationDeviceID:password:scanWaitTime:sessionType:force:error:");
}

id objc_msgSend_updateBundleIDPersonaIDMappingForPersonaID_addingBundleID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}