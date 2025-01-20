@interface SUControllerSUCore
+ (id)errorFromCoreError:(id)a3;
+ (id)newDescriptorFromCoreDescriptor:(id)a3 corePolicy:(id)a4;
+ (id)newProgressFromCoreProgress:(id)a3;
+ (id)newSafeErrorDescription:(id)a3;
@end

@implementation SUControllerSUCore

+ (id)newDescriptorFromCoreDescriptor:(id)a3 corePolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v8 = 0LL;
    if (!v6) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }

  v8 = objc_alloc_init(&OBJC_CLASS___SUControllerDescriptor);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);

  if (v9)
  {
    v37 = objc_alloc(&OBJC_CLASS___SUControllerDocumentation);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v38 localBundleURL]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);
    v39 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serverAssetURL]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serverAssetMeasurement]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serverAssetAlgorithm]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 documentation]);
    v17 = -[SUControllerDocumentation initWithDocumentationBundleURL:serverAssetURL:serverAssetMeasurement:serverAssetAlgorithm:serverAssetChunkSize:]( v37,  "initWithDocumentationBundleURL:serverAssetURL:serverAssetMeasurement:serverAssetAlgorithm:serverAssetChunkSize:",  v36,  v11,  v13,  v15,  [v16 serverAssetChunkSize]);
    -[SUControllerDescriptor setDocumentation:](v8, "setDocumentation:", v17);

    v7 = v39;
  }

  else
  {
    char v18 = sub_1000384C4();
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003EC54(v20);
      }
    }

    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceClass]);
      *(_DWORD *)buf = 138412290;
      v41 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[DESCRIPTOR_FROM_CORE] SUCore descriptor is missing documentation information, allowed for %@ devices",  buf,  0xCu);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 productVersion]);
  -[SUControllerDescriptor setProductVersion:](v8, "setProductVersion:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 productBuildVersion]);
  -[SUControllerDescriptor setProductBuildVersion:](v8, "setProductBuildVersion:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 documentationID]);
  -[SUControllerDescriptor setDocumentationID:](v8, "setDocumentationID:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 publisher]);
  -[SUControllerDescriptor setPublisher:](v8, "setPublisher:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v5 productSystemName]);
  -[SUControllerDescriptor setProductSystemName:](v8, "setProductSystemName:", v27);

  -[SUControllerDescriptor setDownloadSize:](v8, "setDownloadSize:", [v5 downloadSize]);
  -[SUControllerDescriptor setUnarchivedSize:](v8, "setUnarchivedSize:", [v5 unarchivedSize]);
  -[SUControllerDescriptor setMsuPrepareSize:](v8, "setMsuPrepareSize:", [v5 msuPrepareSize]);
  -[SUControllerDescriptor setInstallationSize:](v8, "setInstallationSize:", [v5 installationSize]);
  -[SUControllerDescriptor setTotalRequiredFreeSpace:]( v8,  "setTotalRequiredFreeSpace:",  [v5 totalRequiredFreeSpace]);
  -[SUControllerDescriptor setUserDidAcceptTermsAndConditions:](v8, "setUserDidAcceptTermsAndConditions:", 0LL);
  -[SUControllerDescriptor setFullReplacement:](v8, "setFullReplacement:", [v5 fullReplacement]);
  -[SUControllerDescriptor setRampEnabled:](v8, "setRampEnabled:", [v5 rampEnabled]);
  -[SUControllerDescriptor setDenialReasons:](v8, "setDenialReasons:", 0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v5 getMASoftwareUpdateAsset]);
  -[SUControllerDescriptor setSoftwareUpdateAsset:](v8, "setSoftwareUpdateAsset:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 getMADocumentationAsset]);
  -[SUControllerDescriptor setDocumentationAsset:](v8, "setDocumentationAsset:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseType]);
  -[SUControllerDescriptor setReleaseType:](v8, "setReleaseType:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDate]);
  -[SUControllerDescriptor setReleaseDate:](v8, "setReleaseDate:", v31);

  -[SUControllerDescriptor setMandatoryUpdateEligible:]( v8,  "setMandatoryUpdateEligible:",  [v5 mandatoryUpdateEligible]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 mandatoryUpdateVersionMin]);
  -[SUControllerDescriptor setMandatoryUpdateVersionMin:](v8, "setMandatoryUpdateVersionMin:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v5 mandatoryUpdateVersionMax]);
  -[SUControllerDescriptor setMandatoryUpdateVersionMax:](v8, "setMandatoryUpdateVersionMax:", v33);

  -[SUControllerDescriptor setMandatoryUpdateOptional:]( v8,  "setMandatoryUpdateOptional:",  [v5 mandatoryUpdateOptional]);
  -[SUControllerDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:]( v8,  "setMandatoryUpdateRestrictedToOutOfTheBox:",  [v5 mandatoryUpdateRestrictedToOutOfTheBox]);
  -[SUControllerDescriptor setCoreDescriptor:](v8, "setCoreDescriptor:", v5);
  if (v7)
  {
LABEL_13:
    -[SUControllerDescriptor setIsSupervisedPolicy:]( v8,  "setIsSupervisedPolicy:",  [v7 isSupervisedPolicy]);
    if ([v7 isRequestedPMVSupervisedPolicy])
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v7 requestedProductMarketingVersion]);
      -[SUControllerDescriptor setRequestedPMV:](v8, "setRequestedPMV:", v34);
    }

    else
    {
      -[SUControllerDescriptor setRequestedPMV:](v8, "setRequestedPMV:", 0LL);
    }

    -[SUControllerDescriptor setDelayPeriod:](v8, "setDelayPeriod:", [v7 delayPeriodDays]);
  }

+ (id)newProgressFromCoreProgress:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___SUControllerProgress);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 phase]);
  -[SUControllerProgress setPhase:](v4, "setPhase:", v5);

  [v3 portionComplete];
  -[SUControllerProgress setPortionComplete:](v4, "setPortionComplete:");
  [v3 estimatedTimeRemaining];
  -[SUControllerProgress setEstimatedTimeRemaining:](v4, "setEstimatedTimeRemaining:");
  id v6 = [v3 isStalled];

  -[SUControllerProgress setIsStalled:](v4, "setIsStalled:", v6);
  -[SUControllerProgress setIsDone:](v4, "setIsDone:", 0LL);
  return v4;
}

