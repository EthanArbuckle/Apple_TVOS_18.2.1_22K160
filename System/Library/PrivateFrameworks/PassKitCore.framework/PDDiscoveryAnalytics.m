@interface PDDiscoveryAnalytics
- (NSSet)identifiersOfCompletedDiscoveryItems;
- (NSSet)identifiersOfDismissedDiscoveryItems;
- (NSSet)identifiersOfExpandedDiscoveryItems;
- (NSSet)identifiersOfTappedDiscoveryItems;
- (NSString)lastTappedCTAItemIdentifier;
- (id)_countForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (id)_createOrRotateVisitorIDIfNecessary;
- (id)_createVisitorID;
- (id)_initalizeCountForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (id)_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:(double)a3;
- (void)_incrementCountForCountsDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (void)beginReporingDiscoveryAnalytics;
- (void)clearVisitorIDAndRelatedData;
- (void)completedDiscoveryItemCTA;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 cardCount:(unint64_t)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)displayedEngagementMessage:(id)a3;
- (void)endReporingDiscoveryAnalytics;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7;
- (void)performedAction:(int64_t)a3 onDiscoveryItem:(id)a4;
- (void)performedAction:(int64_t)a3 onEngagementMessage:(id)a4;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5;
@end

@implementation PDDiscoveryAnalytics

- (void)performedAction:(int64_t)a3 onEngagementMessage:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    unsigned __int8 v12 = [v5 canReportIdentifierToAggd];
    uint64_t v8 = PKAggDKeyDiscoveryMessageRemoved;
    if ((v12 & 1) != 0)
    {
      v14 = @"identifier";
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v15 = v9;
      v10 = &v15;
      v11 = &v14;
      goto LABEL_7;
    }

- (void)performedAction:(int64_t)a3 onDiscoveryItem:(id)a4
{
  id v5 = a4;
  if (a3 == 2)
  {
    id v7 = v5;
    v6 = &PKAggDKeyDiscoveryCardActioned;
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    id v7 = v5;
    v6 = &PKAggDKeyDiscoveryCardRemoved;
LABEL_5:
    PKAnalyticsSendEvent(*v6, 0LL);
    id v5 = v7;
  }
}

