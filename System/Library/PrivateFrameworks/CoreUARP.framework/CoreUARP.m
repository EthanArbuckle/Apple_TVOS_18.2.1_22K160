LABEL_22:
LABEL_23:
  return v25;
}

LABEL_11:
  return v6;
}

  return v12;
}

  return 0LL;
}

  return v6;
}

  return v6;
}

  powerLogManager = self->_powerLogManager;
  [v4 getID];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager setAccessoryIDReachable:](powerLogManager, "setAccessoryIDReachable:", v13);

  v14 = 1;
LABEL_13:

  return v14;
}

  return v6;
}

  return v6;
}

  return v5;
}

  return v6;
}

  return v6;
}

LABEL_18:
  }

  return v19;
}

    v8 = v42;
    v7 = v43;
  }
}
}

LABEL_13:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          self->_life = [v8 life];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          self->_provisioning = [v8 provisioning] != 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          self->_manifestEpoch = [v8 manifestEpoch];
        }
        ++v7;
      }

      while (v5 != v7);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      v5 = v13;
    }

    while (v13);
  }
}

LABEL_21:
    if (self->_url)
    {
      v39 = v17;
      v29 = -[UARPSuperBinaryAssetPayload compressPayloadURLToFileHandle:error:]( self,  "compressPayloadURLToFileHandle:error:",  v16,  &v39);
      v25 = v39;

      if (!v29)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData].cold.4();
        }
LABEL_32:
        v34 = *p_compressedPayloadURL;
        *p_compressedPayloadURL = 0LL;
      }
    }

    else
    {
      payload = self->_payload;
      if (!payload)
      {
        metaData = self->_metaData;
        if ((!metaData || !-[NSMutableData length](metaData, "length"))
          && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          -[UARPSuperBinaryAssetPayload prepareData].cold.2();
        }

        v25 = v17;
        goto LABEL_38;
      }

      v38 = 0LL;
      v33 = [v16 uarpWriteData:payload error:&v38];
      v25 = v38;

      if ((v33 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData].cold.3();
        }
        goto LABEL_32;
      }
    }

void sub_187DC64E4(_Unwind_Exception *a1)
{
}

void sub_187DC6544(_Unwind_Exception *a1)
{
}

void sub_187DC6A98(_Unwind_Exception *a1)
{
}

void sub_187DC9F98(_Unwind_Exception *a1)
{
}

LABEL_12:
    if (v10 == ++v11) {
      goto LABEL_57;
    }
  }

  if (v18 > 3291140095LL)
  {
    if (v18 <= 3436347647LL)
    {
      if (v18 == 3291140096LL || v18 == 3291140105LL)
      {
LABEL_42:
        -[UARPSuperBinaryMetaDataTable addTLV:keyValue32:tlvArray:](self, "addTLV:keyValue32:tlvArray:", v18, v39, v38);
        goto LABEL_56;
      }

      if (v18 == 3291140106LL)
      {
        -[UARPSuperBinaryMetaDataTable addTLVs:excludedHwRevisions:tlvArray:]( self,  "addTLVs:excludedHwRevisions:tlvArray:",  3291140106LL,  v39,  v38);
        goto LABEL_56;
      }
    }

    else
    {
      switch(v18)
      {
        case 3436347648LL:
          v24 = self;
          v25 = 3436347648LL;
          v26 = 0LL;
          goto LABEL_55;
        case 3436347649LL:
          v25 = 3436347649LL;
          v24 = self;
          v26 = 1LL;
          goto LABEL_55;
        case 3436347650LL:
          v25 = 3436347650LL;
          v24 = self;
          v26 = 2LL;
          goto LABEL_55;
        case 3436347651LL:
          v25 = 3436347651LL;
          v24 = self;
          v26 = 3LL;
          goto LABEL_55;
        case 3436347652LL:
          v25 = 3436347652LL;
          v24 = self;
          v26 = 4LL;
          goto LABEL_55;
        case 3436347653LL:
          v25 = 3436347653LL;
          v24 = self;
          v26 = 5LL;
          goto LABEL_55;
        case 3436347654LL:
          v25 = 3436347654LL;
          v24 = self;
          v26 = 6LL;
          goto LABEL_55;
        case 3436347655LL:
          v25 = 3436347655LL;
          v24 = self;
          v26 = 7LL;
LABEL_55:
          -[UARPSuperBinaryMetaDataTable addTLV:legacyTLV:keyValue:tlvArray:payloadsURL:isFilepath:]( v24,  "addTLV:legacyTLV:keyValue:tlvArray:payloadsURL:isFilepath:",  v25,  v26,  v39,  v38,  v36,  v17);
          goto LABEL_56;
        case 3436347656LL:
        case 3436347657LL:
        case 3436347658LL:
        case 3436347665LL:
        case 3436347667LL:
        case 3436347668LL:
        case 3436347669LL:
        case 3436347672LL:
          break;
        case 3436347659LL:
        case 3436347661LL:
        case 3436347662LL:
        case 3436347664LL:
        case 3436347666LL:
        case 3436347671LL:
          goto LABEL_29;
        case 3436347660LL:
          -[UARPSuperBinaryMetaDataTable addTLVCompressPayloadAlgorithm:tlvArray:]( self,  "addTLVCompressPayloadAlgorithm:tlvArray:",  v39,  v38);
          goto LABEL_56;
        case 3436347663LL:
        case 3436347673LL:
          goto LABEL_42;
        case 3436347670LL:
          goto LABEL_56;
        case 3436347674LL:
          goto LABEL_17;
        default:
          if (v18 == 4042160641LL)
          {
LABEL_43:
            v28 = self;
            v29 = v18;
            v31 = v38;
            v30 = v39;
            v32 = v36;
            v33 = 0LL;
            goto LABEL_45;
          }

          if (v18 == 4042160643LL)
          {
LABEL_17:
            -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:]( self,  "addTLV:keyValue8:tlvArray:",  v18,  v39,  v38);
            goto LABEL_56;
          }

          break;
      }
    }
  }

  else
  {
    if (v18 > 2293403930LL)
    {
      switch(v18)
      {
        case 2293403931LL:
          -[UARPSuperBinaryMetaDataTable addTLV:keyValue64:tlvArray:]( self,  "addTLV:keyValue64:tlvArray:",  2293403931LL,  v39,  v38);
          break;
        case 2293403932LL:
          -[UARPSuperBinaryMetaDataTable composeMatchingPayloads:tlvArray:]( self,  "composeMatchingPayloads:tlvArray:",  v39,  v38);
          break;
        case 2293403933LL:
        case 2293403934LL:
        case 2293403935LL:
        case 2293403936LL:
        case 2293403939LL:
        case 2293403940LL:
        case 2293403943LL:
        case 2293403945LL:
        case 2293403946LL:
        case 2293403947LL:
        case 2293403948LL:
        case 2293403949LL:
        case 2293403950LL:
        case 2293403951LL:
        case 2293403952LL:
          goto LABEL_44;
        case 2293403937LL:
        case 2293403938LL:
        case 2293403942LL:
        case 2293403944LL:
        case 2293403953LL:
        case 2293403954LL:
        case 2293403955LL:
          goto LABEL_17;
        case 2293403941LL:
          goto LABEL_42;
        default:
          switch(v18)
          {
            case 3166200576LL:
            case 3166200579LL:
              UARPPayloadHashAlgorithmStringToValue(v39);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[UARPSuperBinaryMetaDataTable addTLV:keyValue16:tlvArray:]( self,  "addTLV:keyValue16:tlvArray:",  v18,  v27,  v38);

              break;
            case 3166200577LL:
            case 3166200578LL:
              -[UARPSuperBinaryMetaDataTable composeMeasuredPayloads:tlvType:tlvArray:payloadsURL:]( self,  "composeMeasuredPayloads:tlvType:tlvArray:payloadsURL:",  v39,  v18,  v38,  v36);
              break;
            case 3166200580LL:
              -[UARPSuperBinaryMetaDataTable composeRequiredPersonalizationOptions:tlvArray:]( self,  "composeRequiredPersonalizationOptions:tlvArray:",  v39,  v38);
              break;
            case 3166200581LL:
            case 3166200582LL:
              v28 = self;
              v29 = v18;
              v31 = v38;
              v30 = v39;
              v32 = v36;
              v33 = 1LL;
              goto LABEL_45;
            case 3166200583LL:
              goto LABEL_17;
            default:
              goto LABEL_44;
          }

          break;
      }

      goto LABEL_56;
    }

    if (v18 > 538280447)
    {
      switch(v18)
      {
        case 1619725824LL:
        case 1619725827LL:
        case 1619725832LL:
          goto LABEL_29;
        case 1619725825LL:
        case 1619725826LL:
        case 1619725828LL:
        case 1619725829LL:
        case 1619725830LL:
          goto LABEL_44;
        case 1619725831LL:
          goto LABEL_34;
        default:
          if (v18 == 538280448) {
            goto LABEL_43;
          }
          if (v18 == 538280449) {
            goto LABEL_42;
          }
          goto LABEL_44;
      }
    }

    if (v18 == 76079616 || v18 == 76079619)
    {
LABEL_29:
      -[UARPSuperBinaryMetaDataTable addTLV:keyValue16:tlvArray:](self, "addTLV:keyValue16:tlvArray:", v18, v39, v38);
      goto LABEL_56;
    }

    if (v18 == 76079623)
    {
LABEL_34:
      -[UARPSuperBinaryMetaDataTable addTLV:versionString:tlvArray:]( self,  "addTLV:versionString:tlvArray:",  v18,  v39,  v38);
      goto LABEL_56;
    }
  }

  return v9;
}

  return v4;
}

LABEL_13:
}

  if (v3)
  {
    [v4 setObject:v2->_productGroup forKeyedSubscript:@"ProductGroup"];
    v13 = kUARPSupportedAccessoryKeyProductNumber;
    v14 = 16LL;
  }

  else
  {
    v13 = kUARPSupportedAccessoryKeyAppleModelNumber;
    v14 = 14LL;
  }

  [v4 setObject:(&v2->super.isa)[v14] forKeyedSubscript:*v13];
  modelName = v2->_modelName;
  if (modelName) {
    [v4 setObject:modelName forKeyedSubscript:@"ModelName"];
  }
  vendorName = (const __CFString *)v2->_vendorName;
  if (!vendorName) {
    vendorName = @"Apple Inc.";
  }
  [v4 setObject:vendorName forKeyedSubscript:@"VendorName"];
  if ((v2->_capabilities & 1) != 0) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"isPowerSource"];
  }
  if (v2->_supportsPowerLogging) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsPowerlog"];
  }
  if (v2->_supportsHeySiriCompact) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsHeySiriCompact"];
  }
  supportsVoiceAssist = v2->_supportsVoiceAssist;
  if (v2->_supportsVoiceAssist)
  {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsVoiceAssist"];
    v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v18 addObject:@"VoiceAssist"];
    [v4 setObject:v18 forKeyedSubscript:@"SupplementalAssets"];

    supportsVoiceAssist = v2->_supportsVoiceAssist;
  }

  if (supportsVoiceAssist || v2->_supportsHeySiriCompact)
  {
    v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v19 addObject:@"com.apple.corespeech.voicetriggerassetchange"];
    [v4 setObject:v19 forKeyedSubscript:@"BSDNotifications"];
  }

  if (v2->_reofferFirmwareOnSync) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"ReofferFirmwareOnSync"];
  }
  if (v2->_supportsLogs) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsLogs"];
  }
  if (v2->_supportsAnalytics) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsAnalytics"];
  }
  if (v2->_supportsMappedAnalytics) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsMappedAnalytics"];
  }
  if (v2->_supportsFriendlyName) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsFriendlyName"];
  }
  if (v2->_supportsInternalSettings) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsInternalSettings"];
  }
  if (v2->_supportsDeveloperSettings) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsDeveloperSettings"];
  }
  if (v2->_supportsVersions) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SupportsVersions"];
  }
  if (v2->_allowDownloadOnCellular) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AllowDownloadOnCellular"];
  }
  if (v2->_isSimulator) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsSimulator"];
  }
  if (v2->_dfuMode) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"DFUMode"];
  }
  if (v2->_updateRequiresPowerAssertion)
  {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"UpdateRequiresPowerAssertion"];
    if (v2->_updateRequiresPowerAssertion) {
      [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"UpdateRequiresPowerAssertion"];
    }
  }

  if (v2->_autoAppliesStagedFirmware) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AutoAppliesStagedFirmware"];
  }
  if (v2->_ttrSolicitLogs) {
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"TtrSolicitLogs"];
  }
  fusingOverrideUnfused = v2->_fusingOverrideUnfused;
  if (fusingOverrideUnfused) {
    [v4 setObject:fusingOverrideUnfused forKeyedSubscript:@"FusingOverrideUnfused"];
  }
  if (v2->_uploaderResponseTimeout)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKeyedSubscript:@"UploaderResponseTimeout"];
  }

  if (v2->_uploaderRetryLimit)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:@"UploaderRetryLimit"];
  }

  mobileAssetAppleModelNumber = v2->_mobileAssetAppleModelNumber;
  if (mobileAssetAppleModelNumber)
  {
    if (-[NSString caseInsensitiveCompare:]( mobileAssetAppleModelNumber,  "caseInsensitiveCompare:",  v2->_appleModelNumber)
      && !v3)
    {
      [v4 setObject:v2->_mobileAssetAppleModelNumber forKeyedSubscript:@"MobileAssetsModelNumber"];
    }
  }

  supplementalMobileAssetAppleModelNumber = v2->_supplementalMobileAssetAppleModelNumber;
  if (supplementalMobileAssetAppleModelNumber) {
    [v4 setObject:supplementalMobileAssetAppleModelNumber forKeyedSubscript:@"SupplementalAssetsModelNumber"];
  }
  if (-[NSMutableSet count](v2->_downstreamAppleModelNumbers, "count"))
  {
    v26 = -[NSMutableSet allObjects](v2->_downstreamAppleModelNumbers, "allObjects");
    [v4 setObject:v26 forKeyedSubscript:@"DownstreamAppleModelNumbers"];
  }

  if (-[NSMutableSet count](v2->_alternativeAppleModelNumbers, "count"))
  {
    v27 = -[NSMutableSet allObjects](v2->_alternativeAppleModelNumbers, "allObjects");
    [v4 setObject:v27 forKeyedSubscript:@"AlternativeAppleModelNumbers"];
  }

  if (-[NSMutableSet count](v2->_bsdNotificationsInternal, "count"))
  {
    v28 = -[NSMutableSet allObjects](v2->_bsdNotificationsInternal, "allObjects");
    [v4 setObject:v28 forKeyedSubscript:@"BSDNotifications"];
  }

  if (-[NSMutableSet count](v2->_serviceBsdNotificationsInternal, "count"))
  {
    v29 = -[NSMutableSet allObjects](v2->_serviceBsdNotificationsInternal, "allObjects");
    [v4 setObject:v29 forKeyedSubscript:@"ServiceBSDNotifications"];
  }

  updaterName = v2->_updaterName;
  if (updaterName) {
    [v4 setObject:updaterName forKeyedSubscript:@"UpdaterName"];
  }
  personalizationNotification = v2->_personalizationNotification;
  if (personalizationNotification) {
    [v4 setObject:personalizationNotification forKeyedSubscript:@"PersonalizationNotification"];
  }
  v32 = (void *)objc_opt_new();
  v33 = -[UARPSupportedAccessory identifier](v2, "identifier");
  [v32 setObject:v4 forKeyedSubscript:v33];

  [MEMORY[0x189603F68] dictionaryWithDictionary:v32];
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

LABEL_44:
  v28 = self;
  v29 = v18;
  v31 = v38;
  v30 = v39;
  v32 = v36;
  v33 = v17;
LABEL_45:
  -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:]( v28,  "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:",  v29,  v30,  v31,  v32,  v33);
LABEL_56:

LABEL_57:
  objc_msgSend(MEMORY[0x189603F18], "arrayWithArray:", v38, v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

    [MEMORY[0x189603F48] dataWithBytes:a5 length:a4];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)[objc_alloc(NSString) initWithData:v12 encoding:4];
    if (v13) {
      v11 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:stringValue:",  a3,  v13);
    }
    else {
      v11 = 0LL;
    }

    goto LABEL_48;
  }

  if ((uint64_t)a3 <= 3291140105LL)
  {
    switch(a3)
    {
      case 0x88B29102uLL:
      case 0x88B29115uLL:
      case 0x88B29116uLL:
      case 0x88B29117uLL:
      case 0x88B29119uLL:
      case 0x88B2911AuLL:
      case 0x88B29123uLL:
      case 0x88B29124uLL:
        goto LABEL_19;
      case 0x88B29103uLL:
      case 0x88B29112uLL:
      case 0x88B2911FuLL:
      case 0x88B29134uLL:
      case 0x88B29136uLL:
        goto LABEL_44;
      case 0x88B29104uLL:
      case 0x88B29105uLL:
      case 0x88B29109uLL:
      case 0x88B2910AuLL:
      case 0x88B2910BuLL:
      case 0x88B2911DuLL:
      case 0x88B2911EuLL:
      case 0x88B29120uLL:
      case 0x88B29125uLL:
        goto LABEL_35;
      case 0x88B29106uLL:
      case 0x88B2911BuLL:
        if (a4 != 8) {
          goto LABEL_41;
        }
        v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt64:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt64:",  a3,  uarpHtonll(*(void *)a5));
        goto LABEL_37;
      case 0x88B29107uLL:
      case 0x88B29108uLL:
      case 0x88B2910CuLL:
      case 0x88B2910DuLL:
      case 0x88B2910EuLL:
      case 0x88B2910FuLL:
      case 0x88B29110uLL:
      case 0x88B29111uLL:
      case 0x88B29113uLL:
      case 0x88B29114uLL:
      case 0x88B2911CuLL:
      case 0x88B29129uLL:
      case 0x88B2912AuLL:
      case 0x88B2912BuLL:
      case 0x88B2912CuLL:
      case 0x88B2912DuLL:
      case 0x88B2912EuLL:
      case 0x88B2912FuLL:
      case 0x88B29130uLL:
      case 0x88B29135uLL:
        goto LABEL_50;
      case 0x88B29118uLL:
      case 0x88B29121uLL:
      case 0x88B29122uLL:
      case 0x88B29126uLL:
      case 0x88B29127uLL:
      case 0x88B29128uLL:
      case 0x88B29131uLL:
      case 0x88B29132uLL:
      case 0x88B29133uLL:
        goto LABEL_5;
      default:
        if (a3 == 3291140096) {
          goto LABEL_35;
        }
        v9 = 3291140105LL;
        goto LABEL_34;
    }
  }

  if ((uint64_t)a3 <= 4042160639LL)
  {
    switch(a3)
    {
      case 0xCCD28104uLL:
      case 0xCCD2810CuLL:
      case 0xCCD2810FuLL:
      case 0xCCD28119uLL:
        goto LABEL_35;
      case 0xCCD28105uLL:
      case 0xCCD28106uLL:
      case 0xCCD28107uLL:
      case 0xCCD28108uLL:
      case 0xCCD28109uLL:
      case 0xCCD2810AuLL:
      case 0xCCD28113uLL:
      case 0xCCD28115uLL:
      case 0xCCD28116uLL:
      case 0xCCD28118uLL:
        goto LABEL_50;
      case 0xCCD2810BuLL:
      case 0xCCD2810DuLL:
      case 0xCCD2810EuLL:
      case 0xCCD28110uLL:
      case 0xCCD28112uLL:
      case 0xCCD28117uLL:
        goto LABEL_19;
      case 0xCCD28111uLL:
      case 0xCCD28114uLL:
        goto LABEL_44;
      case 0xCCD2811AuLL:
        goto LABEL_5;
      default:
        v10 = 3291140106LL;
        goto LABEL_43;
    }
  }

  if (a3 - 4042160640u < 2) {
    goto LABEL_44;
  }
  if (a3 != 4042160643) {
    goto LABEL_50;
  }
LABEL_5:
  if (a4 != 1) {
    goto LABEL_41;
  }
  v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt8:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt8:",  a3,  *(unsigned __int8 *)a5);
LABEL_37:
  v11 = v8;
LABEL_49:

  return v11;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_17:
  return v13;
}

const char *UARPAccessoryPropertyToString(unint64_t a1)
{
  if (a1 > 0x29) {
    return "unrecognized";
  }
  else {
    return off_18A142000[a1];
  }
}

const char *UARPFirmwareStagingCompletionStatusToString(unint64_t a1)
{
  if (a1 > 0x25) {
    return "unrecognized";
  }
  else {
    return off_18A142150[a1];
  }
}

const char *UARPFirmwareApplicationStatusToString(unint64_t a1)
{
  if (a1 > 5) {
    return "unrecognized";
  }
  else {
    return off_18A142280[a1];
  }
}

const char *UARPAssetLocationTypeToString(unint64_t a1)
{
  if (a1 > 0x11) {
    return "unrecognized";
  }
  else {
    return off_18A1422B0[a1];
  }
}

id UARPAssetLocationTypeToURL(uint64_t a1)
{
  switch(a1)
  {
    case 11LL:
      v1 = (void *)MEMORY[0x189604030];
      v2 = kUARPAssetLocationTypeMobileAssetServerBasejumperStr;
      goto LABEL_8;
    case 12LL:
      currentTrainName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = (void *)MEMORY[0x189604030];
        currentTrainName();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        [@"https://basejumper.apple.com/livability/" stringByAppendingString:v5];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 URLWithString:v6];
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v3;
    case 13LL:
      v1 = (void *)MEMORY[0x189604030];
      v2 = kUARPAssetLocationTypeMobileAssetServerMesuMacOSStr;
      goto LABEL_8;
    case 14LL:
      v1 = (void *)MEMORY[0x189604030];
      v2 = kUARPAssetLocationTypeMobileAssetServerMesuStagingStr;
LABEL_8:
      [v1 URLWithString:*v2];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0LL;
      break;
  }

  return v3;
}

const char *UARPAssetDownloadStatusToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A142340[a1];
  }
}

const char *UARPAssetValidationStatusToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A142358[a1];
  }
}

const char *UARPFirmwareUpdateAvailabilityStatusToString(unint64_t a1)
{
  if (a1 > 8) {
    return "unrecognized";
  }
  else {
    return off_18A142370[a1];
  }
}

const char *UARPAccessoryTransportToString(unint64_t a1)
{
  if (a1 > 0xA) {
    return "unrecognized";
  }
  else {
    return off_18A1423B8[a1];
  }
}

unint64_t UARPAccessoryTransportStringToType(void *a1)
{
  id v1 = a1;
  unint64_t v2 = 0LL;
  while (1)
  {
    v3 = "unrecognized";
    if (v2 <= 0xA) {
      v3 = off_18A1423B8[v2];
    }
    [NSString stringWithUTF8String:v3];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v1 isEqualToString:v4];

    if ((v5 & 1) != 0) {
      break;
    }
    if (++v2 == 11)
    {
      unint64_t v2 = 0LL;
      break;
    }
  }

  return v2;
}

const char *UARPAccessoryCapabilityToString(uint64_t a1)
{
  id v1 = "CHIP";
  unint64_t v2 = "unrecognized";
  if (a1 == 1) {
    unint64_t v2 = "power source";
  }
  if (a1 != 16) {
    id v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return "none";
  }
}

const char *UARPAccessoryHardwareFusingToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A142410[a1];
  }
}

const char *UARPAccessoryVendorIDSourceToString(uint64_t a1)
{
  id v1 = "unrecognized";
  if (a1 == 2) {
    id v1 = "USB-IF";
  }
  if (a1 == 1) {
    return "Bluetooth-SIG";
  }
  else {
    return v1;
  }
}

const char *UARPControllerCapabilityToString(uint64_t a1)
{
  id v1 = "unrecognized";
  if (a1 == 1) {
    id v1 = "CHIP";
  }
  if (a1) {
    return v1;
  }
  else {
    return "UARP";
  }
}

const char *UARPAssetCheckOptionsToString(int a1)
{
  if (a1 == 1) {
    return "download asset";
  }
  else {
    return "unrecognized";
  }
}

const char *UARPUSBPDDeviceClassToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A142428[a1];
  }
}

const char *UARPAccessoryUSBPDLocationTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_18A142440[a1];
  }
}

const char *UARPHashAlgorithmToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_18A142458[a1];
  }
}

void OUTLINED_FUNCTION_1_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_187DD1BD4(_Unwind_Exception *a1)
{
}

id UARPPersonalizationTSSRequestWithSigningServer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  String();
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    UARPPersonalizationTSSRequestWithSigningServer_cold_3();
  }

  String(v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  String();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      UARPPersonalizationTSSRequestWithSigningServer_cold_2();
    }

    id v9 = v6;
  }

  else
  {
    if (v8) {
      UARPPersonalizationTSSRequestWithSigningServer_cold_1();
    }

    v10 = (void *)MGCopyAnswer();
    int v11 = [v10 BOOLValue];
    v12 = 0LL;
    if (v11)
    {
      UARPPersonalizationTSSRequestWithSigningServerSSO(v3, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v9 = v12;
  }

  return v9;
}

id String()
{
  if (TSSRequestLogToken_onceToken != -1) {
    dispatch_once(&TSSRequestLogToken_onceToken, &__block_literal_global_0);
  }
  return (id)TSSRequestLogToken_logToken;
}

id String(void *a1, void *a2, int a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  String();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl(&dword_187DC0000, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler();
  uint64_t v8 = AMAuthInstallCreate();
  if (v8)
  {
    id v9 = (const void *)v8;
    if (AMAuthInstallSetSigningServerURL())
    {
      String();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        TSSRequestWithSigningServer_cold_5();
      }
LABEL_7:

      CFRelease(v9);
      goto LABEL_11;
    }

    if (a3)
    {
      String();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_187DC0000, v13, OS_LOG_TYPE_INFO, "UARP: TSS request is using SSO", buf, 2u);
      }

      if (AMAuthInstallSsoInitialize())
      {
        String();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          TSSRequestWithSigningServer_cold_4();
        }
        goto LABEL_7;
      }

      if (AMAuthInstallSsoEnable())
      {
        String();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          TSSRequestWithSigningServer_cold_3();
        }
        goto LABEL_7;
      }
    }

    String();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        v15 = @" <AppleConnect>";
      }
      else {
        v15 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_187DC0000, v14, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
    }

    String();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_187DC0000, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    String();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        v19 = @" <AppleConnect>";
      }
      else {
        v19 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl(&dword_187DC0000, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
    }

    String();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = 0LL;
      _os_log_impl(&dword_187DC0000, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    if (PersonalizedResponse)
    {
      String();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        TSSRequestWithSigningServer_cold_2(PersonalizedResponse, v21);
      }
    }

    CFRelease(v9);
  }

  else
  {
    String();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      TSSRequestWithSigningServer_cold_1();
    }
  }

id UARPPersonalizationTSSRequestWithSigningServerSSO(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  String();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2();
  }

  String(v3, v4, 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    String();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1();
    }
  }

  return v6;
}

void __TSSRequestLogToken_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  uint64_t v1 = (void *)TSSRequestLogToken_logToken;
  TSSRequestLogToken_logToken = (uint64_t)v0;
}

void String(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  String();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    uint64_t v5 = a2;
    _os_log_impl( &dword_187DC0000,  v3,  OS_LOG_TYPE_INFO,  "UARP: Personalization Message >> %{public}s",  (uint8_t *)&v4,  0xCu);
  }
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_187DD2764(_Unwind_Exception *a1)
{
}

LABEL_14:
        v13 = 1;
LABEL_15:

        goto LABEL_19;
      }

      -[NSMutableArray removeObject:](self->_tmapDatabase, "removeObject:", v8);
    }

    id v9 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetTmapMapping);
    [v4 objectForKeyedSubscript:@"Events"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:]( v9,  "initWithEvents:appleModelNumber:endian:",  v10,  v6,  v7);

    if (v11)
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = v6;
        _os_log_impl( &dword_187DC0000,  v12,  OS_LOG_TYPE_INFO,  "Adding TMAP for Apple Model Number: %@",  (uint8_t *)&v33,  0xCu);
      }

      -[NSMutableArray addObject:](self->_tmapDatabase, "addObject:", v11);
    }

    goto LABEL_14;
  }

  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetTmapDatabase addTmapMapping:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v13 = 0;
LABEL_19:

  return v13;
}
}
}
}

id UARPStringDynamicAssetsFilepath()
{
  if (UARPStringDynamicAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringDynamicAssetsFilepath_onceToken, &__block_literal_global_1);
  }
  return (id)UARPStringDynamicAssetsFilepath_path;
}

void __UARPStringDynamicAssetsFilepath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"dynamicassets"];
  unint64_t v2 = (void *)UARPStringDynamicAssetsFilepath_path;
  UARPStringDynamicAssetsFilepath_path = v1;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (UARPStringSupplementalAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringSupplementalAssetsFilepath_onceToken, &__block_literal_global_494);
  }
  return (id)UARPStringSupplementalAssetsFilepath_path;
}

