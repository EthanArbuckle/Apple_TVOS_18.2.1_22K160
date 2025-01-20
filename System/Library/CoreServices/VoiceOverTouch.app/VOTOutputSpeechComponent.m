@interface VOTOutputSpeechComponent
+ (void)_setOverrideLocale:(id)a3;
- (BOOL)_currentLocaleUsesSpaceAsSeparator;
- (BOOL)_formatDetectedFinnishDates:(id)a3;
- (BOOL)_makeSubstitution:(id)a3 withString:(id)a4 punctuationGroup:(id)a5;
- (BOOL)_processActionForLiteralEmojis:(id)a3;
- (BOOL)_replaceRepeatedPuntuationAndEmoji:(id)a3 newString:(id)a4 charReplacementString:(id)a5 charSequence:(id)a6 charIndex:(int64_t *)a7 speakPunctuationCounts:(BOOL)a8 languageCode:(id)a9;
- (BOOL)_stringMatchesSpecialCases:(id)a3 forSymbol:(id)a4 ranges:(id *)a5 langaugeCode:(id)a6;
- (BOOL)_usingAllChannels;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3;
- (BOOL)stringIsInSupportedCharacters:(id)a3;
- (BSInvalidatable)disableIdleTimerAssertion;
- (NSDictionary)emoticonReplacements;
- (NSNumber)activityBasedAudioDucking;
- (TTSSpeechSynthesizer)synthesizer;
- (TTSSpeechSynthesizer)synthesizerForTelephonyMixin;
- (VOTOutputSpeechComponent)init;
- (double)outputMutedActivityLastToggleTime;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6;
- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8;
- (float)_determineSpeakingRate:(id)a3 languageCode:(id)a4;
- (float)_determineVolume:(id)a3;
- (float)_pauseDelayForType:(int)a3 speechRate:(float)a4 voiceType:(int64_t)a5;
- (float)mapSettingsPitchToSpeechPitch:(float)a3;
- (float)rate;
- (float)volume;
- (id)_determinePunctuationGroupForAction:(id)a3 isDefault:(BOOL *)a4;
- (id)_determineSpeechSourceForAction:(id)a3;
- (id)_determineVoiceIdentifier:(id)a3 languageCode:(id)a4;
- (id)_internalVoiceOverSubstitutions;
- (id)_literalStringMarkupForString:(id)a3 languageCode:(id)a4 action:(id)a5;
- (id)_localeSpecificURLRegexForLanguageCode:(id)a3;
- (id)_localeSpecificURLsForLanguageCode:(id)a3;
- (id)_parseNumberInString:(id)a3 beforeCharacterAtIndex:(int64_t)a4 numberRange:(_NSRange *)a5;
- (id)_preferenceLanguageForLanguage:(id)a3 selectedLanguage:(id)a4;
- (id)_processCaptionTextForMarkup:(id)a3 regex:(id)a4 range:(_NSRange *)a5;
- (id)_replacePunctuation:(id)a3 punctuationGroup:(id)a4 hasMathContext:(BOOL)a5 hasPhoneContext:(BOOL)a6 isText:(BOOL)a7 replaceCommas:(BOOL)a8 languageCode:(id)a9 speakPunctuationCounts:(BOOL)a10;
- (id)_secureTextDescription:(id)a3;
- (id)_spokenTextForRequest:(id)a3 range:(_NSRange *)a4;
- (id)_stringForLiteralText:(id)a3 action:(id)a4 allowChangingLanguageForPunctuation:(BOOL)a5;
- (id)_stringForNormalText:(id)a3 action:(id)a4 allowPausingAtBoundaries:(BOOL)a5 ignoreLeadingCommas:(BOOL)a6;
- (id)_urlRangesInString:(id)a3 languageCode:(id)a4;
- (id)baseTableForPunctuationGroup:(id)a3;
- (id)currentAllPunctuationTable;
- (id)currentNonePunctuationTable;
- (id)currentSomePunctuationTable;
- (id)expectedVoiceIdentifier:(id)a3;
- (id)fileSystemPunctuationGroup;
- (id)outputMutedActivityValue:(id)a3;
- (id)pauseStringForType:(int)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (id)punctuationReplacement:(id)a3 withGroup:(id)a4 baseTable:(id)a5 languageCode:(id)a6 selectedLanguage:(id)a7 spokenLanguage:(id)a8;
- (id)replacePunctuation:(id)a3 punctuationGroup:(id)a4 replaceCommas:(BOOL)a5 languageCode:(id)a6;
- (id)stringReplacingBrailleDotRanges:(id)a3;
- (int64_t)_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:(id)a3;
- (void)_appendLiteralCharacterString:(id)a3 toString:(id)a4 hasPhoneContext:(BOOL)a5 hasMathContext:(BOOL)a6 action:(id)a7 punctuationTableLanguageUsed:(BOOL *)a8;
- (void)_applyCamelCaseSeparation:(id)a3;
- (void)_applyTelephoneFormatting:(id)a3 withRanges:(id)a4 languageCode:(id)a5 voiceIdentifier:(id)a6 rate:(float)a7;
- (void)_applyTransliteration:(id)a3 languageCode:(id)a4;
- (void)_audioSessionWasInterrupted:(id)a3;
- (void)_callStatusChanged;
- (void)_capVolumeForLanguage:(id)a3 volume:(float)a4;
- (void)_configureSynthesizerWithPhonemeSubstitutionsFromAction:(id)a3;
- (void)_createTelephonySynthesizer;
- (void)_determineEmojiPreferenceForAction:(id)a3;
- (void)_didFinishSpeaking:(id)a3;
- (void)_didStartSpeakingAction:(id)a3;
- (void)_formatATVStyleMediaDurations:(id)a3;
- (void)_formatDetectedDates:(id)a3 voiceIdentifier:(id)a4 languageCode:(id)a5 rate:(float)a6;
- (void)_formatEthernetMacAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (void)_formatExplicitTimeDuration:(id)a3 isMMSS:(BOOL)a4 languageCode:(id)a5;
- (void)_formatIPAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5;
- (void)_formatJapaneseYen:(id)a3;
- (void)_formatNumbers:(id)a3 action:(id)a4;
- (void)_formatTelephoneNumber:(id)a3 languageCode:(id)a4 voiceIdentifier:(id)a5 rate:(float)a6;
- (void)_formatTimeDuration:(id)a3 didMatch:(BOOL *)a4 voiceIdentifier:(id)a5 rate:(float)a6;
- (void)_formatUSHeight:(id)a3 voiceIdentifier:(id)a4;
- (void)_handleContinueSpeaking:(id)a3;
- (void)_handlePauseSpeaking:(id)a3;
- (void)_handlePerformAction:(id)a3;
- (void)_handleStopSpeaking:(id)a3;
- (void)_initializePunctuationData;
- (void)_initializeSynthesizer;
- (void)_initializeThread;
- (void)_insertLongerPausesForSymbol:(id)a3 withText:(id)a4 allowPausingAtBoundaries:(BOOL)a5 onlyApplyWhenFollowedBySpace:(BOOL)a6 languageCode:(id)a7 voiceIdentifier:(id)a8 rate:(float)a9;
- (void)_loadNoneTableOverrides;
- (void)_loadPunctuationTable:(id)a3 withLevel:(int64_t)a4 language:(id)a5;
- (void)_loadSpecialPunctuation;
- (void)_notifyDidFinishSpeakingWithFakeRequestForEvent:(id)a3;
- (void)_preprocessActionLanguageAndVoice:(id)a3;
- (void)_processEmoji:(id)a3 action:(id)a4 rate:(float)a5;
- (void)_removeRunsOfNewLines:(id)a3;
- (void)_replaceEmbeddedTTSCommands:(id)a3;
- (void)_replaceEmoticonsWithText:(id)a3;
- (void)_replacePunctuation:(id)a3 withAction:(id)a4 languageCode:(id)a5;
- (void)_replaceRepeatedEmoji:(id)a3;
- (void)_replaceUserSubstitutions:(id)a3 action:(id)a4;
- (void)_resetLanguageDataOnSpeechThread:(id)a3 language:(id)a4;
- (void)_saveSpeechStats;
- (void)_selectedLanguageChanged:(id)a3;
- (void)_setDuckingLevelAlways:(double)a3;
- (void)_setDuckingLevelOnlySpeaking:(double)a3;
- (void)_setDuckingProperties;
- (void)_setRate:(id)a3;
- (void)_setUnDuckingProperties;
- (void)_setVoice:(id)a3;
- (void)_speakAllDigits:(id)a3;
- (void)_speakAsLiteralText:(id)a3;
- (void)_speakAsMixOfLiteralAndNormalText:(id)a3 withLiteralRanges:(id)a4;
- (void)_speakAsNormalText:(id)a3;
- (void)_speakAsPhoneticText:(id)a3;
- (void)_stopSpeakingAfterLongPause:(id)a3;
- (void)_tearDownTelephonySynthesizer;
- (void)_uncapVolume:(float)a3;
- (void)_updateActionWithCanonicalMappings:(id)a3;
- (void)_updateAudioSessionProperties;
- (void)_updateChannelLayout;
- (void)_updateDuckingBasedOnActivity:(id)a3;
- (void)_updatePitch:(id)a3 settingsPitch:(float)a4;
- (void)_updateUserSubstitutions:(id)a3;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)callStatusChanged;
- (void)continueSpeaking;
- (void)dealloc;
- (void)handleEvent:(id)a3;
- (void)pauseSpeakingAtBoundary:(int)a3;
- (void)preprocessAction:(id)a3;
- (void)setActivityBasedAudioDucking:(id)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setDuckingProperties:(id)a3;
- (void)setEmoticonReplacements:(id)a3;
- (void)setRate:(float)a3;
- (void)setShouldOutputToHearingAid:(BOOL)a3;
- (void)setSynthesizerForTelephonyMixin:(id)a3;
- (void)setUnDuckingProperties:(id)a3;
- (void)setVoice:(id)a3;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6;
- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5;
- (void)stopSpeakingAtBoundary:(int)a3;
- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5;
- (void)updateAudioSessionProperties:(id)a3;
- (void)updateDuckingMode:(id)a3;
@end

@implementation VOTOutputSpeechComponent

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  return result;
}

- (double)performSelector:(SEL)a3 withThreadKey:(id)a4 waitTime:(double)a5 cancelMask:(unsigned int)a6 count:(unsigned int)a7 objects:(id)a8
{
  if (a6 == -1) {
    *(void *)&a6 = 4289724415LL;
  }
  else {
    *(void *)&a6 = a6;
  }
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  a3,  self,  *(void *)&a6,  *(void *)&a7,  a8,  a5);
  return result;
}

- (void)_initializeThread
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  v4 = (objc_class *)objc_opt_class(self, v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v7 setName:v6];
}

- (id)_internalVoiceOverSubstitutions
{
  id v2 = [[TTSSubstitution alloc] init];
  id v3 = sub_10004A988(off_1001AC148, @"explict.symbol", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 setOriginalString:v4];

  id v5 = sub_10004A988(off_1001AC148, @"explict.symbol.translation", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v2 setReplacementString:v6];

  id v9 = v2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (void)_updateUserSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 customPronunciationSubstitutions]);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent _internalVoiceOverSubstitutions](self, "_internalVoiceOverSubstitutions"));
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayWithPossiblyNilArrays:]( &OBJC_CLASS___NSArray,  "axArrayWithPossiblyNilArrays:",  2LL,  v6,  v9));

  [v4 setUserSubstitutions:v7];
  userSubstitutions = self->_userSubstitutions;
  self->_userSubstitutions = v7;
}

- (void)_tearDownTelephonySynthesizer
{
  uint64_t v3 = AXLogCommon(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Tearing down telephony synthesizer", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  [v5 stopSpeakingAtNextBoundary:0 error:0];

  -[VOTOutputSpeechComponent setSynthesizerForTelephonyMixin:](self, "setSynthesizerForTelephonyMixin:", 0LL);
}

- (void)_createTelephonySynthesizer
{
  uint64_t v3 = AXLogCommon(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating a telephony synthesizer", v9, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  if (!v5)
  {
    v6 = -[TTSSpeechSynthesizer init](objc_alloc(&OBJC_CLASS___TTSSpeechSynthesizer), "init");
    -[VOTOutputSpeechComponent setSynthesizerForTelephonyMixin:](self, "setSynthesizerForTelephonyMixin:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    -[VOTOutputSpeechComponent _updateUserSubstitutions:](self, "_updateUserSubstitutions:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    [v8 setAudioQueueFlags:320];
  }

- (void)_initializeSynthesizer
{
  uint64_t v3 = (TTSSpeechSynthesizer *)[objc_allocWithZone(TTSSpeechSynthesizer) init];
  synthesizer = self->_synthesizer;
  self->_synthesizer = v3;

  objc_initWeak(&location, self);
  -[VOTOutputSpeechComponent _updateUserSubstitutions:](self, "_updateUserSubstitutions:", self->_synthesizer);
  -[TTSSpeechSynthesizer setDelegate:](self->_synthesizer, "setDelegate:", self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTOutputSpeechComponent setShouldOutputToHearingAid:]( self,  "setShouldOutputToHearingAid:",  [v5 voiceOverShouldOutputToHearingAid]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v8 addObserver:self selector:"updateAudioSessionProperties:" name:AVAudioSessionRouteChangeNotification object:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"audioSessionWasInterrupted:" name:AVAudioSessionInterruptionNotification object:0];

  -[VOTOutputSpeechComponent _updateAudioSessionProperties](self, "_updateAudioSessionProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100028B14;
  v30[3] = &unk_1001772B8;
  objc_copyWeak(&v31, &location);
  v30[4] = self;
  [v11 registerUpdateBlock:v30 forRetrieveSelector:"customPronunciationSubstitutions" withListener:self];

  objc_destroyWeak(&v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100028B5C;
  v28[3] = &unk_100176F08;
  objc_copyWeak(&v29, &location);
  [v12 registerUpdateBlock:v28 forRetrieveSelector:"voiceOverShouldOutputToHearingAid" withListener:self];

  objc_destroyWeak(&v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100028BB4;
  v26[3] = &unk_100176F08;
  objc_copyWeak(&v27, &location);
  [v13 registerUpdateBlock:v26 forRetrieveSelector:"voiceOverAudioDuckingEnabled" withListener:self];

  objc_destroyWeak(&v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100028BE4;
  v24[3] = &unk_100176F08;
  objc_copyWeak(&v25, &location);
  [v14 registerUpdateBlock:v24 forRetrieveSelector:"_audioHardwareChannelLayout" withListener:self];

  objc_destroyWeak(&v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100028C14;
  v22[3] = &unk_100176F08;
  objc_copyWeak(&v23, &location);
  [v15 registerUpdateBlock:v22 forRetrieveSelector:"voiceOverMediaDuckingAmount" withListener:self];

  objc_destroyWeak(&v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100028C44;
  v20 = &unk_100176F08;
  objc_copyWeak(&v21, &location);
  [v16 registerUpdateBlock:&v17 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:self];

  objc_destroyWeak(&v21);
  -[VOTOutputSpeechComponent _callStatusChanged](self, "_callStatusChanged", v17, v18, v19, v20);
  objc_destroyWeak(&location);
}

- (void)callStatusChanged
{
}

- (void)_callStatusChanged
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 voiceOverSpeaksOverTelephoneCalls];

  if (v4)
  {
    id v5 = [(id)VOTSharedWorkspace telephonyIsActive];
    int v6 = (int)v5;
    uint64_t v7 = VOTLogCommon(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Call status change to %d for telephony synthesizer",  (uint8_t *)v9,  8u);
    }

    if (v6) {
      -[VOTOutputSpeechComponent _createTelephonySynthesizer](self, "_createTelephonySynthesizer");
    }
    else {
      -[VOTOutputSpeechComponent _tearDownTelephonySynthesizer](self, "_tearDownTelephonySynthesizer");
    }
  }

  else
  {
    -[VOTOutputSpeechComponent _tearDownTelephonySynthesizer](self, "_tearDownTelephonySynthesizer");
  }

- (BOOL)_usingAllChannels
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentRoute]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 savedChannelsForOutput:v4 forSource:1]);

  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXAudioHardwareManager defaultPortChannels]( &OBJC_CLASS___AXAudioHardwareManager,  "defaultPortChannels"));
  if (v5)
  {
    if (![v5 isEqualToArray:v6])
    {
      BOOL v23 = 0;
      goto LABEL_16;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemAudioRouting sharedInstance](&OBJC_CLASS___AXSubsystemAudioRouting, "sharedInstance"));
    unsigned __int8 v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemAudioRouting identifier](&OBJC_CLASS___AXSubsystemAudioRouting, "identifier"));
      uint64_t v10 = AXLoggerForFacility();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = AXColorizeFormatLog(3LL, @"Channels are all channels, using all channels");
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = _AXStringForArgs(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v11, v12))
        {
          int v25 = 138543362;
          v26 = v16;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", (uint8_t *)&v25, 0xCu);
          goto LABEL_12;
        }

        goto LABEL_12;
      }

      goto LABEL_13;
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemAudioRouting sharedInstance](&OBJC_CLASS___AXSubsystemAudioRouting, "sharedInstance"));
    unsigned __int8 v18 = [v17 ignoreLogging];

    if ((v18 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemAudioRouting identifier](&OBJC_CLASS___AXSubsystemAudioRouting, "identifier"));
      uint64_t v20 = AXLoggerForFacility();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v21 = AXColorizeFormatLog(3LL, @"No selected channels, using all channels");
        v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
        uint64_t v22 = _AXStringForArgs(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v11, v12))
        {
          int v25 = 138543362;
          v26 = v16;
          goto LABEL_11;
        }

- (void)_audioSessionWasInterrupted:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[VOTOutputSpeechComponent isSpeaking](self, "isSpeaking");
  if (v5 || self->_currentRequest)
  {
    uint64_t v7 = VOTLogAudio(v5, v6);
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AVAudioSessionInterruptorNameKey"]);
      int v11 = 138412290;
      os_log_type_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "speech interrupted by %@ Dropping current speech request.",  (uint8_t *)&v11,  0xCu);
    }

    self->_userStopped = 0;
    self->_isPaused = 0;
    -[SCRCTargetSelectorTimer cancel](self->_stopSpeakingAfterLongPauseTimer, "cancel");
    self->_lastTimeSpeechStarted = -3061152000.0;
    -[TTSSpeechSynthesizer stopSpeakingAtNextBoundary:error:]( self->_synthesizer,  "stopSpeakingAtNextBoundary:error:",  0LL,  0LL);
  }
}

- (void)audioSessionWasInterrupted:(id)a3
{
}

- (void)updateAudioSessionProperties:(id)a3
{
}

- (void)setDuckingProperties:(id)a3
{
}

- (void)setUnDuckingProperties:(id)a3
{
}

- (void)updateDuckingMode:(id)a3
{
}

- (void)_updateAudioSessionProperties
{
  uint64_t v3 = (uint64_t)-[SCRCThread _debug_currentlyRunningOnThisThread]( self->_speechThread,  "_debug_currentlyRunningOnThisThread");
  if ((v3 & 1) == 0) {
    uint64_t v3 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTOutputSpeechComponent.m",  393LL,  "-[VOTOutputSpeechComponent _updateAudioSessionProperties]",  @"Must be on speech thread");
  }
  uint64_t v5 = VOTLogAudio(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v8 = [v7 voiceOverAudioDuckingEnabled];
    unsigned int v9 = [(id)VOTSharedWorkspace audioDestinationRequestExternal];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    *(_DWORD *)buf = 67109632;
    unsigned int v39 = v8;
    __int16 v40 = 1024;
    unsigned int v41 = v9;
    __int16 v42 = 1024;
    unsigned int v43 = [v10 voiceOverAudioFollowsHDMIAudio];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Update audio session properties: ducking:%d, destination external %d. Force VO->HDMI: %d",  buf,  0x14u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v12 = [v11 voiceOverAudioDuckingEnabled];

  if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume())
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v12 = [v13 voiceOverMediaDuckingMode] != 0;
  }

  id v14 = [(id)VOTSharedWorkspace speechMuted];
  if ((_DWORD)v14)
  {
    uint64_t v16 = VOTLogAudio(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not ducking because speech is muted", buf, 2u);
    }

    unsigned int v12 = 0;
  }

  id v18 = [(id)VOTSharedWorkspace duckingTemporarilyDisabled];
  if ((_DWORD)v18)
  {
    uint64_t v20 = VOTLogAudio(v18, v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Not ducking because the app told us to duck temporarily",  buf,  2u);
    }

    unsigned int v12 = 0;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent activityBasedAudioDucking](self, "activityBasedAudioDucking"));

  if (v22)
  {
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent activityBasedAudioDucking](self, "activityBasedAudioDucking"));
    unsigned int v12 = [v23 BOOLValue];

    uint64_t v26 = VOTLogAudio(v24, v25);
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v39 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Ducking status change because the activity determined ducking: %d",  buf,  8u);
    }
  }

  BOOL v28 = -[VOTOutputSpeechComponent _usingAllChannels](self, "_usingAllChannels");
  if (v28)
  {
    int v30 = AXRuntimeCheck_SupportsVoiceoverIndepedentVolume();
    if (v12)
    {
      if (v30)
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        if ([v31 voiceOverMediaDuckingMode] == (id)2) {
          uint64_t v32 = 1LL;
        }
        else {
          uint64_t v32 = 2LL;
        }
      }

      else
      {
        uint64_t v32 = 2LL;
      }

      if ((AXRuntimeCheck_SupportsVoiceoverIndepedentVolume() & 1) != 0) {
        -[VOTOutputSpeechComponent setDuckingProperties:](self, "setDuckingProperties:", 0LL);
      }
      goto LABEL_36;
    }

    uint64_t v32 = 1LL;
    if ((v30 & 1) == 0) {
      goto LABEL_36;
    }
