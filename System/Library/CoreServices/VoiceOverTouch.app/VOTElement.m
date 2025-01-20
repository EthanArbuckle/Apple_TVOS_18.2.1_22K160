@interface VOTElement
+ (VOTElement)elementWithUIElement:(id)a3;
+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3;
+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3 cache:(id)a4 identification:(id)a5 initializeAssociatedPids:(BOOL)a6;
+ (id)customPublicRotorDictionaryForRotorId:(id)a3 startRange:(_NSRange)a4 direction:(int64_t)a5;
+ (id)defaultCustomActionCategory;
+ (id)elementAtPointIntercept;
+ (id)inputUIApplication;
+ (id)iosSystemAppApplication;
+ (id)organizedActionsByCategory:(id)a3;
+ (id)systemAppApplication;
+ (id)systemWideElement;
+ (void)initialize;
+ (void)resetInputUIAppElement;
+ (void)resetSystemAppElement;
+ (void)setElementAtPointIntercept:(id)a3;
+ (void)setSystemAppApplication:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)nonPersistentUniqueId;
- (AXUIElement)uiElement;
- (BOOL)_attemptPerformActivateActionWithElement:(id)a3;
- (BOOL)_elementActionsEquivalent:(id)a3 withElement:(id)a4;
- (BOOL)_ignoreCustomActionIndicator:(id)a3 withElement:(id)a4;
- (BOOL)_scrollForAction:(int)a3;
- (BOOL)activateDragWithDescriptorDictionary:(id)a3;
- (BOOL)activateIfSupported;
- (BOOL)activateKeyboardReturnKey;
- (BOOL)activatedDirectTouchThatRequiredActivation;
- (BOOL)allowCustomActionHintSpeakOverride;
- (BOOL)allowsActivationWithoutBeingNativeFocused;
- (BOOL)allowsAutoAlternativeCharacterActivation;
- (BOOL)applicationHandleRemoteDownButton;
- (BOOL)applicationHandleRemoteLeftButton;
- (BOOL)applicationHandleRemoteRightButton;
- (BOOL)applicationHandleRemoteUpButton;
- (BOOL)applicationIsRTL;
- (BOOL)applySelectedText:(id)a3 language:(id)a4;
- (BOOL)areMediaLegibilityEventsBeingTapped;
- (BOOL)attemptToShowContextMenuWithTargetPointValue:(id)a3;
- (BOOL)avoidAnnouncingDirectTouchArea;
- (BOOL)brailleTextEntrySupported;
- (BOOL)canBecomeNativeFocused;
- (BOOL)canExpandMathEquation;
- (BOOL)canNavigateMathSegments;
- (BOOL)checkedImmediateRemoteParent;
- (BOOL)checkedRemoteParent;
- (BOOL)containedIn:(unint64_t)a3;
- (BOOL)customPublicRotorIsVisibleInTouchRotor:(id)a3;
- (BOOL)dismissAlternativeKeyboardPicker;
- (BOOL)dispatchKeyboardEvent:(id)a3;
- (BOOL)doesHaveAllTraits:(unint64_t)a3;
- (BOOL)doesHaveTraits:(unint64_t)a3;
- (BOOL)doesHaveTraitsForGesturedTextInput;
- (BOOL)elementActsAsTitleElement:(id)a3;
- (BOOL)elementIsAncestor:(id)a3;
- (BOOL)elementIsDescendant:(id)a3;
- (BOOL)elementOnSameLine:(id)a3;
- (BOOL)elementVisibilityAffectsLayout;
- (BOOL)expandedStatusTogglesOnActivate;
- (BOOL)finishSetupIfAppropriate;
- (BOOL)fullscreenVideoViewIsVisible;
- (BOOL)handlesGestureArea;
- (BOOL)hasBadge;
- (BOOL)hasExplicitColumnInfo;
- (BOOL)hasExplicitRowInfo;
- (BOOL)hasImage;
- (BOOL)hasNativeFocus;
- (BOOL)hasPopup;
- (BOOL)includeDuringContentReading;
- (BOOL)includeRoleDescription;
- (BOOL)includeRoleOnlyForGroupNavigation;
- (BOOL)includeURLLabelInLabel;
- (BOOL)includesTrendlineInSonification;
- (BOOL)includesTrendlineSonification;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)isAccessibilitySystemUIServer;
- (BOOL)isAccessibleElement;
- (BOOL)isAccessibleGroup;
- (BOOL)isAlarmRinging;
- (BOOL)isAlive;
- (BOOL)isApplication;
- (BOOL)isAssistiveTouch;
- (BOOL)isAwayAlertItem;
- (BOOL)isAwayAlertItemNew;
- (BOOL)isBannerNotification;
- (BOOL)isCameraIrisOpen;
- (BOOL)isChronod;
- (BOOL)isClipViewService;
- (BOOL)isClockFace;
- (BOOL)isComboBox;
- (BOOL)isContainedByPreferredNativeFocusElement;
- (BOOL)isContainedByVideoElement;
- (BOOL)isDataSeriesElement;
- (BOOL)isDictationListening;
- (BOOL)isEditableTextArea;
- (BOOL)isElementFirstElement:(BOOL)a3 orLastElement:(BOOL)a4 withType:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstItemInDescriptionList;
- (BOOL)isFirstItemInFieldset;
- (BOOL)isFirstItemInLandmark;
- (BOOL)isFirstItemInList;
- (BOOL)isFirstItemInTable;
- (BOOL)isFirstItemInTree;
- (BOOL)isGoogleChrome;
- (BOOL)isHandUI;
- (BOOL)isHeadBoard;
- (BOOL)isHeader;
- (BOOL)isIBooks;
- (BOOL)isInAlert;
- (BOOL)isInAppSwitcher;
- (BOOL)isInDescriptionDefinition;
- (BOOL)isInDescriptionTerm;
- (BOOL)isInFolder;
- (BOOL)isInStatusBar;
- (BOOL)isInTableCell;
- (BOOL)isInternationalKeyboardKey;
- (BOOL)isKeyboardActiveOrAttached;
- (BOOL)isKeyboardContinuousPathAvailable;
- (BOOL)isKeyboardContinuousPathTracking;
- (BOOL)isKeyboardEmojiInputMode;
- (BOOL)isLiveCaptionsParagraphView;
- (BOOL)isLiveCaptionsTextView;
- (BOOL)isMail;
- (BOOL)isMapItem;
- (BOOL)isMaps;
- (BOOL)isMobilePhone;
- (BOOL)isPHAssetLocallyAvailable;
- (BOOL)isPineBoard;
- (BOOL)isPressed;
- (BOOL)isQuietModeEnabled;
- (BOOL)isRTL;
- (BOOL)isReadingContent;
- (BOOL)isRemoteElement;
- (BOOL)isRequired;
- (BOOL)isSafari;
- (BOOL)isSetupBuddy;
- (BOOL)isSiriTalkingOrListening;
- (BOOL)isSoftwareKeyboardActive;
- (BOOL)isSoftwareKeyboardMimic;
- (BOOL)isSpotlight;
- (BOOL)isSpringBoard;
- (BOOL)isStrongPasswordField;
- (BOOL)isSwitch;
- (BOOL)isSystemApp;
- (BOOL)isSystemBatteryLow;
- (BOOL)isSystemLocked;
- (BOOL)isSystemSleeping;
- (BOOL)isSystemWideGestureInProgress;
- (BOOL)isTouchContainer;
- (BOOL)isTourGuideRunning;
- (BOOL)isValid;
- (BOOL)isValidForApplication:(id)a3;
- (BOOL)isVisible;
- (BOOL)isVoiceControlRunning;
- (BOOL)isWesternTextForNonWesternLanguage:(id)a3 language:(id)a4;
- (BOOL)keyboardKeyAllowsTouchTyping;
- (BOOL)lastHitTestNearBorder;
- (BOOL)longPressHostContextId;
- (BOOL)mapsExplorationIsActive;
- (BOOL)mapsExplorationIsPending;
- (BOOL)onlyHasTraits:(unint64_t)a3;
- (BOOL)overridesVoiceOverInstructions;
- (BOOL)performCustomActionWithIdentifier:(id)a3;
- (BOOL)performCustomActionWithIdentifier:(id)a3 data:(id)a4;
- (BOOL)performEscape;
- (BOOL)performSimpleTap;
- (BOOL)performSimpleTap:(BOOL)a3;
- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 forElement:(id)a4;
- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5 withDelay:(float)a6 forElement:(id)a7;
- (BOOL)performTapAtPoint:(CGPoint)a3 withForce:(double)a4 playSound:(BOOL)a5;
- (BOOL)prefersContextlessPassthrough;
- (BOOL)readingContentCausesPageTurn;
- (BOOL)realtimeElementCompleted;
- (BOOL)realtimeElementUnread;
- (BOOL)remoteParentIsViewHost;
- (BOOL)replaceTextInRange:(_NSRange)a3 withString:(id)a4;
- (BOOL)requiresLaTeXInput;
- (BOOL)retainsCustomRotorActionSetting;
- (BOOL)roadContainsTrackingPoint:(CGPoint)a3;
- (BOOL)savePhotoLabeliCloud:(id)a3;
- (BOOL)scrollNextPage;
- (BOOL)scrollPreviousPage;
- (BOOL)scrollToBottom;
- (BOOL)scrollToTop;
- (BOOL)servesAsHeadingLandmark;
- (BOOL)setNativeFocus;
- (BOOL)shouldAddAlternateActionForLinkElement;
- (BOOL)shouldAnnounceFontInfo;
- (BOOL)shouldAnnounceTableInfo;
- (BOOL)shouldExpandMathEquation;
- (BOOL)shouldIgnoreTextEditingTrait;
- (BOOL)shouldIncludeMediaDescriptionsRotor;
- (BOOL)shouldIncludeRegionDescription;
- (BOOL)shouldIncludeRemoteParentCustomActions;
- (BOOL)shouldIncludeRowRangeInDescription;
- (BOOL)shouldPlaySoundWhenFocused;
- (BOOL)shouldSetNativeFocusWhenBecomingCurrentElement;
- (BOOL)shouldSkipImageTraitDescription;
- (BOOL)shouldSkipValidateElement;
- (BOOL)shouldSpeakExplorerElementsAfterFocus;
- (BOOL)shouldSpeakHelpInGestureArea;
- (BOOL)shouldSpeakMathEquationTrait;
- (BOOL)shouldSpeakScrollStatusOnEntry;
- (BOOL)shouldStartReadAllOnFocus;
- (BOOL)showBulletinBoard:(BOOL)a3;
- (BOOL)showControlCenter:(BOOL)a3;
- (BOOL)showsDualPages;
- (BOOL)softwareKeyboardSupportsGestureKeyboard;
- (BOOL)startStopToggle;
- (BOOL)supportsActivate;
- (BOOL)supportsAudiographActions;
- (BOOL)supportsAudiographs;
- (BOOL)supportsDataSeriesSonification;
- (BOOL)supportsDataSeriesSummarization;
- (BOOL)supportsDirectionOrbManipulation;
- (BOOL)supportsFrameForRange;
- (BOOL)supportsHeaderElementOutput;
- (BOOL)supportsMediaAnalysis;
- (BOOL)supportsPressedState;
- (BOOL)supportsRangeForLineNumber;
- (BOOL)supportsSecondaryActivate;
- (BOOL)supportsTextSelection;
- (BOOL)suppressCustomActionHint;
- (BOOL)tapHostContextId;
- (BOOL)textOperationsAvailable;
- (BOOL)touchContainerShouldOutputBraille;
- (BOOL)useElementAtPositionAfterActivation;
- (BOOL)usingBrailleHardwareKeyboard;
- (BOOL)usingHardwareKeyboard;
- (BOOL)verifyElementExists:(CGPoint *)a3;
- (BOOL)webSearchResultsActive;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4;
- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5;
- (CGPath)path;
- (CGPoint)centerPoint;
- (CGPoint)centerPointOfScreen;
- (CGPoint)contentOffset;
- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4;
- (CGPoint)elementFrameLocation:(int)a3;
- (CGPoint)mapsExplorationCurrentLocation;
- (CGPoint)visiblePoint;
- (CGRect)adaptFrameForSystemElement:(CGRect)a3;
- (CGRect)boundsForRange:(_NSRange)a3;
- (CGRect)convertAccessibilityFrameToScreenCoordinates:(CGRect)a3;
- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5;
- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4;
- (CGRect)frame;
- (CGRect)frameForDirectInteraction;
- (CGRect)frameForLineNumber:(int64_t)a3;
- (CGRect)frameForRange:(_NSRange)a3;
- (CGRect)gesturePracticeRegion;
- (CGRect)mediaAnalysisFrame;
- (CGRect)textCursorFrame;
- (CGRect)textMarkerFrame:(id)a3;
- (CGRect)visibleFrame;
- (NSArray)headerElements;
- (NSArray)linkedUIElements;
- (NSSet)previousSpokenValueParts;
- (NSString)chartStructureDescription;
- (NSString)definedLabel;
- (NSString)description;
- (NSString)guideElementHeaderText;
- (NSString)label;
- (NSString)supplementalBrailleDescription;
- (NSString)toggleStatusLabel;
- (NSString)userDefinedLabel;
- (NSString)value;
- (NSString)visibleText;
- (NSURL)photoLibraryURL;
- (VOTElement)cachedImmediateRemoteParent;
- (VOTElement)cachedRemoteApplication;
- (VOTElement)cachedRemoteParent;
- (VOTElement)chartElement;
- (VOTElement)elementForGesturedTextInput;
- (VOTElement)initWithAXElement:(__AXUIElement *)a3;
- (VOTElement)initWithPosition:(CGPoint)a3;
- (VOTElement)initWithPosition:(CGPoint)a3 application:(id)a4 contextId:(unsigned int)a5;
- (VOTElement)initWithPosition:(CGPoint)a3 startWithElement:(id)a4;
- (VOTElement)initWithUIElement:(id)a3;
- (VOTElement)initWithUIElement:(id)a3 initializeAssociatedPids:(BOOL)a4;
- (VOTElement)mediaAnalysisElement;
- (VOTElement)nextGuideElement;
- (VOTElement)previousGuideElement;
- (VOTElementSnapshot)snapshot;
- (VOTElementUniqueIdentification)uniqueIdentification;
- (_NSRange)_brailleLineRangeForDescription:(id)a3 position:(unint64_t)a4;
- (_NSRange)characterRangeForPosition:(unint64_t)a3;
- (_NSRange)columnRange;
- (_NSRange)indexPathAsRange;
- (_NSRange)lineRangeForPosition:(unint64_t)a3;
- (_NSRange)rangeForLineNumber:(int64_t)a3;
- (_NSRange)rangeForLineNumberAndColumn:(id)a3;
- (_NSRange)rangeForTextMarker:(id)a3;
- (_NSRange)rowRange;
- (_NSRange)selectedTextRange;
- (_NSRange)textInputElementRange;
- (_NSRange)textMarkerSelectionRange;
- (__AXUIElement)touchContainerAXElement;
- (__AXUIElement)touchContainerParentAXElement;
- (double)absoluteValue;
- (double)dataSeriesMaximumValueForAxis:(int64_t)a3;
- (double)dataSeriesMinimumValueForAxis:(int64_t)a3;
- (double)dataSeriesSonificationPlaybackDuration;
- (double)delayBeforeUpdatingOnActivation;
- (double)maxValue;
- (double)minValue;
- (float)activationDelay;
- (float)distanceToEndOfRoad:(CGPoint)a3 withDirection:(float)a4;
- (float)distanceToOtherRoad:(CGPoint)a3 withDirection:(float)a4 otherRoad:(id)a5;
- (id)_copyMathTextualInformationWithBrailleLineRange:(_NSRange *)a3 brailleDescriptionRange:(_NSRange *)a4 position:(unint64_t)a5 rotorSelection:(id)a6 shouldPreferRotorSelection:(BOOL)a7;
- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4;
- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5;
- (id)_initWithUIElement:(id)a3 identification:(id)a4 initializeAssociatedPids:(BOOL)a5;
- (id)_languageRangesForText:(id)a3;
- (id)_lastContainedElementIncludingRemotes:(BOOL)a3;
- (id)_mathAXStringFromAttributedString:(id)a3;
- (id)_mathExpression;
- (id)_rawMathEquation;
- (id)_removeBadDeveloperDecisions:(id)a3;
- (id)_resolvedOutputLanguage:(BOOL *)a3;
- (id)_roleDescriptionWithInteractOption:(int64_t)a3 language:(id)a4;
- (id)_selectionStringForSegment:(int64_t)a3;
- (id)_sourceNameForChangeOriginator:(int64_t)a3;
- (id)accessibleAncestor;
- (id)accessibleDescendants;
- (id)activeKeyboard;
- (id)ancestryForTraits:(unint64_t)a3;
- (id)appSwitcherApps;
- (id)application;
- (id)applicationProvidedOCRText;
- (id)arrayForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)arrayOfTraitsAsStrings;
- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3;
- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3 language:(id)a4;
- (id)attachmentFilenameForCID:(id)a3;
- (id)attributedValueForRange:(_NSRange)a3;
- (id)autoSpeakWatchElements;
- (id)bundleIdentifier;
- (id)cachedCustomRotorActions;
- (id)cellWithRowIndexPath:(_NSRange)a3 parentView:(id)a4;
- (id)chartDescriptor;
- (id)concatenateLabelsWithLinebreaksBasedOnFrame:(id)a3;
- (id)containerTypes;
- (id)contextDescriptors;
- (id)copyWithCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentHardwareKeyboardLayout;
- (id)currentLocalization;
- (id)currentOpaqueElement;
- (id)currentSoftwareKeyboardLanguage;
- (id)currentSoftwareKeyboardLayout;
- (id)currentStatus;
- (id)customActionGroupIdentifier;
- (id)customContent;
- (id)customPublicRotorForSystemType:(id)a3;
- (id)customPublicRotorName:(id)a3;
- (id)customPublicRotorNames;
- (id)customPublicRotorResultWithItem:(id)a3 startElement:(id)a4;
- (id)customPublicRotors;
- (id)customRotorActions;
- (id)dataDetectorURL:(CGPoint)a3;
- (id)dataSeriesAxesDescription;
- (id)dataSeriesCategoryLabelsForAxis:(int64_t)a3;
- (id)dataSeriesElement;
- (id)dataSeriesGridlinePositionsForAxis:(int64_t)a3;
- (id)dataSeriesName;
- (id)dataSeriesTitleForAxis:(int64_t)a3;
- (id)dataSeriesUnitsLabelForAxis:(int64_t)a3;
- (id)dataSeriesValuesForAxis:(int64_t)a3;
- (id)dataSeriesXAxisValueDescriptionForPosition:(double)a3;
- (id)dataSeriesYAxisValueDescriptionForPosition:(double)a3;
- (id)directParent;
- (id)elementAtRow:(int64_t)a3 andColumn:(int64_t)a4;
- (id)elementCommunity;
- (id)elementCommunityIdentifier;
- (id)elementForAttribute:(int64_t)a3;
- (id)elementForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)elementForTextMarker:(id)a3;
- (id)elementStoredUserLabel;
- (id)elementsForAttribute:(int64_t)a3;
- (id)elementsForAttribute:(int64_t)a3 withParameter:(id)a4;
- (id)elementsInDirection:(int64_t)a3 withCount:(unint64_t)a4;
- (id)equivalenceTag;
- (id)errorMessageElements;
- (id)expandedTextValue;
- (id)explorerElements;
- (id)fbSceneIdentifier;
- (id)firstContainedElement;
- (id)firstElementInApplication;
- (id)firstElementInApplicationForFocus;
- (id)firstElementInApplicationForReadFromTop;
- (id)firstElementInStatusBar;
- (id)firstResponderElement;
- (id)firstResponderElementForFocus;
- (id)firstResponderElementWithoutCache;
- (id)firstVisibleElementInList;
- (id)firstWebElement;
- (id)flowToElements;
- (id)focusModeActivityName;
- (id)focusedApplications;
- (id)formattedDatetime;
- (id)generateCVMLContentForBraille;
- (id)gesturedTextInputAttributes;
- (id)groupedParent;
- (id)headerElementsForColumn:(unint64_t)a3;
- (id)headerElementsForRow:(unint64_t)a3;
- (id)headingLevelValue;
- (id)hint;
- (id)identifier;
- (id)imageAssetLocalIdentifier;
- (id)imageOverlayElements;
- (id)immediateRemoteParent;
- (id)initApplicationWithPid:(int)a3;
- (id)initApplicationWithPosition:(CGPoint)a3;
- (id)instructions;
- (id)invalidStatus;
- (id)isolatedWindow;
- (id)itemChooserName;
- (id)labeledTouchContainer;
- (id)language;
- (id)lastContainedElement;
- (id)lastElementInApplication;
- (id)lastElementInStatusBar;
- (id)launchableApps;
- (id)lineNumberAndColumnForPoint:(CGPoint)a3;
- (id)linkRelationshipType;
- (id)linkedElement;
- (id)localOpaqueParent;
- (id)mapDetailedInformationAtPoint:(CGPoint)a3;
- (id)mapsExplorationChangeVerbosity:(BOOL)a3;
- (id)mapsExplorationCurrentIntersectionDescription;
- (id)mapsExplorationCurrentRoadsWithAngles;
- (id)mathBrailleDescription;
- (id)mathEquationDescription;
- (id)mathSegmentsWithGranularityLevel:(unint64_t)a3;
- (id)mathSummary;
- (id)nativeFocusElement;
- (id)nativeFocusPreferredElement;
- (id)nextContainer;
- (id)nextElement;
- (id)nextTextNavigationElement;
- (id)notificationSummary:(unint64_t)a3;
- (id)objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4;
- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5;
- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5 peeking:(BOOL)a6 startOpaqueElement:(id)a7;
- (id)opaqueParent;
- (id)originalLabel;
- (id)outermostLocalOpaqueParent;
- (id)pageContent;
- (id)pageTextMarkerRange;
- (id)parentTableOrCollectionView;
- (id)photoDescription;
- (id)popupValue;
- (id)previousContainer;
- (id)previousElement;
- (id)previousTextNavigationElement;
- (id)realtimeElements;
- (id)regionDescriptionWithFrame:(CGRect)a3;
- (id)remoteApplication;
- (id)remoteParent;
- (id)resolvedEditingStyles;
- (id)roleDescription;
- (id)scrollStatus;
- (id)sortDirection;
- (id)staticRecognitionText;
- (id)staticTextString;
- (id)statusBarElements;
- (id)stringForLineNumber:(int64_t)a3;
- (id)stringForParameterizedAttribute:(int64_t)a3 parameter:(id)a4;
- (id)stringForTextMarkers:(id)a3;
- (id)summaryElement;
- (id)supportedLanguageIfNecessary;
- (id)tableDimensionStringWithRow:(unint64_t)a3 andColumn:(unint64_t)a4;
- (id)textInputElement;
- (id)textLineEndMarker:(id)a3;
- (id)textLineStartMarker:(id)a3;
- (id)textMarkerArrayOfText:(id)a3;
- (id)textMarkerForPoint:(CGPoint)a3;
- (id)textMarkerRange;
- (id)textMarkerRangeForSelection;
- (id)textMarkersForPoints:(id)a3;
- (id)textMarkersForRange:(_NSRange)a3;
- (id)textNextMarker:(id)a3;
- (id)textOperations;
- (id)textOperationsOperator;
- (id)textPreviousMarker:(id)a3;
- (id)textReplacements;
- (id)textualContext;
- (id)titleElements;
- (id)touchContainer;
- (id)touchContainerParent;
- (id)typingCandidateElements;
- (id)upcomingRoadsAtPoint:(CGPoint)a3 withDirection:(float)a4;
- (id)url;
- (id)urlLabel;
- (id)valueForRange:(_NSRange)a3;
- (id)valueWithUpdate:(BOOL)a3;
- (id)visibleOpaqueElements;
- (id)visionFeatureDescriptionOptions;
- (id)webAreaURL;
- (id)window;
- (id)windowContextIDs;
- (id)windowSceneIdentifier;
- (int)applicationInterfaceOrientation;
- (int)pid;
- (int64_t)_changeOriginatorForSourceName:(id)a3;
- (int64_t)applicationOrientation;
- (int64_t)aspectMask;
- (int64_t)customPublicRotorLinkCountForRotor:(id)a3;
- (int64_t)dataSeriesType;
- (int64_t)differenceAspectMask:(id)a3;
- (int64_t)expandedStatus;
- (int64_t)lineEndPosition;
- (int64_t)lineNumberForPoint:(CGPoint)a3;
- (int64_t)lineStartPosition;
- (int64_t)mapFeatureType;
- (int64_t)overriddenInterpretationForCommand:(int64_t)a3;
- (int64_t)temporaryVoiceOverStatus;
- (int64_t)valueChangeOriginationSource;
- (int64_t)versionedPID;
- (unint64_t)_minimumSegmentDepth;
- (unint64_t)_minimumSegmentDepthForExpression:(id)a3 withMaximumDepth:(unint64_t)a4;
- (unint64_t)ariaColumnCount;
- (unint64_t)ariaColumnIndex;
- (unint64_t)ariaRowCount;
- (unint64_t)ariaRowIndex;
- (unint64_t)blockquoteLevel;
- (unint64_t)columnCount;
- (unint64_t)containerType;
- (unint64_t)directTouchOptions;
- (unint64_t)groupedChildrenCount;
- (unint64_t)hash;
- (unint64_t)notificationCount;
- (unint64_t)rowCount;
- (unint64_t)traits;
- (unsigned)cachedDisplayId;
- (unsigned)displayId;
- (unsigned)mediaAnalysisOptions;
- (unsigned)secureName;
- (unsigned)windowContextId;
- (unsigned)windowContextIdForPress;
- (unsigned)windowContextIdImmediateRemoteParent:(unsigned int)a3;
- (void)_addErrorMessageElement:(id)a3 toRequest:(id)a4;
- (void)_addHeaderElement:(id)a3 toRequest:(id)a4;
- (void)_applyAttributesFromText:(id)a3 toRequest:(id)a4 withLanguage:(id)a5;
- (void)_applyBrailleTextFormattingAndInlineCompletionOptions:(id)a3 attributedString:(id)a4 brailleLineRange:(_NSRange)a5 rangeOffset:(unint64_t)a6;
- (void)_applyCurrentStatus:(id)a3 language:(id)a4;
- (void)_applyCustomContent:(id)a3 language:(id)a4;
- (void)_applyDatetimeAttribute:(id)a3 language:(id)a4;
- (void)_applyExpandedStatus:(id)a3 language:(id)a4;
- (void)_applyHasPopupAttribute:(id)a3 withLanguage:(id)a4;
- (void)_applyHeaderStatus:(id)a3 language:(id)a4;
- (void)_applyInvalidStatus:(id)a3 language:(id)a4;
- (void)_applyLabelToRequest:(id)a3 includeBlockQuote:(BOOL)a4 language:(id)a5 isWebLanguageChoice:(BOOL)a6 interactOption:(int64_t)a7;
- (void)_applyLanguageTokens:(id)a3 attributedString:(id)a4;
- (void)_applyLinkRelationshipType:(id)a3 language:(id)a4;
- (void)_applyRoleDescription:(id)a3 language:(id)a4 interactOption:(int64_t)a5;
- (void)_applySelectedTrait:(id)a3 language:(id)a4;
- (void)_applySortDirection:(id)a3 language:(id)a4;
- (void)_applyStickyCustomActions:(id)a3 customAction:(id)a4 language:(id)a5;
- (void)_applyTableColumnIndex:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)_applyTableRowColumnSpan:(id)a3 language:(id)a4;
- (void)_applyTableRowIndex:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)_applyTraitsToRequest:(id)a3 options:(unint64_t)a4 numHeaderActions:(unint64_t)a5 language:(id)a6;
- (void)_applyValueToRequest:(id)a3 options:(unint64_t)a4 lastSeenLineAndColumn:(id)a5 language:(id)a6;
- (void)_configureAsSingleLinkElementWithRequest:(id)a3 linkTraitTitle:(id)a4 hint:(id)a5;
- (void)_copyInternalsToElement:(id)a3;
- (void)_iterateSelfAndRemoteParentsUsingBlock:(id)a3;
- (void)_updateFocusForFKA:(BOOL)a3;
- (void)_updateValueChangeOriginatorForApplication:(int64_t)a3;
- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11;
- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11 updateValue:(BOOL)a12 singleLine:(BOOL)a13;
- (void)addTextualInformationToRequest:(id)a3 options:(unint64_t)a4 dataPackage:(id)a5;
- (void)addTitleElementToCache:(id)a3;
- (void)announceAdditionalTextualInformation:(id)a3;
- (void)announceTableInfo:(id)a3 options:(unint64_t)a4 language:(id)a5;
- (void)applyCVMLGeneratedContentToRequest:(id)a3 explicitUserRequest:(BOOL)a4;
- (void)applyHeaderElementsToRequest:(id)a3;
- (void)applyInvalidStatusToRequest:(id)a3;
- (void)applyRowHeadersToRequest:(id)a3;
- (void)applyTableDimension:(id)a3 language:(id)a4;
- (void)applyTextEditingInformation:(id)a3 request:(id)a4 options:(unint64_t)a5;
- (void)clearElementForGesturedTextInput;
- (void)decreaseTrackingDetail;
- (void)decreaseWebSelection:(int64_t)a3;
- (void)decrementAction;
- (void)deleteCharacterAtCursorWithSource:(int64_t)a3;
- (void)expandMathEquation;
- (void)findSearchResult:(BOOL)a3 withSearchText:(id)a4;
- (void)handwritingSendCarriageReturn;
- (void)increaseTrackingDetail;
- (void)increaseWebSelection:(int64_t)a3;
- (void)incrementAction;
- (void)initializeAssociatedPids;
- (void)insertText:(id)a3 source:(int64_t)a4;
- (void)jumpToTableIndex:(id)a3;
- (void)launchAppWithDisplayID:(id)a3;
- (void)mapsExplorationBeginFromCurrentElement:(BOOL)a3;
- (void)mapsExplorationContinueWithVertexIndex:(unint64_t)a3;
- (void)mapsExplorationEnd;
- (void)mapsExplorationRecordTouchpoint:(CGPoint)a3;
- (void)notifyAnnouncementFinishedWithString:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)performDoubleTap;
- (void)performTextOperation:(id)a3;
- (void)postFingerDragAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5;
- (void)postFingerLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4;
- (void)postFingerTouchAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5;
- (void)postStylusDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7;
- (void)postStylusLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4;
- (void)postStylusTouchAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7;
- (void)regionDescriptionWithCompletion:(id)a3;
- (void)replaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4 source:(int64_t)a5;
- (void)repostEvent:(id)a3;
- (void)resetAspectMask;
- (void)resetBannerTimer;
- (void)restoreUserPreferencesChangedByHandwriting;
- (void)scrollDownPage;
- (void)scrollLeftPage;
- (void)scrollRectToVisible:(CGRect)a3 withCompletion:(id)a4;
- (void)scrollRightPage;
- (void)scrollToElementForDirectional:(int64_t)a3 withCompletion:(id)a4;
- (void)scrollToPoint:(CGPoint)a3;
- (void)scrollUpPage;
- (void)sendBrightnessEvent:(id)a3;
- (void)sendTouchCancelledEvent;
- (void)sendUserEventOccurred;
- (void)setAccelemoterDisabled:(BOOL)a3;
- (void)setActivatedDirectTouchThatRequiredActivation:(BOOL)a3;
- (void)setAspectMask:(int64_t)a3;
- (void)setCachedDisplayId:(unsigned int)a3;
- (void)setCachedImmediateRemoteParent:(id)a3;
- (void)setCachedRemoteApplication:(id)a3;
- (void)setCachedRemoteParent:(id)a3;
- (void)setCheckedImmediateRemoteParent:(BOOL)a3;
- (void)setCheckedRemoteParent:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setCurrentWordContextForBook:(id)a3;
- (void)setDefinedLabel:(id)a3;
- (void)setElementForGesturedTextInput:(id)a3;
- (void)setEventCaptureMode:(int)a3;
- (void)setFirstResponder:(id)a3;
- (void)setGesturePracticeInfo:(id)a3;
- (void)setIsFirstItemInDescriptionList:(BOOL)a3;
- (void)setIsFirstItemInFieldset:(BOOL)a3;
- (void)setIsFirstItemInLandmark:(BOOL)a3;
- (void)setIsFirstItemInList:(BOOL)a3;
- (void)setIsFirstItemInTable:(BOOL)a3;
- (void)setIsFirstItemInTree:(BOOL)a3;
- (void)setNavigationDirectionMode:(int64_t)a3;
- (void)setPreviousSpokenValueParts:(id)a3;
- (void)setRotationCapabilityEnabled:(BOOL)a3;
- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4;
- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4 isVoiceOverSelectionMovement:(BOOL)a5;
- (void)setSelectionToTextMarker:(id)a3;
- (void)setShouldSkipValidateElement:(BOOL)a3;
- (void)setSupplementalBrailleDescription:(id)a3;
- (void)setTemporaryVoiceOverStatus:(int64_t)a3;
- (void)setUserDefinedLabel:(id)a3;
- (void)setVoiceOverFocused:(BOOL)a3;
- (void)showEditingHUD;
- (void)unsetEventCaptureMode:(int)a3;
- (void)updateCache;
- (void)updateCenterPoint;
- (void)updateCustomPublicRotors;
- (void)updateEquivalenceTag;
- (void)updateExpandedStatus;
- (void)updateFlowToElements;
- (void)updateFocusActiveActivityDisplayName;
- (void)updateFrame;
- (void)updateGesturedTextInputAttributes;
- (void)updateHint;
- (void)updateIsVisible;
- (void)updateLabel;
- (void)updateLanguage;
- (void)updatePageContent;
- (void)updatePaths;
- (void)updateRTL;
- (void)updateRoleDescription;
- (void)updateTouchForceSounds:(double)a3;
- (void)updateTraits;
- (void)updateValue;
- (void)updateVisiblePoint;
- (void)updateWindowContextId;
- (void)zoomInAtLocation:(CGPoint)a3;
- (void)zoomOutAtLocation:(CGPoint)a3;
@end

@implementation VOTElement

+ (void)initialize
{
  if (qword_1001ACC60 != -1) {
    dispatch_once(&qword_1001ACC60, &stru_100176F50);
  }
}

+ (id)systemWideElement
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    if (qword_1001ACC68 == -1) {
      return (id)qword_1001ACC38;
    }
    v4 = &qword_1001ACC68;
    v5 = &stru_100176F70;
    goto LABEL_8;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014C8C;
  block[3] = &unk_100176EE0;
  block[4] = a1;
  if (qword_1001ACC70 != -1)
  {
    v4 = &qword_1001ACC70;
    v5 = (Block_layout *)block;
LABEL_8:
    dispatch_once(v4, v5);
  }

  return (id)qword_1001ACC38;
}

+ (void)setSystemAppApplication:(id)a3
{
}