- (void)displayedEngagementMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 canReportIdentifierToAggd];
  uint64_t v5 = PKAggDKeyDiscoveryMessageDisplayed;
  if (v4)
  {
    uint64_t v8 = @"identifier";
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    PKAnalyticsSendEvent(v5, v7);
  }

  else
  {
    PKAnalyticsSendEvent(PKAggDKeyDiscoveryMessageDisplayed, 0LL);
  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  v14 = (__CFString *)a3;
  if (!a4) {
    PKAnalyticsSendEvent(PKAggDKeyDiscoveryCardDisplayed, 0LL);
  }
  else {
    v15 = *(&off_100655CA0 + a7 - 1);
  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _createOrRotateVisitorIDIfNecessary]( self,  "_createOrRotateVisitorIDIfNecessary"));
  -[PDDiscoveryAnalytics _incrementCountForCountsDictionaryWithKey:forItemIdentifier:]( self,  "_incrementCountForCountsDictionaryWithKey:forItemIdentifier:",  @"PDDiscoverySwipedCountDict",  v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _countForDictionaryWithKey:forItemIdentifier:]( self,  "_countForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoverySwipedCountDict",  v14));
  if (![v17 integerValue])
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _initalizeCountForDictionaryWithKey:forItemIdentifier:]( self,  "_initalizeCountForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoverySwipedCountDict",  v14));

    v17 = (void *)v18;
  }

  v28[0] = PKAnalyticsReportEventTypeDiscoveryCardSwiped;
  v27[0] = PKAnalyticsReportEventKey;
  v27[1] = PKAnalyticsReportDiscoveryCardSwipedCountKey;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 stringValue]);
  v20 = (void *)v19;
  v21 = @"null";
  if (v14) {
    v22 = v14;
  }
  else {
    v22 = @"null";
  }
  v28[1] = v19;
  v28[2] = v22;
  v27[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v27[3] = PKAnalyticsReportEventTypeCallToActionType;
  v23 = @"false";
  if (v11) {
    v24 = @"true";
  }
  else {
    v24 = @"false";
  }
  v28[3] = v15;
  v28[4] = v24;
  v27[4] = PKAnalyticsReportDiscoveryCardSwipedRequiredKey;
  v27[5] = PKAnalyticsReportDiscoveryCardMultipleStoryCardsAvailabledKey;
  if (v10) {
    v23 = @"true";
  }
  if (v16) {
    v21 = v16;
  }
  v28[5] = v23;
  v28[6] = v21;
  v27[6] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  v27[7] = PKAnalyticsReportDiscoveryCardSizeKey;
  else {
    v25 = *(&off_100655C68 + a8);
  }
  v28[7] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  8LL));

  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v26);
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  unsigned __int8 v12 = (__CFString *)a3;
  PKAnalyticsSendEvent(PKAggDKeyDiscoveryCardExpanded, 0LL);
  else {
    v13 = *(&off_100655CA0 + a4 - 1);
  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _createOrRotateVisitorIDIfNecessary]( self,  "_createOrRotateVisitorIDIfNecessary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dictionaryForKey:@"PDDiscoveryExpandedSet"]);
  v17 = (NSMutableDictionary *)[v16 mutableCopy];

  if (!v17) {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v12);
  [v15 setObject:v17 forKey:@"PDDiscoveryExpandedSet"];
  -[PDDiscoveryAnalytics _incrementCountForCountsDictionaryWithKey:forItemIdentifier:]( self,  "_incrementCountForCountsDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryExpansionCountDict",  v12);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _countForDictionaryWithKey:forItemIdentifier:]( self,  "_countForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryExpansionCountDict",  v12));
  if (![v18 integerValue])
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _initalizeCountForDictionaryWithKey:forItemIdentifier:]( self,  "_initalizeCountForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryExpansionCountDict",  v12));

    uint64_t v18 = (void *)v19;
  }

  v29[0] = PKAnalyticsReportEventTypeDiscoveryCardExpanded;
  v28[0] = PKAnalyticsReportEventKey;
  v28[1] = PKAnalyticsReportDiscoveryCardExpansionCountKey;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 stringValue]);
  v21 = (void *)v20;
  v22 = @"null";
  if (v12) {
    v23 = v12;
  }
  else {
    v23 = @"null";
  }
  v29[1] = v20;
  v29[2] = v23;
  v28[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v28[3] = PKAnalyticsReportEventTypeCallToActionType;
  if (v9) {
    v24 = @"true";
  }
  else {
    v24 = @"false";
  }
  v29[3] = v13;
  v29[4] = v24;
  v28[4] = PKAnalyticsReportDiscoveryCardExpandedAfterSwipingToCardKey;
  v28[5] = PKAnalyticsReportDiscoveryCardMultipleStoryCardsAvailabledKey;
  if (v8) {
    v25 = @"true";
  }
  else {
    v25 = @"false";
  }
  v29[5] = v25;
  v28[6] = PKAnalyticsReportDiscoveryCardSizeKey;
  else {
    v26 = *(&off_100655C68 + a7);
  }
  v28[7] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v14) {
    v22 = v14;
  }
  v29[6] = v26;
  v29[7] = v22;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  8LL));

  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v27);
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  BOOL v8 = (__CFString *)a3;
  else {
    BOOL v9 = *(&off_100655CA0 + a4 - 1);
  }
  BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _createOrRotateVisitorIDIfNecessary]( self,  "_createOrRotateVisitorIDIfNecessary"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionaryForKey:@"PDDiscoveryDismissedSet"]);
  v13 = (NSMutableDictionary *)[v12 mutableCopy];

  if (!v13) {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v8);
    -[PDDiscoveryAnalytics _incrementCountForCountsDictionaryWithKey:forItemIdentifier:]( self,  "_incrementCountForCountsDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryDismissalCountDict",  v8);
    v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _countForDictionaryWithKey:forItemIdentifier:]( self,  "_countForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryDismissalCountDict",  v8));
    if ([v14 integerValue])
    {
      v15 = v8;
    }

    else
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _initalizeCountForDictionaryWithKey:forItemIdentifier:]( self,  "_initalizeCountForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryDismissalCountDict",  v8));

      v15 = v8;
      v14 = (_UNKNOWN **)v16;
    }
  }

  else
  {
    v14 = &off_1006906E0;
    v15 = @"null";
  }

  [v11 setObject:v13 forKey:@"PDDiscoveryDismissedSet"];
  v22[0] = PKAnalyticsReportEventTypeDiscoveryCardDismissed;
  v21[0] = PKAnalyticsReportEventKey;
  v21[1] = PKAnalyticsReportDiscoveryCardDismissalCountKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
  v22[1] = v17;
  v22[2] = v15;
  v21[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v21[3] = PKAnalyticsReportEventTypeCallToActionType;
  v22[3] = v9;
  v21[4] = PKAnalyticsReportDiscoveryCardSizeKey;
  else {
    uint64_t v18 = *(&off_100655C68 + a5);
  }
  v21[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v10) {
    uint64_t v19 = v10;
  }
  else {
    uint64_t v19 = @"null";
  }
  v22[4] = v18;
  v22[5] = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  6LL));

  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v20);
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5
{
  BOOL v8 = (__CFString *)a4;
  else {
    BOOL v9 = *(&off_100655CA0 + a3 - 1);
  }
  BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _createOrRotateVisitorIDIfNecessary]( self,  "_createOrRotateVisitorIDIfNecessary"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionaryForKey:@"PDDiscoveryCTABegunSet"]);
  v13 = (NSMutableDictionary *)[v12 mutableCopy];

  if (!v13) {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v8);
  [v11 setObject:v13 forKey:@"PDDiscoveryCTABegunSet"];
  [v11 setObject:v9 forKey:@"PDDiscoveryCTALastTappedAction"];
  if (v8) {
    v14 = v8;
  }
  else {
    v14 = 0LL;
  }
  [v11 setObject:v14 forKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
  [v11 setInteger:a5 forKey:@"PDDiscoveryCTALastTappedItemSize"];
  -[PDDiscoveryAnalytics _incrementCountForCountsDictionaryWithKey:forItemIdentifier:]( self,  "_incrementCountForCountsDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTABegunCountDict",  v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _countForDictionaryWithKey:forItemIdentifier:]( self,  "_countForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTABegunCountDict",  v9));
  if (![v15 integerValue])
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _initalizeCountForDictionaryWithKey:forItemIdentifier:]( self,  "_initalizeCountForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTABegunCountDict",  v9));

    v15 = (void *)v16;
  }

  v23[0] = PKAnalyticsReportEventKey;
  v23[1] = PKAnalyticsReportEventTypeCallToActionType;
  v24[0] = PKAnalyticsReportEventTypeCallToActionBegan;
  v24[1] = v9;
  v23[2] = PKAnalyticsReportDiscoveryCardCTABeganCountKey;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 stringValue]);
  uint64_t v18 = (void *)v17;
  uint64_t v19 = @"null";
  if (v8) {
    uint64_t v20 = v8;
  }
  else {
    uint64_t v20 = @"null";
  }
  v24[2] = v17;
  v24[3] = v20;
  v23[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v23[4] = PKAnalyticsReportDiscoveryCardSizeKey;
  else {
    v21 = *(&off_100655C68 + a5);
  }
  v23[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v10) {
    uint64_t v19 = v10;
  }
  v24[4] = v21;
  v24[5] = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  6LL));

  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v22);
}