LABEL_35:
    -[VOTOutputSpeechComponent setUnDuckingProperties:](self, "setUnDuckingProperties:", 0LL);
    goto LABEL_36;
  }

  uint64_t v33 = VOTLogAudio(v28, v29);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Not ducking because we're not using all channels",  buf,  2u);
  }

  uint64_t v32 = 1LL;
  if ((AXRuntimeCheck_SupportsVoiceoverIndepedentVolume() & 1) != 0) {
    goto LABEL_35;
  }
LABEL_36:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 audioSessionQueue]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10002963C;
  v37[3] = &unk_100176F30;
  v37[4] = self;
  v37[5] = v32;
  [v36 performSynchronousWritingBlock:v37];

  -[VOTOutputSpeechComponent _updateChannelLayout](self, "_updateChannelLayout");
}

- (void)_setDuckingProperties
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 voiceOverMediaDuckingAmount];
  double v5 = v4;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v7 = [v6 voiceOverMediaDuckingMode];

  uint64_t v10 = VOTLogAudio(v8, v9);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v12 voiceOverMediaDuckingMode]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating audio ducking properties: audio ducking mode %@ audio ducking volume %@",  (uint8_t *)&v15,  0x16u);
  }

  if (v7 == (id)2)
  {
    -[VOTOutputSpeechComponent _setDuckingLevelAlways:](self, "_setDuckingLevelAlways:", 1.0 - v5);
  }

  else
  {
    -[VOTOutputSpeechComponent _setDuckingLevelAlways:](self, "_setDuckingLevelAlways:", 1.0);
    -[VOTOutputSpeechComponent _setDuckingLevelOnlySpeaking:](self, "_setDuckingLevelOnlySpeaking:", 1.0 - v5);
  }

- (void)_setDuckingLevelAlways:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  *(float *)&double v5 = a3;
  id v6 = [v4 setDuckScalarForVoiceOver:v5];
  int v7 = (int)v6;
  uint64_t v9 = VOTLogAudio(v6, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    int v16 = 138412290;
    __int16 v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Setting duck scalar amount vo: %@",  (uint8_t *)&v16,  0xCu);
  }

  if (v7)
  {
    uint64_t v14 = VOTLogAudio(v12, v13);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000F01A4(v7, v15);
    }
  }
}

- (void)_setDuckingLevelOnlySpeaking:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  id v16 = 0LL;
  [v4 setDuckToLevelScalar:v5 unduckToLevelScalar:0 error:&v16];
  id v6 = v16;

  uint64_t v9 = VOTLogAudio(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    *(_DWORD *)buf = 138412290;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Setting duck to level scalar amount vo: %@",  buf,  0xCu);
  }

  if (v6)
  {
    uint64_t v14 = VOTLogAudio(v12, v13);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000F024C((uint64_t)v6, v15);
    }
  }
}

- (void)_setUnDuckingProperties
{
}

- (void)_updateChannelLayout
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAudioHardwareManager defaultRouteDescription]( &OBJC_CLASS___AXAudioHardwareManager,  "defaultRouteDescription"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 savedChannelsForOutput:v5 forSource:1]);

  uint64_t v9 = VOTLogAudio(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 currentRoute]);
    uint64_t v12 = self;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 currentRoute]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 outputs]);
    *(_DWORD *)buf = 138412802;
    v64 = v11;
    __int16 v65 = 2114;
    v66 = v14;
    __int16 v67 = 2114;
    v68 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Route %@: Channel layout %{public}@ and channels %{public}@",  buf,  0x20u);

    self = v12;
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
  unsigned int v16 = [v15 isDolbyAtmosConfigured];

  if (v16)
  {
    uint64_t v19 = VOTLogAudio(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Session has dolby available, defaulting to center channel logic",  buf,  2u);
    }
  }

  else if (v6)
  {
    goto LABEL_38;
  }

  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXAudioHardwareManager defaultPortChannels]( &OBJC_CLASS___AXAudioHardwareManager,  "defaultPortChannels"));
  uint64_t v23 = VOTLogAudio(v21, v22);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Default port channels: %@", buf, 0xCu);
  }

  if ((unint64_t)-[os_log_s count](v21, "count") < 3)
  {
    id v6 = 0LL;
  }

  else
  {
    if ((unint64_t)-[os_log_s count](v21, "count") < 5)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s subarrayWithRange:](v21, "subarrayWithRange:", 0LL, 2LL));
      uint64_t v40 = VOTLogAudio(v6, v39);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v64 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No selected channels, but we have more than 2 channels so using first 2 [%{public}@]",  buf,  0xCu);
      }
    }

    else
    {
      v56 = self;
      v57 = v3;
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      v55 = v21;
      uint64_t v26 = v21;
      id v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v58,  v62,  16LL);
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v59;
        do
        {
          int v30 = 0LL;
          do
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v30);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 channel]);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 channel]);
            if ([v33 channelLabel] == 9)
            {

LABEL_20:
LABEL_21:
              -[os_log_s addObject:](v25, "addObject:", v31);
              goto LABEL_22;
            }

            v34 = (void *)objc_claimAutoreleasedReturnValue([v31 channel]);
            unsigned int v35 = [v34 channelLabel];

            if (v35 == 44) {
              goto LABEL_21;
            }
LABEL_22:
            int v30 = (char *)v30 + 1;
          }

          while (v28 != v30);
          id v36 = -[os_log_s countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v58,  v62,  16LL);
          id v28 = v36;
        }

        while (v36);
      }

      v37 = (os_log_s *)-[os_log_s count](v25, "count");
      if (v37)
      {
        v37 = v25;
        id v6 = v37;
      }

      else
      {
        id v6 = 0LL;
      }

      uint64_t v3 = v57;
      uint64_t v41 = VOTLogAudio(v37, v38);
      __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "No selected channels, but we're on tv and we have surround sound, so VO uses center channel: %@",  buf,  0xCu);
      }

      uint64_t v21 = v55;
      self = v56;
    }
  }

LABEL_38:
  id v43 = +[AXAudioHardwareManager channelsAreWiredHeadphones:]( &OBJC_CLASS___AXAudioHardwareManager,  "channelsAreWiredHeadphones:",  v6);
  if ((_DWORD)v43)
  {
    uint64_t v45 = VOTLogAudio(v43, v44);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v64 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Our selected channels are the default wired headset channels, so no need to set them explicitly [%{public}@]",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v3 currentRoute]);
  unsigned int v48 = +[AXAudioHardwareManager channelsAreAirplay:route:]( &OBJC_CLASS___AXAudioHardwareManager,  "channelsAreAirplay:route:",  v6,  v47);

  if (v48)
  {
    uint64_t v51 = VOTLogAudio(v49, v50);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v64 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Our selected channels are AirPlay so no need to set selected channels [%{public}@]",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  uint64_t v53 = VOTLogAudio(v49, v50);
  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Set selected channels on synth: %{public}@",  buf,  0xCu);
  }

  -[TTSSpeechSynthesizer setOutputChannels:](self->_synthesizer, "setOutputChannels:", v6);
}

- (void)_loadSpecialPunctuation
{
  specialPunctionTable = self->_specialPunctionTable;
  if (!specialPunctionTable)
  {
    double v4 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
    double v5 = self->_specialPunctionTable;
    self->_specialPunctionTable = v4;

    specialPunctionTable = self->_specialPunctionTable;
  }

  -[AXIndexMap setObject:forIndex:](specialPunctionTable, "setObject:forIndex:", @"ff", 64256LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"fi", 64257LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"fl", 64258LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"ffi", 64259LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"ffl", 64260LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"st", 64261LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"st", 64262LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"'", 700LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"'", 8242LL);
  -[AXIndexMap setObject:forIndex:](self->_specialPunctionTable, "setObject:forIndex:", @"\"", 8243LL);
}

- (void)_loadNoneTableOverrides
{
  noneTableOverrides = self->_noneTableOverrides;
  if (!noneTableOverrides)
  {
    double v4 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
    double v5 = self->_noneTableOverrides;
    self->_noneTableOverrides = v4;

    noneTableOverrides = self->_noneTableOverrides;
  }

  -[AXIndexMap setObject:forIndex:](noneTableOverrides, "setObject:forIndex:", @"'", 8217LL);
  -[AXIndexMap setObject:forIndex:](self->_noneTableOverrides, "setObject:forIndex:", @"'", 39LL);
  -[AXIndexMap setObject:forIndex:](self->_noneTableOverrides, "setObject:forIndex:", @"'", 65287LL);
}

- (VOTOutputSpeechComponent)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___VOTOutputSpeechComponent;
  id v2 = -[VOTOutputComponent init](&v22, "init");
  if (v2)
  {
    uint64_t v3 = (SCRCThread *)[objc_allocWithZone(SCRCThread) init];
    speechThread = v2->_speechThread;
    v2->_speechThread = v3;

    double v5 = v2->_speechThread;
    uint64_t v7 = (objc_class *)objc_opt_class(v2, v6);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SCRCThread setName:](v5, "setName:", v9);

    -[SCRCThread performSelector:onTarget:count:objects:]( v2->_speechThread,  "performSelector:onTarget:count:objects:",  "_initializeThread",  v2,  0LL,  0LL);
    -[SCRCThread performSelector:onTarget:count:objects:]( v2->_speechThread,  "performSelector:onTarget:count:objects:",  "_initializeSynthesizer",  v2,  0LL,  0LL);
    -[VOTOutputSpeechComponent _initializePunctuationData](v2, "_initializePunctuationData");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForResource:@"VOTLanguageExceptions" ofType:@"plist"]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v11));
    languageExceptions = v2->_languageExceptions;
    v2->_languageExceptions = (NSDictionary *)v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForResource:@"VOTEmoticons" ofType:@"plist"]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v14));
    emoticonReplacements = v2->_emoticonReplacements;
    v2->_emoticonReplacements = (NSDictionary *)v15;

    if (!v2->_emoticonReplacements) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTOutputSpeechComponent.m",  836LL,  "-[VOTOutputSpeechComponent init]",  @"Emoticons were nil");
    }
    v2->_lastTimeSpeechStarted = -3061152000.0;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v2 selector:"_selectedLanguageChanged:" name:off_1001ABEF0 object:0];

    -[VOTOutputSpeechComponent _selectedLanguageChanged:](v2, "_selectedLanguageChanged:", 0LL);
    uint64_t v18 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_stopSpeakingAfterLongPause:" threadKey:v2->super._threadKey];
    stopSpeakingAfterLongPauseTimer = v2->_stopSpeakingAfterLongPauseTimer;
    v2->_stopSpeakingAfterLongPauseTimer = v18;

    uint64_t v20 = v2;
  }

  return v2;
}

- (void)_initializePunctuationData
{
  uint64_t v3 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
  allPunctuationTable = self->_allPunctuationTable;
  self->_allPunctuationTable = v3;

  double v5 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  selectedLanguageAllPunctuationTable = self->_selectedLanguageAllPunctuationTable;
  self->_selectedLanguageAllPunctuationTable = v5;

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  selectedLanguageSomePunctuationTable = self->_selectedLanguageSomePunctuationTable;
  self->_selectedLanguageSomePunctuationTable = v7;

  uint64_t v9 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
  somePunctuationTable = self->_somePunctuationTable;
  self->_somePunctuationTable = v9;

  int v11 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  selectedLanguageNoPunctuationTable = self->_selectedLanguageNoPunctuationTable;
  self->_selectedLanguageNoPunctuationTable = v11;

  uint64_t v13 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
  noPunctuationTable = self->_noPunctuationTable;
  self->_noPunctuationTable = v13;

  -[VOTOutputSpeechComponent _loadSpecialPunctuation](self, "_loadSpecialPunctuation");
  -[VOTOutputSpeechComponent _loadNoneTableOverrides](self, "_loadNoneTableOverrides");
  -[VOTOutputSpeechComponent _loadPunctuationTable:withLevel:language:]( self,  "_loadPunctuationTable:withLevel:language:",  self->_allPunctuationTable,  1LL,  0LL);
  -[VOTOutputSpeechComponent _loadPunctuationTable:withLevel:language:]( self,  "_loadPunctuationTable:withLevel:language:",  self->_somePunctuationTable,  2LL,  0LL);
  -[VOTOutputSpeechComponent _loadPunctuationTable:withLevel:language:]( self,  "_loadPunctuationTable:withLevel:language:",  self->_noPunctuationTable,  3LL,  0LL);
}

- (void)_selectedLanguageChanged:(id)a3
{
  id v4 = a3;
  if (qword_1001ACCE0 != -1) {
    dispatch_once(&qword_1001ACCE0, &stru_100177320);
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  id v6 = [v5 copy];

  uint64_t v8 = VOTLogCommon(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Selected language changed: %@", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v10 = (void *)qword_1001ACCD0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002B0A0;
    v12[3] = &unk_100176DA8;
    v12[4] = self;
    id v13 = v6;
    [v10 afterDelay:v12 processBlock:0.0];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002B1F0;
    block[3] = &unk_100176D38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1001ACCD8, block);
  }
}

- (void)_resetLanguageDataOnSpeechThread:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  int v11 = (objc_class *)objc_opt_class(self, v10);
  uint64_t v12 = NSStringFromClass(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = [v6 count];
  uint64_t v15 = VOTLogCommon(v14);
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if (v14 != (id)3)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1000F02DC();
    }
    goto LABEL_10;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Reset lang data for %@", buf, 0xCu);
  }

  uint64_t v18 = (AXIndexMap *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  selectedLanguageAllPunctuationTable = self->_selectedLanguageAllPunctuationTable;
  self->_selectedLanguageAllPunctuationTable = v18;

  uint64_t v20 = (AXIndexMap *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
  selectedLanguageSomePunctuationTable = self->_selectedLanguageSomePunctuationTable;
  self->_selectedLanguageSomePunctuationTable = v20;

  objc_super v22 = (AXIndexMap *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:2]);
  selectedLanguageNoPunctuationTable = self->_selectedLanguageNoPunctuationTable;
  self->_selectedLanguageNoPunctuationTable = v22;

  unsigned int v24 = [(id)VOTSharedWorkspace inUnitTestMode];
  if (v7 && v24)
  {
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v26[0] = @"language";
    v26[1] = @"sender";
    v27[0] = v7;
    v27[1] = self;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    -[os_log_s postNotificationName:object:userInfo:]( v17,  "postNotificationName:object:userInfo:",  @"VOTLanguageReloaded",  0LL,  v25);

LABEL_10:
  }
}

- (id)currentSomePunctuationTable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageSomePunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__somePunctuationTable;
  }
  return *(id *)((char *)&self->super.super.isa + *v4);
}

- (id)currentNonePunctuationTable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageNoPunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__noPunctuationTable;
  }
  return *(id *)((char *)&self->super.super.isa + *v4);
}

- (id)currentAllPunctuationTable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

  id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__selectedLanguageAllPunctuationTable;
  if (!v3) {
    id v4 = &OBJC_IVAR___VOTOutputSpeechComponent__allPunctuationTable;
  }
  return *(id *)((char *)&self->super.super.isa + *v4);
}

- (void)_saveSpeechStats
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v3 setPreference:self->_speechStatistics forKey:@"SpeechStats"];

  -[VOTOutputSpeechComponent performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_saveSpeechStats",  0LL,  10.0);
}

- (void)_loadPunctuationTable:(id)a3 withLevel:(int64_t)a4 language:(id)a5
{
  id v7 = a3;
  AXLoadPunctuationTable();
  [v7 addObjectsFromIndexMap:self->_specialPunctionTable];
  if (a4 == 3) {
    [v7 addObjectsFromIndexMap:self->_noneTableOverrides];
  }
}

- (float)volume
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 voiceOverEffectiveSpeakingVolume];
  float v4 = v3;

  return v4;
}

- (void)_setRate:(id)a3
{
  id v4 = a3;
  uint64_t v7 = VOTLogSpeech(v4, v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "VoiceOver set rate %@", (uint8_t *)&v14, 0xCu);
  }

  synthesizer = self->_synthesizer;
  [v4 floatValue];
  -[TTSSpeechSynthesizer setRate:](synthesizer, "setRate:");
  [v4 floatValue];
  int v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  LODWORD(v13) = v11;
  [v12 setRate:v13];
}

- (float)rate
{
  return result;
}

- (void)setRate:(float)a3
{
  speechThread = self->_speechThread;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_setRate:",  self,  0x400000LL,  1LL,  v5);
}

- (void)_setVoice:(id)a3
{
  id v4 = a3;
  -[TTSSpeechSynthesizer setVoiceIdentifier:](self->_synthesizer, "setVoiceIdentifier:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  [v5 setVoiceIdentifier:v4];

  uint64_t v9 = VOTLogSpeech(v6, v7, v8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Set voice to %{public}@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)setVoice:(id)a3
{
}

- (void)pauseSpeakingAtBoundary:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [objc_allocWithZone(AXIndexMap) init];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  [v7 setObject:v5 forIndex:11];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 8LL));
  [v7 setObject:v6 forIndex:1];

  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  "handleEvent:",  self,  0x200000LL,  1LL,  v7);
}

- (void)continueSpeaking
{
  id v4 = [objc_allocWithZone(AXIndexMap) init];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 9LL));
  [v4 setObject:v3 forIndex:1];

  -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  "handleEvent:",  self,  0x200000LL,  1LL,  v4);
}

- (void)stopSpeakingAtBoundary:(int)a3 allRequests:(BOOL)a4 sessionDeactivationDelay:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v12 = a5;
  if (-[VOTOutputSpeechComponent isSpeaking](self, "isSpeaking") || self->_currentRequest)
  {
    id v8 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:v6];
    id v9 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:7];
    id v10 = [objc_allocWithZone(AXIndexMap) init];
    [v10 setObject:v8 forIndex:11];
    [v10 setObject:v9 forIndex:1];
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    [v10 setObject:v11 forIndex:24];

    [v10 setObject:v12 forIndex:84];
    -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( self->_speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  "handleEvent:",  self,  0x200000LL,  1LL,  v10);
  }

  else
  {
    if (!v12) {
      goto LABEL_5;
    }
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v12 doubleValue];
    objc_msgSend(v8, "disableAudioSession:userDelay:", @"SPEECH");
  }

LABEL_5:
}

- (void)stopSpeakingAtBoundary:(int)a3
{
}

- (void)_stopSpeakingAfterLongPause:(id)a3
{
  uint64_t v4 = VOTLogSpeech(self, a2, a3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waited max time for pause to continue, interrupting pause state",  v7,  2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:off_1001ABEF8 object:0];

  -[VOTOutputSpeechComponent stopSpeakingAtBoundary:](self, "stopSpeakingAtBoundary:", 0LL);
}

- (void)_handlePauseSpeaking:(id)a3
{
  id v9 = a3;
  if (-[VOTOutputSpeechComponent isSpeaking](self, "isSpeaking"))
  {
    self->_isPaused = 1;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForIndex:11]);
    unsigned int v5 = [v4 unsignedIntValue];

    BOOL v6 = v5 == 1;
    -[TTSSpeechSynthesizer pauseSpeakingAtNextBoundary:error:]( self->_synthesizer,  "pauseSpeakingAtNextBoundary:error:",  v6,  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    [v7 pauseSpeakingAtNextBoundary:v6 error:0];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v8 disableAudioSession:@"SPEECH"];

    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_stopSpeakingAfterLongPauseTimer, "dispatchAfterDelay:", 90.0);
  }
}

- (void)_handleContinueSpeaking:(id)a3
{
  if (self->_isPaused)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager", a3));
    [v4 enableAudioSession:@"SPEECH"];
  }

  -[TTSSpeechSynthesizer continueSpeakingWithError:](self->_synthesizer, "continueSpeakingWithError:", 0LL);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  [v5 continueSpeakingWithError:0];

  self->_isPaused = 0;
  -[SCRCTargetSelectorTimer cancel](self->_stopSpeakingAfterLongPauseTimer, "cancel");
}

