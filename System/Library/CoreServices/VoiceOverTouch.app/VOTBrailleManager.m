@interface VOTBrailleManager
+ (double)currentDefaultBrailleAlertTimeout;
+ (id)manager;
- (BOOL)_brailleShouldTryToTurnPage:(id)a3 direction:(int64_t)a4;
- (BOOL)_handleKeyboardModifierCommands:(id)a3;
- (BOOL)_isActiveUserDisplayConfig:(id)a3;
- (BOOL)_languageIsCJK;
- (BOOL)_languageIsNBSC;
- (BOOL)_shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:(id)a3 rotorItems:(id)a4 locale:(id)a5;
- (BOOL)_supportsMode:(int64_t)a3;
- (BOOL)autoAdvanceEnabled;
- (BOOL)bluetoothBrailleDisplayConnected;
- (BOOL)brailleEnabled;
- (BOOL)handleCommandIfActiveBrailleRelated:(id)a3;
- (BOOL)handleShowOnscreenKeyboardToggle;
- (BOOL)hasActiveBrailleDisplay;
- (BOOL)panEnabled;
- (BOOL)statusCellShowsGeneral;
- (BOOL)statusCellShowsText;
- (BOOL)testingBrailleElementLocked;
- (BOOL)testingHasActiveDisplay;
- (BOOL)testingKeyboardHelpIsOn;
- (BOOL)usesBrailleSubstitutions;
- (BRLTTable)brailleInputTableFromSettings;
- (BRLTTable)brailleTableFromSettings;
- (NSAttributedString)testingMainAttributedString;
- (NSString)brailleSubstitutionLanguage;
- (SCROBrailleClient)testingBrailleClient;
- (VOTBrailleManager)init;
- (VOTElement)brailleElement;
- (VOTElement)previousElement;
- (VOTElement)previousTouchContainer;
- (_NSRange)brailleLineRange;
- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3;
- (double)lastUserInteractionTime;
- (double)threadWaitTime;
- (id)_defaultLanguageRotorItem;
- (id)_localeIdentifierForCurrentInputTable;
- (id)_localeIdentifierForCurrentTable;
- (id)_localeIdentifierForTableIdentifier:(id)a3;
- (id)_tableIdentifierFromDefaultRotorItem:(id)a3 forLocale:(id)a4;
- (id)adjustBrailleInputLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4;
- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4;
- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4 input:(BOOL)a5;
- (id)brailleStringSetCallback;
- (id)currentBrailleTableIdentifier;
- (id)elementSetCallback;
- (id)keypressCallback;
- (id)nameForSpokenAnnouncementOfBrailleTable:(id)a3;
- (id)tableSetCallback;
- (id)testingAggregatedStatus;
- (id)testingBrailleElement;
- (int)lastRefreshTrigger;
- (int64_t)_adjustedRotorIndex:(int64_t)a3 inDirection:(int64_t)a4 rotorItems:(id)a5;
- (int64_t)_indexOfBrailleTable:(id)a3 inRotorItems:(id)a4;
- (int64_t)bookCursorPosition;
- (int64_t)inputContractionMode;
- (int64_t)outputContractionMode;
- (int64_t)trailingBookCursorPosition;
- (unint64_t)testingBrailleElementIndex;
- (unsigned)persistentKeyModifiers;
- (void)_dispatchBrailleDidPanWithSuccess:(id)a3 elementToken:(id)a4 appToken:(id)a5 direction:(id)a6 lineOffset:(id)a7;
- (void)_displayBrailleElementHint;
- (void)_exitDisplayMode;
- (void)_filterUnacceptableBrailleStrings:(id)a3;
- (void)_handleBrailleAnnouncementModeOn:(id)a3;
- (void)_handleBrailleConfigurationChanged:(id)a3;
- (void)_handleBrailleKeypress:(id)a3;
- (void)_handleBrailleNextInputTable:(id)a3;
- (void)_handleBrailleNextOutputTable:(id)a3;
- (void)_handleBraillePanBeginning:(id)a3;
- (void)_handleBraillePanEnd:(id)a3;
- (void)_handleBraillePanLeft:(id)a3;
- (void)_handleBraillePanRight:(id)a3;
- (void)_handleBraillePlayBorderHitSound;
- (void)_handleBraillePlayCommandNotSupportedSound;
- (void)_handleBraillePlayDisplayConnectionSound:(id)a3;
- (void)_handleBrailleReplaceTextRange:(id)a3 withString:(id)a4 cursor:(id)a5;
- (void)_handleBrailleRouter:(id)a3;
- (void)_handleBrailleStatusRouter:(id)a3;
- (void)_handleBrailleTable:(id)a3 input:(BOOL)a4;
- (void)_handleDisplayModeChanged:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handleStatusRouterForIndex:(int64_t)a3;
- (void)_initializeCommands;
- (void)_initializeExpandedStatusCellDictionaries;
- (void)_initiateScrodConnection;
- (void)_refreshBrailleLine;
- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5;
- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5 updateBrailleElement:(BOOL)a6;
- (void)_resetBrailleCursor;
- (void)_setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)_setBrailleElement:(id)a3 resetBrailleCursor:(id)a4 rotorSelection:(id)a5;
- (void)_setBrailleInputTable:(id)a3;
- (void)_setBrailleString:(id)a3 type:(id)a4 timeout:(id)a5 priority:(id)a6 langCode:(id)a7 brailleLineRangeValue:(id)a8;
- (void)_setBrailleSubstitutionLanguage:(id)a3;
- (void)_setBrailleTable:(id)a3;
- (void)_setCurrentDefaultTable:(id)a3;
- (void)_setInputContractionMode:(int)a3;
- (void)_thread_initiateScrodConnection;
- (void)_updateBrailleAutoAdvancePrefs;
- (void)_updateBrailleKeyDebouncePrefs;
- (void)_updateHelpEnabled;
- (void)_updateOnscreenKeyboardSettings;
- (void)_updatePrefersNonBlinkingCursorIndicatorPrefs;
- (void)_updateRealtimeElementStatus;
- (void)_updateRealtimeElementStatusFromTimer;
- (void)_updateStatusCellPrefs;
- (void)_updateStatusCells;
- (void)_updateWordWrapPrefs;
- (void)_waitForBrailleClientConnection;
- (void)announceBrailleTable:(id)a3 isDefault:(BOOL)a4;
- (void)applyBrailleSubstitutions:(id)a3;
- (void)configureForUnitTesting;
- (void)dealloc;
- (void)handleBrailleConfigurationChanged:(id)a3;
- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleDidDisconnect:(id)a3;
- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidReconnect:(id)a3;
- (void)handleBrailleDidShowNextAnnouncement:(id)a3;
- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3;
- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleKeypress:(id)a3;
- (void)handleBraillePlayBorderHitSound;
- (void)handleBraillePlayCommandNotSupportedSound;
- (void)handleBraillePlayDisplayConnectionSound:(id)a3;
- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5;
- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4;
- (void)handleBrailleStartEditing;
- (void)handleDisplayModeChanged:(id)a3;
- (void)handleEvent:(id)a3;
- (void)handleKeyboardChanged;
- (void)handleSettingsChange:(id)a3;
- (void)handleUserEventOccured;
- (void)refreshBrailleForTerminalCommand:(id)a3 cursor:(int64_t)a4;
- (void)refreshBrailleForTerminalOutput:(id)a3;
- (void)refreshBrailleLine;
- (void)resetTestingAggregatedStatus;
- (void)setAutoAdvanceEnabled:(BOOL)a3;
- (void)setBookCursorPosition:(int64_t)a3;
- (void)setBrailleElement:(id)a3;
- (void)setBrailleElement:(id)a3 resetBrailleCursor:(BOOL)a4 rotorSelection:(id)a5;
- (void)setBrailleInputTableFromSettings:(id)a3;
- (void)setBrailleString:(id)a3 type:(int)a4 timeout:(double)a5 langCode:(id)a6 brailleLineRange:(_NSRange)a7 isBrailleLineRangeKnown:(BOOL)a8;
- (void)setBrailleStringSetCallback:(id)a3;
- (void)setBrailleSubstitutionLanguage:(id)a3;
- (void)setBrailleTableFromSettings:(id)a3;
- (void)setElementSetCallback:(id)a3;
- (void)setKeypressCallback:(id)a3;
- (void)setLastRefreshTrigger:(int)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setPanEnabled:(BOOL)a3;
- (void)setPersistentKeyModifiers:(unsigned int)a3;
- (void)setPreviousElement:(id)a3;
- (void)setPreviousTouchContainer:(id)a3;
- (void)setSingleLetterQuickNavOn:(BOOL)a3;
- (void)setTableSetCallback:(id)a3;
- (void)setTestingBrailleClient:(id)a3;
- (void)setTestingBrailleElementLocked:(BOOL)a3;
- (void)setTestingHasActiveDisplay:(BOOL)a3;
- (void)setTextSearchModeOn:(BOOL)a3;
- (void)setThreadWaitTime:(double)a3;
- (void)setTrailingBookCursorPosition:(int64_t)a3;
- (void)setUsesBrailleSubstitutions:(BOOL)a3;
- (void)testingExitDisplayMode;
- (void)unitTestHandleBrailleKeypress:(id)a3;
- (void)updateBrailleAutoAdvancePrefs;
- (void)updateBrailleInputSettings;
- (void)updateBrailleLanguage;
- (void)updateBrailleOutputSettings;
- (void)updatePrefersNonBlinkingCursorIndicatorPrefs;
- (void)updateRealtimeElements:(id)a3;
- (void)updateStatusCellPrefs;
- (void)updateUsesNemethForMath;
@end

@implementation VOTBrailleManager

+ (id)manager
{
  if ((AXDeviceIsAudioAccessory(a1, a2) & 1) != 0) {
    return 0LL;
  }
  if (qword_1001ACFD0 != -1) {
    dispatch_once(&qword_1001ACFD0, &stru_1001799C8);
  }
  return (id)qword_1001ACFC8;
}

+ (double)currentDefaultBrailleAlertTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverBrailleAlertShowUntilDismissed];

  if ((v3 & 1) != 0) {
    return 1.79769313e308;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 voiceOverBrailleAlertDisplayDuration];
  double v7 = v6;

  return v7;
}