+ (id)systemAppApplication
{
  id v2 = [(id)VOTSharedWorkspace inUnitTestMode];
  if ((v2 & 1) != 0)
  {
    v4 = &qword_1001ACC78;
LABEL_12:
    id v5 = (id)*v4;
    return v5;
  }

  if ((AXDeviceIsAudioAccessory(v2, v3) & 1) == 0)
  {
    id v6 = [(id)qword_1001ACC50 lock];
    if (!qword_1001ACC40 && (AXInPreboardScenario(v6) & 1) == 0 && (AXInCheckerBoardScenario() & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);

      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElementsWithAttribute:1001]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v10));
      v12 = (void *)qword_1001ACC40;
      qword_1001ACC40 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001ACC40 uiElement]);
      id v14 = [v13 axElement];

      if (v14) {
        AXUIElementRegisterForApplicationDeath(v14, &stru_100176F90);
      }
    }

    [(id)qword_1001ACC50 unlock];
    v4 = &qword_1001ACC40;
    goto LABEL_12;
  }

  id v5 = 0LL;
  return v5;
}

+ (id)inputUIApplication
{
  uint64_t v2 = qword_1001ACC48;
  if (!qword_1001ACC48 || (uint64_t v2 = (uint64_t)[(id)qword_1001ACC48 isValid], (v2 & 1) == 0))
  {
    if ((AXInPreboardScenario(v2) & 1) == 0 && (AXInCheckerBoardScenario() & 1) == 0)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);

      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElementsWithAttribute:1011]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v6));
      v8 = (void *)qword_1001ACC48;
      qword_1001ACC48 = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001ACC48 uiElement]);
      id v10 = [v9 axElement];

      if (v10) {
        AXUIElementRegisterForApplicationDeath(v10, &stru_100176FB0);
      }
    }
  }

  [(id)qword_1001ACC58 unlock];
  return (id)qword_1001ACC48;
}

+ (id)iosSystemAppApplication
{
  else {
    return 0LL;
  }
}

+ (void)resetSystemAppElement
{
  uint64_t v2 = (void *)qword_1001ACC40;
  qword_1001ACC40 = 0LL;

  [(id)qword_1001ACC50 unlock];
}

+ (void)resetInputUIAppElement
{
  uint64_t v2 = (void *)qword_1001ACC48;
  qword_1001ACC48 = 0LL;

  [(id)qword_1001ACC58 unlock];
}

+ (VOTElement)elementWithUIElement:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)a1) initWithUIElement:v4];

  return (VOTElement *)v5;
}

+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3 cache:(id)a4 identification:(id)a5 initializeAssociatedPids:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_allocWithZone((Class)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( &OBJC_CLASS___AXUIElement,  "uiElementWithAXElement:cache:",  a3,  v11));

  id v14 = [v12 _initWithUIElement:v13 identification:v10 initializeAssociatedPids:v6];
  return v14;
}

+ (id)_elementWithAXUIElementRef:(__AXUIElement *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 elementWithUIElement:v4]);

  return v5;
}

+ (id)elementAtPointIntercept
{
  return objc_retainBlock((id)qword_1001ACC80);
}

+ (void)setElementAtPointIntercept:(id)a3
{
  id v3 = objc_retainBlock(a3);
  id v4 = (void *)qword_1001ACC80;
  qword_1001ACC80 = (uint64_t)v3;
}

- (id)initApplicationWithPid:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiApplicationWithPid:]( &OBJC_CLASS___AXUIElement,  "uiApplicationWithPid:",  *(void *)&a3));
  id v5 = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v4);

  return v5;
}

- (id)initApplicationWithPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    BOOL v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiApplicationAtCoordinate:]( &OBJC_CLASS___AXUIElement,  "uiApplicationAtCoordinate:",  x,  y));
    self = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v7);

    BOOL v6 = self;
  }

  return v6;
}

- (VOTElement)initWithAXElement:(__AXUIElement *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", a3));
  id v5 = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v4);

  return v5;
}

- (VOTElement)initWithUIElement:(id)a3
{
  return -[VOTElement initWithUIElement:initializeAssociatedPids:]( self,  "initWithUIElement:initializeAssociatedPids:",  a3,  1LL);
}

- (VOTElement)initWithUIElement:(id)a3 initializeAssociatedPids:(BOOL)a4
{
  return (VOTElement *)-[VOTElement _initWithUIElement:identification:initializeAssociatedPids:]( self,  "_initWithUIElement:identification:initializeAssociatedPids:",  a3,  0LL,  a4);
}

- (id)_initWithUIElement:(id)a3 identification:(id)a4 initializeAssociatedPids:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VOTElement;
  id v11 = -[VOTElement init](&v15, "init");
  id v12 = v11;
  v13 = 0LL;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_uiElement, a3);
    v12->_lastOrbSoundLevel = 0;
    v12->_aspectMask = 31LL;
    if (!-[VOTElement isApplication](v12, "isApplication")) {
      objc_storeStrong((id *)&v12->_uniqueIdentification, a4);
    }
    if (v5) {
      -[VOTElement initializeAssociatedPids](v12, "initializeAssociatedPids");
    }
    v13 = v12;
  }

  return v13;
}

- (void)initializeAssociatedPids
{
  if (!-[VOTElement isApplication](self, "isApplication"))
  {
    uint64_t v3 = -[VOTElement pid](self, "pid");
    if (!_AXIsPidAssociated())
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
      _AXAddAssociatedPid([v4 pid], v3, 0);
    }
  }

- (VOTElement)initWithPosition:(CGPoint)a3 startWithElement:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 uiElement]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementAtCoordinate:startWithElement:]( &OBJC_CLASS___AXUIElement,  "uiElementAtCoordinate:startWithElement:",  v7,  x,  y));

  id v9 = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v8);
  return v9;
}

- (VOTElement)initWithPosition:(CGPoint)a3 application:(id)a4 contextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 uiElement]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementAtCoordinate:forApplication:contextId:]( AXUIElement,  "uiElementAtCoordinate:forApplication:contextId:",  [v9 axElement],  v5,  x,  y));

  id v11 = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v10);
  return v11;
}

- (VOTElement)initWithPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v7 = (uint64_t (**)(double, double))objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementAtCoordinate:]( &OBJC_CLASS___AXUIElement,  "uiElementAtCoordinate:",  x,  y));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
    if ([v10 isAppSwitcherVisible])
    {
      unsigned int v11 = [v7 pid];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
      unsigned int v13 = [v12 pid];

      if (v11 != v13)
      {

LABEL_9:
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
        id v15 = objc_msgSend(v14, "contextIdForPosition:", x, y);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
        id v17 = [v16 contextIdHostingContextId:v15];

        if (!(_DWORD)v17) {
          goto LABEL_13;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiApplicationForContext:]( &OBJC_CLASS___AXUIElement,  "uiApplicationForContext:",  v17));
        uint64_t v7 = (uint64_t (**)(double, double))objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementAtCoordinate:forApplication:contextId:]( AXUIElement,  "uiElementAtCoordinate:forApplication:contextId:",  [v18 axElement],  v17,  x,  y));

        if (!v7) {
          goto LABEL_13;
        }
LABEL_11:
        id v9 = -[VOTElement initWithUIElement:](self, "initWithUIElement:", v7);
        self = v9;
        goto LABEL_12;
      }
    }

    else
    {
    }

    if (v7) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementAtPointIntercept](&OBJC_CLASS___VOTElement, "elementAtPointIntercept"));

  if (!v6)
  {
LABEL_13:
    v19 = 0LL;
    goto LABEL_14;
  }

  uint64_t v7 = (uint64_t (**)(double, double))objc_claimAutoreleasedReturnValue( +[VOTElement elementAtPointIntercept]( &OBJC_CLASS___VOTElement,  "elementAtPointIntercept"));
  uint64_t v8 = v7[2](x, y);
  id v9 = (VOTElement *)objc_claimAutoreleasedReturnValue(v8);
LABEL_12:
  v19 = v9;

LABEL_14:
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (objc_msgSend((id)VOTSharedWorkspace, "inUnitTestMode", a3)
    && (uiElement = self->_uiElement,
        uint64_t v6 = objc_opt_class(&OBJC_CLASS___AXUIMockElement, v4),
        (objc_opt_isKindOfClass(uiElement, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElement elementWithUIElement:]( &OBJC_CLASS___VOTElement,  "elementWithUIElement:",  self->_uiElement));
  }

  else
  {
    id v8 = -[UIElementProtocol axElement](self->_uiElement, "axElement");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uniqueIdentification](self, "uniqueIdentification"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElement _elementWithAXUIElementRef:cache:identification:initializeAssociatedPids:]( &OBJC_CLASS___VOTElement,  "_elementWithAXUIElementRef:cache:identification:initializeAssociatedPids:",  v8,  0LL,  v9,  0LL));
  }

  -[VOTElement _copyInternalsToElement:](self, "_copyInternalsToElement:", v7);
  return v7;
}

- (id)copyWithCache
{
  id v3 = -[UIElementProtocol copyCachedAttributes](self->_uiElement, "copyCachedAttributes");
  if ([(id)VOTSharedWorkspace inUnitTestMode]
    && (uint64_t v5 = self->_uiElement,
        uint64_t v6 = objc_opt_class(&OBJC_CLASS___AXUIMockElement, v4),
        (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    id v7 = -[UIElementProtocol copyWithZone:](self->_uiElement, "copyWithZone:", 0LL);
    [v7 setAttributes:v3];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v7));
  }

  else
  {
    uiElement = self->_uiElement;
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___AXUIElement, v4);
    if ((objc_opt_isKindOfClass(uiElement, v10) & 1) == 0)
    {
      id v12 = 0LL;
      goto LABEL_8;
    }

    id v11 = -[UIElementProtocol axElement](self->_uiElement, "axElement");
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement uniqueIdentification](self, "uniqueIdentification"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[VOTElement _elementWithAXUIElementRef:cache:identification:initializeAssociatedPids:]( &OBJC_CLASS___VOTElement,  "_elementWithAXUIElementRef:cache:identification:initializeAssociatedPids:",  v11,  v3,  v7,  0LL));
  }

  id v12 = (void *)v8;

LABEL_8:
  -[VOTElement _copyInternalsToElement:](self, "_copyInternalsToElement:", v12);

  return v12;
}

- (void)_copyInternalsToElement:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "setCachedDisplayId:", -[VOTElement cachedDisplayId](self, "cachedDisplayId"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement definedLabel](self, "definedLabel"));
  id v5 = [v4 copy];
  [v10 setDefinedLabel:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement userDefinedLabel](self, "userDefinedLabel"));
  id v7 = [v6 copy];
  [v10 setUserDefinedLabel:v7];

  objc_msgSend(v10, "setIsFirstItemInList:", -[VOTElement isFirstItemInList](self, "isFirstItemInList"));
  objc_msgSend(v10, "setIsFirstItemInTable:", -[VOTElement isFirstItemInTable](self, "isFirstItemInTable"));
  objc_msgSend(v10, "setIsFirstItemInLandmark:", -[VOTElement isFirstItemInLandmark](self, "isFirstItemInLandmark"));
  objc_msgSend(v10, "setIsFirstItemInFieldset:", -[VOTElement isFirstItemInFieldset](self, "isFirstItemInFieldset"));
  objc_msgSend(v10, "setIsFirstItemInTree:", -[VOTElement isFirstItemInTree](self, "isFirstItemInTree"));
  objc_msgSend( v10,  "setIsFirstItemInDescriptionList:",  -[VOTElement isFirstItemInDescriptionList](self, "isFirstItemInDescriptionList"));
  objc_msgSend( v10,  "setActivatedDirectTouchThatRequiredActivation:",  -[VOTElement activatedDirectTouchThatRequiredActivation](self, "activatedDirectTouchThatRequiredActivation"));
  elementForGesturedTextInput = self->_elementForGesturedTextInput;
  if (elementForGesturedTextInput != self)
  {
    id v9 = -[VOTElement copyWithCache](elementForGesturedTextInput, "copyWithCache");
    [v10 setElementForGesturedTextInput:v9];
  }
}

- (int)pid
{
  return -[UIElementProtocol pid](self->_uiElement, "pid");
}

- (BOOL)isValid
{
  return -[UIElementProtocol isValid](self->_uiElement, "isValid");
}

- (BOOL)isAlive
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2088LL);
}

- (BOOL)isValidForApplication:(id)a3
{
  uiElement = self->_uiElement;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 uiElement]);
  LOBYTE(uiElement) = -[UIElementProtocol isValidForApplication:]( uiElement,  "isValidForApplication:",  v4);

  return (char)uiElement;
}

- (AXUIElement)uiElement
{
  return self->_uiElement;
}

- (id)language
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2008LL);
}

- (void)updateRTL
{
}

- (void)setNavigationDirectionMode:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[UIElementProtocol setAXAttribute:withNumber:](uiElement, "setAXAttribute:withNumber:", 3026LL, v4);
}

- (BOOL)isRTL
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3026LL);
}

- (BOOL)applicationIsRTL
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3066LL);
}

- (CGPoint)centerPoint
{
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)visiblePoint
{
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)containedIn:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement containerTypes](self, "containerTypes"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)tapHostContextId
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2234LL);
}

- (BOOL)longPressHostContextId
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2235LL);
}

- (id)containerTypes
{
  else {
    double v3 = &__NSArray0__struct;
  }
  return v3;
}

- (unint64_t)containerType
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2187LL));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (id)formattedDatetime
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2170LL));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCRCWebDateTimeParser sharedInstance](&OBJC_CLASS___SCRCWebDateTimeParser, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 spokenStringForDateTimeAttribute:v2]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)supportedLanguageIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);

  if (!v3) {
    return 0LL;
  }
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC88);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v6 = v5;
  if (v5)
  {
    if ([v5 length]) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
    uint64_t v8 = v7;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 3014LL));
    if ([v10 count])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);

      if ([v12 length])
      {
        id v13 = [v12 rangeOfString:@"-"];
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 substringToIndex:v13]);

          id v12 = (void *)v14;
        }

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v15 = v10;
        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v27;
          while (2)
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              uint64_t v21 = AXLanguageConvertToCanonicalForm(v20);
              id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
              if (!v22) {
                id v22 = v20;
              }
              unsigned __int8 v23 = objc_msgSend(v22, "hasPrefix:", v12, (void)v26);

              if ((v23 & 1) != 0)
              {
                uint64_t v8 = 0LL;
                goto LABEL_26;
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
      }

      id v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0, (void)v26));
      uint64_t v24 = AXLanguageConvertToCanonicalForm(v15);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
LABEL_26:
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    if (v8) {
      v25 = v8;
    }
    else {
      v25 = &stru_10017A920;
    }
    objc_setAssociatedObject(self, &unk_1001ACC88, v25, (void *)1);
  }

  return v8;
}

- (BOOL)isRemoteElement
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2046LL);
}

- (CGRect)frame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleFrame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPath)path
{
  return (CGPath *)-[UIElementProtocol pathWithAXAttribute:](self->_uiElement, "pathWithAXAttribute:", 2042LL);
}

- (unsigned)displayId
{
  if (-[VOTElement cachedDisplayId](self, "cachedDisplayId")) {
    return -[VOTElement cachedDisplayId](self, "cachedDisplayId");
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2123LL));
  id v5 = [v4 unsignedIntValue];

  if (!(_DWORD)v5)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement immediateRemoteParent](self, "immediateRemoteParent"));
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 numberWithAXAttribute:2123]);
      id v5 = [v9 unsignedIntValue];
    }

    else
    {
      id v5 = 0LL;
    }
  }

  -[VOTElement setCachedDisplayId:](self, "setCachedDisplayId:", v5);
  return v5;
}

- (void)updateWindowContextId
{
}

- (unsigned)windowContextId
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2021LL));
  unsigned int v4 = [v3 unsignedIntValue];

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement immediateRemoteParent](self, "immediateRemoteParent"));
    unsigned __int8 v6 = v5;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 numberWithAXAttribute:2021]);
      unsigned int v4 = [v8 unsignedIntValue];
    }

    else
    {
      unsigned int v4 = 0;
    }
  }

  return v4;
}

- (unsigned)windowContextIdForPress
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2021LL));
  id v4 = [v3 unsignedIntValue];

  if ((_DWORD)v4
    && !-[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2224LL))
  {
    return v4;
  }

  else
  {
    return -[VOTElement windowContextIdImmediateRemoteParent:](self, "windowContextIdImmediateRemoteParent:", v4);
  }

- (unsigned)windowContextIdImmediateRemoteParent:(unsigned int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement immediateRemoteParent](self, "immediateRemoteParent"));
  id v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 numberWithAXAttribute:2021]);
    a3 = [v7 unsignedIntValue];
  }

  return a3;
}

- (id)fbSceneIdentifier
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2721LL));
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement immediateRemoteParent](self, "immediateRemoteParent"));
    id v5 = v4;
    if (v4)
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
      double v3 = (void *)objc_claimAutoreleasedReturnValue([v6 stringWithAXAttribute:2721]);
    }

    else
    {
      double v3 = 0LL;
    }
  }

  return v3;
}

- (void)updateIsVisible
{
}

- (BOOL)isVisible
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2025LL);
}

- (int64_t)expandedStatus
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2114LL));
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (BOOL)expandedStatusTogglesOnActivate
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2214LL);
}

- (id)contextDescriptors
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 2125LL);
}

- (BOOL)isRequired
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2029LL);
}

- (BOOL)hasPopup
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2200LL);
}

- (id)popupValue
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2201LL);
}

- (id)invalidStatus
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2045LL);
}

- (id)currentStatus
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2116LL);
}

- (id)sortDirection
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2152LL);
}

- (unint64_t)rowCount
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2121LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)columnCount
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2122LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaRowCount
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2119LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaColumnCount
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2120LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaRowIndex
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2117LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)ariaColumnIndex
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2118LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (CGRect)textCursorFrame
{
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)isComboBox
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2030LL);
}

- (BOOL)isInDescriptionTerm
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2212LL);
}

- (BOOL)isInDescriptionDefinition
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2213LL);
}

- (BOOL)isInTableCell
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2034LL);
}

- (BOOL)dismissAlternativeKeyboardPicker
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 2035LL);
}

- (BOOL)keyboardKeyAllowsTouchTyping
{
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXKeyboardKeyTrait)
    && !-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXButtonTrait))
  {
    return 1;
  }

  else
  {
    return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2059LL);
  }

- (BOOL)overridesVoiceOverInstructions
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2069LL);
}

- (BOOL)elementVisibilityAffectsLayout
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2075LL);
}

- (CGRect)frameForDirectInteraction
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)delayBeforeUpdatingOnActivation
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2068LL));
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)useElementAtPositionAfterActivation
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2190LL);
}

- (BOOL)isStrongPasswordField
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2191LL);
}

- (id)directParent
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:]( self,  "_elementForAttribute:shouldUpdateCache:",  5002LL,  0LL);
}

- (id)windowSceneIdentifier
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3056LL);
}

- (id)window
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:]( self,  "_elementForAttribute:shouldUpdateCache:",  3055LL,  0LL);
}

- (id)opaqueParent
{
  uint64_t v5 = 0LL;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_10001666C;
  id v9 = sub_10001667C;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016684;
  v4[3] = &unk_100176FD8;
  v4[4] = &v5;
  -[VOTElement _iterateSelfAndRemoteParentsUsingBlock:](self, "_iterateSelfAndRemoteParentsUsingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)outermostLocalOpaqueParent
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[VOTElement localOpaqueParent](self, "localOpaqueParent"));
  if (v2)
  {
    double v3 = (void *)v2;
    double v4 = 0LL;
    do
    {
      id v5 = v3;

      double v3 = (void *)objc_claimAutoreleasedReturnValue([v5 localOpaqueParent]);
      double v4 = v5;
    }

    while (v3);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)localOpaqueParent
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:]( self,  "_elementForAttribute:shouldUpdateCache:",  2066LL,  0LL);
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2065LL);
}

- (id)visibleOpaqueElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2113LL);
}

- (id)currentOpaqueElement
{
  return -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  95226LL,  @"UIAccessibilityNotificationVoiceOverIdentifier");
}

- (BOOL)isAwayAlertItem
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2039LL);
}

- (BOOL)isAwayAlertItemNew
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2040LL);
}

- (BOOL)isBannerNotification
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2207LL);
}

- (void)resetBannerTimer
{
}

- (unint64_t)notificationCount
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2192LL));
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (id)notificationSummary:(unint64_t)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    if (a3) {
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu summaries",  a3));
    }
    else {
      id v5 = @"all summaries";
    }
  }

  else
  {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  95238LL,  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3)));
  }

  return v5;
}

- (CGRect)gesturePracticeRegion
{
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSString)value
{
  return (NSString *)-[VOTElement valueWithUpdate:](self, "valueWithUpdate:", 1LL);
}

- (id)valueWithUpdate:(BOOL)a3
{
  if (a3
    && -[VOTElement doesHaveTraits:]( self,  "doesHaveTraits:",  kAXIsEditingTrait | kAXUpdatesFrequentlyTrait | kAXAdjustableTrait))
  {
    -[VOTElement updateValue](self, "updateValue");
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2006LL));
  if ([v4 isAXAttributedString]
    && [v4 hasAttribute:UIAccessibilityTokenReplaceWithWiFiSSID])
  {
    id v5 = [v4 copy];
    double v6 = sub_10004BEB8();
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)v7;
    id v9 = &stru_10017A920;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    id v10 = v9;

    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x2020000000LL;
    v19[3] = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100016A58;
    v15[3] = &unk_100177000;
    id v11 = v5;
    id v16 = v11;
    uint64_t v18 = v19;
    id v12 = v10;
    id v17 = v12;
    [v4 enumerateAttributesUsingBlock:v15];
    id v13 = v11;

    _Block_object_dispose(v19, 8);
    double v4 = v13;
  }

  return v4;
}

- (id)itemChooserName
{
  id v3 = [objc_allocWithZone(NSMutableString) init];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
  if ([v4 length]) {
    [v3 appendString:v4];
  }
  if ([v5 length])
  {
    if ([v3 length]) {
      objc_msgSend(v3, "appendString:", @", ");
    }
    if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXToggleTrait))
    {
      if ([v5 isEqualToString:@"1"])
      {
        double v6 = off_1001AC148;
        uint64_t v7 = @"element.nonweb.on.text";
        uint64_t v8 = @"on";
LABEL_14:
        id v9 = sub_10004A988(v6, v7, v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        [v3 appendString:v10];

        goto LABEL_15;
      }

      if ([v5 isEqualToString:@"0"])
      {
        double v6 = off_1001AC148;
        uint64_t v7 = @"element.nonweb.off.text";
        uint64_t v8 = @"off";
        goto LABEL_14;
      }

      if ([v5 isEqualToString:@"2"])
      {
        double v6 = off_1001AC148;
        uint64_t v7 = @"element.mixed.text";
        uint64_t v8 = @"mixed";
        goto LABEL_14;
      }
    }

    else
    {
      [v3 appendString:v5];
    }
  }

- (id)linkRelationshipType
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3042LL);
}

- (id)headingLevelValue
{
  return -[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2180LL);
}

- (id)originalLabel
{
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXUpdatesFrequentlyTrait)) {
    -[VOTElement updateLabel](self, "updateLabel");
  }
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2001LL);
}

- (id)identifier
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 5019LL);
}

- (id)equivalenceTag
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2071LL);
}

- (id)urlLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement url](self, "url"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXButtonTrait | kAXImageTrait))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
    unsigned int v7 = [v6 isEqualToString:@"cid"];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
      unsigned int v9 = [v8 isMail];

      if (v9)
      {
        id v10 = sub_10004A988(off_1001AC148, @"attachment", 0LL);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 attachmentFilenameForCID:v13]);

        if ([v14 length])
        {
          uint64_t v24 = v11;
          v25 = @"__AXStringForVariablesSentinel";
          uint64_t v15 = __AXStringForVariables(v14);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

          id v5 = (void *)v16;
        }
      }

      if (!objc_msgSend(v5, "length", v24, v25))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);

        id v19 = sub_10004A988(off_1001AC148, @"attachment", 0LL);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@",  v20,  v18));
      }
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"_" withString:&stru_10017A920]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByReplacingOccurrencesOfString:@"-" withString:@" "]);
  return v22;
}

- (void)setDefinedLabel:(id)a3
{
}

- (NSString)definedLabel
{
  return (NSString *)objc_getAssociatedObject(self, @"DefinedLabel");
}

- (void)setUserDefinedLabel:(id)a3
{
}

- (BOOL)savePhotoLabeliCloud:(id)a3
{
  return -[UIElementProtocol performAXAction:withValue:]( self->_uiElement,  "performAXAction:withValue:",  2046LL,  a3);
}

- (id)elementStoredUserLabel
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2060LL);
}

- (NSString)userDefinedLabel
{
  id AssociatedObject = objc_getAssociatedObject(self, @"UserDefinedLabel");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElementLabelCache sharedManager](&OBJC_CLASS___VOTElementLabelCache, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uniqueIdentification](self, "uniqueIdentification"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 userLabelForIdentification:v10]);

    if (v5)
    {
      -[VOTElement setUserDefinedLabel:](self, "setUserDefinedLabel:", v5);
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[VOTElement setUserDefinedLabel:](self, "setUserDefinedLabel:", v11);

      id v5 = 0LL;
    }

    goto LABEL_7;
  }

  id v5 = (void *)v4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = v5;
    id v5 = v8;
    goto LABEL_8;
  }

  id v8 = 0LL;
LABEL_8:

  return (NSString *)v8;
}

- (BOOL)isFirstItemInList
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC89);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIsFirstItemInList:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1001ACC89, v4, (void *)1);
}

- (BOOL)isFirstItemInTable
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC8A);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIsFirstItemInTable:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1001ACC8A, v4, (void *)1);
}

- (BOOL)isFirstItemInLandmark
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC8B);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIsFirstItemInLandmark:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1001ACC8B, v4, (void *)1);
}

- (BOOL)isFirstItemInFieldset
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC8C);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIsFirstItemInFieldset:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1001ACC8C, v4, (void *)1);
}

- (BOOL)isFirstItemInTree
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACC8D);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIsFirstItemInTree:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1001ACC8D, v4, (void *)1);
}

- (NSString)label
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement userDefinedLabel](self, "userDefinedLabel"));
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement definedLabel](self, "definedLabel"));
    unsigned __int8 v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement originalLabel](self, "originalLabel"));
      if (![v8 length] && -[VOTElement includeURLLabelInLabel](self, "includeURLLabelInLabel"))
      {
        uint64_t v9 = objc_claimAutoreleasedReturnValue(-[VOTElement urlLabel](self, "urlLabel"));

        id v8 = (void *)v9;
      }

      if ([v8 length]
        || !-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXAllowsDirectInteractionTrait))
      {
        id v5 = v8;
      }

      else
      {
        id v10 = off_1001AC148;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
        id v12 = sub_10004AE68(v10, @"default.direct.interact.label", 0LL, v11);
        id v5 = (id)objc_claimAutoreleasedReturnValue(v12);
      }
    }
  }

  return (NSString *)v5;
}

- (id)hint
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2002LL);
}

- (BOOL)isTouchContainer
{
  int v3 = sub_10004A018();
  if (v3)
  {
    unint64_t v4 = -[VOTElement traits](self, "traits");
    if ((kAXTouchContainerTrait & v4) != 0)
    {
      if (AXIsInternalInstall())
      {
        uint64_t v5 = VOTLogElement();
        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_1000EF69C(self, v6);
        }
      }

      goto LABEL_8;
    }

    if ((id)-[VOTElement containerType](self, "containerType") == (id)256)
    {
LABEL_8:
      LOBYTE(v3) = 1;
      return v3;
    }

    LOBYTE(v3) = (id)-[VOTElement containerType](self, "containerType") == (id)0x2000;
  }

  return v3;
}

- (BOOL)isHeader
{
  unint64_t v2 = -[VOTElement traits](self, "traits");
  return (kAXHeaderTrait & ~v2) == 0;
}

- (BOOL)isAccessibleElement
{
  unsigned int v3 = -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2016LL);
  unsigned int v4 = !-[VOTElement isHandUI](self, "isHandUI");
  if ((v4 & 1) != 0 || !v3) {
    return v4 & v3;
  }
  else {
    return -[VOTElement isVisible](self, "isVisible");
  }
}

- (BOOL)isAccessibleGroup
{
  return 0;
}

- (BOOL)supportsMediaAnalysis
{
  return (-[VOTElement mediaAnalysisOptions](self, "mediaAnalysisOptions") >> 15) & 1;
}

- (unsigned)mediaAnalysisOptions
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2701LL));
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (CGRect)mediaAnalysisFrame
{
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)shouldSkipImageTraitDescription
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2209LL);
}

- (VOTElement)mediaAnalysisElement
{
  return (VOTElement *)-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2710LL);
}

- (id)imageAssetLocalIdentifier
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2717LL);
}

- (BOOL)isPHAssetLocallyAvailable
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2719LL);
}

- (NSURL)photoLibraryURL
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2720LL));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSURL, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return (NSURL *)v5;
}

- (id)elementForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  a3,  a4));
  double v6 = v4;
  if (v4 && (CFTypeID v7 = CFGetTypeID(v4), v7 == AXUIElementGetTypeID()))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[VOTElement _elementWithAXUIElementRef:](&OBJC_CLASS___VOTElement, "_elementWithAXUIElementRef:", v6));
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___VOTElement, v5);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    {
      id v10 = 0LL;
      goto LABEL_8;
    }

    id v8 = v6;
  }

  id v10 = v8;
LABEL_8:

  return v10;
}

- (id)arrayForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  a3,  a4));
  uint64_t v5 = v4;
  if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFArrayGetTypeID())) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)stringForParameterizedAttribute:(int64_t)a3 parameter:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  a3,  a4));
  uint64_t v5 = v4;
  if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFStringGetTypeID())) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)focusedApplications
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    if (qword_1001ACC90 != -1) {
      dispatch_once(&qword_1001ACC90, &stru_100177020);
    }
    uint64_t v6 = qword_1001ACC98;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
    [v4 updateCache:1102];

    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 1102LL));
  }

  return v3;
}

- (float)activationDelay
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2052LL));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (BOOL)supportsTextSelection
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2316LL);
}

- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5
{
  return -[VOTElement opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:]( self,  "opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:",  a3,  a4,  a5,  1LL,  0LL);
}

- (id)opaqueElementInDirection:(int64_t)a3 searchType:(int64_t)a4 range:(_NSRange *)a5 peeking:(BOOL)a6 startOpaqueElement:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  if (a5)
  {
    NSUInteger location = a5->location;
    NSUInteger length = a5->length;
  }

  else
  {
    NSUInteger length = 0LL;
    NSUInteger location = 0x7FFFFFFFLL;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", location, length));
  BOOL v28 = v7;
  int64_t v27 = a4;
  if (!v7)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
    v30[0] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
    v30[1] = v17;
    v30[2] = v14;
    v30[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v30[4] = &__kCFBooleanTrue;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [(id)VOTSharedWorkspace navigationStyleHonorsGroups]));
    v30[5] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 6LL));
    uint64_t v22 = 95225LL;
    unsigned __int8 v23 = self;
LABEL_9:
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( v23,  "elementForParameterizedAttribute:parameter:",  v22,  v19,  a4));
    goto LABEL_10;
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  uint64_t v16 = (void *)v15;
  if (!v11)
  {
    v32[0] = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
    v32[1] = v17;
    v32[2] = v14;
    v32[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v32[4] = &__kCFBooleanFalse;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [(id)VOTSharedWorkspace navigationStyleHonorsGroups]));
    v32[5] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 6LL));
    unsigned __int8 v23 = self;
    uint64_t v22 = 92517LL;
    goto LABEL_9;
  }

  v31[0] = v15;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
  v31[1] = v17;
  v31[2] = v14;
  v31[3] = @"UIAccessibilityNotificationVoiceOverIdentifier";
  v31[4] = &__kCFBooleanFalse;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [(id)VOTSharedWorkspace navigationStyleHonorsGroups]));
  v31[5] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 uiElement]);
  v31[6] = [v19 axElement];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 7LL));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  92517LL,  v20));

LABEL_10:
  if ([v21 isRemoteElement])
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue( [v21 opaqueElementInDirection:a3 searchType:v27 range:a5 peeking:v28 startOpaqueElement:0]);

    uint64_t v21 = (void *)v24;
    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([0 uiElement]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:]( self,  "opaqueElementInDirection:searchType:range:peeking:startOpaqueElement:",  a3,  v27,  a5,  v28,  [v25 axElement]));
    }
  }

  return v21;
}

- (BOOL)servesAsHeadingLandmark
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2318LL);
}

- (id)elementForAttribute:(int64_t)a3
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:](self, "_elementForAttribute:shouldUpdateCache:", a3, 1LL);
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:]( self,  "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:",  a3,  a4,  1LL);
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", a3);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", a3));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AXUIMockElement, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v12 = v8;
LABEL_10:
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v12));
LABEL_11:
    id v17 = v16;
    goto LABEL_19;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___AXUIElement, v11);
  id v14 = v8;
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0) {
    id v14 = [v8 axElement];
  }
  if (!v14)
  {
    id v17 = 0LL;
    goto LABEL_19;
  }

  if ([v14 conformsToProtocol:&OBJC_PROTOCOL___UIElementProtocol])
  {
    id v12 = v14;
    goto LABEL_10;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___VOTElement, v15);
  if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
  {
    id v16 = v14;
    goto LABEL_11;
  }

  if (v5) {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v14));
  }
  else {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( &OBJC_CLASS___AXUIElement,  "uiElementWithAXElement:cache:",  v14,  0LL));
  }
  v20 = (void *)v19;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v19));

LABEL_19:
  return v17;
}

- (id)elementsForAttribute:(int64_t)a3 withParameter:(id)a4
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol uiElementsWithAttribute:parameter:]( self->_uiElement,  "uiElementsWithAttribute:parameter:",  a3,  a4));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___VOTElement, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
          id v14 = v12;
        }
        else {
          id v14 = (id)objc_claimAutoreleasedReturnValue( +[VOTElement elementWithUIElement:]( &OBJC_CLASS___VOTElement,  "elementWithUIElement:",  v12,  (void)v17));
        }
        uint64_t v15 = v14;
        if (v14) {
          [v5 addObject:v14];
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v5;
}

- (id)elementsForAttribute:(int64_t)a3
{
  return -[VOTElement elementsForAttribute:withParameter:](self, "elementsForAttribute:withParameter:", a3, 0LL);
}

- (__AXUIElement)touchContainerParentAXElement
{
  id v3 = -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2202LL);
  if (!v3)
  {
    float v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
    id v3 = [v5 objectWithAXAttribute:2012];

    if (!v3) {
      return 0LL;
    }
  }

  CFTypeID v6 = CFGetTypeID(v3);
  if (v6 == AXUIElementGetTypeID()) {
    return (__AXUIElement *)v3;
  }
  else {
    return 0LL;
  }
}