- (void)_handleStopSpeaking:(id)a3
{
  id v4 = a3;
  id AssociatedObject = objc_getAssociatedObject(self->_currentRequest, &unk_1001ACCE8);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:14]);
  BOOL v8 = -[VOTOutputSpeechComponent isSpeaking](self, "isSpeaking");
  if (!v8 && !self->_currentRequest)
  {
LABEL_5:
    uint64_t v14 = VOTLogSpeech(v8, v9, v10);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v26 = 138543362;
      id v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "told to stop, but not stopping because last action was not stoppable: %{public}@",  (uint8_t *)&v26,  0xCu);
    }

    goto LABEL_12;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForVariant:23]);
  if ([v11 BOOLValue])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:24]);
    unsigned int v13 = [v12 BOOLValue];

    if (!v13) {
      goto LABEL_5;
    }
  }

  else
  {
  }

  self->_userStopped = 1;
  self->_isPaused = 0;
  -[SCRCTargetSelectorTimer cancel](self->_stopSpeakingAfterLongPauseTimer, "cancel");
  self->_lastTimeSpeechStarted = -3061152000.0;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:11]);
  unsigned int v17 = [v16 unsignedIntValue];

  uint64_t v21 = VOTLogSpeech(v18, v19, v20);
  objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "EndSpeaking",  "",  (uint8_t *)&v26,  2u);
  }

  BOOL v23 = v17 == 1;
  -[TTSSpeechSynthesizer stopSpeakingAtNextBoundary:error:]( self->_synthesizer,  "stopSpeakingAtNextBoundary:error:",  v23,  0LL);
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  [v24 stopSpeakingAtNextBoundary:v23 error:0];

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:84]);
  if (v15)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    -[os_log_s doubleValue](v15, "doubleValue");
    objc_msgSend(v25, "disableAudioSession:userDelay:", @"SPEECH");
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTOutputSpeechComponent;
  -[VOTOutputSpeechComponent dealloc](&v3, "dealloc");
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:1]);
  unsigned int v5 = [v4 unsignedIntValue];

  switch(v5)
  {
    case 6u:
      -[VOTOutputSpeechComponent _handlePerformAction:](self, "_handlePerformAction:", v6);
      break;
    case 7u:
      -[VOTOutputSpeechComponent _handleStopSpeaking:](self, "_handleStopSpeaking:", v6);
      break;
    case 8u:
      -[VOTOutputSpeechComponent _handlePauseSpeaking:](self, "_handlePauseSpeaking:", v6);
      break;
    case 9u:
      -[VOTOutputSpeechComponent _handleContinueSpeaking:](self, "_handleContinueSpeaking:", v6);
      break;
    default:
      break;
  }
}

- (void)_speakAllDigits:(id)a3
{
  id v9 = a3;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  if ([v9 length])
  {
    uint64_t v4 = 0LL;
    do
    {
      id v5 = [v9 characterAtIndex:v4];
      if ([v3 characterIsMember:v5])
      {
        if (v4 >= 1 && [v9 characterAtIndex:v4 - 1] == 32)
        {
          id v6 = @"%C ";
          uint64_t v7 = 1LL;
        }

        else
        {
          id v6 = @" %C ";
          uint64_t v7 = 2LL;
        }

        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v5));
        objc_msgSend(v9, "replaceCharactersInRange:withString:", v4, 1, v8);
        v4 += v7;
      }

      ++v4;
    }

    while (v4 < (unint64_t)[v9 length]);
  }
}

- (void)_replaceEmbeddedTTSCommands:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"[[",  @"[ [",  0,  0,  objc_msgSend(v3, "length"));
  objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"]]",  @"] ]",  0,  0,  objc_msgSend(v3, "length"));
}

- (id)_secureTextDescription:(id)a3
{
  id v3 = [a3 length];
  id v4 = sub_10004A988(off_1001AC148, @"secure.character.count", &stru_10017A920);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v5, v3));

  return v6;
}

- (id)_localeSpecificURLsForLanguageCode:(id)a3
{
  else {
    return 0LL;
  }
}

- (id)_localeSpecificURLRegexForLanguageCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (([0 isEqualToString:v4] & 1) == 0)
    {
      id v5 = (void *)qword_1001ACCF0;
      qword_1001ACCF0 = 0LL;
    }

    id v6 = (void *)qword_1001ACCF0;
    if (!qword_1001ACCF0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _localeSpecificURLsForLanguageCode:]( self,  "_localeSpecificURLsForLanguageCode:",  v4));
      uint64_t v8 = (uint64_t)[v7 count];
      uint64_t v9 = v8 - 1;
      if (v8 >= 1)
      {
        uint64_t v10 = v8;
        int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"("));
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (v9 == i)
          {
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v9]);
            [v11 appendString:v13];
          }

          else
          {
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
            [v11 appendFormat:@"%@|", v13];
          }
        }

        [v11 appendString:@""]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [@"(http:\\/\\/|www\\.)?(\\S*)\\.(com|net|org|edu|gov|mil|uk|fi)(\\/\\S*)?\\b" stringByReplacingOccurrencesOfString:@"(com|net|org|edu|gov|mil|uk)" withString:v11]);
        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v14,  0LL,  0LL));
        unsigned int v16 = (void *)qword_1001ACCF0;
        qword_1001ACCF0 = v15;
      }

      id v6 = (void *)qword_1001ACCF0;
    }

    id v17 = v6;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (BOOL)_stringMatchesSpecialCases:(id)a3 forSymbol:(id)a4 ranges:(id *)a5 langaugeCode:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v11) {
    id v11 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  }
  if ([v10 isEqualToString:@"."])
  {
    id v39 = v11;
    uint64_t v40 = a5;
    id v41 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v15 = VOTLogSpeech(v12, v13, v14);
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000F0370();
    }

    id v17 = (void *)qword_1001ACCF8;
    if (!qword_1001ACCF8)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,5})\\b",  0LL,  0LL));
      uint64_t v19 = (void *)qword_1001ACCF8;
      qword_1001ACCF8 = v18;

      id v17 = (void *)qword_1001ACCF8;
    }

    id v42 = v9;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")));
    id v45 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v47;
      do
      {
        for (uint64_t i = 0LL; i != v45; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          id v22 = [v21 range];
          NSUInteger v24 = v23;
          uint64_t v25 = (uint64_t)[v12 count];
          if (v25 < 1)
          {
LABEL_17:
            id v32 = [v21 range];
            id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v32, v33));
            [v12 addObject:v28];
          }

          else
          {
            uint64_t v26 = v25;
            uint64_t v27 = 0LL;
            while (1)
            {
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v27]);
              id v29 = [v28 rangeValue];
              NSUInteger v31 = v30;
              v51.id location = (NSUInteger)v22;
              v51.length = v24;
              v53.id location = (NSUInteger)v29;
              v53.length = v31;
              if (NSIntersectionRange(v51, v53).length) {
                break;
              }

              if (v26 == ++v27) {
                goto LABEL_17;
              }
            }

            v52.id location = (NSUInteger)v22;
            v52.length = v24;
            v54.id location = (NSUInteger)v29;
            v54.length = v31;
            NSRange v34 = NSUnionRange(v52, v54);
            unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithRange:]( &OBJC_CLASS___NSValue,  "valueWithRange:",  v34.location,  v34.length));
            [v12 replaceObjectAtIndex:v27 withObject:v35];
          }
        }

        id v45 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }

      while (v45);
    }

    [v12 sortUsingSelector:"compare:"];
    id v36 = v12;
    *uint64_t v40 = v36;
    BOOL v37 = [v36 count] != 0;

    id v10 = v41;
    id v9 = v42;
    id v11 = v39;
  }

  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (id)expectedVoiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(3LL, @"Looking voice identifier for %{public}@");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v86 = v4;
      uint64_t v13 = _AXStringForArgs(v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v89 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  id v15 = v4;
  unsigned int v16 = v15;
  if (!v15)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    if (!v16) {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance", v86));
  unsigned __int8 v18 = [v17 ignoreLogging];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v20 = AXLoggerForFacility();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

    os_log_type_t v22 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = AXColorizeFormatLog(3LL, @"Updated identifier %{public}@");
      NSUInteger v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v87 = v16;
      uint64_t v25 = _AXStringForArgs(v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138543362;
        v89 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}@", buf, 0xCu);
      }
    }
  }

  buf[0] = 0;
  uint64_t v27 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)VOTSharedWorkspace, "selectedLanguage", v87));
  if (v27)
  {
    id v28 = (void *)v27;
    id v29 = 0LL;
LABEL_20:

    goto LABEL_21;
  }

  NSUInteger v30 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  uint64_t v31 = AXLanguageCanonicalFormToGeneralLanguage(v30);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  uint64_t v33 = AXLanguageCanonicalFormToGeneralLanguage(v16);
  NSRange v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  unsigned int v35 = [v32 isEqualToString:v34];

  if (v35)
  {
    uint64_t v39 = AXLanguageCanonicalFormToGeneralLanguage(v16);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v29 = (id)objc_claimAutoreleasedReturnValue( [v40 speechVoiceIdentifierForLanguage:v28 sourceKey:AXSpeechSourceKeyVoiceOver exists:buf]);

    goto LABEL_20;
  }

  id v29 = 0LL;
LABEL_21:
  uint64_t v41 = VOTLogSpeech(v36, v37, v38);
  id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    sub_1000F05BC();
  }

  if (buf[0])
  {
    __int128 v46 = 0LL;
  }

  else
  {
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( [v47 speechVoiceIdentifierForLanguage:v16 sourceKey:AXSpeechSourceKeyVoiceOver exists:buf]);

    if (v46)
    {
      id v48 = v46;

      id v29 = v48;
    }
  }

  uint64_t v49 = VOTLogSpeech(v43, v44, v45);
  uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_1000F055C();
  }

  if (!buf[0])
  {
    NSRange v54 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v55 = AXLanguageCanonicalFormToGeneralLanguage(v15);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue( [v54 speechVoiceIdentifierForLanguage:v56 sourceKey:AXSpeechSourceKeyVoiceOver exists:buf]);

    if (v57)
    {
      id v58 = v57;

      id v29 = v58;
    }
  }

  uint64_t v59 = VOTLogSpeech(v51, v52, v53);
  __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_1000F04FC();
  }

  if (!buf[0])
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v65 = AXLanguageConvertToCanonicalForm(v15);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    __int16 v67 = (void *)objc_claimAutoreleasedReturnValue( [v64 speechVoiceIdentifierForLanguage:v66 sourceKey:AXSpeechSourceKeyVoiceOver exists:buf]);

    if (v67)
    {
      id v68 = v67;

      id v29 = v68;
    }
  }

  uint64_t v69 = VOTLogSpeech(v61, v62, v63);
  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    sub_1000F049C();
  }

  if (buf[0]) {
    BOOL v71 = 1;
  }
  else {
    BOOL v71 = v46 == 0LL;
  }
  if (v71) {
    v72 = v29;
  }
  else {
    v72 = v46;
  }
  id v73 = v72;
  uint64_t v76 = VOTLogSpeech(v73, v74, v75);
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
    sub_1000F043C();
  }

  if (v29)
  {
    v78 = v73;
  }

  else
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue( -[TTSSpeechSynthesizer resolvedVoiceIdentifierForLanguageCode:]( self->_synthesizer,  "resolvedVoiceIdentifierForLanguageCode:",  v16));

    uint64_t v82 = VOTLogSpeech(v79, v80, v81);
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      sub_1000F03D0();
    }
  }

  id v84 = v78;

  return v84;
}

- (float)_pauseDelayForType:(int)a3 speechRate:(float)a4 voiceType:(int64_t)a5
{
  float v5 = a4;
  a4 = 0.0;
  sub_100049D68(*(double *)&a4, v5);
  return result;
}

- (int64_t)_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:(id)a3
{
  id v3 = a3;
  if ((+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:]( &OBJC_CLASS___TTSAlternativeVoices,  "isNeuralSiriVoiceIdentifier:",  v3) & 1) != 0)
  {
    int64_t v4 = 5LL;
  }

  else if ((+[TTSAlternativeVoices isSiriVoiceIdentifier:]( &OBJC_CLASS___TTSAlternativeVoices,  "isSiriVoiceIdentifier:",  v3) & 1) != 0)
  {
    int64_t v4 = 4LL;
  }

  else if (+[TTSAlternativeVoices isOldSiriVoiceIdentifier:]( &OBJC_CLASS___TTSAlternativeVoices,  "isOldSiriVoiceIdentifier:",  v3))
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 1LL;
  }

  return v4;
}

- (id)pauseStringForType:(int)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  int64_t v9 = -[VOTOutputSpeechComponent _ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:]( self,  "_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:",  v8);
  *(float *)&double v10 = a5;
  -[VOTOutputSpeechComponent _pauseDelayForType:speechRate:voiceType:]( self,  "_pauseDelayForType:speechRate:voiceType:",  v6,  v9,  v10);
  float v12 = v11;
  else {
    unsigned int v13 = [v8 isEqualToString:AVSpeechSynthesisVoiceIdentifierAlex] ^ 1;
  }
  if (((_DWORD)v6 != 2 || v13)
    && ((v6 & 0xFFFFFFFE) != 2
     || ([v8 containsString:@"com.apple.ttsbundle.Carmit"] & 1) == 0))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer speechMarkupStringForType:forIdentifier:string:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "speechMarkupStringForType:forIdentifier:string:",  0LL,  v8,  0LL));
    os_log_type_t v22 = v15;
    if ((_DWORD)v6 == 8)
    {
      uint64_t v23 = v15;
    }

    else
    {
      if (!v15)
      {
        uint64_t v14 = &stru_10017A920;
        goto LABEL_15;
      }

      NSUInteger v24 = sub_1000281B4(v15, @"%d", v16, v17, v18, v19, v20, v21, (int)v12);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
    }

    uint64_t v14 = v23;
LABEL_15:

    goto LABEL_16;
  }

  uint64_t v14 = &stru_10017A920;
LABEL_16:

  return v14;
}

- (void)_insertLongerPausesForSymbol:(id)a3 withText:(id)a4 allowPausingAtBoundaries:(BOOL)a5 onlyApplyWhenFollowedBySpace:(BOOL)a6 languageCode:(id)a7 voiceIdentifier:(id)a8 rate:(float)a9
{
  BOOL v12 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v99 = a8;
  id v18 = [v16 length];
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v19 = (uint64_t)v18;
  id v96 = v17;
  unsigned int v20 = [v15 characterAtIndex:0];
  if (v19 < 1) {
    goto LABEL_6;
  }
  unsigned int v21 = v20;
  unint64_t v22 = 0LL;
  while ([v16 characterAtIndex:v22] == v21)
  {
    if (v19 == ++v22) {
      goto LABEL_6;
    }
  }

  id v17 = v96;
  if (v19 == v22) {
    goto LABEL_7;
  }
  if (v22 >= 2)
  {
    objc_msgSend(v16, "replaceCharactersInRange:withString:", 0, v22, &stru_10017A920);
    uint64_t v19 = (uint64_t)[v16 length];
  }

  if (v19 < 2) {
    goto LABEL_7;
  }
  id v124 = 0LL;
  unsigned int v23 = -[VOTOutputSpeechComponent _stringMatchesSpecialCases:forSymbol:ranges:langaugeCode:]( self,  "_stringMatchesSpecialCases:forSymbol:ranges:langaugeCode:",  v16,  v15,  &v124,  v96);
  id v24 = v124;
  uint64_t v25 = v24;
  if (v23)
  {
    if (!v24)
    {
LABEL_6:
      id v17 = v96;
      goto LABEL_7;
    }
  }

  BOOL v107 = v12;
  BOOL v111 = a5;
  if ([v24 count])
  {
    id v114 = v16;
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    id v26 = v25;
    id v27 = [v26 countByEnumeratingWithState:&v120 objects:v134 count:16];
    if (v27)
    {
      id v28 = v27;
      id v29 = 0LL;
      uint64_t v30 = *(void *)v121;
      do
      {
        for (uint64_t i = 0LL; i != v28; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v121 != v30) {
            objc_enumerationMutation(v26);
          }
          id v32 = (char *)[*(id *)(*((void *)&v120 + 1) + 8 * (void)i) rangeValue];
          uint64_t v34 = v33;
          if (v32 - v29 >= 1)
          {
            unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v29));
            [v101 addObject:v35];
          }

          id v29 = &v32[v34];
        }

        id v28 = [v26 countByEnumeratingWithState:&v120 objects:v134 count:16];
      }

      while (v28);
    }

    else
    {
      id v29 = 0LL;
    }

    if (v19 <= (uint64_t)v29)
    {
      id v16 = v114;
      BOOL v36 = v107;
      a5 = v111;
      goto LABEL_31;
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v29, v19 - (void)v29));
    [v101 addObject:v25];
    id v16 = v114;
    a5 = v111;
  }

  else
  {
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", 0LL, v19));
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v26));
  }

  BOOL v36 = v107;
LABEL_31:

  if (!qword_1001ACD00)
  {
    id v37 = [objc_allocWithZone(NSMutableCharacterSet) init];
    uint64_t v38 = (void *)qword_1001ACD00;
    qword_1001ACD00 = (uint64_t)v37;

    uint64_t v39 = (void *)qword_1001ACD00;
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](&OBJC_CLASS___NSCharacterSet, "symbolCharacterSet"));
    [v39 formUnionWithCharacterSet:v40];

    uint64_t v41 = (void *)qword_1001ACD00;
    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
    [v41 formUnionWithCharacterSet:v42];
  }

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet uppercaseLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "uppercaseLetterCharacterSet"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v44 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if ([v101 count])
  {
    v103 = v43;
    if ((sub_10004AB38(v15) & 1) != 0)
    {
      uint64_t v45 = 2LL;
    }

    else if (([v15 isEqualToString:@"."] & 1) != 0 {
           || [v15 isEqualToString:@"?"])
    }
    {
      uint64_t v45 = 3LL;
    }

    else
    {
      uint64_t v45 = 6LL;
    }

    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[AXIndexMap objectForIndex:](self->_currentActionVariants, "objectForIndex:", 63LL));
    unsigned int v48 = [v47 BOOLValue];

    if (v48)
    {
      else {
        uint64_t v45 = 3LL;
      }
    }

    uint64_t v49 = (uint64_t)v96;
    if (v96
      || (uint64_t v49 = objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage])) != 0)
    {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
      v97 = (void *)v49;
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 dialectForLanguageID:v49]);
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 langMap]);
      unsigned int v113 = [v53 isRTL] ^ 1;
    }

    else
    {
      v97 = 0LL;
      unsigned int v113 = 1;
    }

    *(float *)&double v50 = a9;
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  v45,  v99,  v50));
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    id obj = v101;
    id v106 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
    unint64_t v54 = 0LL;
    if (v106)
    {
      uint64_t v104 = *(void *)v117;
      v115 = v46;
      id v102 = v15;
      v105 = v44;
      do
      {
        uint64_t v55 = 0LL;
        do
        {
          if (*(void *)v117 != v104) {
            objc_enumerationMutation(obj);
          }
          uint64_t v110 = v55;
          v56 = (char *)[*(id *)(*((void *)&v116 + 1) + 8 * v55) rangeValue];
          unint64_t v112 = v57;
          if (v56 != (char *)v54)
          {
            [v44 appendFormat:@"%@ ", v46];
            id v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v54, &v56[-v54]));
            [v44 appendString:v58];

            [v44 appendFormat:@" %@", v46];
          }

          v109 = v56;
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v56, v112));
          id v60 = [v59 mutableCopyWithZone:0];

          if (v112 <= (unint64_t)[v60 length])
          {
            unint64_t v61 = 0LL;
            uint64_t v62 = (char *)v112;
            while (1)
            {
              id v63 = v46;
              v64 = (char *)objc_msgSend(v60, "rangeOfString:options:range:", v15, 2, v61, v62);
              uint64_t v66 = v65;
              uint64_t v68 = VOTLogSpeech(v64, v65, v67);
              uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138478595;
                unint64_t v126 = (unint64_t)v15;
                __int16 v127 = 2113;
                v128 = (char *)v60;
                __int16 v129 = 2048;
                v130 = v64;
                __int16 v131 = 2048;
                uint64_t v132 = v66;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  "range of %{private}@ in %{private}@ is %lu %lu",  buf,  0x2Au);
              }

              if (v64 == (char *)0x7FFFFFFFFFFFFFFFLL)
              {

                goto LABEL_96;
              }

              if (!a5 && !v64) {
                break;
              }
              if (!a5)
              {
                unint64_t v70 = (unint64_t)[v16 length];
              }

              if (!v64)
              {
                int v74 = 1;
                goto LABEL_68;
              }

              id v76 = v16;
              id v77 = [v60 characterAtIndex:v64 - 1];
              unsigned int v78 = [(id)qword_1001ACD00 characterIsMember:v77];
              char v79 = v78;
              int v74 = v78 ^ 1;
              unint64_t v70 = (unint64_t)[v60 length];
              if ((unint64_t)(v64 + 1) >= v70)
              {
                id v16 = v76;
                BOOL v36 = v107;
                a5 = v111;
                goto LABEL_68;
              }

              id v80 = [v60 characterAtIndex:v64 + 1];
              unint64_t v70 = (unint64_t)[v103 characterIsMember:v77];
              if (!(_DWORD)v70)
              {
                id v16 = v76;
                BOOL v36 = v107;
                a5 = v111;
                id v15 = v102;
                goto LABEL_68;
              }

              unint64_t v70 = (unint64_t)[v103 characterIsMember:v80];
              id v16 = v76;
              BOOL v36 = v107;
              a5 = v111;
              id v15 = v102;
              if (!(_DWORD)v70) {
                goto LABEL_68;
              }
              *(float *)&double v81 = a9;
              uint64_t v82 = objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  7LL,  v99,  v81));

              id v63 = (id)v82;
              a5 = v111;
              if ((v79 & 1) == 0)
              {
LABEL_73:
                if (v113) {
                  uint64_t v75 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v15,  v63,  v95);
                }
                else {
                  uint64_t v75 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%C%@%@",  8207LL,  v15,  v63);
                }
                uint64_t v83 = objc_claimAutoreleasedReturnValue(v75);

                unint64_t v70 = (unint64_t)objc_msgSend( v60,  "replaceOccurrencesOfString:withString:options:range:",  v15,  v83,  0,  v64,  v66);
                id v63 = (id)v83;
              }