+ (id)errorFromCoreError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned int v6 = [v5 isEqualToString:kSUCoreErrorDomain];

    if (!v6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      unsigned int v16 = [v15 isEqualToString:kCFErrorDomainMobileSoftwareUpdate];

      if (v16)
      {
        v12 = @"MobileSoftwareUpdate operation failed";
LABEL_11:
        uint64_t v13 = 28LL;
        goto LABEL_30;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      unsigned int v18 = [v17 isEqualToString:kCFErrorDomainPersonalization];

      if (v18)
      {
        v12 = @"MobileSoftwareUpdate personalization failed";
        uint64_t v13 = 21LL;
        goto LABEL_30;
      }

      v12 = @"expected an SUCore underlying error";
LABEL_19:
      uint64_t v13 = 58LL;
      goto LABEL_30;
    }

    uint64_t v7 = (uint64_t)[v4 code];
    if (v7 <= 8249)
    {
      switch(v7)
      {
        case 8100LL:
          v12 = @"allocation failed";
          uint64_t v13 = 31LL;
          goto LABEL_30;
        case 8101LL:
          v12 = @"missing required element";
          uint64_t v13 = 55LL;
          goto LABEL_30;
        case 8102LL:
        case 8112LL:
        case 8114LL:
          v12 = @"bad argument";
          uint64_t v13 = 27LL;
          goto LABEL_30;
        case 8103LL:
        case 8116LL:
          v12 = @"unsupported command";
          uint64_t v13 = 19LL;
          goto LABEL_30;
        case 8104LL:
        case 8105LL:
        case 8106LL:
        case 8109LL:
          v12 = @"transport related error";
          uint64_t v13 = 2LL;
          goto LABEL_30;
        case 8107LL:
        case 8118LL:
          v12 = @"malformed message";
          uint64_t v13 = 1LL;
          goto LABEL_30;
        case 8108LL:
        case 8115LL:
        case 8120LL:
          v12 = @"invalid state for operation";
          uint64_t v13 = 42LL;
          goto LABEL_30;
        case 8110LL:
          v12 = @"purge failed";
          uint64_t v13 = 22LL;
          goto LABEL_30;
        case 8111LL:
          v12 = @"already in progress";
          uint64_t v13 = 57LL;
          goto LABEL_30;
        case 8113LL:
        case 8122LL:
        case 8123LL:
          v12 = @"not supported";
          uint64_t v13 = 56LL;
          goto LABEL_30;
        case 8117LL:
        case 8121LL:
          goto LABEL_29;
        case 8119LL:
          v12 = @"operation abandoned";
          uint64_t v13 = 46LL;
          goto LABEL_30;
        case 8124LL:
LABEL_17:
          v12 = @"operation canceled";
          uint64_t v13 = 23LL;
          goto LABEL_30;
        default:
          if (v7) {
            goto LABEL_46;
          }
          v12 = @"SUCore underlying error indicating no error";
          uint64_t v13 = 0LL;
          break;
      }

      goto LABEL_30;
    }

    if (v7 <= 8499)
    {
      switch(v7)
      {
        case 8400LL:
        case 8402LL:
          goto LABEL_33;
        case 8401LL:
          v12 = @"query failed";
          uint64_t v13 = 3LL;
          break;
        case 8403LL:
        case 8404LL:
        case 8405LL:
          goto LABEL_17;
        case 8406LL:
          v12 = @"up to date";
          uint64_t v13 = 4LL;
          break;
        case 8407LL:
          v12 = @"no documentation found";
          uint64_t v13 = 6LL;
          break;
        case 8408LL:
        case 8409LL:
          v12 = @"newer update found";
          uint64_t v13 = 13LL;
          break;
        case 8410LL:
          v12 = @"scan postponed";
          uint64_t v13 = 59LL;
          break;
        default:
          goto LABEL_46;
      }

      goto LABEL_30;
    }

    if (v7 > 8799)
    {
      if ((unint64_t)(v7 - 8900) < 7)
      {
        v12 = @"connection error";
        uint64_t v13 = 35LL;
LABEL_30:
        id v19 = sub_1000382D8(@"SUControllerError", v13, v4, v12, v8, v9, v10, v11, v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
        goto LABEL_31;
      }

      if ((unint64_t)(v7 - 8800) < 3)
      {
        v12 = @"MSU operation failed";
        goto LABEL_11;
      }

      if (v7 != 9900) {
        goto LABEL_46;
      }
LABEL_29:
      v12 = @"internal error";
      uint64_t v13 = 30LL;
      goto LABEL_30;
    }

    if (v7 > 8600)
    {
      if ((unint64_t)(v7 - 8701) < 3)
      {
LABEL_33:
        v12 = @"MobileAsset error";
        uint64_t v13 = 54LL;
        goto LABEL_30;
      }

      if (v7 == 8601)
      {
        v12 = @"failed disk space check";
        uint64_t v13 = 47LL;
        goto LABEL_30;
      }

      if (v7 == 8700)
      {
        v12 = @"download failed";
        uint64_t v13 = 8LL;
        goto LABEL_30;
      }
    }

    else
    {
      if (v7 == 8600)
      {
        v12 = @"insufficient disk space";
        uint64_t v13 = 25LL;
        goto LABEL_30;
      }
    }

+ (id)newSafeErrorDescription:(id)a3
{
  if (!a3) {
    return @"SUCCESS";
  }
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  id v5 = [v3 code];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"domain=%@, code=%llu, description=%@",  v4,  v5,  v6));
  return v7;
}

@end