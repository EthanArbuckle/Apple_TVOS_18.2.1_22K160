@interface PDDiscoveryService
- (PDDiscoveryManager)discoveryManager;
- (PDDiscoveryService)initWithConnection:(id)a3;
- (PDDiscoveryService)initWithConnection:(id)a3 server:(id)a4;
- (PDRuleManager)ruleManager;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)beginReportingDiscoveryAnalyticsCompletion:(id)a3;
- (void)completedCTAForItem:(id)a3;
- (void)completedDiscoveryItemCTAWithCompletion:(id)a3;
- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4;
- (void)dialogRequestsChangedForPlacement:(id)a3;
- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutsWithCompletion:(id)a3;
- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5 completion:(id)a6;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5 completion:(id)a6;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemsWithCompletion:(id)a3;
- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5 completion:(id)a6;
- (void)dismissedDiscoveryItems:(id)a3;
- (void)dispatchDiscoveryRequestBlock:(id)a3 errorBlock:(id)a4;
- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8 completion:(id)a9;
- (void)endReportingDiscoveryAnalyticsCompletion:(id)a3;
- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7 completion:(id)a8;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4;
- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4;
- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5;
- (void)insertRule:(id)a3 completion:(id)a4;
- (void)manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3;
- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3;
- (void)removedAllDiscoveryItemsWithCompletion:(id)a3;
- (void)rulesWithCompletion:(id)a3;
- (void)sendDiscoveryArticleLayoutsUpdated:(id)a3;
- (void)sendDiscoveryEngagementMessagesUpdated;
- (void)setDiscoveryManager:(id)a3;
- (void)setRuleManager:(id)a3;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5 completion:(id)a6;
- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryManifestWithCompletion:(id)a3;
@end

@implementation PDDiscoveryService

- (PDDiscoveryService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDDiscoveryService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDDiscoveryService;
  v6 = -[PDDiscoveryService initWithConnection:](&v14, "initWithConnection:", v5);
  if (v6)
  {
    v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    v6->_entitledForDiscoveryUse = -[PKEntitlementWhitelist paymentAllAccess]( v6->_whitelist,  "paymentAllAccess");
    uint64_t v9 = PKDiscoveryServiceInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setRemoteObjectInterface:v10];

    uint64_t v11 = PDDiscoveryServiceInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)sendDiscoveryArticleLayoutsUpdated:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDDiscoveryService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 discoveryArticleLayoutsUpdated:v4];
  }

- (void)completedCTAForItem:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDDiscoveryService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 completedCTAForItem:v4];
  }

- (void)dialogRequestsChangedForPlacement:(id)a3
{
  if (self->_entitledForDiscoveryUse)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDDiscoveryService remoteObjectProxy](self, "remoteObjectProxy"));
    [v5 dialogRequestsChangedForPlacement:v4];
  }