+ (void)_setOverrideLocale:(id)a3
{
}

- (BOOL)_currentLocaleUsesSpaceAsSeparator
{
  if (qword_1001AD158)
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setLocale:](v2, "setLocale:", qword_1001AD158);
    -[NSNumberFormatter setNumberStyle:](v2, "setNumberStyle:", 1LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v2, "stringFromNumber:", &off_100187400));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  &off_100187400,  1LL));
  }

  BOOL v4 = [v3 rangeOfString:@" "] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)_applyCamelCaseSeparation:(id)a3
{
  id v3 = a3;
  if (qword_1001ACD10 != -1) {
    dispatch_once(&qword_1001ACD10, &stru_100177340);
  }
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100029C14;
  uint64_t v30 = sub_100029C24;
  id v31 = 0LL;
  uint64_t v22 = 0LL;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  BOOL v4 = (void *)qword_1001ACD08;
  id v5 = [v3 length];
  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_10002DECC;
  id v15 = &unk_100177368;
  id v17 = &v26;
  id v6 = v3;
  id v16 = v6;
  id v18 = &v22;
  uint64_t v19 = v20;
  objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v5, &v12);
  if (v27[5])
  {
    unint64_t v7 = v23[3];
    if (v7 < (unint64_t)objc_msgSend(v6, "length", v12, v13, v14, v15))
    {
      id v8 = (void *)v27[5];
      uint64_t v9 = v23[3];
      double v10 = (char *)[v6 length];
      float v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v9, &v10[-v23[3]]));
      [v8 appendString:v11];
    }

    [v6 setString:v27[5]];
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

- (void)_applyTelephoneFormatting:(id)a3 withRanges:(id)a4 languageCode:(id)a5 voiceIdentifier:(id)a6 rate:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v41 = a5;
  id v14 = a6;
  if (!qword_1001ACD18)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"[0-9]{1,3}([  ][0-9]{3})+\\s*$",  0LL,  0LL));
    id v16 = (void *)qword_1001ACD18;
    qword_1001ACD18 = v15;
  }

  uint64_t v40 = (char *)[v12 length];
  id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  *(float *)&double v17 = a7;
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v14,  v17));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v13;
  id v48 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v48)
  {
    __int128 v47 = 0LL;
    uint64_t v18 = *(void *)v51;
    uint64_t v43 = *(void *)v51;
    do
    {
      for (uint64_t i = 0LL; i != v48; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(obj);
        }
        unsigned int v20 = (char *)[*(id *)(*((void *)&v50 + 1) + 8 * (void)i) rangeValue];
        uint64_t v22 = v21;
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v20, v21));
        id v24 = [v23 rangeOfString:@"\n"];

        if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v20, v22));
          if (!-[VOTOutputSpeechComponent _currentLocaleUsesSpaceAsSeparator]( self,  "_currentLocaleUsesSpaceAsSeparator")
            || (id v27 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD18,  "matchesInString:options:range:",  v25,  0,  0,  objc_msgSend(v25, "length"))),  v28 = objc_msgSend(v27, "count"),  v27,  !v28))
          {
            __int128 v46 = v25;
            if (v20 != v47)
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v47, v20 - v47));
              [v44 appendString:v29];
            }

            id v30 = v14;
            *(float *)&double v26 = a7;
            id v31 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v14,  v26));
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v31));

            __int128 v47 = &v20[v22];
            if ((uint64_t)v20 < (uint64_t)&v20[v22])
            {
              do
              {
                id v33 = [v12 characterAtIndex:v20];
                if ([v42 characterIsMember:v33])
                {
                  *(float *)&double v34 = a7;
                  unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  4LL,  v30,  v34));
                  [v32 appendFormat:@"%C%@ ", v33, v35];
                }

                else if (((unsigned __int16)v33 & 0xFFFE) != 0x28)
                {
                  if ((_DWORD)v33 == 32 || (_DWORD)v33 == 45)
                  {
                    [v32 appendString:v49];
                  }

                  else
                  {
                    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent currentAllPunctuationTable]( self,  "currentAllPunctuationTable"));
                    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForIndex:v33]);

                    if (v37)
                    {
                      [v32 appendFormat:@"%@ %@ ", v37, v49];
                    }

                    else
                    {
                      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v20, 1));
                      [v32 appendFormat:@"%@", v38];
                    }
                  }
                }

                ++v20;
                --v22;
              }

              while (v22);
            }

            [v32 appendString:v49];
            [v44 appendString:v32];

            id v14 = v30;
            uint64_t v25 = v46;
          }

          uint64_t v18 = v43;
        }
      }

      id v48 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }

    while (v48);
  }

  else
  {
    __int128 v47 = 0LL;
  }

  if ((uint64_t)v47 < (uint64_t)v40)
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:"));
    [v44 appendString:v39];
  }

  [v12 setString:v44];
}

- (void)_formatTelephoneNumber:(id)a3 languageCode:(id)a4 voiceIdentifier:(id)a5 rate:(float)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)qword_1001ACD20;
  if (!qword_1001ACD20)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"([+0-9]{6,15}|(((\\s?|\\b)([0-9]{2,3}\\s)?(\\(?[0-9]{3}\\)?)?(\\s|-))|\\s)?([0-9]{2,7})(-|\\s)([0-9]{3,7}))(\\s|\\b)",  0LL,  0LL));
    id v14 = (void *)qword_1001ACD20;
    qword_1001ACD20 = v13;

    id v12 = (void *)qword_1001ACD20;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")));
  if ([v15 count])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 axMapObjectsUsingBlock:&stru_1001773A8]);
    *(float *)&double v17 = a6;
    -[VOTOutputSpeechComponent _applyTelephoneFormatting:withRanges:languageCode:voiceIdentifier:rate:]( self,  "_applyTelephoneFormatting:withRanges:languageCode:voiceIdentifier:rate:",  v18,  v16,  v10,  v11,  v17);
  }
}

- (BOOL)_formatDetectedFinnishDates:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)qword_1001ACD28;
  if (!qword_1001ACD28)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(?<!\\.)\\b([0-9]{1,2})[\\.]([0-9]{1,2})[\\.](?:((?:[0-9]{2})|(?:[0-9]{4}))\\b)(?!\\.?[0-9])",  0LL,  0LL));
    id v6 = (void *)qword_1001ACD28;
    qword_1001ACD28 = v5;

    BOOL v4 = (void *)qword_1001ACD28;
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  if ([v7 count])
  {
    id v41 = v3;
    id v8 = [v3 copy];
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v37 = v7;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v43 = 0LL;
      uint64_t v12 = *(void *)v45;
      id v39 = v9;
      id v40 = v8;
      uint64_t v38 = *(void *)v45;
      do
      {
        uint64_t v13 = 0LL;
        id v42 = v11;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v13);
          if ([v14 numberOfRanges] == (id)4)
          {
            id v15 = [v14 rangeAtIndex:1];
            double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v15, v16));
            id v18 = [v14 rangeAtIndex:2];
            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v18, v19));
            if ((uint64_t)[v20 integerValue] <= 12 && (uint64_t)objc_msgSend(v17, "integerValue") <= 31)
            {
              [v14 rangeAtIndex:3];
              if (v21)
              {
                id v22 = [v14 rangeAtIndex:3];
                id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v22, v23));
              }

              else
              {
                id v24 = 0LL;
              }

              uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
              -[NSDateComponents setMonth:](v25, "setMonth:", (int)[v20 intValue]);
              -[NSDateComponents setDay:](v25, "setDay:", (int)[v17 intValue]);
              if ([v24 length]) {
                -[NSDateComponents setYear:](v25, "setYear:", (int)[v24 intValue]);
              }
              double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dateFromComponents:v25]);

              if ([v24 length]) {
                id v28 = @"MMMMddyyyy";
              }
              else {
                id v28 = @"MMMMdd";
              }
              uint64_t v29 = AXDateStringForFormat(v27, v28);
              id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              id v31 = &v43[(void)[v14 range]];
              [v14 range];
              objc_msgSend(v41, "replaceCharactersInRange:withString:", v31, v32, v30);
              id v33 = (char *)[v30 length];
              [v14 range];
              uint64_t v43 = &v43[(void)v33 - v34];

              id v9 = v39;
              id v8 = v40;
              uint64_t v12 = v38;
              id v11 = v42;
            }
          }

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }

      while (v11);
    }

    BOOL v35 = [v9 count] != 0;
    id v3 = v41;
    unint64_t v7 = v37;
  }

  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (void)_formatDetectedDates:(id)a3 voiceIdentifier:(id)a4 languageCode:(id)a5 rate:(float)a6
{
  id v9 = a3;
  id v62 = a4;
  id v10 = a5;
  if (!qword_1001ACD30)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b([0-9]{1,4}(/|-|\\.)[0-9]{1,2}((/|-|\\.)[0-9]{2,4})?)\\b",  0LL,  0LL));
    uint64_t v12 = (void *)qword_1001ACD30;
    qword_1001ACD30 = v11;

    if (!qword_1001ACD30)
    {
      uint64_t v16 = VOTLogSpeech(v13, v14, v15);
      double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000F06DC(v17);
      }
    }
  }

  if (![v10 hasPrefix:@"fi"]
    || !-[VOTOutputSpeechComponent _formatDetectedFinnishDates:](self, "_formatDetectedFinnishDates:", v9))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD30,  "matchesInString:options:range:",  v9,  0,  0,  objc_msgSend(v9, "length")));
    if ([v18 count])
    {
      id v59 = v10;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      id v57 = [v9 length];
      id v58 = v18;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id obj = v18;
      id v20 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v20)
      {
        id v21 = v20;
        unint64_t v22 = 0LL;
        uint64_t v23 = *(void *)v66;
        id v60 = v9;
        do
        {
          id v24 = 0LL;
          id v63 = v21;
          do
          {
            if (*(void *)v66 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = (char *)[*(id *)(*((void *)&v65 + 1) + 8 * (void)v24) range];
            uint64_t v27 = v26;
            id v28 = &v25[-v22];
            if (v25 != (char *)v22)
            {
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", v22, v28));
              [v19 appendString:v29];
            }

            int v30 = 0;
            if (v25)
            {
              for (uint64_t i = 0LL; i != v25; ++i)
              {
                unsigned int v32 = objc_msgSend(v9, "characterAtIndex:", i, v28);
                unsigned int v33 = v32 - 162;
                if (v32 == 36) {
                  int v34 = 1;
                }
                else {
                  int v34 = v30;
                }
                if (v33 > 3 || v33 == 2) {
                  int v30 = v34;
                }
                else {
                  int v30 = 1;
                }
                if (v33 <= 3 && v32 != 164) {
                  break;
                }
                if (v32 == 36) {
                  break;
                }
              }
            }

            unint64_t v22 = (unint64_t)&v25[v27];
            BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", v25, v27));
            else {
              int v37 = v30;
            }
            if (((v37 | v39) & 1) == 0)
            {
              *(float *)&double v38 = a6;
              id v40 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v62,  v38));
              id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ ",  v40));

              id v42 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByReplacingOccurrencesOfString:@"-" withString:v41]);
              uint64_t v43 = v19;
              uint64_t v44 = v23;
              __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v42 stringByReplacingOccurrencesOfString:@"/" withString:v41]);

              __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
              id v47 = sub_10004B314(46LL, @"UnicodeHex.Alternate1.", @"VOTOutputPunctuation", v46);
              uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);

              if (v48) {
                uint64_t v49 = (__CFString *)v48;
              }
              else {
                uint64_t v49 = @".";
              }
              __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ ",  v49));
              BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v45 stringByReplacingOccurrencesOfString:@"." withString:v50]);

              uint64_t v23 = v44;
              uint64_t v19 = v43;
              id v9 = v60;
              id v21 = v63;
            }

            [v19 appendString:v36];

            id v24 = (char *)v24 + 1;
          }

          while (v24 != v21);
          id v21 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
        }

        while (v21);
      }

      else
      {
        unint64_t v22 = 0LL;
      }

      if ((uint64_t)v22 < (uint64_t)v57)
      {
        unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v9 substringFromIndex:v22]);
        [v19 appendString:v54];
      }

      uint64_t v55 = VOTLogSpeech(v51, v52, v53);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      id v18 = v58;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        sub_1000F067C();
      }

      [v9 setString:v19];
      id v10 = v59;
    }
  }
}

- (void)_formatJapaneseYen:(id)a3
{
  id v3 = a3;
  if (qword_1001ACD40 != -1) {
    dispatch_once(&qword_1001ACD40, &stru_1001773C8);
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD38,  "matchesInString:options:range:",  v3,  0,  0,  objc_msgSend(v3, "length")));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)i) range];
        objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"JP",  &stru_10017A920,  0,  v9,  v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)_applyTransliteration:(id)a3 languageCode:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dialectForLanguageID:v5]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dialectForLanguageID:v9]);
  }

  if ([v8 speakingRequiresTransliteration])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 transliteratedStringForString:v11]);
    objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, objc_msgSend(v11, "length"), v10);
  }
}

- (void)_formatEthernetMacAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  id v36 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\b",  1LL,  &v36));
  id v11 = v36;
  if (v10)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")));
    if ([v13 count])
    {
      id v31 = v10;
      BOOL v35 = v8;
      uint64_t v29 = v13;
      int v34 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
      id v14 = [v34 numberOfRanges];
      *(float *)&double v15 = a5;
      id v32 = v9;
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v9,  v15));
      *(float *)&double v16 = a5;
      double v17 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  4LL,  v9,  v16));
      unint64_t v18 = v14 != (id)6;
      id v30 = v11;
      if ((unint64_t)v14 <= v18)
      {
        NSUInteger location = 0LL;
        NSUInteger length = 0LL;
      }

      else
      {
        NSUInteger v19 = 0LL;
        NSUInteger v20 = 0LL;
        do
        {
          id v21 = [v34 rangeAtIndex:v18];
          NSUInteger v23 = v22;
          NSUInteger location = (NSUInteger)v21;
          NSUInteger length = v22;
          if (v20)
          {
            v37.NSUInteger location = v19;
            v37.NSUInteger length = v20;
            v38.NSUInteger location = (NSUInteger)v21;
            v38.NSUInteger length = v23;
            NSRange v26 = NSUnionRange(v37, v38);
            NSUInteger location = v26.location;
            NSUInteger length = v26.length;
          }

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringWithRange:", v21, v23));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uppercaseString]);

          [v12 appendFormat:@"%C%@%C%@", objc_msgSend(v28, "characterAtIndex:", 0), v17, objc_msgSend(v28, "characterAtIndex:", 1), v33];
          ++v18;
          NSUInteger v19 = location;
          NSUInteger v20 = length;
        }

        while (v14 != (id)v18);
      }

      id v8 = v35;
      uint64_t v10 = v31;
      if ([v12 length]) {
        objc_msgSend(v35, "replaceCharactersInRange:withString:", location, length, v12);
      }

      id v9 = v32;
      __int128 v13 = v29;
      id v11 = v30;
    }
  }

  else
  {
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not make regex from pattern: %@. error: %@",  @"\\b(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\s?:\\s?(\\S\\S)\\b");
  }
}

- (void)_formatNumbers:(id)a3 action:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a4));
  id v8 = [(id)VOTSharedWorkspace numberFeedback];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 numberFeedback]);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 numberFeedback]);
    id v8 = [v10 integerValue];
  }

  if (v8 == (id)2)
  {
    NSUInteger v22 = v7;
    if (qword_1001ACD50 != -1) {
      dispatch_once(&qword_1001ACD50, &stru_1001773E8);
    }
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD48,  "matchesInString:options:range:",  v6,  0,  0,  objc_msgSend(v6, "length")));
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          double v16 = (char *)[*(id *)(*((void *)&v26 + 1) + 8 * (void)i) range];
          uint64_t v18 = v17;
          NSUInteger v19 = &v16[v13];
          NSUInteger v20 = objc_opt_new(&OBJC_CLASS___NSMutableString);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_10002F7B8;
          v24[3] = &unk_100177410;
          uint64_t v25 = v20;
          id v21 = v20;
          objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", v19, v18, 2, v24);
          objc_msgSend(v6, "replaceCharactersInRange:withString:", v19, v18, v21);
          v13 += (uint64_t)-[NSMutableString length](v21, "length") - v18;
        }

        id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v12);
    }

    uint64_t v7 = v22;
  }
}

- (void)_formatUSHeight:(id)a3 voiceIdentifier:(id)a4
{
  id v38 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSpeechSynthesisVoice _voiceFromInternalVoiceListWithIdentifier:]( &OBJC_CLASS___AVSpeechSynthesisVoice,  "_voiceFromInternalVoiceListWithIdentifier:",  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 language]);
  unsigned int v7 = [v6 isEqualToString:@"en-US"];

  if (v7)
  {
    id v8 = v38;
    if (qword_1001ACD60 != -1)
    {
      dispatch_once(&qword_1001ACD60, &stru_100177430);
      id v8 = v38;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD58,  "matchesInString:options:range:",  v38,  0,  0,  objc_msgSend(v8, "length")));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    if ([v10 numberOfRanges] == (id)5)
    {
      id v11 = [v10 rangeAtIndex:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "substringWithRange:", v11, v12));
      int v14 = [v13 intValue];

      id v15 = [v10 rangeAtIndex:3];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "substringWithRange:", v15, v16));
      int v18 = [v17 intValue];

      NSUInteger v19 = objc_alloc_init(&OBJC_CLASS___NSMeasurementFormatter);
      -[NSMeasurementFormatter setUnitStyle:](v19, "setUnitStyle:", 3LL);
      -[NSMeasurementFormatter setUnitOptions:](v19, "setUnitOptions:", 1LL);
      NSUInteger v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      NSUInteger v22 = (void *)objc_claimAutoreleasedReturnValue([v20 dialectForLanguageID:v21]);
      NSUInteger v23 = (void *)objc_claimAutoreleasedReturnValue([v22 locale]);
      -[NSMeasurementFormatter setLocale:](v19, "setLocale:", v23);

      id v24 = objc_alloc(&OBJC_CLASS___NSMeasurement);
      double v25 = (double)v14;
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](&OBJC_CLASS___NSUnitLength, "feet"));
      __int128 v27 = -[NSMeasurement initWithDoubleValue:unit:](v24, "initWithDoubleValue:unit:", v26, v25);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter stringFromMeasurement:](v19, "stringFromMeasurement:", v27));
      __int128 v29 = objc_alloc(&OBJC_CLASS___NSMeasurement);
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength inches](&OBJC_CLASS___NSUnitLength, "inches"));
      id v31 = -[NSMeasurement initWithDoubleValue:unit:](v29, "initWithDoubleValue:unit:", v30, (double)v18);
      NSRange v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurementFormatter stringFromMeasurement:](v19, "stringFromMeasurement:", v31));
      uint64_t v32 = __AXStringForVariables(v28);
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

      if (objc_msgSend(v33, "length", v37, @"__AXStringForVariablesSentinel"))
      {
        id v34 = [v10 rangeAtIndex:0];
        id v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "substringWithRange:", v34, v35));
        objc_msgSend( v38,  "replaceOccurrencesOfString:withString:options:range:",  v36,  v33,  0,  0,  objc_msgSend(v38, "length"));
      }
    }
  }
}

