@interface CSUtils
+ (BOOL)extractArchiveFromDirectory:(id)a3 toDir:(id)a4;
+ (BOOL)readAudioChunksFrom:(id)a3 block:(id)a4;
+ (id)distributionDictionary:(id)a3;
+ (id)getInputoriginFromRecordType:(id)a3 withAsset:(id)a4;
+ (id)timeStampString;
+ (unint64_t)getAssetTypeForNamespace:(id)a3;
+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4;
+ (void)logMitigationFeatures:(id)a3 forTask:(id)a4 withModelOutput:(id)a5 forMHRequestId:(id)a6 forRequestId:(id)a7;
@end

@implementation CSUtils

+ (void)logMitigationFeatures:(id)a3 forTask:(id)a4 withModelOutput:(id)a5 forMHRequestId:(id)a6 forRequestId:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
    __int16 v82 = 2112;
    v83 = v14;
    __int16 v84 = 2112;
    v85 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s mhId:%@ requestId:%@", buf, 0x20u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned __int8 v18 = [v17 isAttentiveSiriAudioLoggingEnabled];

  if ((v18 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 mhLogDirectory]);

    v69 = v19;
    if ([v19 fileExistsAtPath:v21])
    {
      id v74 = 0LL;
    }

    else
    {
      id v77 = 0LL;
      unsigned __int8 v23 = [v19 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v77];
      id v74 = v77;
      if ((v23 & 1) == 0)
      {
        v24 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v57 = v24;
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v74 localizedDescription]);
          *(_DWORD *)buf = 136315650;
          v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
          __int16 v82 = 2114;
          v83 = v21;
          __int16 v84 = 2114;
          v85 = v58;
          _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%s Couldn't create Ures slogging directory at path %{public}@ %{public}@",  buf,  0x20u);
        }

        v21 = @"/tmp";
      }
    }

    v70 = v15;
    v71 = v14;
    if (v15) {
      v25 = v15;
    }
    else {
      v25 = v14;
    }
    uint64_t v61 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@.json", v25, v12));
    v62 = v21;
    uint64_t v60 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v21, "stringByAppendingPathComponent:"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 speechPackage]);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue( +[SLUresMitigator getTranscriptionForSpeechPackage:]( &OBJC_CLASS___SLUresMitigator,  "getTranscriptionForSpeechPackage:",  v26));

    v28 = @"N/A";
    if (v27) {
      v28 = v27;
    }
    v29 = v28;

    v78[0] = @"Task";
    v78[1] = @"Transcript";
    id v72 = v13;
    id v73 = v12;
    v79[0] = v12;
    v79[1] = v29;
    v59 = v29;
    v79[2] = v13;
    v78[2] = @"DetailedModelResult";
    v78[3] = @"AcousticFTMScore";
    v68 = (void *)objc_claimAutoreleasedReturnValue([v11 acousticFTMScores]);
    v79[3] = v68;
    v78[4] = @"InputOrigin";
    v67 = (void *)objc_claimAutoreleasedReturnValue([v11 inputOrigin]);
    v79[4] = v67;
    v78[5] = @"gazeSignal";
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 didDetectGazeAtOrb]));
    v79[5] = v66;
    v78[6] = @"visualVadSignal";
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 didDetectVisualActivity]));
    v79[6] = v65;
    v78[7] = @"attentionSignal";
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 didDetectAttention]));
    v79[7] = v64;
    v78[8] = @"osdSignal";
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 didDetectSpeechActivity]));
    v79[8] = v63;
    v78[9] = @"timeSinceLastQuery";
    [v11 timeSinceLastQuery];
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v79[9] = v30;
    v78[10] = @"airpodsConnected";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 isAirpodsConnected]));
    v79[10] = v31;
    v78[11] = @"boronSignal";
    v32 = (void *)objc_claimAutoreleasedReturnValue([v11 boronScore]);
    v79[11] = v32;
    v78[12] = @"decisionStage";
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 decisionStage]));
    v79[12] = v33;
    v78[13] = @"prevInputLevel";
    v34 = (void *)objc_claimAutoreleasedReturnValue([v11 prevStageOutput]);
    v79[13] = v34;
    v78[14] = @"speakerIDScore";
    v35 = (void *)objc_claimAutoreleasedReturnValue([v11 speakerIDScore]);
    v79[14] = v35;
    v78[15] = @"eosLikelihood";
    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 eosLikelihood]);
    v79[15] = v36;
    v78[16] = @"timestamp";
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils timeStampString](&OBJC_CLASS___CSUtils, "timeStampString"));
    v79[16] = v37;
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  17LL));

    v39 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
      __int16 v82 = 2112;
      v83 = v38;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s Mitigation Dict :%@", buf, 0x16u);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue([v11 speechPackage]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 dictionaryRepresentation]);

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v43 = v38;
      [v42 addEntriesFromDictionary:v38];
      [v42 setObject:v41 forKey:@"RawASRRecogCandidate"];
      v44 = (void *)objc_claimAutoreleasedReturnValue([v11 speechPackage]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 latticeMitigatorResult]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dictionaryRepresentation]);

      id v12 = v73;
      if (v46) {
        [v42 setObject:v46 forKey:@"LatticeRNNResult"];
      }
      v47 = (void *)objc_claimAutoreleasedReturnValue([v11 nldaScore]);
      if (v47) {
        [v42 setObject:v47 forKey:@"NLDAScore"];
      }
      v38 = (__CFString *)[v42 copy];
    }

    else
    {
      id v12 = v73;
    }

    id v76 = v74;
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v38,  1LL,  &v76));
    id v49 = v76;

    if (!v48 || v49)
    {
      v50 = v38;
      v54 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v55 = v54;
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue([v49 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
        __int16 v82 = 2114;
        v83 = v56;
        _os_log_error_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize data with err: %{public}@",  buf,  0x16u);
      }

      v53 = (void *)v61;
      v52 = v62;
      v51 = (void *)v60;
    }

    else
    {
      v50 = v38;
      id v75 = 0LL;
      v51 = (void *)v60;
      [v48 writeToFile:v60 options:0 error:&v75];
      id v49 = v75;
      v53 = (void *)v61;
      v52 = v62;
    }

    v15 = v70;
    v14 = v71;
    id v13 = v72;
  }

  else
  {
    v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v81 = "+[CSUtils(AttSiri) logMitigationFeatures:forTask:withModelOutput:forMHRequestId:forRequestId:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s AttSiri logging not enabled", buf, 0xCu);
    }
  }
}