void __UARPStringSupplementalAssetsFilepath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"supplementalassets"];
  unint64_t v2 = (void *)UARPStringSupplementalAssetsFilepath_path;
  UARPStringSupplementalAssetsFilepath_path = v1;
}

id UARPStringTempFilesFilepath()
{
  if (UARPStringTempFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringTempFilesFilepath_onceToken, &__block_literal_global_495);
  }
  return (id)UARPStringTempFilesFilepath_path;
}

void __UARPStringTempFilesFilepath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmpfiles"];
  unint64_t v2 = (void *)UARPStringTempFilesFilepath_path;
  UARPStringTempFilesFilepath_path = v1;
}

id UARPStringPcapFilesFilepath()
{
  if (UARPStringPcapFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringPcapFilesFilepath_onceToken, &__block_literal_global_496);
  }
  return (id)UARPStringPcapFilesFilepath_path;
}

void __UARPStringPcapFilesFilepath_block_invoke()
{
  os_log_t v0 = (void *)MEMORY[0x189603F18];
  InternalStorageDirectoryPath();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v1, @"pcapfiles", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = [NSString pathWithComponents:v4];
  id v3 = (void *)UARPStringPcapFilesFilepath_path;
  UARPStringPcapFilesFilepath_path = v2;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA-384"])
    {
      uint64_t v2 = [v1 caseInsensitiveCompare:@"SHA-512"];
      id v3 = (void *)MEMORY[0x189607968];
      if (v2) {
        uint64_t v4 = 0LL;
      }
      else {
        uint64_t v4 = 3LL;
      }
    }

    else
    {
      id v3 = (void *)MEMORY[0x189607968];
      uint64_t v4 = 2LL;
    }
  }

  else
  {
    id v3 = (void *)MEMORY[0x189607968];
    uint64_t v4 = 1LL;
  }

  [v3 numberWithUnsignedShort:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id UARPStringTmapDirectoryPath()
{
  if (UARPStringTmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDirectoryPath_onceToken, &__block_literal_global_585);
  }
  return (id)UARPStringTmapDirectoryPath_path;
}

void __UARPStringTmapDirectoryPath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmap"];
  uint64_t v2 = (void *)UARPStringTmapDirectoryPath_path;
  UARPStringTmapDirectoryPath_path = v1;
}

id UARPStringTmapDatabaseFilePath()
{
  if (UARPStringTmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDatabaseFilePath_onceToken, &__block_literal_global_586);
  }
  return (id)UARPStringTmapDatabaseFilePath_path;
}

void __UARPStringTmapDatabaseFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  UARPStringTmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmapdatabase"];
  uint64_t v2 = (void *)UARPStringTmapDatabaseFilePath_path;
  UARPStringTmapDatabaseFilePath_path = v1;
}

id UARPStringTapToRadarFilePath()
{
  if (UARPStringTapToRadarFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTapToRadarFilePath_onceToken, &__block_literal_global_589);
  }
  return (id)UARPStringTapToRadarFilePath_path;
}

void __UARPStringTapToRadarFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"taptoradar"];
  uint64_t v2 = (void *)UARPStringTapToRadarFilePath_path;
  UARPStringTapToRadarFilePath_path = v1;
}

id UARPStringLogsDirectoryFilePath()
{
  if (UARPStringLogsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringLogsDirectoryFilePath_onceToken, &__block_literal_global_592);
  }
  return (id)UARPStringLogsDirectoryFilePath_path;
}

void __UARPStringLogsDirectoryFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"logs"];
  uint64_t v2 = (void *)UARPStringLogsDirectoryFilePath_path;
  UARPStringLogsDirectoryFilePath_path = v1;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (UARPStringCrashAnalyticsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCrashAnalyticsDirectoryFilePath_onceToken, &__block_literal_global_595);
  }
  return (id)UARPStringCrashAnalyticsDirectoryFilePath_path;
}

void __UARPStringCrashAnalyticsDirectoryFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"crsh"];
  uint64_t v2 = (void *)UARPStringCrashAnalyticsDirectoryFilePath_path;
  UARPStringCrashAnalyticsDirectoryFilePath_path = v1;
}

id UARPStringCmapDirectoryPath()
{
  if (UARPStringCmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDirectoryPath_onceToken, &__block_literal_global_642);
  }
  return (id)UARPStringCmapDirectoryPath_path;
}

void __UARPStringCmapDirectoryPath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmap"];
  uint64_t v2 = (void *)UARPStringCmapDirectoryPath_path;
  UARPStringCmapDirectoryPath_path = v1;
}

id UARPStringCmapDatabaseFilePath()
{
  if (UARPStringCmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDatabaseFilePath_onceToken, &__block_literal_global_643);
  }
  return (id)UARPStringCmapDatabaseFilePath_path;
}

void __UARPStringCmapDatabaseFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  UARPStringCmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmapdatabase"];
  uint64_t v2 = (void *)UARPStringCmapDatabaseFilePath_path;
  UARPStringCmapDatabaseFilePath_path = v1;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (UARPStringSysdiagnoseDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringSysdiagnoseDirectoryFilePath_onceToken, &__block_literal_global_648);
  }
  return (id)UARPStringSysdiagnoseDirectoryFilePath_path;
}

void __UARPStringSysdiagnoseDirectoryFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"sysdiagnose"];
  uint64_t v2 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  UARPStringSysdiagnoseDirectoryFilePath_path = v1;
}

id UARPStringPifMetricsFilePath()
{
  if (UARPStringPifMetricsFilePath_onceToken != -1) {
    dispatch_once(&UARPStringPifMetricsFilePath_onceToken, &__block_literal_global_651);
  }
  return (id)UARPStringPifMetricsFilePath_path;
}

void __UARPStringPifMetricsFilePath_block_invoke()
{
  os_log_t v0 = (void *)NSString;
  UARPStringSysdiagnoseDirectoryFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"com.apple.Bluetooth.AccessoryCase.pif_daily"];
  uint64_t v2 = (void *)UARPStringPifMetricsFilePath_path;
  UARPStringPifMetricsFilePath_path = v1;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_2_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

LABEL_26:
  return 0;
}

    v19 = v10;
  }

LABEL_15:
  return v13;
}

    v35 = 5;
    goto LABEL_19;
  }

  v37 = self->_log;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v51 = v10;
    *(_WORD *)&v51[4] = 2112;
    *(void *)&v51[6] = v14;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = a6;
    _os_log_error_impl( &dword_187DC0000,  v37,  OS_LOG_TYPE_ERROR,  "Requested offset (%d) invalid for asset %@ with length (%d)",  buf,  0x18u);
  }

  *a8 = 0;
  v35 = 4;
LABEL_19:

  return v35;
}

    v16 = 0;
    goto LABEL_16;
  }

  if (!v9)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.2();
    }
    goto LABEL_15;
  }

  if (!self->_fieldName)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.3();
    }
    goto LABEL_15;
  }

  objc_msgSend(v8, "subdataWithRange:", a4, self->_fieldLength);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TmapFieldTLV expandFieldData:inCoreAnalytics:](self, "expandFieldData:inCoreAnalytics:", v15, v9);

LABEL_16:
  return v16;
}
}

    if (v3 >= 2)
    {
      id v9 = 0LL;
      v10 = 8LL * (v3 - 1);
      do
      {
        int v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + 8) = 0LL;
        }

        v9 += 8LL;
      }

      while (v10 != v9);
    }
  }

  return 0LL;
}

LABEL_32:
  return v21;
}

      v30 = 0;
LABEL_66:

      goto LABEL_67;
    }
    v31 = -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameECID);
    v32 = -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameECID);
    v33 = self->_log;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      keyNameECID = self->_keyNameECID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameECID;
      v73 = 2112;
      v74 = v31;
      v75 = 2112;
      v76 = v32;
      _os_log_impl(&dword_187DC0000, v33, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }

    if (v31 && !v32)
    {
      v35 = self->_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v36;
        v73 = 2112;
        v74 = v31;
        v37 = "%s %@; %@, missing in TSS response";
        v38 = v35;
        v39 = 32;
LABEL_42:
        _os_log_impl(&dword_187DC0000, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
        goto LABEL_43;
      }

      goto LABEL_43;
    }

    if (([v31 isEqualToNumber:v32] & 1) == 0)
    {
      v50 = self->_log;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = self->_keyNameECID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v51;
        v73 = 2112;
        v74 = v31;
        v75 = 2112;
        v76 = v32;
        v37 = "%s %@; NOT EQUAL %@ vs %@";
        v38 = v50;
        v39 = 42;
        goto LABEL_42;
      }

void OUTLINED_FUNCTION_0_2( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

LABEL_62:
          free(v125);
          metaData = v129->_metaData;
          v137 = 0LL;
          v66 = [v126 uarpWriteData:metaData error:&v137];
          v61 = (__CFString *)v137;
          v17 = v121;
          if (!v66)
          {
            v85 = @"<unknown>";
            if (v61) {
              v85 = v61;
            }
            objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary metadata at %@; %@",
              v123,
              v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = (void *)objc_opt_new();
            [v87 setObject:v86 forKeyedSubscript:*MEMORY[0x1896075E0]];
            v88 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v87];
            v89 = v88;
            v27 = (void *)v124;
            if (v130) {
              *v130 = v88;
            }
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
            }

            v46 = 0;
            goto LABEL_134;
          }

          if (-[NSMutableArray count](*p_payloads, "count"))
          {
            v67 = 0LL;
            while (1)
            {
              v68 = -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v67);
              [v68 metaData];
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = 0LL;
              v70 = [v126 uarpWriteData:v69 error:&v136];
              v71 = (__CFString *)v136;

              if ((v70 & 1) == 0) {
                break;
              }
            }

            if (v71) {
              v95 = v71;
            }
            else {
              v95 = @"<unknown>";
            }
            objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary payload metadata index %lu at %@; %@",
              v67,
              v123,
              v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = (void *)objc_opt_new();
            [v97 setObject:v96 forKeyedSubscript:*MEMORY[0x1896075E0]];
            v98 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v97];
            v99 = v98;
            if (v130) {
              *v130 = v98;
            }
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
            }

            goto LABEL_132;
          }

LABEL_67:
          v21 = v123;
          v25 = v126;
          if (v128)
          {
            v135 = 0LL;
            v72 = [v126 uarpWriteData:v128 error:&v135];
            v73 = (__CFString *)v135;
            v64 = v73;
            if ((v72 & 1) == 0)
            {
              v100 = @"<unknown>";
              if (v73) {
                v100 = v73;
              }
              objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary padding at %@; %@",
                v123,
                v100);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = (void *)objc_opt_new();
              [v92 setObject:v91 forKeyedSubscript:*MEMORY[0x1896075E0]];
              v101 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v92];
              v94 = v101;
              if (v130) {
                *v130 = v101;
              }
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
              }
LABEL_97:

              v46 = 0;
LABEL_133:
              v27 = (void *)v124;
LABEL_134:
              v25 = v126;
              goto LABEL_135;
            }
          }

          if (-[NSMutableArray count](*p_payloads, "count"))
          {
            v74 = 0LL;
            while (1)
            {
              v75 = -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", v74);
              v134 = 0LL;
              v76 = [v75 appendCompressedPayloadToFile:v25 error:&v134];
              v77 = (__CFString *)v134;
              v78 = v77;
              if ((v76 & 1) == 0) {
                break;
              }

              ++v74;
              v25 = v126;
              if (v74 >= -[NSMutableArray count](*p_payloads, "count")) {
                goto LABEL_74;
              }
            }

            v102 = @"<unknown>";
            if (v77) {
              v102 = v77;
            }
            objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary payload data index %lu at %@; %@",
              v74,
              v123,
              v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = (void *)objc_opt_new();
            [v104 setObject:v103 forKeyedSubscript:*MEMORY[0x1896075E0]];
            v105 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v104];
            v106 = v105;
            if (v130) {
              *v130 = v105;
            }
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
            }

            goto LABEL_132;
          }

LABEL_74:
          v27 = (void *)v124;
          if (v24)
          {
            if (v129->_plistMetaData)
            {
              objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithContentsOfURL:");
              v79 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v79 = objc_alloc_init(MEMORY[0x189603FC8]);
              v107 = -[UARPSuperBinaryMetaDataTable formatVersion](v129->_metaDataTable, "formatVersion");
              [v79 setObject:v107 forKeyedSubscript:@"MetaData Format Version"];
              v108 = -[UARPSuperBinaryMetaDataTable values](v129->_metaDataTable, "values");
              [v79 setObject:v108 forKeyedSubscript:@"MetaData Values"];
            }

            if (v79) {
              [v24 setObject:v79 forKey:@"MetaData plist"];
            }
            [MEMORY[0x1896078F8] archivedDataWithRootObject:v24 requiringSecureCoding:0 error:v130];
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = 0LL;
            v110 = [v25 uarpWriteData:v109 error:&v133];
            v111 = (__CFString *)v133;
            v112 = v111;
            if ((v110 & 1) == 0)
            {
              v113 = @"<unknown>";
              if (v111) {
                v113 = v111;
              }
              objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to write to superbinary plist at %@; %@",
                v123,
                v113);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = (void *)objc_opt_new();
              [v115 setObject:v114 forKeyedSubscript:*MEMORY[0x1896075E0]];
              v116 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v115];
              v117 = v116;
              if (v130) {
                *v130 = v116;
              }
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
              }

LABEL_132:
              v46 = 0;
              v21 = v123;
              goto LABEL_133;
            }

            v25 = v126;
          }

          [v25 uarpCloseAndReturnError:v130];
          v46 = 1;
LABEL_135:

          v48 = v128;
          goto LABEL_136;
        }

        v49 = @"<unknown>";
        if (v26) {
          v49 = v26;
        }
        objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to open file for composing superbinary at %@; %@",
          v18,
          v49);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_opt_new();
        [v50 setObject:v48 forKeyedSubscript:*MEMORY[0x1896075E0]];
        v51 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v50];
        v52 = v51;
        if (v130) {
          *v130 = v51;
        }
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
        }
      }

      else
      {
        [NSString stringWithFormat:@"Failed to create file for composing superbinary at %@", v21];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_opt_new();
        [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x1896075E0]];
        v47 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v25];
        v48 = v47;
        if (v130) {
          *v130 = v47;
        }
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
        }
      }

      v46 = 0;
LABEL_136:

      goto LABEL_137;
    }

    v19 = (const char *)strlen(v19);
  }

  else
  {
    v20 = "NULL";
  }

  __int16 v24 = v8;
  objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to create file for composing superbinary, filename is %s or length is %lu",  v20,  v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  [v27 setObject:v21 forKeyedSubscript:*MEMORY[0x1896075E0]];
  v45 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
  v25 = v45;
  if (v130) {
    *v130 = v45;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
LABEL_39:
  }
    -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:].cold.1();
LABEL_40:
  v46 = 0;
LABEL_137:

  return v46;
}

void sub_187DDAC04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_10:
  v31 = v9;
  v16 = objc_alloc_init(MEMORY[0x189603FA8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = self->_payloads;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
  if (v18)
  {
    v19 = v18;
    v20 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v19; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v22 needsCompression] && self->_formatVersion <= 2)
        {
          id v23 = -[UARPSuperBinaryAssetPayload initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:",  @"CHDR",  &unk_18A160A58,  &unk_18A160A58,  0LL,  0LL);
          if (v23)
          {
            __int16 v24 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt32:",  3436347663,  [v16 count]
                  + -[NSMutableArray count](self->_payloads, "count"));
            [v22 addMetaDataTLV:v24];
            [v16 addObject:v23];
          }

          else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:].cold.1( v40,  (uint64_t)self,  &v41);
          }
        }
      }

      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v42,  16LL);
    }

    while (v19);
  }

  -[NSMutableArray addObjectsFromArray:](self->_payloads, "addObjectsFromArray:", v16);
  v25 = 1;
  id v9 = v31;
LABEL_31:

  return v25;
}

void sub_187DDDD98(_Unwind_Exception *a1)
{
}

void sub_187DDE8F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return [v0 processIdentifier];
}

id getCSVoiceTriggerRTModelClass()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  os_log_t v0 = (void *)getCSVoiceTriggerRTModelClass_softClass;
  uint64_t v7 = getCSVoiceTriggerRTModelClass_softClass;
  if (!getCSVoiceTriggerRTModelClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getCSVoiceTriggerRTModelClass_block_invoke;
    v3[3] = &unk_18A143128;
    v3[4] = &v4;
    __getCSVoiceTriggerRTModelClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_187DDFE24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class __getCSVoiceTriggerRTModelClass_block_invoke(uint64_t a1)
{
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreSpeechLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }

  while (1)
  {
    Class result = objc_getClass("CSVoiceTriggerRTModel");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_6:
    id v3 = (void *)__getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
    free(v3);
  }

  getCSVoiceTriggerRTModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id UARPArrayOfExpiredFiles(void *a1, void *a2, double a3)
{
  v40[2] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  v33 = (void *)objc_opt_new();
  v32 = v5;
  [MEMORY[0x189607940] stringWithString:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  v31 = v6;
  if (v6)
  {
    uint64_t v9 = [v7 stringByAppendingPathComponent:v6];

    uint64_t v8 = (void *)v9;
  }

  [MEMORY[0x1896078A8] defaultManager];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 enumeratorAtPath:v8];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603F50] now];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v11;
  uint64_t v13 = [v11 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v34 = *MEMORY[0x1896074E0];
    v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      v16 = (void *)NSString;
      v40[0] = v8;
      v40[1] = v14;
      [MEMORY[0x189603F18] arrayWithObjects:v40 count:2];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 pathWithComponents:v17];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        UARPArrayOfExpiredFiles_cold_1(v38, (uint64_t)v18, &v39);
      }
      id v19 = v12;
      v20 = (void *)MEMORY[0x1896078A8];
      id v21 = v18;
      [v20 defaultManager];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 attributesOfItemAtPath:v21 error:0];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        [v23 objectForKeyedSubscript:v34];
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 dateByAddingTimeInterval:a3];
        v25 = v15;
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = [v19 compare:v26];

        v15 = v25;
        if (v27 == 1)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v21;
            _os_log_impl(&dword_187DC0000, v25, OS_LOG_TYPE_DEFAULT, "Expired temp file %@ ", buf, 0xCu);
          }

          [v33 addObject:v21];
        }
      }

      else
      {
      }

      uint64_t v28 = [v35 nextObject];

      v14 = (void *)v28;
    }

    while (v28);
  }

  [MEMORY[0x189603F18] arrayWithArray:v33];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void sub_187DE0C1C(_Unwind_Exception *a1)
{
}

void sub_187DE0C7C(_Unwind_Exception *a1)
{
}

void sub_187DE0CDC(_Unwind_Exception *a1)
{
}

LABEL_27:
  return v19;
}
        }

        else
        {
          uint64_t v13 = 0;
        }

        id v6 = v52;

        v17 = v38;
      }

      else
      {
        uint64_t v13 = 0;
        id v6 = v52;
      }
    }

    else
    {
      uint64_t v13 = 0;
    }
  }

  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_187DE1A80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_187DE1AFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_0_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

LABEL_35:
        if (a4 == 4)
        {
          uint64_t v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt32:",  a3,  uarpHtonl(*(_DWORD *)a5));
          goto LABEL_37;
        }

        goto LABEL_41;
      }

      if (a3 - 272691969 >= 2)
      {
        v10 = 538280448LL;
LABEL_43:
        if (a3 != v10) {
          goto LABEL_50;
        }
      }
    }

    else
    {
      if ((uint64_t)a3 > 2158597887LL)
      {
        if (a3 - 2158597888u >= 3) {
          goto LABEL_50;
        }
        goto LABEL_44;
      }

      if (a3 - 1619725824 <= 8)
      {
        if (((1LL << a3) & 0x109) != 0)
        {
LABEL_19:
          if (a4 == 2)
          {
            uint64_t v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  a3,  uarpHtons(*(unsigned __int16 *)a5));
            goto LABEL_37;
          }

LABEL_41:
          int v11 = 0LL;
          goto LABEL_49;
        }

        if (((1LL << a3) & 6) != 0) {
          goto LABEL_44;
        }
        if (a3 == 1619725831)
        {
LABEL_38:
          uarpVersionEndianSwap((unsigned int *)a5, &v15);
          uint64_t v8 = -[UARPSuperBinaryAssetTLV initWithType:version:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:version:",  a3,  &v15);
          goto LABEL_37;
        }
      }

      if (a3 != 1155952129)
      {
        uint64_t v9 = 1483412481LL;
LABEL_34:
        if (a3 != v9) {
          goto LABEL_50;
        }
        goto LABEL_35;
      }
    }

void sub_187DE58FC(_Unwind_Exception *a1)
{
}

void sub_187DE5A94(_Unwind_Exception *a1)
{
}

void sub_187DE5B98(_Unwind_Exception *a1)
{
}

void sub_187DE5C08(_Unwind_Exception *a1)
{
}

void sub_187DE5C78(_Unwind_Exception *a1)
{
}

void sub_187DE5CE8(_Unwind_Exception *a1)
{
}

void sub_187DE5D58(_Unwind_Exception *a1)
{
}

void sub_187DE5DC8(_Unwind_Exception *a1)
{
}

void sub_187DE5E38(_Unwind_Exception *a1)
{
}

void sub_187DE5EA8(_Unwind_Exception *a1)
{
}

void sub_187DE5F18(_Unwind_Exception *a1)
{
}

void sub_187DE5F88(_Unwind_Exception *a1)
{
}

void sub_187DE5FF8(_Unwind_Exception *a1)
{
}

void sub_187DE60E8(_Unwind_Exception *a1)
{
}

void sub_187DE62B4(_Unwind_Exception *a1)
{
}

void sub_187DE630C(_Unwind_Exception *a1)
{
}

void sub_187DE6374(_Unwind_Exception *a1)
{
}

void sub_187DE6518(_Unwind_Exception *a1)
{
}

void sub_187DE6584(_Unwind_Exception *a1)
{
}

void sub_187DE6BDC(_Unwind_Exception *a1)
{
}

id generateSHA256HashForDataAtLocationAsData(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

id generateHashForDataAtLocationAsData(void *a1, int a2, uint64_t a3)
{
  v16[129] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  uint64_t v6 = [MEMORY[0x189607898] fileHandleForReadingFromURL:v5 error:a3];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = 0LL;
  if (a2 && v6)
  {
    uint64_t v9 = CCDigestInit();
    do
    {
      v10 = (void *)MEMORY[0x1895B7E8C](v9);
      id v11 = [v7 uarpReadDataUpToLength:0x4000 error:a3];
      [v11 bytes];
      [v11 length];
      CCDigestUpdate();
      unint64_t v12 = [v11 length];

      objc_autoreleasePoolPop(v10);
    }

    while (v12 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    v14 = (char *)v16 - ((MEMORY[0x1895F8858]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    CCDigestFinal();
    else {
      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

id generateSHA256HashForDataAtLocation(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x189607940]);
    if ([v5 length])
    {
      unint64_t v8 = 0LL;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id generateBase64HashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 base64EncodedStringWithOptions:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

LABEL_25:
  return v16;
}

LABEL_43:
      v30 = 0;
LABEL_65:

      goto LABEL_66;
    }

    v67 = v32;
    v42 = -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameNonce);
    v68 = -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameNonce);
    v43 = self->_log;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      keyNameNonce = self->_keyNameNonce;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameNonce;
      v73 = 2112;
      v74 = v42;
      v75 = 2112;
      v76 = v68;
      _os_log_impl(&dword_187DC0000, v43, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }

    if (v42 && !v68)
    {
      v45 = self->_log;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
LABEL_54:
        v30 = 0;
LABEL_64:

        v32 = v67;
        goto LABEL_65;
      }

      v46 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = v46;
      v73 = 2112;
      v74 = v42;
      v47 = "%s %@; %@, missing in TSS response";
      v48 = v45;
      v49 = 32;
LABEL_53:
      _os_log_impl(&dword_187DC0000, v48, OS_LOG_TYPE_INFO, v47, buf, v49);
      goto LABEL_54;
    }

    v66 = v42;
    if (([v42 isEqualToData:v68] & 1) == 0)
    {
      v60 = self->_log;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = self->_keyNameNonce;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v61;
        v73 = 2112;
        v74 = v42;
        v75 = 2112;
        v76 = v68;
        v47 = "%s %@; NOT EQUAL %@ vs %@";
        v48 = v60;
        v49 = 42;
        goto LABEL_53;
      }

      v30 = 0;
LABEL_63:
      v42 = v66;
      goto LABEL_64;
    }
    v52 = -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameTicket);
    v65 = -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameTicket);
    v53 = self->_log;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      keyNameTicket = self->_keyNameTicket;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      v71 = 2112;
      v72 = keyNameTicket;
      v73 = 2112;
      v74 = v52;
      v75 = 2112;
      v76 = v65;
      _os_log_impl(&dword_187DC0000, v53, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }

    if (!v52 || v65)
    {
      if (objc_msgSend(v52, "isEqualToNumber:", v65, v65))
      {
        v30 = 1;
LABEL_62:

        goto LABEL_63;
      }

      v62 = self->_log;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = self->_keyNameTicket;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v63;
        v73 = 2112;
        v74 = v52;
        v75 = 2112;
        v76 = v65;
        v57 = "%s %@; NOT EQUAL %@ vs %@";
        v58 = v62;
        v59 = 42;
        goto LABEL_60;
      }
    }

    else
    {
      v55 = self->_log;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        v71 = 2112;
        v72 = v56;
        v73 = 2112;
        v74 = v52;
        v57 = "%s %@; %@, missing in TSS response";
        v58 = v55;
        v59 = 32;
LABEL_60:
        _os_log_impl(&dword_187DC0000, v58, OS_LOG_TYPE_INFO, v57, buf, v59);
      }
    }

    v30 = 0;
    goto LABEL_62;
  }

  uint64_t v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    v71 = 2112;
    v72 = v29;
    v73 = 2112;
    v74 = v10;
    v75 = 2112;
    v76 = v11;
    v16 = "%s %@; NOT EQUAL %@ vs %@";
    v17 = v28;
    v18 = 42;
    goto LABEL_20;
  }

LABEL_21:
  v30 = 0;
LABEL_67:

  return v30;
}

LABEL_38:
    id v37 = 0LL;
    [v16 uarpCloseAndReturnError:&v37];
    v17 = v37;

    v31 = (void *)[*p_compressedPayloadURL copy];
    goto LABEL_39;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[UARPSuperBinaryAssetPayload prepareData].cold.1();
  }
  v30 = *p_compressedPayloadURL;
  *p_compressedPayloadURL = 0LL;

  v31 = 0LL;
LABEL_39:

  return v31;
}
    }

    if (a4 < 0xEu) {
      goto LABEL_38;
    }
    id v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
    v22 = v10;
    goto LABEL_48;
  }

  return 0LL;
}

void sub_187DEC834( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_36:
    }

    else
    {
      v59 = 0;
      v16 = v67;
    }
  }

  else
  {
    v59 = 0;
  }

  return v59;
}

void sub_187DED904(_Unwind_Exception *a1)
{
}

void sub_187DEDF60(_Unwind_Exception *a1)
{
}

void sub_187DEED30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_187DEEF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_187DEF168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_187DEF50C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DEF768( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_187DEF940( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DEFB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_187DEFC94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DEFDEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DEFF44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DF009C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DF01F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187DF03C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_187DF115C(_Unwind_Exception *a1)
{
}

void sub_187DF2B0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void *__getRTBuddyCrashlogDecodeSymbolLoc_block_invoke(uint64_t a1)
{
  if (RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary)
  {
    uint64_t v2 = (void *)RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary;
  }

  else
  {
    RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary;
    if (!RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary)
    {
      uint64_t v4 = (void *)abort_report_np();
      free(v4);
    }
  }

  Class result = dlsym(v2, "RTBuddyCrashlogDecode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  getRTBuddyCrashlogDecodeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_187DF3838(_Unwind_Exception *a1)
{
}

LABEL_20:
  return v16;
}

  return v17;
}

const char *UARPAnalyticsAssetChannelTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_18A143418[a1];
  }
}

const char *UARPAnalyticsAssetDownloadStatusToString(unint64_t a1)
{
  if (a1 > 4) {
    return "unrecognized";
  }
  else {
    return off_18A143450[a1];
  }
}

const char *UARPAnalyticsStagingStatusToString(unint64_t a1)
{
  if (a1 > 0xC) {
    return "unrecognized";
  }
  else {
    return off_18A143478[a1];
  }
}

const char *UARPAnalyticsApplyStatusToString(unint64_t a1)
{
  if (a1 > 7) {
    return "unrecognized";
  }
  else {
    return off_18A1434E0[a1];
  }
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_187DFB0A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_6:
}
}