- (void)_formatATVStyleMediaDurations:(id)a3
{
  id v3 = a3;
  id v23 = v3;
  if (qword_1001ACD70 != -1)
  {
    dispatch_once(&qword_1001ACD70, &stru_100177450);
    id v3 = v23;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD68,  "matchesInString:options:range:",  v23,  0,  0,  objc_msgSend(v3, "length")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  if ([v5 numberOfRanges] == (id)5)
  {
    double v6 = 0.0;
    if ([v5 rangeAtIndex:2] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [v5 rangeAtIndex:2];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", v7, v8));
      [v9 floatValue];
      double v11 = v10;

      double v6 = v11 * 60.0;
    }

    id v12 = [v5 rangeAtIndex:3];
    int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", v12, v13));
    [v14 floatValue];
    double v16 = v15;

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    id v18 = sub_10004AB8C(0, v17, v16 * 60.0 + v6 * 60.0);
    NSUInteger v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if ([v19 length])
    {
      id v20 = [v5 rangeAtIndex:0];
      NSUInteger v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", v20, v21));
      objc_msgSend( v23,  "replaceOccurrencesOfString:withString:options:range:",  v22,  v19,  0,  0,  objc_msgSend(v23, "length"));
    }
  }
}

- (void)_formatIPAddress:(id)a3 voiceIdentifier:(id)a4 rate:(float)a5
{
  id v7 = a3;
  id v48 = a4;
  uint64_t v8 = (void *)qword_1001ACD78;
  if (!qword_1001ACD78)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3})\\b",  0LL,  0LL));
    float v10 = (void *)qword_1001ACD78;
    qword_1001ACD78 = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b((?:[0-9a-fA-F]{0,4}:){5,7}[0-9A-Fa-f]{0,4})\\b",  0LL,  0LL));
    id v12 = (void *)qword_1001ACD80;
    qword_1001ACD80 = v11;

    uint64_t v8 = (void *)qword_1001ACD78;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")));
  int v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1001ACD80,  "matchesInString:options:range:",  v7,  0,  0,  objc_msgSend(v7, "length")));
  float v15 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObjectsFromArray:v14]);
  if ([v15 count])
  {
    uint64_t v43 = v14;
    uint64_t v44 = v13;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    id v47 = v7;
    id v41 = (char *)[v7 length];
    id v42 = v15;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id obj = v15;
    id v17 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v17)
    {
      id v18 = v17;
      NSUInteger v19 = 0LL;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(obj);
          }
          NSUInteger v22 = (char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)i) range];
          uint64_t v24 = v23;
          if (v22 > v19)
          {
            double v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "substringWithRange:", v19, v22 - v19));
            [v16 appendString:v25];
          }

          NSUInteger v19 = &v22[v24];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "substringWithRange:", v22, v24));
          id v27 = [v26 mutableCopyWithZone:0];

          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
          id v29 = sub_10004B314(46LL, @"UnicodeHex.Alternate1.", @"VOTOutputPunctuation", v28);
          uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);

          if (v30) {
            uint64_t v32 = (__CFString *)v30;
          }
          else {
            uint64_t v32 = @".";
          }
          *(float *)&double v31 = a5;
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v48,  v31));
          id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  v33,  v32,  v33));
          objc_msgSend( v27,  "replaceOccurrencesOfString:withString:options:range:",  @".",  v34,  1,  0,  objc_msgSend(v27, "length"));

          objc_msgSend( v27,  "replaceOccurrencesOfString:withString:options:range:",  @":",  @" : ",  1,  0,  objc_msgSend(v27, "length"));
          [v16 appendString:v27];
        }

        id v18 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }

      while (v18);
    }

    else
    {
      NSUInteger v19 = 0LL;
    }

    id v7 = v47;
    if ((uint64_t)v19 < (uint64_t)v41)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v47 substringFromIndex:v19]);
      [v16 appendString:v38];
    }

    uint64_t v39 = VOTLogSpeech(v35, v36, v37);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    int v14 = v43;
    uint64_t v13 = v44;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000F071C();
    }

    [v47 setString:v16];
    float v15 = v42;
  }
}

- (void)_formatExplicitTimeDuration:(id)a3 isMMSS:(BOOL)a4 languageCode:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @","));
  float v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByTrimmingCharactersInSet:v9]);

  [v7 setString:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@":"]);
  id v12 = [v11 count];
  int v15 = v12 == (id)3 || v6;
  if (v15 == 1)
  {
    if (v12 == (id)3)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
      uint64_t v17 = 3600 * (void)[v16 integerValue];
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:1]);
      float v19 = (float)(v17 + 60 * (uint64_t)[v18 integerValue]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:2]);
      [v20 floatValue];
      double v22 = (float)(v21 + v19);
    }

    else
    {
      if (v12 == (id)1)
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
        [v16 floatValue];
        double v22 = v26;
        goto LABEL_16;
      }

      double v22 = -1.0;
      if (v12 != (id)2) {
        goto LABEL_17;
      }
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
      float v24 = (float)(60 * (uint64_t)[v16 integerValue]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:1]);
      [v18 floatValue];
      double v22 = (float)(v25 + v24);
    }
  }

  else
  {
    if (v12 == (id)1)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
      double v22 = (double)(60 * (uint64_t)[v16 integerValue]);
      goto LABEL_16;
    }

    double v22 = -1.0;
    if (v12 != (id)2) {
      goto LABEL_17;
    }
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
    uint64_t v23 = 3600 * (void)[v16 integerValue];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:1]);
    double v22 = (double)(v23 + 60 * (uint64_t)[v18 integerValue]);
  }

LABEL_16:
LABEL_17:
  uint64_t v27 = VOTLogSpeech(v12, v13, v14);
  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_1000F07DC((uint64_t)v7, v28, v29, v22);
  }

  if (v22 != -1.0)
  {
    id v33 = sub_10004AB8C(v15 ^ 1u, v8, v22);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v7 setString:v34];
  }

  uint64_t v35 = VOTLogSpeech(v30, v31, v32);
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    sub_1000F077C();
  }
}

- (void)_formatTimeDuration:(id)a3 didMatch:(BOOL *)a4 voiceIdentifier:(id)a5 rate:(float)a6
{
  id v9 = a3;
  id v67 = a5;
  *a4 = 0;
  float v10 = (void *)qword_1001ACD88;
  if (!qword_1001ACD88)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b((?<!:)[0-9]{1,2}:[0-9]{2}(?!:))\\s?(am|pm|AM|PM|[:cntrl:])?",  0LL,  0LL));
    id v12 = (void *)qword_1001ACD88;
    qword_1001ACD88 = v11;

    float v10 = (void *)qword_1001ACD88;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")));
  uint64_t v14 = (void *)qword_1001ACD90;
  if (!qword_1001ACD90)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\b([0-9]{1,2}:[0-9]{2})\\s?(-|–)\\s?([0-9]{1,2}:[0-9]{2})",  0LL,  0LL));
    double v16 = (void *)qword_1001ACD90;
    qword_1001ACD90 = v15;

    uint64_t v14 = (void *)qword_1001ACD90;
  }

  id v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")));
  id v71 = v9;
  if ([v73 count])
  {
    int v74 = a4;
    id v69 = [v13 mutableCopy];
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    id obj = v13;
    id v17 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v87;
      do
      {
        for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v87 != v19) {
            objc_enumerationMutation(obj);
          }
          float v21 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
          id v22 = [v21 range];
          NSUInteger v24 = v23;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          id v25 = v73;
          id v26 = [v25 countByEnumeratingWithState:&v82 objects:v91 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v83;
            while (2)
            {
              for (j = 0LL; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v83 != v28) {
                  objc_enumerationMutation(v25);
                }
                v93.NSUInteger location = (NSUInteger)[*(id *)(*((void *)&v82 + 1) + 8 * (void)j) range];
                v94.NSUInteger location = (NSUInteger)v22;
                v94.NSUInteger length = v24;
                if (NSIntersectionRange(v93, v94).length)
                {
                  [v69 removeObject:v21];
                  goto LABEL_21;
                }
              }

              id v27 = [v25 countByEnumeratingWithState:&v82 objects:v91 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

- (void)_appendLiteralCharacterString:(id)a3 toString:(id)a4 hasPhoneContext:(BOOL)a5 hasMathContext:(BOOL)a6 action:(id)a7 punctuationTableLanguageUsed:(BOOL *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:58]);
  unsigned __int8 v18 = [v17 BOOLValue];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:57]);
  unsigned int v20 = [v19 BOOLValue];

  float v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:17]);
  if ((unint64_t)[v14 length] > 2)
  {
    BOOL v27 = 0;
    goto LABEL_25;
  }

  uint64_t v22 = AXUnicodeCodePointForCharacterString(v14);
  unsigned int v92 = v22;
  if (v11)
  {
    id v23 = sub_10004B314(v22, @"UnicodeHex.PhoneContext.", @"VOTOutputPunctuation", v21);
    NSUInteger v24 = (__CFString *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = v24;
    if (v24) {
      id v26 = v24;
    }

    if (!v25) {
      goto LABEL_42;
    }
LABEL_16:
    BOOL v31 = 0;
    if (v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (v10)
  {
    uint64_t v28 = @"UnicodeHex.Math.";
    goto LABEL_12;
  }

  if (v20)
  {
    uint64_t v28 = @"UnicodeHex.TypingContext.";
LABEL_12:
    id v29 = sub_10004B314(v22, v28, @"VOTOutputPunctuation", v21);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ([v30 length]) {
      id v25 = v30;
    }
    else {
      id v25 = 0LL;
    }

    if (!v25) {
      goto LABEL_42;
    }
    goto LABEL_16;
  }

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:42]);

  if (v45)
  {
    char v94 = 0;
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSString, v46);
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForVariant:42]);
    uint64_t v49 = __UIAccessibilityCastAsClass(v47, v48, 1LL, &v94);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    if (v94) {
      abort();
    }
    if (v50)
    {
      id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnicodeHex.%@.",  v50));
      id v52 = sub_10004B314(v92, v51, @"VOTOutputPunctuation", v21);
      id v53 = (__CFString *)objc_claimAutoreleasedReturnValue(v52);
      id v25 = v53;
      if (v53) {
        uint64_t v54 = v53;
      }
    }

    else
    {
      id v25 = 0LL;
    }

    if (v25) {
      goto LABEL_16;
    }
  }

- (id)_literalStringMarkupForString:(id)a3 languageCode:(id)a4 action:(id)a5
{
  synthesizer = self->_synthesizer;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TTSSpeechSynthesizer voiceIdentifier](synthesizer, "voiceIdentifier"));
  -[TTSSpeechSynthesizer setVoiceIdentifier:](self->_synthesizer, "setVoiceIdentifier:", 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _determineVoiceIdentifier:languageCode:]( self,  "_determineVoiceIdentifier:languageCode:",  v9,  v10));

  id v14 = sub_10004A0E8(v11, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[TTSSpeechSynthesizer setVoiceIdentifier:](self->_synthesizer, "setVoiceIdentifier:", v12);
  return v15;
}

- (id)_stringForLiteralText:(id)a3 action:(id)a4 allowChangingLanguageForPunctuation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 length];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForVariant:55]);
  id v11 = [v10 BOOLValue];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForVariant:56]);
  id v13 = [v12 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForVariant:66]);
  id v15 = [v14 BOOLValue];

  if ((unint64_t)[v7 length] >= 2 && v9 == (id)1)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:]( self,  "_stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:",  v7,  v8,  0LL,  v15));
  }

  else
  {
    id v41 = v8;
    if (v5
      && [v7 length]
      && ([v7 rangeOfComposedCharacterSequenceAtIndex:0], v17 == objc_msgSend(v7, "length")))
    {
      char v43 = 0;
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      -[VOTOutputSpeechComponent _appendLiteralCharacterString:toString:hasPhoneContext:hasMathContext:action:punctuationTableLanguageUsed:]( self,  "_appendLiteralCharacterString:toString:hasPhoneContext:hasMathContext:action:punctuationTableLanguageUsed:",  v7,  v18,  v11,  v13,  v8,  &v43);
      id v16 = v18;
      if (v43)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

        if (!v19)
        {
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForVariant:17]);
          if (!v20)
          {
            float v21 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
            uint64_t v22 = AXLanguageCanonicalFormToGeneralLanguage(v21);
            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
          }

          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _determineVoiceIdentifier:languageCode:]( self,  "_determineVoiceIdentifier:languageCode:",  v8,  v20));
          NSUInteger v24 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v23));
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 language]);

          uint64_t v29 = VOTLogSpeech(v26, v27, v28);
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            __int128 v45 = v25;
            __int16 v46 = 2112;
            uint64_t v47 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Language rotor was set to default, and punctuation table language was used. Replacing with language %@ and voice %@.",  buf,  0x16u);
          }

          [v41 setObject:v25 forVariant:17];
          [v41 setObject:v23 forVariant:74];

          id v8 = v41;
        }
      }
    }

    else
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      uint64_t v31 = (uint64_t)[v7 length];
      if (v31 >= 1)
      {
        uint64_t v32 = v31;
        id v33 = 0LL;
        do
        {
          id v34 = (char *)[v7 rangeOfComposedCharacterSequenceAtIndex:v33];
          uint64_t v36 = v35;
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v34, v35));
          if ([v16 length])
          {
            id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
            unsigned __int8 v39 = objc_msgSend( v38,  "characterIsMember:",  objc_msgSend(v16, "characterAtIndex:", (char *)objc_msgSend(v16, "length") - 1));

            id v8 = v41;
            if ((v39 & 1) == 0) {
              [v16 appendString:@" "];
            }
          }

          -[VOTOutputSpeechComponent _appendLiteralCharacterString:toString:hasPhoneContext:hasMathContext:action:punctuationTableLanguageUsed:]( self,  "_appendLiteralCharacterString:toString:hasPhoneContext:hasMathContext:action:punctuationTableLanguageUsed:",  v37,  v16,  v11,  v13,  v8,  0LL);
          id v33 = &v34[v36];
        }

        while ((uint64_t)v33 < v32);
      }
    }
  }

  return v16;
}

- (void)_speakAsLiteralText:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
  uint64_t v8 = VOTLogSpeech(v5, v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000F0910();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _stringForLiteralText:action:allowChangingLanguageForPunctuation:]( self,  "_stringForLiteralText:action:allowChangingLanguageForPunctuation:",  v5,  v4,  1LL));
  uint64_t v13 = VOTLogSpeech(v10, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000F08B0();
  }

  [v4 setString:v10];
}

- (void)_speakAsPhoneticText:(id)a3
{
  id v3 = a3;
  uint64_t v6 = VOTLogSpeech(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F0970(v3, v7);
  }
}

- (id)fileSystemPunctuationGroup
{
  fileSystemPunctuationGroup = self->_fileSystemPunctuationGroup;
  if (!fileSystemPunctuationGroup)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___AXSSPunctuationGroup);
    uint64_t v5 = self->_fileSystemPunctuationGroup;
    self->_fileSystemPunctuationGroup = v4;

    -[AXSSPunctuationGroup setBasePunctuationUUID:]( self->_fileSystemPunctuationGroup,  "setBasePunctuationUUID:",  AXSSVoiceOverPunctuationGroupAll);
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___VOTAXSSPunctuationDynamicEntry);
    -[VOTAXSSPunctuationDynamicEntry setRule:](v6, "setRule:", 1LL);
    -[VOTAXSSPunctuationDynamicEntry setPunctuation:](v6, "setPunctuation:", @".");
    -[VOTAXSSPunctuationDynamicEntry setDynamicReplacement:](v6, "setDynamicReplacement:", &stru_1001774D0);
    id v9 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    -[AXSSPunctuationGroup setEntries:](self->_fileSystemPunctuationGroup, "setEntries:", v7);

    fileSystemPunctuationGroup = self->_fileSystemPunctuationGroup;
  }

  return fileSystemPunctuationGroup;
}

- (id)punctuationReplacement:(id)a3 withGroup:(id)a4 baseTable:(id)a5 languageCode:(id)a6 selectedLanguage:(id)a7 spokenLanguage:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v43 = a8;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([a4 entries]);
  id v16 = -[__CFString countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        unsigned int v20 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        float v21 = (void *)objc_claimAutoreleasedReturnValue([v20 punctuation]);
        unsigned int v22 = [v21 isEqualToString:v12];

        if (v22)
        {
          id v23 = [v20 rule];
          if (v23 == (id)2)
          {
            uint64_t v26 = &stru_10017A920;
            goto LABEL_31;
          }

          if (v23 == (id)1)
          {
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v20 replacement]);
            if (v27) {
              uint64_t v26 = (__CFString *)v27;
            }
            else {
              uint64_t v26 = &stru_10017A920;
            }
            goto LABEL_31;
          }

          if (!v23)
          {
            uint64_t v28 = (__CFString *)v12;
            goto LABEL_30;
          }
        }
      }

      id v17 = -[__CFString countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
      if (v17) {
        continue;
      }
      break;
    }
  }

  id v24 = [v12 characterAtIndex:0];
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 objectForIndex:v24]);
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", v12) & 1) != 0)
  {
    int v25 = 0;
  }

  else if (-[__CFString length](v15, "length") == (id)1)
  {
    int v25 = sub_1000CDC90((uint64_t)v24, (uint64_t)-[__CFString characterAtIndex:](v15, "characterAtIndex:", 0LL)) ^ 1;
  }

  else
  {
    int v25 = 1;
  }

  if (!-[__CFString length](v15, "length")) {
    goto LABEL_29;
  }
  int v29 = a7 ? 0 : v25;
  if (v14
    && v29
    && (uint64_t v30 = AXCLanguageCanonicalFormToGeneralLanguage(v14),
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30),
        uint64_t v32 = AXCLanguageCanonicalFormToGeneralLanguage(v43),
        id v33 = (void *)objc_claimAutoreleasedReturnValue(v32),
        unsigned __int8 v34 = [v31 isEqualToString:v33],
        v33,
        v31,
        (v34 & 1) == 0))
  {
    punctuationFallbacks = self->_punctuationFallbacks;
    if (!punctuationFallbacks)
    {
      uint64_t v37 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v38 = self->_punctuationFallbacks;
      self->_punctuationFallbacks = v37;

      punctuationFallbacks = self->_punctuationFallbacks;
    }

    unsigned __int8 v39 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( punctuationFallbacks,  "objectForKeyedSubscript:",  v14));
    if (!v39)
    {
      unsigned __int8 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_punctuationFallbacks,  "setObject:forKeyedSubscript:",  v39,  v14);
    }

    uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v12]);
    if (!v26)
    {
      uint64_t v40 = AXVOLocalizedStringForCharacter(v24, v14);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v40);
      if (!v26) {
        uint64_t v26 = (__CFString *)AXCopyUnicodeDescriptionStringForCharacter(v24);
      }
      [v39 setObject:v26 forKeyedSubscript:v12];
    }
  }

  else
  {
LABEL_29:
    uint64_t v28 = v15;
    id v15 = v28;
LABEL_30:
    uint64_t v26 = v28;
  }

- (id)baseTableForPunctuationGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSPunctuationManager sharedDatabase](&OBJC_CLASS___AXSSPunctuationManager, "sharedDatabase"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mostBasePunctuationGroupForGroup:v4]);

  if ([v6 isEqual:AXSSVoiceOverPunctuationGroupAll])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent currentAllPunctuationTable](self, "currentAllPunctuationTable"));
  }

  else if ([v6 isEqual:AXSSVoiceOverPunctuationGroupSome])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent currentSomePunctuationTable](self, "currentSomePunctuationTable"));
  }

  else
  {
    if (![v6 isEqual:AXSSVoiceOverPunctuationGroupNone])
    {
      uint64_t v8 = 0LL;
      goto LABEL_8;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent currentNonePunctuationTable](self, "currentNonePunctuationTable"));
  }

  uint64_t v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (id)_replacePunctuation:(id)a3 punctuationGroup:(id)a4 hasMathContext:(BOOL)a5 hasPhoneContext:(BOOL)a6 isText:(BOOL)a7 replaceCommas:(BOOL)a8 languageCode:(id)a9 speakPunctuationCounts:(BOOL)a10
{
  BOOL v142 = a6;
  BOOL v140 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a9;
  uint64_t v15 = (uint64_t)[v12 length];
  id v16 = [objc_allocWithZone(NSMutableString) init];
  if (qword_1001ACDA8 != -1) {
    dispatch_once(&qword_1001ACDA8, &stru_1001774F0);
  }
  v148 = v13;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent baseTableForPunctuationGroup:](self, "baseTableForPunctuationGroup:", v13));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSPunctuationManager sharedDatabase](&OBJC_CLASS___AXSSPunctuationManager, "sharedDatabase"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allPunctuationGroup]);
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent baseTableForPunctuationGroup:](self, "baseTableForPunctuationGroup:", v18));

  v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v19 = [v12 isAXAttributedString];
  id v151 = v16;
  if ((_DWORD)v19) {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  else {
    uint64_t v20 = 0LL;
  }
  v150 = self;
  v155 = (void *)v20;
  id v21 = v14;
  v152 = v21;
  if (!v21) {
    id v21 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  }
  v143 = v21;
  v145 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  v144 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  uint64_t v162 = 0LL;
  if (v15 >= 1)
  {
    uint64_t v22 = 0LL;
    id v23 = &_s10Foundation6LocaleV15AXCoreUtilitiesE014minimalCanonicB10IdentifierSSvg_ptr;
    while (1)
    {
      if ((_DWORD)v19)
      {
        while (1)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 attributesAtIndex:v22 effectiveRange:&v160]);
          if (![v24 count]) {
            break;
          }
          int v25 = v23[504];
          id v26 = [v16 length];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueWithRange:", v26, v161));
          id v28 = [v24 mutableCopy];
          [v28 setObject:v27 forKey:@"_VORangeValue"];
          [v155 addObject:v28];
          int v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v160, v161));
          [v16 appendString:v29];

          uint64_t v162 = v161 + v160;
          uint64_t v22 = v162;
          if (v162 >= v15) {
            goto LABEL_159;
          }
        }

        uint64_t v22 = v162;
      }

      id v30 = [v12 rangeOfComposedCharacterSequenceAtIndex:v22];
      unint64_t v32 = v31;
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v30, v31));
      if (v32 < 2) {
        break;
      }
      [v16 appendString:v153];
      v162 += v32;
LABEL_141:

      uint64_t v22 = v162;
      if (v162 >= v15) {
        goto LABEL_159;
      }
    }

    id v134 = v30;
    if ([v153 length] == (id)1) {
      id v33 = [v153 characterAtIndex:0];
    }
    else {
      id v33 = 0LL;
    }
    unsigned __int8 v34 = v152;
    LOWORD(v160) = (_WORD)v33;
    if (v142)
    {
      uint64_t v35 = @"UnicodeHex.PhoneContext.";
    }

    else
    {
      if (!v140) {
        goto LABEL_28;
      }
      uint64_t v35 = @"UnicodeHex.Math.";
    }

    id v36 = sub_10004B314((uint64_t)v33, v35, @"VOTOutputPunctuation", v152);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    unsigned __int8 v34 = v152;
    if (v37)
    {
      id v38 = v19;
      unsigned __int8 v39 = &stru_10017A920;
      if (v162 > 0) {
        unsigned __int8 v39 = @" ";
      }
      uint64_t v40 = (void *)v37;
      [v16 appendFormat:@"%@%@ ", v39, v37];
      v162 += v32;
      goto LABEL_140;
    }