- (__AXUIElement)touchContainerAXElement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement containerTypes](self, "containerTypes"));
  float v4 = &off_100187448;
  if (([v3 containsObject:&off_100187448] & 1) == 0)
  {
    float v4 = &off_100187460;
    if (([v3 containsObject:&off_100187460] & 1) == 0)
    {
      float v4 = &off_100187478;
      if (([v3 containsObject:&off_100187478] & 1) == 0)
      {
        float v4 = &off_100187490;
        if (([v3 containsObject:&off_100187490] & 1) == 0)
        {
          float v4 = &off_1001874A8;
          if (([v3 containsObject:&off_1001874A8] & 1) == 0)
          {
            float v4 = &off_1001874C0;
            if (([v3 containsObject:&off_1001874C0] & 1) == 0)
            {
              float v4 = &off_1001874D8;
            }
          }
        }
      }
    }
  }

  id v5 = -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92515LL,  v4);
  if (!v5 || (id v6 = v5, v7 = CFGetTypeID(v5), v7 != AXUIElementGetTypeID()))
  {
LABEL_25:
    id v6 = -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2012LL);
    if (v6
      || (!-[VOTElement remoteParentIsViewHost](self, "remoteParentIsViewHost")
        ? (id v9 = 0LL)
        : (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"))),
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uiElement]),
          id v6 = [v10 objectWithAXAttribute:2012],
          v10,
          v9,
          v6))
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___AXUIElement, v8);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0) {
        id v6 = [v6 axElement];
      }
      CFTypeID v12 = CFGetTypeID(v6);
      if (v12 != AXUIElementGetTypeID()) {
        id v6 = 0LL;
      }
    }
  }

  return (__AXUIElement *)v6;
}

- (id)touchContainerParent
{
  if (sub_10004A018())
  {
    if (!_AXSInUnitTestMode()
      || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2202LL)),
          float v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v3)),
          v3,
          !v4))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:]( &OBJC_CLASS___AXUIElement,  "uiElementWithAXElement:",  -[VOTElement touchContainerParentAXElement](self, "touchContainerParentAXElement")));
      float v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v5));
    }
  }

  else
  {
    float v4 = 0LL;
  }

  return v4;
}

- (id)touchContainer
{
  if (sub_10004A018())
  {
    if (!_AXSInUnitTestMode()
      || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2012LL)),
          float v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v3)),
          v3,
          !v4))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:]( &OBJC_CLASS___AXUIElement,  "uiElementWithAXElement:",  -[VOTElement touchContainerAXElement](self, "touchContainerAXElement")));
      float v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v5));
    }
  }

  else
  {
    float v4 = 0LL;
  }

  return v4;
}

- (id)labeledTouchContainer
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](self, "touchContainer"));
  if (v2)
  {
    do
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 label]);

      if (v3) {
        break;
      }
      uint64_t v4 = objc_claimAutoreleasedReturnValue([v2 touchContainerParent]);

      unint64_t v2 = (void *)v4;
    }

    while (v4);
  }

  return v2;
}

- (BOOL)touchContainerShouldOutputBraille
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2314LL);
}

- (BOOL)shouldIncludeMediaDescriptionsRotor
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2203LL);
}

- (id)linkedElement
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2024LL);
}

- (void)updateFlowToElements
{
}

- (id)flowToElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2033LL);
}

- (id)errorMessageElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2156LL);
}

- (id)nextContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2014LL));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2014]);
  }

  return v3;
}

- (id)previousContainer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2015LL));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2015]);
  }

  return v3;
}

- (VOTElement)previousGuideElement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2154LL));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2154]);
  }

  return (VOTElement *)v3;
}

- (VOTElement)nextGuideElement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2155LL));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2155]);
  }

  return (VOTElement *)v3;
}

- (NSString)guideElementHeaderText
{
  return (NSString *)-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2169LL);
}

- (id)ancestryForTraits:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  92515LL,  v4));

  return v5;
}

- (BOOL)supportsPressedState
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2110LL);
}

- (BOOL)isPressed
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2111LL);
}

- (BOOL)isSwitch
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2320LL);
}

- (BOOL)handlesGestureArea
{
  return -[VOTElement doesHaveTraits:]( self,  "doesHaveTraits:",  kAXGestureHandlerRegionTrait | kAXGesturePracticeRegionTrait);
}

- (BOOL)shouldSpeakHelpInGestureArea
{
  BOOL v3 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXGesturePracticeRegionTrait);
  if (v3) {
    LOBYTE(v3) = !-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXGestureHandlerRegionTrait);
  }
  return v3;
}

- (id)instructions
{
  if (!-[VOTElement overridesVoiceOverInstructions](self, "overridesVoiceOverInstructions"))
  {
    unint64_t v3 = -[VOTElement traits](self, "traits");
    if ((kAXNotEnabledTrait & v3) == 0)
    {
      unint64_t v6 = v3;
      CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      if ((kAXMathEquationTrait & v6) != 0 && -[VOTElement canExpandMathEquation](self, "canExpandMathEquation"))
      {
        unsigned int v8 = [(id)VOTSharedWorkspace brailleInputActive];
        id v9 = off_1001AC150;
        if (v8) {
          uint64_t v10 = @"mathequation.instructions.bsi.command";
        }
        else {
          uint64_t v10 = @"mathequation.instructions";
        }
      }

      else
      {
        if ((kAXToggleTrait & v6) != 0 && (kAXRadioButtonTrait & v6) == 0)
        {
          unsigned int v12 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v12) {
            uint64_t v10 = @"switch.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"switch.instructions";
          }
          goto LABEL_30;
        }

        if ((kAXTextEntryTrait & v6) != 0
          && (kAXStaticTextTrait & v6) == 0
          && ((kAXIsEditingTrait & v6) == 0
           || -[VOTElement shouldIgnoreTextEditingTrait](self, "shouldIgnoreTextEditingTrait")))
        {
          unsigned int v13 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v13) {
            uint64_t v10 = @"textview.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"textview.instructions";
          }
          goto LABEL_30;
        }

        if (((kAXPickerElementTrait | kAXAdjustableTrait) & v6) != 0)
        {
          unsigned int v11 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v11) {
            uint64_t v10 = @"adjustable.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"adjustable.instructions";
          }
        }

        else if ((kAXTableIndexTrait & v6) != 0)
        {
          id v9 = off_1001AC150;
          uint64_t v10 = @"table.index.instructions";
        }

        else if ((kAXDraggableTrait & v6) != 0)
        {
          id v9 = off_1001AC150;
          uint64_t v10 = @"draggable.instructions";
        }

        else if ((kAXPopupButtonTrait & v6) != 0)
        {
          unsigned int v16 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v16) {
            uint64_t v10 = @"popupbutton.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"popupbutton.instructions";
          }
        }

        else if ((kAXWebInteractiveVideoTrait & v6) != 0)
        {
          unsigned int v17 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v17) {
            uint64_t v10 = @"web.interactive.video.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"web.interactive.video.instructions";
          }
        }

        else if ((kAXAllowsDirectInteractionTrait & v6) != 0)
        {
          if ((-[VOTElement directTouchOptions](self, "directTouchOptions") & 2) != 0
            && !-[VOTElement activatedDirectTouchThatRequiredActivation]( self,  "activatedDirectTouchThatRequiredActivation"))
          {
            id v9 = off_1001AC150;
            uint64_t v10 = @"direct.interact.hint.requires.activation";
            id v14 = 0LL;
            goto LABEL_31;
          }

          id v9 = off_1001AC150;
          uint64_t v10 = @"default.direct.interact.hint";
        }

        else
        {
          if (!-[VOTElement expandedStatus](self, "expandedStatus")
            || !-[VOTElement expandedStatusTogglesOnActivate](self, "expandedStatusTogglesOnActivate"))
          {
            goto LABEL_51;
          }

          int64_t v18 = -[VOTElement expandedStatus](self, "expandedStatus");
          if (v18 == 2)
          {
            unsigned int v20 = [(id)VOTSharedWorkspace brailleInputActive];
            id v9 = off_1001AC150;
            if (v20) {
              uint64_t v10 = @"expand.instructions.bsi.command";
            }
            else {
              uint64_t v10 = @"expand.instructions";
            }
            goto LABEL_30;
          }

          if (v18 != 1)
          {
LABEL_51:
            uint64_t v4 = 0LL;
            goto LABEL_32;
          }

          unsigned int v19 = [(id)VOTSharedWorkspace brailleInputActive];
          id v9 = off_1001AC150;
          if (v19) {
            uint64_t v10 = @"collapse.instructions.bsi.command";
          }
          else {
            uint64_t v10 = @"collapse.instructions";
          }
        }
      }

- (unint64_t)hash
{
  return (unint64_t)-[UIElementProtocol hash](self->_uiElement, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___VOTElement, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uiElement = self->_uiElement;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
    unsigned __int8 v9 = -[UIElementProtocol isEqual:](uiElement, "isEqual:", v8);
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)dataDetectorURL:(CGPoint)a3
{
  CGPoint v10 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v10);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92513LL,  v4));
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (void)updateCache
{
  if (!qword_1001ACCA0)
  {
    id v3 = objc_allocWithZone(&OBJC_CLASS___NSArray);
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2003LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2007LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2001LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2006LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2004LL));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 2071LL));
    id v10 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v9, 0);
    unsigned int v11 = (void *)qword_1001ACCA0;
    qword_1001ACCA0 = (uint64_t)v10;
  }

  -[UIElementProtocol updateCacheWithAttributes:](self->_uiElement, "updateCacheWithAttributes:");
}

- (void)updateFrame
{
}

- (void)updatePaths
{
}

- (void)updateLabel
{
}

- (void)updateCenterPoint
{
}

- (void)updateVisiblePoint
{
}

- (void)updateExpandedStatus
{
}

- (void)updateRoleDescription
{
}

- (void)updateValue
{
}

- (void)updateTraits
{
}

- (void)updateHint
{
}

- (void)updateLanguage
{
}

- (void)updateEquivalenceTag
{
}

- (void)updateFocusActiveActivityDisplayName
{
}

- (id)application
{
  return [(id)VOTSharedWorkspace applicationForElement:self];
}

- (id)remoteApplication
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement cachedRemoteApplication](self, "cachedRemoteApplication"));

  if (!v3)
  {
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:]( self,  "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:",  2142LL,  0LL,  0LL));
    -[VOTElement setCachedRemoteApplication:](self, "setCachedRemoteApplication:", v4);
  }

  return -[VOTElement cachedRemoteApplication](self, "cachedRemoteApplication");
}

- (id)nextElement
{
  if (!-[VOTElement isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider")
    || [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && -[VOTElement isAccessibleGroup](self, "isAccessibleGroup"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementsInDirection:withCount:](self, "elementsInDirection:withCount:", 1LL, 1LL));
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElement.m",  2153LL,  "-[VOTElement nextElement]",  @"Who needs this? If you see this, please remove the assert and file a bug with the crash log.");
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement opaqueElementInDirection:searchType:range:]( self,  "opaqueElementInDirection:searchType:range:",  1LL,  0LL,  0LL));
  }

  return v4;
}

- (id)previousElement
{
  if (!-[VOTElement isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider")
    || [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && -[VOTElement isAccessibleGroup](self, "isAccessibleGroup"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementsInDirection:withCount:](self, "elementsInDirection:withCount:", 2LL, 1LL));
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElement.m",  2166LL,  "-[VOTElement previousElement]",  @"Who needs this? If you see this, please remove the assert and file a bug with the crash log.");
    AXValueRef v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement opaqueElementInDirection:searchType:range:]( self,  "opaqueElementInDirection:searchType:range:",  2LL,  0LL,  0LL));
  }

  return v4;
}

- (id)autoSpeakWatchElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2132LL);
}

- (id)realtimeElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 3037LL);
}

- (BOOL)realtimeElementUnread
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3039LL);
}

- (BOOL)realtimeElementCompleted
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3038LL);
}

- (BOOL)supportsHeaderElementOutput
{
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXKeyboardKeyTrait | kAXAutoCorrectCandidateTrait)) {
    return 1;
  }
  else {
    return -[VOTElement containedIn:](self, "containedIn:", 2LL);
  }
}

- (id)firstContainedElement
{
  unint64_t v2 = self;
  id v3 = 0LL;
  uint64_t v4 = AXUIAccessibilityAssistiveTechnologyKey;
  uint64_t v5 = AXUIAccessibilityIncludeRemoteElements;
  uint64_t v6 = AXUIAccessibilityShouldAlwaysScrollKey;
  do
  {
    uint64_t v7 = v3;
    id v3 = v2;

    v10[0] = v4;
    v10[1] = v5;
    v11[0] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v11[1] = &__kCFBooleanFalse;
    v10[2] = v6;
    v11[2] = &__kCFBooleanTrue;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));
    unint64_t v2 = (VOTElement *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( v3,  "elementForParameterizedAttribute:parameter:",  95230LL,  v8));
  }

  while (-[VOTElement isAccessibilityOpaqueElementProvider](v2, "isAccessibilityOpaqueElementProvider")
       && !-[VOTElement isEqual:](v3, "isEqual:", v2));
  if (-[VOTElement isAccessibilityOpaqueElementProvider](v2, "isAccessibilityOpaqueElementProvider")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElement.m",  2214LL,  "-[VOTElement firstContainedElement]",  @"Could not find an element in the opaque provider.");
  }

  return v2;
}

- (unint64_t)groupedChildrenCount
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2220LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)groupedParent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2184LL));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    unsigned int v5 = -[VOTElement isEqual:](self, "isEqual:", v4);

    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 groupedParent]);
    }

    else
    {
      id v3 = 0LL;
    }
  }

  return v3;
}

- (BOOL)elementIsDescendant:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    while (([v6 isEqual:self] & 1) == 0)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 directParent]);

      uint64_t v6 = (void *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }

    BOOL v8 = 1;
  }

  else
  {
LABEL_5:
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)elementIsAncestor:(id)a3
{
  return [a3 elementIsDescendant:self];
}

- (id)_lastContainedElementIncludingRemotes:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  unsigned int v5 = 0LL;
  uint64_t v6 = AXUIAccessibilityAssistiveTechnologyKey;
  uint64_t v7 = AXUIAccessibilityIncludeRemoteElements;
  uint64_t v8 = AXUIAccessibilityShouldAlwaysScrollKey;
  do
  {
    unsigned __int8 v9 = v5;
    unsigned int v5 = v4;

    v14[0] = @"UIAccessibilityNotificationVoiceOverIdentifier";
    v13[0] = v6;
    v13[1] = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    v13[2] = v8;
    v14[1] = v10;
    v14[2] = &__kCFBooleanTrue;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));
    id v4 = (VOTElement *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( v5,  "elementForParameterizedAttribute:parameter:",  95231LL,  v11));
  }

  while (-[VOTElement isAccessibilityOpaqueElementProvider](v4, "isAccessibilityOpaqueElementProvider")
       && !-[VOTElement isEqual:](v5, "isEqual:", v4));
  if (-[VOTElement isAccessibilityOpaqueElementProvider](v4, "isAccessibilityOpaqueElementProvider")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElement.m",  2266LL,  "-[VOTElement _lastContainedElementIncludingRemotes:]",  @"Could not find an element in the opaque provider.");
  }

  return v4;
}

- (id)lastContainedElement
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _lastContainedElementIncludingRemotes:]( self,  "_lastContainedElementIncludingRemotes:",  1LL));
  id v4 = v3;
  if (v3
    && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]),
        _AXUIElementIDForElement([v5 axElement]),
        uint64_t v7 = v6,
        v5,
        v7 != 9999))
  {
    id v8 = v4;
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement _lastContainedElementIncludingRemotes:](self, "_lastContainedElementIncludingRemotes:", 0LL));
  }

  unsigned __int8 v9 = v8;

  return v9;
}

- (id)elementsInDirection:(int64_t)a3 withCount:(unint64_t)a4
{
  v42[0] = AXUIAccessibilityHonorsGroupsKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v43[0] = v6;
  v42[1] = AXUIAccessibilityElementCountKey;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v43[1] = v7;
  v42[2] = AXUIAccessibilityNavigationDirection;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
  v43[2] = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));

  v30 = (void *)v9;
  if (a3 == 2)
  {
    id v10 = self;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[UIElementProtocol previousElementsWithParameters:]( self->_uiElement,  "previousElementsWithParameters:",  v9));
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    id v10 = self;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[UIElementProtocol nextElementsWithParameters:](self->_uiElement, "nextElementsWithParameters:", v9));
LABEL_5:
    unsigned int v12 = (void *)v11;
    goto LABEL_7;
  }

  unsigned int v12 = 0LL;
  id v10 = self;
LABEL_7:
  id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v38;
    unsigned int v16 = (objc_class *)&OBJC_CLASS___VOTSound;
    uint64_t v31 = *(void *)v38;
    do
    {
      unsigned int v17 = 0LL;
      id v33 = v14;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        id v18 = [objc_allocWithZone(v16 + 30) initWithUIElement:*(void *)(*((void *)&v37 + 1) + 8 * (void)v17)];
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement window](v10, "window"));
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 isolatedWindow]);
        if (!v20)
        {

LABEL_17:
          [v35 addObject:v18];
          goto LABEL_19;
        }

        uint64_t v21 = (void *)v20;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement window](v10, "window"));
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 isolatedWindow]);
        if (v23)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement window](v10, "window"));
          unsigned int v36 = [v24 windowContextId];
          v25 = v16;
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 window]);
          unsigned int v27 = [v26 windowContextId];

          unsigned int v16 = v25;
          id v10 = self;

          BOOL v28 = v36 == v27;
          id v14 = v33;
          uint64_t v15 = v31;
          if (v28) {
            goto LABEL_17;
          }
        }

        else
        {
        }

- (unint64_t)blockquoteLevel
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2157LL));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)roleDescription
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2077LL);
}

- (BOOL)suppressCustomActionHint
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2103LL);
}

- (id)textInputElement
{
  return -[VOTElement _elementForAttribute:shouldUpdateCache:]( self,  "_elementForAttribute:shouldUpdateCache:",  2104LL,  0LL);
}

- (_NSRange)textInputElementRange
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  id v3 = [v2 rangeWithAXAttribute:2124];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)isEditableTextArea
{
  BOOL v3 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextAreaTrait);
  if (v3) {
    LOBYTE(v3) = !-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXStaticTextTrait);
  }
  return v3;
}

- (BOOL)brailleTextEntrySupported
{
  BOOL v3 = -[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | kAXIsEditingTrait);
  if (v3) {
    LOBYTE(v3) = !-[VOTElement shouldIgnoreTextEditingTrait](self, "shouldIgnoreTextEditingTrait");
  }
  return v3;
}

- (BOOL)doesHaveTraits:(unint64_t)a3
{
  return (-[VOTElement traits](self, "traits") & a3) != 0;
}

- (BOOL)doesHaveAllTraits:(unint64_t)a3
{
  return (a3 & ~-[VOTElement traits](self, "traits")) == 0;
}

- (BOOL)onlyHasTraits:(unint64_t)a3
{
  unint64_t v4 = -[VOTElement traits](self, "traits") & a3;
  return v4 == -[VOTElement traits](self, "traits");
}

- (BOOL)doesHaveTraitsForGesturedTextInput
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForGesturedTextInput](self, "elementForGesturedTextInput"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (unint64_t)traits
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2004LL));
  id v3 = [v2 unsignedLongLongValue];

  return (unint64_t)v3;
}

- (BOOL)shouldIgnoreTextEditingTrait
{
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait))
  {
    LOBYTE(v3) = 0;
    goto LABEL_5;
  }

  unsigned int v3 = !-[VOTElement isKeyboardActiveOrAttached](self, "isKeyboardActiveOrAttached");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

  if (!v4)
  {
LABEL_5:
    char v8 = 0;
    return v3 | v8;
  }

  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstResponderElementWithoutCache]);
  unsigned __int8 v7 = [v6 isEqual:self];

  char v8 = v7 ^ 1;
  return v3 | v8;
}

- (void)scrollToElementForDirectional:(int64_t)a3 withCompletion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100019B64;
  v9[3] = &unk_100177048;
  id v11 = [a4 copy];
  int64_t v12 = a3;
  id v10 = self;
  id v6 = v11;
  unsigned __int8 v7 = v10;
  AXPerformBlockOnMainThreadAfterDelay(v9, v8, 0.0);
}

- (void)incrementAction
{
}

- (void)setGesturePracticeInfo:(id)a3
{
}

- (void)decrementAction
{
}

- (void)zoomInAtLocation:(CGPoint)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", a3.x, a3.y));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2001LL, v4);
}

- (id)imageOverlayElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2080LL);
}

- (id)photoDescription
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2058LL);
}

- (BOOL)isMapItem
{
  return -[VOTElement mapFeatureType](self, "mapFeatureType") != 0;
}

- (int64_t)mapFeatureType
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2048LL));
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (id)mapDetailedInformationAtPoint:(CGPoint)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  95219LL,  +[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", a3.x, a3.y));
}

- (BOOL)lastHitTestNearBorder
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2049LL);
}

- (float)distanceToOtherRoad:(CGPoint)a3 withDirection:(float)a4 otherRoad:(id)a5
{
  CGPoint v19 = a3;
  id v7 = a5;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v19);
  uiElement = self->_uiElement;
  *(float *)&double v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithFloat:]( &OBJC_CLASS___NSNumber,  "numberWithFloat:",  v10,  *(void *)&v19.x,  *(void *)&v19.y,  v8));
  v20[1] = v11;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);

  v20[2] = [v12 axElement];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( uiElement,  "objectWithAXAttribute:parameter:",  95220LL,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL)));

  if (v8) {
    CFRelease(v8);
  }
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
  float v16 = -1.0;
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    [v13 floatValue];
    float v16 = v17;
  }

  return v16;
}

- (float)distanceToEndOfRoad:(CGPoint)a3 withDirection:(float)a4
{
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  uiElement = self->_uiElement;
  v17[0] = v6;
  *(float *)&double v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
  v17[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( uiElement,  "objectWithAXAttribute:parameter:",  95220LL,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL)));

  if (v6) {
    CFRelease(v6);
  }
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
  float v13 = -1.0;
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
    [v10 floatValue];
    float v13 = v14;
  }

  return v13;
}

- (id)upcomingRoadsAtPoint:(CGPoint)a3 withDirection:(float)a4
{
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  uiElement = self->_uiElement;
  v25[0] = v6;
  *(float *)&double v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
  v25[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol uiElementsWithAttribute:parameter:]( uiElement,  "uiElementsWithAttribute:parameter:",  95217LL,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL)));

  if (v6) {
    CFRelease(v6);
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      float v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        float v17 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElement elementWithUIElement:]( &OBJC_CLASS___VOTElement,  "elementWithUIElement:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16),  (void)v19));
        [v11 axSafelyAddObject:v17];

        float v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v14);
  }

  return v11;
}

- (void)mapsExplorationRecordTouchpoint:(CGPoint)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", a3.x, a3.y));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 4023LL, v4);
}

- (void)mapsExplorationBeginFromCurrentElement:(BOOL)a3
{
  if (a3) {
    -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4020LL);
  }
}

- (void)mapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 4021LL, v4);
}

- (void)mapsExplorationEnd
{
}

- (BOOL)mapsExplorationIsActive
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2506LL);
}

- (BOOL)mapsExplorationIsPending
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2507LL);
}

- (id)mapsExplorationCurrentRoadsWithAngles
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 2501LL);
}

- (CGPoint)mapsExplorationCurrentLocation
{
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)mapsExplorationCurrentIntersectionDescription
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2503LL);
}

- (id)mapsExplorationChangeVerbosity:(BOOL)a3
{
  uiElement = self->_uiElement;
  if (a3) {
    uint64_t v4 = 2504LL;
  }
  else {
    uint64_t v4 = 2505LL;
  }
  return -[UIElementProtocol stringWithAXAttribute:](uiElement, "stringWithAXAttribute:", v4);
}

- (BOOL)roadContainsTrackingPoint:(CGPoint)a3
{
  CGPoint v8 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v8);
  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  95218LL,  v4));
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

- (void)zoomOutAtLocation:(CGPoint)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", a3.x, a3.y));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2002LL, v4);
}

- (void)decreaseTrackingDetail
{
}

- (void)increaseTrackingDetail
{
}

- (id)textOperationsOperator
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2011LL);
}

- (id)textOperations
{
  return -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2010LL);
}

- (void)performTextOperation:(id)a3
{
}

- (CGPoint)elementFrameLocation:(int)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  -[VOTElement frame](self, "frame");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  objc_msgSend( v15,  "convertRect:fromContextId:",  -[VOTElement windowContextId](self, "windowContextId"),  v8,  v10,  v12,  v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  id v24 = [(id)VOTSharedWorkspace deviceOrientation];
  if (v24 == (id)2)
  {
    switch(a3)
    {
      case 1:
        v34.origin.double x = v17;
        v34.origin.double y = v19;
        v34.size.width = v21;
        v34.size.height = v23;
        double x = CGRectGetMidX(v34);
        v35.origin.double x = v17;
        v35.origin.double y = v19;
        v35.size.width = v21;
        v35.size.height = v23;
        double MinY = CGRectGetMinY(v35);
        goto LABEL_20;
      case 2:
        v46.origin.double x = v17;
        v46.origin.double y = v19;
        v46.size.width = v21;
        v46.size.height = v23;
        double x = CGRectGetMidX(v46);
        v47.origin.double x = v17;
        v47.origin.double y = v19;
        v47.size.width = v21;
        v47.size.height = v23;
        double MinY = CGRectGetMaxY(v47);
        goto LABEL_20;
      case 3:
LABEL_16:
        v43.origin.double x = v17;
        v43.origin.double y = v19;
        v43.size.width = v21;
        v43.size.height = v23;
        double MaxX = CGRectGetMaxX(v43);
        double v30 = -3.0;
        goto LABEL_18;
      case 4:
LABEL_17:
        v44.origin.double x = v17;
        v44.origin.double y = v19;
        v44.size.width = v21;
        v44.size.height = v23;
        double MaxX = CGRectGetMinX(v44);
        double v30 = 3.0;
LABEL_18:
        double x = MaxX + v30;
        goto LABEL_19;
      case 5:
LABEL_11:
        v39.origin.double x = v17;
        v39.origin.double y = v19;
        v39.size.width = v21;
        v39.size.height = v23;
        double MidX = CGRectGetMidX(v39);
LABEL_15:
        double x = MidX;
LABEL_19:
        v45.origin.double x = v17;
        v45.origin.double y = v19;
        v45.size.width = v21;
        v45.size.height = v23;
        double MinY = CGRectGetMidY(v45);
LABEL_20:
        double y = MinY;
        break;
      default:
        break;
    }
  }

  else if (v24 == (id)4)
  {
    switch(a3)
    {
      case 1:
LABEL_8:
        v36.origin.double x = v17;
        v36.origin.double y = v19;
        v36.size.width = v21;
        v36.size.height = v23;
        double MidX = CGRectGetMaxX(v36);
        goto LABEL_15;
      case 2:
LABEL_14:
        v42.origin.double x = v17;
        v42.origin.double y = v19;
        v42.size.width = v21;
        v42.size.height = v23;
        double MidX = CGRectGetMinX(v42);
        goto LABEL_15;
      case 3:
LABEL_10:
        v37.origin.double x = v17;
        v37.origin.double y = v19;
        v37.size.width = v21;
        v37.size.height = v23;
        double x = CGRectGetMidX(v37);
        v38.origin.double x = v17;
        v38.origin.double y = v19;
        v38.size.width = v21;
        v38.size.height = v23;
        double MaxY = CGRectGetMaxY(v38);
        double v28 = -3.0;
        goto LABEL_13;
      case 4:
LABEL_12:
        v40.origin.double x = v17;
        v40.origin.double y = v19;
        v40.size.width = v21;
        v40.size.height = v23;
        double x = CGRectGetMidX(v40);
        v41.origin.double x = v17;
        v41.origin.double y = v19;
        v41.size.width = v21;
        v41.size.height = v23;
        double MaxY = CGRectGetMinY(v41);
        double v28 = 3.0;
LABEL_13:
        double y = MaxY + v28;
        break;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }

  else if (v24 == (id)3)
  {
    switch(a3)
    {
      case 1:
        goto LABEL_14;
      case 2:
        goto LABEL_8;
      case 3:
        goto LABEL_12;
      case 4:
        goto LABEL_10;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }

  else
  {
    switch(a3)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_17;
      case 4:
        goto LABEL_16;
      case 5:
        goto LABEL_11;
      default:
        break;
    }
  }

  double v31 = x;
  double v32 = y;
  result.double y = v32;
  result.double x = v31;
  return result;
}

- (BOOL)performEscape
{
  uint64_t v5 = 0LL;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001A81C;
  v4[3] = &unk_100176FD8;
  v4[4] = &v5;
  -[VOTElement _iterateSelfAndRemoteParentsUsingBlock:](self, "_iterateSelfAndRemoteParentsUsingBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)findSearchResult:(BOOL)a3 withSearchText:(id)a4
{
  uint64_t v5 = &kCFBooleanFalse;
  if (a3) {
    uint64_t v5 = &kCFBooleanTrue;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", *v5, a4, 0LL));
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 2017LL, v6);
}

- (BOOL)supportsActivate
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v3 = [v4 supportsActivate];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)supportsSecondaryActivate
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2079LL);
}

- (BOOL)verifyElementExists:(CGPoint *)a3
{
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = -[VOTElement windowContextId](self, "windowContextId");
  if ((_DWORD)v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend(v10, "convertPoint:fromContextId:", v9, v6, v8);
    double v6 = v11;
    double v8 = v12;
  }

  double v13 = 1.0;
  double v14 = 1.0;
  if (v6 > 0.0)
  {
    double v14 = v6;
  }

  if (v8 > 0.0)
  {
    double v13 = v8;
  }

  if ((_DWORD)v9)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend(v15, "convertPoint:toContextId:", v9, v14, v13);
    double v17 = v16;
    double v19 = v18;

    double v20 = v14;
    double v21 = v13;
    double v14 = v17;
    double v13 = v19;
  }

  else
  {
    double v20 = v14;
    double v21 = v13;
  }

  double v22 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v20, v21);
  if (_AXSZoomTouchEnabled())
  {
    CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](v22, "application"));
    id v24 = v23;
    if (v22)
    {
      if ([v23 isAccessibilitySystemUIServer])
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
        unsigned __int8 v26 = [v25 isEqual:v24];

        if ((v26 & 1) == 0)
        {
          unsigned int v27 = objc_alloc(&OBJC_CLASS___VOTElement);
          double v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
          __int128 v29 = -[VOTElement initWithPosition:application:contextId:]( v27,  "initWithPosition:application:contextId:",  v28,  -[VOTElement windowContextId](self, "windowContextId"),  v20,  v21);

          double v22 = v29;
        }
      }
    }

    else
    {
      double v22 = self;
    }
  }

  if (_AXSAssistiveTouchEnabled())
  {
    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](v22, "application"));
    unsigned int v31 = [v30 isAssistiveTouch];

    if (v31)
    {
      if (!a3) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }

  if (!-[VOTElement isEqual:](v22, "isEqual:", self))
  {
    -[VOTElement elementFrameLocation:](self, "elementFrameLocation:", 2LL);
    double v14 = v33;
    double v13 = v34;
    double v35 = v33;
    double v36 = v34;
    if ((_DWORD)v9)
    {
      CGRect v37 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      objc_msgSend(v37, "convertPoint:fromContextId:", v9, v14, v13);
      double v35 = v38;
      double v36 = v39;
    }

    CGRect v40 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v35, v36);

    if (-[VOTElement isEqual:](v40, "isEqual:", self))
    {
      unsigned int v32 = 1;
      double v22 = v40;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }

    -[VOTElement elementFrameLocation:](self, "elementFrameLocation:", 1LL);
    double v14 = v41;
    double v13 = v42;
    double v43 = v41;
    double v44 = v42;
    if ((_DWORD)v9)
    {
      CGRect v45 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      objc_msgSend(v45, "convertPoint:fromContextId:", v9, v14, v13);
      double v43 = v46;
      double v44 = v47;
    }

    double v22 = (VOTElement *)objc_msgSend(objc_allocWithZone((Class)VOTElement), "initWithPosition:", v43, v44);

    if (!-[VOTElement isEqual:](v22, "isEqual:", self))
    {
      -[VOTElement visiblePoint](self, "visiblePoint");
      double v14 = v48;
      double v13 = v49;
      double v50 = v48;
      double v51 = v49;
      if ((_DWORD)v9)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
        objc_msgSend(v52, "convertPoint:fromContextId:", v9, v14, v13);
        double v50 = v53;
        double v51 = v54;
      }

      v55 = (VOTElement *)objc_msgSend( objc_allocWithZone((Class)VOTElement),  "initWithPosition:",  v50,  v51);

      unsigned int v32 = -[VOTElement isEqual:](v55, "isEqual:", self);
      double v22 = v55;
      if (!a3) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }
  }

  unsigned int v32 = 1;
  if (!a3) {
    goto LABEL_40;
  }
LABEL_37:
  if (v32)
  {
LABEL_38:
    a3->double x = v14;
    a3->double y = v13;
LABEL_39:
    LOBYTE(v32) = 1;
  }

- (id)resolvedEditingStyles
{
  char v7 = 0;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2215LL));
  uint64_t v4 = __UIAccessibilitySafeClass(@"NSDictionary", v3, 1LL, &v7);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v7) {
    abort();
  }
  return v5;
}

- (BOOL)performTapAtPoint:(CGPoint)a3 withForce:(double)a4 playSound:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a5)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidActivateElement](&OBJC_CLASS___VOSOutputEvent, "DidActivateElement"));
    [v9 sendEvent:v10];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  objc_msgSend(v11, "convertPoint:toContextId:", -[VOTElement windowContextId](self, "windowContextId"), x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  uint64_t v17 = -[VOTElement windowContextIdForPress](self, "windowContextIdForPress");
  LODWORD(v18) = 1028443341;
  unsigned __int8 v19 = objc_msgSend( v16,  "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:",  v17,  self,  v13,  v15,  a4,  v18);

  return v19;
}

- (BOOL)allowsAutoAlternativeCharacterActivation
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2073LL);
}

- (void)performDoubleTap
{
  if (-[VOTElement supportsSecondaryActivate](self, "supportsSecondaryActivate")) {
    -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 2036LL);
  }
}

- (BOOL)performSimpleTap
{
  return -[VOTElement performSimpleTap:](self, "performSimpleTap:", 0LL);
}