- (VOTBrailleManager)init
{
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___VOTBrailleManager;
  v2 = -[VOTBrailleManager init](&v64, "init");
  unsigned __int8 v3 = v2;
  if (v2)
  {
    -[VOTBrailleManager setThreadWaitTime:](v2, "setThreadWaitTime:", kSCRCThreadNoWait);
    v4 = objc_alloc_init(&OBJC_CLASS____VOTBrailleManagerStatus);
    status = v3->_status;
    v3->_status = v4;

    double v6 = (SCRCThreadKey *)[objc_allocWithZone(SCRCThreadKey) initWithObject:v3];
    threadKey = v3->_threadKey;
    v3->_threadKey = v6;

    -[VOTBrailleManager setUsesBrailleSubstitutions:](v3, "setUsesBrailleSubstitutions:", 1LL);
    v8 = (NSMutableCharacterSet *)[objc_allocWithZone(NSMutableCharacterSet) init];
    delimiters = v3->_delimiters;
    v3->_delimiters = v8;

    v10 = v3->_delimiters;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v11);

    v12 = v3->_delimiters;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v12, "formUnionWithCharacterSet:", v13);

    v14 = (AXIndexMap *)[objc_allocWithZone(AXIndexMap) init];
    commands = v3->_commands;
    v3->_commands = v14;

    -[VOTBrailleManager _initializeCommands](v3, "_initializeCommands");
    -[VOTBrailleManager _updateStatusCellPrefs](v3, "_updateStatusCellPrefs");
    -[VOTBrailleManager performSelector:withObject:afterDelay:]( v3,  "performSelector:withObject:afterDelay:",  "updateBrailleLanguage",  0LL,  1.0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_1000B8FE4,  kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v17,  v3,  (CFNotificationCallback)sub_1000B8FFC,  kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1000B9014;
    v61[3] = &unk_100176F08;
    objc_copyWeak(&v62, &location);
    [v18 registerUpdateBlock:v61 forRetrieveSelector:"voiceOverBrailleGradeTwoAutoTranslateEnabled" withListener:v3];

    objc_destroyWeak(&v62);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1000B9040;
    v59[3] = &unk_100176F08;
    objc_copyWeak(&v60, &location);
    [v19 registerUpdateBlock:v59 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputMode" withListener:v3];

    objc_destroyWeak(&v60);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1000B906C;
    v57[3] = &unk_100176F08;
    objc_copyWeak(&v58, &location);
    [v20 registerUpdateBlock:v57 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputMode" withListener:v3];

    objc_destroyWeak(&v58);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_1000B9098;
    v55[3] = &unk_100176F08;
    objc_copyWeak(&v56, &location);
    id v22 = objc_loadWeakRetained(&location);
    [v21 registerUpdateBlock:v55 forRetrieveSelector:"voiceOverShowSoftwareKeyboardWithBraille" withListener:v22];

    objc_destroyWeak(&v56);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_1000B90C4;
    v53[3] = &unk_100176F08;
    objc_copyWeak(&v54, &location);
    [v23 registerUpdateBlock:v53 forRetrieveSelector:"voiceOverTouchBrailleShowTextStyleStatus" withListener:v3];

    objc_destroyWeak(&v54);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1000B90F0;
    v51[3] = &unk_100176F08;
    objc_copyWeak(&v52, &location);
    [v24 registerUpdateBlock:v51 forRetrieveSelector:"voiceOverTouchBrailleShowGeneralStatus" withListener:v3];

    objc_destroyWeak(&v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1000B911C;
    v49[3] = &unk_100176F08;
    objc_copyWeak(&v50, &location);
    [v25 registerUpdateBlock:v49 forRetrieveSelector:"voiceOverBrailleWordWrapEnabled" withListener:v3];

    objc_destroyWeak(&v50);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000B9148;
    v47[3] = &unk_100176F08;
    objc_copyWeak(&v48, &location);
    [v26 registerUpdateBlock:v47 forRetrieveSelector:"voiceOverBrailleKeyDebounceTimeout" withListener:v3];

    objc_destroyWeak(&v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000B9174;
    v45[3] = &unk_100176F08;
    objc_copyWeak(&v46, &location);
    [v27 registerUpdateBlock:v45 forRetrieveSelector:"voiceOverTouchUpdateBrailleWithoutConnectedDisplay" withListener:v3];

    objc_destroyWeak(&v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000B91CC;
    v43[3] = &unk_100176F08;
    objc_copyWeak(&v44, &location);
    [v28 registerUpdateBlock:v43 forRetrieveSelector:"voiceOverBrailleAutoAdvanceDuration" withListener:v3];

    objc_destroyWeak(&v44);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v3 selector:"_updateHelpEnabled" name:@"VOTHelpEnabledChangedNotification" object:0];

    -[VOTBrailleManager _updateHelpEnabled](v3, "_updateHelpEnabled");
    v3->_lastBraillePanDirection = -1;
    v3->_lastRefreshTrigger = 0;
    v3->_bookCursorPosition = -1LL;
    v3->_trailingBookCursorPosition = -1LL;
    v30 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v3 selector:"_displayBrailleElementHint" threadKey:v3->_threadKey];
    hintTimer = v3->_hintTimer;
    v3->_hintTimer = v30;

    v32 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v3 selector:"_updateRealtimeElementStatusFromTimer" threadKey:v3->_threadKey];
    updateRealtimeStatusTimer = v3->_updateRealtimeStatusTimer;
    v3->_updateRealtimeStatusTimer = v32;

    -[VOTBrailleManager _resetBrailleCursor](v3, "_resetBrailleCursor");
    v34 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    brailleClientConnectionCondition = v3->_brailleClientConnectionCondition;
    v3->_brailleClientConnectionCondition = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    LODWORD(v13) = [v36 voiceOverTouchUpdateBrailleWithoutConnectedDisplay];

    if ((_DWORD)v13) {
      v3->_hasActiveDisplay = 1;
    }
    v3->_panEnabled = 1;
    v3->_lastPanTime = 0.0;
    v37 = objc_opt_new(&OBJC_CLASS___NSLock);
    keyboardVirtualDisplayLock = v3->_keyboardVirtualDisplayLock;
    v3->_keyboardVirtualDisplayLock = v37;

    v39 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    keyboardVirtualDisplayDownKeys = v3->_keyboardVirtualDisplayDownKeys;
    v3->_keyboardVirtualDisplayDownKeys = v39;

    -[VOTBrailleManager _initiateScrodConnection](v3, "_initiateScrodConnection");
    v41 = v3;
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTBrailleManager;
  -[VOTBrailleManager dealloc](&v4, "dealloc");
}

- (void)_initiateScrodConnection
{
}

- (void)_thread_initiateScrodConnection
{
  uint64_t v3 = VOTLogBraille(self, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initiate scrod connection; create _brailleClient",
      buf,
      2u);
  }

  v5 = (SCROBrailleClient *)[objc_allocWithZone(SCROBrailleClient) initWithDelegate:self];
  brailleClient = self->_brailleClient;
  self->_brailleClient = v5;

  -[SCROBrailleClient setKeepConnectionAlive:](self->_brailleClient, "setKeepConnectionAlive:", 1LL);
  -[VOTBrailleManager _waitForBrailleClientConnection](self, "_waitForBrailleClientConnection");
  -[SCROBrailleClient setDisplayDescriptorCallbackEnabled:]( self->_brailleClient,  "setDisplayDescriptorCallbackEnabled:",  0LL);
  -[VOTBrailleManager updateBrailleInputSettings](self, "updateBrailleInputSettings");
  -[VOTBrailleManager updateBrailleOutputSettings](self, "updateBrailleOutputSettings");
  -[VOTBrailleManager _updateWordWrapPrefs](self, "_updateWordWrapPrefs");
  -[VOTBrailleManager _updateBrailleKeyDebouncePrefs](self, "_updateBrailleKeyDebouncePrefs");
  -[VOTBrailleManager _updateBrailleAutoAdvancePrefs](self, "_updateBrailleAutoAdvancePrefs");
  -[VOTBrailleManager _updatePrefersNonBlinkingCursorIndicatorPrefs]( self,  "_updatePrefersNonBlinkingCursorIndicatorPrefs");
  -[VOTBrailleManager _setBrailleTable:](self, "_setBrailleTable:", self->_currentDefaultTable);
  -[VOTBrailleManager _setBrailleInputTable:](self, "_setBrailleInputTable:", self->_currentDefaultTable);
  -[VOTBrailleManager updateUsesNemethForMath](self, "updateUsesNemethForMath");
  _AXSBrailleInputDeviceSetConnected(-[VOTBrailleManager bluetoothBrailleDisplayConnected](self, "bluetoothBrailleDisplayConnected"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000B9414,  kSCRODisplayConfigurationChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = -[VOTBrailleManager _handleBrailleConfigurationChanged:]( self,  "_handleBrailleConfigurationChanged:",  &__kCFBooleanTrue);
  uint64_t v10 = VOTLogBraille(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Posting kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification",  v16,  2u);
  }

  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v12, kAXSVoiceOverTouchBrailleReconnectionTriggeredNotification, 0LL, 0LL, 1u);
  uint64_t v15 = VOSCrystalMigrateBrailleTableReplacements(v13, v14);
  VOSRepairBrailleTableSettings(v15);
}

- (void)updateBrailleOutputSettings
{
  id v2 = [(id)VOTSharedWorkspace activeBrailleOutputPreference];
  uint64_t v3 = AXLogBrailleHW();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = (_DWORD)v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Braille output updated: %d", (uint8_t *)v9, 8u);
  }

  if (v2 == (id)3)
  {
    uint64_t v5 = _AXSVoiceOverTouchBrailleContractionMode();
    if (!v5)
    {
LABEL_11:
      uint64_t v7 = 0LL;
      goto LABEL_17;
    }

    uint64_t v6 = 0LL;
LABEL_10:
    uint64_t v5 = _AXSVoiceOverTouchSetBrailleContractionMode(v6);
    goto LABEL_11;
  }

  if (v2 != (id)2)
  {
    if (v2 != (id)1) {
      return;
    }
    uint64_t v5 = _AXSVoiceOverTouchBrailleContractionMode();
    if (v5 == 1) {
      goto LABEL_11;
    }
    uint64_t v6 = 1LL;
    goto LABEL_10;
  }

  uint64_t v8 = _AXSVoiceOverTouchBrailleContractionMode();
  if (v8 != 1) {
    uint64_t v8 = _AXSVoiceOverTouchSetBrailleContractionMode(1LL);
  }
  if (_AXSVoiceOverTouchBrailleEightDotMode(v8) != 1)
  {
    uint64_t v7 = 1LL;
LABEL_17:
    _AXSVoiceOverTouchSetBrailleEightDotMode(v7);
  }

- (void)updateBrailleInputSettings
{
  id v3 = [(id)VOTSharedWorkspace activeBrailleInputPreference];
  uint64_t v4 = AXLogBrailleHW();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = (_DWORD)v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Braille input updated: %d", (uint8_t *)v7, 8u);
  }

  -[VOTBrailleManager _setInputContractionMode:](self, "_setInputContractionMode:", v3 != (id)3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTBrailleManager _setAutomaticBrailleTranslationEnabled:]( self,  "_setAutomaticBrailleTranslationEnabled:",  [v6 voiceOverBrailleGradeTwoAutoTranslateEnabled]);
}

- (void)_setInputContractionMode:(int)a3
{
  if (self->_cachedContractionMode != a3)
  {
    self->_cachedContractionMode = a3;
    -[SCROBrailleClient setInputContractionMode:](self->_brailleClient, "setInputContractionMode:");
  }

- (void)_setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  if (self->_cachedAutoBrailleTranslationEnabled != a3)
  {
    self->_cachedAutoBrailleTranslationEnabled = a3;
    -[SCROBrailleClient setAutomaticBrailleTranslationEnabled:]( self->_brailleClient,  "setAutomaticBrailleTranslationEnabled:");
  }

- (void)_waitForBrailleClientConnection
{
  if ((-[SCROBrailleClient isConnected](self->_brailleClient, "isConnected") & 1) == 0)
  {
    brailleClientConnectionCondition = self->_brailleClientConnectionCondition;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    -[NSCondition waitUntilDate:](brailleClientConnectionCondition, "waitUntilDate:", v4);
  }

  -[NSCondition unlock](self->_brailleClientConnectionCondition, "unlock");
}

- (void)updateRealtimeElements:(id)a3
{
  self->_lastRealtimeUpdate = CFAbsoluteTimeGetCurrent();
}

- (void)_updateRealtimeElementStatusFromTimer
{
}

- (void)_updateRealtimeElementStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self->_brailleElement, "application"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 realtimeElements]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6)
  {
    unsigned __int8 v8 = 0;
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }

  id v7 = v6;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      if (!-[VOTElement isEqual:](self->_brailleElement, "isEqual:", v12, (void)v21))
      {
        if ((v9 & 1) != 0)
        {
          unsigned __int8 v9 = 1;
          if ((v8 & 1) == 0) {
            goto LABEL_9;
          }
        }

        else
        {
          unsigned __int8 v9 = [v12 realtimeElementUnread];
          if ((v8 & 1) == 0)
          {
LABEL_9:
            unsigned __int8 v8 = [v12 realtimeElementCompleted];
            continue;
          }
        }

        unsigned __int8 v8 = 1;
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }

  while (v7);
LABEL_16:

  -[_VOTBrailleManagerStatus setShowRealtime:](self->_status, "setShowRealtime:", [v5 count] != 0);
  if ((v9 & 1) == 0)
  {
    -[_VOTBrailleManagerStatus setRealtimeBlinking:](self->_status, "setRealtimeBlinking:", 0LL);
    LOBYTE(v17) = 0;
    goto LABEL_34;
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  status = self->_status;
  if ((Current - self->_lastRealtimeUpdate > 3.0) | v8 & 1)
  {
    unsigned int v15 = -[_VOTBrailleManagerStatus realtimeBlinking](status, "realtimeBlinking");
    v16 = self->_status;
    if (v15)
    {
      -[_VOTBrailleManagerStatus setRealtimeBlinkIsUp:]( self->_status,  "setRealtimeBlinkIsUp:",  -[_VOTBrailleManagerStatus realtimeBlinkIsUp](v16, "realtimeBlinkIsUp") ^ 1);
    }

    else
    {
      -[_VOTBrailleManagerStatus setRealtimeBlinking:](v16, "setRealtimeBlinking:", 1LL);
      -[_VOTBrailleManagerStatus setRealtimeBlinkIsUp:](self->_status, "setRealtimeBlinkIsUp:", 1LL);
      -[_VOTBrailleManagerStatus setRealtimeSpinnerCount:](self->_status, "setRealtimeSpinnerCount:", 0LL);
    }
  }

  else
  {
    -[_VOTBrailleManagerStatus setRealtimeBlinking:](status, "setRealtimeBlinking:", 0LL);
  }

  -[_VOTBrailleManagerStatus setRealtime:](self->_status, "setRealtime:", 0LL);
  unsigned int v18 = -[_VOTBrailleManagerStatus realtimeBlinking](self->_status, "realtimeBlinking");
  v19 = self->_status;
  if (v18)
  {
    if (-[_VOTBrailleManagerStatus realtimeBlinkIsUp](v19, "realtimeBlinkIsUp"))
    {
      -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 2);
      -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 4);
      -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0x10);
      -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0x20);
      if ((v8 & 1) != 0)
      {
        -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 1);
        -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 8);
        -[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0x40);
        unsigned int v17 = -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0xFFFFFF80;
        goto LABEL_34;
      }
    }
  }

  else
  {
    unint64_t v20 = -[_VOTBrailleManagerStatus realtimeSpinnerCount](v19, "realtimeSpinnerCount") & 3;
    if ((!v20
       || (-[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 2),  v20 != 1))
      && (-[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0x10),  v20 == 2)
      || (-[_VOTBrailleManagerStatus setRealtime:]( self->_status,  "setRealtime:",  -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 0x20),  v20 != 3))
    {
      unsigned int v17 = -[_VOTBrailleManagerStatus realtime](self->_status, "realtime") | 4;
LABEL_34:
      -[_VOTBrailleManagerStatus setRealtime:](self->_status, "setRealtime:", v17, (void)v21);
    }
  }

  -[VOTBrailleManager _updateStatusCells](self, "_updateStatusCells");
}

- (BOOL)hasActiveBrailleDisplay
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (-[VOTBrailleManager _isActiveUserDisplayConfig:](self, "_isActiveUserDisplayConfig:", v8))
        {
          unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCROBrailleDisplayPostsKeyboardEvents]);
          unsigned __int8 v10 = [v9 BOOLValue];

          if ((v10 & 1) != 0)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4
{
  return -[VOTBrailleManager adjustBrailleLanguageRotorInDirection:isDefault:input:]( self,  "adjustBrailleLanguageRotorInDirection:isDefault:input:",  a3,  a4,  0LL);
}

- (id)adjustBrailleInputLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4
{
  return -[VOTBrailleManager adjustBrailleLanguageRotorInDirection:isDefault:input:]( self,  "adjustBrailleLanguageRotorInDirection:isDefault:input:",  a3,  a4,  1LL);
}

- (id)adjustBrailleLanguageRotorInDirection:(int64_t)a3 isDefault:(BOOL *)a4 input:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace brailleLanguageRotorItems]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &stru_100179A08));

  if (v5) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleInputTable]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleTable]);
  }
  v12 = (void *)v11;
  id v13 = [v10 count];
  uint64_t v15 = VOTLogBraille(v13, v14);
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v17)
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v10 debugDescription]);
      int v36 = 134218498;
      int64_t v37 = a3;
      __int16 v38 = 2112;
      v39 = v12;
      __int16 v40 = 2112;
      v41 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Handling braille language rotor movement. dir:%ld selected:%@, items:%@",  (uint8_t *)&v36,  0x20u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "objectAtIndexedSubscript:",  -[VOTBrailleManager _adjustedRotorIndex:inDirection:rotorItems:]( self,  "_adjustedRotorIndex:inDirection:rotorItems:",  -[VOTBrailleManager _indexOfBrailleTable:inRotorItems:]( self,  "_indexOfBrailleTable:inRotorItems:",  v12,  v10),  a3,  v10)));
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"RotorItem"]);
    uint64_t v21 = VOSBrailleTableForRotorItem(v19);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 tableIdentifier]);

    if (v5) {
      [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v22];
    }
    else {
      [(id)VOTSharedWorkspace setSelectedBrailleTable:v22];
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v27 = [v26 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 activeKeyboard]);
    if (v28 && v27 | v5)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v25 currentSoftwareKeyboardLanguage]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v25 currentSoftwareKeyboardLayout]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v31 setPreferredBrailleTableIdentifier:v23 forKeyboardLanguage:v29 keyboardLayout:v30];
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    v33 = v32;
    if (v5) {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v32 brailleInputTableFromSettings]);
    }
    else {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v32 brailleTableFromSettings]);
    }
    __int128 v24 = (void *)v34;
  }

  else
  {
    if (v17)
    {
      int v36 = 134218242;
      int64_t v37 = a3;
      __int16 v38 = 2112;
      v39 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Handling braille language rotor movement with empty braille language list. dir:%ld selected:%@",  (uint8_t *)&v36,  0x16u);
    }

    __int128 v24 = 0LL;
    if (a4) {
      *a4 = 0;
    }
  }

  return v24;
}

- (void)announceBrailleTable:(id)a3 isDefault:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)VOTSharedWorkspace;
  id v7 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue([v6 brailleLanguageRotorItems]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userLocale]);
  LOBYTE(self) = -[VOTBrailleManager _shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:rotorItems:locale:]( self,  "_shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:rotorItems:locale:",  v7,  v16,  v9);

  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 localizedName]);
  }
  uint64_t v11 = (void *)v10;

  if (v4)
  {
    id v12 = sub_10004A988(off_1001AC148, @"default.language.format", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v11));
  }

  else
  {
    id v14 = v11;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v15 speakSimpleString:v14];
}

