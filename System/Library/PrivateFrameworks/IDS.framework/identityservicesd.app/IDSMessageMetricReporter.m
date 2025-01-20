@interface IDSMessageMetricReporter
+ (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3;
+ (BOOL)_shouldIgnoreAutoBugCaptureForLegacyFailure:(id)a3;
+ (BOOL)_shouldIgnoreMPError:(id)a3;
+ (id)_metadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (id)errorToReportForLegacyError:(id)a3;
+ (id)errorToReportForNGMError:(id)a3;
+ (id)messageMetadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (void)noteKeyGenerationForMetric;
+ (void)reportEncryptionSideMetricWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (void)reportMessageMetricWithMetadata:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 command:(id)a7 decryptedEqual:(BOOL)a8 triedLastResort:(BOOL)a9 secondaryError:(id)a10 ECError:(id)a11 legacyError:(id)a12 fromDestination:(id)a13 fromToken:(id)a14 toToken:(id)a15;
@end

@implementation IDSMessageMetricReporter

+ (id)_metadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v14 = a3;
  id v35 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a5;
  v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  [v14 queryTimeInterval];
  if (v21 > 0.0)
  {
    [v14 queryTimeInterval];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v22,  @"ids_querytime");
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 productBuildVersion]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v24, @"ids_build");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v19,  @"ids_sender_EC_success");
  if (v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForNGMError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForNGMError:",  v17));

    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v26,  @"ids_sender_EC_error_domain");

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v25 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v27,  @"ids_sender_EC_enc_error_code");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v15,  @"ids_sender_leg_success");
  if (v18)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForLegacyError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForLegacyError:",  v18));

    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v29,  @"ids_sender_leg_error_domain");

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v30,  @"ids_sender_leg_error_code");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v35,  @"ids_sender_secondary_success");
  if (v16)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForNGMError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForNGMError:",  v16));

    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v32,  @"ids_sender_secondary_error_domain");

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v31 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v33,  @"ids_sender_secondary_enc_error_code");
  }

  return v20;
}

+ (id)messageMetadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (CUTIsInternalInstall())
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( [a1 _metadataWithEndpoint:v15 secondarySuccess:v16 ECSuccess:v17 legacySuccess:v18 secondaryError:v19 ECError:v20 legacyError:v21]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v22,  1LL,  0LL));
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

+ (void)reportEncryptionSideMetricWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v23 = [v22 isInternalInstall];

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( [a1 _metadataWithEndpoint:v15 secondarySuccess:v16 ECSuccess:v17 legacySuccess:v18 secondaryError:v19 ECError:v20 legacyError:v21]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CUTReporting RTCSessionPromiseWithBatchingInterval:]( &OBJC_CLASS___CUTReporting,  "RTCSessionPromiseWithBatchingInterval:",  30.0));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10003E560;
    v27[3] = &unk_1008F7798;
    id v28 = v24;
    id v26 = v24;
    [v25 registerResultBlock:v27];
  }
}