- (BOOL)activateIfSupported
{
  if (!-[VOTElement supportsActivate](self, "supportsActivate")) {
    return 0;
  }
  if (-[VOTElement _attemptPerformActivateActionWithElement:]( self,  "_attemptPerformActivateActionWithElement:",  self->_uiElement))
  {
    return 1;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
  double v5 = v4;
  if (v4 && [v4 supportsActivate])
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
    BOOL v3 = -[VOTElement _attemptPerformActivateActionWithElement:](self, "_attemptPerformActivateActionWithElement:", v6);
  }

  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)performSimpleTap:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = VOTLogSimpleTap(self, a2);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000EF9BC();
  }

  if (AXDeviceIsPad(v7, v8))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    [v9 isSpringBoard];
  }

  if ((-[VOTElement directTouchOptions](self, "directTouchOptions") & 2) != 0
    && !-[VOTElement activatedDirectTouchThatRequiredActivation](self, "activatedDirectTouchThatRequiredActivation"))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidActivateElement](&OBJC_CLASS___VOSOutputEvent, "DidActivateElement"));
    [v12 sendEvent:v13];

    id v14 = sub_10004A988(off_1001AC148, @"activated.direct.touch", 0LL);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    double v16 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    id v17 = sub_10000BBB0(v15, 0, v16);

    unsigned __int8 v11 = 1;
    -[VOTElement setActivatedDirectTouchThatRequiredActivation:]( self,  "setActivatedDirectTouchThatRequiredActivation:",  1LL);
    return v11;
  }

  if (-[VOTElement canExpandMathEquation](self, "canExpandMathEquation"))
  {
    -[VOTElement expandMathEquation](self, "expandMathEquation");
    return 0;
  }

  uint64_t v10 = kAXTextEntryTrait;
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | kAXNotEnabledTrait)) {
    return 0;
  }
  if (!-[VOTElement activateIfSupported](self, "activateIfSupported"))
  {
    -[VOTElement centerPoint](self, "centerPoint");
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    v120.double x = v30;
    v120.double y = v32;
    id v34 = -[VOTElement indexPathAsRange](self, "indexPathAsRange");
    uint64_t v36 = v35;
    uint64_t v37 = VOTLogSimpleTap(v34, v35);
    double v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v124.double x = v31;
      v124.double y = v33;
      v106 = NSStringFromCGPoint(v124);
      v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
      v122.NSUInteger location = (NSUInteger)-[VOTElement indexPathAsRange](self, "indexPathAsRange");
      v108 = NSStringFromRange(v122);
      v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v107;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v109;
      _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Old center point(%@) %@", buf, 0x16u);
    }

    -[VOTElement updateCenterPoint](self, "updateCenterPoint");
    -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2078LL);
    -[VOTElement centerPoint](self, "centerPoint");
    double v40 = v39;
    double v42 = v41;
    id v43 = -[VOTElement indexPathAsRange](self, "indexPathAsRange");
    uint64_t v45 = v44;
    uint64_t v46 = VOTLogSimpleTap(v43, v44);
    double v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v125.double x = v40;
      v125.double y = v42;
      v110 = NSStringFromCGPoint(v125);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
      v123.NSUInteger location = (NSUInteger)-[VOTElement indexPathAsRange](self, "indexPathAsRange");
      v112 = NSStringFromRange(v123);
      v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v111;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v113;
      _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "NEW center point(%@) %@", buf, 0x16u);
    }

    if (v34 != v43 || v36 != v45)
    {
      uint64_t v50 = VOTLogSimpleTap(v48, v49);
      double v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        sub_1000EF990();
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement parentTableOrCollectionView](self, "parentTableOrCollectionView"));
      uint64_t v54 = VOTLogSimpleTap(v52, v53);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        sub_1000EF92C();
      }

      if (v52)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue([v52 elementAtRow:v34 andColumn:v36]);
        uint64_t v58 = VOTLogSimpleTap(v56, v57);
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          sub_1000EF8C8();
        }

        if (![v56 isEqual:self])
        {
          unsigned __int8 v11 = [v56 performSimpleTap:v3];

          return v11;
        }
      }
    }

    uint64_t v60 = -[VOTElement windowContextIdForPress](self, "windowContextIdForPress");
    uint64_t v62 = v60;
    v119.double x = v40;
    v119.double y = v42;
    if ((_DWORD)v60)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      objc_msgSend(v63, "convertPoint:fromContextId:", v62, v40, v42);
      double v40 = v64;
      double v42 = v65;
    }

    uint64_t v66 = VOTLogSimpleTap(v60, v61);
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
      sub_1000EF838(&v119, (uint64_t)&v119.y, v67);
    }

    BOOL v68 = -[VOTElement verifyElementExists:](self, "verifyElementExists:", &v119);
    BOOL v69 = v68;
    uint64_t v71 = VOTLogSimpleTap(v68, v70);
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      v114 = NSStringFromCGPoint(v119);
      v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v69;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v115;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEBUG,  "Is same element: %i.  Updated dispatch point: %@",  buf,  0x12u);
    }

    if (sub_10004A020())
    {
      BOOL v73 = -[VOTElement isTouchContainer](self, "isTouchContainer");
      if (v73)
      {
        uint64_t v75 = VOTLogSimpleTap(v73, v74);
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
          sub_1000EF80C();
        }

        id v77 = -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 2010LL);
        int v78 = (int)v77;
        uint64_t v80 = VOTLogSimpleTap(v77, v79);
        v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
        if (v78)
        {
          if (v82) {
            sub_1000EF75C();
          }
          unsigned __int8 v11 = 1;
          goto LABEL_79;
        }

        if (v82) {
          sub_1000EF7E0();
        }
      }
    }

    if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXIsEditingTrait | v10))
    {
      BOOL v83 = -[VOTElement shouldIgnoreTextEditingTrait](self, "shouldIgnoreTextEditingTrait");
      if (!v83)
      {
        uint64_t v92 = VOTLogSimpleTap(v83, v84);
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
          sub_1000EF7B4();
        }

        unsigned __int8 v11 = 0;
        goto LABEL_77;
      }
    }

    -[VOTElement activationDelay](self, "activationDelay");
    float v86 = v85;
    if (-[VOTElement tapHostContextId](self, "tapHostContextId"))
    {
      v119.double x = v40;
      v119.double y = v42;
      uint64_t v62 = -[VOTElement windowContextIdImmediateRemoteParent:](self, "windowContextIdImmediateRemoteParent:", v62);
    }

    else if (!v69)
    {
      BOOL v87 = -[VOTElement verifyElementExists:](self, "verifyElementExists:", &v120);
      if (v87)
      {
        uint64_t v89 = VOTLogSimpleTap(v87, v88);
        v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
          sub_1000EF788();
        }

        CGPoint v91 = v120;
      }

      else
      {
        -[VOTElement visiblePoint](self, "visiblePoint");
        *(void *)buf = v94;
        *(void *)&buf[8] = v95;
        -[VOTElement updateVisiblePoint](self, "updateVisiblePoint");
        -[VOTElement visiblePoint](self, "visiblePoint");
        v118.double x = v96;
        v118.double y = v97;
        if (-[VOTElement verifyElementExists:](self, "verifyElementExists:", &v118)) {
          CGPoint v119 = v118;
        }
        if (!-[VOTElement verifyElementExists:](self, "verifyElementExists:", buf)) {
          goto LABEL_73;
        }
        CGPoint v91 = *(CGPoint *)buf;
      }

      CGPoint v119 = v91;
    }

- (int64_t)temporaryVoiceOverStatus
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 5067LL));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setTemporaryVoiceOverStatus:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  -[UIElementProtocol setAXAttribute:withNumber:](uiElement, "setAXAttribute:withNumber:", 5067LL, v4);
}

- (BOOL)_attemptPerformActivateActionWithElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAXWebContentTrait;
  unsigned int v6 = -[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXLinkTrait | kAXWebContentTrait);
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", v5))
  {
    uint64_t GlobalError = (uint64_t)[v4 performAXAction:2010];
    char v13 = GlobalError;
    goto LABEL_13;
  }

  BOOL v7 = -[VOTElement isComboBox](self, "isComboBox");
  if (v7)
  {
    uint64_t v9 = VOTLogSimpleTap(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000EFA20();
    }
LABEL_24:

    char v13 = 0;
    goto LABEL_25;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  AXUIElementSetMessagingTimeout((AXUIElementRef)[v14 axElement], 0.25);

  uint64_t GlobalError = (uint64_t)[v4 performAXAction:2010];
  if ((GlobalError & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t GlobalError = AXUIElementLastGlobalError();
  if ((_DWORD)GlobalError == -25216)
  {
    uint64_t v15 = VOTLogSimpleTap(GlobalError, v12);
    double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 v29 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Web element timed out trying to activate, assuming that we got blocked on modal alert and moving on",  v29,  2u);
    }

LABEL_11:
    char v13 = 1;
    goto LABEL_13;
  }

  char v13 = 0;
LABEL_13:
  uint64_t v17 = VOTLogSimpleTap(GlobalError, v12);
  double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_1000EFAA4(v13, v18);
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextEntryTrait))
  {
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.5);
    -[VOTElement updateTraits](self, "updateTraits");
    BOOL v19 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXIsEditingTrait);
    if (!v19)
    {
      uint64_t v21 = VOTLogSimpleTap(v19, v20);
      double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_1000EFA78();
      }

      char v13 = 0;
    }
  }

  if (v6)
  {
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.25);
    os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    unsigned int v24 = -[VOTElement isValidForApplication:](self, "isValidForApplication:", v23);

    if (v24)
    {
      uint64_t v27 = VOTLogSimpleTap(v25, v26);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1000EFA4C();
      }
      goto LABEL_24;
    }
  }

- (double)minValue
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 5005LL));
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)maxValue
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 5006LL));
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (double)absoluteValue
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 5011LL));
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (id)remoteParent
{
  char v2 = self;
  objc_sync_enter(v2);
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement cachedRemoteParent](v2, "cachedRemoteParent"));
  if (v3)
  {
  }

  else if (!-[VOTElement checkedRemoteParent](v2, "checkedRemoteParent"))
  {
    float v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:]( v2,  "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:",  2092LL,  0LL,  0LL));
    -[VOTElement setCachedRemoteParent:](v2, "setCachedRemoteParent:", v4);

    -[VOTElement setCheckedRemoteParent:](v2, "setCheckedRemoteParent:", 1LL);
  }

  objc_sync_exit(v2);

  return -[VOTElement cachedRemoteParent](v2, "cachedRemoteParent");
}

- (BOOL)remoteParentIsViewHost
{
  return 1;
}

- (id)textualContext
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2193LL);
}

- (id)immediateRemoteParent
{
  char v2 = self;
  objc_sync_enter(v2);
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement cachedImmediateRemoteParent](v2, "cachedImmediateRemoteParent"));
  if (v3)
  {
  }

  else if (!-[VOTElement checkedImmediateRemoteParent](v2, "checkedImmediateRemoteParent"))
  {
    float v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:]( v2,  "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:",  2310LL,  0LL,  0LL));
    -[VOTElement setCachedImmediateRemoteParent:](v2, "setCachedImmediateRemoteParent:", v4);

    -[VOTElement setCheckedImmediateRemoteParent:](v2, "setCheckedImmediateRemoteParent:", 1LL);
  }

  objc_sync_exit(v2);

  return -[VOTElement cachedImmediateRemoteParent](v2, "cachedImmediateRemoteParent");
}

- (void)_iterateSelfAndRemoteParentsUsingBlock:(id)a3
{
  float v4 = (void (**)(id, void *, _BYTE *))a3;
  char v8 = 0;
  double v5 = self;
  if (v5)
  {
    unsigned int v6 = v5;
    while (1)
    {
      v4[2](v4, v6, &v8);
      if (v8) {
        break;
      }
      BOOL v7 = (VOTElement *)objc_claimAutoreleasedReturnValue(-[VOTElement immediateRemoteParent](v6, "immediateRemoteParent"));
      if (-[VOTElement isEqual:](v7, "isEqual:", v6))
      {

        break;
      }

      if (!v8)
      {
        unsigned int v6 = v7;
        if (v7) {
          continue;
        }
      }

      goto LABEL_10;
    }

    BOOL v7 = v6;
LABEL_10:
  }
}

- (BOOL)_scrollForAction:(int)a3
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001BFC0;
  v5[3] = &unk_100177070;
  v5[4] = &v7;
  int v6 = a3;
  -[VOTElement _iterateSelfAndRemoteParentsUsingBlock:](self, "_iterateSelfAndRemoteParentsUsingBlock:", v5);
  char v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)scrollToTop
{
  return -[VOTElement _scrollForAction:](self, "_scrollForAction:", 2068LL);
}

- (BOOL)scrollToBottom
{
  return -[VOTElement _scrollForAction:](self, "_scrollForAction:", 2069LL);
}

- (void)scrollUpPage
{
}

- (void)scrollDownPage
{
}

- (void)scrollRightPage
{
}

- (void)scrollLeftPage
{
}

- (BOOL)scrollNextPage
{
  return -[VOTElement _scrollForAction:](self, "_scrollForAction:", 2019LL);
}

- (BOOL)scrollPreviousPage
{
  return -[VOTElement _scrollForAction:](self, "_scrollForAction:", 2020LL);
}

- (void)scrollToPoint:(CGPoint)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", a3.x, a3.y));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2014LL, v4);
}

- (void)scrollRectToVisible:(CGRect)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001C18C;
  v6[3] = &unk_100177098;
  CGRect v8 = a3;
  v6[4] = self;
  id v7 = [a4 copy];
  id v4 = v7;
  AXPerformBlockOnMainThreadAfterDelay(v6, v5, 0.0);
}

- (id)scrollStatus
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2009LL);
}

- (BOOL)showsDualPages
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2304LL);
}

- (BOOL)readingContentCausesPageTurn
{
  unint64_t v2 = -[VOTElement traits](self, "traits");
  return (kAXCausesPageTurnTrait & ~v2) == 0;
}

- (id)firstVisibleElementInList
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2013LL);
}

- (id)firstResponderElement
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 3002LL));
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 elementForAttribute:3002]);

    unint64_t v2 = (void *)v3;
  }

  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstResponderElementWithoutCache
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:]( self,  "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:",  3002LL,  0LL,  0LL));
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 _elementForAttribute:3002 shouldUpdateCache:0 shouldFetchAttributes:0]);

    unint64_t v2 = (void *)v3;
  }

  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)nativeFocusElement
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 3024LL));
  else {
    uint64_t v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (id)nativeFocusPreferredElement
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 3027LL));
  else {
    uint64_t v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (id)firstResponderElementForFocus
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 3023LL));
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 elementForAttribute:3023]);

    unint64_t v2 = (void *)v3;
  }

  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstElementInApplication
{
  uint64_t v3 = AXUIAccessibilityHonorsGroupsKey;
  v18[0] = AXUIAccessibilityHonorsGroupsKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v19[0] = v4;
  uint64_t v5 = AXUIAccessibilityNavigationDirection;
  v18[1] = AXUIAccessibilityNavigationDirection;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
  v19[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  CGRect v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  95253LL,  v7));

  if ([v8 isRemoteElement])
  {
    v16[0] = v3;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    v16[1] = v5;
    v17[0] = v9;
    char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
    v17[1] = v10;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 elementForParameterizedAttribute:95253 parameter:v11]);

    CGRect v8 = (void *)v12;
  }

  else {
    char v13 = v8;
  }
  id v14 = v13;

  return v14;
}

- (id)lastElementInApplication
{
  uint64_t v3 = AXUIAccessibilityHonorsGroupsKey;
  v18[0] = AXUIAccessibilityHonorsGroupsKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v19[0] = v4;
  uint64_t v5 = AXUIAccessibilityNavigationDirection;
  v18[1] = AXUIAccessibilityNavigationDirection;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
  v19[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  CGRect v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  95254LL,  v7));

  if ([v8 isRemoteElement])
  {
    v16[0] = v3;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    v16[1] = v5;
    v17[0] = v9;
    char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
    v17[1] = v10;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 elementForParameterizedAttribute:95254 parameter:v11]);

    CGRect v8 = (void *)v12;
  }

  else {
    char v13 = v8;
  }
  id v14 = v13;

  return v14;
}

- (id)firstElementInApplicationForFocus
{
  v29[0] = AXUIAccessibilityHonorsGroupsKey;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v30[0] = v3;
  v29[1] = AXUIAccessibilityNavigationDirection;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)VOTSharedWorkspace navigationDirection]));
  v30[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  95250LL,  v5));

  uint64_t v8 = VOTLogCommon(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "First element in app focus: %@", buf, 0xCu);
  }

  if ([v6 isRemoteElement])
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v6 accessibleDescendants]);
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          if (objc_msgSend(v14, "isVisible", (void)v22))
          {
            id v11 = v14;
            goto LABEL_14;
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

- (id)elementCommunity
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement isolatedWindow](self, "isolatedWindow"));
  if (!v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    if (v5 && -[VOTElement remoteParentIsViewHost](self, "remoteParentIsViewHost"))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 isolatedWindow]);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = (uint64_t)v9;
      }

      else
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 application]);
        id v9 = 0LL;
      }

      uint64_t v3 = (void *)v10;
    }

    else
    {
      id v9 = 0LL;
    }

    goto LABEL_12;
  }

  id v5 = v4;

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
  unsigned __int8 v7 = [v6 isSpringBoard];

  if ((v7 & 1) == 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 application]);
    id v9 = v5;
LABEL_12:

    id v5 = v9;
    goto LABEL_13;
  }

  uint64_t v3 = v5;
LABEL_13:

  return v3;
}

- (id)firstElementInApplicationForReadFromTop
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 3050LL));
  if ([v2 isRemoteElement])
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 elementForAttribute:3050]);

    unint64_t v2 = (void *)v3;
  }

  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)firstWebElement
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2231LL);
}

- (BOOL)elementOnSameLine:(id)a3
{
  id v4 = a3;
  -[VOTElement frame](self, "frame");
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  [v4 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  id v21 = [(id)VOTSharedWorkspace deviceOrientation];
  unsigned int v22 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXToggleTrait | kAXRadioButtonTrait);
  if (v22) {
    LOBYTE(v22) = [v4 doesHaveTraits:kAXStaticTextTrait];
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10001CE6C;
  v32[3] = &unk_1001770B8;
  char v33 = v22;
  __int128 v23 = objc_retainBlock(v32);
  switch((unint64_t)v21)
  {
    case 0uLL:
    case 1uLL:
      v34.origin.double x = v6;
      v34.origin.double y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      double MinY = CGRectGetMinY(v34);
      v35.origin.double x = v14;
      v35.origin.double y = v16;
      v35.size.width = v18;
      v35.size.height = v20;
      double MaxY = CGRectGetMinY(v35);
      goto LABEL_10;
    case 2uLL:
      v36.origin.double x = v6;
      v36.origin.double y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      double MinY = CGRectGetMaxY(v36);
      v37.origin.double x = v14;
      v37.origin.double y = v16;
      v37.size.width = v18;
      v37.size.height = v20;
      double MaxY = CGRectGetMaxY(v37);
      goto LABEL_10;
    case 3uLL:
      v38.origin.double x = v6;
      v38.origin.double y = v8;
      v38.size.width = v10;
      v38.size.height = v12;
      double MinY = CGRectGetMaxX(v38);
      v39.origin.double x = v14;
      v39.origin.double y = v16;
      v39.size.width = v18;
      v39.size.height = v20;
      double MaxY = CGRectGetMaxX(v39);
      goto LABEL_9;
    case 4uLL:
      v40.origin.double x = v6;
      v40.origin.double y = v8;
      v40.size.width = v10;
      v40.size.height = v12;
      double MinY = CGRectGetMinX(v40);
      v41.origin.double x = v14;
      v41.origin.double y = v16;
      v41.size.width = v18;
      v41.size.height = v20;
      double MaxY = CGRectGetMinX(v41);
LABEL_9:
      double v12 = v10;
      double v20 = v18;
LABEL_10:
      float v27 = MinY;
      float v28 = MaxY;
      float v29 = v12;
      float v30 = v20;
      char v26 = ((uint64_t (*)(void *, float, float, float, float))v23[2])(v23, v27, v28, v29, v30);
      break;
    default:
      char v26 = 0;
      break;
  }

  return v26;
}

- (id)cellWithRowIndexPath:(_NSRange)a3 parentView:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
  id v9 = [v8 axElement];

  if (v9)
  {
    *(void *)&__int128 valuePtr = location;
    *((void *)&valuePtr + 1) = length;
    AXValueRef v10 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
    v24[0] = v10;
    v24[1] = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  92600LL,  v11));

    CFRelease(v10);
  }

  else
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
    unsigned __int8 v14 = [v13 ignoreLogging];

    if ((v14 & 1) == 0)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
      uint64_t v16 = AXLoggerForFacility();
      double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

      os_log_type_t v18 = AXOSLogLevelFromAXLogLevel(2LL);
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = AXColorizeFormatLog( 2LL,  @"Table view had no AX element, possibly because the table view had gone away. VOTElement: %{public}@");
        double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v21 = _AXStringForArgs(v20);
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v17, v18))
        {
          LODWORD(valuePtr) = 138543362;
          *(void *)((char *)&valuePtr + 4) = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%{public}@", (uint8_t *)&valuePtr, 0xCu);
        }
      }
    }

    double v12 = 0LL;
  }

  return v12;
}

- (BOOL)allowCustomActionHintSpeakOverride
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2047LL);
}

- (BOOL)retainsCustomRotorActionSetting
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2067LL);
}

- (BOOL)includeURLLabelInLabel
{
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXImageTrait)) {
    return 1;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  unsigned __int8 v4 = [v3 determineFullImageDescriptionsEnabled:self];

  return v4 ^ 1;
}

- (BOOL)shouldAddAlternateActionForLinkElement
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXLinkTrait | kAXWebContentTrait))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
    unsigned __int8 v5 = [v4 BOOLWithAXAttribute:2148];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)customContent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2210LL));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___AXCustomContent, v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    double v11 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver secureUnarchiveData:withExpectedClass:otherAllowedClasses:]( &OBJC_CLASS___NSKeyedUnarchiver,  "secureUnarchiveData:withExpectedClass:otherAllowedClasses:",  v3,  v7,  v10));
  }

  else
  {
    double v11 = 0LL;
  }

  if (!-[VOTElement includeURLLabelInLabel](self, "includeURLLabelInLabel"))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement urlLabel](self, "urlLabel"));

    if (v12)
    {
      if (!v11) {
        double v11 = objc_opt_new(&OBJC_CLASS___NSArray);
      }
      id v13 = sub_10004A988(off_1001AC148, @"URL", 0LL);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement urlLabel](self, "urlLabel"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXCustomContent customContentWithLabel:value:]( &OBJC_CLASS___AXCustomContent,  "customContentWithLabel:value:",  v14,  v15));
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v11, "arrayByAddingObject:", v16));

      double v11 = (NSArray *)v17;
    }
  }

  return v11;
}

- (BOOL)shouldIncludeRemoteParentCustomActions
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2217LL);
}

- (BOOL)shouldIncludeRegionDescription
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2218LL);
}

- (id)cachedCustomRotorActions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    if (([v6 isEqual:self] & 1) != 0
      || !-[VOTElement remoteParentIsViewHost](self, "remoteParentIsViewHost"))
    {
    }

    else
    {
      unsigned int v7 = -[VOTElement shouldIncludeRemoteParentCustomActions](self, "shouldIncludeRemoteParentCustomActions");

      if (!v7) {
        goto LABEL_9;
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 cachedCustomRotorActions]);

      if (v5) {
        [v3 addObjectsFromArray:v5];
      }
    }
  }

+ (id)defaultCustomActionCategory
{
  return sub_10004A988(off_1001AC148, @"custom.actions.title", 0LL);
}

+ (id)organizedActionsByCategory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue([v9 categoryName]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        void v17[2] = sub_10001D834;
        v17[3] = &unk_100177120;
        id v11 = v10;
        id v18 = v11;
        double v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v17));
        id v13 = (VOTCustomActionCategory *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

        if (!v13)
        {
          id v13 = objc_opt_new(&OBJC_CLASS___VOTCustomActionCategory);
          -[VOTCustomActionCategory setCategoryName:](v13, "setCategoryName:", v11);
          [v4 addObject:v13];
        }

        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomActionCategory actions](v13, "actions"));
        [v14 addObject:v9];
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  [v4 sortUsingComparator:&stru_100177160];
  return v4;
}

- (id)customRotorActions
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    unsigned int v5 = -[VOTElement remoteParentIsViewHost](self, "remoteParentIsViewHost");

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
      [v7 updateCache:2036];
    }
  }

  -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2036LL);
  -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2175LL);
  -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2176LL);
  return -[VOTElement cachedCustomRotorActions](self, "cachedCustomRotorActions");
}

- (BOOL)setNativeFocus
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 2044LL);
}

- (BOOL)hasNativeFocus
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2094LL);
}

- (BOOL)canBecomeNativeFocused
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2204LL);
}

- (BOOL)shouldPlaySoundWhenFocused
{
  return -[VOTElement canBecomeNativeFocused](self, "canBecomeNativeFocused");
}

- (BOOL)shouldSetNativeFocusWhenBecomingCurrentElement
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2153LL);
}

- (BOOL)shouldSpeakExplorerElementsAfterFocus
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2131LL);
}

- (BOOL)fullscreenVideoViewIsVisible
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2151LL);
}

- (int64_t)overriddenInterpretationForCommand:(int64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  95235LL,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3)));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = [v3 integerValue];
  }
  else {
    id v6 = 0LL;
  }

  return (int64_t)v6;
}

- (BOOL)performCustomActionWithIdentifier:(id)a3
{
  return -[VOTElement performCustomActionWithIdentifier:data:](self, "performCustomActionWithIdentifier:data:", a3, 0LL);
}

- (BOOL)performCustomActionWithIdentifier:(id)a3 data:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (NSMutableDictionary *)a4;
  if ([v6 isEqualToString:@"alternateActionForURLIdentifier"])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
    AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement url](self, "url"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
    unsigned __int8 v12 = [v9 performAXAction:2048 withValue:v11];

LABEL_9:
    goto LABEL_10;
  }

  if (!v7)
  {
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v6,  @"CustomActionIdentifier");
  }

  if ((-[UIElementProtocol performAXAction:withValue:]( self->_uiElement,  "performAXAction:withValue:",  2021LL,  v7) & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (!v13)
    {
      unsigned __int8 v12 = 0;
      goto LABEL_10;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    unsigned __int8 v12 = [v8 performCustomActionWithIdentifier:v6 data:v7];
    goto LABEL_9;
  }

  unsigned __int8 v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)attemptToShowContextMenuWithTargetPointValue:(id)a3
{
  id v4 = a3;
  if ((-[UIElementProtocol performAXAction:withValue:]( self->_uiElement,  "performAXAction:withValue:",  2051LL,  v4) & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      unsigned __int8 v5 = [v7 attemptToShowContextMenuWithTargetPointValue:v4];
    }

    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)customPublicRotors
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
  if (v4)
  {
    unsigned __int8 v5 = (void *)v4;
    unsigned int v6 = -[VOTElement remoteParentIsViewHost](self, "remoteParentIsViewHost");

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayWithAXAttribute:2128]);
      [v3 axSafelyAddObjectsFromArray:v9];
    }
  }

  AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 arrayWithAXAttribute:2128]);
  [v3 axSafelyAddObjectsFromArray:v11];

  return v3;
}

- (void)updateCustomPublicRotors
{
}

- (id)customPublicRotorNames
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

  if (v4)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 customPublicRotors]);

    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        AXValueRef v10 = 0LL;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement customPublicRotorName:]( self,  "customPublicRotorName:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v10)));
          [v3 axSafelyAddObject:v11];

          AXValueRef v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v8);
    }
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement customPublicRotors](self, "customPublicRotors", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement customPublicRotorName:]( self,  "customPublicRotorName:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16)));
        [v3 axSafelyAddObject:v17];

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v14);
  }

  return v3;
}

- (id)customPublicRotorForSystemType:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:95232 parameter:v4]);

  if (!v6)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectWithAXAttribute:95232 parameter:v4]);
    }
  }

  return v6;
}

- (BOOL)customPublicRotorIsVisibleInTouchRotor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:95228 parameter:v4]);

  if (!v6)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectWithAXAttribute:95228 parameter:v4]);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"visibleInTouchRotor"]);

  if (v9)
  {
    AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"visibleInTouchRotor"]);
    unsigned __int8 v11 = [v10 BOOLValue];
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (int64_t)customPublicRotorLinkCountForRotor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:95228 parameter:v4]);

  if (!v6)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectWithAXAttribute:95228 parameter:v4]);
    }
  }

  char v16 = 0;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AXUIAccessibilityCustomRotorLinkCount]);
  uint64_t v12 = __UIAccessibilityCastAsClass(v10, v11, 1LL, &v16);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v16) {
    abort();
  }
  id v14 = [v13 integerValue];

  return (int64_t)v14;
}

- (id)customPublicRotorName:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:95228 parameter:v4]);

  if (!v6)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectWithAXAttribute:95228 parameter:v4]);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"name"]);

  return v9;
}

+ (id)customPublicRotorDictionaryForRotorId:(id)a3 startRange:(_NSRange)a4 direction:(int64_t)a5
{
  NSUInteger location = a4.location;
  _NSRange v14 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary",  v14.location,  v14.length));
  [v8 setObject:v7 forKeyedSubscript:@"uuid"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v8 setObject:v9 forKeyedSubscript:@"currentItem"];

  if (location != 0x7FFFFFFF)
  {
    AXValueRef v10 = AXValueCreate(kAXValueTypeCFRange, &v14);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"currentItem"]);
    [v11 setObject:v10 forKeyedSubscript:@"targetRange"];

    if (v10) {
      CFRelease(v10);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5 == 1));
  [v8 setObject:v12 forKeyedSubscript:@"direction"];

  return v8;
}

- (id)customPublicRotorResultWithItem:(id)a3 startElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
  id v9 = [v8 axElement];
  AXValueRef v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"currentItem"]);
  [v10 setObject:v9 forKeyedSubscript:@"targetElement"];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectWithAXAttribute:95227 parameter:v6]);

  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

    if (v13)
    {
      _NSRange v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uiElement]);
      id v16 = [v15 axElement];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"currentItem"]);
      [v17 setObject:v16 forKeyedSubscript:@"targetElement"];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uiElement]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v19 objectWithAXAttribute:95227 parameter:v6]);

      id v7 = v14;
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  return v12;
}

- (_NSRange)selectedTextRange
{
  id v3 = -[UIElementProtocol rangeWithAXAttribute:](self->_uiElement, "rangeWithAXAttribute:", 2005LL);
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (void)setFirstResponder:(id)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uiElement]);
  -[UIElementProtocol setAXAttribute:withObject:]( uiElement,  "setAXAttribute:withObject:",  3002,  [v4 axElement]);
}

- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4
{
}

- (void)setSelectedTextRange:(_NSRange)a3 refreshBraille:(BOOL)a4 isVoiceOverSelectionMovement:(BOOL)a5
{
  BOOL v5 = a4;
  _NSRange v9 = a3;
  if (!a5)
  {
    -[UIElementProtocol setAXAttribute:withRange:]( self->_uiElement,  "setAXAttribute:withRange:",  2005LL,  a3.location,  a3.length,  v9.location,  v9.length);
    if (!v5) {
      return;
    }
    goto LABEL_5;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  AXValueRef v8 = AXValueCreate(kAXValueTypeCFRange, &v9);
  -[NSMutableArray addObject:](v7, "addObject:", v8, v9.location, v9.length);
  CFRelease(v8);
  -[NSMutableArray addObject:](v7, "addObject:", &off_100187508);
  -[UIElementProtocol setAXAttribute:withArray:](self->_uiElement, "setAXAttribute:withArray:", 2005LL, v7);

  if (v5) {
LABEL_5:
  }
    [(id)VOTSharedWorkspace refreshBraille:1 rotorSelection:0];
}

- (void)_updateValueChangeOriginatorForApplication:(int64_t)a3
{
  unsigned int v5 = -[VOTElement pid](self, "pid");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  unsigned int v7 = [v6 pid];

  if (v5 != v7)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    AXValueRef v8 = (void *)objc_claimAutoreleasedReturnValue([v10 uiElement]);
    _NSRange v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _sourceNameForChangeOriginator:](self, "_sourceNameForChangeOriginator:", a3));
    [v8 setAXAttribute:3007 withString:v9];
  }

- (BOOL)includeRoleOnlyForGroupNavigation
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2221];

  return v3;
}

- (BOOL)includeRoleDescription
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2222];

  return v3;
}

- (void)insertText:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  -[VOTElement _updateValueChangeOriginatorForApplication:](self, "_updateValueChangeOriginatorForApplication:", a4);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTElement _sourceNameForChangeOriginator:](self, "_sourceNameForChangeOriginator:", a4));
  AXValueRef v8 = (void *)v7;
  uiElement = self->_uiElement;
  if (v7)
  {
    v11[0] = kAXInsertTextActionKeyText;
    v11[1] = kAXInsertTextActionKeySource;
    v12[0] = v6;
    v12[1] = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
    -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2056LL, v10);
  }

  else
  {
    -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2056LL, v6);
  }
}

- (void)clearElementForGesturedTextInput
{
  elementForGesturedTextInput = self->_elementForGesturedTextInput;
  self->_elementForGesturedTextInput = 0LL;
}

- (VOTElement)elementForGesturedTextInput
{
  elementForGesturedTextInput = self->_elementForGesturedTextInput;
  if (!elementForGesturedTextInput)
  {
    -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2600LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2600LL));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v4));

    if (!v5)
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));

      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
        AXValueRef v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectWithAXAttribute:2600]);
        unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v8));
      }
    }

    _NSRange v9 = -[VOTElement initWithUIElement:](objc_alloc(&OBJC_CLASS___VOTElement), "initWithUIElement:", v5);
    -[VOTElement setElementForGesturedTextInput:](self, "setElementForGesturedTextInput:", v9);

    elementForGesturedTextInput = self->_elementForGesturedTextInput;
  }

  return elementForGesturedTextInput;
}

- (id)gesturedTextInputAttributes
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2601LL));
  id v4 = [v3 mutableCopy];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | kAXIsEditingTrait)));
  [v4 setObject:v5 forKeyedSubscript:@"AXIsActiveResponder"];

  id v6 = -[VOTElementGesturedTextInputAttributes initWithAttributes:]( objc_alloc(&OBJC_CLASS___VOTElementGesturedTextInputAttributes),  "initWithAttributes:",  v4);
  return v6;
}

- (BOOL)hasImage
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3059LL);
}

- (void)updateGesturedTextInputAttributes
{
}

- (BOOL)requiresLaTeXInput
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2602LL);
}

- (BOOL)activateKeyboardReturnKey
{
  if (AXUIKeyboardIsOOP(self, a2))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement inputUIApplication](&OBJC_CLASS___VOTElement, "inputUIApplication"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
    unsigned __int8 v5 = [v4 performAXAction:2054];

    return v5;
  }

  else
  {
    uint64_t v10 = 0LL;
    unsigned __int8 v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    id v13 = sub_10001666C;
    _NSRange v14 = sub_10001667C;
    id v15 = 0LL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001EC60;
    v9[3] = &unk_100176FD8;
    void v9[4] = &v10;
    -[VOTElement _iterateSelfAndRemoteParentsUsingBlock:](self, "_iterateSelfAndRemoteParentsUsingBlock:", v9);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v11[5] uiElement]);
    unsigned __int8 v8 = [v7 performAXAction:2054];

    _Block_object_dispose(&v10, 8);
    return v8;
  }