- (int64_t)_indexOfBrailleTable:(id)a3 inRotorItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    int64_t v7 = 0LL;
    while (1)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
      unsigned __int8 v9 = v8;
      if (!v5)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Default"]);
        unsigned int v11 = [v10 BOOLValue];

        if (v11) {
          break;
        }
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"RotorItem"]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      unsigned int v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_7:
    int64_t v7 = 0LL;
  }

- (BOOL)_shouldIncludeServiceNameForSpokenBrailleRotorAnnouncementOfTable:(id)a3 rotorItems:(id)a4 locale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0LL;
    id v28 = v10;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", @"Default", v28));
      unsigned int v15 = [v14 BOOLValue];

      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"LanguageDefaults"]);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v29 localeIdentifier]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

        if (!v18)
        {
          v19 = 0LL;
          goto LABEL_15;
        }

        v19 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v18);
      }

      else
      {
        unint64_t v20 = objc_alloc(&OBJC_CLASS___BRLTTable);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"RotorItem"]);
        v19 = -[BRLTTable initWithIdentifier:](v20, "initWithIdentifier:", v16);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable serviceIdentifier](v19, "serviceIdentifier"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceIdentifier]);
      if (![v16 isEqualToString:v21])
      {
        __int128 v22 = v19;
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedName](v19, "localizedName"));
        id v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedName]);
        unsigned int v31 = [v23 isEqualToString:v25];

        if (v31)
        {

          BOOL v26 = 1;
          id v7 = v24;
          goto LABEL_20;
        }

        id v7 = v24;
        id v10 = v28;
        v19 = v22;
        goto LABEL_16;
      }

LABEL_15:
LABEL_16:

      if (v10 == (id)++v12)
      {
        id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v26 = 0;
LABEL_20:

  return v26;
}

- (id)nameForSpokenAnnouncementOfBrailleTable:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace brailleLanguageRotorItems]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v5) {
    goto LABEL_17;
  }
  id v6 = v5;
  uint64_t v24 = 0LL;
  char v7 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = VOSBrailleTableForRotorItem(*(void *)(*((void *)&v25 + 1) + 8LL * (void)i));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedLanguage]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedLanguage]);
        unsigned int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedName]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedName]);
          unsigned __int8 v20 = [v18 isEqualToString:v19];

          v7 |= v20;
          LOBYTE(v24) = 1;
        }

        else
        {
          BYTE4(v24) = 1;
        }
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }

  while (v6);
  if ((v7 & 1) != 0)
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 localizedNameWithService]);
    goto LABEL_18;
  }

  if ((v24 & 0x100000000LL) == 0)
  {
LABEL_17:
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 localizedVariant]);
    goto LABEL_18;
  }

  if ((v24 & 1) != 0) {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 localizedName]);
  }
  else {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 localizedLanguage]);
  }
LABEL_18:
  __int128 v22 = (void *)v21;

  return v22;
}

- (int64_t)_adjustedRotorIndex:(int64_t)a3 inDirection:(int64_t)a4 rotorItems:(id)a5
{
  if (a4 == 2) {
    int64_t v5 = a3 - 1;
  }
  else {
    int64_t v5 = a3 + 1;
  }
  id v6 = [a5 count];
  else {
    int64_t v7 = v5;
  }
  if (v5 >= 0) {
    return v7;
  }
  else {
    return (int64_t)v6 - 1;
  }
}

- (void)handleKeyboardChanged
{
  if (-[VOTElement doesHaveAllTraits:]( self->_brailleElement,  "doesHaveAllTraits:",  kAXTextEntryTrait | kAXIsEditingTrait))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v13 currentSoftwareKeyboardLanguage]);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v13 currentSoftwareKeyboardLayout]);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredBrailleTableIdentifierForKeyboardLanguage:v3 keyboardLayout:v4]);

    if (v6)
    {
      int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable tableIdentifier](self->_currentSetTable, "tableIdentifier"));
      unsigned __int8 v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v6);
        if (v9) {
          -[VOTBrailleManager _setBrailleTable:](self, "_setBrailleTable:", v9);
        }
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable tableIdentifier](self->_currentSetInputTable, "tableIdentifier"));
      unsigned __int8 v11 = [v6 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v6);
        if (v12) {
          -[VOTBrailleManager _setBrailleInputTable:](self, "_setBrailleInputTable:", v12);
        }
      }
    }
  }

- (void)updateBrailleLanguage
{
  id v3 = [(id)VOTSharedWorkspace inUnitTestMode];
  if ((v3 & 1) == 0)
  {
    VOSCrystalMigrateBrailleTableReplacements(v3, v4);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceOverTouchBrailleDisplayOutputTableIdentifier]);

    if (v6)
    {
      int64_t v7 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v6);
      [(id)VOTSharedWorkspace setSelectedBrailleTable:v7];
    }

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceOverTouchBrailleDisplayInputTableIdentifier]);

    if (v9)
    {
      uint64_t v10 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v9);
      [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v10];
    }
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 brailleTableFromSettings]);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 brailleInputTableFromSettings]);

  uint64_t v16 = BRLLogTranslation();
  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    __int128 v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Current table updated: %@", (uint8_t *)&v22, 0xCu);
  }

  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setCurrentDefaultTable:",  threadKey,  0LL,  1LL,  v13);
  v19 = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleTable:",  v19,  0LL,  1LL,  v13);
  unsigned __int8 v20 = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleInputTable:",  v20,  0LL,  1LL,  v15);
  uint64_t v21 = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleSubstitutionLanguage:",  v21,  0LL,  1LL,  v11);
}

- (void)_setCurrentDefaultTable:(id)a3
{
}

- (void)_setBrailleTable:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = BRLLogTranslation();
    int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting braille table %@", (uint8_t *)&v12, 0xCu);
    }

    objc_storeStrong((id *)&self->_currentSetTable, a3);
    brailleClient = self->_brailleClient;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    -[SCROBrailleClient setTableIdentifier:](brailleClient, "setTableIdentifier:", v9);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager tableSetCallback](self, "tableSetCallback"));
    if (v10)
    {
      unsigned __int8 v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[VOTBrailleManager tableSetCallback](self, "tableSetCallback"));
      ((void (**)(void, id))v11)[2](v11, v5);
    }
  }
}

- (void)_setBrailleInputTable:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = BRLLogTranslation();
    int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Setting braille input table %@",  (uint8_t *)&v10,  0xCu);
    }

    objc_storeStrong((id *)&self->_currentSetInputTable, a3);
    brailleClient = self->_brailleClient;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    -[SCROBrailleClient setInputTableIdentifier:](brailleClient, "setInputTableIdentifier:", v9);
  }
}

- (void)_setBrailleSubstitutionLanguage:(id)a3
{
}

- (void)updateUsesNemethForMath
{
  brailleClient = self->_brailleClient;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[SCROBrailleClient setAlwaysUsesNemethCodeForTechnicalText:]( brailleClient,  "setAlwaysUsesNemethCodeForTechnicalText:",  [v3 voiceOverAlwaysUseNemethCodeForMathEnabled]);
}

- (void)setTextSearchModeOn:(BOOL)a3
{
}

- (BOOL)_languageIsCJK
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self->_currentSetTable, "language"));
  if ([v3 hasPrefix:@"yue"])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self->_currentSetTable, "language"));
    if ([v5 hasPrefix:@"cmn"])
    {
      unsigned __int8 v4 = 1;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self->_currentSetTable, "language"));
      if ([v6 hasPrefix:@"kor"])
      {
        unsigned __int8 v4 = 1;
      }

      else
      {
        int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self->_currentSetTable, "language"));
        unsigned __int8 v4 = [v7 hasPrefix:@"jpn"];
      }
    }
  }

  return v4;
}

- (BOOL)_languageIsNBSC
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable identifier](self->_currentSetTable, "identifier"));
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.scrod.braille.table.nbsc"];

  return v3;
}

- (void)handleSettingsChange:(id)a3
{
  if ([a3 isEqualToString:kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification]) {
    -[VOTBrailleManager updateStatusCellPrefs](self, "updateStatusCellPrefs");
  }
}

- (void)updateStatusCellPrefs
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_updateStatusCellPrefs",  threadKey,  0LL,  0LL,  0LL);
}

- (void)updatePrefersNonBlinkingCursorIndicatorPrefs
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_updatePrefersNonBlinkingCursorIndicatorPrefs",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_updatePrefersNonBlinkingCursorIndicatorPrefs
{
  int v3 = _AXSPrefersNonBlinkingCursorIndicator(self, a2);
  if ((objc_opt_respondsToSelector(self->_brailleClient, "setBlinkEnabled:") & 1) != 0) {
    -[SCROBrailleClient setBlinkEnabled:](self->_brailleClient, "setBlinkEnabled:", v3 == 0);
  }
}

- (void)handleEvent:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleEvent:",  threadKey,  0LL,  1LL,  v5);
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v5 userEventOccurred];

  commands = self->_commands;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[AXIndexMap objectForIndex:](commands, "objectForIndex:", [v7 hash]));

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v9 target]);
  objc_msgSend(v8, "performSelector:withObject:", objc_msgSend(v9, "selector"), v4);
}

- (void)_initializeCommands
{
  commands = self->_commands;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBraillePanLeft:"));
  -[AXIndexMap setObject:forIndex:]( commands,  "setObject:forIndex:",  v4,  [kVOTEventCommandBraillePanLeft hash]);

  id v5 = self->_commands;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBraillePanRight:"));
  -[AXIndexMap setObject:forIndex:]( v5,  "setObject:forIndex:",  v6,  [kVOTEventCommandBraillePanRight hash]);

  int64_t v7 = self->_commands;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBraillePanBeginning:"));
  -[AXIndexMap setObject:forIndex:]( v7,  "setObject:forIndex:",  v8,  [kVOTEventCommandBraillePanBeginning hash]);

  id v9 = self->_commands;
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBraillePanEnd:"));
  -[AXIndexMap setObject:forIndex:](v9, "setObject:forIndex:", v10, [kVOTEventCommandBraillePanEnd hash]);

  id v11 = self->_commands;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleNextInputTable:"));
  -[AXIndexMap setObject:forIndex:]( v11,  "setObject:forIndex:",  v12,  [kVOTEventCommandBrailleNextInputTable hash]);

  id v13 = self->_commands;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleNextOutputTable:"));
  -[AXIndexMap setObject:forIndex:]( v13,  "setObject:forIndex:",  v14,  [kVOTEventCommandBrailleNextOutputTable hash]);

  unsigned int v15 = self->_commands;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleAnnouncementModeOn:"));
  -[AXIndexMap setObject:forIndex:]( v15,  "setObject:forIndex:",  v16,  [kVOTEventCommandBrailleAnnouncementModeOn hash]);

  unsigned int v17 = self->_commands;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleRouter:"));
  -[AXIndexMap setObject:forIndex:]( v17,  "setObject:forIndex:",  v18,  [kVOTEventCommandBrailleRouter hash]);

  v19 = self->_commands;
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleStatusRouter:"));
  -[AXIndexMap setObject:forIndex:]( v19,  "setObject:forIndex:",  v20,  [kVOTEventCommandBrailleStatusRouter hash]);

  uint64_t v21 = self->_commands;
  id v22 = (id)objc_claimAutoreleasedReturnValue( +[SCRCTargetSelector targetSelectorWithTarget:selector:]( &OBJC_CLASS___SCRCTargetSelector,  "targetSelectorWithTarget:selector:",  self,  "_handleBrailleTranslate:"));
  -[AXIndexMap setObject:forIndex:]( v21,  "setObject:forIndex:",  v22,  [kVOTEventCommandBrailleTranslate hash]);
}

- (void)_handleBraillePanLeft:(id)a3
{
  id v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    -[VOTBrailleManager setPanEnabled:](self, "setPanEnabled:", 1LL);
  }
  if (-[VOTBrailleManager panEnabled](self, "panEnabled"))
  {
    self->_lastPanTime = Current;
    id v5 = (SCROBrailleKey *)objc_claimAutoreleasedReturnValue([v7 objectForIndex:104]);
    if (!v5)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SCROBrailleKey);
      -[SCROBrailleKey setDisplayToken:](v5, "setDisplayToken:", self->_primaryDisplayToken);
    }

    -[SCROBrailleClient panDisplayLeft:]( self->_brailleClient,  "panDisplayLeft:",  -[SCROBrailleKey displayToken](v5, "displayToken"));
  }

  else
  {
    id v5 = (SCROBrailleKey *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent UnknownCommand](&OBJC_CLASS___VOSOutputEvent, "UnknownCommand"));
    -[SCROBrailleKey sendEvent:](v5, "sendEvent:", v6);
  }
}

- (void)_handleBraillePanBeginning:(id)a3
{
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    -[VOTBrailleManager setPanEnabled:](self, "setPanEnabled:", 1LL);
  }
  if (-[VOTBrailleManager panEnabled](self, "panEnabled"))
  {
    self->_lastPanTime = Current;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForIndex:104]);
    uint64_t v6 = v5;
    if (v5) {
      -[SCROBrailleClient panDisplayBeginning:]( self->_brailleClient,  "panDisplayBeginning:",  [v5 displayToken]);
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent UnknownCommand](&OBJC_CLASS___VOSOutputEvent, "UnknownCommand"));
    [v6 sendEvent:v7];
  }
}

- (void)_handleBraillePanEnd:(id)a3
{
  id v8 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    -[VOTBrailleManager setPanEnabled:](self, "setPanEnabled:", 1LL);
  }
  if (-[VOTBrailleManager panEnabled](self, "panEnabled"))
  {
    self->_lastPanTime = Current;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForIndex:104]);
    uint64_t v6 = v5;
    if (v5) {
      -[SCROBrailleClient panDisplayEnd:](self->_brailleClient, "panDisplayEnd:", [v5 displayToken]);
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent UnknownCommand](&OBJC_CLASS___VOSOutputEvent, "UnknownCommand"));
    [v6 sendEvent:v7];
  }
}

- (void)_handleBraillePanRight:(id)a3
{
  id v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastPanTime > 2.0) {
    -[VOTBrailleManager setPanEnabled:](self, "setPanEnabled:", 1LL);
  }
  if (-[VOTBrailleManager panEnabled](self, "panEnabled"))
  {
    self->_lastPanTime = Current;
    id v5 = (SCROBrailleKey *)objc_claimAutoreleasedReturnValue([v7 objectForIndex:104]);
    if (!v5)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SCROBrailleKey);
      -[SCROBrailleKey setDisplayToken:](v5, "setDisplayToken:", self->_primaryDisplayToken);
    }

    -[SCROBrailleClient panDisplayRight:]( self->_brailleClient,  "panDisplayRight:",  -[SCROBrailleKey displayToken](v5, "displayToken"));
  }

  else
  {
    id v5 = (SCROBrailleKey *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent UnknownCommand](&OBJC_CLASS___VOSOutputEvent, "UnknownCommand"));
    -[SCROBrailleKey sendEvent:](v5, "sendEvent:", v6);
  }
}

