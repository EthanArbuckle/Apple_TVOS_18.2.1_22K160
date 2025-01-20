@interface ADSystemService
- (ADSystemService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)isSystemService;
- (id)_systemDomains;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (void)dealloc;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5;
@end

@implementation ADSystemService

- (ADSystemService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSystemService;
  v2 = -[ADSystemService init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ADService setIdentifier:](v2, "setIdentifier:", @"SystemService");
  }
  return v3;
}

- (void)dealloc
{
  commandMapV2 = self->_commandMapV2;
  if (commandMapV2) {
    CFRelease(commandMapV2);
  }
  commandMap = self->_commandMap;
  if (commandMap) {
    CFRelease(commandMap);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSystemService;
  -[ADSystemService dealloc](&v5, "dealloc");
}

- (id)_systemDomains
{
  if (qword_100577B60 != -1) {
    dispatch_once(&qword_100577B60, &stru_1004EF5D8);
  }
  return (id)qword_100577B58;
}

- (BOOL)isSystemService
{
  return 1;
}

- (id)domains
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSystemService _systemDomains](self, "_systemDomains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return v3;
}

- (id)commandsForDomain:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:SATTSGroupIdentifier])
  {
    v8[0] = SATTSGetSpeechSynthesisVolumeClassIdentifier;
    v8[1] = SATTSSetSpeechSynthesisVolumeClassIdentifier;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSystemService _systemDomains](self, "_systemDomains"));
    else {
      objc_super v5 = 0LL;
    }
  }

  return v5;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:SATTSGroupIdentifier])
  {
    else {
      unsigned __int8 v8 = [v6 isEqualToString:SATTSSetSpeechSynthesisVolumeClassIdentifier];
    }
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSystemService _systemDomains](self, "_systemDomains"));
    unsigned __int8 v8 = [v9 containsObject:v7];
  }

  return v8;
}

