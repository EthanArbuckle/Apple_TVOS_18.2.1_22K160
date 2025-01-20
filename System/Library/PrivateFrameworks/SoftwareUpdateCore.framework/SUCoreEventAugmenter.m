@interface SUCoreEventAugmenter
+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4;
+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4 specifyAlternateUpdate:(BOOL)a5;
+ (void)augmentEvent:(id)a3 withPolicy:(id)a4;
+ (void)augmentEvent:(id)a3 withPolicy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6;
- (SUCoreDescriptor)alternateDescriptor;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreEventAugmenter)init;
- (SUCorePolicy)policy;
- (void)augmentEvent:(id)a3;
- (void)setAlternateDescriptor:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPrimaryDescriptor:(id)a3;
@end

@implementation SUCoreEventAugmenter

- (SUCoreEventAugmenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCoreEventAugmenter;
  v2 = -[SUCoreEventAugmenter init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.su.eventAugmenter", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)setPolicy:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__SUCoreEventAugmenter_setPolicy___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __34__SUCoreEventAugmenter_setPolicy___block_invoke(uint64_t a1)
{
}

- (void)setPrimaryDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke(uint64_t a1)
{
}

- (void)setAlternateDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke(uint64_t a1)
{
}

- (void)augmentEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__SUCoreEventAugmenter_augmentEvent___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __37__SUCoreEventAugmenter_augmentEvent___block_invoke(uint64_t a1)
{
  return +[SUCoreEventAugmenter augmentEvent:withPolicy:primaryDescriptor:alternateDescriptor:]( &OBJC_CLASS___SUCoreEventAugmenter,  "augmentEvent:withPolicy:primaryDescriptor:alternateDescriptor:",  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8LL),  *(void *)(*(void *)(a1 + 40) + 16LL),  *(void *)(*(void *)(a1 + 40) + 24LL));
}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (!v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v10;
    v11 = @"missing required event param";
LABEL_10:
    [v10 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:v11 withResult:8101 withError:0];
    goto LABEL_11;
  }

  if (!v5)
  {
    [MEMORY[0x189612778] sharedDiag];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v10;
    v11 = @"missing required policy param";
    goto LABEL_10;
  }

  uint64_t v6 = [v5 delayPeriodDays];
  if (v6 >= 1)
  {
    [MEMORY[0x189607968] numberWithInteger:v6];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setSafeObject:v7 forKey:*MEMORY[0x1896128A0]];
  }

  [v5 requestedProductMarketingVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setSafeObject:v8 forKey:*MEMORY[0x189612900]];
  [v5 mdmPathName];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setSafeObject:v9 forKey:*MEMORY[0x1896128B0]];

LABEL_11:
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4
{
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4 specifyAlternateUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = v5 && [v7 descriptorAudienceType] == 2;
    uint64_t v34 = [v8 productBuildVersion];
    objc_msgSend(v35, "setSafeObject:forKey:");
    [v8 updateTypeName];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSafeObject:forKey:");
    v11 = (void *)*MEMORY[0x1896129C0];
    id v12 = (void *)*MEMORY[0x189612960];
    else {
      v13 = v12;
    }
    id v32 = v13;
    objc_msgSend(v35, "setSafeObject:forKey:");
    v31 = +[SUCoreDescriptor nameForDescriptorAudienceType:]( SUCoreDescriptor,  "nameForDescriptorAudienceType:",  [v8 descriptorAudienceType]);
    objc_msgSend(v35, "setSafeObject:forKey:");
    v30 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:]( SUCoreDescriptor,  "nameForDescriptorPreferredUpdateType:",  [v8 preferredUpdateType]);
    objc_msgSend(v35, "setSafeObject:forKey:");
    else {
      v14 = v12;
    }
    id v15 = v14;
    [v35 setSafeObject:v15 forKey:*MEMORY[0x1896128B8]];
    else {
      v16 = v12;
    }
    id v17 = v16;
    [v35 setSafeObject:v17 forKey:*MEMORY[0x1896128C0]];
    [v8 associatedSplatDescriptor];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      v19 = v11;
    }
    else {
      v19 = v12;
    }
    uint64_t v20 = *MEMORY[0x1896128F8];
    id v21 = v19;
    [v35 setSafeObject:v21 forKey:v20];
    if (v21)
    {
      [v18 productBuildVersion];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 setSafeObject:v22 forKey:*MEMORY[0x1896128F0]];
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "totalRequiredFreeSpace"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x189612888];
    if (!v9) {
      v24 = (void *)MEMORY[0x189612918];
    }
    [v35 setSafeObject:v23 forKey:*v24];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingRequiredSize"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingOptionalSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      v27 = v12;
    }
    uint64_t v28 = *MEMORY[0x1896128D8];
    id v29 = v27;
    [v35 setSafeObject:v25 forKey:v28];
    [v35 setSafeObject:v26 forKey:*MEMORY[0x1896128D0]];
    [v35 setSafeObject:v29 forKey:*MEMORY[0x1896128C8]];

    v10 = (void *)v34;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required descriptor param" withResult:8101 withError:0];
  }
}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v15)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required event param" withResult:8101 withError:0];

    goto LABEL_11;
  }

  if (!v9)
  {
    [MEMORY[0x189612778] sharedDiag];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required policy param" withResult:8101 withError:0];

    if (v10) {
      goto LABEL_4;
    }
LABEL_13:
    [MEMORY[0x189612778] sharedDiag];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required descriptor param" withResult:8101 withError:0];

    goto LABEL_4;
  }

  if (!v10) {
    goto LABEL_13;
  }
LABEL_4:
  if (v9) {
    +[SUCoreEventAugmenter augmentEvent:withPolicy:]( &OBJC_CLASS___SUCoreEventAugmenter,  "augmentEvent:withPolicy:",  v15,  v9);
  }
  if (v10) {
    +[SUCoreEventAugmenter augmentEvent:withDescriptor:specifyAlternateUpdate:]( &OBJC_CLASS___SUCoreEventAugmenter,  "augmentEvent:withDescriptor:specifyAlternateUpdate:",  v15,  v10,  v11 != 0LL);
  }
  if (v11) {
    +[SUCoreEventAugmenter augmentEvent:withDescriptor:specifyAlternateUpdate:]( &OBJC_CLASS___SUCoreEventAugmenter,  "augmentEvent:withDescriptor:specifyAlternateUpdate:",  v15,  v11,  v10 != 0LL);
  }
LABEL_11:
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void).cxx_destruct
{
}

@end