- (BOOL)_supportsMode:(int64_t)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier(self, a2);
  id v5 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v4);
  uint64_t v6 = v5;
  if (a3 == 2)
  {
    if (v4)
    {
      unsigned __int8 v7 = -[BRLTTable supportsTranslationMode8Dot](v5, "supportsTranslationMode8Dot");
      goto LABEL_7;
    }

- (int64_t)outputContractionMode
{
  unsigned int v3 = -[SCROBrailleClient contractionMode](self->_brailleClient, "contractionMode");
  unsigned int v4 = -[SCROBrailleClient showEightDotBraille](self->_brailleClient, "showEightDotBraille");
  uint64_t v5 = 3LL;
  if (v3) {
    uint64_t v5 = 1LL;
  }
  if (v3 == 1 && v4 == 1) {
    int64_t v7 = 2LL;
  }
  else {
    int64_t v7 = v5;
  }
  if (v3 == 1 && v4 == 0) {
    return 1LL;
  }
  else {
    return v7;
  }
}

- (int64_t)inputContractionMode
{
  unsigned int v3 = -[SCROBrailleClient inputContractionMode](self->_brailleClient, "inputContractionMode");
  unsigned int v4 = -[SCROBrailleClient inputEightDotBraille](self->_brailleClient, "inputEightDotBraille");
  uint64_t v5 = 3LL;
  if (v3) {
    uint64_t v5 = 1LL;
  }
  if (v3 == 1 && v4 == 1) {
    int64_t v7 = 2LL;
  }
  else {
    int64_t v7 = v5;
  }
  if (v3 == 1 && v4 == 0) {
    return 1LL;
  }
  else {
    return v7;
  }
}

- (void)_handleBrailleTable:(id)a3 input:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)VOTSharedWorkspace, "brailleLanguageRotorItems", a3));
  id v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &stru_100179A28));

  if (v4) {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleInputTable]);
  }
  else {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleTable]);
  }
  BOOL v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if ([v33 count])
  {
    unint64_t v10 = 1LL;
    while (1)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:v10 - 1]);
      uint64_t v12 = VOSBrailleTableForRotorItem(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    }

    if ([v33 count] == (id)v10) {
      unint64_t v16 = 0LL;
    }
    else {
      unint64_t v16 = v10;
    }
  }

  else
  {
LABEL_9:
    unint64_t v16 = 0LL;
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:v16]);
  uint64_t v18 = VOSBrailleTableForRotorItem(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (!v4)
  {
    [(id)VOTSharedWorkspace setSelectedBrailleTable:v19];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v25 = [v24 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    id v22 = off_1001AC148;
    if (!v25)
    {
      __int128 v23 = @"braille.output.format.change";
      goto LABEL_20;
    }

    goto LABEL_18;
  }

  [(id)VOTSharedWorkspace setSelectedBrailleInputTable:v19];
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v21 = [v20 voiceOverTouchBrailleDisplaySyncInputOutputTables];

  id v22 = off_1001AC148;
  if (v21)
  {
LABEL_18:
    __int128 v23 = @"braille.table.format.change";
    goto LABEL_20;
  }

  __int128 v23 = @"braille.input.format.change";
LABEL_20:
  id v26 = sub_10004A988(v22, v23, 0LL);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager nameForSpokenAnnouncementOfBrailleTable:]( self,  "nameForSpokenAnnouncementOfBrailleTable:",  v19));
  uint64_t v29 = AXCFormattedString(v27, @"%@");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest", v28);
  id v32 = [v31 addString:v30];
  [v31 setGeneratesBraille:1];
  [v31 setBrailleType:2];
  [v31 send];
  -[VOTBrailleManager updateBrailleLanguage](self, "updateBrailleLanguage");
}

- (void)_handleBrailleNextInputTable:(id)a3
{
}

- (void)_handleBrailleNextOutputTable:(id)a3
{
}

- (void)_exitDisplayMode
{
}

- (void)testingExitDisplayMode
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_exitDisplayMode",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_handleBrailleAnnouncementModeOn:(id)a3
{
  unsigned int v4 = -[SCROBrailleClient displayMode](self->_brailleClient, "displayMode", a3);
  brailleClient = self->_brailleClient;
  if (v4 == 2) {
    -[SCROBrailleClient exitCurrentDisplayMode](brailleClient, "exitCurrentDisplayMode");
  }
  else {
    -[SCROBrailleClient setAnnouncementsDisplayMode](brailleClient, "setAnnouncementsDisplayMode");
  }
}

- (void)_handleBrailleRouter:(id)a3
{
  self->_lastBraillePanDirection = -1;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForIndex:104]);
  uint64_t v5 = v4;
  if (v4 && self->_brailleElement)
  {
    if ([v4 getRouterIndex:v38 token:&v37 location:&v36 appToken:0]
      && v37 == self->_brailleElementIndex)
    {
      unsigned int v6 = -[VOTElement brailleTextEntrySupported](self->_brailleElement, "brailleTextEntrySupported");
      brailleElement = self->_brailleElement;
      if (v6)
      {
        BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](brailleElement, "textInputElement"));
        if (!v8) {
          BOOL v8 = self->_brailleElement;
        }
        if (self->_brailleLineRange.location == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_21;
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v8, "value"));
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "substringWithRange:",  self->_brailleLineRange.location,  self->_brailleLineRange.length));

        __int128 v35 = 0LL;
        id v11 = sub_10004CF70(v10, &v35);
        uint64_t v12 = v35;
        id v13 = (char *)sub_10004D3E4(v36, v12);
        NSUInteger length = self->_brailleLineRange.length;

        if ((-[SCROBrailleClient inputEightDotBraille](self->_brailleClient, "inputEightDotBraille") & 1) == 0
          && !-[VOTBrailleManager _languageIsCJK](self, "_languageIsCJK"))
        {
          unsigned int v15 = (char *)[(id)VOTSharedWorkspace suppressSelectionChangeNotificationCount];
          [(id)VOTSharedWorkspace setSuppressSelectionChangeNotificationCount:v15 + 1];
        }

        -[VOTElement setSelectedTextRange:refreshBraille:]( v8,  "setSelectedTextRange:refreshBraille:",  &v13[self->_brailleLineRange.location],  0LL,  0LL);
        -[VOTBrailleManager _refreshBrailleLinePreferringPositionOverRotorSelection:knownLineRange:updatedPosition:]( self,  "_refreshBrailleLinePreferringPositionOverRotorSelection:knownLineRange:updatedPosition:",  1LL,  0LL,  0LL);
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        id v17 = (id)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent InsertionPointDidMove](&OBJC_CLASS___VOSOutputEvent, "InsertionPointDidMove"));
        [v16 sendEvent:v17];
        goto LABEL_14;
      }

      if (-[VOTElement isReadingContent](brailleElement, "isReadingContent"))
      {
        if (self->_brailleLineRange.location != 0x7FFFFFFFFFFFFFFFLL && v36 <= self->_brailleLineRange.length)
        {
          BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue(-[VOTElement pageContent](self->_brailleElement, "pageContent"));
          __int128 v27 = (char *)-[VOTElement ax_wordFromPosition:inDirection:]( v8,  "ax_wordFromPosition:inDirection:",  v36 + self->_brailleLineRange.location,  0LL);
          uint64_t v29 = v28;
          if (&v27[v28] > -[VOTElement length](v8, "length")) {
            goto LABEL_21;
          }
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement substringWithRange:](v8, "substringWithRange:", v27, v29));
          if (![v16 length])
          {
LABEL_15:

LABEL_21:
            goto LABEL_22;
          }

          id v17 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest");
          [v17 setGeneratesBraille:0];
          id v30 = [v17 addString:v16];
          [v17 send];
LABEL_14:

          goto LABEL_15;
        }
      }

      else
      {
        if (!-[VOTElement doesHaveTraits:](self->_brailleElement, "doesHaveTraits:", kAXMathEquationTrait))
        {
          BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue( +[VOTEvent brailleEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "brailleEventWithCommand:info:",  kVOTEventCommandSimpleTap,  0LL));
          [(id)VOTSharedWorkspace dispatchCommand:v8];
          goto LABEL_21;
        }

        if (self->_brailleLineRange.location != 0x7FFFFFFFFFFFFFFFLL && v36 <= self->_brailleLineRange.length)
        {
          BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue(-[VOTElement mathBrailleDescription](self->_brailleElement, "mathBrailleDescription"));
          id v31 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement attributesAtIndex:effectiveRange:]( v8,  "attributesAtIndex:effectiveRange:",  v36 + self->_brailleLineRange.location,  0LL));
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:UIAccessibilityTokenMathTreePosition]);
          if (v32)
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent brailleEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "brailleEventWithCommand:info:",  kVOTEventCommandSearchRotorSetMathPosition,  0LL));
            [v33 setObject:v32 forIndex:109];
            [(id)VOTSharedWorkspace dispatchCommand:v33];
          }

          else
          {
            __int128 v34 = NSStringFromRange(self->_brailleLineRange);
            id v33 = (void *)objc_claimAutoreleasedReturnValue(v34);
            _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not get tree position for router location %lu, braille line range %@, in braille description %@");
          }

          goto LABEL_21;
        }
      }
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
      unsigned __int8 v19 = [v18 ignoreLogging];

      if ((v19 & 1) == 0)
      {
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
        uint64_t v21 = AXLoggerForFacility(v20);
        BOOL v8 = (VOTElement *)objc_claimAutoreleasedReturnValue(v21);

        os_log_type_t v22 = AXOSLogLevelFromAXLogLevel(2LL);
        if (os_log_type_enabled((os_log_t)v8, v22))
        {
          uint64_t v23 = AXColorizeFormatLog(2LL, @"Router problem %d %d");
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          uint64_t v25 = _AXStringForArgs(v24);
          id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled((os_log_t)v8, v22))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v40 = v26;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, v22, "%{public}@", buf, 0xCu);
          }
        }

        goto LABEL_21;
      }
    }
  }

- (void)_handleBrailleStatusRouter:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForIndex:104]);
  uint64_t v5 = v4;
}

- (void)_initializeExpandedStatusCellDictionaries
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[_VOTBrailleManagerStatus generalDict](self->_status, "generalDict"));

  if (!v3)
  {
    id v50 = (void *)objc_claimAutoreleasedReturnValue( +[SCROBrailleClient statusAttributeDotText]( &OBJC_CLASS___SCROBrailleClient,  "statusAttributeDotText"));
    id v48 = objc_allocWithZone(&OBJC_CLASS___NSMutableDictionary);
    id v4 = sub_10004A988(off_1001AC148, @"braille.status.general.title", 0LL);
    id v46 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v5 = kSCROStatusAttributeCellTitle;
    id v6 = sub_10004A988(off_1001AC148, @"braille.status.general.dot.3", 0LL);
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:2]);
    id v9 = sub_10004A988(off_1001AC148, @"braille.status.general.dot.4", 0LL);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:3]);
    id v12 = sub_10004A988(off_1001AC148, @"braille.status.general.dot.5", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:4]);
    id v15 = sub_10004A988(off_1001AC148, @"braille.status.general.dot.6", 0LL);
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:5]);
    id v18 = objc_msgSend(v48, "initWithObjectsAndKeys:", v46, v5, v7, v8, v10, v11, v13, v14, v16, v17, 0);
    -[_VOTBrailleManagerStatus setGeneralDict:](self->_status, "setGeneralDict:", v18);

    id v43 = objc_allocWithZone(&OBJC_CLASS___NSMutableDictionary);
    id v19 = sub_10004A988(off_1001AC148, @"braille.status.text.title", 0LL);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v41 = kSCROStatusAttributeCellTitle;
    id v20 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.1", 0LL);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:0]);
    id v21 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.2", 0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:1]);
    id v22 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.3", 0LL);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v22);
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:2]);
    id v23 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.4", 0LL);
    id v44 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:3]);
    id v24 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.5", 0LL);
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v24);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:4]);
    id v25 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.6", 0LL);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:5]);
    id v27 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.7", 0LL);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:6]);
    id v30 = sub_10004A988(off_1001AC148, @"braille.status.text.dot.8", 0LL);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:7]);
    id v33 = objc_msgSend( v43,  "initWithObjectsAndKeys:",  v42,  v41,  v40,  v49,  v47,  v39,  v45,  v38,  v44,  v37,  v36,  v35,  v26,  v34,  v28,  v29,  v31,  v32,  0);
    -[_VOTBrailleManagerStatus setTextDict:](self->_status, "setTextDict:", v33);
  }

- (void)_updateWordWrapPrefs
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = [v3 voiceOverBrailleWordWrapEnabled];

  uint64_t v5 = AXLogBrailleHW();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = (_DWORD)v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Word wrap updated: %d", (uint8_t *)v7, 8u);
  }

  -[SCROBrailleClient setWordWrapEnabled:](self->_brailleClient, "setWordWrapEnabled:", v4);
}

- (void)_updateBrailleKeyDebouncePrefs
{
  brailleClient = self->_brailleClient;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 voiceOverBrailleKeyDebounceTimeout];
  -[SCROBrailleClient setBrailleChordDebounceTimeout:](brailleClient, "setBrailleChordDebounceTimeout:");
}

- (void)updateBrailleAutoAdvancePrefs
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_updateBrailleAutoAdvancePrefs",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_updateBrailleAutoAdvancePrefs
{
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  self->_autoAdvanceEnabled = a3;
  -[VOTBrailleManager _updateBrailleAutoAdvancePrefs](self, "_updateBrailleAutoAdvancePrefs");
}

- (BOOL)autoAdvanceEnabled
{
  return self->_autoAdvanceEnabled;
}

- (void)_updateHelpEnabled
{
  brailleClient = self->_brailleClient;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  -[SCROBrailleClient setSingleLetterInputIsOn:]( brailleClient,  "setSingleLetterInputIsOn:",  [v4 helpEnabled]);

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  self->_testingKeyboardHelpOn = [v5 helpEnabled];
}

- (void)setSingleLetterQuickNavOn:(BOOL)a3
{
}

- (BOOL)bluetoothBrailleDisplayConnected
{
  return self->_primaryDisplayIsBluetooth && self->_primaryDisplayToken != 0;
}