- (void)handwritingSendCarriageReturn
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation keyRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "keyRepresentationWithType:",  10LL));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v7 keyInfo]);
  [v2 setKeyCode:40];

  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  [v3 handleKeyboardKeyEvent:v7 eventOrigin:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation keyRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "keyRepresentationWithType:",  11LL));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
  [v5 setKeyCode:40];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  [v6 handleKeyboardKeyEvent:v4 eventOrigin:1];
}

- (void)setVoiceOverFocused:(BOOL)a3
{
  BOOL v3 = a3;
  v16[0] = @"focused";
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  v16[1] = @"assistiveTech";
  v17[0] = v5;
  v17[1] = @"UIAccessibilityNotificationVoiceOverIdentifier";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

  unsigned __int8 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10001EF3C;
  _NSRange v14 = &unk_100177188;
  id v7 = v6;
  id v15 = v7;
  if (AXDeviceSupportsSonification( -[VOTElement _iterateSelfAndRemoteParentsUsingBlock:]( self,  "_iterateSelfAndRemoteParentsUsingBlock:",  &v11)))
  {
    if (-[VOTElement supportsAudiographs](self, "supportsAudiographs", v11, v12, v13, v14))
    {
      if (!v3) {
        goto LABEL_8;
      }
LABEL_7:
      _NSRange v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement chartElement](self, "chartElement"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
      [v10 setCurrentChartElement:v9];

      goto LABEL_8;
    }

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement chartElement](self, "chartElement"));
    if (v8)
    {

      if (v3) {
        goto LABEL_7;
      }
    }
  }

- (void)_updateFocusForFKA:(BOOL)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemApplication]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement fbSceneIdentifier](self, "fbSceneIdentifier"));
    _NSRange v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v7,  v8));
    [v5 performAction:5303 withValue:v9];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
    if (v10)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      [v11 setNativeFocus];
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteApplication](self, "remoteApplication"));

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      _NSRange v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uiElement]);
      [v14 performAXAction:5308 withValue:&__kCFBooleanTrue];
    }

    -[VOTElement setNativeFocus](self, "setNativeFocus");
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement remoteApplication](self, "remoteApplication"));

    if (v15)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement remoteParent](self, "remoteParent"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v17 uiElement]);
      [v16 performAXAction:5308 withValue:&__kCFBooleanFalse];
    }
  }

- (int64_t)lineStartPosition
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 4001LL));
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (int64_t)lineEndPosition
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 4002LL));
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (_NSRange)characterRangeForPosition:(unint64_t)a3
{
  __int128 v8 = xmmword_100132600;
  BOOL v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94016LL,  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3));
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }

  else
  {
    NSUInteger v7 = 0LL;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }

  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)lineRangeForPosition:(unint64_t)a3
{
  __int128 v8 = xmmword_100132600;
  BOOL v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94009LL,  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3));
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }

  else
  {
    NSUInteger v7 = 0LL;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }

  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)shouldSpeakScrollStatusOnEntry
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2074LL);
}

- (BOOL)includeDuringContentReading
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2306LL);
}

- (BOOL)isReadingContent
{
  return 0;
}

- (void)updatePageContent
{
}

- (id)pageContent
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2302LL);
}

- (BOOL)supportsRangeForLineNumber
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2308LL);
}

- (_NSRange)rangeForLineNumber:(int64_t)a3
{
  __int128 v8 = xmmword_100132600;
  BOOL v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92704LL,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    NSUInteger v7 = *((void *)&v8 + 1);
    NSUInteger v6 = v8;
  }

  else
  {
    NSUInteger v7 = 0LL;
    NSUInteger v6 = 0x7FFFFFFFLL;
  }

  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (id)stringForLineNumber:(int64_t)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92702LL,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3)));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (CGRect)frameForLineNumber:(int64_t)a3
{
  BOOL v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92701LL,  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()))
  {
    AXValueGetValue(v4, kAXValueTypeCGRect, &origin);
  }

  else
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v12 = size;
  }

  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)supportsFrameForRange
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2307LL);
}

- (CGRect)frameForRange:(_NSRange)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v12 = size;
  uint64_t v4 = -[VOTElement objectForRange:withParameterizedAttribute:]( self,  "objectForRange:withParameterizedAttribute:",  a3.location,  a3.length,  92703LL);
  if (v4)
  {
    CFTypeID v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == AXValueGetTypeID() && AXValueGetType(v5) == kAXValueTypeCGRect) {
      AXValueGetValue(v5, kAXValueTypeCGRect, &origin);
    }
  }

  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)lineNumberForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = -[VOTElement windowContextId](self, "windowContextId");
  uint64_t v7 = -[VOTElement displayId](self, "displayId");
  v8.n128_f64[0] = x;
  v9.n128_f64[0] = y;
  v17[0] = AXConvertPointToHostedCoordinates(v6, v7, v8, v9);
  v17[1] = v10;
  AXValueRef v11 = AXValueCreate(kAXValueTypeCGPoint, v17);
  CGSize v12 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92700LL,  v11));
  CFRelease(v11);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
    int64_t v15 = (int64_t)[v12 integerValue];
  }
  else {
    int64_t v15 = 0x7FFFFFFFLL;
  }

  return v15;
}

- (void)setCurrentWordContextForBook:(id)a3
{
}

- (id)lineNumberAndColumnForPoint:(CGPoint)a3
{
  CGPoint v11 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v11);
  if (!v4) {
    return 0LL;
  }
  AXValueRef v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92503LL,  v4));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }
  CFRelease(v5);

  return v9;
}

- (_NSRange)rangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  __int128 v10 = xmmword_100132600;
  if (v4)
  {
    AXValueRef v5 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92504LL,  v4);
    if (v5)
    {
      uint64_t v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == AXValueGetTypeID() && AXValueGetType(v6) == kAXValueTypeCFRange) {
        AXValueGetValue(v6, kAXValueTypeCFRange, &v10);
      }
    }
  }

  NSUInteger v9 = *((void *)&v10 + 1);
  NSUInteger v8 = v10;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)previousTextNavigationElement
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2312LL);
}

- (id)nextTextNavigationElement
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2313LL);
}

- (id)valueForRange:(_NSRange)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement objectForRange:withParameterizedAttribute:]( self,  "objectForRange:withParameterizedAttribute:",  a3.location,  a3.length,  92505LL));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)attributedValueForRange:(_NSRange)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement objectForRange:withParameterizedAttribute:]( self,  "objectForRange:withParameterizedAttribute:",  a3.location,  a3.length,  92508LL));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AXAttributedString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4
{
  _NSRange v10 = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCFRange, &v10);
  if (!v6) {
    return 0LL;
  }
  AXValueRef v7 = v6;
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  a4,  v6));
  CFRelease(v7);
  return v8;
}

- (id)_selectionStringForSegment:(int64_t)a3
{
  else {
    return off_1001771C0[a3 - 1];
  }
}

- (void)increaseWebSelection:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement _selectionStringForSegment:](self, "_selectionStringForSegment:", a3));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2015LL, v4);
}

- (void)decreaseWebSelection:(int64_t)a3
{
  uiElement = self->_uiElement;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement _selectionStringForSegment:](self, "_selectionStringForSegment:", a3));
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2016LL, v4);
}

- (void)deleteCharacterAtCursorWithSource:(int64_t)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[VOTElement _sourceNameForChangeOriginator:](self, "_sourceNameForChangeOriginator:", a3));
  uiElement = self->_uiElement;
  id v6 = (id)v4;
  if (v4) {
    -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 2052LL, v4);
  }
  else {
    -[UIElementProtocol performAXAction:](uiElement, "performAXAction:", 2052LL);
  }
}

- (int64_t)_changeOriginatorForSourceName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"hardware"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"braillehardware"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"braillegestures"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"handwriting"])
  {
    int64_t v4 = 4LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)_sourceNameForChangeOriginator:(int64_t)a3
{
  else {
    return (id)qword_1001771F8[a3];
  }
}

- (void)replaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4 source:(int64_t)a5
{
  id v11 = a4;
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  NSUInteger v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v8 setValue:v9 forKey:@"numberofcharacters"];

  if (v11) {
    [v8 setValue:v11 forKey:@"replacement"];
  }
  _NSRange v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _sourceNameForChangeOriginator:](self, "_sourceNameForChangeOriginator:", a5));
  if (v10) {
    [v8 setValue:v10 forKey:@"source"];
  }
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 2053LL, v8);
}

- (BOOL)replaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12[0] = @"range";
  id v7 = a4;
  v14.NSUInteger location = location;
  v14.NSUInteger length = length;
  NSUInteger v8 = NSStringFromRange(v14);
  NSUInteger v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[1] = @"replacement";
  v13[0] = v9;
  v13[1] = v7;
  _NSRange v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  LOBYTE(v9) = -[UIElementProtocol performAXAction:withValue:]( self->_uiElement,  "performAXAction:withValue:",  2505LL,  v10);
  return (char)v9;
}

- (CGRect)boundsForRange:(_NSRange)a3
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v12 = size;
  int64_t v4 = -[VOTElement objectForRange:withParameterizedAttribute:]( self,  "objectForRange:withParameterizedAttribute:",  a3.location,  a3.length,  92506LL);
  if (v4)
  {
    uint64_t v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == AXValueGetTypeID() && AXValueGetType(v5) == kAXValueTypeCGRect) {
      AXValueGetValue(v5, kAXValueTypeCGRect, &origin);
    }
  }

  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)expandedTextValue
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3033LL);
}

- (id)textMarkerRangeForSelection
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 4004LL);
}

- (_NSRange)textMarkerSelectionRange
{
  id v3 = -[UIElementProtocol rangeWithAXAttribute:](self->_uiElement, "rangeWithAXAttribute:", 4005LL);
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (id)textMarkerRange
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 4003LL);
}

- (id)webAreaURL
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2105LL));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSURL, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)attachmentFilenameForCID:(id)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  95229LL,  a3);
}

- (id)url
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2020LL));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSURL, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)textMarkerForPoint:(CGPoint)a3
{
  CGPoint v7 = a3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, &v7);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94007LL,  v4));
  CFRelease(v4);
  return v5;
}

- (id)textMarkersForPoints:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      _NSRange v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v10) pointValue];
        v16[0] = v11;
        v16[1] = v12;
        AXValueRef v13 = AXValueCreate(kAXValueTypeCGPoint, v16);
        [v5 addObject:v13];
        CFRelease(v13);
        _NSRange v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  NSRange v14 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94010LL,  v5));
  return v14;
}

- (id)textNextMarker:(id)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94004LL,  a3);
}

- (id)textPreviousMarker:(id)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94005LL,  a3);
}

- (id)pageTextMarkerRange
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2305LL));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)textLineEndMarker:(id)a3
{
  uiElement = self->_uiElement;
  id v5 = a3;
  -[UIElementProtocol updateCache:](uiElement, "updateCache:", 94003LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94003LL,  v5));

  return v6;
}

- (_NSRange)rangeForTextMarker:(id)a3
{
  __int128 v8 = xmmword_100132600;
  uint64_t v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94012LL,  a3);
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == AXValueGetTypeID() && AXValueGetType(v4) == kAXValueTypeCFRange) {
      AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    }
  }

  NSUInteger v7 = *((void *)&v8 + 1);
  NSUInteger v6 = v8;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (BOOL)shouldAnnounceFontInfo
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2051LL);
}

- (BOOL)isCameraIrisOpen
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3008LL);
}

- (BOOL)isTourGuideRunning
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2500LL);
}

- (id)textMarkersForRange:(_NSRange)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement objectForRange:withParameterizedAttribute:]( self,  "objectForRange:withParameterizedAttribute:",  a3.location,  a3.length,  94014LL));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)textOperationsAvailable
{
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextOperationsAvailableTrait)) {
    return 1;
  }
  uint64_t v4 = kAXWebContentTrait;
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait)) {
    return 0;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2011LL));
  else {
    unsigned __int8 v3 = [v5 textOperationsAvailable];
  }

  return v3;
}

- (void)setSelectionToTextMarker:(id)a3
{
  id v3 =  -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94013LL,  a3);
}

- (id)textLineStartMarker:(id)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94002LL,  a3);
}

- (CGRect)textMarkerFrame:(id)a3
{
  id v3 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94000LL,  a3);
  if (v3 && (v4 = v3, CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()))
  {
    AXValueGetValue(v4, kAXValueTypeCGRect, &origin);
  }

  else
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v12 = size;
  }

  double y = origin.y;
  double x = origin.x;
  double height = v12.height;
  double width = v12.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)elementForTextMarker:(id)a3
{
  return -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  94006LL,  a3);
}

- (id)stringForTextMarkers:(id)a3
{
  return -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94008LL,  a3);
}

- (id)textMarkerArrayOfText:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  94001LL,  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        BOOL v11 = v8;
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        CGSize v12 = *(const void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        CFTypeID v13 = CFGetTypeID(v12);
        CFTypeID TypeID = AXUIElementGetTypeID();
        BOOL v8 = v13 != TypeID;
        if (v13 == TypeID)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElement _elementWithAXUIElementRef:]( &OBJC_CLASS___VOTElement,  "_elementWithAXUIElementRef:",  v12,  (void)v19));
          [v4 addObject:v17];
        }

        else if (v11)
        {
          int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:v12]);
          objc_msgSend(v4, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v4, "count") - 1, v16);
        }

        else
        {
          [v4 addObject:v12];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)summaryElement
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 3001LL);
}

- (NSArray)headerElements
{
  return (NSArray *)-[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2026LL);
}

- (NSArray)linkedUIElements
{
  return (NSArray *)-[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2167LL);
}

- (id)headerElementsForColumn:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementsForAttribute:withParameter:]( self,  "elementsForAttribute:withParameter:",  95233LL,  v4));

  return v5;
}

- (id)headerElementsForRow:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementsForAttribute:withParameter:]( self,  "elementsForAttribute:withParameter:",  95234LL,  v4));

  return v5;
}

- (void)addTitleElementToCache:(id)a3
{
  id v6 = a3;
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACCA8);
  id v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    id v5 = [objc_allocWithZone(NSMutableSet) init];
    objc_setAssociatedObject(self, &unk_1001ACCA8, v5, (void *)1);
  }

  [v5 addObject:v6];
}

- (BOOL)elementActsAsTitleElement:(id)a3
{
  id v4 = a3;
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1001ACCA8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (id)titleElements
{
  return 0LL;
}

- (id)explorerElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 3022LL);
}

- (id)accessibleDescendants
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 2095LL);
}

- (id)accessibleAncestor
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2096LL);
}

- (id)bundleIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3003LL));
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
    else {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    }
  }

  return v3;
}

- (BOOL)isLiveCaptionsTextView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement identifier](self, "identifier"));
  if ([v3 isEqualToString:@"AXLCCaptionText"])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement identifier](self, "identifier"));
    if ([v5 isEqualToString:@"AXLCCaptionParagraphText"])
    {
      unsigned __int8 v4 = 1;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement identifier](self, "identifier"));
      unsigned __int8 v4 = [v6 isEqualToString:@"AXLCAppName"];
    }
  }

  return v4;
}

- (BOOL)isLiveCaptionsParagraphView
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"AXLCCaptionParagraphText"];

  return v3;
}

- (BOOL)isInAppSwitcher
{
  return 0;
}

- (BOOL)isInStatusBar
{
  return -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXStatusBarElementTrait);
}

- (BOOL)isInAlert
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2311LL);
}

- (BOOL)isInFolder
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2081LL);
}

- (BOOL)hasBadge
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2144LL);
}

- (BOOL)isSpringBoard
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isChronod
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.chronod"];

  return v3;
}

- (BOOL)isPineBoard
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.PineBoard"];

  return v3;
}

- (BOOL)isHeadBoard
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.HeadBoard"];

  return v3;
}

- (BOOL)isSystemApp
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.PineBoard"];

  return v3;
}

- (BOOL)isSetupBuddy
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.purplebuddy"];

  return v3;
}

- (BOOL)isClockFace
{
  return 0;
}

- (BOOL)isMobilePhone
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilephone"];

  return v3;
}

- (BOOL)isSafari
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilesafari"];

  return v3;
}

- (BOOL)isGoogleChrome
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.google.chrome.ios"];

  return v3;
}

- (BOOL)isAssistiveTouch
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.assistivetouchd"];

  return v3;
}

- (BOOL)isAccessibilitySystemUIServer
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.AccessibilityUIServer"];

  return v3;
}

- (BOOL)isMail
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:AX_MobileMailBundleName];

  return v3;
}

- (BOOL)isMaps
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.Maps"];

  return v3;
}

- (BOOL)isIBooks
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.iBooks"];

  return v3;
}

- (BOOL)isSpotlight
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:AX_SpotlightBundleName];

  return v3;
}

- (BOOL)isClipViewService
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement bundleIdentifier](self, "bundleIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:AX_ClipViewServiceName];

  return v3;
}

- (BOOL)isHandUI
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement windowSceneIdentifier](self, "windowSceneIdentifier"));
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.RealityHUD.HandScene"];

  return v3;
}

- (id)textReplacements
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 3043LL);
}

- (id)typingCandidateElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 3004LL);
}

- (id)elementAtRow:(int64_t)a3 andColumn:(int64_t)a4
{
  id v7 = objc_allocWithZone(&OBJC_CLASS___NSArray);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement elementForParameterizedAttribute:parameter:]( self,  "elementForParameterizedAttribute:parameter:",  92511LL,  v10));
  return v11;
}

- (void)jumpToTableIndex:(id)a3
{
}

- (_NSRange)rowRange
{
  id v2 = -[UIElementProtocol rangeWithAXAttribute:](self->_uiElement, "rangeWithAXAttribute:", 2027LL);
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (BOOL)shouldIncludeRowRangeInDescription
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2161LL);
}

- (BOOL)isContainedByPreferredNativeFocusElement
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2162LL);
}

- (BOOL)allowsActivationWithoutBeingNativeFocused
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2199LL);
}

- (BOOL)isContainedByVideoElement
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2166LL);
}

- (BOOL)areMediaLegibilityEventsBeingTapped
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3036LL);
}

- (_NSRange)columnRange
{
  id v2 = -[UIElementProtocol rangeWithAXAttribute:](self->_uiElement, "rangeWithAXAttribute:", 2028LL);
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (_NSRange)indexPathAsRange
{
  id v2 = -[UIElementProtocol rangeWithAXAttribute:](self->_uiElement, "rangeWithAXAttribute:", 2078LL);
  result.NSUInteger length = v3;
  result.NSUInteger location = (NSUInteger)v2;
  return result;
}

- (id)parentTableOrCollectionView
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2143LL);
}

- (BOOL)startStopToggle
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 2011LL);
}

- (BOOL)softwareKeyboardSupportsGestureKeyboard
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 5035LL);
}

- (BOOL)isSoftwareKeyboardMimic
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3028LL);
}

- (BOOL)isSoftwareKeyboardActive
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3005LL);
}

- (BOOL)usingHardwareKeyboard
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3007LL));
  unsigned __int8 v4 = [v3 isEqualToString:@"hardware"];

  return v4;
}

- (int64_t)valueChangeOriginationSource
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3007LL));
  int64_t v4 = -[VOTElement _changeOriginatorForSourceName:](self, "_changeOriginatorForSourceName:", v3);

  return v4;
}

- (BOOL)usingBrailleHardwareKeyboard
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3007LL));
  unsigned __int8 v4 = [v3 isEqualToString:@"braillehardware"];

  return v4;
}

- (BOOL)isKeyboardActiveOrAttached
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  BOOL v3 = ([v2 isSoftwareKeyboardActive] & 1) != 0
    || GSEventIsHardwareKeyboardAttached() != 0;

  return v3;
}

- (int64_t)applicationOrientation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 1503LL));
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)isSystemSleeping
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1507LL);
}

- (BOOL)isAlarmRinging
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1515LL);
}

- (BOOL)isSystemLocked
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1500LL);
}

- (BOOL)isSystemBatteryLow
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1504LL);
}

- (id)launchableApps
{
  return -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 1508LL);
}

- (id)appSwitcherApps
{
  return -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 1509LL);
}

- (void)launchAppWithDisplayID:(id)a3
{
}

- (id)focusModeActivityName
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 1517LL);
}

- (BOOL)isQuietModeEnabled
{
  return 0;
}

- (CGPoint)centerPointOfScreen
{
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)isVoiceControlRunning
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1501LL);
}

- (BOOL)isDictationListening
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3010LL);
}

- (id)currentHardwareKeyboardLayout
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3013LL);
}

- (id)currentSoftwareKeyboardLanguage
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3019LL);
}

- (id)currentSoftwareKeyboardLayout
{
  if (!-[VOTElement isApplication](self, "isApplication")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElement.m",  5442LL,  "-[VOTElement currentSoftwareKeyboardLayout]",  @"Only call this on an application!");
  }
  -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 3018LL);
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3018LL);
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (CGPoint)contentOffset
{
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)isSiriTalkingOrListening
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
  unsigned __int8 v4 = [v3 isSiriTalkingOrListening];

  return v4;
}

- (BOOL)isSystemWideGestureInProgress
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1506LL);
}

- (BOOL)showBulletinBoard:(BOOL)a3
{
  uiElement = self->_uiElement;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  LOBYTE(uiElement) = -[UIElementProtocol performAXAction:withValue:]( uiElement,  "performAXAction:withValue:",  5000LL,  v4);

  return (char)uiElement;
}

- (BOOL)showControlCenter:(BOOL)a3
{
  uiElement = self->_uiElement;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  LOBYTE(uiElement) = -[UIElementProtocol performAXAction:withValue:]( uiElement,  "performAXAction:withValue:",  5014LL,  v4);

  return (char)uiElement;
}

- (void)restoreUserPreferencesChangedByHandwriting
{
}

- (id)firstElementInStatusBar
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 3011LL));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v3));

  id v5 = [objc_allocWithZone((Class)VOTElement) initWithUIElement:v4];
  return v5;
}

- (id)statusBarElements
{
  return -[VOTElement elementsForAttribute:](self, "elementsForAttribute:", 3054LL);
}

- (BOOL)avoidAnnouncingDirectTouchArea
{
  return -[VOTElement directTouchOptions](self, "directTouchOptions") & 1;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4
{
  CGRect valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
  uiElement = self->_uiElement;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  uint64_t v9 = (const __AXValue *)-[UIElementProtocol objectWithAXAttribute:parameter:]( uiElement,  "objectWithAXAttribute:parameter:",  91505LL,  +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v6, v8, 0LL));

  if (v6) {
    CFRelease(v6);
  }
  if (v9) {
    AXValueGetValue(v9, kAXValueTypeCGRect, &valuePtr);
  }
  double width = valuePtr.size.width;
  double height = valuePtr.size.height;
  double x = valuePtr.origin.x;
  double y = valuePtr.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  AXValueRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v7 = (CGPath *)[v6 convertPath:a3 fromContextId:v4];

  return v7;
}

- (CGRect)convertFrame:(CGRect)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5
{
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 fromDisplayId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  uint64_t v9 = (CGPath *)[v8 convertPath:a3 fromContextId:v6 displayId:v5];

  return v9;
}

- (BOOL)finishSetupIfAppropriate
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4019LL);
}

- (id)lastElementInStatusBar
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 3012LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v3));

  id v5 = [objc_allocWithZone((Class)VOTElement) initWithUIElement:v4];
  return v5;
}

- (BOOL)isElementFirstElement:(BOOL)a3 orLastElement:(BOOL)a4 withType:(unint64_t)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92509LL,  +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a5)));
    unsigned __int8 v9 = [v8 BOOLValue];

    if ((v9 & 1) != 0) {
      return v9;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[UIElementProtocol objectWithAXAttribute:parameter:]( self->_uiElement,  "objectWithAXAttribute:parameter:",  92510LL,  +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a5)));
    unsigned __int8 v11 = [v10 BOOLValue];

    return v11;
  }

  return v9;
}

- (NSString)description
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"Aspect:|"));
  int64_t v4 = -[VOTElement aspectMask](self, "aspectMask");
  int64_t v5 = v4;
  if ((v4 & 1) != 0)
  {
    [v3 appendString:@"Label|"];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }

  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }

  [v3 appendString:@"Value|"];
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v6 = @"RowRange|";
    goto LABEL_11;
  }

- (NSString)toggleStatusLabel
{
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXToggleTrait))
  {
    unsigned int v3 = -[VOTElement isSwitch](self, "isSwitch");
    unsigned int v4 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait);
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    if (([v5 isEqualToString:@"0"] & 1) != 0
      || v3 && [v5 isEqualToString:@"2"])
    {
      double v7 = off_1001AC148;
      BOOL v8 = (v4 & (v3 ^ 1)) == 0;
      if ((v4 & (v3 ^ 1)) != 0) {
        unsigned __int8 v9 = @"element.unchecked.text";
      }
      else {
        unsigned __int8 v9 = @"element.off.text";
      }
      id v10 = @"off";
      unsigned __int8 v11 = @"unchecked";
    }

    else
    {
      if (![v5 isEqualToString:@"1"])
      {
        if (![v5 isEqualToString:@"2"])
        {
          id v15 = v5;
          goto LABEL_19;
        }

        double v7 = off_1001AC148;
        unsigned __int8 v9 = @"element.mixed.text";
        CFTypeID v13 = @"mixed";
LABEL_18:
        id v14 = sub_10004AE68(v7, v9, v13, v6);
        id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
LABEL_19:
        CGSize v12 = v15;

        return (NSString *)v12;
      }

      double v7 = off_1001AC148;
      BOOL v8 = (v4 & (v3 ^ 1)) == 0;
      if ((v4 & (v3 ^ 1)) != 0) {
        unsigned __int8 v9 = @"element.checked.text";
      }
      else {
        unsigned __int8 v9 = @"element.on.text";
      }
      id v10 = @"on";
      unsigned __int8 v11 = @"checked";
    }

    if (v8) {
      CFTypeID v13 = (__CFString *)v10;
    }
    else {
      CFTypeID v13 = (__CFString *)v11;
    }
    goto LABEL_18;
  }

  CGSize v12 = 0LL;
  return (NSString *)v12;
}

- (BOOL)shouldStartReadAllOnFocus
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2038LL);
}

- (VOTElementUniqueIdentification)uniqueIdentification
{
  double v2 = self;
  objc_sync_enter(v2);
  uniqueIdentification = v2->_uniqueIdentification;
  if (uniqueIdentification) {
    id v4 = -[VOTElementUniqueIdentification copy](uniqueIdentification, "copy");
  }
  else {
    id v4 = 0LL;
  }
  objc_sync_exit(v2);

  if (!v4)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[VOTElementUniqueIdentification identificationFromElement:]( &OBJC_CLASS___VOTElementUniqueIdentification,  "identificationFromElement:",  v2));
    int64_t v5 = v2;
    objc_sync_enter(v5);
    BOOL v6 = (VOTElementUniqueIdentification *)[v4 copy];
    double v7 = v2->_uniqueIdentification;
    v2->_uniqueIdentification = v6;

    objc_sync_exit(v5);
  }

  return (VOTElementUniqueIdentification *)v4;
}

- (BOOL)webSearchResultsActive
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2032LL);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)nonPersistentUniqueId
{
  uiElement = self->_uiElement;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AXUIElement, a2);
  if ((objc_opt_isKindOfClass(uiElement, v4) & 1) != 0)
  {
    unint64_t v5 = _AXUIElementIDForElement(-[UIElementProtocol axElement](self->_uiElement, "axElement"));
  }

  else
  {
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
  }

  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (BOOL)isApplication
{
  uiElement = self->_uiElement;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AXUIMockElement, a2);
  char isKindOfClass = objc_opt_isKindOfClass(uiElement, v4);
  double v7 = self->_uiElement;
  if ((isKindOfClass & 1) != 0) {
    return -[UIElementProtocol isApplication](self->_uiElement, "isApplication");
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___AXUIElement, v6);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0) {
    return 0;
  }
  id v10 = (const __AXUIElement *)-[UIElementProtocol axElement](self->_uiElement, "axElement");
  _AXUIElementIDForElement(v10);
  uint64_t v12 = v11;
  pid_t pid = 0;
  AXUIElementGetPid(v10, &pid);
  return v12 == kAXApplicationUID && pid >= 0;
}

- (BOOL)applicationHandleRemoteUpButton
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4100LL);
}

- (BOOL)applicationHandleRemoteDownButton
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4101LL);
}

- (BOOL)applicationHandleRemoteLeftButton
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4103LL);
}

- (BOOL)applicationHandleRemoteRightButton
{
  return -[UIElementProtocol performAXAction:](self->_uiElement, "performAXAction:", 4102LL);
}

- (int)applicationInterfaceOrientation
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 3035LL));
  int v4 = [v3 integerValue];

  return v4;
}

- (CGRect)convertAccessibilityFrameToScreenCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIElementProtocol updateCache:](self->_uiElement, "updateCache:", 2021LL);
  uint64_t v8 = -[VOTElement windowContextId](self, "windowContextId");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  objc_msgSend(v9, "convertRect:fromContextId:", v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (NSString)visibleText
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringWithAXAttribute:3053]);

  if (![v4 length])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[VOTElement staticTextString](self, "staticTextString"));

    int v4 = (void *)v5;
  }

  return (NSString *)v4;
}

- (id)staticTextString
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXToggleTrait))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement toggleStatusLabel](self, "toggleStatusLabel"));
    if ([v5 length])
    {
      id v6 = v5;

      int v4 = v6;
    }
  }

  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextAreaTrait) || ![v4 length])
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
    [v3 appendStringWithComma:v7];
  }

  [v3 appendStringWithComma:v4];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement staticRecognitionText](self, "staticRecognitionText"));
  [v3 appendStringWithComma:v8];

  return v3;
}

- (id)visionFeatureDescriptionOptions
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 voiceOverDiscoveredSensitiveContentFeedback];

  v8[0] = AXMFeatureDescriptionOptionLocale;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US"));
  v9[0] = v4;
  v8[1] = AXMFeatureDescriptionOptionModifyForSensitiveContent;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3 == 0LL));
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return v6;
}

- (id)staticRecognitionText
{
  return +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
}

- (BOOL)activateDragWithDescriptorDictionary:(id)a3
{
  return 0;
}

- (BOOL)prefersContextlessPassthrough
{
  return 0;
}

- (BOOL)shouldSpeakMathEquationTrait
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2402];

  return v3;
}

- (BOOL)shouldExpandMathEquation
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2403];

  return v3;
}

- (id)elementCommunityIdentifier
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringWithAXAttribute:2100]);

  return v3;
}

- (id)isolatedWindow
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2099LL);
}

- (id)chartDescriptor
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement chartElement](self, "chartElement"));
  char v11 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:2711]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v4, v6, 1LL, &v11);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v11) {
    abort();
  }
  id v9 = [[AXMChartDescriptor alloc] initWithDictionary:v8];

  return v9;
}

- (VOTElement)chartElement
{
  return (VOTElement *)-[VOTElement elementForAttribute:](self, "elementForAttribute:", 2714LL);
}

- (NSString)chartStructureDescription
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement chartElement](self, "chartElement"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringWithAXAttribute:2718]);

  return (NSString *)v4;
}

- (id)dataSeriesName
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringWithAXAttribute:2702]);

  return v4;
}

- (int64_t)dataSeriesType
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 numberWithAXAttribute:2703]);
  id v5 = [v4 unsignedIntegerValue];

  return (int64_t)v5;
}

- (BOOL)supportsAudiographActions
{
  int v3 = AXDeviceSupportsSonification(self);
  if (v3)
  {
    if (-[VOTElement supportsDataSeriesSonification](self, "supportsDataSeriesSonification")
      || -[VOTElement supportsDataSeriesSummarization](self, "supportsDataSeriesSummarization"))
    {
      LOBYTE(v3) = 1;
    }

    else
    {
      LOBYTE(v3) = -[VOTElement supportsAudiographs](self, "supportsAudiographs");
    }
  }

  return v3;
}

- (BOOL)supportsDataSeriesSummarization
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2705];

  return v4;
}

- (BOOL)supportsDataSeriesSonification
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2706];

  return v4;
}

- (BOOL)supportsAudiographs
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2713];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectWithAXAttribute:2714]);

  if (v6) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)includesTrendlineInSonification
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  unsigned __int8 v4 = [v3 BOOLWithAXAttribute:2707];

  return v4;
}

- (double)dataSeriesSonificationPlaybackDuration
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 numberWithAXAttribute:2704]);
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (id)dataSeriesValuesForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForParameterizedAttribute:95239 parameter:v5]);

  return v6;
}

- (id)dataSeriesTitleForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForParameterizedAttribute:95240 parameter:v5]);

  if (![v6 length])
  {
    if (a3) {
      uint64_t v7 = @"search.rotor.audiograph.axis.y";
    }
    else {
      uint64_t v7 = @"search.rotor.audiograph.axis.x";
    }
    id v8 = sub_10004A988(off_1001AC148, v7, 0LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

    double v6 = (void *)v9;
  }

  return v6;
}

- (double)dataSeriesMinimumValueForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "objectWithAXAttribute:parameter:",  95241,  +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3)));

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    [v6 doubleValue];
    double v10 = v9;
  }

  else
  {
    double v10 = -1.79769313e308;
  }

  return v10;
}

- (double)dataSeriesMaximumValueForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "objectWithAXAttribute:parameter:",  95242,  +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3)));

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    [v6 doubleValue];
    double v10 = v9;
  }

  else
  {
    double v10 = 1.79769313e308;
  }

  return v10;
}

- (id)dataSeriesUnitsLabelForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "objectWithAXAttribute:parameter:",  95244,  +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3)));

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)dataSeriesGridlinePositionsForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForParameterizedAttribute:95243 parameter:v5]);

  return v6;
}

- (id)dataSeriesCategoryLabelsForAxis:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForParameterizedAttribute:95245 parameter:v5]);

  return v6;
}

- (id)dataSeriesXAxisValueDescriptionForPosition:(double)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "stringForParameterizedAttribute:parameter:",  95247,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3)));

  return v5;
}

- (id)dataSeriesYAxisValueDescriptionForPosition:(double)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "stringForParameterizedAttribute:parameter:",  95248,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3)));

  return v5;
}