LABEL_7:
}

void sub_187E00234( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_187E005AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_187E00D78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_187E013AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_187E018F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_187E01E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187E021E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_3_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

id OUTLINED_FUNCTION_10_0(uint64_t a1, void *a2)
{
  return a2;
}

  ;
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

void sub_187E02C44(_Unwind_Exception *a1)
{
}

void UARPPowerLogAccessoryReachable(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _getEventDictionaryForState(0LL, a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:@"activeFWVers"];

  [v7 setObject:v5 forKeyedSubscript:@"fwVersion"];
  PLLogRegisteredEvent();
}

id _getEventDictionaryForState(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)MEMORY[0x189603FC8];
  v10[0] = @"state";
  uint64_t v4 = (void *)MEMORY[0x189607968];
  id v5 = a2;
  [v4 numberWithInt:a1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = @"model";
  v11[0] = v6;
  v11[1] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dictionaryWithDictionary:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void UARPPowerLogAccessoryUnreachable(void *a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  PLLogRegisteredEvent();
}

void UARPPowerLogAssetOffered(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _getEventDictionaryForState(2LL, a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:@"activeFWVers"];

  [v7 setObject:v5 forKeyedSubscript:@"fwVersion"];
  PLLogRegisteredEvent();
}

void UARPPowerLogStagingStatus(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a2;
  _getEventDictionaryForState(3LL, a1);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v10 forKeyedSubscript:@"activeFWVers"];

  [v13 setObject:v9 forKeyedSubscript:@"fwVersion"];
  [MEMORY[0x189607968] numberWithUnsignedInt:a4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v11 forKeyedSubscript:@"requestOffset"];

  [MEMORY[0x189607968] numberWithUnsignedInt:a5];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v12 forKeyedSubscript:@"bytesTransferred"];

  PLLogRegisteredEvent();
}

void UARPPowerLogStagingComplete(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  _getEventDictionaryForState(4LL, a1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v8 forKeyedSubscript:@"activeFWVers"];

  [v10 setObject:v7 forKeyedSubscript:@"fwVersion"];
  [MEMORY[0x189607968] numberWithInt:a4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v9 forKeyedSubscript:@"error"];

  PLLogRegisteredEvent();
}

void sub_187E04DF4(_Unwind_Exception *a1)
{
}

void sub_187E04E78(_Unwind_Exception *a1)
{
}

void sub_187E04EF0(_Unwind_Exception *a1)
{
}

void sub_187E04F60(_Unwind_Exception *a1)
{
}

void sub_187E0504C(_Unwind_Exception *a1)
{
}

void sub_187E05120(_Unwind_Exception *a1)
{
}

void sub_187E05238(_Unwind_Exception *a1)
{
}

void sub_187E052B0(_Unwind_Exception *a1)
{
}

void sub_187E05334(_Unwind_Exception *a1)
{
}

void sub_187E05648(_Unwind_Exception *a1)
{
}

void sub_187E056B8(_Unwind_Exception *a1)
{
}

void sub_187E05728(_Unwind_Exception *a1)
{
}

void sub_187E09024(_Unwind_Exception *a1)
{
}

LABEL_8:
        id v10 = 1;
LABEL_9:

        goto LABEL_13;
      }

      -[NSMutableArray removeObject:](self->_cmapDatabase, "removeObject:", v6);
    }

    id v7 = objc_alloc(&OBJC_CLASS___UARPDynamicAssetCmapMapping);
    [v4 objectForKeyedSubscript:@"sections"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:](v7, "initWithEvents:appleModelNumber:", v8, v5);

    if (v9) {
      -[NSMutableArray addObject:](self->_cmapDatabase, "addObject:", v9);
    }

    goto LABEL_8;
  }

  uint64_t v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapDatabase addCmapMapping:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

void sub_187E0A048(_Unwind_Exception *a1)
{
}

uint64_t UARPPlatformEndpointRequestAppleInfoProperty(void *a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id v6 = a1;
  int v11 = uarpHtonl(a3);
  uint64_t v7 = [v6 uarpEndpoint];

  uint64_t v8 = [v5 uarpEndpoint];
  id v9 = uarpOuiAppleGenericFeatures();
  else {
    return 0LL;
  }
}

uint64_t UARPPlatformControllerInit(void *a1)
{
  id v1 = a1;
  bzero((void *)[v1 uarpEndpoint], 0x260uLL);
  uint64_t v8 = 4LL;
  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v6 = 0x800000008000LL;
  int v7 = 0x8000;
  v5[30] = 0u;
  uint64_t v2 = objc_msgSend( v1,  "uarpVendorExtension",  0,  0,  0,  0,  fCoreUARPLayer3SendMessage,  fCoreUARPLayer3DataTransferPause,  fCoreUARPLayer3DataTransferPauseAck,  fCoreUARPLayer3DataTransferResume,  fCoreUARPLayer3DataTransferResumeAck,  fCoreUARPLayer3SuperBinaryOffered,  fCoreUARPLayer3DynamicAssetOffered,  fCoreUARPLayer3ApplyStagedAssets,  fCoreUARPLayer3ApplyStagedAssetsResponse,  fCoreUARPLayer3ManufacturerName,  fCoreUARPLayer3ManufacturerNameResponse,  fCoreUARPLayer3ModelName,  fCoreUARPLayer3ModelNameResponse,  fCoreUARPLayer3SerialNumber,  fCoreUARPLayer3SerialNumberResponse,  fCoreUARPLayer3HardwareVersion,  fCoreUARPLayer3HardwareVersionResponse,  fCoreUARPLayer3ActiveFirmwareVersion2,  fCoreUARPLayer3ActiveFirmwareVersionResponse,  fCoreUARPLayer3StagedFirmwareVersion2,  fCoreUARPLayer3StagedFirmwareVersionResponse,  fCoreUARPLayer3LastError,  fCoreUARPLayer3LastErrorResponse,  fCoreUARPLayer3StatisticsResponse,  fCoreUARPLayer3AssetSolicitation,  fCoreUARPLayer3RescindAllAssets,  fCoreUARPLayer3RescindAllAssetsAck,  fCoreUARPLayer3WatchdogSet,  fCoreUARPLayer3WatchdogCancel,  fCoreUARPLayer3ProtocolVersion,  0,  fCoreUARPLayer3FriendlyNameResponse,  0,  0,  uarpPlatformDarwinHashInfo,  uarpPlatformDarwinHashInit,  uarpPlatformDarwinHashUpdate,  uarpPlatformDarwinHashFinal,  uarpPlatformDarwinHashLog,  0,  fCoreUARPLayer3AUDLogError,  fCoreUARPLayer3AUDLogInfo,  fCoreUARPLayer3AUDLogDebug,
         fCoreUARPLayer3AUDLogFault,
         0LL,
         fUarpLayer3DownstreamReachable,
         fUarpLayer3DownstreamUnreachable,
         0LL,
         fUarpLayer3DownstreamRecvMessage,
         0LL,
         fCoreUARPLayer3VendorSpecificRecvMsg,
         fCoreUARPLayer3VendorSpecificCheckExpectedResponse,
         fCoreUARPLayer3VendorSpecificCheckValidToSend,
         fCoreUARPLayer3VendorSpecificExceededRetries,
         0LL,
         0LL,
         0LL);
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 12_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_OWORD *)(v2 + 20_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(_OWORD *)(v2 + 256) = 0u;
  *(_OWORD *)(v2 + 272) = 0u;
  *(_OWORD *)(v2 + 28_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v2 + 304) = 0u;
  *(_OWORD *)(v2 + 320) = 0u;
  *(_OWORD *)(v2 + 336) = 0u;
  *(_OWORD *)(v2 + 352) = 0u;
  *(_OWORD *)(v2 + 36_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v2 + 384) = 0u;
  *(_OWORD *)(v2 + 400) = 0u;
  *(_OWORD *)(v2 + 416) = 0u;
  *(_OWORD *)(v2 + 432) = 0u;
  *(_OWORD *)(v2 + 44_Block_object_dispose(va, 8) = 0u;
  *(void *)(v2 + 464) = 0LL;
  *(void *)([v1 uarpVendorExtension] + 16) = fCoreUARPLayer3AppleModelNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 32) = fCoreUARPLayer3HardwareFusingTypeResponse;
  *(void *)([v1 uarpVendorExtension] + 4_Block_object_dispose(va, 8) = fCoreUARPLayer3ManifestPrefixResponse;
  *(void *)([v1 uarpVendorExtension] + 64) = fCoreUARPLayer3BoardIDResponse;
  *(void *)([v1 uarpVendorExtension] + 80) = fCoreUARPLayer3ChipIDResponse;
  *(void *)([v1 uarpVendorExtension] + 96) = fCoreUARPLayer3ChipRevisionResponse;
  *(void *)([v1 uarpVendorExtension] + 112) = fCoreUARPLayer3ECIDResponse;
  *(void *)([v1 uarpVendorExtension] + 144) = fCoreUARPLayer3SecurityDomainResponse;
  *(void *)([v1 uarpVendorExtension] + 160) = fCoreUARPLayer3SecurityModeResponse;
  *(void *)([v1 uarpVendorExtension] + 176) = fCoreUARPLayer3ProductionModeResponse;
  *(void *)([v1 uarpVendorExtension] + 192) = fCoreUARPLayer3ChipEpochResponse;
  *(void *)([v1 uarpVendorExtension] + 20_Block_object_dispose(va, 8) = fCoreUARPLayer3EnableMixMatchResponse;
  *(void *)([v1 uarpVendorExtension] + 224) = fCoreUARPLayer3SocLiveNonceResponse;
  *(void *)([v1 uarpVendorExtension] + 240) = fCoreUARPLayer3PrefixNeedsLogicalUnitNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 256) = fCoreUARPLayer3SuffixNeedsLogicalUnitNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 304) = fCoreUARPLayer3RequiresPersonalizationResponse;
  uint64_t v3 = uarpPlatformEndpointInit2( (char *)[v1 uarpEndpoint],  (uint64_t)v1,  2u,  (__int128 *)&v6,  v5,  objc_msgSend(v1, "uarpVendorExtension"));

  return v3;
}

uint64_t fCoreUARPLayer3SendMessage(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t v8 = (objc_class *)MEMORY[0x189603F48];
      id v9 = a2;
      id v10 = a1;
      int v11 = (void *)[[v8 alloc] initWithBytes:a3 length:a4];
      [v10 sendMessageToAccessory:v9 uarpMsg:v11];
      uint64_t v12 = [v10 uarpEndpoint];

      uint64_t v13 = [v9 uarpEndpoint];
      uarpPlatformEndpointSendMessageComplete(v12, v13, a3);

      return 0LL;
    }
  }

  return result;
}

uint64_t fCoreUARPLayer3DataTransferPause(void *a1, uint64_t a2)
{
  return 0LL;
}

uint64_t fCoreUARPLayer3DataTransferPauseAck(void *a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      [a1 transferPauseAck:a2];
      return 0LL;
    }
  }

  return result;
}

uint64_t fCoreUARPLayer3DataTransferResume(void *a1, uint64_t a2)
{
  return 0LL;
}

uint64_t fCoreUARPLayer3DataTransferResumeAck(void *a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      [a1 transferResumeAck:a2];
      return 0LL;
    }
  }

  return result;
}

void fCoreUARPLayer3DynamicAssetOffered(void *a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  int v7 = (UARPUploaderAsset *)*(id *)(a3 + 704);
  uint64_t v8 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *(char *)(a3 + 48),  *(char *)(a3 + 49),  *(char *)(a3 + 50),  *(char *)(a3 + 51));
  if (v7)
  {
    -[UARPUploaderAsset setUarpPlatformAsset:](v7, "setUarpPlatformAsset:", a3);
    goto LABEL_10;
  }

  getOSLogToken();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v33 = 138412290;
    uint64_t v34 = v8;
    _os_log_impl(&dword_187DC0000, v9, OS_LOG_TYPE_INFO, "Unsolicited dynamic asset %@", (uint8_t *)&v33, 0xCu);
  }

  uarpDynamicAssetURL(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    getOSLogToken();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3DynamicAssetOffered_cold_3();
    }
  }

  uint64_t v12 = -[UARPAssetID initWithLocationType:assetTag:url:]( objc_alloc(&OBJC_CLASS___UARPAssetID),  "initWithLocationType:assetTag:url:",  10LL,  v8,  v10);
  uint64_t v13 = -[UARPAsset initWithID:](objc_alloc(&OBJC_CLASS___UARPAsset), "initWithID:", v12);
  UARPPlatformControllerAssetSetupCallbacksInbound((uint64_t)&v33);
  int v7 = -[UARPUploaderAsset initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:]( objc_alloc(&OBJC_CLASS___UARPUploaderAsset),  "initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:",  v13,  v6,  &v33,  1LL);
  [v6 addRxDynamicAsset:v7];

  -[UARPUploaderAsset setUarpPlatformAsset:](v7, "setUarpPlatformAsset:", a3);
  if (v10)
  {
LABEL_10:
    getOSLogToken();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412290;
      uint64_t v34 = v8;
      _os_log_impl(&dword_187DC0000, v14, OS_LOG_TYPE_INFO, "Accept dynamic asset %@", (uint8_t *)&v33, 0xCu);
    }

    uint64_t v15 = uarpPlatformEndpointAssetAccept( [v5 uarpEndpoint],  objc_msgSend(v6, "uarpEndpoint"),  (uint64_t)-[UARPUploaderAsset uarpAsset](v7, "uarpAsset"),  (uint64_t)v7,  (_OWORD *)-[UARPUploaderAsset uarpCallbacks](v7, "uarpCallbacks"));
    if ((_DWORD)v15)
    {
      uint64_t v16 = v15;
      getOSLogToken();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3DynamicAssetOffered_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
LABEL_15:

      goto LABEL_16;
    }

    goto LABEL_16;
  }

  getOSLogToken();
  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v33 = 138412290;
    uint64_t v34 = v8;
    _os_log_impl(&dword_187DC0000, v24, OS_LOG_TYPE_INFO, "Deny dynamic asset %@", (uint8_t *)&v33, 0xCu);
  }

  uint64_t v25 = uarpPlatformEndpointAssetDeny( [v5 uarpEndpoint],  objc_msgSend(v6, "uarpEndpoint"),  (uint64_t)-[UARPUploaderAsset uarpAsset](v7, "uarpAsset"),  2560,  (uint64_t)v7,  (_OWORD *)-[UARPUploaderAsset uarpCallbacks](v7, "uarpCallbacks"));
  if ((_DWORD)v25)
  {
    uint64_t v26 = v25;
    getOSLogToken();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3DynamicAssetOffered_cold_1(v26, v17, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_15;
  }

LABEL_16:
}

LABEL_17:
}

uint64_t fCoreUARPLayer3ApplyStagedAssets()
{
  return 52LL;
}

uint64_t fCoreUARPLayer3ApplyStagedAssetsResponse(void *a1, uint64_t a2, int a3)
{
  uint64_t v3 = 30LL;
  if (a1 && a2)
  {
    unsigned __int16 v4 = a3 - 1;
    [a1 applyStagedAssetStatus:a2 status:v4];
    return 0LL;
  }

  return v3;
}

uint64_t fCoreUARPLayer3ManufacturerName()
{
  return 52LL;
}

void fCoreUARPLayer3ManufacturerNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1)
  {
    if (a2)
    {
      int v7 = (objc_class *)NSString;
      id v8 = a2;
      id v9 = a1;
      id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
      [v8 setManufacturerName:v10];
      [v9 updateManufacturerName:v10 remoteEndpoint:v8];
    }
  }

uint64_t fCoreUARPLayer3ModelName()
{
  return 52LL;
}

void fCoreUARPLayer3ModelNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1)
  {
    if (a2)
    {
      int v7 = (objc_class *)NSString;
      id v8 = a2;
      id v9 = a1;
      id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
      [v8 setModelName:v10];
      [v9 updateModelName:v10 remoteEndpoint:v8];
    }
  }

uint64_t fCoreUARPLayer3SerialNumber()
{
  return 52LL;
}

void fCoreUARPLayer3SerialNumberResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1)
  {
    if (a2)
    {
      int v7 = (objc_class *)NSString;
      id v8 = a2;
      id v9 = a1;
      id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
      [v8 setSerialNumber:v10];
      [v9 updateSerialNumber:v10 remoteEndpoint:v8];
    }
  }

uint64_t fCoreUARPLayer3HardwareVersion()
{
  return 52LL;
}

void fCoreUARPLayer3HardwareVersionResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1)
  {
    if (a2)
    {
      int v7 = (objc_class *)NSString;
      id v8 = a2;
      id v9 = a1;
      id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
      [v8 setHardwareVersion:v10];
      [v9 updateHardwareVersion:v10 remoteEndpoint:v8];
    }
  }

void fCoreUARPLayer3FriendlyNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v10 = a1;
  id v7 = a2;
  if (v10 && v7)
  {
    if (a3 && a4) {
      id v8 = (__CFString *)[objc_alloc(NSString) initWithBytes:a3 length:a4 encoding:4];
    }
    else {
      id v8 = @"Unknown";
    }
    id v9 = v8;
    [v7 setFriendlyName:v8];
    [v10 updateFriendlyName:v9 remoteEndpoint:v7];
  }
}

uint64_t fCoreUARPLayer3ActiveFirmwareVersion2()
{
  return 52LL;
}

void fCoreUARPLayer3ActiveFirmwareVersionResponse(void *a1, void *a2, unsigned int *a3)
{
  if (a1 && a2)
  {
    id v5 = (void *)MEMORY[0x189607940];
    uint64_t v6 = *a3;
    uint64_t v7 = a3[1];
    uint64_t v8 = a3[2];
    id v9 = a2;
    id v10 = a1;
    objc_msgSend(v5, "stringWithFormat:", @"%u.%u.%u", v6, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a3[3]) {
      objc_msgSend(v12, "appendFormat:", @".%u", a3[3]);
    }
    int v11 = -[UARPAssetVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithVersionString:",  v12);
    [v9 setFirmwareVersion:v11];

    [v10 updateActiveFirmwareVersion:v12 remoteEndpoint:v9];
  }

uint64_t fCoreUARPLayer3StagedFirmwareVersion2()
{
  return 52LL;
}

void fCoreUARPLayer3StagedFirmwareVersionResponse(void *a1, void *a2, unsigned int *a3)
{
  if (a1 && a2)
  {
    id v5 = (void *)MEMORY[0x189607940];
    uint64_t v6 = *a3;
    uint64_t v7 = a3[1];
    uint64_t v8 = a3[2];
    id v9 = a2;
    id v10 = a1;
    objc_msgSend(v5, "stringWithFormat:", @"%u.%u.%u", v6, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a3[3]) {
      objc_msgSend(v12, "appendFormat:", @".%u", a3[3]);
    }
    int v11 = -[UARPAssetVersion initWithVersionString:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithVersionString:",  v12);
    [v9 setStagedFirmwareVersion:v11];

    [v10 updateStagedFirmwareVersion:v12 remoteEndpoint:v9];
  }

uint64_t fCoreUARPLayer3LastError()
{
  return 52LL;
}

void *fCoreUARPLayer3LastErrorResponse(void *a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return (void *)[a1 updateLastError:*(unsigned int *)(a3 + 4) remoteEndpoint:a2];
    }
  }

  return a1;
}

void fCoreUARPLayer3StatisticsResponse(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
    {
      id v5 = a2;
      id v6 = a1;
      uint64_t v7 = -[UARPStats initWithStatistics:](objc_alloc(&OBJC_CLASS___UARPStats), "initWithStatistics:", a3);
      [v6 updateStatistics:v7 remoteEndpoint:v5];
    }
  }

uint64_t fCoreUARPLayer3AssetSolicitation()
{
  return 52LL;
}

uint64_t fCoreUARPLayer3RescindAllAssetsAck(void *a1, const char *a2)
{
  return [a1 rescindStagedAssetsAck:a2 asset:0];
}

uint64_t fCoreUARPLayer3WatchdogSet(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      [a2 setLayer2WatchdogTimer:a1 timeoutMS:a3];
      return 0LL;
    }
  }

  return result;
}

uint64_t fCoreUARPLayer3WatchdogCancel(uint64_t a1, void *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      [a2 cancelLayer2WatchdogTimer];
      return 0LL;
    }
  }

  return result;
}

void *fCoreUARPLayer3ProtocolVersion(void *a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return (void *)[a1 protocolVersionSelected:a2 protocolVersion:a3];
    }
  }

  return a1;
}

void fCoreUARPLayer3AUDLogError( void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogError_logBuffer, 0x200uLL, a3, &a9);
    [v11 logTokenForCategory:a2];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3AUDLogError_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

void fCoreUARPLayer3AUDLogInfo( void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogInfo_logBuffer, 0x200uLL, a3, &a9);
    [v11 logTokenForCategory:a2];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = fCoreUARPLayer3AUDLogInfo_logBuffer;
      _os_log_impl(&dword_187DC0000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }

void fCoreUARPLayer3AUDLogDebug( void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogDebug_logBuffer, 0x200uLL, a3, &a9);
    [v11 logTokenForCategory:a2];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3AUDLogDebug_cold_1(v12, v13, v14);
    }
  }

void fCoreUARPLayer3AUDLogFault( void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogFault_logBuffer, 0x200uLL, a3, &a9);
    [v11 logTokenForCategory:a2];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      fCoreUARPLayer3AUDLogFault_cold_1(v12);
    }
  }

uint64_t fUarpLayer3DownstreamReachable(void *a1, void *a2, uint64_t a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      id v6 = a2;
      id v7 = a1;
      id v8 = -[UARPUploaderEndpoint initDownstreamWithDirectEndpoint:layer2Context:uploader:]( objc_alloc(&OBJC_CLASS___UARPUploaderEndpoint),  "initDownstreamWithDirectEndpoint:layer2Context:uploader:",  v6,  a3,  v7);
      [v6 addDownstreamEndpoint:v8];
      [v6 accessory];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      [v7 accessoryReachable:v9 remoteEndpoint:v8 error:0];
      return 0LL;
    }
  }

  return result;
}

uint64_t fUarpLayer3DownstreamUnreachable(void *a1, void *a2, void *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      id v6 = a3;
      id v7 = a2;
      id v8 = a1;
      [v7 accessory];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 accessoryUnreachable:v9 remoteEndpoint:v6 error:0];

      [v7 removeDownstreamEndpoint:v6];
      return 0LL;
    }
  }

  return result;
}

uint64_t fUarpLayer3DownstreamRecvMessage(void *a1, uint64_t a2, void *a3, uint64_t a4, unsigned int a5)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      id v8 = (void *)MEMORY[0x189603F48];
      uint64_t v9 = a5;
      id v10 = a3;
      id v11 = a1;
      [v8 dataWithBytes:a4 length:v9];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 recvDataFromEndpoint:v10 data:v12 error:0];

      return 0LL;
    }
  }

  return result;
}

uint64_t fCoreUARPLayer3VendorSpecificRecvMsg( void *a1, void *a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  if (!a1 || !a2) {
    return 30LL;
  }
  id v11 = a2;
  uint64_t v12 = [a1 uarpEndpoint];
  uint64_t v13 = [v11 uarpEndpoint];

  return uarpApplePlatformEndpointRecvMessage(v12, v13, a3, a4, a5, a6);
}

BOOL fCoreUARPLayer3VendorSpecificCheckExpectedResponse( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (!a1 || !a2) {
    return 0LL;
  }
  id v11 = a2;
  uint64_t v12 = [a1 uarpEndpoint];
  uint64_t v13 = [v11 uarpEndpoint];

  return uarpApplePlatformMessageCheckExpectedResponse(v12, v13, a3, a4, a5, a6);
}

uint64_t fCoreUARPLayer3VendorSpecificCheckValidToSend(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (!a1 || !a2) {
    return 0LL;
  }
  id v7 = a2;
  uint64_t v8 = [a1 uarpEndpoint];
  uint64_t v9 = [v7 uarpEndpoint];

  return uarpApplePlatformMessageCheckValidToSend(v8, v9, a3, a4);
}

uint64_t fCoreUARPLayer3VendorSpecificExceededRetries(uint64_t result, void *a2, uint64_t a3, unsigned int a4)
{
  if (result)
  {
    if (a2)
    {
      id v6 = (void *)result;
      id v7 = a2;
      uint64_t v8 = [v6 uarpEndpoint];
      uint64_t v9 = [v7 uarpEndpoint];

      return uarpApplePlatformMessageExceededRetries(v8, v9, a3, a4);
    }
  }

  return result;
}

void fCoreUARPLayer3AppleModelNumberResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v11 = a1;
  id v7 = a2;
  if (v11 && v7)
  {
    if (a3 && a4)
    {
      uint64_t v8 = (void *)[objc_alloc(NSString) initWithBytes:a3 length:a4 encoding:4];
LABEL_8:
      [v7 setAppleModelNumber:v8];
      [v11 updateAppleModelNumber:v8 remoteEndpoint:v7];

      goto LABEL_9;
    }

    if (!*(_DWORD *)([v7 uarpOptions] + 24))
    {
      [v7 accessory];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 getID];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 modelIdentifier];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }

LABEL_9:
}
}

void fCoreUARPLayer3HardwareFusingTypeResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v10 = a1;
  id v7 = a2;
  if (v10 && v7)
  {
    if (a3 && a4)
    {
      uint64_t v8 = [objc_alloc(NSString) initWithBytes:a3 length:a4 encoding:4];
LABEL_8:
      uint64_t v9 = (void *)v8;
      [v7 setHwFusingType:v8];
      [v10 updateHardwareFusingType:v9 remoteEndpoint:v7];

      goto LABEL_9;
    }

    if (!*(_DWORD *)([v7 uarpOptions] + 24))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPAccessoryHardwareFusingToString(2uLL));
      goto LABEL_8;
    }
  }

void fCoreUARPLayer3ManifestPrefixResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1)
  {
    if (a2)
    {
      id v7 = (objc_class *)NSString;
      id v8 = a2;
      id v9 = a1;
      id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
      [v9 updateManifestPrefix:v10 remoteEndpoint:v8];
    }
  }

void *fCoreUARPLayer3BoardIDResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 8)
    {
      uint64_t v4 = *(void *)a3;
    }

    else if (a4 == 4)
    {
      uint64_t v4 = *a3;
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    return (void *)[a1 updateBoardID:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3ChipIDResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateChipID:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3ChipRevisionResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateChipRevision:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3ECIDResponse(void *a1, const char *a2, uint64_t *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 8) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateECID:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3SecurityDomainResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateSecurityDomain:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3SecurityModeResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateSecurityMode:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3ProductionModeResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateProductionMode:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3ChipEpochResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0LL;
    }
    return (void *)[a1 updateChipEpoch:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3EnableMixMatchResponse(void *a1, const char *a2, _BYTE *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateEnableMixMatch:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3SocLiveNonceResponse(void *a1, const char *a2, _BYTE *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateSocLiveNonce:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3PrefixNeedsLogicalUnitNumberResponse(void *a1, const char *a2, _BYTE *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updatePrefixNeedsLogicalUnitNumber:v4 remoteEndpoint:a2];
  }

  return a1;
}

void *fCoreUARPLayer3SuffixNeedsLogicalUnitNumberResponse(void *a1, const char *a2, _BYTE *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateSuffixNeedsLogicalUnitNumber:v4 remoteEndpoint:a2];
  }

  return a1;
}

uint64_t UARPPlatformControllerAddAccessory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = uarpPlatformRemoteEndpointAdd( [a1 uarpEndpoint],  objc_msgSend(v3, "uarpEndpoint"),  (__int128 *)objc_msgSend(v3, "uarpOptions"),  (uint64_t)v3);

  return v4;
}

uint64_t UARPPlatformControllerRemoveAccessory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformRemoteEndpointRemove(v4, v5);
}

uint64_t UARPPlatformControllerRecvMessage(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  getOSLogToken();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    UARPPlatformControllerRecvMessage_cold_1();
  }

  uint64_t v9 = [v7 uarpEndpoint];
  uint64_t v10 = [v5 uarpEndpoint];
  id v11 = v6;
  uint64_t v12 = uarpPlatformEndpointRecvMessage( v9,  v10,  (unsigned __int16 *)[v11 mutableBytes],  objc_msgSend(v11, "length"));

  return v12;
}

id getOSLogToken()
{
  uint64_t v0 = (void *)getOSLogToken__log;
  if (!getOSLogToken__log)
  {
    os_log_t v1 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    uint64_t v2 = (void *)getOSLogToken__log;
    getOSLogToken__log = (uint64_t)v1;

    uint64_t v0 = (void *)getOSLogToken__log;
  }

  return v0;
}

uint64_t UARPPlatformControllerLayer3WatchDogExpired(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointWatchDogExpired(v4, v5);
}