- (void)_updateStatusCellPrefs
{
  unsigned int v3 = -[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral");
  unsigned int v4 = -[_VOTBrailleManagerStatus showText](self->_status, "showText");
  -[_VOTBrailleManagerStatus setShowGeneral:]( self->_status,  "setShowGeneral:",  [(id)VOTSharedWorkspace activeBrailleGeneralStatusCellPreference]);
  -[_VOTBrailleManagerStatus setShowText:]( self->_status,  "setShowText:",  [(id)VOTSharedWorkspace activeBrailleTextStatusCellPreference]);
  if (-[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral")
    || -[_VOTBrailleManagerStatus showText](self->_status, "showText"))
  {
    -[VOTBrailleManager _initializeExpandedStatusCellDictionaries](self, "_initializeExpandedStatusCellDictionaries");
  }

  else
  {
    -[_VOTBrailleManagerStatus setGeneralDict:](self->_status, "setGeneralDict:", 0LL);
    -[_VOTBrailleManagerStatus setTextDict:](self->_status, "setTextDict:", 0LL);
  }

  if (v3 != -[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral")
    || v4 != -[_VOTBrailleManagerStatus showText](self->_status, "showText"))
  {
    -[VOTBrailleManager _updateStatusCells](self, "_updateStatusCells");
  }

- (BOOL)statusCellShowsGeneral
{
  return -[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral");
}

- (BOOL)statusCellShowsText
{
  return -[_VOTBrailleManagerStatus showText](self->_status, "showText");
}

- (void)_updateStatusCells
{
  char v54 = 0;
  __int16 v53 = 0;
  if (-[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral"))
  {
    -[_VOTBrailleManagerStatus setGeneral:](self->_status, "setGeneral:", 0LL);
    unsigned int v3 = -[_VOTBrailleManagerStatus general](self->_status, "general") & 0xFFFFFFFB;
    else {
      int v4 = 0;
    }
    -[_VOTBrailleManagerStatus setGeneral:](self->_status, "setGeneral:", v4 | v3);
    unsigned int v5 = -[_VOTBrailleManagerStatus general](self->_status, "general") & 0xFFFFFFF7;
    else {
      int v6 = 0;
    }
    -[_VOTBrailleManagerStatus setGeneral:](self->_status, "setGeneral:", v6 | v5);
    -[_VOTBrailleManagerStatus setGeneral:]( self->_status,  "setGeneral:",  -[_VOTBrailleManagerStatus general](self->_status, "general") & 0xFFFFFFEF | (16 * ((char *)[(id)VOTSharedWorkspace deviceOrientation]
                                                                                   - 3 < (char *)2)));
    unsigned int v7 = -[_VOTBrailleManagerStatus general](self->_status, "general") & 0xFFFFFFDF;
    else {
      int v8 = 0;
    }
    -[_VOTBrailleManagerStatus setGeneral:](self->_status, "setGeneral:", v8 | v7);
    uint64_t v9 = 0LL;
    LOBYTE(v53) = -[_VOTBrailleManagerStatus general](self->_status, "general");
    unsigned int v10 = 1;
  }

  else
  {
    unsigned int v10 = 0;
    uint64_t v9 = -1LL;
  }

  if (-[_VOTBrailleManagerStatus showText](self->_status, "showText"))
  {
    id v11 = self->_brailleElement;
    if (-[VOTElement brailleTextEntrySupported](self->_brailleElement, "brailleTextEntrySupported"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
      id v13 = v12;
      if (v12)
      {
        unsigned __int8 v14 = v12;

        id v11 = v14;
      }
    }

    id v15 = -[VOTElement selectedTextRange](v11, "selectedTextRange");
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v17 = v15;
      unint64_t v18 = v16;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v11, "value"));
      id v20 = [v19 length];

      if (v17 >= v20)
      {
        id v22 = 0LL;
      }

      else
      {
        if (v18 <= 1) {
          uint64_t v21 = 1LL;
        }
        else {
          uint64_t v21 = v18;
        }
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement attributedValueForRange:](v11, "attributedValueForRange:", v17, v21));
        [(id)VOTSharedWorkspace addMisspellingsForString:v22];
      }

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_1000BCF4C;
      v51[3] = &unk_100179A78;
      id v23 = v22;
      id v52 = v23;
      id v24 = objc_retainBlock(v51);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1000BD064;
      v49[3] = &unk_100179A78;
      id v25 = v23;
      id v50 = v25;
      id v26 = objc_retainBlock(v49);
      id v44 = _NSConcreteStackBlock;
      uint64_t v45 = 3221225472LL;
      id v46 = sub_1000BD158;
      v47 = &unk_100179A78;
      id v48 = v25;
      id v27 = v25;
      uint64_t v28 = objc_retainBlock(&v44);
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", 0LL, v44, v45, v46, v47);
      -[_VOTBrailleManagerStatus setText:]( self->_status,  "setText:",  -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFE | (BKSHIDServicesIsCapsLockLightOn() != 0));
      unsigned int v29 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFFD;
      else {
        int v30 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v30 | v29);
      unsigned int v31 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFFB;
      else {
        int v32 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v32 | v31);
      unsigned int v33 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFF7;
      else {
        int v34 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v34 | v33);
      unsigned int v35 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFEF;
      else {
        int v36 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v36 | v35);
      unsigned int v37 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFDF;
      else {
        int v38 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v38 | v37);
      unsigned int v39 = -[_VOTBrailleManagerStatus text](self->_status, "text") & 0xFFFFFFBF;
      else {
        int v40 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v40 | v39);
      unsigned __int8 v41 = -[_VOTBrailleManagerStatus text](self->_status, "text");
      else {
        char v42 = 0;
      }
      -[_VOTBrailleManagerStatus setText:](self->_status, "setText:", v42 & 0x80 | v41 & 0x7Fu);
    }

    *(_BYTE *)((unint64_t)&v53 | v10++) = -[_VOTBrailleManagerStatus text](self->_status, "text");
  }

  if (-[_VOTBrailleManagerStatus showRealtime](self->_status, "showRealtime")) {
    *((_BYTE *)&v53 + v10++) = -[_VOTBrailleManagerStatus realtime](self->_status, "realtime");
  }
  id v43 = [objc_allocWithZone(NSMutableData) initWithBytes:&v53 length:v10];
  -[SCROBrailleClient setMasterStatusCellIndex:](self->_brailleClient, "setMasterStatusCellIndex:", v9);
  -[SCROBrailleClient setAggregatedStatus:](self->_brailleClient, "setAggregatedStatus:", v43);
  -[SCROBrailleClient displayIfNeeded](self->_brailleClient, "displayIfNeeded");
}

- (void)_handleStatusRouterForIndex:(int64_t)a3
{
  if (-[_VOTBrailleManagerStatus showGeneral](self->_status, "showGeneral"))
  {
    if (a3)
    {
      id v12 = 0LL;
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[_VOTBrailleManagerStatus generalDict](self->_status, "generalDict"));
      int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
      [v12 setObject:v6 forKey:kSCROStatusAttributeCellIndex];
    }

    int v5 = 1;
  }

  else
  {
    int v5 = 0;
    id v12 = 0LL;
  }

  if (-[_VOTBrailleManagerStatus showText](self->_status, "showText"))
  {
    if (v5 == a3)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_VOTBrailleManagerStatus textDict](self->_status, "textDict"));

      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      [v7 setObject:v8 forKey:kSCROStatusAttributeCellIndex];

      id v12 = v7;
    }

    ++v5;
  }

  if (-[_VOTBrailleManagerStatus showRealtime](self->_status, "showRealtime") && v5 == a3)
  {
    id v9 = kVOTEventCommandNextRealtimeElement;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent brailleEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "brailleEventWithCommand:info:",  v9,  0LL));
    [(id)VOTSharedWorkspace dispatchCommand:v10];
  }

  id v11 = v12;
  if (v12)
  {
    -[SCROBrailleClient setExpandedStatusDisplayModeWithStatus:]( self->_brailleClient,  "setExpandedStatusDisplayModeWithStatus:",  v12);
    -[SCROBrailleClient displayIfNeeded](self->_brailleClient, "displayIfNeeded");
    id v11 = v12;
  }
}

- (void)applyBrailleSubstitutions:(id)a3
{
  if (self->_usesBrailleSubstitutions)
  {
    id v4 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[SCROBrailleSubstitutionManager sharedInstance]( &OBJC_CLASS___SCROBrailleSubstitutionManager,  "sharedInstance"));
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager brailleSubstitutionLanguage](self, "brailleSubstitutionLanguage"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v7 stringWithBrailleSubstitutions:v4 withLanguage:v5]);
    [v4 setString:v6];
  }

- (void)_filterUnacceptableBrailleStrings:(id)a3
{
  id v6 = a3;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet controlCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "controlCharacterSet"));
  objc_msgSend(v3, "removeCharactersInRange:", 28, 1);
  objc_msgSend(v3, "removeCharactersInRange:", 31, 1);
  if ([v6 length])
  {
    do
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);
      int v5 = (char *)[v4 rangeOfCharacterFromSet:v3];

      objc_msgSend(v6, "replaceCharactersInRange:withString:", v5, 1, &stru_10017A920);
    }

    while (v5 + 1 < [v6 length]);
  }
}

- (void)setBrailleString:(id)a3 type:(int)a4 timeout:(double)a5 langCode:(id)a6 brailleLineRange:(_NSRange)a7 isBrailleLineRangeKnown:(BOOL)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v13 = *(void *)&a4;
  id v15 = a3;
  id v16 = a6;
  if (![v15 length])
  {
    uint64_t v17 = VOTLogCommon(0LL);
    unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F45E0(v18);
    }
  }

  if (-[VOTBrailleManager brailleEnabled](self, "brailleEnabled"))
  {
    threadKey = self->_threadKey;
    -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
    double v21 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13));
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    id v24 = (void *)v23;
    if (a8)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", location, length));
      -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:",  threadKey,  0LL,  6LL,  v15,  v21,  v22,  v24,  &off_100188210,  v16,  v25);
    }

    else
    {
      -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:",  threadKey,  0LL,  6LL,  v15,  v21,  v22,  v23,  &off_100188210,  v16,  0LL);
    }
  }
}

- (void)_setBrailleString:(id)a3 type:(id)a4 timeout:(id)a5 priority:(id)a6 langCode:(id)a7 brailleLineRangeValue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v61 = a6;
  id v17 = a7;
  id v62 = a8;
  -[VOTBrailleManager _filterUnacceptableBrailleStrings:](self, "_filterUnacceptableBrailleStrings:", v14);
  currentSetTable = self->_currentSetTable;
  if (!currentSetTable)
  {
    objc_storeStrong((id *)&self->_currentSetTable, self->_currentDefaultTable);
    currentSetTable = self->_currentSetTable;
  }

  id v63 = -[BRLTTable copy](currentSetTable, "copy");
  if (v17 && [v14 length])
  {
    id v60 = v16;
    objc_msgSend(v14, "addAttribute:value:range:", kSCROLanguageAttribute, v17, 0, objc_msgSend(v14, "length"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 preferredBrailleTableIdentifierForKeyboardLanguage:v17 keyboardLayout:0]);

    if (v20)
    {
      double v21 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v20);
      if (!v21) {
        goto LABEL_15;
      }
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v17));
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator defaultTableForLocale:]( &OBJC_CLASS___BRLTTableEnumerator,  "defaultTableForLocale:",  v24));

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self->_currentDefaultTable, "language"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 language]);
      unsigned int v28 = [v26 isEqualToString:v27];

      currentDefaultTable = (BRLTTable *)v25;
      if (v28) {
        currentDefaultTable = self->_currentDefaultTable;
      }
      double v21 = currentDefaultTable;

      if (!v21) {
        goto LABEL_15;
      }
    }

    int v30 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable tableIdentifier](v21, "tableIdentifier"));
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable tableIdentifier](self->_currentSetTable, "tableIdentifier"));
    unsigned __int8 v32 = [v30 isEqualToString:v31];

    if ((v32 & 1) == 0)
    {
      -[VOTBrailleManager _setBrailleTable:](self, "_setBrailleTable:", v21);
      int v23 = 1;
      goto LABEL_17;
    }

- (void)setBrailleElement:(id)a3
{
}

- (void)setBrailleElement:(id)a3 resetBrailleCursor:(BOOL)a4 rotorSelection:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v8 = a5;
  if (-[VOTBrailleManager brailleEnabled](self, "brailleEnabled"))
  {
    threadKey = self->_threadKey;
    -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
    double v11 = v10;
    id v12 = [v14 copyWithCache];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_setBrailleElement:resetBrailleCursor:rotorSelection:",  threadKey,  0LL,  3LL,  v12,  v11,  v13,  v8);
  }
}

- (void)_setBrailleElement:(id)a3 resetBrailleCursor:(id)a4 rotorSelection:(id)a5
{
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[VOTBrailleManager testingBrailleElementLocked](self, "testingBrailleElementLocked")) {
    goto LABEL_33;
  }
  p_brailleElement = (id *)&self->_brailleElement;
  unsigned __int8 v12 = [v22 isEqual:self->_brailleElement];
  objc_storeStrong((id *)&self->_brailleElement, a3);
  if (self->_rotorSelection != v10) {
    objc_storeStrong(&self->_rotorSelection, a5);
  }
  if ((v12 & 1) == 0)
  {
    -[SCROBrailleClient cancelCandidateSelection](self->_brailleClient, "cancelCandidateSelection");
    brailleElement = self->_brailleElement;
    if (!brailleElement)
    {
      -[SCRCTargetSelectorTimer cancel](self->_hintTimer, "cancel");
      id v14 = 0LL;
LABEL_28:
      -[VOTBrailleManager _resetBrailleCursor](self, "_resetBrailleCursor");
      goto LABEL_29;
    }

    unint64_t brailleElementIndex = self->_brailleElementIndex;
    if (brailleElementIndex + 1 > 1) {
      unint64_t v17 = brailleElementIndex + 1;
    }
    else {
      unint64_t v17 = 1LL;
    }
    self->_unint64_t brailleElementIndex = v17;
    if (self->_lastBraillePanDirection == 1)
    {
      if (-[VOTElement isLiveCaptionsParagraphView](brailleElement, "isLiveCaptionsParagraphView"))
      {
        id v14 = &off_100188228;
LABEL_27:
        -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_hintTimer, "dispatchAfterDelay:", 2.0);
        goto LABEL_28;
      }

      brailleElement = (VOTElement *)*p_brailleElement;
    }

    if (-[VOTElement isLiveCaptionsTextView](brailleElement, "isLiveCaptionsTextView"))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([*p_brailleElement label]);
      id v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v19 length]));
    }

    else
    {
      id v14 = 0LL;
    }

    goto LABEL_27;
  }

  if (![v9 BOOLValue]
    || ![*p_brailleElement brailleTextEntrySupported])
  {
    if (([v9 BOOLValue] & 1) != 0
      || ([*p_brailleElement isReadingContent] & 1) != 0
      || (int64_t brailleLineOffset = self->_brailleLineOffset, brailleLineOffset == -1))
    {
      if (![*p_brailleElement isLiveCaptionsTextView])
      {
        id v14 = 0LL;
        goto LABEL_29;
      }

      int64_t brailleLineOffset = self->_brailleLineOffset;
    }

    id v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", brailleLineOffset));
LABEL_29:
    uint64_t v13 = 1LL;
    goto LABEL_30;
  }

  -[VOTElement updateCache](self->_brailleElement, "updateCache");
  -[VOTBrailleManager _resetBrailleCursor](self, "_resetBrailleCursor");
  uint64_t v13 = 0LL;
  id v14 = 0LL;