- (id)dataSeriesAxesDescription
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement dataSeriesElement](self, "dataSeriesElement"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 dataSeriesTitleForAxis:0]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 dataSeriesTitleForAxis:1]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSeriesUnitsLabelForAxis:0]);
  CGRect v41 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSeriesUnitsLabelForAxis:1]);
  [v3 dataSeriesMinimumValueForAxis:0];
  uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v3 dataSeriesMaximumValueForAxis:0];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v3 dataSeriesMinimumValueForAxis:1];
  uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v3 dataSeriesMaximumValueForAxis:1];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement language](self, "language"));
  id v10 = sub_10004A988(off_1001AC148, @"search.rotor.audiograph.axes.description.format", v9);
  char v11 = (void *)v4;
  CGRect v37 = (void *)objc_claimAutoreleasedReturnValue(v10);
  CGRect v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSeriesXAxisValueDescriptionForPosition:0.0]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSeriesXAxisValueDescriptionForPosition:1.0]);
  CGRect v40 = v6;
  CGRect v35 = (void *)v5;
  char v33 = v9;
  CGRect v34 = (void *)v7;
  if ([v12 length] && objc_msgSend(v13, "length"))
  {
    id v14 = sub_10004A988(off_1001AC148, @"search.rotor.audiograph.axes.hint.format.no.units", v9);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    double v16 = (void *)v8;
    double v17 = (void *)v38;
    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v15,  v5,  v38,  v8,  v11,  v12,  v13));
    double v19 = (void *)v39;
  }

  else
  {
    if ([v6 length] && objc_msgSend(v41, "length"))
    {
      id v20 = sub_10004A988(off_1001AC148, @"search.rotor.audiograph.axes.hint.format", v9);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v31 = v7;
      double v32 = v6;
      float v30 = v6;
      double v19 = (void *)v39;
      float v28 = v11;
      uint64_t v29 = v39;
      __int128 v26 = (void *)v8;
      float v27 = v41;
      double v16 = (void *)v8;
      __int128 v25 = v41;
    }

    else
    {
      id v21 = sub_10004A988(off_1001AC148, @"search.rotor.audiograph.axes.hint.format.no.units", v9);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
      float v28 = (void *)v7;
      double v19 = (void *)v39;
      __int128 v26 = v11;
      float v27 = (void *)v39;
      double v16 = (void *)v8;
      __int128 v25 = (void *)v8;
    }

    double v17 = (void *)v38;
    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v15,  v5,  v38,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32));
  }

  v42[0] = v36;
  v42[1] = v18;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", @", "));

  return v23;
}

- (void)setAccelemoterDisabled:(BOOL)a3
{
}

- (void)setRotationCapabilityEnabled:(BOOL)a3
{
  id v4 = [objc_allocWithZone(NSNumber) initWithBool:a3];
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5009LL, v4);
}

- (id)customActionGroupIdentifier
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2178LL);
}

- (void)setEventCaptureMode:(int)a3
{
  id v4 = [objc_allocWithZone(NSNumber) initWithInt:*(void *)&a3];
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5003LL, v4);
}

- (void)unsetEventCaptureMode:(int)a3
{
  id v4 = [objc_allocWithZone(NSNumber) initWithInt:*(void *)&a3];
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5022LL, v4);
}

- (BOOL)dispatchKeyboardEvent:(id)a3
{
  uiElement = self->_uiElement;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataRepresentation]);
  LOBYTE(uiElement) = -[UIElementProtocol performAXAction:withValue:]( uiElement,  "performAXAction:withValue:",  2034LL,  v4);

  return (char)uiElement;
}

- (id)windowContextIDs
{
  return -[UIElementProtocol arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 3040LL);
}

- (void)repostEvent:(id)a3
{
  id v7 = a3;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    [v4 notePostedEventForUnitTesting:v7];
  }

  [v7 setSenderID:0x8000000817319373];
  uiElement = self->_uiElement;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v7 dataRepresentation]);
  -[UIElementProtocol performAXAction:withValue:](uiElement, "performAXAction:withValue:", 5002LL, v6);
}

- (void)sendBrightnessEvent:(id)a3
{
}

- (void)sendTouchCancelledEvent
{
}

- (void)sendUserEventOccurred
{
}

- (void)notifyAnnouncementFinishedWithString:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_10017A920;
  }
  v10[0] = @"String";
  v10[1] = @"DidFinish";
  v11[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v11[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 2025LL, v9);
}

- (BOOL)supportsDirectionOrbManipulation
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3030LL);
}

- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 forElement:(id)a4
{
  LODWORD(v4) = 1028443341;
  return -[VOTElement performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:]( self,  "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:",  0LL,  a4,  a3.x,  a3.y,  0.0,  v4);
}

- (BOOL)performSimpleTapAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5 withDelay:(float)a6 forElement:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  CGPoint valuePtr = a3;
  id v11 = a7;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  -[VOTElement updateTouchForceSounds:](self, "updateTouchForceSounds:", a4);
  id v13 = [v11 secureName];
  if (!(_DWORD)v13)
  {
    unsigned int v19 = 0;
    goto LABEL_14;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uiElement]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringWithAXAttribute:2001]);

  if ((byte_1001ACCA9 & 1) == 0)
  {
    uint64_t v31 = 0LL;
    if (!qword_1001ACCB8)
    {
      __int128 v34 = off_1001771A8;
      uint64_t v35 = 0LL;
      qword_1001ACCB8 = _sl_dlopen(&v34, &v31);
    }

    id v20 = (void *)qword_1001ACCB8;
    if (!qword_1001ACCB8) {
      sub_1000EFB18(&v31);
    }
    if (v31) {
      free(v31);
    }
    off_1001ACCB0 = (uint64_t (*)(void, void))dlsym(v20, "UISLocalizedStringForSecureName");
    byte_1001ACCA9 = 1;
    if (off_1001ACCB0) {
      goto LABEL_4;
    }
LABEL_12:
    unsigned int v19 = 0;
    goto LABEL_13;
  }

  if (!off_1001ACCB0) {
    goto LABEL_12;
  }
LABEL_4:
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 currentLocalization]);
  uint64_t v17 = off_1001ACCB0(v13, v16);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  unsigned int v19 = [v15 isEqualToString:v18];

LABEL_13:
LABEL_14:
  v33[0] = v12;
  v32[0] = kAXSimulatePressAtPointActionKeyPoint;
  v32[1] = kAXSimulatePressAtPointActionKeyForce;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  v33[1] = v21;
  v32[2] = kAXSimulatePressAtPointActionKeyWindowContextID;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v33[2] = v22;
  v32[3] = kAXSimulatePressAtPointActionKeyDelay;
  *(float *)&double v23 = a6;
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v23));
  v33[3] = v24;
  void v32[4] = kAXSimulatePressAtPointActionKeySecureName;
  if (v19) {
    uint64_t v25 = v13;
  }
  else {
    uint64_t v25 = 0LL;
  }
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v25));
  v33[4] = v26;
  float v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  5LL));

  unsigned __int8 v28 = -[UIElementProtocol performAXAction:withValue:]( self->_uiElement,  "performAXAction:withValue:",  5008LL,  v27);
  if (v12) {
    CFRelease(v12);
  }

  return v28;
}

- (void)postStylusTouchAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  CGPoint v21 = a3;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &v21);
  v22[0] = v12;
  *(float *)&double v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
  v22[1] = v14;
  *(float *)&double v15 = a5;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
  v22[2] = v16;
  *(float *)&double v17 = a6;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
  v22[3] = v18;
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  v22[4] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5017LL, v20);
  if (v12) {
    CFRelease(v12);
  }
}

- (void)postStylusDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6 withContextId:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  CGPoint v21 = a3;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, &v21);
  v22[0] = v12;
  *(float *)&double v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
  v22[1] = v14;
  *(float *)&double v15 = a5;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
  v22[2] = v16;
  *(float *)&double v17 = a6;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
  v22[3] = v18;
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  v22[4] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5018LL, v20);
  if (v12) {
    CFRelease(v12);
  }
}

- (void)postStylusLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  v10[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  v10[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5019LL, v8);
  if (v6) {
    CFRelease(v6);
  }
}

- (void)postFingerTouchAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGPoint v13 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v13);
  v14[0] = v8;
  *(float *)&double v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  v14[2] = v11;
  AXValueRef v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));

  -[VOTElement updateTouchForceSounds:](self, "updateTouchForceSounds:", a4);
  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5004LL, v12);
  if (v8) {
    CFRelease(v8);
  }
}

- (void)postFingerDragAtPoint:(CGPoint)a3 withForce:(double)a4 withContextId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGPoint v13 = a3;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, &v13);
  -[VOTElement updateTouchForceSounds:](self, "updateTouchForceSounds:", a4);
  v14[0] = v8;
  *(float *)&double v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  v14[2] = v11;
  AXValueRef v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5005LL, v12);
  if (v8) {
    CFRelease(v8);
  }
}

- (void)postFingerLiftAtPoint:(CGPoint)a3 withContextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGPoint valuePtr = a3;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  -[VOTElement updateTouchForceSounds:](self, "updateTouchForceSounds:", 0.0);
  v10[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  v10[1] = v7;
  AXValueRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  -[UIElementProtocol performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 5006LL, v8);
  if (v6) {
    CFRelease(v6);
  }
}

- (void)updateTouchForceSounds:(double)a3
{
  int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  if (!lastOrbSoundLevel)
  {
    if (AXForceTouchThresholdPeek() < a3)
    {
      self->_int lastOrbSoundLevel = 1;
      AXValueRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      id v9 = v6;
      uint64_t v7 = @"Sounds/VOTOrbSound1-OrbHW.aiff";
LABEL_8:
      [v6 playSoundFast:v7];

      return;
    }

    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }

  if (lastOrbSoundLevel == 1)
  {
    if (AXForceTouchThresholdPeekPopMidpoint() < a3)
    {
      self->_int lastOrbSoundLevel = 2;
      AXValueRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      id v9 = v6;
      uint64_t v7 = @"Sounds/VOTOrbSound2-OrbHW.aiff";
      goto LABEL_8;
    }

    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }

  if (lastOrbSoundLevel == 2)
  {
    if (AXForceTouchThresholdPop() < a3)
    {
      AXValueRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      [v8 playSoundFast:@"Sounds/VOTOrbSound3-OrbHW.aiff"];

      self->_int lastOrbSoundLevel = 3;
      return;
    }

    int lastOrbSoundLevel = self->_lastOrbSoundLevel;
  }

  if (lastOrbSoundLevel == 3 && AXForceTouchThresholdPeek() > a3) {
    self->_int lastOrbSoundLevel = 0;
  }
}

- (unint64_t)directTouchOptions
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2233LL));
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (BOOL)isKeyboardContinuousPathAvailable
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2195LL);
}

- (BOOL)isKeyboardContinuousPathTracking
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2194LL);
}

- (BOOL)isKeyboardEmojiInputMode
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2240LL);
}

- (BOOL)isInternationalKeyboardKey
{
  return -[UIElementProtocol BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3020LL);
}

- (id)activeKeyboard
{
  return -[VOTElement elementForAttribute:](self, "elementForAttribute:", 2076LL);
}

- (BOOL)isDataSeriesElement
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement containerTypes](self, "containerTypes"));
  unsigned __int8 v3 = [v2 containsObject:&off_100187520];

  return v3;
}

- (id)dataSeriesElement
{
  return -[VOTElement ancestryForTraits:](self, "ancestryForTraits:", 4096LL);
}

- (BOOL)includesTrendlineSonification
{
  return 1;
}

- (void)resetAspectMask
{
}

- (int64_t)differenceAspectMask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 label]);
    else {
      uint64_t v7 = 30LL;
    }
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 value]);
    id v11 = -[VOTElement traits](self, "traits");
    if (v11 == [v4 traits]) {
      unint64_t v12 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      unint64_t v12 = v7;
    }
    id v13 = -[VOTElement rowRange](self, "rowRange");
    uint64_t v15 = v14;
    id v16 = [v4 rowRange];
    if (v15 == v17 && v13 == v16) {
      unint64_t v19 = v12 & 0xFFFFFFFFFFFFFFF7LL;
    }
    else {
      unint64_t v19 = v12;
    }
    -[VOTElement frame](self, "frame");
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v4 frame];
    v34.origin.double x = v28;
    v34.origin.double y = v29;
    v34.size.double width = v30;
    v34.size.double height = v31;
    v33.origin.double x = v21;
    v33.origin.double y = v23;
    v33.size.double width = v25;
    v33.size.double height = v27;
    if (CGRectEqualToRect(v33, v34)) {
      unint64_t v8 = v19 & 0xFFFFFFFFFFFFFFEFLL;
    }
    else {
      unint64_t v8 = v19;
    }
  }

  else
  {
    unint64_t v8 = 31LL;
  }

  return v8;
}

- (VOTElementSnapshot)snapshot
{
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___VOTElementSnapshot);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
  unint64_t v6 = -[VOTElement traits](self, "traits");
  id v7 = -[VOTElement rowRange](self, "rowRange");
  uint64_t v9 = v8;
  -[VOTElement frame](self, "frame");
  uint64_t v10 = -[VOTElementSnapshot initWithLabel:value:traits:rowRange:frame:]( v3,  "initWithLabel:value:traits:rowRange:frame:",  v4,  v5,  v6,  v7,  v9);

  return v10;
}

- (void)showEditingHUD
{
}

- (unsigned)secureName
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2223LL));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)currentLocalization
{
  return -[UIElementProtocol stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3064LL);
}

- (int64_t)versionedPID
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 3065LL));
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (BOOL)shouldSkipValidateElement
{
  return self->shouldSkipValidateElement;
}

- (void)setShouldSkipValidateElement:(BOOL)a3
{
  self->shouldSkipValidateElement = a3;
}

- (BOOL)activatedDirectTouchThatRequiredActivation
{
  return self->_activatedDirectTouchThatRequiredActivation;
}

- (void)setActivatedDirectTouchThatRequiredActivation:(BOOL)a3
{
  self->_activatedDirectTouchThatRequiredActivation = a3;
}

- (NSString)supplementalBrailleDescription
{
  return self->_supplementalBrailleDescription;
}

- (void)setSupplementalBrailleDescription:(id)a3
{
}

- (BOOL)isFirstItemInDescriptionList
{
  return self->_isFirstItemInDescriptionList;
}

- (void)setIsFirstItemInDescriptionList:(BOOL)a3
{
  self->_isFirstItemInDescriptionList = a3;
}

- (int64_t)aspectMask
{
  return self->_aspectMask;
}

- (void)setAspectMask:(int64_t)a3
{
  self->_aspectMask = a3;
}

- (NSSet)previousSpokenValueParts
{
  return self->_previousSpokenValueParts;
}

- (void)setPreviousSpokenValueParts:(id)a3
{
}

- (unsigned)cachedDisplayId
{
  return self->_cachedDisplayId;
}

- (void)setCachedDisplayId:(unsigned int)a3
{
  self->_cachedDisplayId = a3;
}

- (VOTElement)cachedRemoteParent
{
  return self->_cachedRemoteParent;
}

- (void)setCachedRemoteParent:(id)a3
{
}

- (BOOL)checkedRemoteParent
{
  return self->_checkedRemoteParent;
}

- (void)setCheckedRemoteParent:(BOOL)a3
{
  self->_checkedRemoteParent = a3;
}

- (VOTElement)cachedImmediateRemoteParent
{
  return self->_cachedImmediateRemoteParent;
}

- (void)setCachedImmediateRemoteParent:(id)a3
{
}

- (BOOL)checkedImmediateRemoteParent
{
  return self->_checkedImmediateRemoteParent;
}

- (void)setCheckedImmediateRemoteParent:(BOOL)a3
{
  self->_checkedImmediateRemoteParent = a3;
}

- (VOTElement)cachedRemoteApplication
{
  return self->_cachedRemoteApplication;
}

- (void)setCachedRemoteApplication:(id)a3
{
}

- (void)setElementForGesturedTextInput:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_allocWithZone(NSMutableArray) init];
  unint64_t v9 = -[VOTElement traits](self, "traits");
  uint64_t v10 = kAXSelectedTrait;
  if ((kAXSelectedTrait & v9) != 0)
  {
    id v11 = sub_10004AE68(off_1001AC148, @"element.selected.text", @"selected", v7);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v8 addObject:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
    [v6 addObject:v13];
  }

  uint64_t v14 = kAXMenuItemTrait;
  if ((kAXMenuItemTrait & v9) != 0)
  {
    id v15 = sub_10004AE68(off_1001AC148, @"element.menu.item", @"menu item", v7);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v8 addObject:v16];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));
    [v6 addObject:v17];
  }

  uint64_t v18 = kAXNotEnabledTrait;
  if ((kAXNotEnabledTrait & v9) != 0)
  {
    id v19 = sub_10004AE68(off_1001AC148, @"element.disabled.text", @"dimmed", v7);
    double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v8 addObject:v20];

    CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v18));
    [v6 addObject:v21];
  }

  v178 = self;
  uint64_t v22 = kAXInactiveTrait;
  if ((kAXInactiveTrait & v9) != 0)
  {
    id v23 = sub_10004AE68(off_1001AC148, @"element.inactive.text", @"inactive", v7);
    double v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v8 addObject:v24];

    CGFloat v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v22));
    [v6 addObject:v25];
  }

  uint64_t v26 = kAXButtonTrait;
  uint64_t v27 = kAXToggleTrait;
  uint64_t v28 = kAXBackButtonTrait;
  if (((kAXToggleTrait | kAXButtonTrait | kAXBackButtonTrait) & v9) != 0 && (kAXKeyboardKeyTrait & v9) == 0)
  {
    if ((kAXBackButtonTrait & v9) != 0)
    {
      CGFloat v29 = off_1001AC148;
      CGFloat v30 = @"back.button.element.text";
      CGFloat v31 = @"back button";
LABEL_13:
      id v32 = sub_10004AE68(v29, v30, v31, v7);
      CGRect v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
LABEL_17:
      [v8 addObject:v33];

      CGRect v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v28));
      [v6 addObject:v36];

      goto LABEL_18;
    }

    unint64_t v34 = kAXWebContentTrait & v9;
    if ((kAXToggleTrait & v9) != 0 && !v34)
    {
      id v35 = sub_10004AE68(off_1001AC148, @"switch.button.element.text", @"button", v7);
      CGRect v33 = (void *)objc_claimAutoreleasedReturnValue(v35);
      uint64_t v28 = v27;
      goto LABEL_17;
    }

    uint64_t v28 = kAXTabButtonTrait;
    if ((kAXTabButtonTrait & v9) != 0)
    {
      CGFloat v29 = off_1001AC148;
      CGFloat v30 = @"tab.button.element.text";
      CGFloat v31 = @"tab";
      goto LABEL_13;
    }

    if ((kAXRadioButtonTrait & v9) == 0)
    {
      if ((kAXToggleTrait & v9) != 0 && v34)
      {
        if (-[VOTElement supportsPressedState](self, "supportsPressedState"))
        {
          v171 = off_1001AC148;
          v172 = @"toggle.button.element.text";
        }

        else
        {
          unsigned int v173 = -[VOTElement isSwitch](self, "isSwitch");
          v171 = off_1001AC148;
          if (v173) {
            v172 = @"switch.button.element.text";
          }
          else {
            v172 = @"checkbox.element.text";
          }
        }
      }

      else
      {
        v171 = off_1001AC148;
        v172 = @"button.element.text";
      }

      id v174 = sub_10004AE68(v171, v172, @"button", v7);
      CGRect v33 = (void *)objc_claimAutoreleasedReturnValue(v174);
      uint64_t v28 = v26;
      goto LABEL_17;
    }
  }

- (id)arrayOfTraitsAsStrings
{
  return -[VOTElement arrayOfTraitsAsStringsWithTraitOrder:](self, "arrayOfTraitsAsStringsWithTraitOrder:", 0LL);
}

- (id)arrayOfTraitsAsStringsWithTraitOrder:(id)a3
{
  id v4 = (void *)VOTSharedWorkspace;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedLanguage]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement arrayOfTraitsAsStringsWithTraitOrder:language:]( self,  "arrayOfTraitsAsStringsWithTraitOrder:language:",  v5,  v6));

  return v7;
}

- (void)_applyAttributesFromText:(id)a3 toRequest:(id)a4 withLanguage:(id)a5
{
  id v5 = [a4 addAttributedString:a3 withLanguage:a5 category:@"TextAttributes"];
}

- (id)_removeBadDeveloperDecisions:(id)a3
{
  id v4 = a3;
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXBackButtonTrait))
  {
    id v5 = sub_10004A988(off_1001AC148, @"back.button.element.text", @"back button");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

    if ([v4 length])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
      unsigned int v9 = [v7 containsString:v8];

      if (v9)
      {

        id v4 = 0LL;
      }
    }
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXImageTrait)
    && [v4 hasSuffix:@"image"])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "substringToIndex:",  (_BYTE *)objc_msgSend(v4, "length") - (_BYTE *)objc_msgSend(@"image", "length")));

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v10 stringByTrimmingCharactersInSet:v11]);
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXButtonTrait)
    && [v4 hasSuffix:@"button"])
  {
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "substringToIndex:",  (_BYTE *)objc_msgSend(v4, "length") - (_BYTE *)objc_msgSend(@"button", "length")));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v12 stringByTrimmingCharactersInSet:v13]);
  }

  return v4;
}

- (BOOL)isWesternTextForNonWesternLanguage:(id)a3 language:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = sub_100034B24(v6);
  int v8 = sub_100034B78();

  if (v7)
  {
    id v9 = sub_100034BF4();
    id v6 = (id)objc_claimAutoreleasedReturnValue(v9);
    id v10 = [v5 rangeOfCharacterFromSet:v6];
    BOOL v11 = v10 != (id)0x7FFFFFFFFFFFFFFFLL;
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL || ((v8 ^ 1) & 1) != 0) {
      goto LABEL_7;
    }
  }

  else if (!v8)
  {
    BOOL v11 = 0;
    goto LABEL_9;
  }

  id v12 = sub_100034B80();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v11 = [v5 rangeOfCharacterFromSet:v13] != (id)0x7FFFFFFFFFFFFFFFLL;

  if (v7) {
LABEL_7:
  }

LABEL_9:
  return v11;
}

- (void)_applyLabelToRequest:(id)a3 includeBlockQuote:(BOOL)a4 language:(id)a5 isWebLanguageChoice:(BOOL)a6 interactOption:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
  if (!v13 || !v8) {
    goto LABEL_12;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dialectForLanguageID:v13]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 speakableCharacters]);
  if (v17 && ![v16 canSpeakString:v14])
  {

    goto LABEL_8;
  }

  unsigned __int8 v18 = -[VOTElement isWesternTextForNonWesternLanguage:language:]( self,  "isWesternTextForNonWesternLanguage:language:",  v14,  v13);

  if ((v18 & 1) != 0)
  {
LABEL_8:
    uint64_t v20 = VOTLogCommon(v19);
    CGFloat v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v13;
      __int16 v50 = 2112;
      double v51 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Web told us to use: %@, but that dialect can't speak: %@",  buf,  0x16u);
    }

    id v13 = 0LL;
  }

LABEL_12:
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v23 = [v22 voiceOverPhoneticsFeedback];

  if ([v14 length] != (id)1
    || (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXKeyboardKeyTrait) ? (BOOL v24 = v23 == 0LL) : (BOOL v24 = 1), v24))
  {
    id v25 = 0LL;
    uint64_t v26 = 0LL;
  }

  else
  {
    if (![v14 isAXAttributedString]
      || (id v25 = (id)objc_claimAutoreleasedReturnValue([v14 attributeValueForKey:UIAccessibilityTokenLanguage])) == 0)
    {
      id v25 = v13;
    }

    id v27 = sub_10004B920(v14, v25, 0LL);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
  }

  id v28 = [v26 length];
  if (v28) {
    BOOL v29 = v23 == 0LL;
  }
  else {
    BOOL v29 = 1;
  }
  char v30 = !v29;
  if (v28 && v23 == (id)2)
  {
    if ((v30 & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }

  if ([v14 isAXAttributedString] && objc_msgSend(v14, "hasAttributes"))
  {
    -[VOTElement _applyAttributesFromText:toRequest:withLanguage:]( self,  "_applyAttributesFromText:toRequest:withLanguage:",  v14,  v12,  v13);
    if (!v10) {
      goto LABEL_48;
    }
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v14 attributeValueForKey:UIAccessibilityTokenBlockquoteLevel]);
    if (v32) {
      CGRect v33 = (_UNKNOWN **)v32;
    }
    else {
      CGRect v33 = &off_100187A90;
    }
    id v34 = sub_10004A988(off_1001AC148, @"blockquote.level", 0LL);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    CGRect v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v35, v33));
    id v37 = [v12 addString:v36];

    goto LABEL_47;
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByTrimmingCharactersInSet:v38]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _removeBadDeveloperDecisions:](self, "_removeBadDeveloperDecisions:", v39));
  if (![v14 length]) {
    goto LABEL_48;
  }
  if (a7 == 2)
  {
    CGRect v40 = off_1001AC148;
    CGRect v41 = @"InteractOut";
    goto LABEL_45;
  }

  if (a7 == 1)
  {
    CGRect v40 = off_1001AC148;
    CGRect v41 = @"InteractIn";
LABEL_45:
    id v42 = sub_10004A988(v40, v41, 0LL);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v43, v14));

    uint64_t v14 = (void *)v44;
  }

  id v45 = [v12 addString:v14 breakWords:1 withLanguage:v13 atIndex:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v12 lastAction]);
  [v46 setPerformPunctuationTranslation:1];

  CGRect v33 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v12 lastAction]);
  [v33 setReplaceCommas:0];
LABEL_47:

LABEL_48:
  if ((v30 & 1) != 0)
  {
    LODWORD(v31) = 0.75;
    [v12 addPause:v31];
LABEL_50:
    id v47 = [v12 addString:v26];
  }

- (void)_addHeaderElement:(id)a3 toRequest:(id)a4
{
  id v22 = a4;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 label]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByTrimmingCharactersInSet:v8]);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByTrimmingCharactersInSet:v11]);

  uint64_t v13 = __AXStringForVariables(v9);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (objc_msgSend(v14, "length", v12, @"__AXStringForVariablesSentinel"))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement language](self, "language"));
    id v16 = [v22 addString:v14 withLanguage:v15];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v22 lastAction]);
    [v17 setPerformPunctuationTranslation:1];

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v22 lastAction]);
    [v18 setReplaceCommas:0];
  }

  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v22 lastAction]);
    LODWORD(v20) = 1062836634;
    CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20));
    [v19 setObject:v21 forVariant:32];
  }
}

- (void)applyRowHeadersToRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement headerElementsForRow:]( self,  "headerElementsForRow:",  -[VOTElement rowRange](self, "rowRange")));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[VOTElement _addHeaderElement:toRequest:]( self,  "_addHeaderElement:toRequest:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  v4);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)applyHeaderElementsToRequest:(id)a3
{
  id v4 = a3;
  if (-[VOTElement supportsHeaderElementOutput](self, "supportsHeaderElementOutput"))
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elementHeadersForOutput", 0));
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        }

        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }
  }
}

- (void)_applyValueToRequest:(id)a3 options:(unint64_t)a4 lastSeenLineAndColumn:(id)a5 language:(id)a6
{
  int v9 = ~(_DWORD)a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXIsEditingTrait);
  unsigned int v14 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextAreaTrait);
  BOOL v15 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXTextEntryTrait);
  if ((*(void *)&v9 & 0x80040LL) == 0)
  {
    unsigned int v16 = v11 ? v14 : 0;
    if ((v13 | v16) == 1)
    {
      if (v13)
      {
        id v17 = -[VOTElement selectedTextRange](self, "selectedTextRange");
      }

      else
      {
        if (!v16)
        {
          uint64_t v28 = 0LL;
          uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_33;
        }

        id v17 = -[VOTElement rangeForLineNumberAndColumn:](self, "rangeForLineNumberAndColumn:", v11);
      }

      uint64_t v27 = (uint64_t)v17;
      uint64_t v28 = v18;
LABEL_33:
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
      else {
        uint64_t v45 = v27;
      }
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v44 substringFromIndex:v45]);

      id v47 = [v10 addString:v46 withLanguage:v12];
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v10 lastAction]);
      [v48 setPerformPunctuationTranslation:1];

      id v49 = (void *)objc_claimAutoreleasedReturnValue([v10 lastAction]);
      [v49 setReplaceCommas:1];

      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v10 lastAction]);
      [v50 setObject:kCFBooleanTrue forVariant:50];

      goto LABEL_68;
    }
  }

  uint64_t v19 = kAXWebContentTrait;
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXWebContentTrait | kAXHeaderTrait))
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
    if (v20)
    {

      goto LABEL_68;
    }

    CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString, v22);
    char isKindOfClass = objc_opt_isKindOfClass(v21, v23);

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_68;
    }
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXToggleTrait)) {
    goto LABEL_68;
  }
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](self, "value"));
  if (-[VOTElement isReadingContent](self, "isReadingContent"))
  {
    -[VOTElement updatePageContent](self, "updatePageContent");
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[VOTElement pageContent](self, "pageContent"));
LABEL_22:
    uint64_t v32 = (void *)v26;

    id v25 = v32;
    goto LABEL_23;
  }

  id v29 = [v25 length];
  if ((unint64_t)v29 >= 0xC351)
  {
    uint64_t v30 = VOTLogElement(v29);
    double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3E98(v31);
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", 0, 50000));
    goto LABEL_22;
  }

- (BOOL)applySelectedText:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | kAXIsEditingTrait)
    && (id v8 = -[VOTElement selectedTextRange](self, "selectedTextRange"), v9))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement valueForRange:](self, "valueForRange:", v8, v9));
    id v11 = [v10 length];
    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      id v13 = sub_10004AE68(off_1001AC148, @"element.selected.text", 0LL, v7);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v10,  v14));
      id v16 = [v6 addString:v15];
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_applyHasPopupAttribute:(id)a3 withLanguage:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement popupValue](self, "popupValue"));
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"menu"])
    {
      uint64_t v9 = @"element.has.popup.menu";
LABEL_12:
      id v10 = sub_10004AE68(off_1001AC148, v9, 0LL, v6);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = [v14 addString:v11 withLanguage:v6];

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 lastAction]);
      [v13 setIsVoiceOverGeneratedContent:1];

      goto LABEL_13;
    }

    if ([v8 isEqualToString:@"listbox"])
    {
      uint64_t v9 = @"element.has.popup.listbox";
      goto LABEL_12;
    }

    if ([v8 isEqualToString:@"tree"])
    {
      uint64_t v9 = @"element.has.popup.tree";
      goto LABEL_12;
    }

    if ([v8 isEqualToString:@"grid"])
    {
      uint64_t v9 = @"element.has.popup.grid";
      goto LABEL_12;
    }

    if ([v8 isEqualToString:@"dialog"])
    {
      uint64_t v9 = @"element.has.popup.dialog";
      goto LABEL_12;
    }
  }

- (void)_applyTraitsToRequest:(id)a3 options:(unint64_t)a4 numHeaderActions:(unint64_t)a5 language:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [objc_allocWithZone(NSMutableArray) init];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement arrayOfTraitsAsStringsWithTraitOrder:language:]( self,  "arrayOfTraitsAsStringsWithTraitOrder:language:",  v12,  v11));
  id v14 = [v13 count];
  if (v14 != [v12 count])
  {
    double v31 = v13;
    id v32 = v12;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElementDescription.m",  879LL,  "-[VOTElement(DescriptionCategory) _applyTraitsToRequest:options:numHeaderActions:language:]",  @"Trait array of strings not the same as the order of traits.. fix me: trait array: %@\ntrait order:%@");
  }

  unsigned __int8 v15 = objc_msgSend((id)VOTSharedWorkspace, "typingPitchChangeEnabled", v31, v32);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000A23D4;
  v34[3] = &unk_100179438;
  id v16 = v12;
  id v35 = v16;
  BOOL v41 = (a4 & 4) != 0;
  BOOL v42 = (a4 & 0x80000000) != 0LL;
  id v33 = v10;
  id v36 = v33;
  unint64_t v39 = a5;
  id v17 = v11;
  unint64_t v40 = a4;
  unsigned __int8 v43 = v15;
  id v37 = v17;
  double v38 = self;
  [v13 enumerateObjectsUsingBlock:v34];
  uint64_t v18 = kAXWebContentTrait;
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait)
    && -[VOTElement isComboBox](self, "isComboBox"))
  {
    id v19 = sub_10004AE68(off_1001AC148, @"element.combobox", 0LL, v17);
    double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = [v33 addString:v20 withLanguage:v17];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v33 lastAction]);
    [v22 setIsVoiceOverGeneratedContent:1];
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", v18)
    && -[VOTElement isInDescriptionDefinition](self, "isInDescriptionDefinition"))
  {
    id v23 = sub_10004AE68(off_1001AC148, @"element.definition", 0LL, v17);
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = [v33 addString:v24 withLanguage:v17];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v33 lastAction]);
    [v26 setIsVoiceOverGeneratedContent:1];
  }

  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", v18)
    && -[VOTElement isInDescriptionTerm](self, "isInDescriptionTerm"))
  {
    id v27 = sub_10004AE68(off_1001AC148, @"element.definition.term", 0LL, v17);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = [v33 addString:v28 withLanguage:v17];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v33 lastAction]);
    [v30 setIsVoiceOverGeneratedContent:1];
  }
}

- (void)_addErrorMessageElement:(id)a3 toRequest:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 label]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByTrimmingCharactersInSet:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByTrimmingCharactersInSet:v11]);

  uint64_t v13 = __AXStringForVariables(v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (objc_msgSend(v14, "length", v12, @"__AXStringForVariablesSentinel"))
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement language](self, "language"));
    id v16 = [v19 addString:v14 withLanguage:v15];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v19 lastAction]);
    [v17 setPerformPunctuationTranslation:1];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v19 lastAction]);
    [v18 setReplaceCommas:0];
  }
}

- (void)_applyInvalidStatus:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement invalidStatus](self, "invalidStatus"));
  if ([v8 length] && (objc_msgSend(v8, "isEqualToString:", @"false") & 1) == 0)
  {
    if ([v8 isEqualToString:@"grammar"])
    {
      uint64_t v9 = off_1001AC148;
      id v10 = @"invalidStatusGrammar";
    }

    else
    {
      unsigned int v11 = [v8 isEqualToString:@"spelling"];
      uint64_t v9 = off_1001AC148;
      if (v11) {
        id v10 = @"invalidStatusSpelling";
      }
      else {
        id v10 = @"invalidStatusGeneral";
      }
    }

    id v12 = sub_10004AE68(v9, v10, 0LL, v7);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ([v13 length])
    {
      LODWORD(v14) = 1061997773;
      [v6 addPause:v14];
      id v15 = [v6 addString:v13 withLanguage:v7];
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement errorMessageElements](self, "errorMessageElements"));
      if ([v16 count])
      {
        LODWORD(v17) = 1061997773;
        [v6 addPause:v17];
      }

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v18 = v16;
      id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          uint64_t v22 = 0LL;
          do
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v18);
            }
            -[VOTElement _addErrorMessageElement:toRequest:]( self,  "_addErrorMessageElement:toRequest:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v22),  v6,  (void)v24);
            uint64_t v22 = (char *)v22 + 1;
          }

          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v20);
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 lastAction]);
      [v23 setIsVoiceOverGeneratedContent:0];
    }
  }
}