uint64_t UARPPlatformControllerQueryProperty(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 3LL;
  switch(a3)
  {
    case 0LL:
      uint64_t v9 = 1LL;
      goto LABEL_12;
    case 1LL:
      uint64_t v9 = 2LL;
      goto LABEL_12;
    case 2LL:
      uint64_t v9 = 3LL;
      goto LABEL_12;
    case 3LL:
      uint64_t v9 = 4LL;
      goto LABEL_12;
    case 4LL:
      uint64_t v9 = 5LL;
      goto LABEL_12;
    case 5LL:
      uint64_t v9 = 6LL;
      goto LABEL_12;
    case 6LL:
      uint64_t v9 = 7LL;
      goto LABEL_12;
    case 11LL:
      uint64_t v10 = 1LL;
      goto LABEL_40;
    case 12LL:
      uint64_t v10 = 2LL;
      goto LABEL_40;
    case 13LL:
      uint64_t v9 = 9LL;
LABEL_12:
      [v6 queueInfoProperty:v9];
      goto LABEL_41;
    case 14LL:
      uint64_t v10 = 3LL;
      goto LABEL_40;
    case 15LL:
      uint64_t v10 = 4LL;
      goto LABEL_40;
    case 16LL:
      uint64_t v10 = 5LL;
      goto LABEL_40;
    case 17LL:
      uint64_t v10 = 6LL;
      goto LABEL_40;
    case 18LL:
      uint64_t v10 = 7LL;
      goto LABEL_40;
    case 19LL:
      uint64_t v10 = 8LL;
      goto LABEL_40;
    case 20LL:
      uint64_t v10 = 9LL;
      goto LABEL_40;
    case 21LL:
      uint64_t v10 = 10LL;
      goto LABEL_40;
    case 22LL:
      uint64_t v10 = 11LL;
      goto LABEL_40;
    case 23LL:
      uint64_t v10 = 12LL;
      goto LABEL_40;
    case 24LL:
      uint64_t v10 = 13LL;
      goto LABEL_40;
    case 25LL:
      uint64_t v10 = 14LL;
      goto LABEL_40;
    case 26LL:
      uint64_t v10 = 15LL;
      goto LABEL_40;
    case 27LL:
      uint64_t v10 = 16LL;
      goto LABEL_40;
    case 28LL:
      uint64_t v10 = 17LL;
      goto LABEL_40;
    case 29LL:
      uint64_t v10 = 18LL;
      goto LABEL_40;
    case 30LL:
      uint64_t v10 = 19LL;
      goto LABEL_40;
    case 31LL:
      uint64_t v10 = 20LL;
      goto LABEL_40;
    case 32LL:
      uint64_t v10 = 21LL;
      goto LABEL_40;
    case 33LL:
      uint64_t v10 = 22LL;
      goto LABEL_40;
    case 34LL:
      uint64_t v10 = 23LL;
      goto LABEL_40;
    case 36LL:
      uint64_t v10 = 24LL;
      goto LABEL_40;
    case 37LL:
      uint64_t v10 = 25LL;
      goto LABEL_40;
    case 38LL:
      uint64_t v10 = 26LL;
      goto LABEL_40;
    case 39LL:
      uint64_t v10 = 27LL;
      goto LABEL_40;
    case 40LL:
      uint64_t v10 = 28LL;
      goto LABEL_40;
    case 41LL:
      uint64_t v10 = 29LL;
LABEL_40:
      [v6 queueAppleProperty:v10];
LABEL_41:
      uint64_t v8 = 0LL;
      break;
    default:
      break;
  }

  return v8;
}

uint64_t UARPPlatformControllerOfferFirmwareAsset(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_msgSend( v6,  "txFirmwareAssets",  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  fCoreUARPLayer3AssetGetBytesAtOffset,  0,  0,  fCoreUARPLayer3AssetRescindedAck,  fCoreUARPLayer3AssetCorrupt,  fCoreUARPLayer3AssetOrphan,  fCoreUARPLayer3AssetRelease,  fCoreUARPLayer3AssetProcessingNotification,  0,  0,  0,  0,  0,  0,  0,  0,  0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  if (v9)
  {
    getOSLogToken();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v6;
      _os_log_impl( &dword_187DC0000,  v10,  OS_LOG_TYPE_INFO,  "%s: Firmware already in flight. Do not offet asset %@ to endpoint %@",  buf,  0x20u);
    }

    uint64_t v11 = 16LL;
  }

  else
  {
    uint64_t v13 = -[UARPUploaderAsset initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:]( objc_alloc(&OBJC_CLASS___UARPUploaderAsset),  "initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:",  v7,  v6,  &v23,  0LL);
    uint64_t v10 = (os_log_s *)v13;
    if (v13)
    {
      -[UARPUploaderAsset processHostTLVs](v13, "processHostTLVs");
      int v14 = -[os_log_s invalidHwRevision](v10, "invalidHwRevision");
      getOSLogToken();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          UARPPlatformControllerOfferFirmwareAsset_cold_2();
        }

        uint64_t v11 = 57LL;
      }

      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = -[os_log_s minimumHostBatteryLevel](v10, "minimumHostBatteryLevel");
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
          __int16 v26 = 2112;
          uint64_t v27 = v10;
          __int16 v28 = 2048;
          uint64_t v29 = v18;
          _os_log_impl( &dword_187DC0000,  v16,  OS_LOG_TYPE_INFO,  "%s: Minimum Host Battery Level for asset <%@> is %lu",  buf,  0x20u);
        }

        getOSLogToken();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = -[os_log_s triggerHostBatteryLevel](v10, "triggerHostBatteryLevel");
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
          __int16 v26 = 2112;
          uint64_t v27 = v10;
          __int16 v28 = 2048;
          uint64_t v29 = v20;
          _os_log_impl( &dword_187DC0000,  v19,  OS_LOG_TYPE_INFO,  "%s: Trigger Host Battery Level for asset <%@> is %lu",  buf,  0x20u);
        }

        uarpPlatformEndpointPrepareSuperBinary( [v5 uarpEndpoint],  objc_msgSend(v6, "uarpEndpoint"),  (uint64_t)v10,  -[os_log_s uarpCallbacks](v10, "uarpCallbacks"));
        uint64_t v11 = v21;
        if ((_DWORD)v21)
        {
          getOSLogToken();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            UARPPlatformControllerOfferFirmwareAsset_cold_3(v11);
          }
        }

        else
        {
          [v6 addTxFirmwareAsset:v10];
          UARPPlatformControllerReofferFirmwareAsset(v5, v6);
        }
      }
    }

    else
    {
      getOSLogToken();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        UARPPlatformControllerOfferFirmwareAsset_cold_1();
      }

      uint64_t v11 = 11LL;
    }
  }

  return v11;
}

void UARPPlatformControllerReofferFirmwareAsset(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  [v4 idealTxFirmwareAsset];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  getOSLogToken();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v14 = 136315650;
      uint64_t v15 = "UARPPlatformControllerReofferFirmwareAsset";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_187DC0000, v6, OS_LOG_TYPE_INFO, "%s: [Re-]Offer firmware %@ to %@", (uint8_t *)&v14, 0x20u);
    }

    unsigned int v8 = uarpPlatformEndpointOfferAsset([v3 uarpEndpoint], objc_msgSend(v4, "uarpEndpoint"), (uint64_t)v5);
    getOSLogToken();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPPlatformControllerReofferFirmwareAsset_cold_1(v8);
    }

    switch(v8)
    {
      case ';':
        [v5 asset];
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 14LL;
        goto LABEL_15;
      case '<':
        [v5 asset];
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 12LL;
        goto LABEL_15;
      case '=':
        [v5 asset];
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 13LL;
        goto LABEL_15;
      case '>':
        [v5 asset];
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 11LL;
LABEL_15:
        [v10 assetStagingComplete:v11 asset:v12 status:v13];
        goto LABEL_16;
      default:
        if (!v8) {
          objc_msgSend( v5,  "setUarpPlatformAsset:",  uarpPlatformAssetFindByAssetContext(objc_msgSend(v3, "uarpEndpoint"), (uint64_t)v5));
        }
        goto LABEL_17;
    }
  }

  if (v7)
  {
    int v14 = 136315394;
    uint64_t v15 = "UARPPlatformControllerReofferFirmwareAsset";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_187DC0000, v6, OS_LOG_TYPE_INFO, "%s: Do not Offer firmware to %@", (uint8_t *)&v14, 0x16u);
  }

uint64_t UARPPlatformControllerNoFirmwareAssetAvailable(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t updated = uarpPlatformNoFirmwareUpdateAvailable([a1 uarpEndpoint], objc_msgSend(v3, "uarpEndpoint"));

  return updated;
}

uint64_t UARPPlatformControllerRescindAsset(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  [v5 findMatch:a3];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 uarpEndpoint];

  uint64_t v9 = [v5 uarpEndpoint];
  uint64_t v10 = uarpPlatformEndpointRescindAsset(v8, v9, (uint64_t)v7);

  return v10;
}

uint64_t UARPPlatformControllerResindAllAssets(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointRescindAllAssets(v4, v5);
}

uint64_t UARPPlatformControllerApplyStagedAssets(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointApplyStagedAssets(v4, v5);
}

uint64_t UARPPlatformControllerPauseAssetTransfers(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointPauseAssetTransfers(v4, v5);
}

uint64_t UARPPlatformControllerResumeAssetTransfers(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointResumeAssetTransfers(v4, v5);
}

UARPUploaderAsset *UARPPlatformControllerPrepareSolicitedDynamicAsset( uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = -[UARPUploaderAsset initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:]( objc_alloc(&OBJC_CLASS___UARPUploaderAsset),  "initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:",  v7,  v8,  v11,  a4);

  [v8 addRxDynamicAsset:v9];
  return v9;
}

double UARPPlatformControllerAssetSetupCallbacksInbound(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(void *)a1 = fCoreUARPLayer3AssetReady;
  *(void *)(a1 + _Block_object_dispose(va, 8) = fCoreUARPLayer3AssetMetaDataTLV;
  *(void *)(a1 + 16) = fCoreUARPLayer3AssetMetaDataComplete;
  *(void *)(a1 + 24) = fCoreUARPLayer3AssetMetaDataProcessingError;
  *(void *)(a1 + 32) = fCoreUARPLayer3PayloadReady;
  *(void *)(a1 + 40) = fCoreUARPLayer3PayloadMetaDataTLV;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = fCoreUARPLayer3PayloadMetaDataComplete;
  *(void *)(a1 + 56) = fCoreUARPLayer3PayloadMetaDataProcessingError;
  *(void *)(a1 + 64) = fCoreUARPLayer3PayloadData;
  *(void *)(a1 + 72) = fCoreUARPLayer3PayloadDataComplete;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = fCoreUARPLayer3AssetGetBytesAtOffset;
  *(void *)(a1 + 96) = fCoreUARPLayer3AssetSetBytesAtOffset;
  *(void *)(a1 + 104) = fCoreUARPLayer3AssetRescinded;
  *(void *)(a1 + 112) = fCoreUARPLayer3AssetRescindedAck;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(va, 8) = 0u;
  *(void *)(a1 + 120) = fCoreUARPLayer3AssetCorrupt;
  *(void *)(a1 + 12_Block_object_dispose(va, 8) = fCoreUARPLayer3AssetOrphan;
  *(void *)(a1 + 136) = fCoreUARPLayer3AssetRelease;
  *(void *)(a1 + 152) = fCoreUARPLayer3AssetProcessingNotificationAck;
  *(void *)(a1 + 160) = fCoreUARPLayer3AssetPreProcessingNotification;
  *(void *)(a1 + 176) = fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t UARPPlatformControllerSolicitDynamicAsset(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  [v7 asset];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 id];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 tag];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = [v10 char1];

  [v8 id];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 tag];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v20) = [v12 char2];

  [v8 id];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 tag];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v20) = [v14 char3];

  [v8 id];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 tag];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v20) = [v16 char4];

  uarpPlatformEndpointPrepareSolicitedDynamicAsset( [v5 uarpEndpoint],  objc_msgSend(v6, "uarpEndpoint"),  (uint64_t)v7,  &v20,  objc_msgSend(v7, "uarpCallbacks"));
  uint64_t v18 = v17;
  if (!(_DWORD)v17) {
    uint64_t v18 = uarpPlatformEndpointSolicitDynamicAsset( [v5 uarpEndpoint],  objc_msgSend(v6, "uarpEndpoint"),  &v20,  (uint64_t)v7);
  }

  return v18;
}

uint64_t UARPPlatformControllerOfferDynamicAsset(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  __int128 v26 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v21 = 0u;
  uint64_t v19 = 0LL;
  memset(v18, 0, sizeof(v18));
  int v20 = fCoreUARPLayer3AssetGetBytesAtOffset;
  uint64_t v22 = fCoreUARPLayer3AssetRescindedAck;
  __int128 v23 = fCoreUARPLayer3AssetCorrupt;
  __int16 v24 = fCoreUARPLayer3AssetOrphan;
  uint64_t v25 = fCoreUARPLayer3AssetRelease;
  *(void *)&__int128 v26 = fCoreUARPLayer3AssetProcessingNotification;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = -[UARPUploaderAsset initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:]( objc_alloc(&OBJC_CLASS___UARPUploaderAsset),  "initWithUARPAsset:remoteEndpoint:callbacks:internalSolicit:",  v12,  v10,  v18,  a5);

  LOBYTE(v17) = [v11 char1];
  BYTE1(v17) = [v11 char2];
  BYTE2(v17) = [v11 char3];
  LOBYTE(v12) = [v11 char4];

  HIBYTE(v17) = (_BYTE)v12;
  uarpPlatformEndpointPrepareDynamicAsset( [v9 uarpEndpoint],  objc_msgSend(v10, "uarpEndpoint"),  (uint64_t)v13,  &v17,  (uint64_t)-[UARPUploaderAsset uarpCallbacks](v13, "uarpCallbacks"));
  uint64_t v15 = v14;
  if (!(_DWORD)v14)
  {
    [v10 addTxDynamicAsset:v13];
    uint64_t v15 = uarpPlatformEndpointOfferAsset( [v9 uarpEndpoint],  objc_msgSend(v10, "uarpEndpoint"),  (uint64_t)v13);
  }

  return v15;
}

uint64_t UarpLayer4DiscoverDownstreamEndpoints(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = a1;
  getOSLogToken();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [v3 accessory];
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_187DC0000, v5, OS_LOG_TYPE_INFO, "LAYER3.DOWNSTREAM.DISCOVERY %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v7 = [v4 uarpEndpoint];
  uint64_t v8 = uarpPlatformDownstreamEndpointDiscovery(v7, [v3 uarpEndpoint]);
  if ((_DWORD)v8)
  {
    getOSLogToken();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = uarpStatusCodeToString(v8);
      int v12 = 136315138;
      uint64_t v13 = v10;
      _os_log_impl( &dword_187DC0000,  v9,  OS_LOG_TYPE_INFO,  "uarpPlatformDownstreamEndpointDiscovery() failed, status = %s",  (uint8_t *)&v12,  0xCu);
    }
  }

  return v8;
}

void UARPPlatformControllerResolicitDynamicAssets(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_msgSend(v4, "rxDynamicAssets", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 internalSolicit] & 1) == 0
          && UARPPlatformControllerSolicitDynamicAsset(v3, v4, v10))
        {
          getOSLogToken();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            UARPPlatformControllerResolicitDynamicAssets_cold_1();
          }

          goto LABEL_14;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

uint64_t fCoreUARPLayer3AssetGetBytesAtOffset( void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, _WORD *a7)
{
  int v18 = 0;
  id v13 = a2;
  id v14 = a1;
  [a3 asset];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v14 requestBytesInRangeForAccessory:v13 asset:v15 bytes:a4 length:a5 offset:a6 bytesCopied:&v18 offsetUsed:0];

  *a7 = v18;
  return v16;
}

void fCoreUARPLayer3AssetRescindedAck(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  [a3 asset];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 rescindStagedAssetsAck:v5 asset:v7];
}

uint64_t fCoreUARPLayer3AssetRelease(void *a1, const char *a2, uint64_t a3)
{
  return [a1 assetRelease:a2 asset:a3];
}

uint64_t fCoreUARPLayer3AssetProcessingNotification(void *a1, void *a2, void *a3, __int16 a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (([v9 internalSolicit] & 1) == 0)
  {
    uint64_t v10 = UARPUploaderStagingStatusConvert(a4);
    [v9 asset];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 assetStagingComplete:v8 asset:v11 status:v10];
  }

  return 0LL;
}

uint64_t UARPUploaderStagingStatusConvert(__int16 a1)
{
  unsigned int v1 = 0;
  __int16 v2 = a1 & 0xFF00;
  switch((char)a1)
  {
    case 1:
      return v1;
    case 2:
      unsigned int v3 = ((unsigned __int16)(v2 - 256) >> 8);
      unsigned int v4 = v3 + 9;
      BOOL v5 = v3 >= 0xE;
      unsigned int v1 = 8;
      goto LABEL_5;
    case 3:
      unsigned int v6 = ((unsigned __int16)(v2 - 256) >> 8);
      unsigned int v4 = v6 + 23;
      BOOL v5 = v6 >= 0xF;
      unsigned int v1 = 5;
LABEL_5:
      if (!v5) {
        unsigned int v1 = v4;
      }
      break;
    case 4:
      unsigned int v1 = 6;
      break;
    case 5:
      unsigned int v1 = 7;
      break;
    default:
      unsigned int v1 = 2;
      break;
  }

  return v1;
}

void fCoreUARPLayer3AssetReady(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    unsigned __int16 v69 = 0;
    if (uarpPlatformEndpointAssetQueryNumberOfPayloads( [v3 uarpEndpoint],  objc_msgSend(v4, "uarpAsset"),  &v69))
    {
      getOSLogToken();
      unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3AssetReady_cold_9(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    else
    {
      [v5 setNumPayloads:v69];
      getOSLogToken();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetReady_cold_8(v5);
      }

      if (uarpPlatformEndpointAssetQueryFormatVersion( [v3 uarpEndpoint],  (_DWORD *)objc_msgSend(v5, "uarpAsset"),  &v68))
      {
        getOSLogToken();
        unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetReady_cold_7(v6, v15, v16, v17, v18, v19, v20, v21);
        }
      }

      else
      {
        [v5 setFormatVersion:v68];
        getOSLogToken();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          fCoreUARPLayer3AssetReady_cold_6(v5);
        }

        uarpPlatformEndpointAssetQueryAssetVersion( [v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  &v67);
        if (v23)
        {
          getOSLogToken();
          unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            fCoreUARPLayer3AssetReady_cold_3(v6, v24, v25, v26, v27, v28, v29, v30);
          }
        }

        else
        {
          uint64_t v31 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
          uint64_t v32 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v31,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v67.n128_u32[0],  v67.n128_u32[1],  v67.n128_u32[2],  v67.n128_u32[3]);
          [v5 setAssetVersion:v32];

          getOSLogToken();
          int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            fCoreUARPLayer3AssetReady_cold_4(v5);
          }

          unsigned int v66 = 0;
          if (uarpPlatformEndpointAssetQueryAssetLength( [v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  &v66))
          {
            getOSLogToken();
            unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
              fCoreUARPLayer3AssetReady_cold_3(v6, v34, v35, v36, v37, v38, v39, v40);
            }
          }

          else
          {
            [v5 setAssetLength:v66];
            v41 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset);
            uint64_t v42 = [v5 formatVersion];
            [v5 assetVersion];
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]( v41,  "initWithFormatVersion:assetVersion:",  v42,  v43);
            [v5 setUarpSuperBinary:v44];

            if (uarpPlatformEndpointAssetQueryTag( [v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  &v65))
            {
              getOSLogToken();
              unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
                fCoreUARPLayer3AssetReady_cold_2(v6, v45, v46, v47, v48, v49, v50, v51);
              }
            }

            else
            {
              v52 = objc_alloc(&OBJC_CLASS___UARPAssetTag);
              unsigned int v6 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( v52,  "initWithChar1:char2:char3:char4:",  (char)v65,  SBYTE1(v65),  SBYTE2(v65),  SHIBYTE(v65));
              v53 = +[UARPHeySiriModelCompact tag](&OBJC_CLASS___UARPHeySiriModelCompact, "tag");
              int v54 = -[os_log_s isEqual:](v6, "isEqual:", v53);
              uint64_t v55 = [v3 uarpEndpoint];
              uint64_t v56 = [v5 uarpAsset];
              if (v54)
              {
                if (uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(v55, v56))
                {
                  getOSLogToken();
                  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                    fCoreUARPLayer3AssetReady_cold_1(v57, v58, v59, v60, v61, v62, v63, v64);
                  }
                }
              }

              else if (uarpPlatformEndpointAssetRequestMetaData(v55, v56) == 40)
              {
                fCoreUARPLayer3AssetMetaDataComplete(v3, v5);
              }
            }
          }
        }
      }
    }
  }
}

void fCoreUARPLayer3AssetMetaDataTLV(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  if (a1 && a2 && a4 && a5)
  {
    id v8 = a2;
    uint64_t v9 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:tlvLength:tlvValue:",  a3,  a4,  a5);
    [v8 uarpSuperBinary];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 addMetaDataTLV:v9];
    getOSLogToken();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3AssetMetaDataTLV_cold_1();
    }
  }

void fCoreUARPLayer3AssetMetaDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    if ([v4 numPayloads])
    {
      [v5 setSelectedPayload:0];
      getOSLogToken();
      unsigned int v6 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetMetaDataComplete_cold_2(v5, v6);
      }

      if (uarpPlatformEndpointAssetSetPayloadIndex( (void *)[v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  (unsigned __int16)objc_msgSend(v5, "selectedPayload")))
      {
        getOSLogToken();
        uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetMetaDataComplete_cold_1(v5, v7);
        }
      }
    }

    else
    {
      UARPlatformEndpointAssetFullyReceived(v3, v5);
    }
  }
}

void fCoreUARPLayer3PayloadReady(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    if (uarpPlatformEndpointAssetPayloadVersion( [v3 uarpEndpoint],  objc_msgSend(v4, "uarpAsset"),  &v29))
    {
      getOSLogToken();
      unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3PayloadReady_cold_4(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    else
    {
      id v14 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
      unsigned int v6 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v14,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v29,  DWORD1(v29),  DWORD2(v29),  HIDWORD(v29));
      getOSLogToken();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3PayloadReady_cold_3();
      }

      if (uarpPlatformEndpointAssetPayloadTag( [v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  &v28))
      {
        getOSLogToken();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3PayloadReady_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }

      else
      {
        uint64_t v24 = objc_alloc(&OBJC_CLASS___UARPAssetTag);
        uint64_t v16 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( v24,  "initWithChar1:char2:char3:char4:",  (char)v28,  SBYTE1(v28),  SBYTE2(v28),  SHIBYTE(v28));
        getOSLogToken();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          fCoreUARPLayer3PayloadReady_cold_1();
        }

        uint64_t v26 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:writable:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithPayloadTag:assetVersion:writable:",  v16,  v6,  1LL);
        [v5 uarpSuperBinary];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 addPayload:v26];

        if (uarpPlatformEndpointPayloadRequestMetaData( [v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset")) == 40) {
          fCoreUARPLayer3PayloadMetaDataComplete(v3, v5);
        }
      }
    }
  }
}

void fCoreUARPLayer3PayloadMetaDataTLV(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  if (a1 && a2 && a4 && a5)
  {
    id v8 = a2;
    [v8 uarpSuperBinary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 payloads];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 selectedPayload];

    [v10 objectAtIndex:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:tlvLength:tlvValue:",  a3,  a4,  a5);
    [v12 addMetaDataTLV:v13];
    getOSLogToken();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3PayloadMetaDataTLV_cold_1();
    }
  }

void fCoreUARPLayer3PayloadMetaDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3
    && v4
    && uarpPlatformEndpointPayloadRequestData( [v3 uarpEndpoint],  objc_msgSend(v4, "uarpAsset")))
  {
    getOSLogToken();
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3PayloadMetaDataComplete_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void fCoreUARPLayer3PayloadData(void *a1, void *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = v10;
  if (v9 && v10 && a3 && a4)
  {
    getOSLogToken();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = a4;
      __int16 v24 = 2048;
      uint64_t v25 = a5;
      _os_log_debug_impl( &dword_187DC0000,  v12,  OS_LOG_TYPE_DEBUG,  "Payload Data Length = <%lu>, Offset = <%lu>",  buf,  0x16u);
    }

    [MEMORY[0x189603F48] dataWithBytes:a3 length:a4];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 uarpSuperBinary];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 payloads];
    objc_msgSend((id)v15, "objectAtIndex:", objc_msgSend(v11, "selectedPayload"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    id v21 = 0LL;
    LOBYTE(v15) = [v16 writePayloadData:v13 offset:a5 error:&v21];
    id v17 = v21;
    if ((v15 & 1) != 0)
    {
      uint64_t v18 = (void *)uarpPlatformRemoteDelegateForAssetDelegate([v11 uarpAsset]);
      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }

      id v19 = v18;
      [v11 asset];
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v9,  "assetSolicitationProgress:asset:offset:assetLength:",  v19,  v20,  a5,  objc_msgSend(v11, "assetLength"));
    }

    else
    {
      getOSLogToken();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3PayloadData_cold_1();
      }
    }

    goto LABEL_13;
  }

void fCoreUARPLayer3PayloadDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v4, "setSelectedPayload:", objc_msgSend(v4, "selectedPayload") + 1);
    unint64_t v6 = [v5 selectedPayload];
    if (v6 >= [v5 numPayloads])
    {
      UARPlatformEndpointAssetFullyReceived(v3, v5);
    }

    else
    {
      getOSLogToken();
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetMetaDataComplete_cold_2(v5, v7);
      }

      if (uarpPlatformEndpointAssetSetPayloadIndex( (void *)[v3 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"),  (unsigned __int16)objc_msgSend(v5, "selectedPayload")))
      {
        getOSLogToken();
        uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetMetaDataComplete_cold_1(v5, v8);
        }
      }
    }
  }
}

uint64_t fCoreUARPLayer3AssetSetBytesAtOffset()
{
  return 26LL;
}

uint64_t fCoreUARPLayer3AssetRescinded(void *a1, const char *a2, uint64_t a3)
{
  return [a1 rescindedRxDynamicAsset:a2 asset:a3];
}

void fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete(void *a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  id v5 = a3;
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t SuperBinaryMetaData = uarpAssetQuerySuperBinaryMetaData( [v4 uarpEndpoint],  objc_msgSend(v5, "uarpAsset"));
    if (SuperBinaryMetaData)
    {
      uint64_t v8 = (unsigned int *)SuperBinaryMetaData;
      do
      {
        id v9 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:tlvLength:tlvValue:",  *v8,  v8[1],  *((void *)v8 + 1));
        [v6 uarpSuperBinary];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 addMetaDataTLV:v9];

        uint64_t v8 = (unsigned int *)*((void *)v8 + 2);
      }

      while (v8);
    }

    if ([v6 numPayloads])
    {
      unint64_t v12 = 0LL;
      *(void *)&__int128 v11 = 67109120LL;
      __int128 v30 = v11;
      do
      {
        int PayloadInfo = uarpAssetQueryPayloadInfo( objc_msgSend(v4, "uarpEndpoint", v30),  objc_msgSend(v6, "uarpAsset"),  v12,  (uint64_t)v31);
        if (PayloadInfo)
        {
          int v14 = PayloadInfo;
          getOSLogToken();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            LODWORD(v37) = v14;
            _os_log_error_impl(&dword_187DC0000, v15, OS_LOG_TYPE_ERROR, "Failed to query payload info; %u", buf, 8u);
          }
        }

        uint64_t v16 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
        id v17 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v16,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v32,  v33,  v34,  v35);
        getOSLogToken();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = (UARPAssetTag *)v17;
          _os_log_debug_impl(&dword_187DC0000, v18, OS_LOG_TYPE_DEBUG, "Payload Ready; asset version is %@", buf, 0xCu);
        }

        id v19 = objc_alloc(&OBJC_CLASS___UARPAssetTag);
        uint64_t v20 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( v19,  "initWithChar1:char2:char3:char4:",  v31[0],  v31[1],  v31[2],  v31[3]);
        getOSLogToken();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v20;
          _os_log_debug_impl( &dword_187DC0000,  v21,  OS_LOG_TYPE_DEBUG,  "Payload Ready; payload 4cc/tag is %@",
            buf,
            0xCu);
        }

        uint64_t v22 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:writable:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithPayloadTag:assetVersion:writable:",  v20,  v17,  1LL);
        [v6 uarpSuperBinary];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 addPayload:v22];

        uint64_t PayloadMetaData = uarpAssetQueryPayloadMetaData( [v4 uarpEndpoint],  objc_msgSend(v6, "uarpAsset"),  v12);
        if (PayloadMetaData)
        {
          uint64_t v25 = (unsigned int *)PayloadMetaData;
          do
          {
            uint64_t v26 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:tlvLength:tlvValue:",  *v25,  v25[1],  *((void *)v25 + 1));
            -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v22, "addMetaDataTLV:", v26);
            uint64_t v25 = (unsigned int *)*((void *)v25 + 2);
          }

          while (v25);
        }

        ++v12;
      }

      while (v12 < [v6 numPayloads]);
    }

    if ([v6 numPayloads])
    {
      int v27 = uarpPlatformEndpointAssetSetPayloadIndex( (void *)[v4 uarpEndpoint],  objc_msgSend(v6, "uarpAsset"),  0);
      if (v27)
      {
        int v28 = v27;
        getOSLogToken();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete_cold_1(v28, v29);
        }
      }
    }

    else
    {
      UARPlatformEndpointAssetFullyReceived(v4, v6);
    }
  }
}