- (id)controlCenterLockRestrictedCommands
{
  return 0LL;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v176 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!self->_commandMap)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
    self->_commandMap = Mutable;
    v14 = (const void *)objc_opt_class(&OBJC_CLASS___SACommandFailed);
    CFDictionarySetValue(Mutable, v14, "_saCommandFailed:completion:");
    commandMap = self->_commandMap;
    v16 = (const void *)objc_opt_class(&OBJC_CLASS___SACommandIgnored);
    CFDictionarySetValue(commandMap, v16, "_saCommandIgnored:completion:");
    v17 = self->_commandMap;
    v18 = (const void *)objc_opt_class(&OBJC_CLASS___SASendCommands);
    CFDictionarySetValue(v17, v18, "_saSendCommands:completion:");
    v19 = self->_commandMap;
    v20 = (const void *)objc_opt_class(&OBJC_CLASS___SAAssistantDestroyed);
    CFDictionarySetValue(v19, v20, "_saAssistantDestroyed:completion:");
    v21 = self->_commandMap;
    v22 = (const void *)objc_opt_class(&OBJC_CLASS___SACancelSucceeded);
    CFDictionarySetValue(v21, v22, "_saCancelSucceeded:completion:");
    v23 = self->_commandMap;
    v24 = (const void *)objc_opt_class(&OBJC_CLASS___SARollbackSucceeded);
    CFDictionarySetValue(v23, v24, "_saRollbackSucceeded:completion:");
    v25 = self->_commandMap;
    v26 = (const void *)objc_opt_class(&OBJC_CLASS___SASetClientData);
    CFDictionarySetValue(v25, v26, "_saSetClientData:completion:");
    v27 = self->_commandMap;
    v28 = (const void *)objc_opt_class(&OBJC_CLASS___SASetHandoffPayload);
    CFDictionarySetValue(v27, v28, "_saSetHandoffPayload:completion:");
    v29 = self->_commandMap;
    v30 = (const void *)objc_opt_class(&OBJC_CLASS___SAStartLocalRequest);
    CFDictionarySetValue(v29, v30, "_saStartLocalRequest:completion:");
    v31 = self->_commandMap;
    v32 = (const void *)objc_opt_class(&OBJC_CLASS___SAAddResultObjects);
    CFDictionarySetValue(v31, v32, "_saAddResultObjects:completion:");
    v33 = self->_commandMap;
    v34 = (const void *)objc_opt_class(&OBJC_CLASS___SAExecuteCallbacks);
    CFDictionarySetValue(v33, v34, "_saExecuteCallbacks:completion:");
    v35 = self->_commandMap;
    v36 = (const void *)objc_opt_class(&OBJC_CLASS___SAInitiateHandoffOnCompanion);
    CFDictionaryAddValue(v35, v36, "_saInitiateHandoffOnCompanion:completion:");
    v37 = self->_commandMap;
    v38 = (const void *)objc_opt_class(&OBJC_CLASS___SASetDeviceTTSMuteState);
    CFDictionaryAddValue(v37, v38, "_saSetDeviceTTSMuteState:completion:");
    v39 = self->_commandMap;
    v40 = (const void *)objc_opt_class(&OBJC_CLASS___SAPing);
    CFDictionaryAddValue(v39, v40, "_saPing:completion:");
    v41 = self->_commandMap;
    v42 = (const void *)objc_opt_class(&OBJC_CLASS___SAWaitForCommands);
    CFDictionaryAddValue(v41, v42, "_saWaitForCommands:completion:");
    v43 = self->_commandMap;
    v44 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncGetAnchorsResponse);
    CFDictionarySetValue(v43, v44, "_saSyncGetAnchorsResponse:completion:");
    v45 = self->_commandMap;
    v46 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncChunkDenied);
    CFDictionarySetValue(v45, v46, "_saSyncChunkDenied:completion:");
    v47 = self->_commandMap;
    v48 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncChunkAccepted);
    CFDictionarySetValue(v47, v48, "_saSyncChunkAccepted:completion:");
    v49 = self->_commandMap;
    v50 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncGetCachedSyncAnchors);
    CFDictionarySetValue(v49, v50, "_saSASyncGetCachedSyncAnchors:completion:");
    v51 = self->_commandMap;
    v52 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncGetAnchors);
    CFDictionarySetValue(v51, v52, "_saSyncGetAnchors:completion:");
    v53 = self->_commandMap;
    v54 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncClientVerify);
    CFDictionarySetValue(v53, v54, "_saSyncClientVerify:completion:");
    v55 = self->_commandMap;
    v56 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncServerVerifyResponse);
    CFDictionarySetValue(v55, v56, "_saSyncServerVerifyResponse:completion:");
    v57 = self->_commandMap;
    v58 = (const void *)objc_opt_class(&OBJC_CLASS___SASyncFinished);
    CFDictionarySetValue(v57, v58, "_saSyncFinished:completion:");
    v59 = self->_commandMap;
    v60 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectCreate);
    CFDictionarySetValue(v59, v60, "_saDomainObjectCreate:completion:");
    v61 = self->_commandMap;
    v62 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectRetrieve);
    CFDictionarySetValue(v61, v62, "_saDomainObjectRetrieve:completion:");
    v63 = self->_commandMap;
    v64 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectUpdate);
    CFDictionarySetValue(v63, v64, "_saDomainObjectUpdate:completion:");
    v65 = self->_commandMap;
    v66 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectCancel);
    CFDictionarySetValue(v65, v66, "_saDomainObjectCancel:completion:");
    v67 = self->_commandMap;
    v68 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectDelete);
    CFDictionarySetValue(v67, v68, "_saDomainObjectDelete:completion:");
    v69 = self->_commandMap;
    v70 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectCommit);
    CFDictionarySetValue(v69, v70, "_saDomainObjectCommit:completion:");
    v71 = self->_commandMap;
    v72 = (const void *)objc_opt_class(&OBJC_CLASS___SADomainObjectPunchOut);
    CFDictionarySetValue(v71, v72, "_saDomainObjectPunchOut:completion:");
    v73 = self->_commandMap;
    v74 = (const void *)objc_opt_class(&OBJC_CLASS___SASSpeechPartialResult);
    CFDictionarySetValue(v73, v74, "_sasSpeechPartialResult:completion:");
    v75 = self->_commandMap;
    v76 = (const void *)objc_opt_class(&OBJC_CLASS___SASSpeechFailure);
    CFDictionarySetValue(v75, v76, "_sasSpeechFailure:completion:");
    v77 = self->_commandMap;
    v78 = (const void *)objc_opt_class(&OBJC_CLASS___SASAbortSpeechRequest);
    CFDictionarySetValue(v77, v78, "_sasAbortSpeechRequest:completion:");
    v79 = self->_commandMap;
    v80 = (const void *)objc_opt_class(&OBJC_CLASS___SAStructuredDictationResult);
    CFDictionarySetValue(v79, v80, "_saStructuredDictationResult:completion:");
    v81 = self->_commandMap;
    v82 = (const void *)objc_opt_class(&OBJC_CLASS___SAStructuredDictationFailed);
    CFDictionarySetValue(v81, v82, "_saStructuredDictationFailure:completion:");
    v83 = self->_commandMap;
    v84 = (const void *)objc_opt_class(&OBJC_CLASS___SASVoiceSearchPartialResult);
    CFDictionarySetValue(v83, v84, "_sasVoiceSearchPartialResult:completion:");
    v85 = self->_commandMap;
    v86 = (const void *)objc_opt_class(&OBJC_CLASS___SASVoiceSearchFinalResult);
    CFDictionarySetValue(v85, v86, "_sasVoiceSearchFinalResult:completion:");
    v87 = self->_commandMap;
    v88 = (const void *)objc_opt_class(&OBJC_CLASS___SASSuspendClientEndpointer);
    CFDictionarySetValue(v87, v88, "_sasSuspendClientEndpointer:completion:");
    v89 = self->_commandMap;
    v90 = (const void *)objc_opt_class(&OBJC_CLASS___SASConfirmEndpoint);
    CFDictionarySetValue(v89, v90, "_sasConfirmEndpoint:completion:");
    v91 = self->_commandMap;
    v92 = (const void *)objc_opt_class(&OBJC_CLASS___SASPronunciationRecognized);
    CFDictionarySetValue(v91, v92, "_sasPronunciationRecognized:completion:");
    v93 = self->_commandMap;
    v94 = (const void *)objc_opt_class(&OBJC_CLASS___SASServerEndpointFeatures);
    CFDictionarySetValue(v93, v94, "_sasServerEndpointFeatures:completion:");
    v95 = self->_commandMap;
    v96 = (const void *)objc_opt_class(&OBJC_CLASS___SASClientBoundConfusionNetwork);
    CFDictionarySetValue(v95, v96, "_sasClientBoundConfusionNetwork:completion:");
    v97 = self->_commandMap;
    v98 = (const void *)objc_opt_class(&OBJC_CLASS___SAClientSetupInfo);
    CFDictionarySetValue(v97, v98, "_saClientSetupInfo:completion:");
    v99 = self->_commandMap;
    v100 = (const void *)objc_opt_class(&OBJC_CLASS___SASResultCandidate);
    CFDictionarySetValue(v99, v100, "_sasResultCandidate:completion:");
    v101 = self->_commandMap;
    v102 = (const void *)objc_opt_class(&OBJC_CLASS___SASSpeechServerEndpointIdentified);
    CFDictionarySetValue(v101, v102, "_sasSpeechServerEndpointIdentified:completion:");
    v103 = self->_commandMap;
    v104 = (const void *)objc_opt_class(&OBJC_CLASS___SASVoiceIdentificationSignal);
    CFDictionarySetValue(v103, v104, "_sasVoiceIdentificationSignal:completion:");
    if ((AFIsHorseman(v105, v106) & 1) == 0)
    {
      v107 = self->_commandMap;
      v108 = (const void *)objc_opt_class(&OBJC_CLASS___SAAcknowledgeAlert);
      CFDictionarySetValue(v107, v108, "_saAcknowledgeAlert:completion:");
    }

    v109 = self->_commandMap;
    v110 = (const void *)objc_opt_class(&OBJC_CLASS___SADeviceConfiguration);
    CFDictionarySetValue(v109, v110, "_saDeviceConfiguration:completion:");
    v111 = self->_commandMap;
    v112 = (const void *)objc_opt_class(&OBJC_CLASS___SADeviceMyriadConfiguration);
    CFDictionarySetValue(v111, v112, "_saDeviceMyriadConfiguration:completion:");
    v113 = self->_commandMap;
    v114 = (const void *)objc_opt_class(&OBJC_CLASS___SADIAGSetLatencyDiagnosticConfiguration);
    CFDictionarySetValue(v113, v114, "_saSetLatencyDiagnosticConfiguration:completion:");
    v115 = self->_commandMap;
    v116 = (const void *)objc_opt_class(&OBJC_CLASS___SAAIRequestSearch);
    CFDictionaryAddValue(v115, v116, "_saAIRequestSearch:completion:");
    v117 = self->_commandMap;
    v118 = (const void *)objc_opt_class(&OBJC_CLASS___SAAISearchCompleted);
    CFDictionarySetValue(v117, v118, "_saAISearchCompleted:completion:");
    v119 = self->_commandMap;
    v120 = (const void *)objc_opt_class(&OBJC_CLASS___SAAIRetrySearch);
    CFDictionarySetValue(v119, v120, "_saAIRetrySearch:completion:");
    v121 = self->_commandMap;
    v122 = (const void *)objc_opt_class(&OBJC_CLASS___SALogSignatureWithABC);
    CFDictionarySetValue(v121, v122, "_saLogSignatureWithABC:completion:");
    v123 = self->_commandMap;
    v124 = (const void *)objc_opt_class(&OBJC_CLASS___SALogNumericEvent);
    CFDictionarySetValue(v123, v124, "_saLogNumericEvent:completion:");
    v125 = self->_commandMap;
    v126 = (const void *)objc_opt_class(&OBJC_CLASS___SALogStringEvent);
    CFDictionarySetValue(v125, v126, "_saLogStringEvent:completion:");
    v127 = self->_commandMap;
    v128 = (const void *)objc_opt_class(&OBJC_CLASS___SAPerformDataDetection);
    CFDictionarySetValue(v127, v128, "_saPerformDataDetection:completion:");
    v129 = self->_commandMap;
    v130 = (const void *)objc_opt_class(&OBJC_CLASS___SAStartUIRequest);
    CFDictionarySetValue(v129, v130, "_saStartUIRequest:completion:");
    v131 = self->_commandMap;
    v132 = (const void *)objc_opt_class(&OBJC_CLASS___SAReplayRequestFromDMHypothesis);
    CFDictionarySetValue(v131, v132, "_saReplayRequestFromDMHypothesis:completion:");
    v133 = self->_commandMap;
    v134 = (const void *)objc_opt_class(&OBJC_CLASS___SATTSGetSpeechSynthesisVolume);
    CFDictionarySetValue(v133, v134, "_saTTSGetSpeechSynthesisVolume:completion:");
    v135 = self->_commandMap;
    v136 = (const void *)objc_opt_class(&OBJC_CLASS___SATTSSetSpeechSynthesisVolume);
    CFDictionarySetValue(v135, v136, "_saTTSSetSpeechSynthesisVolume:completion:");
    v137 = self->_commandMap;
    v138 = (const void *)objc_opt_class(&OBJC_CLASS___SANotificationsSearch);
    CFDictionarySetValue(v137, v138, "_saNotificationSearch:completion:");
    v139 = self->_commandMap;
    v140 = (const void *)objc_opt_class(&OBJC_CLASS___SAPerformRemoteAnnouncement);
    CFDictionarySetValue(v139, v140, "_saPerformRemoteAnnouncement:completion:");
    v141 = self->_commandMap;
    v142 = (const void *)objc_opt_class(&OBJC_CLASS___SADismissRemoteAnnouncement);
    CFDictionarySetValue(v141, v142, "_saDismissRemoteAnnouncement:completion:");
  }

  if (!self->_commandMapV2)
  {
    v143 = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
    self->_commandMapV2 = v143;
    v144 = (const void *)objc_opt_class(&OBJC_CLASS___SARequestCompleted);
    CFDictionarySetValue(v143, v144, "_saRequestCompleted:executionContext:completion:");
    commandMapV2 = self->_commandMapV2;
    v146 = (const void *)objc_opt_class(&OBJC_CLASS___SACancelCrossDeviceRequest);
    CFDictionarySetValue(commandMapV2, v146, "_saCancelCrossDeviceRequest:executionContext:completion:");
    v147 = self->_commandMapV2;
    v148 = (const void *)objc_opt_class(&OBJC_CLASS___SAExecuteOnRemoteRequest);
    CFDictionarySetValue(v147, v148, "_saExecuteOnRemoteRequest:executionContext:completion:");
    v149 = self->_commandMapV2;
    v150 = (const void *)objc_opt_class(&OBJC_CLASS___SASSpeechRecognized);
    CFDictionarySetValue(v149, v150, "_sasSpeechRecognized:executionContext:completion:");
    v151 = self->_commandMapV2;
    v152 = (const void *)objc_opt_class(&OBJC_CLASS___SASMultilingualSpeechRecognized);
    CFDictionarySetValue(v151, v152, "_sasSpeechMultilingualSpeechRecognized:executionContext:completion:");
    v153 = self->_commandMapV2;
    v154 = (const void *)objc_opt_class(&OBJC_CLASS___SASExtractSpeechData);
    CFDictionarySetValue(v153, v154, "_sasExtractSpeechData:executionContext:completion:");
    v155 = self->_commandMapV2;
    v156 = (const void *)objc_opt_class(&OBJC_CLASS___SAQuickStop);
    CFDictionarySetValue(v155, v156, "_saQuickStop:executionContext:completion:");
    v157 = self->_commandMapV2;
    v158 = (const void *)objc_opt_class(&OBJC_CLASS___SAGetRequestOrigin);
    CFDictionarySetValue(v157, v158, "_saGetRequestOrigin:executionContext:completion:");
    v159 = self->_commandMapV2;
    v160 = (const void *)objc_opt_class(&OBJC_CLASS___SAGetAssistantData);
    CFDictionarySetValue(v159, v160, "_saGetAssistantData:executionContext:completion:");
    v161 = self->_commandMapV2;
    v162 = (const void *)objc_opt_class(&OBJC_CLASS___SAPostPersonalDomainActivityNotification);
    CFDictionaryAddValue(v161, v162, "_saPostPersonalDomainActivityNotification:executionContext:completion:");
    v163 = self->_commandMapV2;
    v164 = (const void *)objc_opt_class(&OBJC_CLASS___SAPostCalendarActivityNotification);
    CFDictionaryAddValue(v163, v164, "_saPostCalendarActivityNotification:executionContext:completion:");
    v165 = self->_commandMapV2;
    v166 = (const void *)objc_opt_class(&OBJC_CLASS___SAPostUpdatePersonalRequestSettingsNotification);
    CFDictionaryAddValue(v165, v166, "_saPostUpdatePersonalRequestSettingsNotification:executionContext:completion:");
  }

  v167 = self->_commandMap;
  v168 = (const void *)objc_opt_class(v176);
  Value = (const char *)CFDictionaryGetValue(v167, v168);
  if (Value)
  {
    v170 = Value;
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    objc_msgSend(v171, v170, v176, v12);
  }

  else
  {
    v172 = self->_commandMapV2;
    v173 = (const void *)objc_opt_class(v176);
    v174 = (const char *)CFDictionaryGetValue(v172, v173);
    v175 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v171 = v175;
    if (v174) {
      objc_msgSend(v175, v174, v176, v11, v12);
    }
    else {
      [v175 _saUnhandledObject:v176 completion:v12];
    }
  }
}

- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void (**)(void))a5;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SASExtractSpeechDataCompleted);
  if ((objc_opt_isKindOfClass(v14, v9) & 1) != 0
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___SASExtractSpeechData), (objc_opt_isKindOfClass(v7, v10) & 1) != 0))
  {
    id v11 = v7;
    id v12 = v14;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v13 _handleExtractSpeechDataCompleted:v12 inResponseTo:v11 completion:v8];
  }

  else if (v8)
  {
    v8[2](v8);
  }
}

@end