- (void)_replaceRepeatedEmoji:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3010000000LL;
  void v22[4] = 0LL;
  v22[5] = 0LL;
  v22[3] = "";
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  v21[3] = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  void v20[3] = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100033020;
  v15[3] = &unk_100177518;
  id v17 = v21;
  uint64_t v18 = v20;
  id v19 = v22;
  id v5 = v3;
  id v16 = v5;
  uint64_t v6 = objc_retainBlock(v15);
  id v7 = [v5 copy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003318C;
  v10[3] = &unk_100177540;
  id v12 = &v23;
  id v13 = v22;
  uint64_t v8 = v6;
  id v11 = v8;
  id v14 = v21;
  CEMEnumerateEmojiTokensInStringWithBlock(v7, 0LL, v4, v10);
  ((void (*)(void *, uint64_t))v8[2])(v8, v24[3]);
  id v9 = (const void *)v24[3];
  if (v9)
  {
    CFRelease(v9);
    v24[3] = 0LL;
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v23, 8);
}

- (BOOL)_replaceRepeatedPuntuationAndEmoji:(id)a3 newString:(id)a4 charReplacementString:(id)a5 charSequence:(id)a6 charIndex:(int64_t *)a7 speakPunctuationCounts:(BOOL)a8 languageCode:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v42 = self;
  if ([v18 length] == (id)1) {
    id v20 = [v18 characterAtIndex:0];
  }
  else {
    id v20 = 0LL;
  }
  id v21 = (char *)[v16 length];
  id v43 = v19;
  int64_t v22 = *a7;
  if (*a7 + 1 >= (uint64_t)v21)
  {
    unsigned int v26 = 1;
  }

  else
  {
    uint64_t v23 = a7;
    unsigned int v40 = (_DWORD)v21 - v22;
    id v24 = &v21[-v22];
    uint64_t v25 = 1LL;
    while ([v16 characterAtIndex:v22 + v25] == (_DWORD)v20)
    {
      if (v24 == (char *)++v25)
      {
        a7 = v23;
        id v19 = v43;
        unsigned int v26 = v40;
        goto LABEL_13;
      }
    }

    a7 = v23;
    unsigned int v26 = v25;
  }

  id v19 = v43;
LABEL_13:
  if (v26 > 2 || v9)
  {
    if (v26 != 3
      || (_DWORD)v20 != 46
      || (id v28 = sub_10004B314(8230LL, @"UnicodeHex.", @"VOTOutputPunctuation", v19),
          (int v29 = (void *)objc_claimAutoreleasedReturnValue(v28)) == 0LL)
      && (int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUnichar:](&OBJC_CLASS___NSString, "stringWithUnichar:", 8230LL))) == 0LL)
    {
      id v30 = sub_10004B404((uint64_t)v20, @"UnicodeHex.", @"VOTOutputPunctuation", v19, v26);
      int v29 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (!v29)
      {
        unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent currentAllPunctuationTable](v42, "currentAllPunctuationTable"));
        uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 objectForIndex:v20]);

        if (!v32)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", *a7, 1));
          uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v33));
        }

        id v34 = sub_10004A988(off_1001AC148, @"repeat.filter", 0LL);
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v26));
        uint64_t v36 = AXFormatNumber();
        uint64_t v37 = (void *)v32;
        id v38 = (void *)objc_claimAutoreleasedReturnValue(v36);
        int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v41, v38, v37));
      }
    }

    objc_msgSend(v17, "appendString:", @", ");
    [v17 appendString:v29];
    id v19 = v43;
    objc_msgSend(v17, "appendString:", @", ");
    *a7 += v26;

    BOOL v27 = 1;
  }

  else
  {
LABEL_15:
    BOOL v27 = 0;
  }

  return v27;
}

- (id)_parseNumberInString:(id)a3 beforeCharacterAtIndex:(int64_t)a4 numberRange:(_NSRange *)a5
{
  id v6 = a3;
  id v7 = [v6 length];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "decimalDigitCharacterSet"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  [v8 addCharactersInString:@"-.."];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  int64_t v11 = a4;
  do
  {
    uint64_t v12 = v11;
    BOOL v13 = v11-- < 1;
  }

  while (!v13
       && (uint64_t)v7 >= a4
       && (objc_msgSend(v9, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", v11)) & 1) != 0);
  if (v12 < 1 || v12 > (uint64_t)v7)
  {
    uint64_t v14 = v12 - 1;
  }

  else
  {
    uint64_t v14 = v12 - 1;
    do
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%C",  [v6 characterAtIndex:v14]));
      [v10 insertString:v15 atIndex:0];

      BOOL v13 = v14-- < 1;
      if (v13) {
        break;
      }
    }

    while (v12 - 1 <= (uint64_t)v7);
  }

  a5->NSUInteger location = v14 + 1;
  a5->NSUInteger length = a4 - (v14 + 1);
  if ([v10 length])
  {
    objc_msgSend( v10,  "replaceOccurrencesOfString:withString:options:range:",  @".",  @".",  0,  0,  objc_msgSend(v10, "length"));
    id v16 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v16, "numberFromString:", v10));
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (id)replacePunctuation:(id)a3 punctuationGroup:(id)a4 replaceCommas:(BOOL)a5 languageCode:(id)a6
{
  LOBYTE(v7) = 0;
  return -[VOTOutputSpeechComponent _replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPunctuationCounts:]( self,  "_replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPu nctuationCounts:",  a3,  a4,  0LL,  0LL,  0LL,  a5,  a6,  v7);
}

- (id)_determineVoiceIdentifier:(id)a3 languageCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent expectedVoiceIdentifier:](self, "expectedVoiceIdentifier:", v6));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", v7));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 voiceIdentifier]);

    if (v10)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 voiceIdentifier]);

      uint64_t v8 = (void *)v11;
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v8));

  if (!v12)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer _speechVoiceForIdentifier:language:footprint:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "_speechVoiceForIdentifier:language:footprint:",  v8,  v6,  1LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 identifier]);

    uint64_t v8 = (void *)v14;
  }

  return v8;
}

- (id)_determineSpeechSourceForAction:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"VOActivity_%@", v5));
  }

  else
  {
    id v6 = AXSpeechSourceKeyVoiceOver;
  }

  return v6;
}

- (id)_determinePunctuationGroupForAction:(id)a3 isDefault:(BOOL *)a4
{
  id v6 = a3;
  id v7 = (void *)VOTSharedWorkspace;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceOverPunctuationGroup]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 punctuationGroupForUUID:v9]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", v6));
  uint64_t v12 = v11;
  if (v11)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 punctuationGroup]);

    if (v13)
    {
      uint64_t v14 = (void *)VOTSharedWorkspace;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 punctuationGroup]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 punctuationGroupForUUID:v15]);

      id v10 = (void *)v16;
    }
  }

  if (!v10)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForVariant:30]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___AXSSPunctuationGroup, v18);
    if ((objc_opt_isKindOfClass(v10, v19) & 1) != 0)
    {
      if (v10) {
        goto LABEL_5;
      }
    }

    else
    {
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForVariant:79]);
    if ([v20 isEqualToString:AXSSVoiceOverTextualContextFileSystem])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent fileSystemPunctuationGroup](self, "fileSystemPunctuationGroup"));

      if (v10) {
        goto LABEL_5;
      }
    }

    else
    {
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace defaultPunctuationGroup]);
    if (a4) {
      *a4 = 1;
    }
  }

- (id)_urlRangesInString:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v9 = (void *)qword_1001ACDB0;
  if (!qword_1001ACDB0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(http:\\/\\/|www\\.)?(\\S*)\\.(com|net|org|edu|gov|mil|uk|fi)(\\/\\S*)?\\b",  1LL,  0LL));
    uint64_t v11 = (void *)qword_1001ACDB0;
    qword_1001ACDB0 = v10;

    BOOL v9 = (void *)qword_1001ACDB0;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")));
  if ([v12 count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      id v16 = v7;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) range];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v19, v20));
          [v8 addObject:v21];
        }

        id v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v15);
      id v7 = v16;
    }
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _localeSpecificURLRegexForLanguageCode:]( self,  "_localeSpecificURLRegexForLanguageCode:",  v7));
    if (v13)
    {
      id v31 = v7;
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")));
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v33;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) range];
            int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v27, v28));
            [v8 addObject:v29];
          }

          id v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }

        while (v24);
      }

      id v7 = v31;
    }
  }

  return v8;
}

- (void)_replacePunctuation:(id)a3 withAction:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:55]);
  unsigned int v36 = [v11 BOOLValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:56]);
  unsigned int v35 = [v12 BOOLValue];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:50]);
  unsigned int v34 = [v13 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:65]);
  unsigned __int8 v33 = [v14 BOOLValue];

  id v31 = v9;
  id v30 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _determinePunctuationGroupForAction:isDefault:]( self,  "_determinePunctuationGroupForAction:isDefault:",  v9,  0LL));
  __int128 v37 = v10;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _urlRangesInString:languageCode:]( self,  "_urlRangesInString:languageCode:",  v8,  v10));
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v15)
  {
    id v16 = v15;
    int64_t v17 = 0LL;
    uint64_t v18 = *(void *)v39;
    do
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = (char *)[*(id *)(*((void *)&v38 + 1) + 8 * (void)v19) rangeValue];
        uint64_t v22 = v21;
        id v23 = &v20[v17];
        id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", &v20[v17], v21));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent fileSystemPunctuationGroup](self, "fileSystemPunctuationGroup"));
        LOBYTE(v29) = v33;
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPunctuationCounts:]( self,  "_replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:langu ageCode:speakPunctuationCounts:",  v24,  v25,  v35,  v36,  v34,  1LL,  v37,  v29));

        objc_msgSend(v8, "replaceCharactersInRange:withString:", v23, v22, v26);
        id v27 = [v26 length];
        int64_t v17 = v27 - (_BYTE *)[v24 length];

        id v19 = (char *)v19 + 1;
      }

      while (v16 != v19);
      id v16 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v16);
  }

  LOBYTE(v29) = v33;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCode:speakPunctuationCounts:]( self,  "_replacePunctuation:punctuationGroup:hasMathContext:hasPhoneContext:isText:replaceCommas:languageCod e:speakPunctuationCounts:",  v8,  v30,  v35,  v36,  v34,  [v30 isAllPunctuationGroup],  v37,  v29));
  [v8 setString:v28];
}

- (void)_removeRunsOfNewLines:(id)a3
{
  id v14 = a3;
  if ([v14 rangeOfString:@"\n\n\n"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = (uint64_t)[v14 length];
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    id v5 = v14;
    if (v3 >= 1)
    {
      for (uint64_t i = 0LL; i < v3; ++i)
      {
        if ([v5 characterAtIndex:i] == 10)
        {
          unint64_t v7 = 0LL;
          do
          {
            unint64_t v8 = v7;
            uint64_t v9 = i + v7 + 1;
            if (v9 >= v3)
            {
              if (v7 + 1 <= 1) {
                id v13 = @"\n";
              }
              else {
                id v13 = @"\n\n";
              }
              -[NSMutableString appendString:](v4, "appendString:", v13);
              i += v7 + 1;
              goto LABEL_19;
            }

            unsigned int v10 = [v14 characterAtIndex:i + v7++ + 1];
          }

          while (v10 == 10);
          if (v7 <= 1) {
            uint64_t v11 = @"\n";
          }
          else {
            uint64_t v11 = @"\n\n";
          }
          -[NSMutableString appendString:](v4, "appendString:", v11);
          if (v9 < v3)
          {
            i += v7;
            goto LABEL_13;
          }

          i += v8 + 1;
        }

        else
        {
LABEL_13:
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", i, 1));
          -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@", v12);
        }

- (void)_replaceEmoticonsWithText:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  emoticonReplacements = self->_emoticonReplacements;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_1000342DC;
  v9[3] = &unk_100177568;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](emoticonReplacements, "enumerateKeysAndObjectsUsingBlock:", v9);
}

- (void)_processEmoji:(id)a3 action:(id)a4 rate:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:17]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:74]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:58]);
  unsigned int v13 = [v12 BOOLValue];

  if ((v13 & 1) != 0)
  {
    id v14 = 0LL;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v14 = [v15 voiceOverVerbosityEmojiSuffixEnabled];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForVariant:80]);
  unsigned int v17 = [v16 BOOLValue] | v13;

  if (v17 == 1)
  {
    *(float *)&double v18 = a5;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  6LL,  v11,  v18));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TTSEmojiUtilities stringByReplacingEmojiCharactersWithEmojiDescriptions:stringForPauses:language:rangeReplacements:appendEmojiSuffix:]( &OBJC_CLASS___TTSEmojiUtilities,  "stringByReplacingEmojiCharactersWithEmojiDescriptions:stringForPauses:language:rangeReplacements:a ppendEmojiSuffix:",  v21,  v19,  v10,  0LL,  v14));
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TTSEmojiUtilities stringByRemovingEmojiCharacters:]( &OBJC_CLASS___TTSEmojiUtilities,  "stringByRemovingEmojiCharacters:",  v21));
  }

  if (([v21 isEqualToString:v20] & 1) == 0)
  {
    [v9 removeObjectForVariant:28];
    [v21 setString:v20];
  }
}

- (BOOL)_makeSubstitution:(id)a3 withString:(id)a4 punctuationGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  unsigned int v9 = [v7 isReplacementTextAllPunctuation];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 phonemes]);
  if ([v10 length])
  {
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 replacementString]);
    id v12 = [v11 length];

    if (!v12) {
      goto LABEL_11;
    }
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent baseTableForPunctuationGroup:](self, "baseTableForPunctuationGroup:", v32));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  unsigned int v13 = (char *)[v8 length];
  id v14 = 0LL;
  id v15 = v13;
  do
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 originalString]);
    unsigned int v17 = (char *)objc_msgSend( v8,  "rangeOfString:options:range:",  v16,  objc_msgSend(v7, "ignoreCase"),  v14,  v15);
    uint64_t v19 = v18;

    if (!v19) {
      break;
    }
    if (v9)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 replacementString]);
      id v21 = [v20 length];

      if (v21 == (id)1)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 replacementString]);
        [v22 getCharacters:v33];

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 replacementString]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 languages]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 anyObject]);
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent punctuationReplacement:withGroup:baseTable:languageCode:selectedLanguage:spokenLanguage:]( self,  "punctuationReplacement:withGroup:baseTable:languageCode:selectedLanguage:spokenLanguage:",  v23,  v32,  v30,  v25,  v29,  v28));
      }
    }

    id v14 = &v17[v19];
    id v15 = (char *)(v13 - v14);
  }

  while (v17 != (char *)0x7FFFFFFFFFFFFFFFLL);

LABEL_11:
  return 0;
}

- (void)_replaceUserSubstitutions:(id)a3 action:(id)a4
{
  id v21 = a3;
  id v20 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForVariant:70]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForVariant:30]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForVariant:43]);
    if (!v8)
    {
      id v10 = (void *)VOTSharedWorkspace;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 voiceOverPunctuationGroup]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 punctuationGroupForUUID:v12]);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    unsigned int v13 = self->_userSubstitutions;
    id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          unsigned int v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          if ([v17 appliesToAllApps])
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifiers]);
            unsigned int v19 = [v18 containsObject:v9];

            if (v19) {
              -[VOTOutputSpeechComponent _makeSubstitution:withString:punctuationGroup:]( self,  "_makeSubstitution:withString:punctuationGroup:",  v17,  v21,  v8);
            }
          }
        }

        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v14);
    }
  }
}

- (float)_determineVolume:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 volume]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 volume]);
    [v5 floatValue];
    float v7 = v6;
  }

  else
  {
    float v7 = 3.4028e38;
  }

  return v7;
}

- (float)_determineSpeakingRate:(id)a3 languageCode:(id)a4
{
  id v6 = a4;
  float v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRate]);

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRate]);
    [v9 floatValue];
    float v11 = v10;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v12 speechRateForLanguage:v6];
    float v11 = v13;

    if (!v6
      || fabs(v11 + -3.40282347e38) < 2.22044605e-16
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]),
          uint64_t v15 = AXLanguageCanonicalFormToGeneralLanguage(v14),
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v15),
          unsigned int v17 = [v16 isEqualToString:v6],
          v16,
          v14,
          v17))
    {
      [(id)VOTSharedWorkspace speechRateFromSettings];
      float v11 = v18;
    }
  }

  return v11;
}