- (void)completedDiscoveryItemCTA
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _createOrRotateVisitorIDIfNecessary]( self,  "_createOrRotateVisitorIDIfNecessary"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"]);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"PDDiscoveryCTACompletedSet"]);
    id v7 = (NSMutableDictionary *)[v6 mutableCopy];

    if (!v7) {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v5);
    [v4 setObject:v7 forKey:@"PDDiscoveryCTACompletedSet"];
    -[PDDiscoveryAnalytics _incrementCountForCountsDictionaryWithKey:forItemIdentifier:]( self,  "_incrementCountForCountsDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTACompletedCountDict",  v5);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _countForDictionaryWithKey:forItemIdentifier:]( self,  "_countForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTACompletedCountDict",  v5));
    if (![v8 integerValue])
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _initalizeCountForDictionaryWithKey:forItemIdentifier:]( self,  "_initalizeCountForDictionaryWithKey:forItemIdentifier:",  @"PDDiscoveryCTACompletedCountDict",  v5));

      BOOL v8 = (void *)v9;
    }

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PDDiscoveryCTALastTappedAction"]);
    if (v10)
    {
      id v11 = [v4 integerForKey:@"PDDiscoveryCTALastTappedItemSize"];
      v16[0] = PKAnalyticsReportEventKey;
      v16[1] = PKAnalyticsReportEventTypeCallToActionType;
      v17[0] = PKAnalyticsReportEventTypeCallToActionCompleted;
      v17[1] = v10;
      v16[2] = PKAnalyticsReportDiscoveryCardCTACompletedCountKey;
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);
      v17[2] = v12;
      v17[3] = v5;
      v16[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
      v16[4] = PKAnalyticsReportDiscoveryCardSizeKey;
      else {
        v13 = *(&off_100655C68 + (void)v11);
      }
      v16[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
      v14 = @"null";
      if (v3) {
        v14 = v3;
      }
      v17[4] = v13;
      v17[5] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  6LL));

      +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v15);
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedAction"];
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedItemSize"];
    }
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 cardCount:(unint64_t)a5
{
  id v7 = (__CFString *)a3;
  if (a4 > 3) {
    BOOL v8 = @"unknownReferralSource";
  }
  else {
    BOOL v8 = *(&off_100655C80 + a4);
  }
  if (a5 > 4) {
    uint64_t v9 = @"More than 4";
  }
  else {
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString pk_stringWithInteger:](&OBJC_CLASS___NSString, "pk_stringWithInteger:", a5));
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v21[0] = PKAnalyticsReportEventTypeReferralSource;
    v21[1] = PKAnalyticsReportDiscoveryCardWalletBadged;
    BOOL v10 = @"false";
    if (a4 == 2) {
      BOOL v10 = @"true";
    }
    v22[0] = v8;
    v22[1] = v10;
    v21[2] = PKAnalyticsReportDiscoveryCardTotalCardCount;
    v21[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
    id v11 = @"null";
    if (v7) {
      id v11 = v7;
    }
    v22[2] = v9;
    v22[3] = v11;
    unsigned __int8 v12 = v22;
    v13 = v21;
    uint64_t v14 = 4LL;
  }

  else
  {
    v19[0] = PKAnalyticsReportEventTypeReferralSource;
    v19[1] = PKAnalyticsReportDiscoveryCardTotalCardCount;
    v20[0] = v8;
    v20[1] = v9;
    v19[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
    if (v7) {
      v15 = v7;
    }
    else {
      v15 = @"null";
    }
    v20[2] = v15;
    unsigned __int8 v12 = v20;
    v13 = v19;
    uint64_t v14 = 3LL;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  v14));
  uint64_t v18 = PKAnalyticsSubjectDiscoveryCard;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  +[PKAnalyticsReporter subjects:sendEvent:](&OBJC_CLASS___PKAnalyticsReporter, "subjects:sendEvent:", v17, v16);
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
  else {
    uint64_t v5 = *(&off_100655CA0 + a4 - 1);
  }
  v6 = @"false";
  if (a5) {
    v6 = @"true";
  }
  v9[0] = PKAnalyticsReportDiscoveryCardScrollableKey;
  v9[1] = PKAnalyticsReportEventTypeCallToActionType;
  v10[0] = v6;
  v10[1] = v5;
  v9[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v10[2] = a3;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v8);
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
  else {
    uint64_t v5 = *(&off_100655CA0 + a4 - 1);
  }
  v6 = @"false";
  if (a5) {
    v6 = @"true";
  }
  v9[0] = PKAnalyticsReportDiscoveryCardScrolledToBottomKey;
  v9[1] = PKAnalyticsReportEventTypeCallToActionType;
  v10[0] = v6;
  v10[1] = v5;
  v9[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v10[2] = a3;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  +[PKAnalyticsReporter subject:sendEvent:]( &OBJC_CLASS___PKAnalyticsReporter,  "subject:sendEvent:",  PKAnalyticsSubjectDiscoveryCard,  v8);
}