+ (id)timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

+ (id)getInputoriginFromRecordType:(id)a3 withAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  else {
    unsigned int v7 = 0;
  }
  if (([v5 isBuiltInVoiceTriggered] & 1) != 0
    || [v5 isHearstVoiceTriggered]
    && ([v5 isRequestFromSpokenNotification] | v7) != 1
    || [v5 isDarwinVoiceTriggered])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 activationMetadata]);
    unsigned int v9 = [v6 isJSVoiceTrigger:v8];

    if (v9) {
      v10 = &off_100238340;
    }
    else {
      v10 = &off_100238328;
    }
  }

  else if ([v5 isUIButtonPress])
  {
    v10 = &off_100238358;
  }

  else if (([v5 isHomePressed] & 1) != 0 {
         || ([v5 isHearstDoubleTapTriggered] & 1) != 0
  }
         || ([v5 isRTSTriggered] & 1) != 0)
  {
    v10 = &off_100238370;
  }

  else if ([v5 isContinuousConversation] | v7)
  {
    v10 = &off_100238388;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

+ (unint64_t)getAssetTypeForNamespace:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](&OBJC_CLASS___TRINamespace, "namespaceNameFromId:", 322LL));
  unsigned __int8 v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) != 0)
  {
    unint64_t v6 = 3LL;
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](&OBJC_CLASS___TRINamespace, "namespaceNameFromId:", 404LL));
    unsigned int v8 = [v3 isEqualToString:v7];

    if (v8) {
      unint64_t v6 = 4LL;
    }
    else {
      unint64_t v6 = 0LL;
    }
  }

  return v6;
}

+ (void)getTrialIdsForAssetType:(unint64_t)a3 withCompletion:(id)a4
{
  unsigned __int8 v5 = (void (**)(id, uint64_t, void *))a4;
  if (a3 == 3)
  {
    uint64_t v6 = 114LL;
    uint64_t v7 = 322LL;
  }

  else if (a3 == 4)
  {
    uint64_t v6 = 117LL;
    uint64_t v7 = 404LL;
  }

  else
  {
    unsigned int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    BOOL v9 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v7 = 0LL;
    uint64_t v6 = 0LL;
    if (v9)
    {
      int v11 = 136315394;
      id v12 = "+[CSUtils(Trial) getTrialIdsForAssetType:withCompletion:]";
      __int16 v13 = 2050;
      unint64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Unknown namespaceId for assetType %{public}lu ",  (uint8_t *)&v11,  0x16u);
      uint64_t v7 = 0LL;
      uint64_t v6 = 0LL;
    }
  }

  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](&OBJC_CLASS___TRINamespace, "namespaceNameFromId:", v7));
    v5[2](v5, v6, v10);
  }
}