LABEL_30:
  -[VOTBrailleManager _refreshBrailleLinePreferringPositionOverRotorSelection:knownLineRange:updatedPosition:updateBrailleElement:]( self,  "_refreshBrailleLinePreferringPositionOverRotorSelection:knownLineRange:updatedPosition:updateBrailleElement:",  0LL,  0LL,  v14,  v13);
  -[VOTBrailleManager _updateRealtimeElementStatus](self, "_updateRealtimeElementStatus");
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager elementSetCallback](self, "elementSetCallback"));

  if (v20)
  {
    double v21 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[VOTBrailleManager elementSetCallback](self, "elementSetCallback"));
    ((void (**)(void, VOTElement *))v21)[2](v21, self->_brailleElement);
  }

LABEL_33:
}

- (void)_resetBrailleCursor
{
  self->_brailleLineRange = (_NSRange)xmmword_1001326B0;
  self->_brailleDescriptionRange = self->_brailleLineRange;
  self->_int64_t brailleLineOffset = -1LL;
}

- (void)refreshBrailleLine
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_refreshBrailleLine",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_refreshBrailleLine
{
}

- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5
{
}

- (void)_refreshBrailleLinePreferringPositionOverRotorSelection:(BOOL)a3 knownLineRange:(BOOL)a4 updatedPosition:(id)a5 updateBrailleElement:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v67 = a5;
  brailleElement = self->_brailleElement;
  if (!brailleElement)
  {
    id v21 = [objc_allocWithZone(NSMutableAttributedString) initWithString:@" "];
    uint64_t v22 = kSCROTokenAttribute;
    int v23 = (VOTElement *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL));
    objc_msgSend(v21, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v21, "length"));
    goto LABEL_81;
  }

  BOOL v63 = a4;
  if (v6) {
    -[VOTElement updateCache](brailleElement, "updateCache");
  }
  id v64 = [objc_allocWithZone(NSMutableAttributedString) init];
  double v11 = self->_brailleElement;
  unsigned int v12 = -[VOTElement brailleTextEntrySupported](self->_brailleElement, "brailleTextEntrySupported");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
  id v14 = (char *)-[VOTElement textInputElementRange](self->_brailleElement, "textInputElementRange");
  id v15 = v14;
  uint64_t v17 = v16;
  if (v13) {
    unsigned int v18 = v12;
  }
  else {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v19 = v18;
  }
  if (!-[VOTElement isReadingContent](self->_brailleElement, "isReadingContent"))
  {
    unsigned int v20 = -[VOTElement includeDuringContentReading](self->_brailleElement, "includeDuringContentReading");
    if (!v19) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  unsigned int v20 = 1;
  if (v19)
  {
LABEL_15:
    [v13 updateCache];
    id v24 = v13;
    id v25 = v11;
    double v11 = v24;
  }

- (VOTElement)brailleElement
{
  return (VOTElement *)-[VOTBrailleManager valueForKeyPath:forThreadKey:]( self,  "valueForKeyPath:forThreadKey:",  @"_brailleElement",  self->_threadKey);
}

- (void)_displayBrailleElementHint
{
  if (self->_brailleElement && [(id)VOTSharedWorkspace hintsEnabled])
  {
    id v10 = [objc_allocWithZone(NSMutableString) init];
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement hint](self->_brailleElement, "hint"));
    if ([v3 length])
    {
      if ([v3 isAXAttributedString])
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
        [v10 appendString:v4];
      }

      else
      {
        [v10 appendString:v3];
      }
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement instructions](self->_brailleElement, "instructions"));

    if ([v5 length])
    {
      if ([v10 length]) {
        objc_msgSend(v10, "appendString:", @", ");
      }
      [v10 appendString:v5];
    }

    if ([v10 length])
    {
      id v6 = [objc_allocWithZone(NSMutableAttributedString) initWithString:v10];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
      +[VOTBrailleManager currentDefaultBrailleAlertTimeout]( &OBJC_CLASS___VOTBrailleManager,  "currentDefaultBrailleAlertTimeout");
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL));
      -[VOTBrailleManager _setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:]( self,  "_setBrailleString:type:timeout:priority:langCode:brailleLineRangeValue:",  v6,  v7,  v8,  v9,  0LL,  0LL);
    }
  }

- (void)handleBrailleConfigurationChanged:(id)a3
{
  id v4 = a3;
  uint64_t v6 = VOTLogBraille(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Braille config change handler called: isConfigured = %@",  (uint8_t *)&v9,  0xCu);
  }

  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleBrailleConfigurationChanged:",  threadKey,  0LL,  1LL,  v4);
  -[NSCondition lock](self->_brailleClientConnectionCondition, "lock");
  -[NSCondition unlock](self->_brailleClientConnectionCondition, "unlock");
}

- (void)handleBrailleDidDisconnect:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  -[VOTBrailleManager handleBrailleConfigurationChanged:](self, "handleBrailleConfigurationChanged:", v4);
}

- (void)handleBrailleDidReconnect:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  -[VOTBrailleManager handleBrailleConfigurationChanged:](self, "handleBrailleConfigurationChanged:", v4);
}

- (void)_handleBrailleConfigurationChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration", a3));
  self->_primaryDisplayToken = 0;
  BOOL v5 = -[VOTBrailleManager testingHasActiveDisplay](self, "testingHasActiveDisplay");
  self->_BOOL hasActiveDisplay = v5;
  uint64_t v7 = VOTLogBraille(v5, v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasActiveDisplay = self->_hasActiveDisplay;
    *(_DWORD *)buf = 138412546;
    NSUInteger v40 = v4;
    __int16 v41 = 1024;
    BOOL v42 = hasActiveDisplay;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Driver config = %@, testingHasActiveDisplay = %d",  buf,  0x12u);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", kSCROBrailleDisplayState, (void)v34));
        id v17 = [v16 unsignedIntegerValue];

        if (v17 == (id)1)
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:kSCROBrailleDisplayIsPrimary]);
          unsigned int v19 = [v18 BOOLValue];

          if (v19)
          {
            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:kSCROBrailleDisplayToken]);
            self->_primaryDisplayToken = [v20 integerValue];

            id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:kSCROBrailleDisplayTransport]);
            objc_opt_class(&OBJC_CLASS___NSNumber, v22);
            if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
            {
              id v24 = [v21 unsignedIntegerValue];
              BOOL v25 = 1;
              if (v24 != (id)8 && v24 != (id)2)
              {
LABEL_16:

                goto LABEL_17;
              }
            }

            else
            {
              BOOL v25 = 0;
            }

            self->_primaryDisplayIsBluetooth = v25;
            goto LABEL_16;
          }

- (BOOL)_isActiveUserDisplayConfig:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSCROBrailleDisplayState]);
  if ([v4 unsignedIntegerValue] == (id)1)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSCROBrailleDisplayMainSize]);
    BOOL v6 = (unint64_t)[v5 unsignedIntegerValue] > 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)handleShowOnscreenKeyboardToggle
{
  BOOL v2 = -[VOTBrailleManager hasActiveBrailleDisplay](self, "hasActiveBrailleDisplay");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v4 = [v3 voiceOverShowSoftwareKeyboardWithBraille];

    uint64_t v5 = v4 ^ 1;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 setVoiceOverShowSoftwareKeyboardWithBraille:v5];
  }

  return v2;
}

- (void)_updateOnscreenKeyboardSettings
{
  if (AXUIKeyboardIsOOP(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement inputUIApplication](&OBJC_CLASS___VOTElement, "inputUIApplication"));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {

LABEL_17:
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v4 setAXAttribute:2603 withObject:v18];

    goto LABEL_18;
  }

  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      if (-[VOTBrailleManager _isActiveUserDisplayConfig:](self, "_isActiveUserDisplayConfig:", v12))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:kSCROBrailleDisplayPostsKeyboardEvents]);
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace softwareKeyboardManager]);
          char v9 = 1;
          [v15 setIsHardwareKeyboardAttached:1];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          id v17 = [v16 voiceOverShowSoftwareKeyboardWithBraille];

          [v4 setAXAttribute:2603 withBOOL:v17];
        }
      }
    }

    id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

- (void)handleBrailleKeypress:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleBrailleKeypress:",  threadKey,  0LL,  1LL,  v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v6 userEventOccurred];
}

- (void)handleUserEventOccured
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v2 userEventOccurred];
}

- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  threadKey = self->_threadKey;
  id v10 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", location, length));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[VOTBrailleManager performSelector:withThreadKey:count:objects:]( self,  "performSelector:withThreadKey:count:objects:",  "_handleBrailleReplaceTextRange:withString:cursor:",  threadKey,  3LL,  v12,  v10,  v11);
}

- (void)_handleBrailleKeypress:(id)a3
{
  id v4 = a3;
  if (-[SCRCTargetSelectorTimer isPending](self->_hintTimer, "isPending")
    && (-[SCRCTargetSelectorTimer isCancelled](self->_hintTimer, "isCancelled") & 1) == 0)
  {
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_hintTimer, "dispatchAfterDelay:", 2.0);
  }

  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( +[SCROMobileBrailleDisplayInputManager sharedManager]( &OBJC_CLASS___SCROMobileBrailleDisplayInputManager,  "sharedManager"));
  id v42 = (id)objc_opt_self(&OBJC_CLASS___SCROBrailleKeyboardKey);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v5)
  {
    uint64_t v41 = *(void *)v45;
    int v38 = kBRLTBrailleKeyboardKeyModifierNull;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v6);
        if ((objc_opt_isKindOfClass(v7, v42) & 1) != 0)
        {
          sub_1000BF234(v7);
          -[SCROBrailleClient setPersistentKeyModifiers:]( self->_brailleClient,  "setPersistentKeyModifiers:",  self->_toggledModifiers);
          goto LABEL_42;
        }

        objc_opt_class(&OBJC_CLASS___VOTBrailleKeyExplicitCommand, v8);
        if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
          uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 command]);
        }
        else {
          uint64_t v10 = objc_claimAutoreleasedReturnValue([v39 commandForBrailleKey:v7]);
        }
        id v11 = (void *)v10;
        uint64_t v12 = AXLogBrailleHW(v10);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Dispatch braille command: %@ %@",  buf,  0x16u);
        }

        if (v11)
        {
          unsigned int v14 = -[VOTBrailleManager _handleKeyboardModifierCommands:](self, "_handleKeyboardModifierCommands:", v11);
          v50[0] = kVOTEventCommandTab;
          v50[1] = kVOTEventCommandReturn;
          v51[0] = &off_100188270;
          v51[1] = &off_100188288;
          v50[2] = kVOTEventCommandLeftArrow;
          v50[3] = kVOTEventCommandRightArrow;
          v51[2] = &off_1001882A0;
          v51[3] = &off_1001882B8;
          v50[4] = kVOTEventCommandUpArrow;
          v50[5] = kVOTEventCommandDownArrow;
          void v51[4] = &off_1001882D0;
          v51[5] = &off_1001882E8;
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  6LL));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v11]);
          if (v16)
          {
            BOOL v17 = -[SCROBrailleClient persistentKeyModifiers]( self->_brailleClient,  "persistentKeyModifiers") == v38;

            if (!v17)
            {
              id v33 = objc_alloc_init(&OBJC_CLASS___SCROBrailleKeyboardKey);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v11]);
              objc_msgSend(v33, "setKeyCode:", objc_msgSend(v34, "unsignedIntegerValue"));

              objc_msgSend( v33,  "setModifiers:",  -[SCROBrailleClient persistentKeyModifiers](self->_brailleClient, "persistentKeyModifiers"));
              sub_1000BF234(v33);
              -[SCROBrailleClient setPersistentKeyModifiers:]( self->_brailleClient,  "setPersistentKeyModifiers:",  self->_toggledModifiers);

              goto LABEL_62;
            }
          }

          if ([v11 isEqualToString:kVOTEventCommandBrailleRouter])
          {
            if (-[SCROBrailleClient displayMode](self->_brailleClient, "displayMode") - 1 <= 2)
            {
              -[SCROBrailleClient exitCurrentDisplayMode](self->_brailleClient, "exitCurrentDisplayMode");
              goto LABEL_38;
            }

- (BOOL)handleCommandIfActiveBrailleRelated:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:kVOTEventCommandEscape])
  {
    if ([v4 isEqualToString:kVOTEventCommandBrailleAnnouncementModeOn])
    {
      unsigned int v6 = -[SCROBrailleClient displayMode](self->_brailleClient, "displayMode");
      brailleClient = self->_brailleClient;
      if (v6 != 2)
      {
        -[SCROBrailleClient setAnnouncementsDisplayMode](brailleClient, "setAnnouncementsDisplayMode");
        goto LABEL_12;
      }

      goto LABEL_6;
    }

    if ([v4 isEqualToString:kVOTEventCommandPreviousElement])
    {
      unsigned int v7 = -[SCROBrailleClient displayMode](self->_brailleClient, "displayMode");
      if (v7 == 3) {
        goto LABEL_12;
      }
      if (v7 == 2)
      {
        -[SCROBrailleClient showPreviousAnnouncement](self->_brailleClient, "showPreviousAnnouncement");
        goto LABEL_12;
      }

      unsigned int v10 = -[SCROBrailleClient isCandidateSelectionOn](self->_brailleClient, "isCandidateSelectionOn");
      id v11 = self->_brailleClient;
      if (v10)
      {
        -[SCROBrailleClient showPreviousCandidate](v11, "showPreviousCandidate");
        goto LABEL_12;
      }

      if (-[SCROBrailleClient isWordDescriptionOn](v11, "isWordDescriptionOn"))
      {
        -[SCROBrailleClient showPreviousWordDescription](self->_brailleClient, "showPreviousWordDescription");
        goto LABEL_12;
      }
    }

    else if ([v4 isEqualToString:kVOTEventCommandNextElement])
    {
      unsigned int v9 = -[SCROBrailleClient displayMode](self->_brailleClient, "displayMode");
      if (v9 == 3) {
        goto LABEL_12;
      }
      if (v9 == 2)
      {
        -[SCROBrailleClient showNextAnnouncement](self->_brailleClient, "showNextAnnouncement");
        goto LABEL_12;
      }

      unsigned int v12 = -[SCROBrailleClient isCandidateSelectionOn](self->_brailleClient, "isCandidateSelectionOn");
      uint64_t v13 = self->_brailleClient;
      if (v12)
      {
        -[SCROBrailleClient showNextCandidate](v13, "showNextCandidate");
        goto LABEL_12;
      }

      if (-[SCROBrailleClient isWordDescriptionOn](v13, "isWordDescriptionOn"))
      {
        -[SCROBrailleClient showNextWordDescription](self->_brailleClient, "showNextWordDescription");
        goto LABEL_12;
      }
    }

- (BOOL)_handleKeyboardModifierCommands:(id)a3
{
  id v29 = a3;
  uint64_t v43 = 0LL;
  __int128 v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  char v46 = 0;
  uint64_t v3 = kBRLTBrailleKeyboardKeyModifierCommand;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  kBRLTBrailleKeyboardKeyModifierCommand));
  v51[0] = v4;
  v52[0] = @"command";
  unsigned int v32 = kBRLTBrailleKeyboardKeyModifierShift;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  v51[1] = v5;
  v52[1] = @"shift";
  uint64_t v6 = kBRLTBrailleKeyboardKeyModifierOption;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  kBRLTBrailleKeyboardKeyModifierOption));
  v51[2] = v7;
  v52[2] = @"option";
  uint64_t v8 = kBRLTBrailleKeyboardKeyModifierControl;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  kBRLTBrailleKeyboardKeyModifierControl));
  v51[3] = v9;
  v52[3] = @"control";
  uint64_t v10 = kBRLTBrailleKeyboardKeyModifierSecondaryFn;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  kBRLTBrailleKeyboardKeyModifierSecondaryFn));
  void v51[4] = v11;
  v52[4] = @"fn";
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  5LL));

  v49[0] = kVOTEventCommandModifierCommand;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  v50[0] = v12;
  v49[1] = kVOTEventCommandModifierShift;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v32));
  v50[1] = v13;
  v49[2] = kVOTEventCommandModifierOption;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  v50[2] = v14;
  v49[3] = kVOTEventCommandModifierControl;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v50[3] = v15;
  void v49[4] = kVOTEventCommandModifierFn;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
  v50[4] = v16;
  int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  5LL));

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000C0450;
  v38[3] = &unk_100179AC0;
  id v17 = v29;
  id v39 = v17;
  NSUInteger v40 = self;
  id v18 = v28;
  id v41 = v18;
  id v42 = &v43;
  [v30 enumerateKeysAndObjectsUsingBlock:v38];
  v47[0] = kVOTEventCommandModifierCommandToggle;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  v48[0] = v19;
  v47[1] = kVOTEventCommandModifierShiftToggle;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v32));
  v48[1] = v20;
  v47[2] = kVOTEventCommandModifierOptionToggle;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  v48[2] = v21;
  v47[3] = kVOTEventCommandModifierControlToggle;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v48[3] = v22;
  void v47[4] = kVOTEventCommandModifierFnToggle;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
  v48[4] = v23;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  5LL));

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000C056C;
  v33[3] = &unk_100179AC0;
  id v25 = v17;
  id v34 = v25;
  __int128 v35 = self;
  id v26 = v18;
  id v36 = v26;
  __int128 v37 = &v43;
  [v24 enumerateKeysAndObjectsUsingBlock:v33];
  LOBYTE(v19) = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  return (char)v19;
}