void UARPlatformEndpointAssetFullyReceived(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  getOSLogToken();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_187DC0000, v5, OS_LOG_TYPE_INFO, "Asset fully staged", v9, 2u);
  }

  uint64_t v6 = [v4 uarpEndpoint];
  uint64_t v7 = [v3 uarpAsset];

  if (uarpPlatformEndpointAssetFullyStaged(v6, v7))
  {
    getOSLogToken();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointAssetFullyReceived_cold_1();
    }
  }

uint64_t UARPAssetSolicitionComplete(void *a1, void *a2, void *a3, __int16 a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  getOSLogToken();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Asset Solicitation Complete", buf, 2u);
  }

  [v9 asset];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v9 asset];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 id];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [v9 asset];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 id];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 localURL];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        uint64_t v17 = UARPUploaderStagingStatusConvert(a4);
        [v9 asset];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 id];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [v19 localURL];
        id v21 = (void *)[(id)v20 copy];

        [v9 uarpSuperBinary];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        id v46 = 0LL;
        LOBYTE(v20) = [v22 writeToURL:v21 error:&v46];
        id v23 = v46;

        if ((v20 & 1) != 0)
        {
          if ([v9 internalSolicit])
          {
            if (!v17)
            {
              [v9 asset];
              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 id];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 tag];
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

              int v27 = (char *)uarpAssetTagStructPersonalization();
              int v28 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v27,  v27[1],  v27[2],  v27[3]);
              if ([v26 isEqual:v28])
              {
                else {
                  uint64_t v29 = 54LL;
                }
              }

              else
              {
                unsigned int v33 = (char *)uarpAssetTagStructVoiceAssist();
                unsigned int v34 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v33,  v33[1],  v33[2],  v33[3]);
                if ([v26 isEqual:v34])
                {
                  UARPlatformEndpointHandleVoiceAssist(v7, v8, v21);
                  uint64_t v29 = 0LL;
                }

                else
                {
                  unsigned int v35 = (char *)uarpAssetTagStructHeySiriModel();
                  uint64_t v36 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v35,  v35[1],  v35[2],  v35[3]);
                  if ([v26 isEqual:v36])
                  {
                    UARPlatformEndpointHandleHeySiri(v7, v8, v21);
                    uint64_t v29 = 0LL;
                  }

                  else
                  {
                    +[UARPDynamicAssetAnalyticsEvent tag](&OBJC_CLASS___UARPDynamicAssetAnalyticsEvent, "tag");
                    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v26, "isEqual:"))
                    {
                      uint64_t v29 = UARPlatformEndpointHandleAnalytics(v21);
                    }

                    else
                    {
                      v44 = v36;
                      +[UARPDynamicAssetMappedAnalyticsEvent tag]( &OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent,  "tag");
                      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
                      if ([v26 isEqual:v37])
                      {
                        uint64_t v29 = UARPlatformEndpointHandleMappedAnalytics(v7, v21, v37);
                      }

                      else
                      {
                        v43 = v37;
                        +[UARPDynamicAssetVersions tag](&OBJC_CLASS___UARPDynamicAssetVersions, "tag");
                        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v26, "isEqual:"))
                        {
                          uint64_t v29 = UARPlatformEndpointHandleVersions(v7, v8, v21);
                        }

                        else
                        {
                          uint64_t v38 = (char *)uarpAssetTagStructLogs();
                          v41 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v38,  v38[1],  v38[2],  v38[3]);
                          if ([v26 isEqual:v41])
                          {
                            uint64_t v29 = UARPlatformEndpointHandleLogs(v7, v8, v21);
                          }

                          else
                          {
                            +[UARPDynamicAssetCrashLogEvent tag](&OBJC_CLASS___UARPDynamicAssetCrashLogEvent, "tag");
                            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
                            uint64_t v40 = v39;
                            else {
                              uint64_t v29 = 0LL;
                            }
                          }
                        }

                        uint64_t v37 = v43;
                      }

                      uint64_t v36 = v44;
                    }
                  }
                }
              }

              goto LABEL_27;
            }

LABEL_24:
            uint64_t v29 = 0LL;
LABEL_28:

            goto LABEL_29;
          }
        }

        else
        {
          getOSLogToken();
          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            UARPAssetSolicitionComplete_cold_4();
          }

          uint64_t v17 = 2LL;
        }

        [v9 asset];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 assetSolicitationComplete:v8 asset:v26 status:v17];
        uint64_t v29 = 0LL;
LABEL_27:

        goto LABEL_28;
      }

      getOSLogToken();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        UARPAssetSolicitionComplete_cold_3();
      }
    }

    else
    {
      getOSLogToken();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        UARPAssetSolicitionComplete_cold_2();
      }
    }

    [v9 asset];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 assetSolicitationComplete:v8 asset:v21 status:2];
  }

  else
  {
    getOSLogToken();
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      UARPAssetSolicitionComplete_cold_1();
    }
  }

  uint64_t v29 = 54LL;
LABEL_29:

  return v29;
}

void UARPlatformEndpointHandleVoiceAssist(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = objc_alloc(&OBJC_CLASS___UARPHeySiriModelVoiceAssist);
  [v6 accessory];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v6 uarpVersion];

  [v7 controller];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = -[UARPHeySiriModelBase initWithAccessory:uarpProtocolVersion:controller:url:]( v8,  "initWithAccessory:uarpProtocolVersion:controller:url:",  v9,  v10,  v11,  v5);

  [v7 processDynamicAssetVoiceAssist:v12];
}

void UARPlatformEndpointHandleHeySiri(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = objc_alloc(&OBJC_CLASS___UARPHeySiriModelCompact);
  [v6 accessory];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v6 uarpVersion];

  [v7 controller];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = -[UARPHeySiriModelBase initWithAccessory:uarpProtocolVersion:controller:url:]( v8,  "initWithAccessory:uarpProtocolVersion:controller:url:",  v9,  v10,  v11,  v5);

  [v7 processDynamicAssetHeySiriCompact:v12];
}

uint64_t UARPlatformEndpointHandleAnalytics(void *a1)
{
  id v1 = a1;
  __int16 v2 = -[UARPDynamicAssetAnalyticsEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetAnalyticsEvent),  "initWithURL:",  v1);

  if (-[UARPDynamicAssetAnalyticsEvent decomposeUARP](v2, "decomposeUARP"))
  {
    -[UARPDynamicAssetAnalyticsEvent send](v2, "send");
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = 54LL;
  }

  return v3;
}

uint64_t UARPlatformEndpointHandleMappedAnalytics(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = -[UARPDynamicAssetMappedAnalyticsEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent),  "initWithURL:",  v6);
  if (!-[UARPDynamicAssetMappedAnalyticsEvent decomposeUARP](v8, "decomposeUARP"))
  {
    getOSLogToken();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleMappedAnalytics_cold_2();
    }
    goto LABEL_13;
  }

  if (!-[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP](v8, "findMatchingTMAP"))
  {
    [v5 addUnprocessedDynamicAsset:v6 withAssetTag:v7];
    getOSLogToken();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( &dword_187DC0000,  v10,  OS_LOG_TYPE_INFO,  "Failed to find matching TMAP. Saving for Later Processing.",  v13,  2u);
    }

    goto LABEL_10;
  }

  if (!-[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads](v8, "expandMTICPayloads"))
  {
    getOSLogToken();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleMappedAnalytics_cold_1();
    }
LABEL_13:

    uint64_t v11 = 54LL;
    goto LABEL_14;
  }

  -[UARPDynamicAssetMappedAnalyticsEvent send](v8, "send");
LABEL_10:
  uint64_t v11 = 0LL;
LABEL_14:

  return v11;
}

uint64_t UARPlatformEndpointHandleVersions(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = -[UARPDynamicAssetVersions initWithURL:](objc_alloc(&OBJC_CLASS___UARPDynamicAssetVersions), "initWithURL:", v7);

  if (-[UARPDynamicAssetVersions decomposeUARP](v8, "decomposeUARP"))
  {
    [v6 accessory];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPDynamicAssetVersions partnerSerialNumbers](v8, "partnerSerialNumbers");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setPartnerSerialNumbers:v10];

    [v6 accessory];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPDynamicAssetVersions partnerSerialNumbers](v8, "partnerSerialNumbers");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 processDynamicAssetVersions:v11 partnerSerialNumbers:v12];

    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = 54LL;
  }

  return v13;
}

uint64_t UARPlatformEndpointHandleLogs(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = -[UARPDynamicAssetLogsEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetLogsEvent),  "initWithURL:",  v5);

  [v7 ttrDirectory];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:]( v8,  "expandToDirectory:forRemoteEndpoint:",  v9,  v6);
  if ((_DWORD)v7) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = 54LL;
  }

  return v10;
}

uint64_t UARPlatformEndpointHandleCrashAnalytics(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = -[UARPDynamicAssetCrashLogEvent initWithURL:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCrashLogEvent),  "initWithURL:",  v6);
  if (!-[UARPDynamicAssetCrashLogEvent decomposeUARP](v8, "decomposeUARP"))
  {
    getOSLogToken();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleCrashAnalytics_cold_2();
    }
    goto LABEL_13;
  }

  if (!-[UARPDynamicAssetCrashLogEvent findMatchingCMAP](v8, "findMatchingCMAP"))
  {
    [v5 addUnprocessedDynamicAsset:v6 withAssetTag:v7];
    getOSLogToken();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( &dword_187DC0000,  v10,  OS_LOG_TYPE_INFO,  "Failed to find matching CMAP. Saving for Later Processing.",  v13,  2u);
    }

    goto LABEL_10;
  }

  if (!-[UARPDynamicAssetCrashLogEvent processCrashInstance](v8, "processCrashInstance"))
  {
    getOSLogToken();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleCrashAnalytics_cold_1();
    }
LABEL_13:

    uint64_t v11 = 54LL;
    goto LABEL_14;
  }

  -[UARPDynamicAssetCrashLogEvent sendSpeedTracer](v8, "sendSpeedTracer");
LABEL_10:
  uint64_t v11 = 0LL;
LABEL_14:

  return v11;
}

void OUTLINED_FUNCTION_4_3( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_5_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_13_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t OUTLINED_FUNCTION_14(void *a1, const char *a2)
{
  return [a1 selectedPayload];
}

  ;
}

  ;
}

  ;
}

void *uarpZalloc(size_t a1)
{
  return calloc(a1, 1uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if ((_DWORD)src_size != (_DWORD)__n) {
        return 51LL;
      }
      memcpy(__dst, __src, __n);
      return 0LL;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = 1794;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer( (uint8_t *)__dst,  __n,  (const uint8_t *)__src,  src_size,  0LL,  v5) == __n) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = 51LL;
      }
      break;
    default:
      uint64_t result = 50LL;
      break;
  }

  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50LL;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }

  else
  {
    int v4 = dword_187E44000[v3];
    int v5 = 16 * v3 + 32;
  }

  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if ((_DWORD)result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }

  else if ((_DWORD)result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }

  else if ((_DWORD)result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }

  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogError_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

uint64_t uarpLogToken(unsigned int a1)
{
  for (uint64_t i = 0LL; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    uarpLogToken_tokens[i] = os_log_create("com.apple.uarp.embedded", v3);
  }

  if (a1 <= 8) {
    return uarpLogToken_tokens[a1];
  }
  else {
    return MEMORY[0x1895F8DA0];
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    uarpLogDebug_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  vsnprintf(uarpLogInfo_logBuffer, 0x200uLL, __format, va);
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = uarpLogInfo_logBuffer;
    _os_log_impl(&dword_187DC0000, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogFault_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uarpPlatformDarwinLogError_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  vsnprintf(uarpPlatformDarwinLogInfo_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = uarpPlatformDarwinLogInfo_logBuffer;
    _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpPlatformDarwinLogDebug( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uarpPlatformDarwinLogDebug_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogFault( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    uarpPlatformDarwinLogFault_cold_1(v10);
  }
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

LABEL_28:
      uint64_t v10 = v27;
      uint64_t v8 = v28;
    }
  }

  return v10 != 0;
}

LABEL_31:
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

id OUTLINED_FUNCTION_12_0(id a1)
{
  return a1;
}

  ;
}

uint64_t nullableObjectsEqual(void *a1, uint64_t a2)
{
  if (a1) {
    return [a1 isEqual:a2];
  }
  else {
    return a2 == 0;
  }
}

uint64_t uarpUtilsConcatenateURLs(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    [MEMORY[0x189607898] fileHandleForWritingToURL:a1 error:a3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 uarpSeekToEndReturningOffset:0 error:a3])
      {
        [MEMORY[0x189607898] fileHandleForReadingFromURL:v5 error:a3];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          uint64_t v9 = 0LL;
          while (1)
          {
            uint64_t v10 = v9;
            [v8 uarpReadDataUpToLength:4096 error:a3];
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

            if ([v9 length] != 4096)
            {
              uint64_t v11 = 1LL;
              goto LABEL_14;
            }
          }

          uint64_t v11 = 0LL;
LABEL_14:
          [v8 uarpCloseAndReturnError:a3];
          [v7 uarpCloseAndReturnError:a3];
        }

        else
        {
          [v7 uarpCloseAndReturnError:a3];
          uint64_t v11 = 0LL;
        }

        goto LABEL_17;
      }

      [v7 uarpCloseAndReturnError:a3];
    }

    uint64_t v11 = 0LL;
LABEL_17:

    goto LABEL_18;
  }

  uint64_t v11 = 1LL;
LABEL_18:

  return v11;
}

uint64_t uarpVersionCompareStrings(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  a1,  v8);
  +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v3,  v7);

  int v4 = uarpVersionCompare(v8, v7);
  if (v4) {
    uint64_t v5 = -1LL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (v4 == 1) {
    return 1LL;
  }
  else {
    return v5;
  }
}

id currentTrainName()
{
  if (currentTrainName_onceToken != -1) {
    dispatch_once(&currentTrainName_onceToken, &__block_literal_global_3);
  }
  if (currentTrainName_trainName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", currentTrainName_trainName);
    uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v0 = 0LL;
  }

  return v0;
}

void __currentTrainName_block_invoke()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v0 isEqualToString:&stru_18A143E70])
  {
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN");
    id v1 = (void *)objc_claimAutoreleasedReturnValue();
    char v2 = [v1 isEqualToString:@"$SIDEBUILD_PARENT_TRAIN"];

    if ((v2 & 1) == 0)
    {
      currentTrainName_trainName = (uint64_t)"$SIDEBUILD_PARENT_TRAIN";
      return;
    }
  }

  objc_msgSend(NSString, "stringWithFormat:", @"%s", "SapphireC");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:&stru_18A143E70])
  {
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", "SapphireC");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = [v3 isEqualToString:@"$RC_RELEASE"];

    if ((v4 & 1) == 0) {
      currentTrainName_trainName = (uint64_t)"SapphireC";
    }
  }

uint64_t appendFirstUarpFilenameToFilepath(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  [MEMORY[0x1896078A8] defaultManager];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 contentsOfDirectoryAtPath:v3 error:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 hasSuffix:@".uarp"])
        {
          [v3 appendFormat:@"/%@", v11];
          uint64_t v12 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0LL;
LABEL_11:

  return v12;
}

id uarpDynamicAssetURL(void *a1)
{
  return uarpDynamicAssetURLWithSuffix(a1, 1);
}

id uarpDynamicAssetURLWithSuffix(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  UARPStringDynamicAssetsFilepath();
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078A8] defaultManager];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 fileExistsAtPath:v4])
  {
    id v6 = objc_alloc_init(MEMORY[0x189607AB8]);
    uint64_t v7 = (void *)MEMORY[0x189607940];
    [v6 UUIDString];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringWithFormat:@"%@/%@-%c%c%c%c", v4, v8, (int)objc_msgSend(v3, "char1"), (int)objc_msgSend(v3, "char2"), (int)objc_msgSend(v3, "char3"), (int)objc_msgSend(v3, "char4")];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2) {
      [v9 appendString:@".uarp"];
    }
    if ([v5 createFileAtPath:v9 contents:0 attributes:0])
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v9];
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        uarpDynamicAssetURLWithSuffix_cold_1();
      }
      uint64_t v10 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v4;
      _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Directory for dynamic assets does not exist at %@",  buf,  0xCu);
    }

    uint64_t v10 = 0LL;
  }

  return v10;
}

id uarpDynamicAssetComponentURL(void *a1)
{
  return uarpDynamicAssetURLWithSuffix(a1, 0);
}

BOOL isDynamicAssetLogs(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagLogs();
}

BOOL isDynamicAssetAnalytics(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagAnalytics();
}

BOOL isDynamicAssetMappedAnalytics(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagMappedAnalytics();
}

BOOL isDynamicAssetHeySiri(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagHeySiriModel();
}

BOOL isDynamicAssetSysConfig(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagSysconfig();
}

BOOL isDynamicAssetVoiceAssist(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagVoiceAssist();
}

BOOL isDynamicAssetPersonalization(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagPersonalization();
}

id UARPUtilsBuildURLForTemporaryFile()
{
  uint64_t v0 = (void *)MEMORY[0x189604030];
  UARPStringTempFilesFilepath();
  int v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 fileURLWithPath:v1 isDirectory:1];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v2 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([MEMORY[0x1896078A8] defaultManager],
        id v3 = (void *)objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = objc_alloc_init(MEMORY[0x189607AB8]);
    id v6 = (void *)NSString;
    UARPStringTempFilesFilepath();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v5 UUIDString];
    [v6 stringWithFormat:@"%@/%@", v7, v8];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v_Block_object_dispose(va, 8) = [v10 createFileAtPath:v9 contents:0 attributes:0];

    if ((v8 & 1) != 0)
    {
      [MEMORY[0x189604030] URLWithString:v9];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        UARPUtilsBuildURLForTemporaryFile_cold_1();
      }
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      UARPUtilsBuildURLForTemporaryFile_cold_2();
    }
    uint64_t v11 = 0LL;
  }

  return v11;
}

uint64_t createPowerAssertion(void *a1, IOPMAssertionID *a2)
{
  id v3 = a1;
  if (a2)
  {
    IOReturn v4 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v3, a2);
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        createPowerAssertion_cold_2((uint64_t)v3, v5);
      }
      uint64_t v6 = 0LL;
      *a2 = 0;
    }

    else
    {
      uint64_t v6 = 1LL;
    }
  }

  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v7) {
      createPowerAssertion_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v6 = 0LL;
  }

  return v6;
}

BOOL releasePowerAssertion(IOPMAssertionID a1)
{
  IOReturn v1 = IOPMAssertionRelease(a1);
  if (v1 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    releasePowerAssertion_cold_1();
  }
  return v1 == 0;
}

uint64_t UARPUtilsCreateTemporaryFolder(void *a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  [MEMORY[0x1896078A8] defaultManager];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 fileExistsAtPath:v1])
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    id v10 = 0LL;
    char v4 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v5 = v10;
    if ((v4 & 1) != 0)
    {
      uint64_t v11 = *MEMORY[0x189607500];
      v12[0] = &unk_18A160AD0;
      [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v5;
      uint64_t v3 = [v2 setAttributes:v6 ofItemAtPath:v1 error:&v9];
      id v7 = v9;

      if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        UARPUtilsCreateTemporaryFolder_cold_1();
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        UARPUtilsCreateTemporaryFolder_cold_2();
      }
      uint64_t v3 = 0LL;
      id v7 = v5;
    }
  }

  return v3;
}

id uarpFirmwareForAccessory(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x189607940];
  InternalStorageDirectoryPath();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@/%@", v9, v5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithUTF8String:UARPAccessoryHardwareFusingToString(2uLL)];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 caseInsensitiveCompare:v11]) {
    [v10 appendFormat:@"-%@", v6];
  }
  [v10 appendFormat:@"/%@", v7];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "uarpFirmwareForAccessory";
    __int16 v32 = 2112;
    unsigned int v33 = v10;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: Checking for firmware in directory %@",  buf,  0x16u);
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] URLWithString:v10];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 enumeratorAtURL:v13 includingPropertiesForKeys:0 options:1 errorHandler:0];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v24 = v7;
    id v18 = v5;
    id v19 = 0LL;
    uint64_t v20 = *(void *)v26;
LABEL_7:
    uint64_t v21 = 0LL;
    uint64_t v22 = v19;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v15);
      }
      id v19 = *(id *)(*((void *)&v25 + 1) + 8 * v21);

      if ([v19 checkResourceIsReachableAndReturnError:0]) {
        break;
      }
      ++v21;
      uint64_t v22 = v19;
      if (v17 == v21)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v17) {
          goto LABEL_7;
        }

        id v19 = 0LL;
        break;
      }
    }

    id v5 = v18;
    id v7 = v24;
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

id dataFromHexString(void *a1)
{
  id v1 = a1;
  char v2 = (void *)objc_opt_new();
  id v3 = v1;
  uint64_t v4 = [v3 UTF8String];
  if ([v3 length])
  {
    id v15 = 0LL;
  }

  else
  {
    if ([v3 length])
    {
      uint64_t v5 = 0LL;
      unsigned int v6 = 2;
      do
      {
        int v7 = *(unsigned __int8 *)(v4 + v5);
        else {
          char v8 = *(_BYTE *)(v4 + v5);
        }
        else {
          char v9 = v7 + 9;
        }
        int v10 = *(unsigned __int8 *)(v4 + v6 - 1);
        char v11 = v10 - 48;
        unsigned int v12 = v10 - 97;
        char v13 = v10 - 87;
        if (v12 >= 6) {
          char v13 = v11;
        }
        char v17 = v13 | (16 * v9);
        [v2 appendBytes:&v17 length:1];
        uint64_t v5 = v6;
        BOOL v14 = [v3 length] > (unint64_t)v6;
        v6 += 2;
      }

      while (v14);
    }

    [MEMORY[0x189603F48] dataWithData:v2];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t postStagingStatusForModelIdentifier(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithFormat:@"%s%@", "com.apple.uarp.stagingstatus.", a1];
  if (notify_register_check((const char *)[v3 UTF8String], &out_token))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      postStagingStatusForModelIdentifier_cold_1();
    }
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  else
  {
    notify_set_state(out_token, a2);
    notify_post((const char *)[v3 UTF8String]);
    uint64_t v4 = out_token;
  }

  return v4;
}

void UARPCleanupAgedFiles(void *a1, double a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  UARPArrayOfExpiredFiles(a1, 0LL, a2);
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    unsigned int v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          UARPCleanupAgedFiles_cold_1(buf, v8, &v15);
        }
        [MEMORY[0x1896078A8] defaultManager];
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 removeItemAtPath:v8 error:0];

        ++v7;
      }

      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }

    while (v4);
  }
}

void UARPCopyFile(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x189604030] fileURLWithPath:a1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078A8] defaultManager];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 path];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v9 fileExistsAtPath:v10];

  if ((v11 & 1) != 0)
  {
    [MEMORY[0x189604030] fileURLWithPath:v5];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 URLByAppendingPathComponent:v6];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 path];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = [v14 fileExistsAtPath:v15];

    if ((v16 & 1) == 0)
    {
      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = 0LL;
      char v18 = [v17 copyItemAtURL:v8 toURL:v13 error:&v22];
      id v19 = v22;

      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          [v8 path];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 path];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          id v24 = v20;
          __int16 v25 = 2112;
          __int128 v26 = v21;
          _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Successfully copied %@ to %@",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        UARPCopyFile_cold_1(v8, v13, (uint64_t)v19);
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    UARPCopyFile_cold_2(v8);
  }
}

BOOL UARPCreateFile(void *a1)
{
  id v1 = a1;
  [MEMORY[0x1896078A8] defaultManager];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 path];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v2 fileExistsAtPath:v3];

  BOOL v8 = 1;
  if ((v4 & 1) == 0)
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 path];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v5 createFileAtPath:v6 contents:0 attributes:0];

    if (!v7) {
      BOOL v8 = 0;
    }
  }

  return v8;
}

uint64_t UARPWriteFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (UARPCreateFile(v4))
  {
    id v18 = 0LL;
    [MEMORY[0x189607898] fileHandleForWritingToURL:v4 error:&v18];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v18;
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        UARPWriteFile_cold_1(v4);
      }
      uint64_t v12 = 0LL;
      goto LABEL_22;
    }

    id v16 = 0LL;
    char v7 = [v5 uarpSeekToEndReturningOffset:v17 error:&v16];
    id v8 = v16;

    if ((v7 & 1) != 0)
    {
      id v15 = 0LL;
      char v9 = [v5 uarpWriteData:v3 error:&v15];
      id v10 = v15;

      if ((v9 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          UARPWriteFile_cold_3(v4);
        }
        uint64_t v12 = 1LL;
        id v8 = v10;
        goto LABEL_21;
      }

      id v14 = 0LL;
      char v11 = [v5 uarpCloseAndReturnError:&v14];
      id v8 = v14;

      if ((v11 & 1) != 0)
      {
        uint64_t v12 = 1LL;
LABEL_21:
        id v6 = v8;
LABEL_22:

        goto LABEL_23;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        UARPWriteFile_cold_2(v4);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      UARPWriteFile_cold_4(v4);
    }

    uint64_t v12 = 0LL;
    goto LABEL_21;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    UARPWriteFile_cold_5(v4);
  }
  uint64_t v12 = 0LL;
LABEL_23:

  return v12;
}

id UARPTimestamp()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  [v0 setDateFormat:@"yyyy-MM-dd-hh-mm-ss"];
  [MEMORY[0x189603F50] date];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 stringFromDate:v1];
  char v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id UARPUniqueFilename(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v12 = (objc_class *)MEMORY[0x189603FA8];
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(v12);
  id v16 = v15;
  if (v9) {
    [v15 addObject:v9];
  }
  if (v10) {
    [v16 addObject:v10];
  }
  if (v11) {
    [v16 addObject:v11];
  }
  UARPTimestamp();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 addObject:v17];

  id v18 = (void *)[v16 copy];
  UARPUniqueFilePathWithIdentifierComponents(v14, v18, v13);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id UARPUniqueFilePathWithIdentifierComponents(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_opt_new();
  id v9 = v8;
  if (v5) {
    [v8 addObject:v5];
  }
  id v10 = (void *)objc_opt_new();
  [v7 componentsJoinedByString:@"-"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 appendString:v11];
  if (v6) {
    [v10 appendFormat:@"%@", v6];
  }
  [v9 addObject:v10];
  [NSString pathWithComponents:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

  ;
}

void OUTLINED_FUNCTION_6_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_50:
  return v7;
}

id InternalStorageDirectoryPath()
{
  if (InternalStorageDirectoryPath_onceToken != -1) {
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global_4);
  }
  return (id)InternalStorageDirectoryPath_path;
}

void __InternalStorageDirectoryPath_block_invoke()
{
  id v0 = (void *)InternalStorageDirectoryPath_path;
  InternalStorageDirectoryPath_path = (uint64_t)@"/var/db/accessoryupdater/uarp/";
}

void sub_187E25278( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

id getCSCoreSpeechServicesClass()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  id v0 = (void *)getCSCoreSpeechServicesClass_softClass;
  uint64_t v7 = getCSCoreSpeechServicesClass_softClass;
  if (!getCSCoreSpeechServicesClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getCSCoreSpeechServicesClass_block_invoke;
    v3[3] = &unk_18A143128;
    v3[4] = &v4;
    __getCSCoreSpeechServicesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_187E257AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187E25B44(_Unwind_Exception *a1)
{
}

void __getCSVoiceTriggerRTModelClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getCSVoiceTriggerRTModelClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    __getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
    CoreSpeechLibrary();
  }

void CoreSpeechLibrary()
{
  if (!CoreSpeechLibraryCore_frameworkLibrary_0) {
    CoreSpeechLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreSpeechLibraryCore_frameworkLibrary_0)
  {
    id v0 = (void *)abort_report_np();
    free(v0);
  }

Class __getCSCoreSpeechServicesClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CSCoreSpeechServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getCSCoreSpeechServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = __getCSCoreSpeechServicesClass_block_invoke_cold_1();
    return (Class)__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke(v3);
  }

  return result;
}

