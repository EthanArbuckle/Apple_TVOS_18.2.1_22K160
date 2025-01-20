@interface NSUserActivity
+ (BOOL)_currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4;
+ (BOOL)_supportsUserActivityAppLinks;
+ (id)_currentUserActivityUUID;
+ (id)_fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5;
+ (id)_userFacingErrorForLaunchServicesError:(id)a3 userInfo:(id)a4;
+ (void)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
+ (void)_registerUserActivityType:(id)a3 dynamicActivityType:(id)a4;
+ (void)_unregisterUserActivityType:(id)a3 dynamicActivityType:(id)a4;
- (BOOL)_createUserActivityDataWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)_createUserActivityStringsWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)isEligibleForHandoff;
- (BOOL)isEligibleForPrediction;
- (BOOL)isEligibleForPublicIndexing;
- (BOOL)isEligibleForSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsSave;
- (BOOL)supportsContinuationStreams;
- (CSSearchableItemAttributeSet)contentAttributeSet;
- (NSDate)_lastActivityDate;
- (NSDate)expirationDate;
- (NSDictionary)_contentAttributes;
- (NSDictionary)_frameworkPayload;
- (NSDictionary)_options;
- (NSDictionary)userInfo;
- (NSSet)keywords;
- (NSSet)requiredUserInfoKeys;
- (NSString)_contentIdentifier;
- (NSString)_contentType;
- (NSString)_subtitle;
- (NSString)_teamIdentifier;
- (NSString)activityType;
- (NSString)targetContentIdentifier;
- (NSString)title;
- (NSURL)referrerURL;
- (NSURL)webpageURL;
- (NSUUID)_uniqueIdentifier;
- (NSUserActivity)init;
- (NSUserActivity)initWithActivityType:(NSString *)activityType;
- (NSUserActivity)initWithInternalUserActivity:(id)a3;
- (NSUserActivity)initWithTypeIdentifier:(id)a3;
- (NSUserActivityDelegate)_frameworkDelegate;
- (UAUserActivity)_internalUserActivity;
- (id)_determineMatchingApplicationBundleIdentifierWithOptions:(id)a3;
- (id)_initWithTypeIdentifier:(id)a3 suggestedActionType:(int64_t)a4 options:(id)a5;
- (id)_initWithUserActivityData:(id)a3;
- (id)_initWithUserActivityData:(id)a3 options:(id)a4;
- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5;
- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5 options:(id)a6;
- (id)_initWithUserActivityType:(id)a3 dynamicActivityType:(id)a4 options:(id)a5;
- (id)_parentUserActivity;
- (id)contentAttributes;
- (id)contentType;
- (id)contentUserAction;
- (id)delegate;
- (id)typeIdentifier;
- (id)webPageURL;
- (int64_t)_suggestedActionType;
- (unint64_t)hash;
- (void)_addKeywordsFromArray:(id)a3;
- (void)_prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4;
- (void)_resignCurrent;
- (void)_setFrameworkDelegate:(id)a3;
- (void)_setOptions:(id)a3;
- (void)addUserInfoEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)becomeCurrent;
- (void)dealloc;
- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4;
- (void)didSynchronizeActivity;
- (void)getContinuationStreamsWithCompletionHandler:(void *)completionHandler;
- (void)invalidate;
- (void)resignCurrent;
- (void)setContentAttributeSet:(CSSearchableItemAttributeSet *)contentAttributeSet;
- (void)setContentUserAction:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEligibleForHandoff:(BOOL)eligibleForHandoff;
- (void)setEligibleForPrediction:(BOOL)eligibleForPrediction;
- (void)setEligibleForPublicIndexing:(BOOL)eligibleForPublicIndexing;
- (void)setEligibleForSearch:(BOOL)eligibleForSearch;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setKeywords:(NSSet *)keywords;
- (void)setNeedsSave:(BOOL)needsSave;
- (void)setReferrerURL:(NSURL *)referrerURL;
- (void)setRequiredUserInfoKeys:(NSSet *)requiredUserInfoKeys;
- (void)setSupportsContinuationStreams:(BOOL)supportsContinuationStreams;
- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier;
- (void)setTitle:(NSString *)title;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setWebPageURL:(id)a3;
- (void)setWebpageURL:(NSURL *)webpageURL;
- (void)willSynchronizeActivity;
@end