- (void)_handleBrailleReplaceTextRange:(id)a3 withString:(id)a4 cursor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  unsigned int v12 = self->_brailleElement;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
  if (v13 && -[VOTElement textInputElementRange](self->_brailleElement, "textInputElementRange") != (id)0x7FFFFFFF)
  {
    unsigned int v14 = v13;

    unsigned int v12 = v14;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTTextSearchManager sharedManager](&OBJC_CLASS___VOTTextSearchManager, "sharedManager"));
  if ([v15 textSearchModeIsOn])
  {
    id v16 = [v8 rangeValue];
    objc_msgSend(v15, "handleReplaceRange:withString:cursor:", v16, v17, v11, objc_msgSend(v10, "unsignedIntegerValue"));
    goto LABEL_49;
  }

  if (!-[VOTElement brailleTextEntrySupported](v12, "brailleTextEntrySupported"))
  {
    id v23 = objc_alloc_init(&OBJC_CLASS___SCROBrailleKeyboardKey);
    [v23 setKeyString:v11];
    sub_1000BF234(v23);
    -[VOTBrailleManager _refreshBrailleLine](self, "_refreshBrailleLine");

    goto LABEL_49;
  }

  id v56 = v13;
  id v18 = [v8 rangeValue];
  uint64_t v61 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v12, "value"));
  NSUInteger location = self->_brailleLineRange.location;
  id v57 = v8;
  id v64 = v10;
  uint64_t v60 = v20;
  else {
    __int128 v22 = &stru_10017A920;
  }
  id v65 = 0LL;
  v59 = v22;
  id v24 = sub_10004CF70(v22, &v65);
  id v25 = v65;
  id v26 = (char *)sub_10004D468((unint64_t)v18, v61, v25);
  NSUInteger v28 = v27;
  id v29 = [v64 unsignedIntegerValue];
  int v30 = v29;
  int64_t v31 = v29 - v18;
  BOOL v63 = v25;
  if (v29 <= v18)
  {
    id v33 = (char *)sub_10004D3E4((unint64_t)v29, v25);
  }

  else if (v29 <= &v18[(void)[v11 length]])
  {
    id v33 = &v26[v31];
  }

  else
  {
    unsigned int v32 = (char *)sub_10004D3E4(&v30[v61] - (_BYTE *)[v11 length], v25) - v28;
    id v33 = (char *)[v11 length] + (void)v32;
  }

  id v8 = v57;
  NSUInteger v34 = self->_brailleLineRange.location;
  __int128 v35 = &v26[v34];
  uint64_t v36 = (uint64_t)&v33[v34];
  id v58 = (id)v36;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v54 = (char *)[v37 voiceOverHardwareTypingFeedback];

  char v62 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v12, "value"));
  v66.NSUInteger length = (NSUInteger)[v62 length];
  v66.NSUInteger location = 0LL;
  v67.NSUInteger location = (NSUInteger)v35;
  v67.NSUInteger length = v28;
  NSRange v38 = NSIntersectionRange(v66, v67);
  if (v28 && v38.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v39 = -[VOTElement doesHaveTraits:](v12, "doesHaveTraits:", kAXSecureTextFieldTrait);
    else {
      char v40 = v39;
    }
    if ((v40 & 1) != 0 || [v11 length]) {
      id v41 = 0LL;
    }
    else {
      id v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "substringWithRange:", v38.location, v38.length));
    }
    -[VOTElement setSelectedTextRange:refreshBraille:]( v12,  "setSelectedTextRange:refreshBraille:",  &v35[v28],  0LL,  0LL,  v54);
    -[VOTElement replaceCharactersAtCursor:withString:source:]( v12,  "replaceCharactersAtCursor:withString:source:",  v28,  v11,  2LL);
    if ((v40 & 1) == 0)
    {
      id v46 = [objc_allocWithZone((Class)VOTOutputRequest) init];
      id v10 = v64;
      if (v41)
      {
        id v47 = [[AXAttributedString alloc] initWithString:v41];
        [v47 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenLowPitch];
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager _localeIdentifierForCurrentTable](self, "_localeIdentifierForCurrentTable"));
        id v49 = [v46 addAttributedString:v47 withLanguage:v48];
      }

      else
      {
        id v47 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager _localeIdentifierForCurrentTable](self, "_localeIdentifierForCurrentTable"));
        id v50 = [v46 addString:v11 withLanguage:v47];
      }

      [v46 setGeneratesBraille:0];
      [v46 send];

      goto LABEL_42;
    }

- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = a3;
  uint64_t v6 = self->_brailleElement;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
  if (v7 && -[VOTElement textInputElementRange](self->_brailleElement, "textInputElementRange") != (id)0x7FFFFFFF)
  {
    id v8 = v7;

    uint64_t v6 = v8;
  }

  uint64_t v9 = kAXSecureTextFieldTrait;
  if (-[VOTElement doesHaveTraits:](v6, "doesHaveTraits:", kAXSecureTextFieldTrait))
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](v6, "application"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstResponderElement]);
    unsigned __int8 v10 = [v12 doesHaveTraits:v9];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXFirstResponderValueChangeManager sharedInstance]( &OBJC_CLASS___AXFirstResponderValueChangeManager,  "sharedInstance"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 wordBreakSet]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v16 = (unint64_t)[v15 voiceOverHardwareTypingFeedback];

  if ((v10 & 1) == 0 && (v16 | 2) == 2)
  {
    id v17 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v18 = [v28 length];
    if (v16 == 2
      && v18
      && objc_msgSend(v14, "characterIsMember:", objc_msgSend(v28, "characterAtIndex:", 0)))
    {
      id v19 = sub_10004CA3C(v6, 0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v20) {
        id v21 = [[AXAttributedString alloc] initWithString:v20];
      }
      else {
        id v21 = 0LL;
      }
    }

    else
    {
      id v21 = [[AXAttributedString alloc] initWithString:v28];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
      [v21 setAttribute:v20 forKey:UIAccessibilityTokenLiteralText];
    }

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager _localeIdentifierForCurrentInputTable]( self,  "_localeIdentifierForCurrentInputTable"));
    id v23 = [v17 addAttributedString:v21 withLanguage:v22];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 outputActions]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lastObject]);
      LODWORD(v26) = 1.5;
      NSUInteger v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26));
      [v25 setObject:v27 forVariant:32];
    }

    [v17 setGeneratesBraille:0];
    [v17 send];
  }
}

- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  BOOL v4 = a4;
  id v39 = a3;
  uint64_t v6 = self->_brailleElement;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
  if (v7 && -[VOTElement textInputElementRange](self->_brailleElement, "textInputElementRange") != (id)0x7FFFFFFF)
  {
    id v8 = v7;

    uint64_t v6 = v8;
  }

  uint64_t v9 = kAXSecureTextFieldTrait;
  if (-[VOTElement doesHaveTraits:](v6, "doesHaveTraits:", kAXSecureTextFieldTrait))
  {
    int v10 = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](v6, "application"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstResponderElement]);
    unsigned int v13 = [v12 doesHaveTraits:v9];

    int v10 = v13 ^ 1;
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v15 = (unint64_t)[v14 voiceOverHardwareTypingFeedback];

  if (v10 && (v15 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v16 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v18 = [v17 voiceOverDeletionFeedback];

    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v20 = [v19 voiceOverDeletionFeedback];

      if (v20 == (id)3)
      {
        id v21 = 0LL;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        id v23 = &stru_10017A920;
      }

      else
      {
        id v23 = (__CFString *)v39;
        id v21 = 0LL;
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }

    else
    {
      id v24 = sub_10004A988(off_1001AC148, @"delete.text.prefix", 0LL);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v22 = (uint64_t)[v25 rangeOfString:@"%@"];
      id v21 = [v39 length];
      id v38 = v39;
      uint64_t v26 = AXCFormattedString(v25, @"%@");
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v26);
    }

    NSUInteger v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager _localeIdentifierForCurrentTable](self, "_localeIdentifierForCurrentTable", v38));
    id v28 = [v16 addString:v23 withLanguage:v27];

    if (v4 && v22 != 0x7FFFFFFFFFFFFFFFLL && v21 == (id)1)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
      objc_msgSend(v29, "addIndexesInRange:", v22, 1);
      int v30 = (void *)objc_claimAutoreleasedReturnValue([v16 outputActions]);
      int64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lastObject]);
      [v31 setObject:v29 forVariant:29];
    }

    [v16 setGeneratesBraille:0];
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v33 = [v32 voiceOverDeletionFeedback];

    if (v33 == (id)1)
    {
      NSUInteger v34 = (void *)objc_claimAutoreleasedReturnValue([v16 outputActions]);
      [v34 enumerateObjectsUsingBlock:&stru_100179AE0];
    }

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v36 = [v35 voiceOverDeletionFeedback];

    if (v36 == (id)2)
    {
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v16 outputActions]);
      [v37 enumerateObjectsUsingBlock:&stru_100179B00];
    }

    [v16 send];
  }
}

- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  id v6 = [objc_allocWithZone((Class)VOTOutputRequest) init];
  id v7 = [[AXAttributedString alloc] initWithString:v5];

  id v8 = [v6 addAttributedString:v7 withLanguage:v9];
  [v6 setGeneratesBraille:0];
  [v6 send];
}

- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  threadKey = self->_threadKey;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  double v16 = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_dispatchBrailleDidPanWithSuccess:elementToken:appToken:direction:lineOffset:",  threadKey,  0LL,  5LL,  v14,  v16,  v13,  v12,  v17,  v11);

  id v18 = (id)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v18 userEventOccurred];
}

- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  threadKey = self->_threadKey;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  double v16 = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_dispatchBrailleDidPanWithSuccess:elementToken:appToken:direction:lineOffset:",  threadKey,  0LL,  5LL,  v14,  v16,  v13,  v12,  v17,  v11);

  id v18 = (id)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v18 userEventOccurred];
}

- (BOOL)_brailleShouldTryToTurnPage:(id)a3 direction:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v7 = [v6 voiceOverTouchBraillePanningAutoTurnsReadingContent];

  if (!v7) {
    return 0;
  }
  brailleElement = self->_brailleElement;
  if (a4 != 2) {
    return -[VOTElement readingContentCausesPageTurn](brailleElement, "readingContentCausesPageTurn");
  }
  if (-[VOTElement isReadingContent](brailleElement, "isReadingContent")) {
    unsigned __int8 v9 = 1;
  }
  else {
    unsigned __int8 v9 = -[VOTElement includeDuringContentReading](self->_brailleElement, "includeDuringContentReading");
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement previousElement](self->_brailleElement, "previousElement"));
  if ([v11 isReadingContent])
  {
    LOBYTE(v12) = 0;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement previousElement](self->_brailleElement, "previousElement"));
    unsigned int v12 = [v13 includeDuringContentReading] ^ 1;
  }

  return v9 & v12;
}

- (void)_dispatchBrailleDidPanWithSuccess:(id)a3 elementToken:(id)a4 appToken:(id)a5 direction:(id)a6 lineOffset:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t v16 = VOTLogBraille(v14, v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2112;
    id v51 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "braille pan direction: %@, success: %@, lineoffset: %@",  buf,  0x20u);
  }

  self->_int lastBraillePanDirection = [v13 intValue];
  self->_lastBraillePanSucceeded = [v11 BOOLValue];
  self->_int64_t brailleLineOffset = (int64_t)[v14 integerValue];
  if (([v11 BOOLValue] & 1) == 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
    unsigned int v19 = [v18 helpEnabled];

    if (v19)
    {
      unsigned int v20 = [v13 intValue];
      id v21 = (id *)&kVOTEventCommandBraillePanLeft;
      if (v20) {
        id v21 = (id *)&kVOTEventCommandBraillePanRight;
      }
      id v22 = *v21;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent brailleEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "brailleEventWithCommand:info:",  v22,  0LL));
      [(id)VOTSharedWorkspace dispatchCommand:v23];