+ (void)reportMessageMetricWithMetadata:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 command:(id)a7 decryptedEqual:(BOOL)a8 triedLastResort:(BOOL)a9 secondaryError:(id)a10 ECError:(id)a11 legacyError:(id)a12 fromDestination:(id)a13 fromToken:(id)a14 toToken:(id)a15
{
  BOOL v88 = a8;
  id v97 = a3;
  id v98 = a4;
  id v19 = a5;
  id v20 = a6;
  id v91 = a7;
  id v94 = a10;
  id v96 = a11;
  id v95 = a12;
  id v90 = a13;
  id v93 = a14;
  id v92 = a15;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v22 = [v21 isInternalInstall];

  if (!v22) {
    goto LABEL_82;
  }
  unsigned int v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v24,  @"ids_tried_last_resort");

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 appValueForKey:@"LastKeyGeneration"]);
  v27 = (void *)v26;
  if (v26) {
    id v28 = (_UNKNOWN **)v26;
  }
  else {
    id v28 = &off_1009467F8;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v28,  @"ids_lastgeneration");

  if (v20) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v20,  @"ids_recieved_leg_success");
  }
  if (v19) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v19,  @"ids_recieved_EC_success");
  }
  if (v98) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v98,  @"ids_recieved_secondary_success");
  }
  if (v91) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v91,  @"ids_msg_command");
  }
  if (v19 && v20)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v88));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v30,  @"ids_decrypt_equal");
  }

  if (v96)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForNGMError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForNGMError:",  v96));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v32,  @"ids_EC_error_domain");

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v31 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v33,  @"ids_EC_error_code");

    v34 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
    if ([v34 isEqualToString:IDSDecryptionErrorDomain])
    {
      id v35 = [v31 code];

      if (v35 != (id)13)
      {
LABEL_21:

        goto LABEL_22;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v36 errorContainerToReport]);

      v37 = -[IDSNGMKeyLoadingMetric initWithErrorContainer:missingIdentity:missingPrekey:]( objc_alloc(&OBJC_CLASS___IDSNGMKeyLoadingMetric),  "initWithErrorContainer:missingIdentity:missingPrekey:",  v34,  1LL,  1LL);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric dictionaryRepresentation](v37, "dictionaryRepresentation"));
      -[NSMutableDictionary addEntriesFromDictionary:](v23, "addEntriesFromDictionary:", v38);
    }

    goto LABEL_21;
  }

+ (id)errorToReportForNGMError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  uint64_t v5 = IDSDecryptionErrorDomain;
  if ([v4 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)15)
  {
    goto LABEL_6;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v6 isEqualToString:IDSEncryptionErrorDomain]
    && [v3 code] == (id)15)
  {

LABEL_6:
LABEL_9:
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v3;
    }
    id v13 = v12;
    goto LABEL_13;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v7 isEqualToString:v5])
  {
    id v8 = [v3 code];

    if (v8 == (id)2) {
      goto LABEL_9;
    }
  }

  else
  {
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v14 isEqualToString:v5])
  {

    goto LABEL_24;
  }

  id v15 = [v3 code];

  if (v15 != (id)12)
  {
LABEL_24:
    id v13 = v3;
    goto LABEL_25;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (!v9)
  {
    id v13 = v3;
    goto LABEL_14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v9;
  }
  id v13 = v19;

LABEL_13:
LABEL_14:

LABEL_25:
  return v13;
}

+ (id)errorToReportForLegacyError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  uint64_t v5 = IDSDecryptionErrorDomain;
  if ([v4 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)11)
  {
    goto LABEL_6;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v6 isEqualToString:IDSEncryptionErrorDomain]
    && [v3 code] == (id)10)
  {

LABEL_6:
LABEL_9:
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v3;
    }
    id v13 = v12;
    goto LABEL_13;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v7 isEqualToString:v5])
  {
    id v8 = [v3 code];

    if (v8 == (id)2) {
      goto LABEL_9;
    }
  }

  else
  {
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v14 isEqualToString:v5])
  {

    goto LABEL_24;
  }

  id v15 = [v3 code];

  if (v15 != (id)9)
  {
LABEL_24:
    id v13 = v3;
    goto LABEL_25;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (!v9)
  {
    id v13 = v3;
    goto LABEL_14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v9;
  }
  id v13 = v19;

LABEL_13:
LABEL_14:

LABEL_25:
  return v13;
}

+ (void)noteKeyGenerationForMetric
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSince1970];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setAppValue:v3 forKey:@"LastKeyGeneration"];
}

+ (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v4 code] != (id)14)
  {
    if ([v4 code] == (id)15)
    {
      unsigned __int8 v8 = [a1 _shouldIgnoreMPError:v6];
      goto LABEL_7;
    }

+ (BOOL)_shouldIgnoreMPError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldIgnoreAutoBugCaptureForLegacyFailure:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end