- (void)applyInvalidStatusToRequest:(id)a3
{
  char v6 = 0;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _resolvedOutputLanguage:](self, "_resolvedOutputLanguage:", &v6));
  -[VOTElement _applyInvalidStatus:language:](self, "_applyInvalidStatus:language:", v4, v5);
}

- (void)_applyCurrentStatus:(id)a3 language:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement currentStatus](self, "currentStatus"));
  if ([v7 length] && (objc_msgSend(v7, "isEqualToString:", @"false") & 1) == 0)
  {
    if ([v7 isEqualToString:@"page"])
    {
      id v8 = off_1001AC148;
      uint64_t v9 = @"currentStatusPage";
    }

    else if ([v7 isEqualToString:@"step"])
    {
      id v8 = off_1001AC148;
      uint64_t v9 = @"currentStatusStep";
    }

    else if ([v7 isEqualToString:@"location"])
    {
      id v8 = off_1001AC148;
      uint64_t v9 = @"currentStatusLocation";
    }

    else if ([v7 isEqualToString:@"date"])
    {
      id v8 = off_1001AC148;
      uint64_t v9 = @"currentStatusDate";
    }

    else
    {
      unsigned int v10 = [v7 isEqualToString:@"time"];
      id v8 = off_1001AC148;
      if (v10) {
        uint64_t v9 = @"currentStatusTime";
      }
      else {
        uint64_t v9 = @"currentStatusGeneral";
      }
    }

    id v11 = sub_10004AE68(v8, v9, 0LL, v6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ([v12 length])
    {
      id v13 = [v15 addString:v12 withLanguage:v6];
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v15 lastAction]);
      [v14 setIsVoiceOverGeneratedContent:1];
    }
  }
}

- (void)_applyDatetimeAttribute:(id)a3 language:(id)a4
{
  id v10 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement formattedDatetime](self, "formattedDatetime"));
  if (v5)
  {
    id v6 = [v10 addString:v5];
    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 lastAction]);
      LODWORD(v8) = 1062836634;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      [v7 setObject:v9 forVariant:32];
    }
  }
}

- (void)_applySortDirection:(id)a3 language:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement sortDirection](self, "sortDirection"));
  if (![v7 length]) {
    goto LABEL_11;
  }
  if ([v7 isEqualToString:@"AXAscendingSortDirection"])
  {
    double v8 = @"sortUp";
  }

  else
  {
    if (![v7 isEqualToString:@"AXDescendingSortDirection"])
    {
      id v10 = 0LL;
      goto LABEL_8;
    }

    double v8 = @"sortDown";
  }

  id v9 = sub_10004AE68(off_1001AC148, v8, 0LL, v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_8:
  if ([v10 length])
  {
    id v11 = [v13 addString:v10 withLanguage:v6];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 lastAction]);
    [v12 setIsVoiceOverGeneratedContent:1];
  }

LABEL_11:
}

- (_NSRange)_brailleLineRangeForDescription:(id)a3 position:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  else {
    unint64_t v7 = (unint64_t)v6;
  }
  double v8 = (char *)objc_msgSend(v5, "lineRangeForRange:", v7, 0);
  NSUInteger v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
    unsigned int v12 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", &v8[v10 - 1]));

    v10 -= v12;
  }

  NSUInteger v13 = (NSUInteger)v8;
  NSUInteger v14 = v10;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (id)_copyMathTextualInformationWithBrailleLineRange:(_NSRange *)a3 brailleDescriptionRange:(_NSRange *)a4 position:(unint64_t)a5 rotorSelection:(id)a6 shouldPreferRotorSelection:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  NSUInteger v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement mathBrailleDescription](self, "mathBrailleDescription"));
  NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
  if ([v14 length])
  {
    id v15 = [v14 length];
    a4->NSUInteger location = 0LL;
    a4->NSUInteger length = (NSUInteger)v15;
    a3->NSUInteger location = (NSUInteger)-[VOTElement _brailleLineRangeForDescription:position:]( self,  "_brailleLineRangeForDescription:position:",  v14,  a5);
    a3->NSUInteger length = v16;
    if (v12)
    {
      id v17 = v12;
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSIndexPath, v18);
      if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0) {
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElementDescription.m",  1159LL,  "-[VOTElement(DescriptionCategory) _copyMathTextualInformationWithBrailleLineRange:brailleDescriptionRange:posi tion:rotorSelection:shouldPreferRotorSelection:]",  @"Got unexpected type for rotor selection in math expression: was %@");
      }
      uint64_t v43 = 0LL;
      uint64_t v44 = &v43;
      uint64_t v45 = 0x2020000000LL;
      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v39 = 0LL;
      unint64_t v40 = &v39;
      uint64_t v41 = 0x2020000000LL;
      char v42 = 0;
      id v20 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
      uint64_t v49 = kSCROTechnicalContextAttribute;
      __int16 v50 = &__kCFBooleanTrue;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
      uint64_t v22 = -[NSMutableAttributedString initWithString:attributes:](v20, "initWithString:attributes:", v14, v21);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000A32D0;
      v33[3] = &unk_100179460;
      id v23 = v17;
      id v34 = v23;
      __int128 v24 = v22;
      id v35 = v24;
      id v36 = &v43;
      id v37 = &v39;
      double v38 = a3;
      [v13 enumerateAttributesUsingBlock:v33];
      if (v7 && !*((_BYTE *)v40 + 24) && v44[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        a3->NSUInteger location = (NSUInteger)-[VOTElement _brailleLineRangeForDescription:position:]( self,  "_brailleLineRangeForDescription:position:",  v14);
        a3->NSUInteger length = v25;
      }

      __int128 v26 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableAttributedString attributedSubstringFromRange:]( v24,  "attributedSubstringFromRange:",  a3->location,  a3->length));
      uint64_t v28 = -[NSMutableAttributedString initWithAttributedString:](v26, "initWithAttributedString:", v27);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);
    }

    else
    {
      id v29 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", a3->location, a3->length));
      uint64_t v47 = kSCROTechnicalContextAttribute;
      uint64_t v48 = &__kCFBooleanTrue;
      double v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
      uint64_t v28 = -[NSMutableAttributedString initWithString:attributes:](v29, "initWithString:attributes:", v30, v31);
    }
  }

  else
  {
    uint64_t v28 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  @" ");
  }

  return v28;
}

- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11
{
  LOWORD(v12) = 257;
  LOWORD(v11) = __PAIR16__(a10, a9);
  -[VOTElement addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange:lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:]( self,  "addTextualInformationToBrailleLine:forPosition:rotorSelection:shouldPreferRotorSelection:lineRange:descriptionRange: lineRangeKnown:isNewTouchContainer:previousElement:updateValue:singleLine:",  a3,  a4,  a5,  a6,  a7,  a8,  v11,  a11,  v12);
}

- (void)addTextualInformationToBrailleLine:(id)a3 forPosition:(unint64_t)a4 rotorSelection:(id)a5 shouldPreferRotorSelection:(BOOL)a6 lineRange:(_NSRange *)a7 descriptionRange:(_NSRange *)a8 lineRangeKnown:(BOOL)a9 isNewTouchContainer:(BOOL)a10 previousElement:(id)a11 updateValue:(BOOL)a12 singleLine:(BOOL)a13
{
  BOOL v13 = a6;
  id v168 = a3;
  id v17 = a5;
  id v166 = a11;
  _NSRange v195 = (_NSRange)xmmword_100132600;
  __int128 v196 = xmmword_100132600;
  v164 = v17;
  if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXMathEquationTrait))
  {
    uint64_t v18 = -[VOTElement _copyMathTextualInformationWithBrailleLineRange:brailleDescriptionRange:position:rotorSelection:shouldPreferRotorSelection:]( self,  "_copyMathTextualInformationWithBrailleLineRange:brailleDescriptionRange:position:rotorSelection:shouldPreferRotorSelection:",  &v196,  &v195,  a4,  v17,  v13);
    __int128 v19 = v196;
    if (*((void *)&v19 + 1) + (void)v19 <= (unint64_t)-[NSMutableAttributedString length](v18, "length")) {
      -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kSCROEditableTextAttribute,  &__kCFBooleanFalse,  v196);
    }
    goto LABEL_165;
  }

  NSUInteger v163 = a4;
  id v169 = self;
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | kAXIsEditingTrait)
    && !-[VOTElement shouldIgnoreTextEditingTrait](self, "shouldIgnoreTextEditingTrait"))
  {
    id v36 = -[VOTElement selectedTextRange](self, "selectedTextRange");
    id obj = v37;
    NSUInteger range1 = (NSUInteger)v36;
    double v38 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTElement valueWithUpdate:](self, "valueWithUpdate:", a12));
    if (-[__CFString isAXAttributedString](v38, "isAXAttributedString"))
    {
      uint64_t v39 = v38;
      else {
        unint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString string](v39, "string"));
      }
      unint64_t v42 = a4;
    }

    else
    {
      if (v38) {
        unint64_t v40 = v38;
      }
      else {
        unint64_t v40 = &stru_10017A920;
      }
      unint64_t v42 = a4;
    }

    id v48 = -[__CFString length](v40, "length");
    v195.NSUInteger location = 0LL;
    v195.NSUInteger length = (NSUInteger)v48;
    if (a13)
    {
      else {
        id v49 = v48;
      }
      id v50 = -[__CFString lineRangeForRange:](v40, "lineRangeForRange:", v49, 0LL);
      NSUInteger length = v51;
      *(void *)&__int128 v196 = v50;
      *((void *)&v196 + 1) = v51;
      if (v51)
      {
LABEL_49:
        unsigned __int8 v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
        NSUInteger v54 = v196;
        unsigned int v55 = objc_msgSend( v53,  "characterIsMember:",  -[__CFString characterAtIndex:](v40, "characterAtIndex:", (void)v196 + length - 1));

        if (v55) {
          *((void *)&v196 + 1) = --length;
        }
LABEL_53:
        range1_8a = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v40, "substringWithRange:", v54, length));
        BOOL v56 = 0;
        id v57 = [objc_allocWithZone(NSMutableAttributedString) initWithString:range1_8a];
        id v58 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement valueWithUpdate:](v169, "valueWithUpdate:", a12));
        -[VOTElement _applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:]( v169,  "_applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:",  v58,  v57,  v54,  length,  0LL);

        id v59 = [[AXAttributedString alloc] initWithStringOrAttributedString:v57];
        v194 = 0LL;
        id v60 = sub_10004CF70(v59, &v194);
        id v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
        id v62 = v194;

        id v63 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v61 attributedString]);
        uint64_t v18 = -[NSMutableAttributedString initWithAttributedString:](v63, "initWithAttributedString:", v64);

        if (v56) {
          -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kSCROEditableTextAttribute,  &__kCFBooleanTrue,  0LL,  -[NSMutableAttributedString length](v18, "length"));
        }
        id v65 = [objc_allocWithZone(NSMutableAttributedString) initWithString:@" "];
        objc_msgSend(v65, "addAttribute:value:range:", kSCROEditableTextPaddingAttribute, &__kCFBooleanTrue, 0, 1);
        -[NSMutableAttributedString appendAttributedString:](v18, "appendAttributedString:", v65);
        if (!v56) {
          goto LABEL_86;
        }
        v66.NSUInteger length = (NSUInteger)obj;
        if (obj)
        {
          v66.NSUInteger location = range1;
          v205.NSUInteger location = v54;
          v205.NSUInteger length = length;
          NSRange v67 = NSIntersectionRange(v66, v205);
          if (!v67.length) {
            goto LABEL_86;
          }
          unint64_t v68 = sub_10004D388(v67.location - v54, v67.length, v62);
          uint64_t v70 = v69;
          uint64_t v71 = &kSCROSelectionAttribute;
        }

        else
        {
          unint64_t v68 = sub_10004D388(range1 - v54, 0LL, v62);
          if (v68 + 1 > (unint64_t)-[NSMutableAttributedString length](v18, "length"))
          {
LABEL_86:

            goto LABEL_165;
          }

          uint64_t v71 = &kSCROCursorAttribute;
          uint64_t v70 = 1LL;
        }

        -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  *v71,  kCFBooleanTrue,  v68,  v70);
        goto LABEL_86;
      }
    }

    else
    {
      __int128 v196 = (__int128)v195;
      NSUInteger length = v195.length;
      if (v195.length) {
        goto LABEL_49;
      }
    }

    NSUInteger v54 = v196;
    goto LABEL_53;
  }

  id v161 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  id range1_8 = [objc_allocWithZone(NSMutableString) init];
  if (-[VOTElement isReadingContent](self, "isReadingContent"))
  {
    -[VOTElement updatePageContent](self, "updatePageContent");
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement pageContent](self, "pageContent"));
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement _languageRangesForText:](self, "_languageRangesForText:", v20));
    id v22 = [v20 length];
    if (v22)
    {
      NSUInteger v23 = (NSUInteger)v22;
      __int128 v24 = self;
      v201.NSUInteger location = (NSUInteger)-[VOTElement textMarkerSelectionRange](self, "textMarkerSelectionRange");
      v203.NSUInteger location = 0LL;
      v203.NSUInteger length = v23;
      NSRange v25 = NSIntersectionRange(v201, v203);
      NSUInteger location = v25.location;
      NSUInteger v158 = v25.length;
      if ([v20 isAXAttributedString])
      {
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v20 string]);
        [range1_8 appendString:v27];

        __int128 v24 = self;
        NSUInteger location = v25.location;
      }

      else
      {
        [range1_8 appendString:v20];
      }

      if (!v25.length || location == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger location = (NSUInteger)-[VOTElement selectedTextRange](v24, "selectedTextRange");
        NSUInteger v158 = v43;
      }
    }

    else
    {
      NSUInteger v158 = 0LL;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      __int128 v24 = self;
    }

    uint64_t v162 = location;

    uint64_t v159 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    id v28 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
    if ([v28 isAXAttributedString])
    {
      id v29 = v28;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 attributeValueForKey:UIAccessibilityTokenBrailleOverride]);
      id v28 = v29;
      if ([v30 length])
      {
        id v28 = v30;
      }
    }

    v160 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _removeBadDeveloperDecisions:](self, "_removeBadDeveloperDecisions:", v28));

    id v155 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _languageRangesForText:](self, "_languageRangesForText:", v160));
    id v31 = [v160 length];
    if (v31)
    {
      NSUInteger v32 = (NSUInteger)v31;
      id v33 = self;
      NSUInteger v34 = 0x7FFFFFFFFFFFFFFFLL;
      if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait))
      {
        v202.NSUInteger location = (NSUInteger)-[VOTElement textMarkerSelectionRange](self, "textMarkerSelectionRange");
        v204.NSUInteger location = 0LL;
        v204.NSUInteger length = v32;
        NSRange v35 = NSIntersectionRange(v202, v204);
        NSUInteger v158 = v35.length;
        if (v35.length) {
          NSUInteger v34 = v35.location;
        }
      }

      else
      {
        NSUInteger v158 = 0LL;
      }

      uint64_t v41 = range1_8;
      uint64_t v162 = v34;
      if ([v160 isAXAttributedString])
      {
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v160 string]);
        uint64_t v41 = range1_8;
        [range1_8 appendFormat:@"%@ ", v44];

        id v33 = self;
      }

      else
      {
        [range1_8 appendFormat:@"%@ ", v160];
      }
    }

    else
    {
      NSUInteger v158 = 0LL;
      uint64_t v162 = 0x7FFFFFFFFFFFFFFFLL;
      id v33 = self;
      uint64_t v41 = range1_8;
    }

    range1a = (char *)[v41 length];
    id v157 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](v33, "touchContainer"));
    unsigned __int8 v45 = [(id)VOTSharedWorkspace containerOutputFeedback];
    if ((((v45 & 0x10) == 0) & ~[v157 touchContainerShouldOutputBraille]) == 0 && a10)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v157 label]);
      if ([v46 length])
      {
        if ([v46 isAXAttributedString])
        {
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 string]);
          [range1_8 appendFormat:@"%@ ", v47];
        }

        else
        {
          [range1_8 appendFormat:@"%@ ", v46];
        }
      }
    }

    uint64_t v72 = self;
    if ([(id)VOTSharedWorkspace navigationStyleHonorsGroups]
      && -[VOTElement includeRoleOnlyForGroupNavigation](self, "includeRoleOnlyForGroupNavigation")
      && -[VOTElement isAccessibleGroup](self, "isAccessibleGroup"))
    {
      id v73 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _roleDescriptionWithInteractOption:language:]( self,  "_roleDescriptionWithInteractOption:language:",  0LL,  0LL));
      if ([v73 length]) {
        [range1_8 appendFormat:@"%@ ", v73];
      }

      uint64_t v72 = self;
    }

    if (-[VOTElement doesHaveTraits:](v72, "doesHaveTraits:", kAXImageTrait))
    {
      uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement photoDescription](v72, "photoDescription"));
      if ([v74 length]) {
        [range1_8 appendFormat:@"%@ ", v74];
      }

      uint64_t v72 = self;
    }

    if (-[VOTElement doesHaveTraits:](v72, "doesHaveTraits:", kAXToggleTrait))
    {
      id v75 = 0LL;
    }

    else
    {
      id v75 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement valueWithUpdate:](v72, "valueWithUpdate:", a12));

      uint64_t v72 = self;
    }

    v156 = v75;
    id v76 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _languageRangesForText:](v72, "_languageRangesForText:", v75));
    if ([v156 length])
    {
      unsigned int v77 = [v156 isAXAttributedString];
      id v78 = v156;
      id v79 = v78;
      if (v77)
      {
        CFBooleanRef v80 = (void *)objc_claimAutoreleasedReturnValue([v78 attributeValueForKey:UIAccessibilityTokenBrailleOverride]);
        v81 = v80;
        if (v80)
        {
          id v82 = v80;
        }

        else
        {
          id v82 = (id)objc_claimAutoreleasedReturnValue([v79 string]);
        }

        id v79 = v82;
      }

      id v83 = self;
      uint64_t v159 = (uint64_t)[range1_8 length];
      [range1_8 appendFormat:@"%@ ", v79];
      [range1_8 length];
    }

    else
    {
      uint64_t v159 = 0x7FFFFFFFFFFFFFFFLL;
      id v83 = self;
    }

    id v84 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement generateCVMLContentForBraille](v83, "generateCVMLContentForBraille"));
    [range1_8 appendString:v84];

    float v85 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement customContent](self, "customContent"));
    id v86 = [(id)VOTSharedWorkspace customContentImportance];
    __int128 v190 = 0u;
    __int128 v191 = 0u;
    __int128 v192 = 0u;
    __int128 v193 = 0u;
    id obja = v85;
    id v87 = [obja countByEnumeratingWithState:&v190 objects:v200 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v191;
      do
      {
        for (i = 0LL; i != v87; i = (char *)i + 1)
        {
          if (*(void *)v191 != v88) {
            objc_enumerationMutation(obja);
          }
          __int128 v90 = *(void **)(*((void *)&v190 + 1) + 8LL * (void)i);
          if ([v90 importance] == v86)
          {
            __int128 v91 = (void *)objc_claimAutoreleasedReturnValue([v90 label]);
            uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v90 value]);
            [range1_8 appendFormat:@"%@, %@ ", v91, v92];
          }
        }

        id v87 = [obja countByEnumeratingWithState:&v190 objects:v200 count:16];
      }

      while (v87);
    }

    id v93 = [v155 mutableCopy];
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    __int128 v186 = 0u;
    __int128 v187 = 0u;
    id v170 = v76;
    id v94 = [v170 countByEnumeratingWithState:&v186 objects:v199 count:16];
    if (v94)
    {
      uint64_t v95 = *(void *)v187;
      do
      {
        for (j = 0LL; j != v94; j = (char *)j + 1)
        {
          if (*(void *)v187 != v95) {
            objc_enumerationMutation(v170);
          }
          uint64_t v97 = *(void **)(*((void *)&v186 + 1) + 8LL * (void)j);
          uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue([v97 objectAtIndexedSubscript:1]);
          id v99 = [v98 rangeValue];
          uint64_t v101 = v100;

          uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue([v97 objectAtIndexedSubscript:0]);
          v198[0] = v102;
          v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithRange:]( &OBJC_CLASS___NSValue,  "valueWithRange:",  &range1a[(void)v99],  v101));
          v198[1] = v103;
          v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v198,  2LL));
          [v93 addObject:v104];
        }

        id v94 = [v170 countByEnumeratingWithState:&v186 objects:v199 count:16];
      }

      while (v94);
    }

    id v21 = v93;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement arrayOfTraitsAsStrings](v169, "arrayOfTraitsAsStrings"));
    id v106 = [v105 countByEnumeratingWithState:&v182 objects:v197 count:16];
    if (v106)
    {
      uint64_t v107 = *(void *)v183;
      do
      {
        for (k = 0LL; k != v106; k = (char *)k + 1)
        {
          if (*(void *)v183 != v107) {
            objc_enumerationMutation(v105);
          }
          id v109 = [*(id *)(*((void *)&v182 + 1) + 8 * (void)k) mutableCopyWithZone:0];
          uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
          [v110 applyBrailleSubstitutions:v109];

          [range1_8 appendFormat:@"%@ ", v109];
        }

        id v106 = [v105 countByEnumeratingWithState:&v182 objects:v197 count:16];
      }

      while (v106);
    }

    v112 = (char *)-[VOTElement rowRange](v169, "rowRange");
    if (v112 != (char *)0x7FFFFFFF)
    {
      uint64_t v113 = v111;
      if (v111)
      {
        if (-[VOTElement containedIn:](v169, "containedIn:", 2LL)
          || -[VOTElement hasExplicitRowInfo](v169, "hasExplicitRowInfo"))
        {
          id v114 = sub_10004AE68(off_1001AC148, @"one.of.many.abbreviated", 0LL, v161);
          id v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
          uint64_t v154 = v113;
          uint64_t v116 = AXCFormattedString(v115, @"%d%d");
          v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
        }
      }
    }

    id v118 = -[VOTElement expandedStatus](v169, "expandedStatus");
    if (v118)
    {
      if (v118 == (id)1) {
        id v119 = @"expanded";
      }
      else {
        id v119 = @"collapsed";
      }
      id v120 = sub_10004AE68(off_1001AC148, v119, 0LL, v161);
      v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
      [range1_8 appendFormat:@"%@ ", v121];
    }

    uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    BOOL v123 = ((unint64_t)[v122 voiceOverActionsFeedback] & 0x10) == 0;

    CGPoint v124 = v169;
    if (!v123)
    {
      CGPoint v124 = v169;
      if (!-[VOTElement _ignoreCustomActionIndicator:withElement:]( v169,  "_ignoreCustomActionIndicator:withElement:",  v166,  v169))
      {
        uint64_t v178 = 0LL;
        v179 = &v178;
        uint64_t v180 = 0x2020000000LL;
        uint64_t v181 = 0LL;
        CGPoint v125 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement customRotorActions](v169, "customRotorActions"));
        v177[0] = _NSConcreteStackBlock;
        v177[1] = 3221225472LL;
        v177[2] = sub_1000A4758;
        v177[3] = &unk_100179488;
        v177[4] = &v178;
        [v125 enumerateObjectsUsingBlock:v177];

        CGPoint v124 = v169;
        if (!-[VOTElement doesHaveTraits:](v169, "doesHaveTraits:", kAXLaunchIconTrait)
          && (v179[3] || !-[VOTElement isAccessibleGroup](v169, "isAccessibleGroup") && v179[3]))
        {
          id v126 = sub_10004A988(off_1001AC150, @"custom.actions.hint.short", 0LL);
          id v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
          [range1_8 appendFormat:@" %@", v127];

          CGPoint v124 = v169;
        }

        _Block_object_dispose(&v178, 8);
      }
    }

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement supplementalBrailleDescription](v124, "supplementalBrailleDescription"));
    BOOL v129 = [v128 length] == 0;

    if (!v129)
    {
      v130 = off_1001AC148;
      v131 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v132 = sub_10004AE68(v130, @"braille.supplemental.description.format", 0LL, v131);
      id v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
      v134 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement supplementalBrailleDescription](v169, "supplementalBrailleDescription"));
      objc_msgSend(range1_8, "appendFormat:", v133, v134);
    }

    __int128 v24 = v169;
  }

  id v135 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement roleDescription](v24, "roleDescription"));
  if ([v135 length] && objc_msgSend(v135, "isAXAttributedString"))
  {
    id v136 = v135;
    id v137 = (void *)objc_claimAutoreleasedReturnValue([v136 attributeValueForKey:UIAccessibilityTokenBrailleOverride]);
    id v135 = v136;
    if ([v137 length])
    {
      id v135 = v137;
    }

    [range1_8 appendFormat:@"%@ ", v135];
  }

  if ((unint64_t)[range1_8 length] >= 2
    && objc_msgSend(range1_8, "characterAtIndex:", (char *)objc_msgSend(range1_8, "length") - 1) == 32)
  {
    objc_msgSend( range1_8,  "replaceCharactersInRange:withString:",  (char *)objc_msgSend(range1_8, "length") - 1,  1,  &stru_10017A920);
  }

  v138.NSUInteger location = (NSUInteger)[range1_8 length];
  v138.NSUInteger length = v138.location;
  v195.NSUInteger location = 0LL;
  v195.NSUInteger length = v138.location;
  if (a7 && a9 && a7->length)
  {
    __int128 v196 = (__int128)*a7;
    v206.NSUInteger length = *((void *)&v196 + 1);
    v206.NSUInteger location = v196 + v159;
    v138.NSUInteger location = 0LL;
    NSRange v141 = NSIntersectionRange(v138, v206);
    NSUInteger v140 = v141.length;
    v139 = (char *)v141.location;
  }

  else
  {
    if (v138.location >= v163) {
      NSUInteger v142 = v163;
    }
    else {
      NSUInteger v142 = v138.location;
    }
    v139 = (char *)objc_msgSend(range1_8, "lineRangeForRange:", v142, 0);
  }

  v143 = v139;
  NSUInteger v144 = v140;
  *(void *)&__int128 v196 = v139;
  *((void *)&v196 + 1) = v140;
  if (v140)
  {
    v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
    unsigned int v146 = objc_msgSend( v145,  "characterIsMember:",  objc_msgSend(range1_8, "characterAtIndex:", &v143[v144 - 1]));

    if (v146) {
      *((void *)&v196 + 1) = --v144;
    }
  }

  v147 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(range1_8, "substringWithRange:", v143, v144));
  id v148 = objc_allocWithZone(&OBJC_CLASS___NSMutableAttributedString);
  if (-[__CFString length](v147, "length")) {
    v149 = v147;
  }
  else {
    v149 = @" ";
  }
  v150 = (NSMutableAttributedString *)[v148 initWithString:v149];
  uint64_t v18 = v150;
  if (v162 == 0x7FFFFFFFFFFFFFFFLL
    || v158 + v162 > (unint64_t)-[NSMutableAttributedString length](v150, "length"))
  {
    if (v163 + 1 >= (unint64_t)&v143[v144])
    {
      uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
      BOOL v152 = [v151 lastRefreshTrigger] == 1;

      if (!v152) {
        -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kSCROLineFocusAttribute,  &off_100187AA8,  0LL,  -[NSMutableAttributedString length](v18, "length"));
      }
    }
  }

  else
  {
    -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kSCROSelectionAttribute,  kCFBooleanTrue);
  }

  -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kSCROEditableTextAttribute,  &__kCFBooleanFalse,  0LL,  -[NSMutableAttributedString length](v18, "length"));
  uint64_t v153 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement valueWithUpdate:](v169, "valueWithUpdate:", a12));
  -[VOTElement _applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:]( v169,  "_applyBrailleTextFormattingAndInlineCompletionOptions:attributedString:brailleLineRange:rangeOffset:",  v153,  v18,  v143,  v144,  v159);

  -[VOTElement _applyLanguageTokens:attributedString:](v169, "_applyLanguageTokens:attributedString:", v21, v18);
LABEL_165:
  [v168 appendAttributedString:v18];
  if (a7) {
    *a7 = (_NSRange)v196;
  }
  if (a8) {
    *a8 = v195;
  }
}

- (void)_applyBrailleTextFormattingAndInlineCompletionOptions:(id)a3 attributedString:(id)a4 brailleLineRange:(_NSRange)a5 rangeOffset:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  if ([v10 isAXAttributedString])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_1000A488C;
    v16[3] = &unk_1001794B0;
    unint64_t v18 = a6;
    NSUInteger v19 = location;
    NSUInteger v20 = length;
    id v12 = v11;
    id v17 = v12;
    [v10 enumerateAttributesUsingBlock:v16];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v14 = [v13 voiceOverInlineTextCompletionAppearanceFeedback];

    if ((v14 & 0x10) == 0)
    {
      __int128 v15 = xmmword_1001326B0;
      [v12 getRange:&v15 ofAttribute:kSCROSuggestionTextAttribute];
      if ((void)v15 != 0x7FFFFFFFFFFFFFFFLL) {
        [v12 deleteCharactersInRange:v15];
      }
    }
  }
}

- (void)_applyLanguageTokens:(id)a3 attributedString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v19 = kSCROLanguageAttribute;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        unsigned __int8 v14 = [v12 isEqual:v13];

        if ((v14 & 1) == 0)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
          NSUInteger v16 = (char *)[v15 rangeValue];
          uint64_t v18 = v17;

          if (&v16[v18] <= [v6 length]) {
            objc_msgSend(v6, "addAttribute:value:range:", v19, v12, v16, v18);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }
}

- (id)_languageRangesForText:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v6 = &__NSArray0__struct;
    goto LABEL_15;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement language](self, "language"));
  if (v5)
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

    if (!v7)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[VOTOutputRequest stringShouldSeparateDueToLanguage:language:keyboardLanguageHint:]( &OBJC_CLASS___VOTOutputRequest,  "stringShouldSeparateDueToLanguage:language:keyboardLanguageHint:",  v4,  0LL,  0LL));
      if (v10) {
        goto LABEL_7;
      }
    }
  }

  v30[1] = @"language";
  v31[0] = v4;
  v30[0] = @"string";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v31[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
  NSUInteger v32 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));

LABEL_7:
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v4));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"string"]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"language"]);
        v28[0] = v18;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithRange:]( NSValue,  "valueWithRange:",  v13,  [v17 length]));
        v28[1] = v19;
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
        [v6 addObject:v20];

        v13 += (uint64_t)[v17 length];
      }

      id v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v12);
  }

  id v4 = v22;
LABEL_15:

  return v6;
}

- (void)_applyLinkRelationshipType:(id)a3 language:(id)a4
{
  id v9 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement linkRelationshipType](self, "linkRelationshipType"));
  uint64_t v6 = SCRCLinkRelationshipStringForType();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if ([v7 length]) {
    id v8 = [v9 addString:v7];
  }
}

- (void)_applyExpandedStatus:(id)a3 language:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  int64_t v7 = -[VOTElement expandedStatus](self, "expandedStatus");
  if (v7)
  {
    if (v7 == 1) {
      id v8 = @"expanded";
    }
    else {
      id v8 = @"collapsed";
    }
    id v9 = sub_10004AE68(off_1001AC148, v8, 0LL, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v12 addString:v10 withLanguage:v6];
  }
}

- (void)_applySelectedTrait:(id)a3 language:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  unint64_t v7 = -[VOTElement traits](self, "traits");
  if ((kAXSelectedTrait & v7) != 0)
  {
    id v8 = sub_10004AE68(off_1001AC148, @"element.selected.text", @"selected", v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXPickerElementTrait))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 outputActions]);
      id v11 = [v10 count];
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = [v15 addString:v9 breakWords:0 withLanguage:v6 atIndex:v11];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v15 outputActions]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v11]);
    [v14 setIsVoiceOverGeneratedContent:1];
  }
}

- (id)_resolvedOutputLanguage:(BOOL *)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  if (-[VOTElement isInStatusBar](self, "isInStatusBar")
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]),
        uint64_t v7 = AXLanguageCanonicalFormToGeneralLanguage(v6),
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7),
        unsigned int v9 = [v5 hasPrefix:v8],
        v8,
        v6,
        !v9))
  {
    id v19 = 0LL;
  }

  else
  {
    if (!v5)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement language](self, "language"));
      uint64_t v11 = AXLanguageConvertToCanonicalForm(v10);
      id v5 = (id)objc_claimAutoreleasedReturnValue(v11);

      if (-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        unsigned int v13 = [v12 voiceOverLanguageDetectionEnabled];

        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace websiteLanguageMappingOverrides]);
          if ([v14 count])
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement webAreaURL](self, "webAreaURL"));
            NSUInteger v16 = (void *)objc_claimAutoreleasedReturnValue([v15 absoluteString]);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v16]);

            if (v17)
            {
              id v18 = v17;

              id v5 = v18;
            }

            else
            {
              *a3 = 1;
            }
          }

          else
          {
            *a3 = 1;
          }
        }

        else
        {
          uint64_t v14 = v5;
          id v5 = 0LL;
        }
      }
    }

    id v5 = v5;
    id v19 = v5;
  }

  return v19;
}

- (void)addTextualInformationToRequest:(id)a3 options:(unint64_t)a4 dataPackage:(id)a5
{
  id v302 = a3;
  id v293 = a5;
  v304 = (void *)objc_claimAutoreleasedReturnValue([v293 lastSeenContextDescriptors]);
  v289 = (void *)objc_claimAutoreleasedReturnValue([v293 lastSeenLineAndColumn]);
  BOOL v288 = (a4 & 0x102) != 0;
  uint64_t v334 = 0LL;
  v335 = &v334;
  unint64_t v6 = a4 & 0x40108;
  int v294 = v6 == 0;
  uint64_t v336 = 0x2020000000LL;
  char v337 = 0;
  BOOL v292 = (a4 & 0x2001180) == 0;
  uint64_t v330 = 0LL;
  v331 = &v330;
  uint64_t v332 = 0x2020000000LL;
  char v333 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v302 outputActions]);
  id v286 = [v7 count];

  id v8 = (id)(a4 & 0x2004188);
  if ((a4 & 0x1000000) != 0)
  {
    unsigned int v9 = self;
    if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXWebContentTrait)) {
      goto LABEL_5;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement roleDescription](self, "roleDescription"));
    id v8 = [v10 length];
  }

  unsigned int v9 = self;