- (void)beginReporingDiscoveryAnalytics
{
}

- (void)endReporingDiscoveryAnalytics
{
}

- (NSString)lastTappedCTAItemIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"]);

  return (NSString *)v3;
}

- (NSSet)identifiersOfExpandedDiscoveryItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDDiscoveryExpandedSet"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysOfEntriesPassingTest:&stru_100655BE8]);

  return (NSSet *)v4;
}

- (NSSet)identifiersOfDismissedDiscoveryItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDDiscoveryDismissedSet"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysOfEntriesPassingTest:&stru_100655C08]);

  return (NSSet *)v4;
}

- (NSSet)identifiersOfTappedDiscoveryItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDDiscoveryCTABegunSet"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysOfEntriesPassingTest:&stru_100655C28]);

  return (NSSet *)v4;
}

- (NSSet)identifiersOfCompletedDiscoveryItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"PDDiscoveryCTACompletedSet"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keysOfEntriesPassingTest:&stru_100655C48]);

  return (NSSet *)v4;
}

- (id)_createVisitorID
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v2, "UUIDString"));

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setObject:v3 forKey:@"PDDiscoveryVisitorID"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "setDouble:forKey:", @"PDDiscoveryVisitorIDCreationInterval");

  return v3;
}

- (id)_createOrRotateVisitorIDIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 stringForKey:@"PDDiscoveryVisitorID"]);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    [v3 doubleForKey:@"PDDiscoveryVisitorIDCreationInterval"];
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDiscoveryAnalytics _rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:]( self,  "_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:"));
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error fetching visitorID, clearing data and creating a new visitorID",  v10,  2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDiscoveryAnalytics _createVisitorID](self, "_createVisitorID"));
  }

  return v6;
}