@implementation NSUserActivity

- (NSUserActivity)initWithInternalUserActivity:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSUserActivity;
  v4 = -[NSUserActivity init](&v6, sel_init);
  if (v4)
  {
    v4->_internal = a3;
    -[UAUserActivity setDelegate:]( -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"),  "setDelegate:",  v4);
    -[UAUserActivity setParentUserActivity:]( -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"),  "setParentUserActivity:",  v4);
  }

  return v4;
}

- (NSUserActivity)init
{
  return -[NSUserActivity initWithActivityType:](self, "initWithActivityType:", 0LL);
}

- (NSUserActivity)initWithActivityType:(NSString *)activityType
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSUserActivity;
  v4 = -[NSUserActivity init](&v7, sel_init);
  if (v4)
  {
    uint64_t v5 = [objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:activityType options:0];
    v4->_internal = (id)v5;
    if (v5)
    {
      -[UAUserActivity setParentUserActivity:]( -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"),  "setParentUserActivity:",  v4);
    }

    else
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  objc_storeWeak(&self->_delegate, 0LL);
  objc_storeWeak(&self->_frameworkDelegate, 0LL);
  [self->_internal invalidate];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUserActivity;
  -[NSUserActivity dealloc](&v3, sel_dealloc);
}

- (NSString)activityType
{
  return (NSString *)-[UAUserActivity typeIdentifier]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "typeIdentifier");
}

- (NSString)title
{
  return (NSString *)-[UAUserActivity title]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "title");
}

- (void)setTitle:(NSString *)title
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[UAUserActivity userInfo]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "userInfo");
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
}

- (void)addUserInfoEntriesFromDictionary:(NSDictionary *)otherDictionary
{
}

- (BOOL)needsSave
{
  return -[UAUserActivity needsSave]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "needsSave");
}

- (void)setNeedsSave:(BOOL)needsSave
{
}

- (NSURL)webpageURL
{
  return (NSURL *)-[UAUserActivity webpageURL]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "webpageURL");
}

- (void)setWebpageURL:(NSURL *)webpageURL
{
}

- (NSURL)referrerURL
{
  return (NSURL *)-[UAUserActivity referrerURL]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "referrerURL");
}

- (void)setReferrerURL:(NSURL *)referrerURL
{
}

- (id)contentType
{
  return 0LL;
}

- (id)contentAttributes
{
  return 0LL;
}

- (id)contentUserAction
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return (id)-[UAUserActivity contentUserAction]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "contentUserAction");
  }
  else {
    return 0LL;
  }
}

- (void)setContentUserAction:(id)a3
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setContentUserAction:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setContentUserAction:",  a3);
  }
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  uint64_t v4 = self;
  objc_storeWeak(&self->_delegate, delegate);
  if ((-[UAUserActivity isInvalidated]( -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"),  "isInvalidated") & 1) == 0)
  {
    uint64_t v5 = -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity");
    if (!delegate && !-[NSUserActivity _frameworkDelegate](v4, "_frameworkDelegate")) {
      uint64_t v4 = 0LL;
    }
    -[UAUserActivity setDelegate:](v5, "setDelegate:", v4);
  }

- (BOOL)supportsContinuationStreams
{
  return -[UAUserActivity supportsContinuationStreams]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "supportsContinuationStreams");
}

- (void)setSupportsContinuationStreams:(BOOL)supportsContinuationStreams
{
}

- (void)becomeCurrent
{
}

- (void)resignCurrent
{
}

- (void)invalidate
{
}

- (void)getContinuationStreamsWithCompletionHandler:(void *)completionHandler
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (completionHandler)
  {
    uint64_t v4 = -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke;
    v5[3] = &unk_189CA1FE8;
    v5[4] = completionHandler;
    -[UAUserActivity getContinuationStreamsWithCompletionHandler:]( v4,  "getContinuationStreamsWithCompletionHandler:",  v5);
  }

uint64_t __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (NSSet)requiredUserInfoKeys
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return (NSSet *)-[UAUserActivity requiredUserInfoKeys]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "requiredUserInfoKeys");
  }
  else {
    return 0LL;
  }
}