LABEL_10:

      goto LABEL_11;
    }

    switch(-[SCROBrailleClient displayMode](self->_brailleClient, "displayMode"))
    {
      case 0u:
        if (-[SCROBrailleClient isWordDescriptionOn](self->_brailleClient, "isWordDescriptionOn"))
        {
          if ([v13 intValue])
          {
          }

          else
          {
            -[SCROBrailleClient showPreviousWordDescription](self->_brailleClient, "showPreviousWordDescription");
          }

          break;
        }

        if ([v12 unsignedIntegerValue] != (id)self->_brailleElementIndex) {
          break;
        }
        unsigned int v26 = [v13 intValue];
        NSUInteger location = self->_brailleLineRange.location;
        if (v26)
        {
          if (location != 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v28 = self->_brailleLineRange.length + location;
            if (v28 < self->_brailleDescriptionRange.length + self->_brailleDescriptionRange.location)
            {
              self->_brailleLineRange.NSUInteger location = v28 + 1;
              self->_brailleLineRange.NSUInteger length = 0LL;
              if (-[VOTElement brailleTextEntrySupported](self->_brailleElement, "brailleTextEntrySupported"))
              {
                id v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self->_brailleElement, "textInputElement"));
                if (v29)
                {
                  id v30 = -[VOTElement textInputElementRange](self->_brailleElement, "textInputElementRange");
                  if (v30 != (id)0x7FFFFFFF && self->_brailleLineRange.location > (unint64_t)v30 + v31)
                  {
                    unsigned int v32 = (id *)&kVOTEventCommandNextElement;
                    goto LABEL_39;
                  }
                }

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C1C3C;
  v3[3] = &unk_1001790A0;
  v3[4] = self;
  unsigned int v4 = a3;
  -[VOTBrailleManager performAsyncBlock:forThreadKey:](self, "performAsyncBlock:forThreadKey:", v3, self->_threadKey);
}

- (void)setLastUserInteractionTime:(double)a3
{
  if (a3 - self->_lastUserInteractionTime >= 2.0)
  {
    self->_lastUserInteractionTime = a3;
    uint64_t v5 = AXLogBrailleHW(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v9 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Setting last user interaction time: %f",  buf,  0xCu);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_1000C1D54;
    v7[3] = &unk_100176F30;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    -[VOTBrailleManager performAsyncBlock:forThreadKey:](self, "performAsyncBlock:forThreadKey:", v7, self->_threadKey);
  }

- (unsigned)persistentKeyModifiers
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C1DE8;
  v6[3] = &unk_100179B28;
  v6[4] = self;
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager valueForBlock:forThreadKey:waitTime:]( self,  "valueForBlock:forThreadKey:waitTime:",  v6,  threadKey));
  LODWORD(threadKey) = [v4 unsignedIntValue];

  return threadKey;
}

- (void)handleBraillePlayDisplayConnectionSound:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleBraillePlayDisplayConnectionSound:",  threadKey,  0LL,  1LL,  v5);
}

- (void)_handleBraillePlayDisplayConnectionSound:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BrailleDisplayConnected](&OBJC_CLASS___VOSOutputEvent, "BrailleDisplayConnected"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BrailleDisplayDisconnected](&OBJC_CLASS___VOSOutputEvent, "BrailleDisplayDisconnected"));
  }
  id v5 = (void *)v4;
  [v6 sendEvent:v4];
}

- (void)handleBraillePlayBorderHitSound
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleBraillePlayBorderHitSound",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_handleBraillePlayBorderHitSound
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  [v3 sendEvent:v2];
}

- (void)handleBraillePlayCommandNotSupportedSound
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleBraillePlayCommandNotSupportedSound",  threadKey,  0LL,  0LL,  0LL);
}

- (void)_handleBraillePlayCommandNotSupportedSound
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  [v3 sendEvent:v2];
}

- (void)handleDisplayModeChanged:(id)a3
{
  threadKey = self->_threadKey;
  id v5 = a3;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "_handleDisplayModeChanged:",  threadKey,  0LL,  1LL,  v5);
}

- (void)_handleDisplayModeChanged:(id)a3
{
  id v6 = a3;
  if (-[SCRCTargetSelectorTimer isPending](self->_hintTimer, "isPending")
    && (-[SCRCTargetSelectorTimer isCancelled](self->_hintTimer, "isCancelled") & 1) == 0)
  {
    unsigned int v4 = [v6 intValue];
    double v5 = kCFAbsoluteTimeIntervalSince1904;
    if (!v4) {
      double v5 = 2.0;
    }
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_hintTimer, "dispatchAfterDelay:", v5);
  }
}

- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidWrapBackwards](&OBJC_CLASS___VOSOutputEvent, "DidWrapBackwards"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  }
  double v5 = (void *)v4;
  [v6 sendEvent:v4];
}

- (void)handleBrailleDidShowNextAnnouncement:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidWrapForwards](&OBJC_CLASS___VOSOutputEvent, "DidWrapForwards"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  }
  double v5 = (void *)v4;
  [v6 sendEvent:v4];
}

- (void)handleBrailleStartEditing
{
  if (!-[VOTElement brailleTextEntrySupported](self->_brailleElement, "brailleTextEntrySupported"))
  {
    unsigned int v3 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    v7[0] = kSCROEditableTextAttribute;
    v7[1] = kSCROEditableTextPaddingAttribute;
    v8[0] = &__kCFBooleanTrue;
    v8[1] = &__kCFBooleanTrue;
    _DWORD v7[2] = kSCROTokenAttribute;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_brailleElementIndex));
    v7[3] = kSCROCursorAttribute;
    v8[2] = v4;
    v8[3] = &__kCFBooleanTrue;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
    id v6 = -[NSAttributedString initWithString:attributes:](v3, "initWithString:attributes:", @" ", v5);

    -[SCROBrailleClient setMainAttributedString:](self->_brailleClient, "setMainAttributedString:", v6);
    -[SCROBrailleClient displayIfNeeded](self->_brailleClient, "displayIfNeeded");
  }

- (id)currentBrailleTableIdentifier
{
  return -[BRLTTable identifier](self->_currentSetTable, "identifier");
}

- (BRLTTable)brailleTableFromSettings
{
  unsigned int v3 = (BRLTTable *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleTable]);
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userLocale]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager _defaultLanguageRotorItem](self, "_defaultLanguageRotorItem"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager _tableIdentifierFromDefaultRotorItem:forLocale:]( self,  "_tableIdentifierFromDefaultRotorItem:forLocale:",  v6,  v5));
    if (v7) {
      id v8 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v7);
    }
    else {
      id v8 = (BRLTTable *)objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator defaultTableForLocale:]( &OBJC_CLASS___BRLTTableEnumerator,  "defaultTableForLocale:",  v5));
    }
    unsigned int v3 = v8;
  }

  return v3;
}

- (BRLTTable)brailleInputTableFromSettings
{
  unsigned int v3 = (BRLTTable *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleInputTable]);
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userLocale]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleManager _defaultLanguageRotorItem](self, "_defaultLanguageRotorItem"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager _tableIdentifierFromDefaultRotorItem:forLocale:]( self,  "_tableIdentifierFromDefaultRotorItem:forLocale:",  v6,  v5));
    if (v7) {
      id v8 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v7);
    }
    else {
      id v8 = (BRLTTable *)objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator defaultTableForLocale:]( &OBJC_CLASS___BRLTTableEnumerator,  "defaultTableForLocale:",  v5));
    }
    unsigned int v3 = v8;
  }

  return v3;
}

- (id)_defaultLanguageRotorItem
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace brailleLanguageRotorItems]);
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", @"Default", (void)v12));
        unsigned int v9 = [v8 BOOLValue];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)_tableIdentifierFromDefaultRotorItem:(id)a3 forLocale:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"LanguageDefaults"]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localeIdentifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  return v8;
}

- (id)_localeIdentifierForCurrentTable
{
  return -[BRLTTable localeIdentifier](self->_currentSetTable, "localeIdentifier");
}

- (id)_localeIdentifierForCurrentInputTable
{
  return -[BRLTTable localeIdentifier](self->_currentSetInputTable, "localeIdentifier");
}

- (id)_localeIdentifierForTableIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v3);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localeIdentifier](v4, "localeIdentifier"));
  return v5;
}

- (void)setTestingHasActiveDisplay:(BOOL)a3
{
  self->_testingHasActiveDisplay = a3;
  self->_BOOL hasActiveDisplay = a3;
}

- (BOOL)testingHasActiveDisplay
{
  if (self->_testingHasActiveDisplay) {
    return 1;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 voiceOverTouchUpdateBrailleWithoutConnectedDisplay];

  return v4;
}

- (unint64_t)testingBrailleElementIndex
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager valueForKeyPath:forThreadKey:waitTime:]( self,  "valueForKeyPath:forThreadKey:waitTime:",  @"_brailleElementIndex",  self->_threadKey,  kSCRCThreadWaitForever));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)testingBrailleElement
{
  return self->_brailleElement;
}

- (NSAttributedString)testingMainAttributedString
{
  return (NSAttributedString *)-[SCROBrailleClient mainAttributedString](self->_brailleClient, "mainAttributedString");
}

- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_1000C2860;
  v9[3] = &unk_100179B50;
  v9[4] = self;
  v9[5] = a3;
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime]( self,  "threadWaitTime",  _NSConcreteStackBlock,  3221225472LL,  sub_1000C2860,  &unk_100179B50,  self,  a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue( -[VOTBrailleManager valueForBlock:forThreadKey:waitTime:]( self,  "valueForBlock:forThreadKey:waitTime:",  v9,  threadKey));
  NSRange v6 = NSRangeFromString(v5);

  NSUInteger location = v6.location;
  NSUInteger length = v6.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (SCROBrailleClient)testingBrailleClient
{
  threadKey = self->_threadKey;
  -[VOTBrailleManager threadWaitTime](self, "threadWaitTime");
  -[VOTBrailleManager performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "testingBrailleElement",  threadKey,  0LL,  0LL,  0LL);
  return self->_brailleClient;
}

- (void)unitTestHandleBrailleKeypress:(id)a3
{
}

- (void)configureForUnitTesting
{
}

- (BOOL)brailleEnabled
{
  if ((AXDeviceIsAudioAccessory(self, a2) & 1) != 0) {
    return 0;
  }
  if (self->_hasActiveDisplay) {
    return 1;
  }
  return -[VOTBrailleManager testingHasActiveDisplay](self, "testingHasActiveDisplay");
}

- (BOOL)testingKeyboardHelpIsOn
{
  return self->_testingKeyboardHelpOn;
}

- (id)testingAggregatedStatus
{
  return -[VOTBrailleManager valueForKeyPath:forThreadKey:waitTime:]( self,  "valueForKeyPath:forThreadKey:waitTime:",  @"_testingAggregatedStatus",  self->_threadKey,  kSCRCThreadWaitForever);
}

- (void)resetTestingAggregatedStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000C29C8;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  -[VOTBrailleManager performAsyncBlock:forThreadKey:](self, "performAsyncBlock:forThreadKey:", v2, self->_threadKey);
}

- (void)refreshBrailleForTerminalOutput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  v9[0] = kSCROTokenAttribute;
  NSRange v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_brailleElementIndex));
  v9[1] = kSCROTerminalOutputAttribute;
  v10[0] = v6;
  v10[1] = &__kCFBooleanTrue;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  id v8 = -[NSAttributedString initWithString:attributes:](v5, "initWithString:attributes:", v4, v7);

  -[SCROBrailleClient setMainAttributedString:](self->_brailleClient, "setMainAttributedString:", v8);
  -[SCROBrailleClient displayIfNeeded](self->_brailleClient, "displayIfNeeded");
}

- (void)refreshBrailleForTerminalCommand:(id)a3 cursor:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  uint64_t v17 = kSCROEditableTextAttribute;
  id v18 = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  unsigned int v9 = -[NSMutableAttributedString initWithString:attributes:](v7, "initWithString:attributes:", v6, v8);

  id v10 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  uint64_t v15 = kSCROEditableTextPaddingAttribute;
  uint64_t v16 = &__kCFBooleanTrue;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  __int128 v12 = -[NSMutableAttributedString initWithString:attributes:](v10, "initWithString:attributes:", @" ", v11);

  -[NSMutableAttributedString appendAttributedString:](v9, "appendAttributedString:", v12);
  -[NSMutableAttributedString addAttribute:value:range:]( v9,  "addAttribute:value:range:",  kSCROCursorAttribute,  &__kCFBooleanTrue,  a4,  1LL);
  uint64_t v13 = kSCROTokenAttribute;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_brailleElementIndex));
  -[NSMutableAttributedString addAttribute:value:range:]( v9,  "addAttribute:value:range:",  v13,  v14,  0LL,  -[NSMutableAttributedString length](v9, "length"));

  -[SCROBrailleClient setMainAttributedString:](self->_brailleClient, "setMainAttributedString:", v9);
  -[SCROBrailleClient displayIfNeeded](self->_brailleClient, "displayIfNeeded");
}

- (BOOL)usesBrailleSubstitutions
{
  return self->_usesBrailleSubstitutions;
}

- (void)setUsesBrailleSubstitutions:(BOOL)a3
{
  self->_usesBrailleSubstitutions = a3;
}

- (void)setBrailleTableFromSettings:(id)a3
{
}

- (void)setBrailleInputTableFromSettings:(id)a3
{
}

- (VOTElement)previousTouchContainer
{
  return self->_previousTouchContainer;
}

- (void)setPreviousTouchContainer:(id)a3
{
}

- (VOTElement)previousElement
{
  return self->_previousElement;
}

- (void)setPreviousElement:(id)a3
{
}

- (BOOL)panEnabled
{
  return self->_panEnabled;
}

- (void)setPanEnabled:(BOOL)a3
{
  self->_panEnabled = a3;
}

- (NSString)brailleSubstitutionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setBrailleSubstitutionLanguage:(id)a3
{
}

- (double)lastUserInteractionTime
{
  return self->_lastUserInteractionTime;
}

- (_NSRange)brailleLineRange
{
  NSUInteger length = self->_brailleLineRange.length;
  NSUInteger location = self->_brailleLineRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)bookCursorPosition
{
  return self->_bookCursorPosition;
}

- (void)setBookCursorPosition:(int64_t)a3
{
  self->_unint64_t bookCursorPosition = a3;
}

- (int64_t)trailingBookCursorPosition
{
  return self->_trailingBookCursorPosition;
}

- (void)setTrailingBookCursorPosition:(int64_t)a3
{
  self->_trailingBookCursorPosition = a3;
}

- (int)lastRefreshTrigger
{
  return self->_lastRefreshTrigger;
}

- (void)setLastRefreshTrigger:(int)a3
{
  self->_lastRefreshTrigger = a3;
}

- (void)setTestingBrailleClient:(id)a3
{
}

- (BOOL)testingBrailleElementLocked
{
  return self->_testingBrailleElementLocked;
}

- (void)setTestingBrailleElementLocked:(BOOL)a3
{
  self->_testingBrailleElementLocked = a3;
}

- (double)threadWaitTime
{
  return self->_threadWaitTime;
}

- (void)setThreadWaitTime:(double)a3
{
  self->_threadWaitTime = a3;
}

- (id)tableSetCallback
{
  return self->_tableSetCallback;
}

- (void)setTableSetCallback:(id)a3
{
}

- (id)elementSetCallback
{
  return self->_elementSetCallback;
}

- (void)setElementSetCallback:(id)a3
{
}

- (id)keypressCallback
{
  return self->_keypressCallback;
}

- (void)setKeypressCallback:(id)a3
{
}

- (id)brailleStringSetCallback
{
  return self->_brailleStringSetCallback;
}

- (void)setBrailleStringSetCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end