- (id)_stringForNormalText:(id)a3 action:(id)a4 allowPausingAtBoundaries:(BOOL)a5 ignoreLeadingCommas:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:74]);
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:39]);
  [v13 floatValue];
  float v15 = v14;

  id v16 = [v10 length];
  if (v16)
  {
    BOOL v102 = v7;
    uint64_t v19 = VOTLogSpeech(v16, v17, v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000F0B20();
    }

    id v21 = (__CFString *)[v10 mutableCopy];
    v103 = v10;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:45]);
    unsigned int v101 = [v22 BOOLValue];

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:49]);
    unsigned int v95 = [v23 BOOLValue];

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:46]);
    unsigned int v94 = [v24 BOOLValue];

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:48]);
    unsigned int v98 = [v25 BOOLValue];

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:47]);
    unsigned int v97 = [v26 BOOLValue];

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:60]);
    unsigned int v96 = [v27 BOOLValue];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:44]);
    unsigned int v29 = [v28 BOOLValue];

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:50]);
    unsigned __int8 v100 = [v30 BOOLValue];

    id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:59]);
    if ([v31 BOOLValue])
    {
      unsigned int v99 = 1;
    }

    else
    {
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:27]);
      unsigned int v99 = [v53 BOOLValue];
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:31]);
    unsigned int v55 = [v54 BOOLValue];

    v56 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:76]);
    unsigned __int8 v57 = [v56 BOOLValue];

    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:17]);
    if ((v6 | v29) == 1)
    {
      id v58 = -[__CFString rangeOfString:](v21, "rangeOfString:", @",");
      if (!v58) {
        -[__CFString replaceCharactersInRange:withString:]( v21,  "replaceCharactersInRange:withString:",  0LL,  v60,  &stru_10017A920);
      }
    }

    uint64_t v61 = (AXIndexMap *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outputVariants", v58));
    currentActionVariants = self->_currentActionVariants;
    self->_currentActionVariants = v61;

    unint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:51]);
    unsigned int v64 = [v63 BOOLValue];

    if (v64)
    {
      uint64_t v65 = objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent _secureTextDescription:](self, "_secureTextDescription:", v103));

      v103 = (void *)v65;
      -[__CFString replaceCharactersInRange:withString:]( v21,  "replaceCharactersInRange:withString:",  0LL,  -[__CFString length](v21, "length"),  v65);
    }

    if (v55) {
      -[VOTOutputSpeechComponent _speakAllDigits:](self, "_speakAllDigits:", v21);
    }
    -[VOTOutputSpeechComponent _replaceUserSubstitutions:action:](self, "_replaceUserSubstitutions:action:", v21, v11);
    -[VOTOutputSpeechComponent _replaceEmoticonsWithText:](self, "_replaceEmoticonsWithText:", v21);
    if ((v57 & 1) == 0) {
      -[VOTOutputSpeechComponent _replacePunctuation:withAction:languageCode:]( self,  "_replacePunctuation:withAction:languageCode:",  v21,  v11,  v59);
    }
    -[VOTOutputSpeechComponent _formatNumbers:action:](self, "_formatNumbers:action:", v21, v11);
    -[VOTOutputSpeechComponent _formatUSHeight:voiceIdentifier:](self, "_formatUSHeight:voiceIdentifier:", v21, v12);
    *(float *)&double v66 = v15;
    -[VOTOutputSpeechComponent _formatIPAddress:voiceIdentifier:rate:]( self,  "_formatIPAddress:voiceIdentifier:rate:",  v21,  v12,  v66);
    *(float *)&double v67 = v15;
    -[VOTOutputSpeechComponent _formatEthernetMacAddress:voiceIdentifier:rate:]( self,  "_formatEthernetMacAddress:voiceIdentifier:rate:",  v21,  v12,  v67);
    -[VOTOutputSpeechComponent _formatATVStyleMediaDurations:](self, "_formatATVStyleMediaDurations:", v21);
    if (((v101 | v29 | v98 | v96 | v97) & 1) == 0)
    {
      id v68 = [v103 mutableCopy];
      *(float *)&double v69 = v15;
      -[VOTOutputSpeechComponent _formatDetectedDates:voiceIdentifier:languageCode:rate:]( self,  "_formatDetectedDates:voiceIdentifier:languageCode:rate:",  v68,  v12,  v59,  v69);
      if (([v68 isEqualToString:v103] & 1) == 0)
      {
        *(float *)&double v70 = v15;
        -[VOTOutputSpeechComponent _formatDetectedDates:voiceIdentifier:languageCode:rate:]( self,  "_formatDetectedDates:voiceIdentifier:languageCode:rate:",  v21,  v12,  v59,  v70);
      }
    }

    -[VOTOutputSpeechComponent _applyTransliteration:languageCode:]( self,  "_applyTransliteration:languageCode:",  v21,  v59);
    *(float *)&double v71 = v15;
    -[VOTOutputSpeechComponent _processEmoji:action:rate:](self, "_processEmoji:action:rate:", v21, v11, v71);
    -[VOTOutputSpeechComponent _applyCamelCaseSeparation:](self, "_applyCamelCaseSeparation:", v21);
    char v105 = 0;
    if (v29)
    {
      id v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v74 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByTrimmingCharactersInSet:](v21, "stringByTrimmingCharactersInSet:", v73));

      -[__CFString setString:](v21, "setString:", v74);
      id v75 = objc_allocWithZone(&OBJC_CLASS___NSArray);
      id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithRange:]( &OBJC_CLASS___NSValue,  "valueWithRange:",  0LL,  -[__CFString length](v21, "length")));
      id v77 = objc_msgSend(v75, "initWithObjects:", v76, 0);

      *(float *)&double v78 = v15;
      -[VOTOutputSpeechComponent _applyTelephoneFormatting:withRanges:languageCode:voiceIdentifier:rate:]( self,  "_applyTelephoneFormatting:withRanges:languageCode:voiceIdentifier:rate:",  v21,  v77,  v59,  v12,  v78);
    }

    else if ((v98 | v97 | v96) == 1)
    {
      -[VOTOutputSpeechComponent _formatExplicitTimeDuration:isMMSS:languageCode:]( self,  "_formatExplicitTimeDuration:isMMSS:languageCode:",  v21);
      char v105 = 1;
    }

    else if (((v101 | v95) & 1) == 0)
    {
      *(float *)&double v72 = v15;
      -[VOTOutputSpeechComponent _formatTimeDuration:didMatch:voiceIdentifier:rate:]( self,  "_formatTimeDuration:didMatch:voiceIdentifier:rate:",  v21,  &v105,  v12,  v72);
    }

    if (v101)
    {
      if (-[__CFString rangeOfString:](v21, "rangeOfString:", @".") != (id)0x7FFFFFFFFFFFFFFFLL) {
        -[__CFString replaceOccurrencesOfString:withString:options:range:]( v21,  "replaceOccurrencesOfString:withString:options:range:",  @".",  @":",  0LL,  0LL,  -[__CFString length](v21, "length"));
      }
    }

    else
    {
      int v79 = v95;
      if (v105) {
        int v79 = 1;
      }
      if (((v79 | v94 | v29) & 1) == 0)
      {
        *(float *)&double v72 = v15;
        -[VOTOutputSpeechComponent _formatTelephoneNumber:languageCode:voiceIdentifier:rate:]( self,  "_formatTelephoneNumber:languageCode:voiceIdentifier:rate:",  v21,  v59,  v12,  v72);
      }
    }

    -[VOTOutputSpeechComponent _applyTextualWorkarounds:](self, "_applyTextualWorkarounds:", v21);
    if ((v100 & 1) == 0)
    {
      *(float *)&double v80 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @",",  v21,  v102,  0LL,  v59,  v12,  v80);
      *(float *)&double v81 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"·",  v21,  v102,  0LL,  v59,  v12,  v81);
      if ((v95 & 1) == 0)
      {
        *(float *)&double v80 = v15;
        -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voice Identifier:rate:",  @".",  v21,  v102,  1LL,  v59,  v12,  v80);
      }
    }

    if (v99) {
      -[VOTOutputSpeechComponent _removeRunsOfNewLines:](self, "_removeRunsOfNewLines:", v21);
    }
    if ((v100 & 1) == 0)
    {
      *(float *)&double v80 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"\n\n",  v21,  v102,  0LL,  v59,  v12,  v80);
      id v82 = v59;
      __int128 v83 = v82;
      if (!v82) {
        __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
      }
      if (([v83 isEqual:@"he-IL"] & 1) == 0)
      {
        *(float *)&double v84 = v15;
        -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voice Identifier:rate:",  @"/",  v21,  v102,  0LL,  v82,  v12,  v84);
      }

      *(float *)&double v84 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"?",  v21,  v102,  0LL,  v82,  v12,  v84);
      *(float *)&double v85 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"\n",  v21,  v102,  0LL,  v82,  v12,  v85);
      *(float *)&double v86 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"\r",  v21,  v102,  0LL,  v82,  v12,  v86);
    }

    if (v99)
    {
      __int16 v104 = 8212;
      unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v104,  1LL));
      *(float *)&double v88 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  v87,  v21,  v102,  0LL,  v59,  v12,  v88);

      *(float *)&double v89 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"!",  v21,  v102,  0LL,  v59,  v12,  v89);
      *(float *)&double v90 = v15;
      -[VOTOutputSpeechComponent _insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:]( self,  "_insertLongerPausesForSymbol:withText:allowPausingAtBoundaries:onlyApplyWhenFollowedBySpace:languageCode:voiceIdentifier:rate:",  @"\t",  v21,  v102,  0LL,  v59,  v12,  v90);
    }

    id v10 = v103;
  }

  else
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForVariant:38]);
    [v32 floatValue];
    float v34 = v33;

    if (v34 <= 0.0)
    {
      id v21 = 0LL;
    }

    else
    {
      -[VOTOutputSpeechComponent _ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:]( self,  "_ttsVoiceTypeForPauseCalculationWithVoiceIdentifier:",  v12);
      *(float *)&double v38 = v34;
      sub_100049D68(v38, v15);
      float v40 = v39;
      *(float *)&double v41 = v15;
      uint64_t v42 = (__CFString *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent pauseStringForType:voiceIdentifier:rate:]( self,  "pauseStringForType:voiceIdentifier:rate:",  8LL,  v12,  v41));
      uint64_t v49 = v42;
      if (!v42
        || (v50 = sub_1000281B4( v42,  @"%d",  v43,  v44,  v45,  v46,  v47,  v48,  (int)(float)(v40 * 1000.0)),  v42 = (__CFString *)objc_claimAutoreleasedReturnValue(v50),  (id v21 = v42) == 0LL))
      {
        uint64_t v51 = VOTLogCommon(v42);
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          sub_1000F0A58();
        }

        id v21 = &stru_10017A920;
      }
    }
  }

  uint64_t v91 = VOTLogSpeech(v35, v36, v37);
  unsigned int v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
    sub_1000F09F8();
  }

  return v21;
}

- (void)_speakAsNormalText:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 string]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForVariant:66]);
  id v6 = [v5 BOOLValue];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:]( self,  "_stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:",  v8,  v4,  0LL,  v6));
  [v4 setString:v7];
}

- (void)_speakAsMixOfLiteralAndNormalText:(id)a3 withLiteralRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v33 = 0LL;
  float v34 = &v33;
  uint64_t v35 = 0x3010000000LL;
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v36 = "";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForVariant:66]);
  unsigned int v11 = [v10 BOOLValue];

  __int128 v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  __int128 v25 = sub_100035A98;
  unsigned int v26 = &unk_1001775D0;
  id v31 = &v33;
  id v12 = v8;
  id v27 = v12;
  uint64_t v28 = self;
  id v13 = v6;
  id v29 = v13;
  char v32 = v11;
  id v14 = v9;
  id v30 = v14;
  [v7 enumerateRangesUsingBlock:&v23];
  uint64_t v15 = v34[4];
  uint64_t v16 = v34[5];
  uint64_t v17 = (char *)objc_msgSend(v12, "length", v23, v24, v25, v26);
  uint64_t v18 = (_BYTE *)(v16 + v15);
  uint64_t v19 = (char *)(v17 - v18);
  if (v17 != v18)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v18, v19));
    if (v18) {
      uint64_t v21 = 0LL;
    }
    else {
      uint64_t v21 = v11;
    }
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:]( self,  "_stringForNormalText:action:allowPausingAtBoundaries:ignoreLeadingCommas:",  v20,  v13,  1LL,  v21));
    [v14 appendString:v22];
  }

  objc_msgSend(v13, "setString:", v14, v19);

  _Block_object_dispose(&v33, 8);
}

- (void)_configureSynthesizerWithPhonemeSubstitutionsFromAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
  unsigned int v8 = [v7 isAXAttributedString];

  if (v8)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100035EEC;
    v34[3] = &unk_1001775F8;
    id v35 = v6;
    [v5 enumerateAttributesUsingBlock:v34];
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForVariant:78]);
  if (v9)
  {
    id v10 = (void *)v9;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForVariant:78]);
      [v6 addObject:v12];
    }
  }

  if ([v6 count])
  {
    unsigned int v26 = v5;
    id v27 = v4;
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_100035F44;
          v28[3] = &unk_100177620;
          id v29 = v13;
          [v19 enumerateKeysAndObjectsUsingBlock:v28];
        }

        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v16);
    }

    transientSubstitutions = self->_transientSubstitutions;
    self->_transientSubstitutions = &v13->super;
    uint64_t v21 = v13;

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( self->_userSubstitutions,  "arrayByAddingObjectsFromArray:",  self->_transientSubstitutions));
    -[TTSSpeechSynthesizer setUserSubstitutions:](self->_synthesizer, "setUserSubstitutions:", v22);

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( self->_userSubstitutions,  "arrayByAddingObjectsFromArray:",  self->_transientSubstitutions));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    [v24 setUserSubstitutions:v23];

    id v5 = v26;
    id v4 = v27;
  }

  else
  {
    __int128 v25 = self->_transientSubstitutions;
    if (v25)
    {
      self->_transientSubstitutions = 0LL;

      -[TTSSpeechSynthesizer setUserSubstitutions:]( self->_synthesizer,  "setUserSubstitutions:",  self->_userSubstitutions);
    }
  }
}

- (void)_preprocessActionLanguageAndVoice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineLanguageForEvent:](self, "determineLanguageForEvent:", v4));

  if (![v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
    unsigned __int8 v8 = -[VOTOutputSpeechComponent stringIsInSupportedCharacters:](self, "stringIsInSupportedCharacters:", v7);

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForVariant:28]);
      unsigned int v10 = [v9 BOOLValue];

      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForVariant:83]);
      unsigned __int8 v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
        BOOL v14 = sub_10004A930(v13);

        if ((!v14 | v10) == 1)
        {
          id v15 = sub_10004A988(off_1001AC148, @"unpronounceable", &stru_10017A920);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@",  v16,  v17));

          uint64_t v22 = VOTLogSpeech(v19, v20, v21);
          __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = v24;
            __int16 v45 = 1024;
            LODWORD(v46) = [v25 characterAtIndex:0];
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Unpronounceable string: %@ %d",  buf,  0x12u);
          }

          [v5 setString:v18];
          [v5 removeObjectForVariant:28];
        }
      }
    }
  }

  if (![v6 length])
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);

    if ([v26 hasPrefix:@"en"]
      && (id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale")),
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 languageCode]),
          unsigned __int8 v29 = [v28 hasPrefix:@"en"],
          v28,
          v27,
          (v29 & 1) == 0))
    {

      id v6 = 0LL;
    }

    else
    {
      id v6 = v26;
    }
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _preferenceLanguageForLanguage:selectedLanguage:]( self,  "_preferenceLanguageForLanguage:selectedLanguage:",  v6,  v30));

  -[VOTOutputSpeechComponent _determineSpeakingRate:languageCode:]( self,  "_determineSpeakingRate:languageCode:",  v5,  v31);
  if (fabs(v32 + -3.40282347e38) >= 2.22044605e-16)
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v5 setObject:v33 forVariant:39];
  }

  float v34 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _determineVoiceIdentifier:languageCode:]( self,  "_determineVoiceIdentifier:languageCode:",  v5,  v31));
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v34));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 language]);

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _determineSpeechSourceForAction:]( self,  "_determineSpeechSourceForAction:",  v5));
  [v5 setObject:v37 forVariant:87];
  [v5 setObject:v36 forVariant:17];
  id v38 = [v5 setObject:v34 forVariant:74];
  uint64_t v41 = VOTLogSpeech(v38, v39, v40);
  uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v34;
    __int16 v45 = 2112;
    uint64_t v46 = v31;
    __int16 v47 = 2112;
    uint64_t v48 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Determining action will use %@ / %@[> %@]",  buf,  0x20u);
  }
}

- (void)_determineEmojiPreferenceForAction:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 speakEmojis]);

  if (v5) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v8 speakEmojis]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  ([(id)VOTSharedWorkspace emojiFeedback] >> 1) & 1));
  }
  id v7 = (void *)v6;
  [v4 setObject:v6 forVariant:80];
}

- (void)preprocessAction:(id)a3
{
  id v47 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:48]);
  unsigned int v5 = [v4 BOOLValue];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:47]);
  unsigned int v7 = [v6 BOOLValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:51]);
  unsigned int v9 = [v8 BOOLValue];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:56]);
  unsigned int v11 = [v10 BOOLValue];

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:59]);
  if ([v12 BOOLValue])
  {
    unsigned int v46 = 1;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:27]);
    unsigned int v46 = [v13 BOOLValue];
  }

  -[VOTOutputSpeechComponent _configureSynthesizerWithPhonemeSubstitutionsFromAction:]( self,  "_configureSynthesizerWithPhonemeSubstitutionsFromAction:",  v47);
  -[VOTOutputSpeechComponent _determineEmojiPreferenceForAction:](self, "_determineEmojiPreferenceForAction:", v47);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:67]);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:67]);
    CFTypeID v16 = CFGetTypeID(v15);
    if (v16 == AXUIElementGetTypeID())
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:67]);
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( &OBJC_CLASS___AXUIElement,  "uiElementWithAXElement:cache:",  v18,  0LL));
    }

    else
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___AXUIElement, v17);
      if ((objc_opt_isKindOfClass(v15, v20) & 1) != 0) {
        id v19 = v15;
      }
      else {
        id v19 = 0LL;
      }
    }

    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 stringWithAXAttribute:2006]);
    if (-[__CFString length](v21, "length"))
    {
      uint64_t v22 = v47;
      __int128 v23 = v21;
    }

    else
    {
      __int128 v23 = &stru_10017A920;
      uint64_t v22 = v47;
    }

    [v22 setString:v23];
  }

  id v24 = [objc_allocWithZone(AXIndexMap) init];
  [v24 setObject:v47 forIndex:14];
  -[VOTOutputSpeechComponent _determineVolume:](self, "_determineVolume:", v47);
  if (fabs(v25 + -3.40282347e38) >= 2.22044605e-16)
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v47 setObject:v26 forVariant:40];
  }

  -[VOTOutputSpeechComponent _preprocessActionLanguageAndVoice:](self, "_preprocessActionLanguageAndVoice:", v24);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:28]);
  unsigned int v28 = [v27 BOOLValue];

  unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForVariant:80]);
  unsigned int v30 = [v29 BOOLValue];

  unsigned int v31 = v11;
  unsigned int v32 = v9;
  unsigned int v33 = v7;
  unsigned int v34 = v5;
  if ((v28 & 1) == 0)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v47 string]);
    id v37 = [v36 length];

    if (v37 == (id)1) {
      char v38 = v30;
    }
    else {
      char v38 = 0;
    }
    if ((v38 & 1) == 0)
    {
      int v35 = 0;
      unsigned int v30 = 0;
      goto LABEL_25;
    }

- (BOOL)_processActionForLiteralEmojis:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
  uint64_t v6 = (char *)[v5 length];

  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
    id v8 = +[TTSEmojiUtilities emojiRangeFromString:withSearchRange:]( &OBJC_CLASS___TTSEmojiUtilities,  "emojiRangeFromString:withSearchRange:",  v7,  0LL,  v6);
    uint64_t v10 = v9;

    unsigned int v11 = 0LL;
    BOOL v12 = v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL;
    if (v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v11 = 0LL;
      do
      {
        if (v8 != v11) {
          objc_msgSend(v4, "addIndexesInRange:", v11, v8 - v11);
        }
        unsigned int v11 = &v8[v10];
        BOOL v13 = v6 >= &v8[v10];
        int64_t v14 = v6 - &v8[v10];
        if (v14 == 0 || !v13) {
          break;
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
        id v8 = +[TTSEmojiUtilities emojiRangeFromString:withSearchRange:]( &OBJC_CLASS___TTSEmojiUtilities,  "emojiRangeFromString:withSearchRange:",  v15,  v11,  v14);
        uint64_t v10 = v16;
      }

      while (v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL);
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  if ([v4 count]) {
    [v3 setObject:v4 forVariant:29];
  }

  return v12;
}

- (BOOL)stringIsInSupportedCharacters:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentLanguageMap]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  if (v6)
  {
    char v7 = sub_10004A7CC(v5, v6, v3);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    char v7 = sub_10004A7CC(v5, v8, v3);
  }

  return v7;
}

- (id)stringReplacingBrailleDotRanges:(id)a3
{
  id v3 = a3;
  if (qword_1001ACDE0 != -1) {
    dispatch_once(&qword_1001ACDE0, &stru_100177640);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if (![v3 length]) {
    goto LABEL_19;
  }
  char v5 = 0;
  unint64_t v6 = 0LL;
LABEL_5:
  char v20 = v5;
  do
  {
    id v7 = [v3 characterAtIndex:v6];
    if ([(id)qword_1001ACDD8 characterIsMember:v7])
    {
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v4, "appendString:", @", ");
      }

      else
      {
        id v10 = sub_10004A988(off_1001AC148, @"braille.dot.pattern.leader", &stru_10017A920);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        [v4 appendString:v11];
        [v4 appendString:@" "];
      }

      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v13 = 0LL;
      do
      {
        uint64_t v14 = v13 + 1;
        if (((v7 >> v13) & 1) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v14));
          [v12 addObject:v15];
        }

        uint64_t v13 = v14;
      }

      while (v14 != 8);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@" "]);
      [v4 appendString:v16];

      ++v6;
      char v5 = 1;
      if (v6 >= (unint64_t)[v3 length])
      {
        uint64_t v17 = v4;
        goto LABEL_20;
      }

      goto LABEL_5;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    unsigned __int8 v9 = [v8 characterIsMember:v7];

    v5 &= v9;
    objc_msgSend(v4, "appendFormat:", @"%C", v7);
    ++v6;
  }

  while (v6 < (unint64_t)[v3 length]);
  uint64_t v17 = v4;
  if ((v20 & 1) == 0) {
LABEL_19:
  }
    uint64_t v17 = v3;
LABEL_20:
  id v18 = v17;

  return v18;
}

- (void)_notifyDidFinishSpeakingWithFakeRequestForEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TTSSpeechRequest);
  id currentRequest = self->_currentRequest;
  self->_id currentRequest = v5;
  id object = v5;

  objc_setAssociatedObject(object, &unk_1001ACCE8, v4, (void *)1);
  -[VOTOutputSpeechComponent speechSynthesizer:didFinishSpeakingRequest:successfully:withError:]( self,  "speechSynthesizer:didFinishSpeakingRequest:successfully:withError:",  self->_synthesizer,  object,  1LL,  0LL);
}

- (id)_preferenceLanguageForLanguage:(id)a3 selectedLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (v7 && !v6)
  {
    uint64_t v9 = AXLanguageCanonicalFormToGeneralLanguage(v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    unsigned int v12 = [v11 hasPrefix:v10];

    if (v12)
    {
      id v10 = v10;

      uint64_t v13 = v10;
    }

    else
    {
      uint64_t v13 = v8;
    }

    goto LABEL_9;
  }

  if (!v7
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]),
        unsigned __int8 v15 = [v14 isEqualToString:v8],
        v14,
        uint64_t v13 = v8,
        (v15 & 1) == 0))
  {
    uint64_t v16 = AXLanguageCanonicalFormToGeneralLanguage(v8);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v10 = v8;
LABEL_9:
  }

  return v13;
}

- (void)_updateActionWithCanonicalMappings:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 precomposedStringWithCanonicalMapping]);

  [v3 setString:v5];
}

- (float)mapSettingsPitchToSpeechPitch:(float)a3
{
  if (a3 < 0.5) {
    return (a3 + a3) * 0.5 + 0.5;
  }
  float v3 = 1.0;
  if (a3 > 0.5) {
    return (float)((float)(a3 + -0.5) + (float)(a3 + -0.5)) + 1.0;
  }
  return v3;
}