UARPHeySiriModelVoiceAssist *__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke(uint64_t a1)
{
  Class result = (UARPHeySiriModelVoiceAssist *)objc_getClass("CSCoreSpeechServicesAccessoryInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getCSCoreSpeechServicesAccessoryInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = (UARPHeySiriModelVoiceAssist *)__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1();
    return -[UARPHeySiriModelVoiceAssist init](v3, v4);
  }

  return result;
}

LABEL_46:
}

LABEL_19:
  uint64_t v20 = 1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    events = self->_events;
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = events;
    _os_log_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "All Analytics objects for this asset: %@",  buf,  0xCu);
  }

  return v20;
}

char *uarpAssetTagMappedAnalytics4cc()
{
  Class result = uarpAssetTagMappedAnalytics4cc_assetTag;
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagMappedAnalytics()
{
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagMappedAnalytics4cc_assetTag);
}

int *uarpAssetTagStructMappedAnalytics()
{
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  Class result = &uarpAssetTagStructMappedAnalytics_myTag;
  uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiMappedAnalytics()
{
  Class result = &uarpOuiMappedAnalytics_myOui;
  uarpOuiMappedAnalytics_myOuuint64_t i = 5408;
  byte_18C6F9A9E = -126;
  return result;
}

uint64_t uarpBuildMappedAnalyticsAsset( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (char *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 11LL;
  }
  uint64_t v12 = (uint64_t)v11;
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
  uint64_t result = UARPSuperBinaryPrepareDynamicAsset(a1, v11, a5, a6, *(int *)uarpAssetTagMappedAnalytics4cc_assetTag);
  if (!(_DWORD)result)
  {
    if ((_DWORD)a4)
    {
      uint64_t v14 = a4;
      for (uint64_t i = a3 + 20; ; i += 48LL)
      {
        int v16 = *(_DWORD *)(i - 4);
        uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
        uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
        a4 = a4 & 0xFFFFFFFF00000000LL | *(unsigned int *)uarpAssetTagMappedAnalytics4cc_assetTag;
        uint64_t result = UARPSuperBinaryAddPayload2( a1,  v12,  v16,  a4,  *(void *)(i - 20),  *(void *)(i - 12),  *(const void **)(i + 20),  *(_DWORD *)(i + 12),  0);
        if ((_DWORD)result) {
          break;
        }
        int v17 = uarpHtonl(*(_DWORD *)(i + 8));
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280449, 4u, &v17);
        if ((_DWORD)result) {
          break;
        }
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280448, 5u, (const void *)i);
        if ((_DWORD)result) {
          break;
        }
        if (!--v14) {
          return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
        }
      }
    }

    else
    {
      return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v7 = 0LL;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      unsigned int v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      uint64_t v6 = v7;
      if (*(void *)v7)
      {
        uint64_t result = 0LL;
        *((_DWORD *)v7 + 2) = v5;
        *(void *)(a2 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v6;
        return result;
      }

      UARPLayer2ReturnBuffer(a1, v7);
    }

    return 11LL;
  }

  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          uint64_t v3 = *(void ***)(a2 + 88);
          UARPHeySiriModelVoiceAssist *v3 = 0LL;
        }

        UARPLayer2ReturnBuffer(a1, v3);
        *(void *)(a2 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
      }
    }
  }

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t v7 = a3;
      if (a3)
      {
        LODWORD(v_Block_object_dispose((const void *)(v1 - 80), 8) = a4;
        if (a4)
        {
          id v9 = *(_DWORD **)(a2 + 88);
          if (v9) {
            goto LABEL_6;
          }
          uint64_t result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if ((_DWORD)result) {
            return result;
          }
          id v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              uint64_t v8 = v8;
              unsigned int v10 = v9[4];
              do
              {
                char v11 = *v7++;
                *(_BYTE *)(*(void *)v9 + v10) = v11;
                unsigned int v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  unsigned int v12 = uarpHtons(*(unsigned __int16 *)(*(void *)v9 + 2LL)) + 6;
                  v9[3] = v12;
                  unsigned int v10 = v9[4];
                }

                else
                {
                  unsigned int v12 = v9[3];
                }

                if (v10 == v12)
                {
                  uint64_t result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if ((_DWORD)result) {
                    return result;
                  }
                  bzero(*(void **)v9, v9[2]);
                  unsigned int v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }

                --v8;
              }

              while (v8);
              return 0LL;
            }

            else
            {
              return 30LL;
            }
          }

          else
          {
            return 27LL;
          }
        }
      }
    }
  }

  return result;
}

char *uarpAssetTagAnalytics4cc()
{
  uint64_t result = uarpAssetTagAnalytics4cc_assetTag;
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagAnalytics()
{
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagAnalytics4cc_assetTag);
}

int *uarpAssetTagStructAnalytics()
{
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructAnalytics_myTag;
  uarpAssetTagStructAnalytics_myTag = *(_DWORD *)uarpAssetTagAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiAnalytics()
{
  uint64_t result = &uarpOuiAnalytics_myOui;
  uarpOuiAnalytics_myOuuint64_t i = 27480;
  byte_18C6F9AA6 = 20;
  return result;
}

uint64_t uarpAnalyticsAssetInitialize(uint64_t a1, uint64_t a2)
{
  __int128 v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 1);
}

char *uarpAssetTagCrashAnalytics4cc()
{
  uint64_t result = uarpAssetTagCrashAnalytics4cc_assetTag;
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagCrashAnalytics()
{
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagCrashAnalytics4cc_assetTag);
}

int *uarpAssetTagStructCrashAnalytics()
{
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructCrashAnalytics_myTag;
  uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiCrashAnalytics()
{
  uint64_t result = &uarpOuiCrashAnalytics_myOui;
  uarpOuiCrashAnalytics_myOuuint64_t i = 27480;
  byte_18C6F9AAE = 20;
  return result;
}

uint64_t uarpBuildCrashAnalyticsAsset( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, const void *a6, unint64_t a7, int a8)
{
  LODWORD(v_Block_object_dispose((const void *)(v1 - 80), 8) = a8;
  char v19 = a5;
  uint64_t v14 = (char *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v14) {
    return 11LL;
  }
  uint64_t v15 = (uint64_t)v14;
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
  uint64_t result = UARPSuperBinaryPrepareDynamicAsset(a1, v14, a3, a4, *(int *)uarpAssetTagCrashAnalytics4cc_assetTag);
  if (!(_DWORD)result)
  {
    uint64_t result = UARPSuperBinaryAddSuperBinaryMetaData(a1, v15, -252806655, 5u, a6);
    if (!(_DWORD)result)
    {
      uint64_t result = UARPSuperBinaryAddSuperBinaryMetaData(a1, v15, -252806653, 1u, &v19);
      if (!(_DWORD)result)
      {
        if ((_DWORD)v8)
        {
          uint64_t v8 = v8;
          for (unint64_t i = a7 + 24; ; i += 56LL)
          {
            int v18 = *(_DWORD *)(i - 8);
            uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
            uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
            a7 = a7 & 0xFFFFFFFF00000000LL | *(unsigned int *)uarpAssetTagCrashAnalytics4cc_assetTag;
            uint64_t result = UARPSuperBinaryAddPayload2( a1,  v15,  v18,  a7,  *(void *)(i - 24),  *(void *)(i - 16),  *(const void **)i,  *(_DWORD *)(i + 8),  *(_BYTE *)(i + 12));
            if ((_DWORD)result) {
              break;
            }
            uint64_t result = UARPSuperBinaryAppendPayloadMetaData( a1,  v15,  *(_DWORD *)(i - 8),  -252806656,  *(_DWORD *)(i + 24),  *(const void **)(i + 16));
            if ((_DWORD)result) {
              break;
            }
            if (!--v8) {
              return UARPSuperBinaryFinalizeDynamicAsset(a1, v15);
            }
          }
        }

        else
        {
          return UARPSuperBinaryFinalizeDynamicAsset(a1, v15);
        }
      }
    }
  }

  return result;
}

char *uarpAssetTagLogs4cc()
{
  uint64_t result = uarpAssetTagLogs4cc_assetTag;
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagLogs()
{
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagLogs4cc_assetTag);
}

int *uarpAssetTagStructLogs()
{
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructLogs_myTag;
  uarpAssetTagStructLogs_myTag = *(_DWORD *)uarpAssetTagLogs4cc_assetTag;
  return result;
}

__int16 *uarpOuiLogs()
{
  uint64_t result = &uarpOuiLogs_myOui;
  uarpOuiLogs_myOuunint64_t i = 16400;
  byte_18C6F9AB6 = -13;
  return result;
}

char *uarpAssetTagPersonalization4cc()
{
  uint64_t result = uarpAssetTagPersonalization4cc_assetTag;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalization4cc_assetTag);
}

int *uarpAssetTagStructPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalization_myTag;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return result;
}

char *uarpAssetTagPersonalizedFirmware4cc()
{
  uint64_t result = uarpAssetTagPersonalizedFirmware4cc_assetTag;
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalizedFirmware4cc_assetTag);
}

int *uarpAssetTagStructPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalizedFirmware_myTag;
  uarpAssetTagStructPersonalizedFirmware_myTag = *(_DWORD *)uarpAssetTagPersonalizedFirmware4cc_assetTag;
  return result;
}

__int16 *uarpOuiPersonalization()
{
  uint64_t result = &uarpOuiPersonalization_myOui;
  uarpOuiPersonalization_myOuunint64_t i = -19832;
  byte_18C6F9AC2 = -111;
  return result;
}

uint64_t uarpPersonalizationRequestAssetInitialize(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v4 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v4, a3);
}

uint64_t uarpPersonalizationRequestPreparePayload(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v4 = 0uLL;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return UARPSuperBinaryPreparePayload(a1, a2, a3, (unsigned int *)&uarpAssetTagStructPersonalization_myTag, &v4);
}

uint64_t uarpPersonalizationRequestAddPayloadTag(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29101, 4u, a4);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetID(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int16 v6 = uarpHtons(a3);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x88B29102, 2u, (uint64_t)&v6);
}

uint64_t uarpPersonalizationRequestAddManifestPrefix( uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29103, a5, a4);
}

uint64_t uarpPersonalizationRequestAddBoardID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29104, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddBoardID64(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2911B, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29105, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddECID(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29106, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddNonce(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29107, a5, a4);
}

uint64_t uarpPersonalizationRequestAddNonceHash(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29108, a5, a4);
}

uint64_t uarpPersonalizationRequestAddDigest(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29113, a5, a4);
}

uint64_t uarpPersonalizationRequestAddSecurityDomain(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29109, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddSecurityMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910A, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddProductionMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910B, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipEpoch(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910C, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipRevision(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910F, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddEnableMixMatch(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910D, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSoCLiveNonce(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29118, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddTicketPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29126, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixNeedsLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSuffixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29122, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestMoreRequestsToFollow(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29127, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetPayloadIndex( uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910E, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddLogicalUnitNumber(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29125, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddMeasurementWithOverrides( uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unsigned int v10 = uarpHtons(a6);
  unsigned int v11 = uarpHtons(a7);
  if (!a5) {
    return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
  }
  unsigned int v12 = v11;
  id v13 = (unsigned int *)a4;
  unsigned int v14 = a5;
  while (1)
  {
    unsigned int v15 = v14 - 8;
    if (v14 < 8) {
      return 30LL;
    }
    int v16 = uarpHtonl(*v13);
    unsigned int v17 = uarpHtonl(v13[1]);
    if (v15 < v17) {
      return 30LL;
    }
    unsigned int v18 = v17;
    char v19 = v13 + 2;
    unsigned int v20 = v10;
    if (v16 == -2001563371) {
      goto LABEL_8;
    }
    if (v16 == -2001563370)
    {
      unsigned int v20 = v12;
LABEL_8:
      _WORD *v19 = uarpHtons(v20);
    }

    id v13 = (unsigned int *)((char *)v19 + v18);
    unsigned int v14 = v15 - v18;
    if (v15 == v18) {
      return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
    }
  }

uint64_t uarpPersonalizationRequestAddMeasurement( uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

uint64_t uarpPlatformAssetProcessingCompleteInternal( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30LL;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0LL;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !(_DWORD)result))
      {
        uint64_t result = 0LL;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0LL;
        }
      }
    }

    else
    {
      return 23LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30LL;
  }
  if (*(_BYTE *)(a3 + 80) == 1) {
    return 16LL;
  }
  if (*(_BYTE *)(a2 + 73) == 1 || !*(_BYTE *)(v3 + 56)) {
    return 31LL;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4LL)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4LL);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!(_DWORD)result) {
    *(_BYTE *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData( uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(_BYTE *)(a2 + 392)) {
    return 29LL;
  }
  uint64_t v7 = a3;
  if ((_DWORD)a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }

  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29LL;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29LL;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  *(_BYTE *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if ((_DWORD)v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != (_DWORD)v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }

    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }

  if (v13 == v14) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384))(a1, a2, a2 + 312);
  }
  else {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0LL;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpHtonl(*v9);
    uint64_t v11 = uarpHtonl(v9[1]);
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }

      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }

    return 0LL;
  }

  return 53LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000LL;
      *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpHtonl(*v6);
  *(_DWORD *)(a2 + 4) = uarpHtonl(v6[1]);
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpHtonl(v6[9]);
  int v7 = uarpHtonl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0LL, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47LL;
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 68_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    int v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uarpHtonl(*v7);
      unsigned int v8 = uarpHtonl(v7[1]);
      if (v8 > *(_DWORD *)(a3 + 24) - 8) {
        break;
      }
      unsigned int v9 = v8;
      unsigned int v10 = v6 - 8;
      unsigned int v6 = v6 - 8 - v8;
      if (v10 >= v8)
      {
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2AssetMetaDataTLV(a1, a2);
        int v7 = (unsigned int *)((char *)v7 + v9 + 8);
        *(_DWORD *)(a3 + 88) += v9;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v11 = 53LL;
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }

  return v11;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadHeaderRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetPayloadHeaderRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if ((_DWORD)v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestCompleted(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpHtonl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpHtonl(a1[6]);
  *(_DWORD *)(a2 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(a1[8]);
  int v6 = uarpHtonl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(_BYTE *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = v6;
  uint64_t v7 = 48LL;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0LL;
    }
    else {
      return 48LL;
    }
  }

  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44LL;
    }

    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetPayloadMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetPayloadMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestWindowFilled(void *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v13 = 0LL;
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    uint64_t v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uint64_t v8 = uarpHtonl(*v7);
      uint64_t v9 = uarpHtonl(v7[1]);
      unsigned int v10 = v9;
      unsigned int v11 = v6 - 8;
      unsigned int v6 = v6 - 8 - v9;
      if (v11 >= v9)
      {
        unsigned int v12 = v7 + 2;
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2PayloadMetaDataTLV(a1, a2, v8, v9, v12);
        uint64_t v7 = (_DWORD *)((char *)v12 + v10);
        *(_DWORD *)(a3 + 88) += v10;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v13 = 53LL;
    UARPLayer2PayloadMetaDataProcessingError((uint64_t)a1, a2);
  }

  return v13;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44LL;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43LL;
    }
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 36_Block_object_dispose((const void *)(v1 - 80), 8) = v7;
    *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetPayloadDataRequestCompleted;
    if (*(_BYTE *)(a2 + 516) == 1)
    {
      *(_BYTE *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
    }

    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if ((_DWORD)result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11LL;
      }
    }

    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (!v10)
    {
LABEL_19:
      UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }

    uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
    if (!(_DWORD)result)
    {
      if (*(void *)(a2 + 440)) {
        goto LABEL_19;
      }
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetPayloadDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!(_DWORD)v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash( a1,  *(void **)(a3 + 128),  *(unsigned int *)(a3 + 120),  *(void **)(a2 + 528),  *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0LL;
    *(_DWORD *)(a3 + 10_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
  }

  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
    *(_DWORD *)(a3 + 120) = 0;
  }

  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressionHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(_BYTE *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  uint64_t result = 0LL;
  *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressedBlock;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetAllPayloadHeadersRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetAllPayloadHeadersRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }

      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if ((_DWORD)result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetAllPayloadHeadersRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11LL;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if ((_DWORD)v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
  }

  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpHtonl(*a2);
  unsigned int v5 = uarpHtonl(a2[1]);
  uint64_t v9 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0LL;
  if (!v6)
  {
    uint64_t v7 = v9;
    *uint64_t v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }

  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 28);
    unsigned int v5 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 312) = v6;
    *(_DWORD *)(a2 + 316) = v5;
    for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
    {
      int v8 = *(_DWORD *)(i + 24);
      if (v8)
      {
        if (v8 != v5 + v6) {
          return 43LL;
        }
        v5 += *(_DWORD *)(i + 28);
        *(_DWORD *)(a2 + 316) = v5;
      }
    }

    *(_DWORD *)(a2 + 680) = v5;
    *(void *)(a2 + 672) = 0LL;
    if (v5)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
      if ((_DWORD)result) {
        return result;
      }
      int v9 = *(_DWORD *)(a2 + 680);
      int v10 = *(_DWORD *)(a2 + 316);
      *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(void *)(a2 + 672);
      *(_DWORD *)(a2 + 336) = v9;
      *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
      if (v10) {
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      *(void *)(a2 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
      *(_DWORD *)(a2 + 336) = 0;
      *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
    }

    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0LL;
  }

  return result;
}

uint64_t uarpPlatformAssetAllMetaDataWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18LL;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10LL;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }

  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18LL;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10LL;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 16_Block_object_dispose((const void *)(v1 - 80), 8) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }

        int v19 = 0;
LABEL_17:
        uint64_t result = 0LL;
        v13 += v19;
        *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }

    return 0LL;
  }

uint64_t uarpPlatformAssetAllMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressedBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer( a1,  *(unsigned __int16 *)(a3 + 45),  *(void *)(a3 + 16),  *(unsigned __int16 *)(a3 + 51),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
  if ((_DWORD)v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2LL, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }

  else
  {
    UARPLayer2HashUpdate( a1,  *(unsigned int *)(a3 + 104),  *(void *)(a3 + 112),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(_BYTE *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
  }

  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(void, void *))(a1 + 48);
  if (v4) {
    return v4(*(void *)(a1 + 544), a2);
  }
  uint64_t v6 = uarpZalloc(a3);
  *a2 = v6;
  if (v6) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  char v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(void, void *, size_t))(a1 + 48);
  if (v6) {
    return v6(*(void *)(a1 + 544), a3, v5);
  }
  int v8 = uarpZalloc(v5);
  *a3 = v8;
  if (v8) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(void, void, const void *, uint64_t))(a1 + 80);
  if (!v4) {
    return 14LL;
  }
  if (!*(_WORD *)(a2 + 136)) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3, a4);
  }
  uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
  uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
  return 0LL;
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 152);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 168);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 184);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 200);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[27];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpPayloadTagPack(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[29];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpPayloadTagPack(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  char v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1LL;
  return 0LL;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }

  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }

  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 320);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  int v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  char v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  int v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(void, void, uint64_t, uint64_t, _DWORD *))(a2 + 120);
  if (v11) {
    return (void *)v11(a1[68], *(void *)(a2 + 704), a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!(_DWORD)result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash( a1,  *(void **)(a2 + 560),  *(unsigned int *)(a2 + 568),  *(void **)(a2 + 576),  *(_DWORD *)(a2 + 584));
  if ((_DWORD)result)
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 128);
    if (!v6) {
      return result;
    }
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }

  uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v6) {
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  char v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  int v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  int v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

char *uarpAssetTagVoiceAssist4cc()
{
  uint64_t result = uarpAssetTagVoiceAssist4cc_assetTag;
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagVoiceAssist()
{
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagVoiceAssist4cc_assetTag);
}

int *uarpAssetTagStructVoiceAssist()
{
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructVoiceAssist_myTag;
  uarpAssetTagStructVoiceAssist_myTag = *(_DWORD *)uarpAssetTagVoiceAssist4cc_assetTag;
  return result;
}

__int16 *uarpOuiVoiceAssist()
{
  uint64_t result = &uarpOuiVoiceAssist_myOui;
  uarpOuiVoiceAssist_myOuuint64_t i = -30716;
  byte_18C6F9ACA = -30;
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
  }

  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
  }

  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 56_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL; v4; *(void *)(a1 + 56_Block_object_dispose((const void *)(v1 - 80), 8) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0LL;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if ((*(_WORD *)(v7 + 46) & 1) != 0)
          {
            *(void *)(v7 + 696) = 0LL;
            UARPLayer2AssetOrphaned(a1, v7);
          }

          else
          {
            *(_BYTE *)(v7 + 72) = 1;
          }
        }

        if (*(_BYTE *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0LL;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }

      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0LL;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0LL;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(_BYTE *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0LL;
  *(_DWORD *)(a2 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(_BYTE *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0LL;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0LL;
  }

  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0LL;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }

    while (v8);
  }

  *(void *)(a2 + 720) = 0LL;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      int v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          int v12 = (void *)v10[2];
          void v10[2] = 0LL;
          UARPLayer2ReturnBuffer(a1, v10);
          int v10 = v12;
        }

        while (v12);
      }

      v9[21] = 0LL;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }

    while (v11);
  }

  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0LL;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }

              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }

              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 56_Block_object_dispose((const void *)(v1 - 80), 8) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = *a4;
              }

              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0LL;
    *(_DWORD *)(a2 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
  }

  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0LL;
    *(_DWORD *)(a2 + 104) = 0;
  }

  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0LL;
    *(_DWORD *)(a2 + 120) = 0;
  }

  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0LL;
    *(_DWORD *)(a2 + 72) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0LL;
    *(_DWORD *)(a2 + 160) = 0;
  }

  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0LL;
    *(_DWORD *)(a2 + 144) = 0;
  }

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }

    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0LL);
    }
  }

  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }

    while (v2);
  }

  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if ((_DWORD)result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }

  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0LL;
    a3[1] = v7;
    return result;
  }

  return 39LL;
}

uint64_t uarpPlatformQueryAccessoryInfo( void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) <= 1)
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }

          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }

          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }

        return 39LL;
      }

      if (a2 == 8)
      {
        *a5 = 8;
        if (a4 < 8) {
          return 39LL;
        }
        uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
        *a3 = uarpHtonl(*a3);
        a3[1] = uarpHtonl(a3[1]);
      }

      else
      {
        *a5 = 0;
        return 28LL;
      }

      return Error;
  }

uint64_t uarpPlatformResponseAccessoryInfo( uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 13_Block_object_dispose((const void *)(v1 - 80), 8) = *(_OWORD *)a6;
      }

      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }

      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        a6[2] = uarpHtonl(a6[2]);
        a6[3] = uarpHtonl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }

      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }

      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t uarpPlatformAssetDataRequest( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17LL;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17LL;
    }
  }

  unsigned int v10 = *(_DWORD *)(v8 + 68);
  else {
    unsigned __int16 v11 = a4;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return UARPLayer2DataTransferResume(a1, a2);
  }
  while (1)
  {
    if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
    {
      uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
      if ((_DWORD)result) {
        break;
      }
    }

    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return UARPLayer2DataTransferResume(a1, a2);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(_BYTE *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }

    while (v5);
  }

  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0LL;
  }

  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }

    else
    {
      return 11LL;
    }
  }

  else if (a4 == 3)
  {
    return 0LL;
  }

  else
  {
    return 13LL;
  }

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpPayloadTagPack((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  *(_DWORD *)(v6[2] + 6LL) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0LL;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }

  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0LL;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 56_Block_object_dispose((const void *)(v1 - 80), 8) = result;
    }
  }

  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1LL;
  }
  if ((_DWORD)__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0LL;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1LL;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2LL;
  }
  uint64_t v5 = 0LL;
  unint64_t v6 = 0LL;
  while (uarpAssetTagIsValid((_BYTE *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4LL;
  }

  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }

            if (!--v3) {
              return result;
            }
          }

          *(_BYTE *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(_BYTE *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
        }

        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }

    uint64_t result = 0LL;
    void *v5 = a2;
  }

  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0LL;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!(_DWORD)result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if ((_DWORD)v9)
      {
        uint64_t v10 = 0LL;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8LL;
        }

        while (8 * v9 != v10);
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0LL;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0LL;
  if (!v2)
  {
    else {
      return v4;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59LL;
  }
  if (!v4) {
    return 60LL;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61LL;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 1u);
}

uint64_t uarpSendDataTransferNotification(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13LL;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11LL;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(_BYTE *)(v14 + _Block_object_dispose((const void *)(v1 - 80), 8) = *((_BYTE *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5)
  {
    if (a6) {
      memcpy((void *)(v14 + 11), a5, a6);
    }
  }

  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30LL;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9LL;
  }
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  unsigned __int16 v9 = uarpHtons(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9LL;
  }
  uint64_t v4 = 1LL;
  *(_BYTE *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }

      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0LL;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpHtons(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0LL;
            *(void *)(a2 + 13_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
            *(void *)(a2 + 162) = 0LL;
            *(void *)(a2 + 154) = 0LL;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }

            if (*(_BYTE *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }

          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
      }

    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpHtons(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpHtons(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2LL;
        goto LABEL_184;
      }

      unsigned int v118 = uarpHtons(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0LL;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      unsigned int v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }

      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }

      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpHtons(a3[3]);
      int v26 = uarpHtonl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpHtonl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpHtons(a3[5]);
      uint64_t v29 = uarpHtons(a3[6]);
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), &v129);
      unsigned int v30 = uarpHtonl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpHtons(a3[17]);
      __int16 v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpPayloadTagPack(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap((unsigned int *)&v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }

      *(void *)(PreparedAsset + 452) = -1LL;
      *(_DWORD *)(PreparedAsset + 44_Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtons(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 4_Block_object_dispose((const void *)(v1 - 80), 8) = v130;
      *(_OWORD *)(PreparedAsset + 52) = v129;
      *(_DWORD *)(PreparedAsset + 6_Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtonl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if ((v37 & 1) != 0)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }

      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22LL;
          goto LABEL_184;
        }

        UARPLayer2DynamicAssetOffered(a1, a2);
      }

      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpHtons(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129) = v39;
      uint64_t v40 = uarpHtonl(*((_DWORD *)a3 + 2));
      int v41 = uarpHtons(a3[3]);
      uint64_t v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      unsigned int v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)&v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + _Block_object_dispose((const void *)(v1 - 80), 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons((unsigned __int16)v129);
      __int16 v45 = v129 + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(v129 + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpHtons(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpHtons(a3[3]);
      int v50 = uarpHtonl(*(_DWORD *)(a3 + 5));
      int v51 = uarpHtons(a3[7]);
      size_t v52 = uarpHtons(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0LL;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpHtons(a3[3]);
      uint64_t v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(_BYTE *)(a2 + 56) == 1)
      {
        *(_BYTE *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }

      if ((v54 & 2) == 0 || *(_BYTE *)(a2 + 56))
      {
        uint64_t v4 = 33LL;
        goto LABEL_184;
      }

      *(_BYTE *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpHtons(a3[3]);
      uint64_t v57 = uarpHtons(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      uint64_t v59 = (void *)v58;
      LODWORD(v129) = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      uint64_t v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        uint64_t v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)&v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0LL;
            }

            else
            {
              unint64_t v127 = 0LL;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }

              while (v127 < v65);
            }

            v128 = *(_BYTE **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }

      goto LABEL_183;
    case 0xAu:
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11LL;
      __n128 v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      unsigned int v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + _Block_object_dispose((const void *)(v1 - 80), 8) = uarpHtons((unsigned __int16)v129);
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpHtons(a3[3]);
      v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!(_DWORD)v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpHtons(a3[3]);
      if ((v75 & 1) != 0)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }

      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26LL;
          goto LABEL_184;
        }

        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }

      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(_BYTE *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpHtons(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0LL);
        goto LABEL_183;
      }

      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }

LABEL_149:
      uint64_t v4 = 17LL;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9LL;
        goto LABEL_184;
      }

      v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11LL;
        goto LABEL_184;
      }

      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, &v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }

      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, &v129, 2u, 3328);
      }

      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpHtons(a3[5]);
      int v82 = *(_DWORD *)(a3 + 3);
      LODWORD(v129) = v82;
      v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)&v129);
      if (v86)
      {
        *(_BYTE *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }

      uint64_t v4 = 3LL;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpHtons(a3[5]);
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)&v129);
      if (v87)
      {
        *(_BYTE *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if ((_DWORD)v4 != 3) {
          goto LABEL_184;
        }
      }

      goto LABEL_183;
    case 0x15u:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + _Block_object_dispose((const void *)(v1 - 80), 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpHtons(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if ((_DWORD)v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpHtons(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + _Block_object_dispose((const void *)(v1 - 80), 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || (_DWORD)v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpHtons(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + _Block_object_dispose((const void *)(v1 - 80), 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }

      v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126( *(void *)(a1 + 544),  8LL,  "UARP.LAYER2 <%s> Cannot find downstream endpoint",  "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58LL;
      goto LABEL_184;
    case 0x1Du:
      v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!(_DWORD)v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8LL;
      }

      else
      {
        uarpHtons(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }

      goto LABEL_184;
  }

  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
  }

  if (uarpHtons(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }

  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0LL;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

int *uarpAssetTagStructVersions()
{
  uint64_t result = &uarpAssetTagStructVersions_myTag;
  uarpAssetTagStructVersions_myTag = 1397900630;
  return result;
}

uint64_t uarpAssetTagVersions()
{
  uarpAssetTagStructVersions_myTag = 1397900630;
  return uarpPayloadTagPack((unsigned int *)&uarpAssetTagStructVersions_myTag);
}

_BYTE *uarpAssetTagVersions4cc()
{
  uarpAssetTagStructVersions_myTag = 1397900630;
  uarpPayloadTagStructPack(&uarpAssetTagStructVersions_myTag, uarpAssetTagVersions4cc_payload4cc);
  return uarpAssetTagVersions4cc_payload4cc;
}

__int16 *uarpOuiVersions()
{
  uint64_t result = &uarpOuiVersions_myOui;
  uarpOuiVersions_myOuuint64_t i = -6588;
  byte_18C6F9AD6 = 110;
  return result;
}

uint64_t uarpVersionsAssetInitialize(uint64_t a1, uint64_t a2)
{
  __int128 v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 0);
}

uint64_t uarpVersionsAssetAddPayloadInfo(uint64_t a1, uint64_t a2, int *a3, unsigned int *a4, unsigned int *a5)
{
  int v9 = *a3;
  uarpVersionEndianSwap(a4, v10);
  uarpVersionEndianSwap(a5, v11);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x44E66E00u, 0x24u, (uint64_t)&v9);
}

uint64_t uarpVersionsAssetAddPartnerSerialInfo(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return UARPSuperBinaryAddMetaData(a1, a2, 0x44E66E01u, a4, a3);
}

__int16 *uarpOuiAppleGenericFeatures()
{
  uint64_t result = &uarpOuiAppleGenericFeatures_myOui;
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_18C6F9AD9 = 99;
  return result;
}

uint64_t uarpApplePlatformEndpointRecvMessage( uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  uint64_t result = 30LL;
  if (!a1 || !a2 || !a3 || !a5) {
    return result;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_18C6F9AD9 = 99;
  if (a4 != 33)
  {
    if (a4 == 32 && a6 >= 4)
    {
      int v12 = *(_DWORD *)a2;
      uint64_t v13 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)*(_DWORD *)a2, 0);
      if (!v13) {
        return 11LL;
      }
      uint64_t v14 = (uint64_t)v13;
      uint64_t v15 = v13[2];
      uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
      byte_18C6F9AD9 = 99;
      *(_WORD *)(v15 + 6) = 2492;
      *(_BYTE *)(v15 + _Block_object_dispose((const void *)(v1 - 80), 8) = 99;
      *(_WORD *)(v15 + 9) = uarpHtons(0x21u);
      unsigned int v16 = *(void **)(a1 + 40);
      unsigned int v46 = 0;
      unsigned int v17 = uarpHtonl(*a5);
      int v18 = (unint64_t *)(v15 + 23);
      uint64_t v19 = (v12 - 23);
      switch(v17)
      {
        case 1u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[1];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 1LL;
          goto LABEL_90;
        case 2u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[3];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 2LL;
          goto LABEL_90;
        case 3u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[5];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 3LL;
          goto LABEL_90;
        case 4u:
          uint64_t v29 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[7];
          if (!v29) {
            goto LABEL_91;
          }
          unsigned int v30 = v29(*(void *)(a1 + 544), 4LL, v15 + 23, v19, &v46);
          unsigned int v31 = v46;
          if (v46 != 8) {
            goto LABEL_74;
          }
LABEL_41:
          unint64_t *v18 = uarpHtonll(*v18);
          break;
        case 5u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[9];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 5LL;
          goto LABEL_72;
        case 6u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[11];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 6LL;
          goto LABEL_72;
        case 7u:
          uint64_t v35 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[13];
          if (!v35) {
            goto LABEL_91;
          }
          unsigned int v30 = v35(*(void *)(a1 + 544), 7LL, v15 + 23, v19, &v46);
          break;
        case 8u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[17];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 8LL;
          goto LABEL_72;
        case 9u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[19];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 9LL;
          goto LABEL_72;
        case 0xAu:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[21];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 10LL;
          goto LABEL_72;
        case 0xBu:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[23];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 11LL;
          goto LABEL_72;
        case 0xCu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[25];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 12LL;
          goto LABEL_90;
        case 0xDu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[27];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 13LL;
          goto LABEL_90;
        case 0xEu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[29];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 14LL;
          goto LABEL_90;
        case 0xFu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[31];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 15LL;
          goto LABEL_90;
        case 0x10u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[33];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 16LL;
          goto LABEL_72;
        case 0x11u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[35];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 17LL;
          goto LABEL_90;
        case 0x12u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[37];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 18LL;
          goto LABEL_90;
        case 0x13u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[39];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 19LL;
          goto LABEL_72;
        case 0x14u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[41];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 20LL;
          goto LABEL_72;
        case 0x15u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[43];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 21LL;
          goto LABEL_72;
        case 0x16u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[45];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 22LL;
LABEL_72:
          unsigned int v30 = v32(v33, v34, v15 + 23, v19, &v46);
          unsigned int v31 = v46;
LABEL_74:
          if (v31 == 4) {
            *(_DWORD *)int v18 = uarpHtonl(*(_DWORD *)v18);
          }
          break;
        case 0x17u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[47];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 23LL;
          goto LABEL_90;
        case 0x18u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[49];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 24LL;
          goto LABEL_90;
        case 0x19u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[51];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 25LL;
          goto LABEL_90;
        case 0x1Au:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[53];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 26LL;
          goto LABEL_90;
        case 0x1Bu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[55];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 27LL;
          goto LABEL_90;
        case 0x1Cu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[57];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 28LL;
          goto LABEL_90;
        case 0x1Du:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[15];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 29LL;
LABEL_90:
          unsigned int v30 = v20(v21, v22, v15 + 23, v19, &v46);
          break;
        default:
LABEL_91:
          unsigned int v30 = 26;
          break;
      }

      *(_DWORD *)(v15 + 11) = uarpHtonl(v30);
      *(_DWORD *)(v15 + 15) = uarpHtonl(v17);
      *(_DWORD *)(v15 + 19) = uarpHtonl(v46);
      __int16 v36 = v46 + 23;
      *(_WORD *)(v15 + 2) = uarpHtons((unsigned __int16)(v46 + 17));
      *(_WORD *)(v14 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = v36;
      return uarpTransmitBuffer2(a1, a2, v14);
    }

    return 9LL;
  }

  if (a6 < 4) {
    return 9LL;
  }
  if (a6 < 0xC) {
    return 8LL;
  }
  int v23 = uarpHtonl(a5[1]);
  uint64_t v24 = uarpHtonl(a5[2]);
  uint64_t v25 = v24;
  if ((_DWORD)v24) {
    int v26 = (unint64_t *)(a5 + 3);
  }
  else {
    int v26 = 0LL;
  }
  unsigned int v27 = *(void **)(a1 + 40);
  switch(v23)
  {
    case 1:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[2];
      if (v28) {
        goto LABEL_118;
      }
      return 1LL;
    case 2:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[4];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 3:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[6];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 4:
      uint64_t v38 = v27[8];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 8);
      if (!v38) {
        return 1LL;
      }
      if ((_DWORD)v24 == 8) {
        goto LABEL_107;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_117;
      }
      break;
    case 5:
      unsigned __int16 v39 = (void (*)(void, void, unint64_t *, uint64_t))v27[10];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 10);
      unsigned int v28 = v39;
      if (!v39) {
        return 1LL;
      }
      goto LABEL_115;
    case 6:
      uint64_t v40 = (void (*)(void, void, unint64_t *, uint64_t))v27[12];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 12);
      unsigned int v28 = v40;
      if (!v40) {
        return 1LL;
      }
      goto LABEL_115;
    case 7:
      int v41 = (void (*)(void, void, unint64_t *, uint64_t))v27[14];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 14);
      unsigned int v28 = v41;
      if (!v41) {
        return 1LL;
      }
      if ((_DWORD)v24 != 8) {
        goto LABEL_118;
      }
LABEL_107:
      *int v26 = uarpHtonll(*v26);
      goto LABEL_117;
    case 8:
      uint64_t v42 = (void (*)(void, void, unint64_t *, uint64_t))v27[18];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 18);
      unsigned int v28 = v42;
      if (!v42) {
        return 1LL;
      }
      goto LABEL_115;
    case 9:
      uint64_t v43 = (void (*)(void, void, unint64_t *, uint64_t))v27[20];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 20);
      unsigned int v28 = v43;
      if (!v43) {
        return 1LL;
      }
      goto LABEL_115;
    case 10:
      unsigned __int16 v44 = (void (*)(void, void, unint64_t *, uint64_t))v27[22];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 22);
      unsigned int v28 = v44;
      if (!v44) {
        return 1LL;
      }
      goto LABEL_115;
    case 11:
      __int16 v45 = (void (*)(void, void, unint64_t *, uint64_t))v27[24];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 24);
      unsigned int v28 = v45;
      if (!v45) {
        return 1LL;
      }
LABEL_115:
      if ((_DWORD)v24 == 4) {
        break;
      }
      goto LABEL_118;
    case 12:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[26];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 13:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[28];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 14:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[30];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 15:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[32];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 16:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[34];
      if (!v28) {
        return 1LL;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 34);
      break;
    case 17:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[36];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 18:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[38];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 19:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[40];
      if (!v28) {
        return 1LL;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 40);
      break;
    case 20:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[42];
      if (!v28) {
        return 1LL;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 42);
      break;
    case 21:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[44];
      if (!v28) {
        return 1LL;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 44);
      break;
    case 22:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[46];
      if (!v28) {
        return 1LL;
      }
      if ((_DWORD)v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 46);
      break;
    case 23:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[48];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 24:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[50];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 25:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[52];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 26:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[54];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 27:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[56];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 28:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[58];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    case 29:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[16];
      if (!v28) {
        return 1LL;
      }
      goto LABEL_118;
    default:
      return 1LL;
  }

  *(_DWORD *)int v26 = uarpHtonl(*(_DWORD *)v26);
LABEL_117:
  unsigned int v28 = *v37;
LABEL_118:
  v28(*(void *)(a1 + 544), *(void *)(a2 + 40), v26, v25);
  return 0LL;
}

BOOL uarpApplePlatformMessageCheckExpectedResponse( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (a6 < 0xB) {
    return 0LL;
  }
  if (*(unsigned __int16 *)(a5 + 6) != *(unsigned __int16 *)(a3 + 6)
    || *(unsigned __int8 *)(a5 + 8) != *(unsigned __int8 *)(a3 + 8))
  {
    return 0LL;
  }

  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_18C6F9AD9 = 99;
  BOOL v10 = *(_WORD *)(a5 + 6) == 2492 && *(_BYTE *)(a5 + 8) == 99;
  int v12 = uarpHtons(*(unsigned __int16 *)(a3 + 9));
  BOOL result = 0LL;
  if (a6 >= 0x17 && v12 == 32) {
    return *(_DWORD *)(a5 + 15) == *(_DWORD *)(a3 + 11);
  }
  return result;
}

uint64_t uarpApplePlatformMessageCheckValidToSend(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4) {
    return 1LL;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_18C6F9AD9 = 99;
  if (*(_WORD *)(a3 + 6) != 2492 || *(_BYTE *)(a3 + 8) != 99) {
    return 1LL;
  }
  int v11 = uarpHtons(*(unsigned __int16 *)(a3 + 9));
  uint64_t result = 1LL;
  if (a4 >= 0xF && v11 == 32)
  {
    if (uarpHtonl(*(_DWORD *)(a3 + 11)) == 2
      && (*(unsigned __int16 *)(a2 + 48) < 2u || *(_DWORD *)(a2 + 24)))
    {
      int v12 = *(void (**)(void, void, void, void))(v4 + 32);
      if (v12) {
LABEL_14:
      }
        v12(*(void *)(a1 + 544), *(void *)(a2 + 40), 0LL, 0LL);
    }

    else
    {
      if (uarpHtonl(*(_DWORD *)(a3 + 11)) != 1
        || *(unsigned __int16 *)(a2 + 48) >= 2u && !*(_DWORD *)(a2 + 24))
      {
        return 1LL;
      }

      int v12 = *(void (**)(void, void, void, void))(v4 + 16);
      if (v12) {
        goto LABEL_14;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t uarpApplePlatformMessageExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void **)(result + 40);
  if (v4)
  {
    uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
    byte_18C6F9AD9 = 99;
    if (*(_WORD *)(a3 + 6) == 2492 && *(_BYTE *)(a3 + 8) == 99)
    {
      uint64_t v9 = result;
      uint64_t result = uarpHtons(*(unsigned __int16 *)(a3 + 9));
      if (a4 >= 0xF && (_DWORD)result == 32)
      {
        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if ((_DWORD)result == 1)
        {
          BOOL v10 = (uint64_t (*)(void, void, void, void))v4[2];
          if (!v10) {
            return result;
          }
          return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
        }

        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if ((_DWORD)result == 2)
        {
          BOOL v10 = (uint64_t (*)(void, void, void, void))v4[4];
          if (v10) {
            return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
          }
        }

        else
        {
          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
          if ((_DWORD)result == 3)
          {
            BOOL v10 = (uint64_t (*)(void, void, void, void))v4[6];
            if (v10) {
              return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
            }
          }

          else
          {
            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
            if ((_DWORD)result == 4)
            {
              BOOL v10 = (uint64_t (*)(void, void, void, void))v4[8];
              if (v10) {
                return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
              }
            }

            else
            {
              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
              if ((_DWORD)result == 5)
              {
                BOOL v10 = (uint64_t (*)(void, void, void, void))v4[10];
                if (v10) {
                  return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                }
              }

              else
              {
                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                if ((_DWORD)result == 6)
                {
                  BOOL v10 = (uint64_t (*)(void, void, void, void))v4[12];
                  if (v10) {
                    return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                  }
                }

                else
                {
                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                  if ((_DWORD)result == 7)
                  {
                    BOOL v10 = (uint64_t (*)(void, void, void, void))v4[14];
                    if (v10) {
                      return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                    }
                  }

                  else
                  {
                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                    if ((_DWORD)result == 29)
                    {
                      BOOL v10 = (uint64_t (*)(void, void, void, void))v4[16];
                      if (v10) {
                        return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                      }
                    }

                    else
                    {
                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                      if ((_DWORD)result == 8)
                      {
                        BOOL v10 = (uint64_t (*)(void, void, void, void))v4[18];
                        if (v10) {
                          return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                        }
                      }

                      else
                      {
                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                        if ((_DWORD)result == 9)
                        {
                          BOOL v10 = (uint64_t (*)(void, void, void, void))v4[20];
                          if (v10) {
                            return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                          }
                        }

                        else
                        {
                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                          if ((_DWORD)result == 10)
                          {
                            BOOL v10 = (uint64_t (*)(void, void, void, void))v4[22];
                            if (v10) {
                              return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                            }
                          }

                          else
                          {
                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                            if ((_DWORD)result == 11)
                            {
                              BOOL v10 = (uint64_t (*)(void, void, void, void))v4[24];
                              if (v10) {
                                return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                              }
                            }

                            else
                            {
                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                              if ((_DWORD)result == 12)
                              {
                                BOOL v10 = (uint64_t (*)(void, void, void, void))v4[26];
                                if (v10) {
                                  return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                }
                              }

                              else
                              {
                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                if ((_DWORD)result == 13)
                                {
                                  BOOL v10 = (uint64_t (*)(void, void, void, void))v4[28];
                                  if (v10) {
                                    return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                  }
                                }

                                else
                                {
                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                  if ((_DWORD)result == 14)
                                  {
                                    BOOL v10 = (uint64_t (*)(void, void, void, void))v4[30];
                                    if (v10) {
                                      return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                    }
                                  }

                                  else
                                  {
                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                    if ((_DWORD)result == 15)
                                    {
                                      BOOL v10 = (uint64_t (*)(void, void, void, void))v4[32];
                                      if (v10) {
                                        return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                      }
                                    }

                                    else
                                    {
                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                      if ((_DWORD)result == 16)
                                      {
                                        BOOL v10 = (uint64_t (*)(void, void, void, void))v4[34];
                                        if (v10) {
                                          return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                        }
                                      }

                                      else
                                      {
                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                        if ((_DWORD)result == 17)
                                        {
                                          BOOL v10 = (uint64_t (*)(void, void, void, void))v4[36];
                                          if (v10) {
                                            return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                          }
                                        }

                                        else
                                        {
                                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                          if ((_DWORD)result == 18)
                                          {
                                            BOOL v10 = (uint64_t (*)(void, void, void, void))v4[38];
                                            if (v10) {
                                              return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                            }
                                          }

                                          else
                                          {
                                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                            if ((_DWORD)result == 19)
                                            {
                                              BOOL v10 = (uint64_t (*)(void, void, void, void))v4[40];
                                              if (v10) {
                                                return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                              }
                                            }

                                            else
                                            {
                                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                              if ((_DWORD)result == 20)
                                              {
                                                BOOL v10 = (uint64_t (*)(void, void, void, void))v4[42];
                                                if (v10) {
                                                  return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                                }
                                              }

                                              else
                                              {
                                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                if ((_DWORD)result == 21)
                                                {
                                                  BOOL v10 = (uint64_t (*)(void, void, void, void))v4[44];
                                                  if (v10) {
                                                    return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                  if ((_DWORD)result == 22)
                                                  {
                                                    BOOL v10 = (uint64_t (*)(void, void, void, void))v4[46];
                                                    if (v10) {
                                                      return v10(*(void *)(v9 + 544), *(void *)(a2 + 40), 0LL, 0LL);
                                                    }
                                                  }

                                                  else
                                                  {
                                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                    if ((_DWORD)result == 23)
                                                    {
                                                      BOOL v10 = (uint64_t (*)(void, void, void, void))v4[48];
                                                      if (v10) {
                                                        return v10( *(void *)(v9 + 544),  *(void *)(a2 + 40),  0LL,  0LL);
                                                      }
                                                    }

                                                    else
                                                    {
                                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                      if ((_DWORD)result == 24)
                                                      {
                                                        BOOL v10 = (uint64_t (*)(void, void, void, void))v4[50];
                                                        if (v10) {
                                                          return v10( *(void *)(v9 + 544),  *(void *)(a2 + 40),  0LL,  0LL);
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + _Block_object_dispose((const void *)(v1 - 80), 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = uarpAssetTagChdr4cc_assetTag;
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagChdr4cc_assetTag);
}

int *uarpAssetTagStructChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructChdr_myTag;
  uarpAssetTagStructChdr_myTag = *(_DWORD *)uarpAssetTagChdr4cc_assetTag;
  return result;
}

char *uarpAssetTagHeySiriModel4cc()
{
  uint64_t result = uarpAssetTagHeySiriModel4cc_assetTag;
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagHeySiriModel()
{
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagHeySiriModel4cc_assetTag);
}

int *uarpAssetTagStructHeySiriModel()
{
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructHeySiriModel_myTag;
  uarpAssetTagStructHeySiriModel_myTag = *(_DWORD *)uarpAssetTagHeySiriModel4cc_assetTag;
  return result;
}

__int16 *uarpOuiHeySiriModel()
{
  uint64_t result = &uarpOuiHeySiriModel_myOui;
  uarpOuiHeySiriModel_myOuuint64_t i = -29856;
  byte_18C6F9AE6 = 14;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if ((_DWORD)result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!(_DWORD)result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }

  *a2 = v4;
  a2[1] = v2;
  if ((_DWORD)result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

_BYTE *uarpPayloadTagStructPack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2LL;
  }
  if (*a1 < *a2) {
    return 1LL;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2LL;
  }
  if (v2 < v3) {
    return 1LL;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2LL;
  }
  if (v4 < v5) {
    return 1LL;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2LL;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }

  else
  {
    return 3LL;
  }

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  uint64_t result = uarpHtonl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return (&off_18A143A28)[a1];
  }
}

BOOL uarpAssetTagIsValid(_BYTE *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &uarpAssetTagStructSuperBinary_myTag;
  uarpAssetTagStructSuperBinary_myTag = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  else {
    return (&off_18A143C20)[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return (&off_18A143C50)[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  else {
    return (&off_18A143CC8)[(__int16)(a1 - 1)];
  }
}

__int128 *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)uarpStageStatusToString_stageStatusString, "Upload Complete");
      return uarpStageStatusToString_stageStatusString;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)uarpStageStatusToString_stageStatusString, 0x100uLL, "%s (%s)", v1, v2);
      return uarpStageStatusToString_stageStatusString;
  }

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return (&off_18A143D38)[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return (&off_18A143CF0)[a1];
  }
}

void *uarpProcessPayloadTLVInternal( void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 == -858619624)
  {
    *(_DWORD *)(a3 + 120) = a5;
    uint64_t v15 = (void **)(a3 + 112);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619625)
  {
    if ((_DWORD)a5 == 2)
    {
      uint64_t v12 = uarpHtons(*(unsigned __int16 *)a6);
      *(_DWORD *)(a3 + 76) = v12;
      UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
      unsigned int v13 = *(_DWORD *)(a3 + 88);
      if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
      {
        unsigned int v14 = *(_DWORD *)(a3 + 104);
      }

      *(_DWORD *)(a3 + 76) = 0;
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (*(_DWORD *)(a3 + 76))
  {
    int v18 = uarpHtonl(a4);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v18, 4LL);
    int v17 = uarpHtonl(a5);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v17, 4LL);
    uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
  }

  if (a4 > -858619631)
  {
    if (a4 == -858619630)
    {
      if ((_DWORD)a5 == 2)
      {
        uint64_t result = (void *)uarpHtons(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 56) = (_DWORD)result;
        return result;
      }
    }

    else
    {
      if (a4 != -858619623) {
        return result;
      }
      if ((_DWORD)a5 == 4)
      {
        uint64_t result = (void *)uarpHtonl(*a6);
        *(_DWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = (_DWORD)result;
        return result;
      }
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619641)
  {
    *(_DWORD *)(a3 + 72) = a5;
    unsigned int v16 = (void **)(a3 + 64);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 != -858619636) {
    return result;
  }
  if ((_DWORD)a5 != 4) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  uint64_t result = (void *)uarpHtonl(*a6);
  if (!(_DWORD)result) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_BYTE *)(a3 + 52) = 1;
  if (!*(void *)(a2 + 656))
  {
    uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
    if (*(void *)(a2 + 656))
    {
      *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
      *(_BYTE *)(a2 + 66_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
    }
  }

  return result;
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2LL;
  }
  else {
    return 3LL;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }

  return result;
}

void uarpPrintDataResponseDetails( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    else {
      uint64_t v15 = (&off_18A143D38)[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12( v13,  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v15,  v18,  a5,  a6,  a7);
  }

  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    else {
      int v17 = (&off_18A143D38)[v16];
    }
    uint64_t v19 = uarpStatusCodeToString(a4);
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v17,  v19,  a5,  a6,  a7);
  }

  unsigned int v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    else {
      uint64_t v22 = (&off_18A143D38)[v21];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20( *(void *)(a1 + 544),  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v22,  v25,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    else {
      uint64_t v24 = (&off_18A143D38)[v23];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v24,  v26,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  uint64_t result = 0LL;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0LL;
    }

    else
    {
      unsigned int v9 = v11;
      uint64_t result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }

  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0LL;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }

    while (v16 != v17);
  }

  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0LL;
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 8LL * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8LL;
    }

    while (v21 != v20);
  }

  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((_BYTE *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)void v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }

    return 0LL;
  }

  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + _Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
      }

      v4 += 8LL;
    }

    while (8LL * (v3 - 1) != v4);
  }

  if (!(_DWORD)v3) {
    return 11LL;
  }
  for (uint64_t i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11LL;
    }
  }

  *uint64_t i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0LL;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v4 = a1;
  while (1)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
        if (v6) {
          break;
        }
        if (++v5 == v2) {
          return 0LL;
        }
      }

      if (*(_BYTE *)(v6 + 32) != 1) {
        break;
      }
      ++v5;
      if (*(void *)(v4 + 296)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v5 == v2;
      }
      if (v7) {
        return 0LL;
      }
    }

    if (*(_BYTE *)(v6 + 33) == 1) {
      goto LABEL_21;
    }
    int v8 = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF) {
      break;
    }
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if ((_DWORD)a1) {
      goto LABEL_23;
    }
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    uint64_t v9 = 0LL;
    int v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112)) {
      return v9;
    }
  }

  if (v8 == 3
    && uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }

LABEL_23:
  if (*(_BYTE *)(a2 + 50) == 1) {
    return 0LL;
  }
  unsigned int v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(_BYTE *)(v6 + 30) = v10 + 1;
    *(_BYTE *)(v6 + 32) = 1;
    if (*(_BYTE *)(v6 + 31) == 1) {
      UARPLayer2WatchdogSet(v4, a2);
    }
    *(_WORD *)(*(void *)(v6 + 16) + 4LL) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    uint64_t v9 = UARPLayer2SendMessage( v4,  a2,  *(const void **)v6,  *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v6 + 28));
    UARPLayer2LogPacket(v4, a2);
    if ((_DWORD)v9)
    {
      *(_BYTE *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v6 + 16));
    }
  }

  else
  {
    uint64_t active = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    switch((_DWORD)active)
    {
      case 0xFFFF:
        uint64_t active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        uint64_t active = uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL));
        switch((int)active)
        {
          case 1:
            uint64_t active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            uint64_t active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            uint64_t active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            uint64_t active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            uint64_t active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            uint64_t active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            uint64_t active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            uint64_t active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            uint64_t active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }

        break;
      case 1:
        *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
        uint64_t active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }

LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0LL;
  }

  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }

    void *v4 = 0LL;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }

      *int v8 = a3;
    }

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v25 = a4 & 0xFFF8;
    int v11 = a4 & 0xFFF0;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_38;
      }
      int v13 = uarpHtons(*a3);
      int v14 = uarpHtons(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11) {
          goto LABEL_38;
        }
        int v19 = *((_DWORD *)a3 + 2);
        int v20 = *(_DWORD *)(*(void *)(v12 + 16) + 6LL);
        goto LABEL_37;
      }

      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[7];
        goto LABEL_26;
      }

      if (v13 == 11 && v14 == 10)
      {
LABEL_63:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0LL;
      }

      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }

      if (v13 == 14 && v14 == 8) {
        goto LABEL_63;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }

      if (v13 == 16 && v14 == 12)
      {
        if (!v25) {
          goto LABEL_38;
        }
LABEL_36:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6LL);
LABEL_37:
        if (v19 == v20) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_38;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
        uint64_t v22 = v9;
LABEL_48:
        if (uarp4ccCompare(v22, v21)) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 22 && v14 == 21
        || v13 == 24 && v14 == 23
        || v13 == 26 && v14 == 25
        || v13 == 28 && v14 == 27
        || v13 == 30 && v14 == 29
        || v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
      {
        goto LABEL_63;
      }

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0LL;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }

        ++v6;
      }

      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }

    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0LL;
    *(_WORD *)(a2 + 96) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0LL;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0LL;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }

        ++v10;
      }

      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }

    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0LL;
    *(_WORD *)(a2 + 112) = 0;
  }

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(_BYTE *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33LL) != 1)
      {
        break;
      }
    }
  }

  return 1LL;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpHtons(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6LL));
        }
      }

      ++v5;
    }

    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }

void *uarpAvailableTransmitBuffer(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0LL;
  }
  for (uint64_t i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0LL;
    }
  }

  *uint64_t i = 0LL;
  if (v8[6] < a3)
  {
    UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
    return uarpAllocateTransmitBuffer2(a1, a2, a3);
  }

  return v8;
}

char *uarpAssetTagSysconfig4cc()
{
  uint64_t result = uarpAssetTagSysconfig4cc_assetTag;
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagSysconfig()
{
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagSysconfig4cc_assetTag);
}

int *uarpAssetTagStructSysconfig()
{
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructSysconfig_myTag;
  uarpAssetTagStructSysconfig_myTag = *(_DWORD *)uarpAssetTagSysconfig4cc_assetTag;
  return result;
}