+ (BOOL)extractArchiveFromDirectory:(id)a3 toDir:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

  unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"extractPKZip");
  BomSys_init(&v21, 0LL);
  BomSys_set_open(v21, sub_10009418C);
  uint64_t v9 = BOMCopierNewWithSys(v21);
  if (v9)
  {
    uint64_t v10 = v9;
    BOMCopierSetFileErrorHandler(v9, sub_1000943E8);
    BOMCopierSetFatalErrorHandler(v10, sub_1000944E0);
    BOMCopierSetFatalFileErrorHandler(v10, sub_1000945A8);
    int v11 = calloc(1uLL, 8uLL);
    BOMCopierSetUserData(v10, v11);
    id v12 = v6;
    id v13 = v7;
    unint64_t v14 = v8;
    if (!v14) {
      unint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"copyExtendedAttributes");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"copyResources");
    id v15 = v12;
    id v16 = [v15 fileSystemRepresentation];
    id v17 = v13;
    LODWORD(v16) = BOMCopierCopyWithOptions(v10, v16, [v17 fileSystemRepresentation], v14);

    if ((_DWORD)v16) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v11[4] == 0;
    }
    free(v11);
    BOMCopierFree(v10);
  }

  else
  {
    v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v23 = "+[CSUtils(Compression) extractArchiveFromDirectory:toDir:]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Could not create copier", buf, 0xCu);
    }

    BOOL v18 = 0;
  }

  BomSys_free(v21);

  return v18;
}

+ (id)distributionDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v30[0] = @"Max";
    v30[1] = @"Min";
    v31[0] = &off_100238DD8;
    v31[1] = &off_100238DD8;
    v30[2] = @"P95";
    v30[3] = @"Median";
    v31[2] = &off_100238DD8;
    v31[3] = &off_100238DD8;
    v30[4] = @"Avg";
    v30[5] = @"Std";
    v31[4] = &off_100238DD8;
    v31[5] = &off_100238DD8;
    v30[6] = @"Num";
    v31[6] = &off_100238DD8;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  7LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

    unint64_t v6 = (unint64_t)[v3 count];
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
      [v5 setObject:v7 forKeyedSubscript:@"Num"];

      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  v3));
      v29 = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"average:",  v9));

      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 expressionValueWithObject:0 context:0]);
      [v5 setObject:v11 forKeyedSubscript:@"Avg"];

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  v3));
      v28 = v12;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"stddev:",  v13));

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 expressionValueWithObject:0 context:0]);
      [v5 setObject:v15 forKeyedSubscript:@"Std"];

      [v3 sortUsingComparator:&stru_10022DDE8];
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6 >> 1]);
      [v16 doubleValue];
      double v18 = v17;

      if ((v6 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:(v6 >> 1) - 1]);
        [v19 doubleValue];
        double v21 = v20;

        double v18 = (v18 + v21) * 0.5;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
      [v5 setObject:v22 forKeyedSubscript:@"Median"];

      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
      [v5 setObject:v23 forKeyedSubscript:@"Min"];

      v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6 - 1]);
      [v5 setObject:v24 forKeyedSubscript:@"Max"];

      v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:vcvtmd_u64_f64((double)v6 * 0.95)]);
      [v5 setObject:v25 forKeyedSubscript:@"P95"];

      unint64_t v6 = v5;
    }
  }

  else
  {
    v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CSUtils(Statistics) distributionDictionary:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s input dictionary is nil", buf, 0xCu);
    }

    unint64_t v6 = 0LL;
  }

  return (id)v6;
}

+ (BOOL)readAudioChunksFrom:(id)a3 block:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void *, void))a4;
  inPropertyData[0] = xmmword_10018B2B0;
  inPropertyData[1] = unk_10018B2C0;
  uint64_t v20 = 16LL;
  ExtAudioFileRef outExtAudioFile = 0LL;
  AudioFileID outAudioFile = 0LL;
  if (!AudioFileOpenURL( (CFURLRef)+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5),  kAudioFileReadPermission,  0,  &outAudioFile))
  {
    if (!ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile)) {
      goto LABEL_5;
    }
    AudioFileClose(outAudioFile);
  }

  AudioFileID outAudioFile = 0LL;
LABEL_5:
  if (outExtAudioFile)
  {
    UInt32 ioPropertyDataSize = 40;
    ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
    id v7 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", 2048LL));
    ioData.mNumberBuffers = 1;
    *(void *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001LL;
    ioData.mBuffers[0].mData = [v7 mutableBytes];
    while (1)
    {
      UInt32 ioNumberFrames = 1024;
      OSStatus v8 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      BOOL v9 = v8 == 0;
      if (v8) {
        break;
      }
      if (!ioNumberFrames) {
        goto LABEL_14;
      }
      if (v6) {
        v6[2](v6, ioData.mBuffers[0].mData, ioData.mBuffers[0].mDataByteSize >> 1);
      }
    }

    OSStatus v10 = v8;
    int v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[CSUtils(AudioFile) readAudioChunksFrom:block:]";
      __int16 v23 = 1026;
      OSStatus v24 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Error reading audio file: %{public}d, skipping...",  buf,  0x12u);
    }

@end