- (id)_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  double v7 = v6;

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:@"PDDiscoveryVisitorID"]);
  BOOL v10 = v9;
  double v11 = v7 - a3;
  if (v11 > 6912000.0 || v9 == 0LL)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218240;
      BOOL v19 = v11 > 6912000.0;
      __int16 v20 = 2048;
      BOOL v21 = v10 == 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Clearing discovery data and creating a new visitorID due to elapsed interval:%ld or nil visitorID:%ld",  (uint8_t *)&v18,  0x16u);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue(-[PDDiscoveryAnalytics _createVisitorID](self, "_createVisitorID"));
  }

  else
  {
    id v15 = v9;
  }

  uint64_t v16 = v15;

  return v16;
}

- (void)_incrementCountForCountsDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryForKey:v14]);
  BOOL v8 = (NSMutableDictionary *)[v7 mutableCopy];

  if (!v8) {
    BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v5));
  BOOL v10 = v9;
  if (v9) {
    signed int v11 = [v9 intValue] + 1;
  }
  else {
    signed int v11 = 1;
  }
  if (v11 >= 5) {
    uint64_t v12 = 5LL;
  }
  else {
    uint64_t v12 = v11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v5);

  [v6 setObject:v8 forKey:v14];
}

- (id)_countForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryForKey:v6]);

  id v9 = [v8 mutableCopy];
  if (v9) {
    BOOL v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
  }
  else {
    BOOL v10 = &off_1006906E0;
  }

  return v10;
}

- (id)_initalizeCountForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryForKey:v5]);
  id v9 = (NSMutableDictionary *)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  BOOL v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v6));
  if (!v10)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(16LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "count was nil for item with identifier:%@ in dictionary for key:%@, setting to 1",  (uint8_t *)&v14,  0x16u);
    }

    BOOL v10 = &off_1006906F8;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, v6);
  [v7 setObject:v9 forKey:v5];

  return v10;
}

- (void)clearVisitorIDAndRelatedData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 removeObjectForKey:@"PDDiscoveryVisitorID"];
  [v2 removeObjectForKey:@"PDDiscoveryVisitorIDCreationInterval"];
  [v2 removeObjectForKey:@"PDDiscoveryDismissalCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryExpansionCountDict"];
  [v2 removeObjectForKey:@"PDDiscoverySwipedCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTABegunCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTACompletedCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedAction"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedItemSize"];
}

@end