- (void)_updatePitch:(id)a3 settingsPitch:(float)a4
{
  if (a3)
  {
    [a3 floatValue];
    float v7 = *(float *)&v6 + (float)((float)(2.0 - *(float *)&v6) * (float)((float)(a4 + -0.5) + (float)(a4 + -0.5)));
  }

  else
  {
    -[VOTOutputSpeechComponent mapSettingsPitchToSpeechPitch:](self, "mapSettingsPitchToSpeechPitch:", *(double *)&a4);
    float v7 = *(float *)&v6;
  }

  *(float *)&double v6 = v7;
  -[TTSSpeechSynthesizer setPitch:](self->_synthesizer, "setPitch:", v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
  *(float *)&double v8 = v7;
  [v9 setPitch:v8];
}

- (id)outputMutedActivityValue:(id)a3
{
  return [a3 speechMuted];
}

- (double)outputMutedActivityLastToggleTime
{
  return result;
}

- (void)_updateDuckingBasedOnActivity:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent activityBasedAudioDucking](self, "activityBasedAudioDucking"));
  unint64_t v5 = (unint64_t)[v4 copy];

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v9 audioDucking]);
  if (v6)
  {
    float v7 = (void *)objc_claimAutoreleasedReturnValue([v9 audioDucking]);
    -[VOTOutputSpeechComponent setActivityBasedAudioDucking:](self, "setActivityBasedAudioDucking:", v7);
  }

  else
  {
    -[VOTOutputSpeechComponent setActivityBasedAudioDucking:](self, "setActivityBasedAudioDucking:", 0LL);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent activityBasedAudioDucking](self, "activityBasedAudioDucking"));
}

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  uint64_t v7 = VOTLogSpeech(v4, v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "VOT-BeginSpeaking",  "",  buf,  2u);
  }

  if (!self->_lastSetOptions)
  {
    uint64_t v11 = VOTLogAudio(v9, v10);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Trying to speak without having set audio session properties, reseting now.",  buf,  2u);
    }

    -[VOTOutputSpeechComponent _updateAudioSessionProperties](self, "_updateAudioSessionProperties");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
  unsigned int v14 = [(id)VOTSharedWorkspace speechMuted];
  unsigned int v15 = [(id)VOTSharedWorkspace voiceOverIsIdle];
  unsigned int v16 = -[VOTOutputComponent determineOutputMutedForActivity:](self, "determineOutputMutedForActivity:", v13);
  -[VOTOutputSpeechComponent _updateDuckingBasedOnActivity:](self, "_updateDuckingBasedOnActivity:", v13);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:25]);
  unsigned int v18 = [v17 BOOLValue];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
  unsigned int v20 = [v19 isSiriTalkingOrListening];

  if (!v20 && (((v14 | v15 | v16) ^ 1 | v18) & 1) != 0)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:32]);
    self->_userStopped = 0;
    self->_isSpeaking = 1;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:74]);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:87]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
    float v25 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent stringReplacingBrailleDotRanges:]( self,  "stringReplacingBrailleDotRanges:",  v24));

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
    if (v25 != v26) {
      [v13 setString:v25];
    }
    p_synthesizer = &self->_synthesizer;
    -[TTSSpeechSynthesizer setSpeechSource:](self->_synthesizer, "setSpeechSource:", v23);
    -[TTSSpeechSynthesizer setVoiceIdentifier:](self->_synthesizer, "setVoiceIdentifier:", v22);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    [v28 setSpeechSource:v23];

    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
    [v29 setVoiceIdentifier:v22];

    -[VOTOutputSpeechComponent _updateActionWithCanonicalMappings:](self, "_updateActionWithCanonicalMappings:", v13);
    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v13 outputRequest]);
    [v30 setStartedRequest:1];

    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
    if ([v31 length])
    {
      v147 = v25;
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v13 outputRequest]);
      if (![v32 disableOutput])
      {
        v146 = v23;
        char v38 = (void *)objc_claimAutoreleasedReturnValue([v13 outputRequest]);
        unsigned __int8 v39 = [v38 suppressSpeech];

        __int128 v23 = v146;
        float v25 = v147;
        if ((v39 & 1) == 0)
        {
          v143 = v22;
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:89]);
          int v41 = (void *)objc_claimAutoreleasedReturnValue([v40 rate]);
          uint64_t v42 = v41;
          if (v41)
          {
            BOOL v142 = v41;
          }

          else
          {
            uint64_t v43 = objc_claimAutoreleasedReturnValue([v13 objectForVariant:39]);
            unsigned int v44 = (void *)v43;
            if (v43) {
              __int16 v45 = (_UNKNOWN **)v43;
            }
            else {
              __int16 v45 = &off_1001873E0;
            }
            BOOL v142 = v45;
          }

          uint64_t v46 = objc_claimAutoreleasedReturnValue([v40 pitch]);
          id v47 = (void *)v46;
          if (v46) {
            uint64_t v48 = (_UNKNOWN **)v46;
          }
          else {
            uint64_t v48 = &off_1001873E0;
          }
          uint64_t v49 = v48;

          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v40 volume]);
          uint64_t v51 = v50;
          v141 = v40;
          if (v50)
          {
            id v52 = v50;
          }

          else
          {
            id v53 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:40]);
            id v54 = v53;
            if (v53)
            {
              id v52 = v53;
            }

            else
            {
              unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
              [v55 voiceOverEffectiveSpeakingVolume];
              id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));

              uint64_t v40 = v141;
            }
          }

          v56 = (void *)objc_claimAutoreleasedReturnValue([v40 voiceSettings]);
          -[TTSSpeechSynthesizer setPerVoiceSettings:](*p_synthesizer, "setPerVoiceSettings:", v56);

          unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue([v40 effects]);
          -[TTSSpeechSynthesizer setAudioEffects:](*p_synthesizer, "setAudioEffects:", v57);

          id v58 = (void *)objc_claimAutoreleasedReturnValue([v40 voiceSettings]);
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
          [v59 setPerVoiceSettings:v58];

          [v49 floatValue];
          -[VOTOutputSpeechComponent _updatePitch:settingsPitch:](self, "_updatePitch:settingsPitch:", v21);
          uint64_t v60 = *p_synthesizer;
          [v52 floatValue];
          -[TTSSpeechSynthesizer setVolume:](v60, "setVolume:");
          [v52 floatValue];
          int v62 = v61;
          unint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
          LODWORD(v64) = v62;
          [v63 setVolume:v64];

          [v142 floatValue];
          float v66 = v65;

          float v67 = -1.0;
          if (v66 < 0.0)
          {
            id v68 = v143;
          }

          else
          {
            id v68 = v143;
            if (fabs(v66 + -3.40282347e38) >= 2.22044605e-16)
            {
              -[TTSSpeechSynthesizer rate](*p_synthesizer, "rate");
              float v67 = v69;
              *(float *)&double v70 = v66;
              -[TTSSpeechSynthesizer setRate:](*p_synthesizer, "setRate:", v70);
              double v71 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent synthesizerForTelephonyMixin]( self,  "synthesizerForTelephonyMixin"));
              *(float *)&double v72 = v66;
              [v71 setRate:v72];

              uint64_t v76 = VOTLogSpeech(v73, v74, v75);
              id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                *(double *)__int128 v157 = v66;
                _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Set Rate: %f;", buf, 0xCu);
              }
            }
          }

          v138 = v52;
          double v78 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
          [v78 enableAudioSession:@"SPEECH"];

          uint64_t v82 = VOTLogSpeech(v79, v80, v81);
          __int128 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
          if (os_signpost_enabled(v83))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v83,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "BeginSpeaking",  "",  buf,  2u);
          }

          v139 = v21;

          double v84 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:70]);
          -[TTSSpeechSynthesizer setIgnoreSubstitutions:]( *p_synthesizer,  "setIgnoreSubstitutions:",  [v84 BOOLValue]);

          double v85 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:43]);
          -[TTSSpeechSynthesizer setBundleIdentifier:](*p_synthesizer, "setBundleIdentifier:", v85);

          double v86 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:70]);
          id v87 = [v86 BOOLValue];
          double v88 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
          [v88 setIgnoreSubstitutions:v87];

          double v89 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForVariant:43]);
          double v90 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent synthesizerForTelephonyMixin](self, "synthesizerForTelephonyMixin"));
          [v90 setBundleIdentifier:v89];

          uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue([v13 outputRequest]);
          -[TTSSpeechSynthesizer setSynthesizeSilently:]( *p_synthesizer,  "setSynthesizeSilently:",  [v91 synthesizeSilently]);

          v137 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v68));
          uint64_t v92 = objc_claimAutoreleasedReturnValue([v137 language]);
          BOOL v140 = (void *)v92;
          if (v92)
          {
            uint64_t v93 = v92;
            objc_msgSend(v13, "setObject:forVariant:");
            synthesizer = self->_synthesizer;
            unsigned int v95 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
            id v154 = 0LL;
            id v155 = 0LL;
            -[TTSSpeechSynthesizer startSpeakingString:withLanguageCode:request:error:]( synthesizer,  "startSpeakingString:withLanguageCode:request:error:",  v95,  v93,  &v155,  &v154);
            id v96 = v155;
            id v97 = v154;

            unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent synthesizerForTelephonyMixin]( self,  "synthesizerForTelephonyMixin"));
            unsigned int v99 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
            id v152 = v97;
            id v153 = v96;
            unsigned __int8 v100 = &v153;
            unsigned int v101 = &v152;
            BOOL v102 = &v153;
            v103 = &v152;
            __int16 v104 = v98;
            char v105 = v99;
            uint64_t v106 = v93;
            p_synthesizer = &self->_synthesizer;
          }

          else
          {
            BOOL v107 = *p_synthesizer;
            v108 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
            id v150 = 0LL;
            id v151 = 0LL;
            -[TTSSpeechSynthesizer startSpeakingString:withLanguageCode:request:error:]( v107,  "startSpeakingString:withLanguageCode:request:error:",  v108,  0LL,  &v151,  &v150);
            id v96 = v151;
            id v97 = v150;

            unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent synthesizerForTelephonyMixin]( self,  "synthesizerForTelephonyMixin"));
            unsigned int v99 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
            id v148 = v97;
            id v149 = v96;
            unsigned __int8 v100 = &v149;
            unsigned int v101 = &v148;
            BOOL v102 = &v149;
            v103 = &v148;
            __int16 v104 = v98;
            char v105 = v99;
            uint64_t v106 = 0LL;
          }

          [v104 startSpeakingString:v105 withLanguageCode:v106 request:v102 error:v103];
          id obj = *v100;
          id object = *v100;

          id v144 = *v101;
          uint64_t v109 = objc_claimAutoreleasedReturnValue([v13 objectForVariant:75]);
          unint64_t v112 = (void *)v109;
          uint64_t v21 = v139;
          uint64_t v22 = v143;
          __int128 v23 = v146;
          float v25 = v147;
          if (v109)
          {
            unsigned int v113 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager", obj));
            [v113 playSoundFast:v112];

            uint64_t v116 = VOTLogAudio(v114, v115);
            id v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
            if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG)) {
              sub_1000F0CB4();
            }
          }

          uint64_t v118 = VOTLogSpeech(v109, v110, v111);
          uint64_t v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
          {
            id v134 = (void *)objc_claimAutoreleasedReturnValue(-[TTSSpeechSynthesizer resolvedVoiceIdentifier](*p_synthesizer, "resolvedVoiceIdentifier"));
            v135 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
            *(_DWORD *)buf = 138478339;
            *(void *)__int128 v157 = v140;
            *(_WORD *)&v157[8] = 2113;
            __int128 v158 = v134;
            *(_WORD *)__int128 v159 = 2113;
            *(void *)&v159[2] = v135;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEBUG,  "Spoke: [%{private}@:%{private}@]: '%{private}@'",  buf,  0x20u);

            __int128 v23 = v146;
            float v25 = v147;
          }

          uint64_t v123 = VOTLogSpeech(v120, v121, v122);
          uint64_t v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG)) {
            sub_1000F0C08((id *)p_synthesizer, v124);
          }

          objc_storeStrong(&self->_currentRequest, obj);
          char v129 = object;
          if (object) {
            objc_setAssociatedObject(object, &unk_1001ACCE8, v4, (void *)1);
          }
          if (v144)
          {
            uint64_t v130 = VOTLogSpeech(v125, v126, v127);
            unsigned int v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
            if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
              sub_1000F0B80(v144, v131);
            }

            char v129 = object;
          }

          if (v67 >= 0.0)
          {
            *(float *)&double v128 = v67;
            -[TTSSpeechSynthesizer setRate:](*p_synthesizer, "setRate:", v128);
            int v132 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent synthesizerForTelephonyMixin]( self,  "synthesizerForTelephonyMixin"));
            *(float *)&double v133 = v67;
            [v132 setRate:v133];

            char v129 = object;
          }

          self->_lastTimeSpeechStarted = CFAbsoluteTimeGetCurrent();

          goto LABEL_16;
        }

- (id)_spokenTextForRequest:(id)a3 range:(_NSRange *)a4
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v25 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v25 outputActions]);
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = &stru_10017A920;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if (![v12 component])
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 string]);
          id v14 = [v13 length];

          if (v14)
          {
            if (-[__CFString length](v10, "length"))
            {
              uint64_t v15 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v10, "stringByAppendingString:", @", "));

              uint64_t v10 = (__CFString *)v15;
            }

            unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v12 string]);
            uint64_t v17 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v16));

            uint64_t v10 = (__CFString *)v17;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v8);
  }

  else
  {
    uint64_t v10 = &stru_10017A920;
  }

  if (qword_1001ACE00 != -1) {
    dispatch_once(&qword_1001ACE00, &stru_100177660);
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v34[0] = qword_1001ACDE8;
  v34[1] = qword_1001ACDF0;
  v34[2] = qword_1001ACDF8;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0LL;
      __int128 v23 = v10;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _processCaptionTextForMarkup:regex:range:]( self,  "_processCaptionTextForMarkup:regex:range:",  v23,  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v22),  a4));

        uint64_t v22 = (char *)v22 + 1;
        __int128 v23 = v10;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }

    while (v20);
  }

  return v10;
}

- (id)_processCaptionTextForMarkup:(id)a3 regex:(id)a4 range:(_NSRange *)a5
{
  id v7 = a3;
  id v23 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")));
  NSUInteger location = a5->location;
  NSUInteger length = a5->length;
  id v24 = v7;
  id v10 = [v7 mutableCopy];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((unint64_t)[v16 range] < a5->location)
        {
          [v16 range];
          location -= v17;
        }

        unsigned int v18 = (char *)[v16 range] + v13;
        [v16 range];
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v18, v19, &stru_10017A920);
        [v16 range];
        v13 -= v20;
      }

      id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v12);
  }

  a5->NSUInteger location = location;
  a5->NSUInteger length = length;

  return v10;
}

- (void)_capVolumeForLanguage:(id)a3 volume:(float)a4
{
  if (!self->_isVolumeCapped)
  {
    unsigned int v6 = [a3 isEqualToString:@"zh-CN"];
    if (a4 > 0.94 && v6 != 0)
    {
      -[TTSSpeechSynthesizer setVolume:](self->_synthesizer, "setVolume:");
      self->_isVolumeCapped = 1;
    }
  }

- (void)_uncapVolume:(float)a3
{
  if (self->_isVolumeCapped)
  {
    -[TTSSpeechSynthesizer setVolume:](self->_synthesizer, "setVolume:");
    self->_isVolumeCapped = 0;
  }

- (void)_didStartSpeakingAction:(id)a3
{
  id v4 = a3;
  uint64_t v7 = VOTLogSpeech(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "VOT-BeginSpeaking",  "",  (uint8_t *)&v22,  2u);
  }

  uint64_t v9 = objc_autoreleasePoolPush();
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
  if ([(id)VOTSharedWorkspace inPerformanceTestMode])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXPerformanceTestReportingServer server](&OBJC_CLASS___AXPerformanceTestReportingServer, "server"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
    [v11 voiceOverDidSpeak:v12];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 outputRequest]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 outputActions]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

  if (v15 == v10)
  {
    if ([(id)VOTSharedWorkspace inUnitTestMode])
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 outputRequest]);
      uint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v16 startBlock]);

      if (v17)
      {
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v10 outputRequest]);
        ((void (**)(void, void *))v17)[2](v17, v18);
      }
    }

    uint64_t v23 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outputRequest", 0));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _spokenTextForRequest:range:]( self,  "_spokenTextForRequest:range:",  v19,  &v22));

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    objc_msgSend(v21, "setVoiceOverCaptionText:withRange:language:voice:", v20, v22, v23, 0, 0);
  }

  objc_autoreleasePoolPop(v9);
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  id AssociatedObject = objc_getAssociatedObject(a4, &unk_1001ACCE8);
  id v6 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  -[VOTOutputSpeechComponent _didStartSpeakingAction:](self, "_didStartSpeakingAction:", v6);
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v42 = a4;
  id v41 = a3;
  id v9 = a5;
  context = objc_autoreleasePoolPush();
  id AssociatedObject = objc_getAssociatedObject(v9, &unk_1001ACCE8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForIndex:14]);
  char v38 = v11;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForIndex:13]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForVariant:18]);
  uint64_t v15 = v14;
  if (v14) {
    objc_msgSend(v14, "speechSynthesizer:willSpeakRangeOfSpeechString:forRequest:", 0, location, length, v9);
  }
  uint64_t v34 = v15;
  uint64_t v40 = v9;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForVariant:41]);
  unsigned __int8 v17 = [v16 BOOLValue];

  if ((v17 & 1) == 0
    && self->_lastTimeSpeechStarted != -3061152000.0
    && CFAbsoluteTimeGetCurrent() - self->_lastTimeSpeechStarted > 7.0)
  {
    self->_lastTimeSpeechStarted = CFAbsoluteTimeGetCurrent();
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
    [v18 userEventOccurred];
  }

  id v19 = [objc_allocWithZone(AXIndexMap) init];
  [v19 setObject:v12 forIndex:11];
  [v19 setObject:v13 forIndex:13];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 outputRequest]);
  __int128 v33 = v19;
  -[VOTOutputComponent notifyRangeWillOutput:container:]( self,  "notifyRangeWillOutput:container:",  location,  length,  v19);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 outputActions]);
  id v22 = [v21 indexOfObject:v12];

  uint64_t v36 = (void *)v13;
  id v37 = v12;
  uint64_t v35 = self;
  if (v22 && v22 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = 0LL; i < (unint64_t)v22; ++i)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 outputActions]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:i]);

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 string]);
      id v27 = [v26 length];

      if (v27)
      {
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v25 string]);
        id v29 = [v28 length];
        id v30 = objc_msgSend(@", ", "length");

        location += (NSUInteger)v29 + (void)v30;
      }
    }
  }

  v42.NSUInteger location = location;
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputSpeechComponent _spokenTextForRequest:range:]( v35,  "_spokenTextForRequest:range:",  v20,  &v42));
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  objc_msgSend(v32, "setVoiceOverCaptionText:withRange:language:voice:", v31, v42.location, v42.length, 0, 0);

  objc_autoreleasePoolPop(context);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6
{
  id v8 = a6;
  if (v8)
  {
    id v9 = a4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 languageCode]);
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer _speechVoiceForIdentifier:language:footprint:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "_speechVoiceForIdentifier:language:footprint:",  0LL,  v10,  1LL));

    uint64_t v15 = VOTLogSpeech(v12, v13, v14);
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000F0D14((uint64_t)v8, v11, v16);
    }

    id AssociatedObject = objc_getAssociatedObject(v9, &unk_1001ACCE8);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

    id v19 = [v18 deepCopyWithZone:0];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForIndex:14]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    [v20 setObject:v21 forVariant:74];

    -[VOTOutputSpeechComponent handleEvent:](self, "handleEvent:", v19);
  }

  else
  {
    speechThread = self->_speechThread;
    id v11 = a4;
    -[SCRCThread performSelector:onTarget:cancelMask:count:objects:]( speechThread,  "performSelector:onTarget:cancelMask:count:objects:",  "_didFinishSpeaking:",  self,  0LL,  1LL,  v11);
  }
}

- (void)_didFinishSpeaking:(id)a3
{
  id v4 = a3;
  id AssociatedObject = objc_getAssociatedObject(v4, &unk_1001ACCE8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:14]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:13]);
  self->_isPaused = 0;
  id v9 = -[SCRCTargetSelectorTimer cancel](self->_stopSpeakingAfterLongPauseTimer, "cancel");
  uint64_t v12 = VOTLogSpeech(v9, v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000F0DA0(v7, v13);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v14 voiceOverEffectiveSpeakingVolume];
  -[VOTOutputSpeechComponent _uncapVolume:](self, "_uncapVolume:");

  if (([v7 synchronization] & 2) != 0)
  {
    id v15 = [objc_allocWithZone(AXIndexMap) init];
    [v15 setObject:v7 forIndex:11];
    [v15 setObject:v8 forIndex:13];
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", !self->_userStopped));
    [v15 setObject:v16 forIndex:20];

    -[VOTOutputComponent notifyActionComplete:](self, "notifyActionComplete:", v15);
  }

  objc_setAssociatedObject(v4, &unk_1001ACCE8, 0LL, (void *)1);
  id currentRequest = self->_currentRequest;

  if (currentRequest == v4)
  {
    self->_isSpeaking = 0;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v18 disableAudioSession:@"SPEECH"];
  }
}

- (BOOL)replacesCharacterAsPunctuation:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputSpeechComponent currentAllPunctuationTable](self, "currentAllPunctuationTable"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:v3]);
  LOBYTE(v3) = v5 != 0LL;

  return v3;
}

- (void)setShouldOutputToHearingAid:(BOOL)a3
{
}

- (TTSSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (NSDictionary)emoticonReplacements
{
  return self->_emoticonReplacements;
}

- (void)setEmoticonReplacements:(id)a3
{
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (NSNumber)activityBasedAudioDucking
{
  return self->_activityBasedAudioDucking;
}

- (void)setActivityBasedAudioDucking:(id)a3
{
}

- (TTSSpeechSynthesizer)synthesizerForTelephonyMixin
{
  return self->_synthesizerForTelephonyMixin;
}

- (void)setSynthesizerForTelephonyMixin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end