LABEL_5:
  unsigned int v291 = v8 == 0LL;
  if ((a4 & 0x100000) != 0)
  {
    unint64_t v12 = -[VOTElement aspectMask](v9, "aspectMask");
    BOOL v14 = (v12 & 9) != 0 && v6 == 0;
    int v294 = v14;
    uint64_t v15 = (v12 >> 1) & 1;
    if ((a4 & 0x2001180) != 0) {
      LODWORD(v15) = 0;
    }
    unsigned int v291 = (v8 == 0LL) & (v12 >> 2);
    BOOL v292 = v15;
    uint64_t v11 = (v12 >> 3) & 1;
  }

  else
  {
    LODWORD(v11) = 1;
  }

  int v287 = v11;
  unsigned __int8 v329 = 0;
  v297 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _resolvedOutputLanguage:](v9, "_resolvedOutputLanguage:", &v329));
  if ((a4 & 0x20) != 0)
  {
    NSUInteger v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement labeledTouchContainer](self, "labeledTouchContainer"));
    if (-[VOTElement containedIn:](self, "containedIn:", 1LL) && !-[VOTElement containedIn:](self, "containedIn:", 4LL)) {
      unsigned int v17 = !-[VOTElement containedIn:](self, "containedIn:", 2LL);
    }
    else {
      unsigned int v17 = 0;
    }
    if ((([v16 isEqual:self] | v17) & 1) == 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 label]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement label](self, "label"));
      unsigned int v20 = [v18 isEqualToString:v19];

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 label]);
      LODWORD(v19) = [v21 length] == 0;

      if ((_DWORD)v19) {
        uint64_t v22 = [v16 includeRoleOnlyForGroupNavigation] ? 0 : 0x1000000;
      }
      else {
        uint64_t v22 = 0LL;
      }
      uint64_t v23 = [v16 doesHaveTraits:kAXWebContentTrait] ? v22 | 2 : v22;
      unsigned __int8 v24 = [(id)VOTSharedWorkspace containerOutputFeedback];
      v294 &= ~v20;
      if ((v24 & 2) != 0)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v302 outputActions]);
        id v26 = [v25 count];

        [v16 addTextualInformationToRequest:v302 options:v23 dataPackage:0];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v302 outputActions]);
        id v28 = [v27 count];

        if ((uint64_t)v28 > (uint64_t)v26)
        {
          if ((v24 & 8) != 0)
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v302 lastAction]);
            [v29 setObject:&off_1001873B0 forVariant:32];
          }

          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v302 lastAction]);
          [v30 setObject:&__kCFBooleanTrue forVariant:68];
        }
      }
    }
  }

  id v31 = self;
  if ((a4 & 0x8000000000LL) != 0)
  {
    unsigned int v32 = -[VOTElement applicationIsRTL](self, "applicationIsRTL");
    id v33 = off_1001AC148;
    if (v32)
    {
      NSUInteger v34 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v35 = sub_10004A988(v33, @"element.directionality-change.rtl", v34);
    }

    else
    {
      NSUInteger v34 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v35 = sub_10004A988(v33, @"element.directionality-change.ltr", v34);
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    id v37 = [v302 addString:v36];

    id v31 = self;
  }

  uint64_t v296 = kAXWebContentTrait;
  if (-[VOTElement doesHaveTraits:](v31, "doesHaveTraits:"))
  {
    double v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement uiElement](self, "uiElement"));
    if (([v38 BOOLWithAXAttribute:2237] & 1) == 0)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v293 previousElement]);
      unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 uiElement]);
      unsigned int v41 = [v40 BOOLWithAXAttribute:2237];

      if (!v41) {
        goto LABEL_46;
      }
      id v42 = sub_10004AE68(off_1001AC148, @"element.contenteditable.end", 0LL, v297);
      NSUInteger v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      id v44 = [v302 addString:v43];

      double v38 = (void *)objc_claimAutoreleasedReturnValue([v302 lastAction]);
      [v38 setIsVoiceOverGeneratedContent:1];
    }
  }

- (BOOL)_ignoreCustomActionIndicator:(id)a3 withElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v9 voiceOverActionFeedbackFirstInListOnly])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 touchContainer]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 touchContainer]);
    if ([v10 isEqual:v11])
    {
      BOOL v12 = -[VOTElement _elementActionsEquivalent:withElement:](self, "_elementActionsEquivalent:withElement:", v7, v8);
LABEL_16:

      goto LABEL_17;
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 touchContainer]);
    if (v13 || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 touchContainer])) != 0)
    {
      uint64_t v14 = kAXWebContentTrait;
      if ([v7 doesHaveTraits:kAXWebContentTrait]
        && [v8 doesHaveTraits:v14])
      {
        unsigned __int8 v15 = -[VOTElement _elementActionsEquivalent:withElement:]( self,  "_elementActionsEquivalent:withElement:",  v7,  v8);
        BOOL v12 = v15;
        if (!v13) {
          goto LABEL_14;
        }
      }

      else
      {
        unsigned __int8 v15 = 0;
        BOOL v12 = 0;
        if (!v13) {
          goto LABEL_14;
        }
      }

- (BOOL)_elementActionsEquivalent:(id)a3 withElement:(id)a4
{
  id v5 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 customRotorActions]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &stru_1001795F8));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 customRotorActions]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &stru_100179618));
  unsigned __int8 v10 = [v7 isEqualToArray:v9];

  return v10;
}

- (void)_applyCustomContent:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement customContent](self, "customContent"));
  id v9 = [(id)VOTSharedWorkspace customContentImportance];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend(v15, "importance", (void)v20) == v9)
        {
          NSUInteger v16 = (void *)objc_claimAutoreleasedReturnValue([v15 label]);
          id v17 = [v6 addString:v16 withLanguage:v7];

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
          id v19 = [v6 addString:v18 withLanguage:v7];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }
}

- (void)_applyStickyCustomActions:(id)a3 customAction:(id)a4 language:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 name]);
  if (-[VOTElement retainsCustomRotorActionSetting](self, "retainsCustomRotorActionSetting"))
  {
    if ([v9 length])
    {
      id v10 = sub_10004A988(off_1001AC148, @"current.custom.action", v8);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v9));
      id v13 = [v16 addString:v12 withLanguage:v8];

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v16 lastAction]);
      [v14 setIsVoiceOverGeneratedContent:1];

      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v16 lastAction]);
        [v15 setObject:&off_1001873B0 forVariant:32];
      }
    }
  }
}

- (void)announceAdditionalTextualInformation:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement expandedTextValue](self, "expandedTextValue"));
  if ([v4 length]) {
    id v5 = [v6 addString:v4];
  }
}

- (void)announceTableInfo:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[VOTElement _applyHeaderStatus:language:](self, "_applyHeaderStatus:language:", v9, v8);
  -[VOTElement _applyTableRowColumnSpan:language:](self, "_applyTableRowColumnSpan:language:", v9, v8);
  -[VOTElement _applyTableRowIndex:options:language:](self, "_applyTableRowIndex:options:language:", v9, a4, v8);
  -[VOTElement _applyTableColumnIndex:options:language:](self, "_applyTableColumnIndex:options:language:", v9, a4, v8);
}

- (void)applyTextEditingInformation:(id)a3 request:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v84 = a3;
  id v8 = a4;
  if (!-[VOTElement shouldIgnoreTextEditingTrait](self, "shouldIgnoreTextEditingTrait"))
  {
    uint64_t v9 = kAXIsEditingTrait;
    unsigned int v10 = -[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXIsEditingTrait);
    if ((v5 & 0x40) == 0)
    {
      if (v10)
      {
        id v11 = (char *)[(id)VOTSharedWorkspace rotorType];
        if ((unint64_t)(v11 - 3) <= 2)
        {
          id v12 = sub_10004AE68(off_1001AC148, *(&off_100179660 + (void)(v11 - 3)), 0LL, v84);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          id v14 = [v8 addString:v13 withLanguage:v84 category:@"RotorType"];

          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 lastAction]);
          [v15 setIsVoiceOverGeneratedContent:1];
        }
      }
    }

    if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXTextEntryTrait | v9))
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[VOTElement textInputElement](self, "textInputElement"));
      if (v16)
      {
        id v17 = (VOTElement *)v16;
        id v18 = -[VOTElement textInputElementRange](self, "textInputElementRange");
        __int128 v20 = v19;
        unint64_t v21 = 0x7FFFFFFFLL;
        if (v18 == (id)0x7FFFFFFF)
        {
          __int128 v22 = 0LL;
        }

        else
        {
          NSUInteger v23 = (NSUInteger)v18;
          unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v17, "value"));
          if (&v20[v23] <= [v24 length])
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v17, "value"));
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "substringWithRange:", v23, v20));
          }

          else
          {
            v85.NSUInteger location = v23;
            v85.NSUInteger length = (NSUInteger)v20;
            __int128 v25 = NSStringFromRange(v85);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            uint64_t v72 = v24;
            id v74 = [v24 length];
            double v71 = v26;
            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElementDescription.m",  2862LL,  "-[VOTElement(DescriptionCategory) applyTextEditingInformation:request:options:]",  @"Unexpected mismatch between element range %@ and actual value of text input %@, which had length %lu");
            __int128 v22 = 0LL;
          }

          unint64_t v21 = v23;
        }
      }

      else
      {
        id v17 = self;
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement value](v17, "value"));
        __int128 v20 = (char *)[v22 length];
        unint64_t v21 = 0LL;
      }

      __int128 v27 = (char *)-[VOTElement selectedTextRange](v17, "selectedTextRange", v71, v72, v74);
      if ((unint64_t)v27 < v21
        || v21 == 0x7FFFFFFF
        || (id v29 = v27, v27 == (char *)0x7FFFFFFF)
        || v28
        || v27 > &v20[v21]
        || (uint64_t v30 = &v27[-v21], v27 == (char *)v21)
        || v27 >= &v20[v21])
      {
LABEL_57:

        goto LABEL_58;
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 elementRotor]);
      id v33 = [v32 currentSelectionRotorType];

      NSUInteger v34 = &v29[~v21];
      if (v33 == (id)3)
      {
        id v35 = [v22 rangeOfComposedCharacterSequenceAtIndex:v34];
        uint64_t v37 = v36;
        id v38 = [v22 rangeOfComposedCharacterSequenceAtIndex:v30];
      }

      else
      {
        id v35 = objc_msgSend(v22, "ax_wordFromPosition:inDirection:", v34, 1);
        uint64_t v37 = v40;
        id v38 = objc_msgSend(v22, "ax_wordFromPosition:inDirection:", v30, 0);
      }

      id v41 = v38;
      uint64_t v42 = v39;
      id v79 = 0LL;
      NSUInteger v43 = &stru_10017A920;
      if (v35 == (id)0x7FFFFFFF)
      {
        CFBooleanRef v80 = &stru_10017A920;
      }

      else
      {
        CFBooleanRef v80 = &stru_10017A920;
        if (v35 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v44 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", v35, v37));
          id v79 = -[__CFString length](v44, "length");
          NSUInteger v43 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"∑1[[[",  v44));
          CFBooleanRef v80 = v44;
        }
      }

      id v83 = (__CFString *)v43;
      id v45 = 0LL;
      BOOL v46 = &stru_10017A920;
      if (v41 == (id)0x7FFFFFFF)
      {
        BOOL v81 = &stru_10017A920;
      }

      else
      {
        BOOL v81 = &stru_10017A920;
        if (v41 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v46 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", v41, v42));
          id v45 = -[__CFString length](v46, "length");
          BOOL v81 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"∑2[[[",  v46));
        }
      }

      id v82 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      id v47 = sub_10004AE68(off_1001AC148, @"cursor.at.position.use.ordinal", 0LL, v84);
      BOOL v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      unsigned int v49 = [v48 isEqualToString:@"yes"];

      if (v49) {
        -[NSNumberFormatter setNumberStyle:](v82, "setNumberStyle:", 6LL);
      }
      id v78 = v46;
      if (-[__CFString length](v81, "length") && -[__CFString length](v83, "length"))
      {
        if (v33 == (id)3 || (-[__CFString isEqualToString:](v80, "isEqualToString:", v46) & 1) == 0)
        {
          id v56 = sub_10004AE68(off_1001AC148, @"cursor.at.position", 0LL, v84);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v56);
          id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30 + 1));
          unsigned __int8 v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v82, "stringFromNumber:", v52));
          id v73 = v81;
          id v75 = v53;
        }

        else
        {
          id v50 = sub_10004AE68(off_1001AC148, @"cursor.at.position.inside", 0LL, v84);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30 + 1));
          unsigned __int8 v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v82, "stringFromNumber:", v52));
          id v73 = v53;
        }

        unsigned int v55 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v51, v83, v73, v75);
      }

      else if (-[__CFString length](v83, "length"))
      {
        id v54 = sub_10004AE68(off_1001AC148, @"cursor.at.position.after", 0LL, v84);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v54);
        id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30 + 1));
        unsigned __int8 v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v82, "stringFromNumber:", v52));
        unsigned int v55 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v51, v83, v53, v75);
      }

      else
      {
        if (!-[__CFString length](v81, "length"))
        {
          id v58 = &stru_10017A920;
          goto LABEL_47;
        }

        id v57 = sub_10004AE68(off_1001AC148, @"cursor.at.position.before", 0LL, v84);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v57);
        id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30 + 1));
        unsigned __int8 v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v82, "stringFromNumber:", v52));
        unsigned int v55 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v51, v81, v53, v75);
      }

      id v58 = (__CFString *)objc_claimAutoreleasedReturnValue(v55);

LABEL_47:
      unsigned int v59 = -[__CFString rangeOfString:](v58, "rangeOfString:", @"∑1[[[");
      uint64_t v76 = v60;
      id v61 = -[__CFString rangeOfString:](v58, "rangeOfString:", @"∑2[[[");
      uint64_t v77 = v62;
      double v63 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString stringByReplacingOccurrencesOfString:withString:]( v58,  "stringByReplacingOccurrencesOfString:withString:",  @"∑1[[[",  &stru_10017A920));

      int64_t v64 = v59 - (_BYTE *)[@"∑1[[[" length];
      unint64_t v65 = v61;
      if (v61 > v59) {
        unint64_t v65 = (_BYTE *)(v61 - (_BYTE *)[@"∑1[[[" length]);
      }
      id v66 = (void *)objc_claimAutoreleasedReturnValue( [v63 stringByReplacingOccurrencesOfString:@"∑2[[[" withString:&stru_10017A920]);

      uint64_t v67 = [@"∑2[[[" length];
      if (v61 <= v59) {
        v64 -= (uint64_t)[@"∑2[[[" length];
      }
      BOOL v68 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v66));
      unsigned int v69 = v68;
      if (v79 == (id)1) {
        objc_msgSend( v68,  "setAttribute:forKey:withRange:",  &__kCFBooleanTrue,  AXUIAccessibilitySpeechAttributePunctuation,  v64 + v76,  1);
      }
      if (v45 == (id)1) {
        objc_msgSend( v69,  "setAttribute:forKey:withRange:",  &__kCFBooleanTrue,  AXUIAccessibilitySpeechAttributePunctuation,  &v65[v77] - v67,  1);
      }

      if (v69)
      {
        id v70 = [v8 addAttributedString:v69 withLanguage:v84 category:@"TextDescription"];
      }

      goto LABEL_57;
    }
  }

- (void)_configureAsSingleLinkElementWithRequest:(id)a3 linkTraitTitle:(id)a4 hint:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v10 numberOfActionsWithString:v7] == (id)2)
  {
    [v10 removeLastActionWithString:v7];
    if (v8) {
      id v9 = [v10 addString:v8];
    }
  }
}

- (id)_roleDescriptionWithInteractOption:(int64_t)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement roleDescription](self, "roleDescription"));
  if (![v7 length]
    && [(id)VOTSharedWorkspace navigationStyleHonorsGroups]
    && -[VOTElement isAccessibleGroup](self, "isAccessibleGroup"))
  {
    id v8 = sub_10004AE68(off_1001AC148, @"group.role", 0LL, v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

    id v7 = (void *)v9;
  }

  if ([v7 length])
  {
    if (a3 == 2)
    {
      id v10 = off_1001AC148;
      id v11 = @"InteractOut";
      goto LABEL_10;
    }

    if (a3 == 1)
    {
      id v10 = off_1001AC148;
      id v11 = @"InteractIn";
LABEL_10:
      id v12 = sub_10004A988(v10, v11, 0LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v7));

      id v7 = (void *)v14;
    }
  }

  return v7;
}

- (void)_applyRoleDescription:(id)a3 language:(id)a4 interactOption:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _roleDescriptionWithInteractOption:language:]( self,  "_roleDescriptionWithInteractOption:language:",  a5,  v8));
  id v10 = [v14 addString:v9 withLanguage:v8];
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 lastAction]);
    LODWORD(v12) = 1062836634;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12));
    [v11 setObject:v13 forVariant:32];
  }
}

- (CGRect)adaptFrameForSystemElement:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = -[VOTElement windowContextId](self, "windowContextId");
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend(v9, "convertRect:fromContextId:", v8, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)regionDescriptionWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  double v9 = *((double *)&xmmword_1001AD170 + 1);
  double v10 = *(double *)&xmmword_1001AD170;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  if ([v11 applicationInterfaceOrientation] == 4)
  {

LABEL_4:
    double v14 = v9;
    goto LABEL_6;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  unsigned int v13 = [v12 applicationInterfaceOrientation];

  if (v13 == 3) {
    goto LABEL_4;
  }
  double v14 = v10;
  double v10 = v9;
LABEL_6:
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.double width = width;
  v32.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.double width = width;
  v33.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v33);
  double v17 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  uint64_t Type = AXDeviceGetType();
  if ((unint64_t)(Type - 1) <= 1)
  {
    if (MidY >= v10 / 3.0)
    {
      id v19 = off_1001AC148;
      if (MidY > (v10 + v10) / 3.0) {
        __int128 v20 = @"region.desc.bottom";
      }
      else {
        __int128 v20 = @"region.desc.midmid";
      }
    }

    else
    {
      id v19 = off_1001AC148;
      __int128 v20 = @"region.desc.top";
    }

    id v24 = sub_10004AE68(v19, v20, 0LL, v17);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    [v8 appendFormat:@"%@, ", v25];
LABEL_46:

    goto LABEL_47;
  }

  if (Type == 3)
  {
    if (MidY >= v10 / 3.0)
    {
      double v22 = (v10 + v10) / 3.0;
      if (MidY > v10 / 3.0 && MidY < v22)
      {
        if (MidX >= v14 / 3.0)
        {
          if (MidX > (v14 + v14) / 3.0) {
            unint64_t v21 = @"region.desc.midright";
          }
          else {
            unint64_t v21 = @"region.desc.midmid";
          }
        }

        else
        {
          unint64_t v21 = @"region.desc.midleft";
        }
      }

      else
      {
        if (MidY <= v22)
        {
LABEL_36:
          if (width >= v14 / 5.0)
          {
            if (width > v14 / 3.0 || width < v14 / 5.0)
            {
              uint64_t v28 = off_1001AC148;
              if (width > v14 / 1.5 || width < v14 / 3.0) {
                id v29 = @"region.desc.fullwidth";
              }
              else {
                id v29 = @"region.desc.halfwidth";
              }
            }

            else
            {
              uint64_t v28 = off_1001AC148;
              id v29 = @"region.desc.quarterwidth";
            }
          }

          else
          {
            uint64_t v28 = off_1001AC148;
            id v29 = @"region.desc.tiny";
          }

          id v30 = sub_10004AE68(v28, v29, 0LL, v17);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v30);
          [v8 appendString:v25];
          goto LABEL_46;
        }

        if (MidX >= v14 / 3.0)
        {
          if (MidX > (v14 + v14) / 3.0) {
            unint64_t v21 = @"region.desc.bottomright";
          }
          else {
            unint64_t v21 = @"region.desc.bottommid";
          }
        }

        else
        {
          unint64_t v21 = @"region.desc.bottomleft";
        }
      }
    }

    else if (MidX >= v14 / 3.0)
    {
      if (MidX > (v14 + v14) / 3.0) {
        unint64_t v21 = @"region.desc.topright";
      }
      else {
        unint64_t v21 = @"region.desc.topmid";
      }
    }

    else
    {
      unint64_t v21 = @"region.desc.topleft";
    }

    id v26 = sub_10004AE68(off_1001AC148, v21, 0LL, v17);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    [v8 appendFormat:@"%@, ", v27];

    goto LABEL_36;
  }

- (void)regionDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  -[VOTElement frame](self, "frame");
  -[VOTElement adaptFrameForSystemElement:](self, "adaptFrameForSystemElement:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](self, "touchContainer"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uiElement]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 numberWithAXAttribute:2123]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v15 unsignedIntValue]));

  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_1000A92AC;
  v19[3] = &unk_100179640;
  void v19[4] = self;
  id v20 = v4;
  id v18 = v4;
  objc_msgSend(v17, "convertFrameToCursorSpace:displayID:completion:", v16, v19, v6, v8, v10, v12);
}

- (BOOL)shouldAnnounceTableInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  unsigned int v4 = [v3 speakTableRowAndColumnForElement:self];

  if (!v4
    || !-[VOTElement containedIn:](self, "containedIn:", 2LL) && !-[VOTElement containedIn:](self, "containedIn:", 32LL))
  {
    return 0;
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](self, "touchContainer"));
  double v6 = v5;
  BOOL v7 = v5
    && ((unint64_t)[v5 rowCount] > 1 || (unint64_t)objc_msgSend(v6, "columnCount") >= 2);

  return v7;
}

- (BOOL)hasExplicitRowInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](self, "touchContainer"));
  BOOL v4 = v3
    && (id)-[VOTElement ariaRowIndex](self, "ariaRowIndex") != (id)0x7FFFFFFF
    && [v3 ariaRowCount] != 0;

  return v4;
}

- (BOOL)hasExplicitColumnInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement touchContainer](self, "touchContainer"));
  BOOL v4 = v3
    && (id)-[VOTElement ariaColumnIndex](self, "ariaColumnIndex") != (id)0x7FFFFFFF
    && [v3 ariaColumnCount] != 0;

  return v4;
}

- (id)tableDimensionStringWithRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  BOOL v4 = 0LL;
  if (a3 && a4)
  {
    id v7 = sub_10004A988(off_1001AC148, @"row.count", 0LL);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v8, a3));

    id v10 = sub_10004A988(off_1001AC148, @"column.count", 0LL);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v11,  a4));

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v9, v12));
  }

  return v4;
}

- (void)applyTableDimension:(id)a3 language:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  unint64_t v7 = -[VOTElement rowCount](self, "rowCount");
  unint64_t v8 = -[VOTElement columnCount](self, "columnCount");
  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement tableDimensionStringWithRow:andColumn:]( self,  "tableDimensionStringWithRow:andColumn:",  v7,  v8));
  if (!v9) {
    goto LABEL_17;
  }
  if (!-[VOTElement hasExplicitRowInfo](self, "hasExplicitRowInfo")
    && !-[VOTElement hasExplicitColumnInfo](self, "hasExplicitColumnInfo"))
  {
    unsigned int v13 = 0LL;
LABEL_13:
    id v17 = v9;
    goto LABEL_14;
  }

  unint64_t v10 = -[VOTElement ariaRowCount](self, "ariaRowCount");
  if (v10) {
    unint64_t v7 = v10;
  }
  unint64_t v11 = -[VOTElement ariaColumnCount](self, "ariaColumnCount");
  if (v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v8;
  }
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement tableDimensionStringWithRow:andColumn:]( self,  "tableDimensionStringWithRow:andColumn:",  v7,  v12));
  if (!v13) {
    goto LABEL_13;
  }
  id v14 = sub_10004AE68(off_1001AC148, @"table.display", 0LL, v6);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v9));

  if (!v16) {
    goto LABEL_13;
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@, %@", v13, v16));

LABEL_14:
  id v18 = [v22 addString:v17];
  if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v22 lastAction]);
    LODWORD(v20) = 1062836634;
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20));
    [v19 setObject:v21 forVariant:32];
  }

LABEL_17:
}

- (void)_applyHeaderStatus:(id)a3 language:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement headerElementsForRow:]( self,  "headerElementsForRow:",  -[VOTElement rowRange](self, "rowRange")));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement headerElementsForColumn:]( self,  "headerElementsForColumn:",  -[VOTElement columnRange](self, "columnRange")));
  if ([v7 containsObject:self])
  {
    id v9 = sub_10004A988(off_1001AC148, @"row.header", 0LL);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v15 addString:v10 withLanguage:v6];
  }

  if ([v8 containsObject:self])
  {
    id v12 = sub_10004A988(off_1001AC148, @"column.header", 0LL);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [v15 addString:v13 withLanguage:v6];
  }
}

- (void)_applyTableRowIndex:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  int v6 = a4;
  id v21 = a3;
  id v8 = a5;
  if ((v6 & 0x400000) == 0)
  {
    id v9 = -[VOTElement rowRange](self, "rowRange");
    if (v9 != (id)0x7FFFFFFF)
    {
      id v10 = v9;
      if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[VOTElement hasExplicitRowInfo](self, "hasExplicitRowInfo")) {
          unint64_t v11 = -[VOTElement ariaRowIndex](self, "ariaRowIndex");
        }
        else {
          unint64_t v11 = (unint64_t)v10 + 1;
        }
        id v12 = sub_10004AE68(off_1001AC148, @"row.change", 0LL, v8);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = AXFormatInteger(v11);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v15));
        id v17 = [v21 addString:v16 withLanguage:v8];

        if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v21 lastAction]);
          LODWORD(v19) = 1062836634;
          double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v19));
          [v18 setObject:v20 forVariant:32];
        }
      }
    }
  }
}

- (void)_applyTableColumnIndex:(id)a3 options:(unint64_t)a4 language:(id)a5
{
  int v6 = a4;
  id v19 = a3;
  id v8 = a5;
  if ((v6 & 0x200000) == 0 && -[VOTElement columnRange](self, "columnRange") != (id)0x7FFFFFFF)
  {
    if (-[VOTElement hasExplicitColumnInfo](self, "hasExplicitColumnInfo")) {
      id v9 = -[VOTElement ariaColumnIndex](self, "ariaColumnIndex");
    }
    else {
      id v9 = (char *)-[VOTElement columnRange](self, "columnRange") + 1;
    }
    id v10 = sub_10004AE68(off_1001AC148, @"column.change", 0LL, v8);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AXFormatInteger(v9);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v13));
    id v15 = [v19 addString:v14 withLanguage:v8];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v19 lastAction]);
      LODWORD(v17) = 1062836634;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
      [v16 setObject:v18 forVariant:32];
    }
  }
}

- (void)_applyTableRowColumnSpan:(id)a3 language:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  -[VOTElement rowRange](self, "rowRange");
  unint64_t v8 = v7;
  -[VOTElement columnRange](self, "columnRange");
  unint64_t v10 = v9;
  if (v8 >= 2)
  {
    id v11 = sub_10004AE68(off_1001AC148, @"row.span", 0LL, v6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AXFormatInteger(v8);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v14));
    id v16 = [v29 addString:v15 withLanguage:v6];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v29 lastAction]);
      LODWORD(v18) = 1062836634;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18));
      [v17 setObject:v19 forVariant:32];
    }
  }

  if (v10 >= 2)
  {
    id v20 = sub_10004AE68(off_1001AC148, @"column.span", 0LL, v6);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = AXFormatInteger(v10);
    NSUInteger v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v23));
    id v25 = [v29 addString:v24 withLanguage:v6];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v29 lastAction]);
      LODWORD(v27) = 1062836634;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v27));
      [v26 setObject:v28 forVariant:32];
    }
  }
}

- (id)concatenateLabelsWithLinebreaksBasedOnFrame:(id)a3
{
  id v5 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);
        if ([v12 length])
        {
          [v11 frame];
          double v14 = v13;
          double v16 = v15;
          if (v8)
          {
            if (v13 <= v3 + v4 / 3.0) {
              double v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v8, v12);
            }
            else {
              double v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v8, v12);
            }
            uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

            double v3 = v14;
            double v4 = v16;
            id v8 = (id)v18;
          }

          else
          {
            id v8 = v12;
            double v3 = v14;
            double v4 = v16;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)applicationProvidedOCRText
{
  if (-[VOTElement doesHaveAllTraits:](self, "doesHaveAllTraits:", kAXImageTrait | kAXWebContentTrait))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement imageOverlayElements](self, "imageOverlayElements"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement concatenateLabelsWithLinebreaksBasedOnFrame:]( self,  "concatenateLabelsWithLinebreaksBasedOnFrame:",  v3));
  }

  else
  {
    double v4 = 0LL;
  }

  return v4;
}

- (id)generateCVMLContentForBraille
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 voiceOverNeuralElementFeedback];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visionEngine]);

  double v17 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resultsForElement:self]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
        if ([(id)VOTSharedWorkspace textDetectionEnabled])
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 detectedTextDescription]);
          if ([v14 length])
          {
            if (!v5)
            {
              double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDetectedTextHint]);
              [v3 appendFormat:@"%@ ", v15];
            }

            [v3 appendFormat:@"%@ ", v14];
          }
        }

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  return v3;
}

- (void)applyCVMLGeneratedContentToRequest:(id)a3 explicitUserRequest:(BOOL)a4
{
  id v5 = a3;
  if ((AXDeviceIsAudioAccessory(v5, v6) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 visionEngine]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resultsForElement:self]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v11 = [v10 voiceOverNeuralElementFeedback];

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    double v14 = v12;
    if (v13)
    {
      id v15 = v13;
      CGRect v32 = v8;
      char v33 = 0;
      uint64_t v16 = *(void *)v36;
      double v17 = (id *)&VOTSharedWorkspace;
      do
      {
        __int128 v18 = 0LL;
        id v34 = v15;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v12);
          }
          __int128 v19 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v18);
          if ([*v17 textDetectionEnabled])
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement applicationProvidedOCRText](self, "applicationProvidedOCRText"));
            if (![v20 length])
            {
              uint64_t v21 = v16;
              __int128 v22 = v17;
              id v23 = v11;
              id v24 = v12;
              id v25 = self;
              id v26 = v5;
              uint64_t v27 = objc_claimAutoreleasedReturnValue([v19 detectedTextDescription]);

              __int128 v20 = (void *)v27;
              id v5 = v26;
              self = v25;
              id v12 = v24;
              id v11 = v23;
              double v17 = v22;
              uint64_t v16 = v21;
              id v15 = v34;
            }

            if ([v20 length])
            {
              if (v11 == (id)1)
              {
                char v33 = 1;
              }

              else if (!v11)
              {
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDetectedTextHint]);
                id v29 = [v5 addString:v28 category:@"Category_MLContent"];
              }

              id v30 = [v5 addString:v20 category:@"Category_MLContent"];
            }
          }

          __int128 v18 = (char *)v18 + 1;
        }

        while (v15 != v18);
        id v15 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v15);

      id v8 = v32;
      if ((v33 & 1) == 0) {
        goto LABEL_23;
      }
      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidRecognizeMLContent](&OBJC_CLASS___VOSOutputEvent, "DidRecognizeMLContent"));
      if (!v31) {
        goto LABEL_23;
      }
      double v14 = (void *)v31;
      [v5 addOutputEvent:v31 toFirstActionMatchingCategory:@"Category_MLContent"];
    }

LABEL_23:
    [v5 setImageCaptionResults:v12];
  }
}

- (id)_rawMathEquation
{
  return -[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2400LL);
}

- (id)_mathExpression
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIElementProtocol objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2400LL));
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCRCMathExpression mathExpressionWithDictionary:]( &OBJC_CLASS___SCRCMathExpression,  "mathExpressionWithDictionary:",  v2));

  return v3;
}

- (id)_mathAXStringFromAttributedString:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v4));

  [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenMathEquation];
  [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenIgnoreLeadingCommas];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  id v7 = [v3 length];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1000E6714;
  uint64_t v16 = &unk_10017A238;
  id v17 = v6;
  id v8 = v5;
  id v18 = v8;
  id v9 = v6;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v13);

  objc_msgSend(v8, "setAttribute:forKey:", v9, UIAccessibilityTokenLiteralTextRanges, v13, v14, v15, v16);
  id v10 = v18;
  id v11 = v8;

  return v11;
}

- (id)mathEquationDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 speakableDescription]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathAXStringFromAttributedString:](self, "_mathAXStringFromAttributedString:", v4));

  return v5;
}

- (unint64_t)_minimumSegmentDepthForExpression:(id)a3 withMaximumDepth:(unint64_t)a4
{
  if (a4 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = 2LL;
  while (1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 speakableSegmentsUpToDepth:v6]);
    id v8 = [v7 count];

    if (++v6 > a4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v6;
}

- (unint64_t)_minimumSegmentDepth
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression"));
  unint64_t v4 = -[VOTElement _minimumSegmentDepthForExpression:withMaximumDepth:]( self,  "_minimumSegmentDepthForExpression:withMaximumDepth:",  v3,  [v3 maximumDepth]);

  return v4;
}

- (id)mathSegmentsWithGranularityLevel:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    *(void *)&double v3 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElementMathDescription.m",  183LL,  "-[VOTElement(MathDescription) mathSegmentsWithGranularityLevel:]",  @"Tried to get math segments at invalid granularity level").n128_u64[0];
  }
  double v6 = (double)a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression", v3));
  id v8 = [v7 maximumDepth];
  unint64_t v9 = -[VOTElement _minimumSegmentDepthForExpression:withMaximumDepth:]( self,  "_minimumSegmentDepthForExpression:withMaximumDepth:",  v7,  v8);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTElementMathDescription.m",  189LL,  "-[VOTElement(MathDescription) mathSegmentsWithGranularityLevel:]",  @"Should not have asked for math segments for an expression that couldn't be broken into segments");
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 speakableSegmentsWithSpeakingStyle:0 upToDepth:(unint64_t)((double)v9 + (double)((unint64_t)v8 - v9) * ((v6 + -1.0) / -3.0 + 1.0))]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElement _mathAXStringFromAttributedString:]( self,  "_mathAXStringFromAttributedString:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16),  (void)v19));
        [v11 addObject:v17];

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

- (BOOL)canNavigateMathSegments
{
  return -[VOTElement _minimumSegmentDepth](self, "_minimumSegmentDepth") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)mathBrailleDescription
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dollarCodeDescription]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathAXStringFromAttributedString:](self, "_mathAXStringFromAttributedString:", v4));
  return v5;
}

- (BOOL)canExpandMathEquation
{
  if (!-[VOTElement doesHaveTraits:](self, "doesHaveTraits:", kAXMathEquationTrait)
    || !-[VOTElement shouldExpandMathEquation](self, "shouldExpandMathEquation"))
  {
    return 0;
  }

  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subExpressions]);
  if ([v4 count] == (id)1)
  {
    do
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

      double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subExpressions]);
      unint64_t v4 = v6;
      double v3 = v5;
    }

    while ([v6 count] == (id)1);
  }

  else
  {
    id v5 = v3;
    double v6 = v4;
  }

  BOOL v7 = (unint64_t)[v5 maximumDepth] > 1;

  return v7;
}

- (void)expandMathEquation
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTElement application](self, "application"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _rawMathEquation](self, "_rawMathEquation"));
  [v3 performAXAction:2033 withValue:v4];
}

- (id)mathSummary
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElement _mathExpression](self, "_mathExpression"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 speakableSummary]);

  return v3;
}

@end