- (void)setRequiredUserInfoKeys:(NSSet *)requiredUserInfoKeys
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setRequiredUserInfoKeys:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setRequiredUserInfoKeys:",  requiredUserInfoKeys);
  }
}

- (NSDate)expirationDate
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return (NSDate *)-[UAUserActivity expirationDate]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "expirationDate");
  }
  else {
    return 0LL;
  }
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setExpirationDate:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setExpirationDate:",  expirationDate);
  }
}

- (NSSet)keywords
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return (NSSet *)-[UAUserActivity keywords]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "keywords");
  }
  else {
    return 0LL;
  }
}

- (void)setKeywords:(NSSet *)keywords
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setKeywords:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setKeywords:",  keywords);
  }
}

- (BOOL)isEligibleForHandoff
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return -[UAUserActivity isEligibleForHandoff]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "isEligibleForHandoff");
  }
  else {
    return 1;
  }
}

- (void)setEligibleForHandoff:(BOOL)eligibleForHandoff
{
  BOOL v3 = eligibleForHandoff;
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setEligibleForHandoff:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setEligibleForHandoff:",  v3);
  }
}

- (BOOL)isEligibleForSearch
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return -[UAUserActivity isEligibleForSearch]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "isEligibleForSearch");
  }
  else {
    return 0;
  }
}

- (void)setEligibleForSearch:(BOOL)eligibleForSearch
{
  BOOL v3 = eligibleForSearch;
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setEligibleForSearch:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setEligibleForSearch:",  v3);
  }
}

- (BOOL)isEligibleForPublicIndexing
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    return -[UAUserActivity isEligibleForPublicIndexing]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "isEligibleForPublicIndexing");
  }
  else {
    return 0;
  }
}

- (void)setEligibleForPublicIndexing:(BOOL)eligibleForPublicIndexing
{
  BOOL v3 = eligibleForPublicIndexing;
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity setEligibleForPublicIndexing:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setEligibleForPublicIndexing:",  v3);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return -[NSUUID isEqual:]( -[NSUserActivity _uniqueIdentifier](self, "_uniqueIdentifier"),  "isEqual:",  [a3 _uniqueIdentifier]);
}

- (unint64_t)hash
{
  return -[NSUUID hash](-[NSUserActivity _uniqueIdentifier](self, "_uniqueIdentifier"), "hash");
}