- (void)sendDiscoveryEngagementMessagesUpdated
{
  if (self->_entitledForDiscoveryUse)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDDiscoveryService remoteObjectProxy](self, "remoteObjectProxy"));
    [v2 discoveryEngagementMessagesUpdated];
  }

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDDiscoveryService;
  id v2 = -[PDDiscoveryService remoteObjectProxy](&v4, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDDiscoveryService;
  id v3 = -[PDDiscoveryService remoteObjectProxyWithErrorHandler:](&v5, "remoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)dispatchDiscoveryRequestBlock:(id)a3 errorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (v6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100304BE4;
    v13[3] = &unk_10063CA40;
    v13[4] = self;
    id v14 = v6;
    v15 = v8;
    uint64_t v11 = v13;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003079DC;
    block[3] = &unk_10063A830;
    id v17 = v11;
    dispatch_async(v10, block);
  }

  else if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKDiscoveryErrorDomain,  0LL,  0LL));
    ((void (**)(void, void *))v8)[2](v8, v12);
  }
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100304D80;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100304E08;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100304EFC;
    v10[3] = &unk_100639AF0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100304F88;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10030505C;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003050E0;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003051E4;
    v12[3] = &unk_10063C928;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100305310;
    v10[3] = &unk_1006424D0;
    id v11 = v14;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v12,  v10);
  }
}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003053D0;
  v6[3] = &unk_10063AC90;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003053E4;
  v4[3] = &unk_1006424D0;
  id v5 = v8;
  id v3 = v8;
  -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( v7,  "dispatchDiscoveryRequestBlock:errorBlock:",  v6,  v4);
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003054A8;
  v6[3] = &unk_10063AC90;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003054BC;
  v4[3] = &unk_1006424D0;
  id v5 = v8;
  id v3 = v8;
  -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( v7,  "dispatchDiscoveryRequestBlock:errorBlock:",  v6,  v4);
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100305588;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100305610;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10030572C;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003057D0;
    v11[3] = &unk_1006424D0;
    id v12 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v13,  v11);
  }
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003058A4;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10030592C;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100305A28;
    v12[3] = &unk_10063C928;
    v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100305AC4;
    v10[3] = &unk_1006424D0;
    id v11 = v14;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v12,  v10);
  }
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100305BB8;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100305C48;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100305D5C;
  v12[3] = &unk_10063B440;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100305D78;
  v10[3] = &unk_1006424D0;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( v13,  "dispatchDiscoveryRequestBlock:errorBlock:",  v12,  v10);
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100305E74;
    v12[3] = &unk_10063C928;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100305F80;
    v10[3] = &unk_1006424D0;
    id v11 = v14;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v12,  v10);
  }
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10030606C;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003060FC;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1003061E8;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100306278;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100306364;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003063A0;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  if (v16)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1003064C8;
    v19[3] = &unk_100655E70;
    v19[4] = self;
    BOOL v24 = a4;
    BOOL v25 = a5;
    BOOL v26 = a6;
    id v20 = v15;
    int64_t v22 = a7;
    int64_t v23 = a8;
    id v21 = v16;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100306514;
    v17[3] = &unk_1006424D0;
    id v18 = v21;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v19,  v17);
  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  if (v15)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10030662C;
    v18[3] = &unk_100655E98;
    v18[4] = self;
    id v19 = v14;
    int64_t v21 = a4;
    int64_t v22 = a7;
    BOOL v23 = a5;
    BOOL v24 = a6;
    id v20 = v15;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100306674;
    v16[3] = &unk_1006424D0;
    id v17 = v20;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v18,  v16);
  }
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100306774;
    v14[3] = &unk_10063DA20;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    int64_t v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003067B4;
    v12[3] = &unk_1006424D0;
    id v13 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v14,  v12);
  }
}

- (void)removedAllDiscoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100306880;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003068BC;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1003069C0;
    v14[3] = &unk_10063DA20;
    v14[4] = self;
    int64_t v17 = a3;
    id v15 = v10;
    int64_t v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100306A00;
    v12[3] = &unk_1006424D0;
    id v13 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v14,  v12);
  }
}

- (void)completedDiscoveryItemCTAWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100306ACC;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100306B08;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100306C04;
    v12[3] = &unk_10063C928;
    void v12[4] = self;
    id v13 = v8;
    unint64_t v15 = a4;
    id v14 = v9;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100306C44;
    v10[3] = &unk_1006424D0;
    id v11 = v14;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v12,  v10);
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100306D48;
    v14[3] = &unk_100655EC0;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    BOOL v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100306D8C;
    v12[3] = &unk_1006424D0;
    id v13 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v14,  v12);
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100306E90;
    v14[3] = &unk_100655EC0;
    v14[4] = self;
    id v15 = v10;
    int64_t v17 = a4;
    BOOL v18 = a5;
    id v16 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100306ED4;
    v12[3] = &unk_1006424D0;
    id v13 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v14,  v12);
  }
}

- (void)beginReportingDiscoveryAnalyticsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100306FA0;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100306FDC;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)endReportingDiscoveryAnalyticsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003070A8;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003070E4;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)rulesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003071B0;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100307238;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)insertRule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10030732C;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100307368;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)deleteRuleWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100307454;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100307490;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)evaluateRulesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10030757C;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100307598;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10030766C;
    v8[3] = &unk_10063AC90;
    void v8[4] = self;
    id v9 = v4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003076F4;
    v6[3] = &unk_1006424D0;
    id v7 = v9;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v8,  v6);
  }
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100307808;
    v13[3] = &unk_10063B440;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100307824;
    v11[3] = &unk_1006424D0;
    id v12 = v16;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v13,  v11);
  }
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100307918;
    v10[3] = &unk_100639AF0;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100307934;
    v8[3] = &unk_1006424D0;
    id v9 = v12;
    -[PDDiscoveryService dispatchDiscoveryRequestBlock:errorBlock:]( self,  "dispatchDiscoveryRequestBlock:errorBlock:",  v10,  v8);
  }
}

- (PDDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
}

- (PDRuleManager)ruleManager
{
  return self->_ruleManager;
}

- (void)setRuleManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end