__int16 *uarpOuiSysconfig()
{
  uint64_t result = &uarpOuiSysconfig_myOui;
  uarpOuiSysconfig_myOuuint64_t i = -22144;
  byte_18C6F9BF2 = -105;
  return result;
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, __int128 *a4, int a5)
{
  unsigned int v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30LL;
  if (a3 >= 2)
  {
    if (v9)
    {
      uarpZero(&v13, 0x2CuLL);
      uint64_t v13 = 0x2C00000002LL;
      __int128 v15 = *a4;
      int v17 = 44;
      int v18 = 40 * a5;
      int v16 = 40 * a5 + 44;
      int v14 = v16;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)&v13, 44LL, 0LL);
      if (!(_DWORD)result)
      {
        if (a5)
        {
          uint64_t v11 = 44LL;
          while (1)
          {
            uarpZero(v12, 0x28uLL);
            v12[0] = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)v12, 40LL, v11);
            if ((_DWORD)result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0LL;
            }
          }
        }

        else
        {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  unint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v18);
  int v12 = result;
  if (v18[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v18[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 44LL, 0LL, &v17);
  if (!(_DWORD)result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (v21 + v20);
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v16, 8LL, v14);
      if (!(_DWORD)result)
      {
        v21 += 8;
        v19 += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v10,  a5,  (unsigned __int16)a4,  (v20 + v21));
        if (!(_DWORD)result)
        {
          v21 += (unsigned __int16)a4;
          v19 += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 44LL, 0LL);
        }
      }
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, __int128 *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  unint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v16);
  int v12 = result;
  if (v16[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v16[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v16, 44LL, 0LL, &v21);
  if (!(_DWORD)result)
  {
    if (v21 != 44) {
      return 11LL;
    }
    uint64_t v14 = (v17 + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 40LL, v14, &v21);
    if (!(_DWORD)result)
    {
      if (v21 == 40)
      {
        int v19 = uarpPayloadTagPack(a4);
        __int128 v20 = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 40LL, v14);
      }

      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30LL;
  }
  int v12 = (void *)v11;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v11, &__dst, 4LL, 0LL, v21);
  int v14 = result;
  if (v21[0] == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || v21[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v21, 44LL, 0LL, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 44) {
    return 11LL;
  }
  uint64_t v16 = (v23 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v24, 40LL, v16, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 40) {
    return 11LL;
  }
  int v17 = v25;
  if (!v25)
  {
    int v17 = v22;
    int v25 = v22;
  }

  uint64_t v18 = (v26 + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v20, 8LL, v18);
  if (!(_DWORD)result)
  {
    v26 += 8;
    v22 += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v12,  a6,  (unsigned __int16)a5,  (v25 + v26));
    if (!(_DWORD)result)
    {
      v26 += (unsigned __int16)a5;
      v22 += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v24, 40LL, v16);
      if (!(_DWORD)result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v21, 44LL, 0LL);
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if ((_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39LL;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  unsigned int v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v17);
  int v12 = result;
  if (v17[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v17[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v17, 44LL, 0LL, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 44) {
    return 11LL;
  }
  uint64_t v14 = (v19 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v20, 40LL, v14, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 40) {
    return 11LL;
  }
  int v15 = v21;
  if (!v21)
  {
    int v15 = v18;
    int v21 = v18;
  }

  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, a4, (unsigned __int16)a5, (v22 + v15));
  if (!(_DWORD)result)
  {
    v22 += a5;
    v18 += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v20, 40LL, v14);
    if (!(_DWORD)result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v17, 44LL, 0LL);
    }
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30LL;
  }
  uint64_t v4 = v3;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v3, &__dst, 4LL, 0LL, &v12);
  if ((_DWORD)result) {
    return result;
  }
  if (v12 != 4) {
    return 11LL;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, &v13, 44LL, 0LL, &v16);
  if ((_DWORD)result) {
    return result;
  }
  if (v16 != 44) {
    return 11LL;
  }
  __int128 v6 = v13;
  __int128 v7 = *(_OWORD *)v14;
  *(_OWORD *)(v4 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = *(_OWORD *)&v14[12];
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)&v13, &v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)&v13, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, v15, 40LL, v10, &v16);
        if ((_DWORD)result) {
          break;
        }
        if (v16 != 40) {
          return 11LL;
        }
        uarpPayloadHeaderEndianSwap(v15, v15);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)v15, 40LL, v10);
        if ((_DWORD)result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }

      while (v9);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, a2, __dst, 44LL, 0LL, &v5);
  if (!(_DWORD)result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap(__dst, __dst);
      uint64_t result = 0LL;
      *a3 = __dst[2];
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002LL;
  *(_OWORD *)(a2 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = xmmword_187E44160;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0LL;
  *((void *)a2 + 90) = 0LL;
  *((_OWORD *)a2 + 42) = 0u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + _Block_object_dispose((const void *)(v1 - 80), 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload2( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  _DWORD *v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }

  *((_BYTE *)v16 + 14_Block_object_dispose((const void *)(v1 - 80), 8) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0LL;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0LL;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData( uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11LL;
  }
  unsigned int v14 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }

    return result;
  }

  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v16 = v18;
  int v17 = (void *)(v18 + 24);
  *(void *)(v18 + _Block_object_dispose((const void *)(v1 - 80), 8) = v18 + 24;
  *(_DWORD *)uint64_t v16 = a4;
  *(_DWORD *)(v16 + 4) = a5;
  memcpy(v17, a6, a5);
  uint64_t result = 0LL;
  *(void *)(v16 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 16_Block_object_dispose((const void *)(v1 - 80), 8) = v16;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob( uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11LL;
  }
  unsigned int v12 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }

    return result;
  }

  if (*(void *)(v6 + 152)) {
    return 27LL;
  }
  UARPLayer2ReturnBuffer(a1, 0LL);
  *(void *)(v6 + 152) = 0LL;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0LL, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0LL;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  size_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpHtonl(*(_DWORD *)v11);
      uint64_t v13 = uarpHtonl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11LL;
      }
      *size_t v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      size_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t result = 0LL;
    *a6 = v8;
    *a4 = v9;
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, a2, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, (uint64_t)v13, 40LL, v5);
        if ((_DWORD)result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }

    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0LL;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if ((_DWORD)result) {
          return result;
        }
        unsigned __int16 v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if ((_DWORD)result) {
          return result;
        }
        int v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v15,  (unsigned __int16)v16,  v5);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }

      if (!v8) {
        return 0LL;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28LL);
        if (v20)
        {
          unsigned int __dst = 0LL;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if ((_DWORD)result) {
            return result;
          }
          int v21 = __dst;
          unsigned __int16 v27 = (unint64_t *)__dst;
          int v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            int v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }

          uint64_t result = UARPSuperBinaryBuildMetaData( (uint64_t)v21,  (uint64_t)v22,  *(void *)(v19 + 168),  &v27,  *(_DWORD *)(v19 + 28),  &v28);
          if ((_DWORD)result) {
            return result;
          }
          unsigned __int16 v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v23,  (unsigned __int16)v24,  v5);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }

        uint64_t v18 = v19 + 176;
        ++v17;
      }

      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(_BYTE *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  *(void *)(v26 + 136),  *(unsigned __int16 *)(v26 + 144),  v5);
            if ((_DWORD)result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }

          uint64_t result = 0LL;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((unsigned int v8 = *(_DWORD *)(a2 + 28), v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0LL;
  }

  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40LL;
  }

  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40LL;
    goto LABEL_14;
  }

  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }

  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }

  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0LL;
LABEL_14:
  *a6 = v14;
  return result;
}

uint64_t uarpPlatformEndpointInit2( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0LL);
}

uint64_t uarpPlatformEndpointInit( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30LL;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 6_Block_object_dispose((const void *)(v1 - 80), 8) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    __int128 v16 = *a4;
    __int128 v15 = a4[1];
    *((_DWORD *)a1 + _Block_object_dispose((const void *)(v1 - 80), 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0LL;
    *((_DWORD *)a1 + 13_Block_object_dispose((const void *)(v1 - 80), 8) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        __int128 v7 = *(_OWORD *)a1;
        __int128 v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (__int128 v10 = *a3,
              __int128 v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 4_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(_BYTE *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 5_Block_object_dispose((const void *)(v1 - 80), 8) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer( a1,  (void *)(a2 + 80),  4 * *(unsigned __int16 *)(a2 + 28)),  !(_DWORD)result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!(_DWORD)result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }

              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!(_DWORD)result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0LL;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }

                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
                if (!(_DWORD)result)
                {
                  uint64_t result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!(_DWORD)result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2) {
                      return 0LL;
                    }
                    uint64_t result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!(_DWORD)result) {
                      return 0LL;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0LL;
        }
        v6 += 8LL;
      }

      while (v7 != v6);
    }

    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0LL;
    *(void *)(a2 + 80) = 0LL;
  }

  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7) {
    return uarpSendInformationRequest(a1, a2, a3);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, _BYTE *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!(_DWORD)ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if ((_DWORD)ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }

            else
            {
              uint64_t ActiveFirmwareVersion = 0LL;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }

            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }

  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0LL, 0, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }

    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 56_Block_object_dispose((const void *)(v1 - 80), 8) = a3;
    }

    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30LL;
    }
    __int128 v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    __int128 v18 = a5[2];
    __int128 v19 = a5[3];
    __int128 v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = v19;
    __int128 v21 = a5[6];
    __int128 v22 = a5[7];
    __int128 v23 = a5[9];
    *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 80), 8) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    __int128 v24 = a5[10];
    __int128 v25 = a5[11];
    __int128 v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 80), 8) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(_BYTE *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = a7;
      *(_BYTE *)(a3 + 652) = 1;
    }

    else if (!*(void *)(a3 + 640))
    {
      uint64_t v29 = (void *)(a3 + 640);
      *(_BYTE *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if ((_DWORD)result) {
        return result;
      }
      if (!*v29) {
        return 11LL;
      }
    }

    if (a8)
    {
      if (!*(_BYTE *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }

    else
    {
      char v27 = 0;
    }

    *(_BYTE *)(a3 + 66_Block_object_dispose((const void *)(v1 - 80), 8) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }

    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0LL;
      }

      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508)) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
          uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3);
          if (!(_DWORD)result) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }

        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }

    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      __int128 v4 = *(_OWORD *)(a3 + 32);
      __int128 v5 = *(_OWORD *)(a3 + 48);
      __int128 v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = v5;
      __int128 v7 = *(_OWORD *)(a3 + 96);
      __int128 v8 = *(_OWORD *)(a3 + 112);
      __int128 v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 20_Block_object_dispose((const void *)(v1 - 80), 8) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      __int128 v11 = *(_OWORD *)(a3 + 176);
      __int128 v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 28_Block_object_dispose((const void *)(v1 - 80), 8) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30LL;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      __int128 v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      __int128 v9 = a6[2];
      __int128 v10 = a6[3];
      __int128 v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 12_Block_object_dispose((const void *)(v1 - 80), 8) = v10;
      __int128 v12 = a6[6];
      __int128 v13 = a6[7];
      __int128 v14 = a6[9];
      *(_OWORD *)(a3 + 20_Block_object_dispose((const void *)(v1 - 80), 8) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      __int128 v15 = a6[10];
      __int128 v16 = a6[11];
      __int128 v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 28_Block_object_dispose((const void *)(v1 - 80), 8) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!(_DWORD)v6) {
        *(_BYTE *)(a3 + 72) = 1;
      }
    }

    else
    {
      return 30LL;
    }
  }

  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }

          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *a2;
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44LL;
    }

    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      uint64_t v6 = (_OWORD *)(a2 + 464);
      *(void *)(a2 + 50_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
      if (*(_BYTE *)(a2 + 460) == 1)
      {
        __int128 v7 = *(__int128 **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            int v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              __int128 v9 = *v7;
              __int128 v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              _OWORD *v6 = v9;
              __int128 v11 = v7[3];
              __int128 v12 = v7[4];
              __int128 v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 52_Block_object_dispose((const void *)(v1 - 80), 8) = v12;
              __int128 v14 = v7[7];
              __int128 v15 = v7[8];
              __int128 v16 = v7[9];
              *(void *)(a2 + 624) = *((void *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 60_Block_object_dispose((const void *)(v1 - 80), 8) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (uint64_t i = *((void *)v7 + 21); i; uint64_t i = *(void *)(i + 16))
                uarpProcessPayloadTLVInternal( a1,  a2,  a2 + 464,  *(_DWORD *)i,  *(unsigned int *)(i + 4),  *(_DWORD **)(i + 8));
              uint64_t v18 = *((unsigned int *)v7 + 19);
              if ((_DWORD)v18)
              {
                UARPLayer2HashFinal( (uint64_t)a1,  v18,  *((void *)v7 + 10),  *((void *)v7 + 12),  *((unsigned int *)v7 + 26));
              }
            }

            __int128 v7 = (__int128 *)*((void *)v7 + 22);
            if (!v7) {
              return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
            }
          }

          return 54LL;
        }

        else
        {
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (a1 && a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 500);
    if (v3) {
      v3 -= *(_DWORD *)(a2 + 508);
    }
    if (v3 >= *(_DWORD *)(a2 + 648)) {
      unsigned int v3 = *(_DWORD *)(a2 + 648);
    }
    if (v3) {
      return uarpPlatformAssetPayloadPullData(a1, a2);
    }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0LL;
  }

  return v2;
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 460) = 1;
  if (*(_DWORD *)(a2 + 32)) {
    return uarpPlatformAssetPullAllMetaData(a1, a2);
  }
  UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
  return 0LL;
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30LL;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44LL;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43LL;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 16LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 50_Block_object_dispose((const void *)(v1 - 80), 8) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a2 + 73) = 1;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(_BYTE *)(a2 + 73)) {
    return v2;
  }
  *(_BYTE *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 0LL;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30LL;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, __int128 *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *a2;
      __int128 v4 = a2[1];
      *(_OWORD *)(a3 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = *(__int128 *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((_BYTE *)a2 + 72) = 1;
      *(_BYTE *)(a3 + 72) = 0;
      *(_BYTE *)(a3 + 73) = *((_BYTE *)a2 + 73);
      *((_BYTE *)a2 + 392) = 0;
      __int128 v6 = *(__int128 *)((char *)a2 + 360);
      __int128 v5 = *(__int128 *)((char *)a2 + 376);
      __int128 v7 = *(__int128 *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 32_Block_object_dispose((const void *)(v1 - 80), 8) = *(__int128 *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(__int128 *)((char *)a2 + 312);
      __int128 v8 = *(__int128 *)((char *)a2 + 392);
      __int128 v9 = *(__int128 *)((char *)a2 + 408);
      __int128 v10 = *(__int128 *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 40_Block_object_dispose((const void *)(v1 - 80), 8) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      __int128 v11 = a2[29];
      __int128 v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      __int128 v13 = a2[32];
      __int128 v14 = a2[33];
      __int128 v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 52_Block_object_dispose((const void *)(v1 - 80), 8) = v14;
      __int128 v16 = a2[36];
      __int128 v17 = a2[37];
      __int128 v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 60_Block_object_dispose((const void *)(v1 - 80), 8) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 7_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0LL;
      *(_BYTE *)(a3 + 652) = *((_BYTE *)a2 + 652);
      *(_DWORD *)(a3 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(void *)(a3 + 656) = *((void *)a2 + 82);
      *((void *)a2 + 82) = 0LL;
      *(_BYTE *)(a3 + 66_Block_object_dispose((const void *)(v1 - 80), 8) = *((_BYTE *)a2 + 668);
      *(_DWORD *)(a3 + 664) = *((_DWORD *)a2 + 166);
      *((_DWORD *)a2 + 166) = 0;
      *(_DWORD *)(a3 + 68_Block_object_dispose((const void *)(v1 - 80), 8) = *((_DWORD *)a2 + 172);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(_BYTE *)(a1 + 580)) {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0LL, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30LL;
            }
          }

          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44LL, 0LL, &v7);
          if (!(_DWORD)result)
          {
            uarpSuperBinaryHeaderEndianSwap(__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 6_Block_object_dispose((const void *)(v1 - 80), 8) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 44_Block_object_dispose((const void *)(v1 - 80), 8) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!(_DWORD)result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset( uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30LL;
  if (a1 && a3 && __dst && (_DWORD)a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if ((_DWORD)result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }

    if ((v15 & 8) == 0) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
    uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7);
    if ((_DWORD)result == 40) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30LL;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0LL;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = 0;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30LL;
  if (a3 && a4)
  {
    __int128 v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(_BYTE *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }

    uint64_t result = 0LL;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 64_Block_object_dispose((const void *)(v1 - 80), 8) = a4;
    *(_BYTE *)(a2 + 652) = 1;
  }

  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && (_DWORD)a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a2 + 50) = 0;
    if (!*(_BYTE *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a3) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30LL;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30LL;
    }
  }

  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    __int128 v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a4) {
    return 30LL;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30LL;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30LL;
    }
  }

  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  unsigned __int16 v6 = *(_WORD *)(a1 + 600);
  while (v6)
  {
    uint64_t v7 = UARPPlatformDownstreamEndpointByID(a1, a2, v6);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 600);
    unsigned __int16 v6 = v8 + 1;
    *(_WORD *)(a1 + 600) = v8 + 1;
    if (v7 && v8) {
      return uarpPlatformDownstreamEndpointAddWithID(a1, a2, a3, v8);
    }
  }

  *(_WORD *)(a1 + 600) = 1;
  return 11LL;
}

uint64_t uarpPlatformDownstreamEndpointAddWithID(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a1) {
    return 30LL;
  }
  uint64_t v8 = uarpPlatformRemoteEndpointAlloc(a1);
  if (!v8) {
    return 11LL;
  }
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 176) = a2;
  *(_WORD *)(v8 + 136) = a4;
  return uarpSendDownstreamEndpointReachable(a1, a2, a4);
}

uint64_t uarpPlatformDownstreamEndpointRemove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v5) {
    return uarpSendDownstreamEndpointUnreachable(a1, a2, *(unsigned __int16 *)(v5 + 136));
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointSendMessage( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  uint64_t v9 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v9) {
    return uarpPlatformDownstreamEndpointSendMessageInternal(a1, a2, v9, a4, a5);
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(_BYTE *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    __n128 result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    int v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }

  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0LL;
        }
      }

      return *(void *)(v5 + 168);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(_BYTE *)(a2 + 460))
      {
        uint64_t v6 = *(void *)(a2 + 632);
        if (!v6) {
          return 54LL;
        }
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          uint64_t v6 = *(void *)(v6 + 176);
          if (!v6) {
            return 54LL;
          }
        }

        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        int v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        uint64_t v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }

      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        uint64_t v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        uint64_t result = 0LL;
        *(_DWORD *)(a4 + 2_Block_object_dispose((const void *)(v1 - 80), 8) = *v8;
        return result;
      }

      return 44LL;
    }

    else
    {
      return 26LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }

  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }

  return result;
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_1()
{
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_2()
{
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_3()
{
}

void TSSRequestWithSigningServer_cold_1()
{
}

void TSSRequestWithSigningServer_cold_2(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_187DC0000,  a2,  OS_LOG_TYPE_ERROR,  "UARP: Failed personalization response, error = %u",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_1();
}

void TSSRequestWithSigningServer_cold_3()
{
}

void TSSRequestWithSigningServer_cold_4()
{
}

void TSSRequestWithSigningServer_cold_5()
{
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1()
{
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2()
{
}

uint64_t __getCSVoiceTriggerRTModelClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return UARPArrayOfExpiredFiles_cold_1(v0);
}

void UARPArrayOfExpiredFiles_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Checking age of temp file %@",  buf,  0xCu);
}

void fCoreUARPLayer3DynamicAssetOffered_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3DynamicAssetOffered_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3DynamicAssetOffered_cold_3()
{
}

void fCoreUARPLayer3AUDLogError_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AUDLogDebug_cold_1(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = &fCoreUARPLayer3AUDLogDebug_logBuffer;
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3AUDLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = &fCoreUARPLayer3AUDLogFault_logBuffer;
  _os_log_fault_impl(&dword_187DC0000, log, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void UARPPlatformControllerRecvMessage_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_15();
  _os_log_debug_impl(&dword_187DC0000, v0, OS_LOG_TYPE_DEBUG, "Recv %@ for endpoint %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void UARPPlatformControllerOfferFirmwareAsset_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, v1, "%s: could not create uploader asset for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void UARPPlatformControllerOfferFirmwareAsset_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5( &dword_187DC0000,  v0,  v1,  "%s: could not offer firmware <invalid hardware revision> to endpoint %@",  (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void UARPPlatformControllerOfferFirmwareAsset_cold_3(unsigned int a1)
{
}

void UARPPlatformControllerReofferFirmwareAsset_cold_1(unsigned int a1)
{
}

void UARPPlatformControllerResolicitDynamicAssets_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5(&dword_187DC0000, v0, (uint64_t)v0, "Could not solicit Dynamic Asset from endpoint\n%@%@", v1);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3AssetReady_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_187DC0000, v2, v3, "Asset Ready; asset version is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

void fCoreUARPLayer3AssetReady_cold_6(void *a1)
{
}

void fCoreUARPLayer3AssetReady_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_8(void *a1)
{
}

void fCoreUARPLayer3AssetReady_cold_9( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetMetaDataTLV_cold_1()
{
  OUTLINED_FUNCTION_12(&dword_187DC0000, v0, v1, "Asset MetaData T=<0x%08x> L=%d", v2, v3);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3AssetMetaDataComplete_cold_1(void *a1, char *a2)
{
}

void fCoreUARPLayer3AssetMetaDataComplete_cold_2(void *a1, const char *a2)
{
}

void fCoreUARPLayer3PayloadReady_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Payload Ready; payload 4cc/tag is %@", v2);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3PayloadReady_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadReady_cold_3()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_187DC0000, v0, v1, "Payload Ready; asset version is %@", v2);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3PayloadReady_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadMetaDataTLV_cold_1()
{
  OUTLINED_FUNCTION_12(&dword_187DC0000, v0, v1, "Payload MetaData T=<0x%08x> L=%d", v2, v3);
  OUTLINED_FUNCTION_1();
}

void fCoreUARPLayer3PayloadMetaDataComplete_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadData_cold_1()
{
}

void fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete_cold_1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_187DC0000, a2, OS_LOG_TYPE_ERROR, "Failed to set payload index; %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_1();
}

void UARPlatformEndpointAssetFullyReceived_cold_1()
{
}

void UARPAssetSolicitionComplete_cold_1()
{
}

void UARPAssetSolicitionComplete_cold_2()
{
}

void UARPAssetSolicitionComplete_cold_3()
{
}

void UARPAssetSolicitionComplete_cold_4()
{
}

void UARPlatformEndpointHandleMappedAnalytics_cold_1()
{
}

void UARPlatformEndpointHandleMappedAnalytics_cold_2()
{
}

void UARPlatformEndpointHandleCrashAnalytics_cold_1()
{
}

void UARPlatformEndpointHandleCrashAnalytics_cold_2()
{
}

void uarpLogError_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogDebug_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogFault_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogError_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogDebug_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = &uarpPlatformDarwinLogFault_logBuffer;
  _os_log_fault_impl(&dword_187DC0000, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void uarpDynamicAssetURLWithSuffix_cold_1()
{
}

void UARPUtilsBuildURLForTemporaryFile_cold_1()
{
}

void UARPUtilsBuildURLForTemporaryFile_cold_2()
{
}

void createPowerAssertion_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createPowerAssertion_cold_2(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = 136315650;
  uint64_t v3 = "BOOL createPowerAssertion(NSString *__strong, IOPMAssertionID *)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Failed to create power assertion %@ with error %d",  (uint8_t *)&v2,  0x1Cu);
}

void releasePowerAssertion_cold_1()
{
}

void UARPUtilsCreateTemporaryFolder_cold_1()
{
}

void UARPUtilsCreateTemporaryFolder_cold_2()
{
}

void postStagingStatusForModelIdentifier_cold_1()
{
}

void UARPCleanupAgedFiles_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_187DC0000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG, "Removing Expired File at %@", buf, 0xCu);
}

void UARPCopyFile_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [a1 path];
  uint8_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 path];
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  __int128 v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a3;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to copy File %@ to New Location: %@ - %@",  (uint8_t *)&v7,  0x20u);
}

void UARPCopyFile_cold_2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0( &dword_187DC0000,  MEMORY[0x1895F8DA0],  v2,  "Cannot copy file, Source File does not exist: %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_2_3();
}

void UARPWriteFile_cold_1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_2( &dword_187DC0000,  MEMORY[0x1895F8DA0],  v2,  "Failed to create File Handle at: %@ - %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_2_3();
}

void UARPWriteFile_cold_2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_2( &dword_187DC0000,  MEMORY[0x1895F8DA0],  v2,  "Failed to close File Handle at %@ - %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_2_3();
}

void UARPWriteFile_cold_3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_2( &dword_187DC0000,  MEMORY[0x1895F8DA0],  v2,  "Failed to write to File Handle at %@ - %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_2_3();
}

void UARPWriteFile_cold_4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_2( &dword_187DC0000,  MEMORY[0x1895F8DA0],  v2,  "Failed to find End of File to File Handle at %@ - %@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_2_3();
}

void UARPWriteFile_cold_5(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_187DC0000, MEMORY[0x1895F8DA0], v2, "Unable to create File at: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_3();
}

uint64_t __getCSCoreSpeechServicesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.1(v0);
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x189613F18]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x189613F38]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x189613F40]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x189613F58]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x189613F60]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x189613F68]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1895F8168]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x1895F8170]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x1895F8178]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1895F8190]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

IOReturn IOPMAssertionCreateWithName( CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1896083A8](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1896083D0](*(void *)&AssertionID);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x189608400]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x189608408](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x189608428](blob, ps);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x189611CD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FBA18](a1);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void pcap_close(pcap_t *a1)
{
}

void pcap_dump(u_char *a1, const pcap_pkthdr *a2, const u_char *a3)
{
}

void pcap_dump_close(pcap_dumper_t *a1)
{
}

int pcap_dump_flush(pcap_dumper_t *a1)
{
  return MEMORY[0x189616AB0](a1);
}

pcap_dumper_t *__cdecl pcap_dump_open(pcap_t *a1, const char *a2)
{
  return (pcap_dumper_t *)MEMORY[0x189616AB8](a1, a2);
}

pcap_t *__cdecl pcap_open_dead(int a1, int a2)
{
  return (pcap_t *)MEMORY[0x189616B00](*(void *)&a1, *(void *)&a2);
}

objc_method_description protocol_getMethodDescription( Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x189616A38](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

uint64_t objc_msgSend_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_firmwareStagingProgress_assetID_bytesSent_bytesTotal_filterProgress_);
}

uint64_t objc_msgSend_initWithFormatVersion_majorVersion_minorVersion_releaseVersion_buildVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithFormatVersion_majorVersion_minorVersion_releaseVersion_buildVersion_);
}

uint64_t objc_msgSend_initWithManufacturer_modelName_serialNumber_firmwareVersion_productGroup_productNumber_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithManufacturer_modelName_serialNumber_firmwareVersion_productGroup_productNumber_);
}

uint64_t objc_msgSend_initWithVendorID_productID_usbpdClass_locationType_supportsAccMode7_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithVendorID_productID_usbpdClass_locationType_supportsAccMode7_);
}

uint64_t objc_msgSend_performSynchronousProviderInvocation_accessory_requireKnown_description_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_performSynchronousProviderInvocation_accessory_requireKnown_description_);
}

uint64_t objc_msgSend_requestBytesInRangeForAccessory_asset_bytes_length_offset_bytesCopied_offsetUsed_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_requestBytesInRangeForAccessory_asset_bytes_length_offset_bytesCopied_offsetUsed_);
}

uint64_t objc_msgSend_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_sendFirmwareUpdateProgressForAccessory_assetID_bytesSent_bytesTotal_);
}

uint64_t objc_msgSend_setAssetOfferedForAccessoryID_offeredFirmwareVersion_activeFirmwareVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setAssetOfferedForAccessoryID_offeredFirmwareVersion_activeFirmwareVersion_);
}

uint64_t objc_msgSend_setStagingCompleteForAccessoryID_stagedFirmwareVersion_activeFirmareVersion_status_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setStagingCompleteForAccessoryID_stagedFirmwareVersion_activeFirmareVersion_status_);
}

uint64_t objc_msgSend_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setStagingCompleteForStagedFirmareVersion_activeFirmareVersion_status_);
}

uint64_t objc_msgSend_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error_);
}

uint64_t objc_msgSend_updateStagingProgressForAccessoryID_requestedOffset_requestedLength_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_updateStagingProgressForAccessoryID_requestedOffset_requestedLength_);
}

uint64_t objc_msgSend_voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_voiceTriggerRTModelForVersion_minorVersion_accessoryRTModelType_accessoryInfo_endpointId_downloadedModels_preinstalledModels_completion_);
}

uint64_t objc_msgSend_voiceTriggerRTModelForVersion_minorVersion_downloadedModels_preinstalledModels_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_voiceTriggerRTModelForVersion_minorVersion_downloadedModels_preinstalledModels_completion_);
}