- (NSString)targetContentIdentifier
{
  if (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity")
    && (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (NSString *)-[UAUserActivity targetContentIdentifier]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "targetContentIdentifier");
  }

  else
  {
    return 0LL;
  }

- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier
{
  if (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"))
  {
    -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      -[UAUserActivity setTargetContentIdentifier:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setTargetContentIdentifier:",  targetContentIdentifier);
    }
  }

- (id)typeIdentifier
{
  if (typeIdentifier_sOnce != -1) {
    dispatch_once(&typeIdentifier_sOnce, &__block_literal_global_65);
  }
  return -[NSUserActivity activityType](self, "activityType");
}

void __32__NSUserActivity_typeIdentifier__block_invoke()
{
}

- (NSUserActivity)initWithTypeIdentifier:(id)a3
{
  if (initWithTypeIdentifier__sOnce != -1) {
    dispatch_once(&initWithTypeIdentifier__sOnce, &__block_literal_global_11_0);
  }
  return -[NSUserActivity initWithActivityType:](self, "initWithActivityType:", a3);
}

void __41__NSUserActivity_initWithTypeIdentifier___block_invoke()
{
}

- (id)webPageURL
{
  if (webPageURL_sOnce != -1) {
    dispatch_once(&webPageURL_sOnce, &__block_literal_global_14_0);
  }
  return (id)-[UAUserActivity webpageURL]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "webpageURL");
}

void __28__NSUserActivity_webPageURL__block_invoke()
{
}

- (void)setWebPageURL:(id)a3
{
  if (setWebPageURL__sOnce != -1) {
    dispatch_once(&setWebPageURL__sOnce, &__block_literal_global_17);
  }
  -[UAUserActivity setWebpageURL:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setWebpageURL:",  a3);
}

void __32__NSUserActivity_setWebPageURL___block_invoke()
{
}

- (UAUserActivity)_internalUserActivity
{
  return (UAUserActivity *)objc_getProperty(self, a2, 8LL, 1);
}

- (BOOL)isEligibleForPrediction
{
  return self->_eligibleForPrediction;
}

- (void)setEligibleForPrediction:(BOOL)eligibleForPrediction
{
  self->_eligibleForPrediction = eligibleForPrediction;
}

- (void).cxx_destruct
{
}

- (void)willSynchronizeActivity
{
  BOOL v3 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  id v4 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSUserActivityDelegate userActivityWillSave:](v3, "userActivityWillSave:", self);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [v4 userActivityWillSave:self];
  }
}

- (void)didSynchronizeActivity
{
  BOOL v3 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  id v4 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSUserActivityDelegate userActivityWasContinued:](v3, "userActivityWasContinued:", self);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [v4 userActivityWasContinued:self];
  }
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  objc_super v7 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  id v8 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSUserActivityDelegate userActivity:didReceiveInputStream:outputStream:]( v7,  "userActivity:didReceiveInputStream:outputStream:",  self,  a3,  a4);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [v8 userActivity:self didReceiveInputStream:a3 outputStream:a4];
  }
}

- (NSString)_subtitle
{
  return 0LL;
}

- (NSString)_contentType
{
  return 0LL;
}

- (NSString)_contentIdentifier
{
  return 0LL;
}

- (NSDictionary)_contentAttributes
{
  return 0LL;
}

- (void)_addKeywordsFromArray:(id)a3
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140) {
    -[UAUserActivity addKeywordsFromArray:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "addKeywordsFromArray:",  a3);
  }
}

- (id)_parentUserActivity
{
  return 0LL;
}

+ (BOOL)_supportsUserActivityAppLinks
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  return _MergedGlobals_140;
}

- (id)_initWithUserActivityData:(id)a3
{
  uint64_t v4 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityData:a3 options:0];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v4),
        v5,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0LL;
  }

  return self;
}

- (id)_initWithUserActivityData:(id)a3 options:(id)a4
{
  uint64_t v5 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityData:a3 options:a4];
  if (!v5
    || (objc_super v6 = (void *)v5,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v5),
        v6,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0LL;
  }

  return self;
}

- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5
{
  uint64_t v6 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityStrings:a3 optionalString:a4 tertiaryData:a5 options:0];
  if (!v6
    || (objc_super v7 = (void *)v6,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v6),
        v7,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0LL;
  }

  return self;
}

- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5 options:(id)a6
{
  uint64_t v7 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityStrings:a3 optionalString:a4 tertiaryData:a5 options:a6];
  if (!v7
    || (id v8 = (void *)v7,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v7),
        v8,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0LL;
  }

  return self;
}

- (BOOL)_createUserActivityDataWithOptions:(id)a3 completionHandler:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return -[UAUserActivity createUserActivityDataWithSaving:options:completionHandler:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "createUserActivityDataWithSaving:options:completionHandler:",  1LL,  a3,  a4);
  }
  else {
    return 0;
  }
}

- (BOOL)_createUserActivityStringsWithOptions:(id)a3 completionHandler:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return -[UAUserActivity createUserActivityStringsWithSaving:options:completionHandler:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "createUserActivityStringsWithSaving:options:completionHandler:",  1LL,  a3,  a4);
  }
  else {
    return 0;
  }
}

- (void)_prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[UAUserActivity prepareUserActivityForLaunchingWithOptions:completionHandler:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "prepareUserActivityForLaunchingWithOptions:completionHandler:",  a3,  a4);
  }
}

- (NSString)_teamIdentifier
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (NSString *)-[UAUserActivity teamID]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "teamID");
  }
  else {
    return 0LL;
  }
}

+ (BOOL)_currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return [getUAUserActivityClass() currentUserActivityUUIDWithOptions:a3 completionHandler:a4];
  }
  else {
    return 0;
  }
}

- (id)_determineMatchingApplicationBundleIdentifierWithOptions:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)-[UAUserActivity determineMatchingApplicationBundleIdentfierWithOptions:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "determineMatchingApplicationBundleIdentfierWithOptions:",  a3);
  }
  else {
    return 0LL;
  }
}

+ (id)_fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5
{
  v11[6] = *MEMORY[0x1895F89C0];
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    UAUserActivityClass = getUAUserActivityClass();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke;
    v11[3] = &unk_189CA2090;
    v11[4] = a3;
    v11[5] = a5;
    return (id)[UAUserActivityClass fetchUserActivityWithUUID:a3 intervalToWaitForDocumentSynchronizationToComplete:v11 completionHandler:a4];
  }

  else
  {
    [a1 _fetchUserActivityWithUUID:a3 completionHandler:a5];
    return 0LL;
  }

void __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = -[NSUserActivity initWithInternalUserActivity:]( objc_alloc(&OBJC_CLASS___NSUserActivity),  "initWithInternalUserActivity:",  a2);
    uint64_t v7 = 0LL;
  }

  else
  {
    if (a3) {
      uint64_t v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:userInfo:]( &OBJC_CLASS___NSUserActivity,  "_userFacingErrorForLaunchServicesError:userInfo:",  a3,  0LL);
    }
    else {
      uint64_t v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3328LL,  0LL);
    }
    uint64_t v7 = v5;
    uint64_t v4 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  }
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [getUAUserActivityClass() endUserActivityUIProgressForUUID:*(void *)(a1 + 32)];
  }
}

+ (void)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  v7[6] = *MEMORY[0x1895F89C0];
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [getUAUserActivityClass() showUserActivityUIProgressForUUID:a3];
  }
  UAUserActivityClass = getUAUserActivityClass();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke;
  v7[3] = &unk_189CA2090;
  v7[4] = a3;
  v7[5] = a4;
  [UAUserActivityClass fetchUserActivityWithUUID:a3 completionHandler:v7];
}

void __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = -[NSUserActivity initWithInternalUserActivity:]( objc_alloc(&OBJC_CLASS___NSUserActivity),  "initWithInternalUserActivity:",  a2);
    uint64_t v7 = 0LL;
  }

  else
  {
    if (a3) {
      uint64_t v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:userInfo:]( &OBJC_CLASS___NSUserActivity,  "_userFacingErrorForLaunchServicesError:userInfo:",  a3,  0LL);
    }
    else {
      uint64_t v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3328LL,  0LL);
    }
    uint64_t v7 = v5;
    uint64_t v4 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  }
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [getUAUserActivityClass() endUserActivityUIProgressForUUID:*(void *)(a1 + 32)];
  }
}

+ (void)_registerUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [getUAUserActivityClass() addDynamicUserActivity:a4 matching:a3];
  }
}

+ (void)_unregisterUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [getUAUserActivityClass() removeDynamicUserActivity:a4 matching:a3];
  }
}

- (id)_initWithTypeIdentifier:(id)a3 suggestedActionType:(int64_t)a4 options:(id)a5
{
  return -[NSUserActivity initWithInternalUserActivity:]( self,  "initWithInternalUserActivity:",  (id)[objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:a3 suggestedActionType:a4 options:a5]);
}

- (id)_initWithUserActivityType:(id)a3 dynamicActivityType:(id)a4 options:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSUserActivity;
  id v8 = -[NSUserActivity init](&v10, sel_init);
  if (v8
    && [getUAUserActivityClass() instancesRespondToSelector:sel_initWithTypeIdentifier_dynamicIdentifier_options_])
  {
    v8->_internal = (id)[objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:a3 dynamicIdentifier:a4 options:a5];
  }

  return v8;
}

- (NSDictionary)_frameworkPayload
{
  return 0LL;
}

+ (id)_currentUserActivityUUID
{
  if (qword_18C496E78 != -1) {
    dispatch_once(&qword_18C496E78, &__block_literal_global_290);
  }
  if (_MergedGlobals_140 && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0)) {
    return (id)[getUAUserActivityClass() currentUserActivityUUID];
  }
  else {
    return 0LL;
  }
}

- (NSUUID)_uniqueIdentifier
{
  return (NSUUID *)-[UAUserActivity uniqueIdentifier]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "uniqueIdentifier");
}

- (int64_t)_suggestedActionType
{
  return -[UAUserActivity suggestedActionType]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "suggestedActionType");
}

- (NSDate)_lastActivityDate
{
  return 0LL;
}

- (NSDictionary)_options
{
  return (NSDictionary *)-[UAUserActivity options]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "options");
}

- (void)_setOptions:(id)a3
{
}

- (NSUserActivityDelegate)_frameworkDelegate
{
  return (NSUserActivityDelegate *)objc_loadWeak(&self->_frameworkDelegate);
}

- (void)_setFrameworkDelegate:(id)a3
{
  if ((-[UAUserActivity isInvalidated]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "isInvalidated") & 1) == 0)
  {
    uint64_t v5 = -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    else {
      uint64_t v6 = 0LL;
    }
    -[UAUserActivity setDelegate:](v5, "setDelegate:", v6);
  }

- (void)_resignCurrent
{
}

+ (id)_userFacingErrorForLaunchServicesError:(id)a3 userInfo:(id)a4
{
  if (!a3) {
    return a3;
  }
  uint64_t v6 = (void *)[a3 domain];
  uint64_t v7 = [a3 code];
  if (![v6 isEqual:getUAContinuityErrorDomain()])
  {
    if ([v6 isEqual:@"NSPOSIXErrorDomain"])
    {
      char v10 = v7 - 45;
      if ((unint64_t)(v7 - 45) <= 0x21)
      {
        if (((1LL << v10) & 0x8060) != 0) {
          goto LABEL_19;
        }
        if (((1LL << v10) & 0x200000001LL) != 0)
        {
          uint64_t v9 = 3328LL;
          if (@"NSCocoaErrorDomain") {
            goto LABEL_22;
          }
          return a3;
        }
      }

      if (v7 == 2)
      {
LABEL_19:
        uint64_t v9 = 4609LL;
        if (@"NSCocoaErrorDomain") {
          goto LABEL_22;
        }
        return a3;
      }
    }

    else if ([v6 isEqual:@"NSCocoaErrorDomain"])
    {
      return a3;
    }

    uint64_t v9 = 4608LL;
    if (@"NSCocoaErrorDomain") {
      goto LABEL_22;
    }
    return a3;
  }

  uint64_t v8 = 4608LL;
  if (v7 == -110) {
    uint64_t v8 = 4611LL;
  }
  if (v7 == -109) {
    uint64_t v9 = 4610LL;
  }
  else {
    uint64_t v9 = v8;
  }
  if (!@"NSCocoaErrorDomain") {
    return a3;
  }
LABEL_22:
  id v12 = (id)[a4 mutableCopy];
  if (v12 || (id v12 = (id)[MEMORY[0x189603FC8] dictionary]) != 0) {
    [v12 setObject:a3 forKey:@"NSUnderlyingError"];
  }
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v9,  v12);
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (CSSearchableItemAttributeSet *)-[UAUserActivity contentAttributeSet]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "contentAttributeSet");
  }
  else {
    return 0LL;
  }
}

- (void)setContentAttributeSet:(CSSearchableItemAttributeSet *)contentAttributeSet
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[UAUserActivity setContentAttributeSet:]( -[NSUserActivity _internalUserActivity](self, "_internalUserActivity"),  "setContentAttributeSet:",  contentAttributeSet);
  }
}

@end