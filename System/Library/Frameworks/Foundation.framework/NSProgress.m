@interface NSProgress
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSProgress)currentProgress;
+ (NSProgress)discreteProgressWithTotalUnitCount:(int64_t)unitCount;
+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount;
+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount parent:(NSProgress *)parent pendingUnitCount:(int64_t)portionOfParentTotalUnitCount;
+ (id)_addSubscriberForCategory:(id)a3 usingPublishingHandler:(id)a4;
+ (id)_publisherInterface;
+ (id)_registrarInterface;
+ (id)_serverConnection;
+ (id)_subscriberInterface;
+ (id)addSubscriberForFileURL:(NSURL *)url withPublishingHandler:(NSProgressPublishingHandler)publishingHandler;
+ (id)keyPathsForValuesAffectingLocalizedAdditionalDescription;
+ (id)keyPathsForValuesAffectingLocalizedDescription;
+ (void)removeSubscriber:(id)subscriber;
- (BOOL)_adoptChildUserInfo;
- (BOOL)isCancellable;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isIndeterminate;
- (BOOL)isOld;
- (BOOL)isPausable;
- (BOOL)isPaused;
- (BOOL)isPrioritizable;
- (NSDictionary)userInfo;
- (NSNumber)estimatedTimeRemaining;
- (NSNumber)fileCompletedCount;
- (NSNumber)fileTotalCount;
- (NSNumber)throughput;
- (NSProgress)init;
- (NSProgress)initWithParent:(NSProgress *)parentProgressOrNil userInfo:(NSDictionary *)userInfoOrNil;
- (NSProgressFileOperationKind)fileOperationKind;
- (NSProgressKind)kind;
- (NSString)description;
- (NSString)localizedAdditionalDescription;
- (NSString)localizedDescription;
- (NSURL)fileURL;
- (double)_remoteFractionCompleted;
- (double)fractionCompleted;
- (id)_indentedDescription:(unint64_t)a3;
- (id)_initWithValues:(id)a3;
- (id)_parent;
- (id)_publishingAppBundleIdentifier;
- (id)acknowledgementHandlerForAppBundleIdentifier:(id)a3;
- (id)byteCompletedCount;
- (id)byteTotalCount;
- (id)ownedDictionaryKeyEnumerator;
- (id)ownedDictionaryObjectForKey:(id)a3;
- (id)prioritizationHandler;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (unint64_t)ownedDictionaryCount;
- (void)_addCompletedUnitCount:(int64_t)a3;
- (void)_addImplicitChild:(id)a3;
- (void)_notifyRemoteObserversOfUserInfoValueForKey:(id)a3;
- (void)_notifyRemoteObserversOfValueForKeys:(id)a3;
- (void)_receiveProgressMessage:(void *)a1 forSequence:(xpc_object_t)xdict;
- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4;
- (void)_setParent:(id)a3 portion:(int64_t)a4;
- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4;
- (void)_setRemoteValues:(id)a3 forKeys:(id)a4;
- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5;
- (void)_setValueForKeys:(id)a3 settingBlock:(id)a4;
- (void)_updateChild:(id)a3 fraction:(_NSProgressFractionTuple *)a4 portion:(int64_t)a5;
- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3;
- (void)addChild:(NSProgress *)child withPendingUnitCount:(int64_t)inUnitCount;
- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4;
- (void)becomeCurrentWithPendingUnitCount:(int64_t)unitCount;
- (void)cancel;
- (void)cancellationHandler;
- (void)dealloc;
- (void)handleAcknowledgementByAppWithBundleIdentifier:(id)a3 usingBlock:(id)a4;
- (void)pause;
- (void)pausingHandler;
- (void)performAsCurrentWithPendingUnitCount:(int64_t)unitCount usingBlock:(void *)work;
- (void)prioritize;
- (void)publish;
- (void)resignCurrent;
- (void)resume;
- (void)resumingHandler;
- (void)setAcknowledgementHandler:(id)a3 forAppBundleIdentifier:(id)a4;
- (void)setByteCompletedCount:(id)a3;
- (void)setByteTotalCount:(id)a3;
- (void)setCancellable:(BOOL)cancellable;
- (void)setCancellationHandler:(void *)cancellationHandler;
- (void)setCompletedUnitCount:(int64_t)completedUnitCount;
- (void)setEstimatedTimeRemaining:(NSNumber *)estimatedTimeRemaining;
- (void)setFileCompletedCount:(NSNumber *)fileCompletedCount;
- (void)setFileOperationKind:(NSProgressFileOperationKind)fileOperationKind;
- (void)setFileTotalCount:(NSNumber *)fileTotalCount;
- (void)setFileURL:(NSURL *)fileURL;
- (void)setKind:(NSProgressKind)kind;
- (void)setLocalizedAdditionalDescription:(NSString *)localizedAdditionalDescription;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setPausable:(BOOL)pausable;
- (void)setPausingHandler:(void *)pausingHandler;
- (void)setPrioritizable:(BOOL)a3;
- (void)setPrioritizationHandler:(id)a3;
- (void)setResumingHandler:(void *)resumingHandler;
- (void)setThroughput:(NSNumber *)throughput;
- (void)setTotalUnitCount:(int64_t)totalUnitCount;
- (void)setUserInfoObject:(id)objectOrNil forKey:(NSProgressUserInfoKey)key;
- (void)set_adoptChildUserInfo:(BOOL)a3;
- (void)unpublish;
@end

@implementation NSProgress

+ (NSProgress)currentProgress
{
  result = (NSProgress *)_CFGetTSD();
  if (result) {
    return (NSProgress *)result->super.isa;
  }
  return result;
}

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount
{
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParent:userInfo:", objc_msgSend(a1, "currentProgress"), 0);
  [v4 setTotalUnitCount:unitCount];
  return (NSProgress *)v4;
}

+ (NSProgress)discreteProgressWithTotalUnitCount:(int64_t)unitCount
{
  v4 = (void *)[objc_alloc((Class)a1) initWithParent:0 userInfo:0];
  [v4 setTotalUnitCount:unitCount];
  return (NSProgress *)v4;
}

- (NSProgress)init
{
  return -[NSProgress initWithParent:userInfo:](self, "initWithParent:userInfo:", 0LL, 0LL);
}

- (NSProgress)initWithParent:(NSProgress *)parentProgressOrNil userInfo:(NSDictionary *)userInfoOrNil
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (parentProgressOrNil && (NSProgress *)[(id)objc_opt_class() currentProgress] != parentProgressOrNil)
  {
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: The parent of an NSProgress object must be the currentProgress.",  _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v10 userInfo:0]);
    -[NSProgress dealloc](v11, v12);
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NSProgress;
    v8 = -[NSProgress init](&v13, sel_init);
    if (v8)
    {
      v8->_lock = (NSLock *)objc_opt_new();
      v8->_values = objc_alloc_init(&OBJC_CLASS___NSProgressValues);
      v8->_values->_userInfo = (NSMutableDictionary *)-[NSDictionary mutableCopy](userInfoOrNil, "mutableCopy");
      if (parentProgressOrNil) {
        -[NSProgress _addImplicitChild:](parentProgressOrNil, "_addImplicitChild:", v8);
      }
    }

    return v8;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  objc_storeWeak((id *)&self->_parent, 0LL);
  -[NSOwnedDictionaryProxy superRelease](self->_userInfoProxy, "superRelease");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProgress;
  -[NSProgress dealloc](&v3, sel_dealloc);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)unitCount
{
  v6 = (NSProgress **)_CFGetTSD();
  v7 = v6;
  if (v6 && *v6 == self)
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NSProgress object is already current on this thread %@", _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0 reason userInfo];
    objc_exception_throw(v10);
    NSProgressTSDDestroy(v11);
  }

  else
  {
    pthread_self();
    v8 = malloc_default_zone();
    v9 = malloc_zone_calloc(v8, 1uLL, 0x20uLL);
    _OWORD *v9 = 0u;
    v9[1] = 0u;
    *(void *)v9 = self;
    *((void *)v9 + 1) = v7;
    *((void *)v9 + 2) = unitCount;
    _CFSetTSD();
  }

- (void)_setParent:(id)a3 portion:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  objc_storeWeak((id *)&self->_parent, a3);
  self->_values->_portionOfParent = a4;
  __int128 v11 = 0uLL;
  *(void *)SEL v12 = 0LL;
  values = self->_values;
  if (values)
  {
    -[NSProgressValues overallFraction](values, "overallFraction");
  }

  else
  {
    __int128 v8 = 0uLL;
    *(void *)&__int128 v9 = 0LL;
  }

  *(_OWORD *)&v12[8] = v8;
  *(void *)&v12[24] = v9;
  -[NSLock unlock](self->_lock, "unlock", v8, (void)v9);
  __int128 v8 = v11;
  __int128 v9 = *(_OWORD *)v12;
  __int128 v10 = *(_OWORD *)&v12[16];
  [a3 _updateChild:self fraction:&v8 portion:a4];
}

- (id)_parent
{
  return objc_loadWeak((id *)&self->_parent);
}

- (void)addChild:(NSProgress *)child withPendingUnitCount:(int64_t)inUnitCount
{
  id v8 = -[NSProgress _parent](child, "_parent");
  if (v8)
  {
    __int128 v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NSProgress %p was already the child of another progress %p", _NSMethodExceptionProem((objc_class *)self, a2), child, v8), 0 reason userInfo];
    objc_exception_throw(v10);
    +[NSProgress progressWithTotalUnitCount:parent:pendingUnitCount:](v11, v12, v13, v14, v15);
  }

  else
  {
    -[NSLock lock](self->_lock, "lock");
    children = self->_children;
    if (!children)
    {
      children = (NSMutableSet *)(id)[MEMORY[0x189603FE0] set];
      self->_children = children;
    }

    -[NSMutableSet addObject:](children, "addObject:", child);
    -[NSLock unlock](self->_lock, "unlock");
    -[NSProgress _setParent:portion:](child, "_setParent:portion:", self, inUnitCount);
    if (-[NSProgress isCancelled](self, "isCancelled")) {
      -[NSProgress cancel](child, "cancel");
    }
    if (-[NSProgress isPaused](self, "isPaused")) {
      -[NSProgress pause](child, "pause");
    }
  }

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount parent:(NSProgress *)parent pendingUnitCount:(int64_t)portionOfParentTotalUnitCount
{
  id v8 = -[NSProgress initWithParent:userInfo:]( objc_alloc(&OBJC_CLASS___NSProgress),  "initWithParent:userInfo:",  0LL,  0LL);
  -[NSProgress setTotalUnitCount:](v8, "setTotalUnitCount:", unitCount);
  -[NSProgress addChild:withPendingUnitCount:]( parent,  "addChild:withPendingUnitCount:",  v8,  portionOfParentTotalUnitCount);
  return v8;
}

- (void)_addImplicitChild:(id)a3
{
  uint64_t v5 = _CFGetTSD();
  if (!*(_BYTE *)(v5 + 24))
  {
    uint64_t v6 = v5;
    -[NSProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", a3, *(void *)(v5 + 16));
    *(_BYTE *)(v6 + 24) = 1;
  }

- (void)resignCurrent
{
  uint64_t v4 = (NSProgress **)_CFGetTSD();
  if (v4 && (uint64_t v5 = v4, *v4 == self))
  {
    pthread_self();
    if (!*((_BYTE *)v5 + 24)) {
      -[NSProgress _addCompletedUnitCount:](self, "_addCompletedUnitCount:", v5[2]);
    }
    _CFSetTSD();

    free(v5);
  }

  else
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NSProgress was not the current progress on this thread %@", _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0 reason userInfo];
    objc_exception_throw(v6);
    -[NSProgress performAsCurrentWithPendingUnitCount:usingBlock:](v7, v8, v9, v10);
  }

- (void)performAsCurrentWithPendingUnitCount:(int64_t)unitCount usingBlock:(void *)work
{
}

- (BOOL)_adoptChildUserInfo
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)set_adoptChildUserInfo:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = self->_flags | 2;
  }
  else {
    unint64_t v3 = -3LL;
  }
  self->_flags = v3;
}

- (void)_notifyRemoteObserversOfUserInfoValueForKey:(id)a3
{
  if (self->_publisherID)
  {
    uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_values->_userInfo, "objectForKey:");
    if (objc_lookUpClass("NSImage"))
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v5 = (void *)[v5 performSelector:sel_TIFFRepresentation];
        a3 = (id)[a3 stringByAppendingString:@".data"];
      }
    }

    objc_msgSend( (id)objc_msgSend( +[NSProgress _serverConnection](NSProgress, "_serverConnection", v6),  "remoteObjectProxy"),  "observePublisherUserInfoForID:value:forKey:",  self->_publisherID,  v5,  a3);
  }

- (void)_notifyRemoteObserversOfValueForKeys:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (self->_publisherID)
  {
    v23 = (void *)[MEMORY[0x189603FA8] array];
    v22 = (void *)[MEMORY[0x189603FA8] array];
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v25 = *(void *)v32;
      *(void *)&__int128 v5 = 134218242LL;
      __int128 v21 = v5;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * v7);
          lastNotificationTimesByKey = self->_lastNotificationTimesByKey;
          if (!lastNotificationTimesByKey)
          {
            lastNotificationTimesByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
            self->_lastNotificationTimesByKey = lastNotificationTimesByKey;
          }

          objc_msgSend( (id)-[NSMutableDictionary objectForKeyedSubscript:]( lastNotificationTimesByKey,  "objectForKeyedSubscript:",  v8,  v21),  "doubleValue");
          double v11 = v10;
          -[NSProcessInfo systemUptime]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "systemUptime");
          double v13 = v12;
          if (qword_18C496248 != -1) {
            dispatch_once(&qword_18C496248, &__block_literal_global_245);
          }
          int v14 = [(id)qword_18C496250 containsObject:v8];
          values = self->_values;
          int64_t completed = values->_selfFraction.completed;
          if (!completed) {
            goto LABEL_19;
          }
          if (v13 - v11 > 0.0166666667 || completed == values->_selfFraction.total) {
            int v14 = 1;
          }
          if (v14 != 1)
          {
            if (qword_18C496230 != -1) {
              dispatch_once(&qword_18C496230, &__block_literal_global_90);
            }
            v20 = (os_log_s *)_MergedGlobals_25_1;
            if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              v27 = self;
              __int16 v28 = 2114;
              uint64_t v29 = v8;
              _os_log_debug_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_DEBUG,  "<NSProgress %p> Dropped remote update for key %{public}@ due to throttling",  buf,  0x16u);
            }
          }

          else
          {
LABEL_19:
            uint64_t v18 = -[NSProgressValues valueForKey:](values, "valueForKey:", v8);
            if (v18)
            {
              objc_msgSend(v23, "addObject:", v18, v19);
              [v22 addObject:v8];
              -[NSMutableDictionary setObject:forKeyedSubscript:]( lastNotificationTimesByKey,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13),  v8);
            }
          }

          ++v7;
        }

        while (v6 != v7);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }

      while (v6);
    }

    if ([v23 count]) {
      objc_msgSend( (id)objc_msgSend( +[NSProgress _serverConnection](NSProgress, "_serverConnection"),  "remoteObjectProxy"),  "observePublisherForID:values:forKeys:",  self->_publisherID,  v23,  v22);
    }
  }

id __51__NSProgress__notifyRemoteObserversOfValueForKeys___block_invoke()
{
  id result = +[NSProgressValues _importantKeys](&OBJC_CLASS___NSProgressValues, "_importantKeys");
  qword_18C496250 = (uint64_t)result;
  return result;
}

- (void)_setValueForKeys:(id)a3 settingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  uint64_t v7 = (void *)(*((uint64_t (**)(id, NSProgressValues *))a3 + 2))(a3, self->_values);
  -[NSLock unlock](self->_lock, "unlock");
  if (v7)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[NSProgress willChangeValueForKey:]( self,  "willChangeValueForKey:",  *(void *)(*((void *)&v14 + 1) + 8 * v11++));
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }

      while (v9);
    }

    -[NSLock lock](self->_lock, "lock");
    (*((void (**)(id, NSProgressValues *))a4 + 2))(a4, self->_values);
    -[NSProgress _notifyRemoteObserversOfValueForKeys:](self, "_notifyRemoteObserversOfValueForKeys:", v7);
    -[NSLock unlock](self->_lock, "unlock");
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __44__NSProgress__setValueForKeys_settingBlock___block_invoke;
  v12[3] = &unk_189CA3C80;
  v12[4] = self;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v12];
}

uint64_t __44__NSProgress__setValueForKeys_settingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didChangeValueForKey:a2];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if ((_NSProgressFractionIsEqual(&a3->var0.completed, &a3->var1.completed) & 1) == 0)
  {
    id v5 = -[NSProgress _parent](self, "_parent");
    int64_t portionOfParent = self->_values->_portionOfParent;
    __int128 v7 = *(_OWORD *)&a3->var0.overflowed;
    v8[0] = *(_OWORD *)&a3->var0.completed;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a3->var1.total;
    [v5 _updateChild:self fraction:v8 portion:portionOfParent];
  }

- (void)setTotalUnitCount:(int64_t)totalUnitCount
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  double v13 = &v12;
  uint64_t v14 = 0x5010000000LL;
  __int128 v15 = &unk_183A8509D;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v6[6] = totalUnitCount;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__NSProgress_setTotalUnitCount___block_invoke;
  v7[3] = &unk_189CA62C0;
  v7[4] = self;
  v7[5] = totalUnitCount;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32__NSProgress_setTotalUnitCount___block_invoke_2;
  v6[3] = &unk_189CA62E8;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    __int128 v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void *__32__NSProgress_setTotalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a2 + 16), *(void *)(a1 + 40));
}

double __32__NSProgress_setTotalUnitCount___block_invoke_2(void *a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [a2 overallFraction];
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  *(void *)(v4 + 48) = v15;
  *(_OWORD *)(v4 + 32) = v14;
  uint64_t v5 = a2[3];
  uint64_t v6 = a1[6];
  if (v5 >= 1 && v5 != v6)
  {
    v12[0] = a2[3];
    v12[1] = v6;
    char v13 = 0;
    _NSProgressFractionMultiplyByFraction(a2 + 5, v12);
    uint64_t v6 = a1[6];
  }

  a2[3] = v6;
  [a2 overallFraction];
  uint64_t v8 = *(void *)(a1[4] + 8LL);
  double result = *(double *)&v10;
  *(_OWORD *)(v8 + 56) = v10;
  *(void *)(v8 + 72) = v11;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  return result;
}

- (int64_t)totalUnitCount
{
  int64_t total = self->_values->_selfFraction.total;
  -[NSLock unlock](self->_lock, "unlock");
  return total;
}

- (void)setCompletedUnitCount:(int64_t)completedUnitCount
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x5010000000LL;
  uint64_t v15 = &unk_183A8509D;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v6[6] = completedUnitCount;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &unk_189CA62C0;
  v7[4] = self;
  v7[5] = completedUnitCount;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__NSProgress_setCompletedUnitCount___block_invoke_2;
  v6[3] = &unk_189CA62E8;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    __int128 v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void *__36__NSProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40), *(void *)(a2 + 24));
}

double __36__NSProgress_setCompletedUnitCount___block_invoke_2(void *a1, void *a2)
{
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] = a1[6];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8LL);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  return result;
}

- (void)_addCompletedUnitCount:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x5010000000LL;
  uint64_t v15 = &unk_183A8509D;
  uint64_t v8 = 0LL;
  __int128 v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v6[6] = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __37__NSProgress__addCompletedUnitCount___block_invoke;
  v7[3] = &unk_189CA62C0;
  v7[4] = self;
  v7[5] = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __37__NSProgress__addCompletedUnitCount___block_invoke_2;
  v6[3] = &unk_189CA62E8;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    __int128 v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void *__37__NSProgress__addCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40) + *(void *)(a2 + 16), *(void *)(a2 + 24));
}

double __37__NSProgress__addCompletedUnitCount___block_invoke_2(void *a1, void *a2)
{
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] += a1[6];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8LL);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  return result;
}

- (void)_setCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x5010000000LL;
  uint64_t v16 = &unk_183A8509D;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke;
  _OWORD v8[3] = &unk_189CA6310;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2;
  v7[3] = &unk_189CA6338;
  void v7[6] = a3;
  v7[7] = a4;
  v7[4] = &v13;
  v7[5] = &v9;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v8, v7);
  if (*((_BYTE *)v10 + 24))
  {
    __int128 v5 = *((_OWORD *)v14 + 3);
    v6[0] = *((_OWORD *)v14 + 2);
    v6[1] = v5;
    v6[2] = *((_OWORD *)v14 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v6);
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

void *__52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

double __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2(void *a1, void *a2)
{
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] = a1[6];
  a2[3] = a1[7];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8LL);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  return result;
}

- (void)_updateChild:(id)a3 fraction:(_NSProgressFractionTuple *)a4 portion:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x5010000000LL;
  v26 = &unk_183A8509D;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke;
  v15[3] = &__block_descriptor_88_e35___NSArray_16__0__NSProgressValues_8l;
  v15[4] = a5;
  __int128 v6 = *(_OWORD *)&a4->var0.completed;
  __int128 v7 = *(_OWORD *)&a4->var1.total;
  __int128 v8 = *(_OWORD *)&a4->var0.completed;
  __int128 v17 = *(_OWORD *)&a4->var0.overflowed;
  __int128 v18 = v7;
  __int128 v16 = v6;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke_2;
  v11[3] = &unk_189CA6380;
  v11[7] = &v19;
  v11[8] = a5;
  __int128 v14 = *(_OWORD *)&a4->var1.total;
  __int128 v13 = v17;
  __int128 v12 = v8;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v23;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v15, v11);
  if (*((_BYTE *)v20 + 24))
  {
    __int128 v9 = *((_OWORD *)v24 + 3);
    v10[0] = *((_OWORD *)v24 + 2);
    v10[1] = v9;
    v10[2] = *((_OWORD *)v24 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v10);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void *__44__NSProgress__updateChild_fraction_portion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v32 = *(_OWORD *)(a2 + 40);
  uint64_t v33 = *(void *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a1 + 40);
  v30[0] = *(void *)(a1 + 32);
  v30[1] = v5;
  char v31 = 0;
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if ((v7 & 0x8000000000000000LL) == 0)
    {
      if (v7 | v6)
      {
        *(void *)&__int128 v28 = v6;
        *((void *)&v28 + 1) = v7;
        char v29 = *(_BYTE *)(a1 + 56);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionSubtractFraction((uint64_t)&v32, (uint64_t *)&v28);
      }
    }
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if ((v8 & 0x8000000000000000LL) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 72);
    if ((v9 & 0x8000000000000000LL) == 0)
    {
      if (v9 | v8)
      {
        *(void *)&__int128 v28 = *(void *)(a1 + 64);
        *((void *)&v28 + 1) = v9;
        char v29 = *(_BYTE *)(a1 + 80);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionAddFraction((uint64_t)&v32, (uint64_t *)&v28);
      }
    }
  }

  __int128 v28 = v32;
  char v29 = v33;
  _NSProgressFractionAddFraction((uint64_t)&v28, (uint64_t *)(a2 + 16));
  [(id)a2 overallFraction];
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  BOOL v12 = v10 >= v11;
  if (v11 <= 0) {
    BOOL v12 = 0;
  }
  if (!v11) {
    BOOL v12 = 1;
  }
  if (v10 >= 1 && v12)
  {
    __int128 v25 = *(_OWORD *)(a2 + 16);
    uint64_t v26 = *(void *)(a2 + 32);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      *(void *)&__int128 v25 = v25 + v13;
      [v4 addObject:@"completedUnitCount"];
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
    }

    v23[0] = v10;
    v23[1] = v11;
    char v24 = *(_BYTE *)(a1 + 80);
    _NSProgressFractionMultiplyByFraction(v23, v30);
    __int128 v21 = v32;
    char v22 = v33;
    _NSProgressFractionSubtractFraction((uint64_t)&v21, v23);
    _NSProgressFractionAddFraction((uint64_t)&v25, (uint64_t *)&v21);
    int v14 = (uint64_t)v25 >= 1 && (uint64_t)v25 >= *((uint64_t *)&v25 + 1) && *((uint64_t *)&v25 + 1) > 0
       || (uint64_t)v25 > 0 && *((void *)&v25 + 1) == 0LL;
    uint64_t v16 = *(void *)(a2 + 16);
    uint64_t v17 = *(void *)(a2 + 24);
    if (v16 >= 1 && v16 >= v17 && v17 >= 1)
    {
      if ((v14 & 1) != 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }

    int v20 = v16 > 0 && v17 == 0;
    if (v14 != v20) {
LABEL_33:
    }
      [v4 addObject:@"finished"];
  }

double __44__NSProgress__updateChild_fraction_portion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  [a2 overallFraction];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  *(_OWORD *)(v4 + 32) = v25;
  *(void *)(v4 + 48) = v26;
  uint64_t v5 = a2[3];
  *(void *)&__int128 v23 = *(void *)(a1 + 64);
  *((void *)&v23 + 1) = v5;
  char v24 = 0;
  uint64_t v6 = (uint64_t *)(a1 + 96);
  __int128 v21 = *(_OWORD *)(a1 + 72);
  char v22 = *(_BYTE *)(a1 + 88);
  _NSProgressFractionMultiplyByFraction((uint64_t *)&v21, (uint64_t *)&v23);
  uint64_t v7 = *(void *)(a1 + 72);
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 80);
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      if (v8 | v7) {
        _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v21);
      }
    }
  }

  uint64_t v9 = *v6;
  if ((*v6 & 0x8000000000000000LL) == 0)
  {
    uint64_t v10 = *(void *)(a1 + 104);
    if ((v10 & 0x8000000000000000LL) == 0)
    {
      if (v10 | v9)
      {
        *(void *)&__int128 v19 = *v6;
        *((void *)&v19 + 1) = v10;
        char v20 = *(_BYTE *)(a1 + 112);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)&v23);
        _NSProgressFractionAddFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
        uint64_t v9 = *(void *)(a1 + 96);
      }
    }
  }

  uint64_t v11 = *(void *)(a1 + 104);
  BOOL v12 = v11 == 0;
  BOOL v13 = v11 > 0 && v9 >= v11;
  if (v12) {
    BOOL v13 = 1;
  }
  if (v9 >= 1 && v13)
  {
    [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      a2[2] += v14;
      __int128 v19 = v23;
      char v20 = v24;
      _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)(a1 + 96));
      _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
    }
  }

  [a2 overallFraction];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  double result = *(double *)&v17;
  *(_OWORD *)(v15 + 56) = v17;
  *(void *)(v15 + 72) = v18;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  return result;
}

- (int64_t)completedUnitCount
{
  int64_t completed = self->_values->_selfFraction.completed;
  -[NSLock unlock](self->_lock, "unlock");
  return completed;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  v4[5] = *MEMORY[0x1895F89C0];
  v3[4] = localizedDescription;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __38__NSProgress_setLocalizedDescription___block_invoke;
  v4[3] = &unk_189CA63A8;
  v4[4] = localizedDescription;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38__NSProgress_setLocalizedDescription___block_invoke_2;
  v3[3] = &unk_189CA63D0;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__38__NSProgress_setLocalizedDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 72)) {
    return 0LL;
  }
  else {
    return &unk_189D1EF00;
  }
}

uint64_t __38__NSProgress_setLocalizedDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 72) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedDescription
{
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"kind",  @"completedUnitCount",  @"totalUnitCount",  @"fractionCompleted",  @"userInfo.NSProgressFileOperationKindKey",  @"userInfo.NSProgressFileURLKey",  @"userInfo.NSProgressFileTotalCountKey",  @"userInfo.NSProgressFileCompletedCountKey",  @"userInfo.NSProgressByteTotalCountKey",  @"userInfo.NSProgressByteCompletedCountKey",  @"userInfo.NSProgressFileDisplayNameKey",  0);
}

- (NSString)localizedDescription
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  uint64_t v4 = values->_localizedDescription;
  if (!v4)
  {
    if (!-[NSString isEqualToString:](values->_kind, "isEqualToString:", @"NSProgressKindFile"))
    {
      int64_t completed = values->_selfFraction.completed;
      if (completed < 0
        || ((total = values->_selfFraction.total, uint64_t v14 = total | completed, total >= 1) ? (v15 = v14 == 0) : (v15 = 1),
            v15))
      {
        -[NSLock unlock](self->_lock, "unlock");
        return (NSString *)&stru_189CA6A28;
      }

      -[NSProgressValues fractionCompleted](values, "fractionCompleted");
      double v20 = v19;
      uint64_t v21 = -[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressLocalizedDescriptionPercentCompleteFormatterKey");
      if (!v21 || (char v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (qword_18C496298 != -1) {
          dispatch_once(&qword_18C496298, &__block_literal_global_669);
        }
        char v22 = (void *)qword_18C4962A0;
      }

      __int128 v23 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"%@ completed" value:&stru_189CA6A28 table:@"Progress"],  objc_msgSend( v22,  "stringFromNumber:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20)),  v32);
      goto LABEL_60;
    }

    uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressFileDisplayNameKey");
    v33[0] = v6;
    if ((_NSIsNSString() & 1) == 0)
    {
      uint64_t v6 = 0LL;
      v33[0] = 0LL;
    }

    if (![v6 length])
    {
      uint64_t v6 = 0LL;
      v33[0] = 0LL;
    }

    uint64_t v7 = (__objc2_class **)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressFileTotalCountKey");
    else {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", @"NSProgressFileURLKey");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v9 = 0LL;
    }
    if (!v8 || [v8 longLongValue] <= 1)
    {
      if (!v6)
      {
        uint64_t v7 = v8;
        if (!v9) {
          goto LABEL_17;
        }
        if (([v9 getResourceValue:v33 forKey:*MEMORY[0x189603CE0] error:0] & 1) == 0) {
          v33[0] = 0LL;
        }
      }

      uint64_t v7 = &off_189D0ED38;
    }

- (void)setLocalizedAdditionalDescription:(NSString *)localizedAdditionalDescription
{
  v4[5] = *MEMORY[0x1895F89C0];
  v3[4] = localizedAdditionalDescription;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke;
  v4[3] = &unk_189CA63A8;
  v4[4] = localizedAdditionalDescription;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2;
  v3[3] = &unk_189CA63D0;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__48__NSProgress_setLocalizedAdditionalDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 80)) {
    return 0LL;
  }
  else {
    return &unk_189D1EF18;
  }
}

uint64_t __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 80) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedAdditionalDescription
{
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"kind",  @"completedUnitCount",  @"fractionCompleted",  @"totalUnitCount",  @"userInfo.NSProgressFileOperationKindKey",  @"userInfo.NSProgressFileTotalCountKey",  @"userInfo.NSProgressFileCompletedCountKey",  @"userInfo.NSProgressByteTotalCountKey",  @"userInfo.NSProgressByteCompletedCountKey",  @"userInfo.NSProgressEstimatedTimeRemainingKey",  @"userInfo.NSProgressThroughputKey",  0);
}

- (NSString)localizedAdditionalDescription
{
  values = self->_values;
  uint64_t v4 = values->_localizedAdditionalDescription;
  if (v4)
  {
    uint64_t v5 = v4;
LABEL_3:
    -[NSLock unlock](self->_lock, "unlock");
    return v5;
  }

  uint64_t v7 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressByteTotalCountKey");
  uint64_t v8 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressByteCompletedCountKey");
  if (-[NSString isEqualToString:](values->_kind, "isEqualToString:", @"NSProgressKindFile")
    || (v8 ? (BOOL v9 = v7 == 0LL) : (BOOL v9 = 1), !v9))
  {
    locked = (NSString *)_lockedLocalizedTimeRemaining((uint64_t)values);
    int v11 = _localizedAppendedTimeRemaining(locked);
    BOOL v12 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressUseItemDescriptionKey");
    else {
      int v13 = 0;
    }
    uint64_t v14 = -[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressLocalizedDescriptionFileSizeFormatterOptionsKey");
    else {
      unint64_t v16 = 0x1000000LL;
    }
    if (-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", @"NSProgressThroughputKey")
      && (__int128 v17 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressThroughputKey"),  _NSIsNSNumber()))
    {
      uint64_t v18 = [v17 unsignedLongLongValue];
      double v19 = locked;
      double v20 = v11;
      int v21 = v13;
      uint64_t v22 = [(id)_NSFoundationBundle() localizedStringForKey:@"%@/s" value:&stru_189CA6A28 table:@"Progress"];
      __int128 v23 = NSLocalizedFileSizeDescription(v18, 0LL, v16);
      uint64_t v24 = v22;
      int v13 = v21;
      int v11 = v20;
      locked = v19;
      uint64_t v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v23);
      if (!v7) {
        goto LABEL_24;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
      if (!v7) {
        goto LABEL_24;
      }
    }

    if (v8)
    {
      uint64_t total = [v7 longLongValue];
      uint64_t completed = [v8 longLongValue];
LABEL_25:
      uint64_t v27 = 0LL;
      __int128 v28 = 0LL;
      if (total && completed <= total)
      {
        __int128 v28 = NSLocalizedFileSizeDescription(completed, 0LL, v16);
        uint64_t v27 = NSLocalizedFileSizeDescription(total, 0LL, v16);
      }

      char v29 = (void *)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressFileOperationKindKey");
      if (([v29 isEqualToString:@"NSProgressFileOperationKindDownloading"] & 1) != 0
        || ([v29 isEqualToString:@"NSProgressFileOperationKindUploading"] & 1) != 0)
      {
        if (!v28) {
          goto LABEL_43;
        }
      }

      else if (![v29 isEqualToString:@"NSProgressFileOperationKindReceiving"] {
             || !v28)
      }
      {
        goto LABEL_38;
      }

      if (v27 && v5)
      {
        uint64_t v5 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"%@ of %@ (%@)" value:&stru_189CA6A28 table:@"Progress"],  v28,  v27,  v5);
        if (!v11) {
          goto LABEL_59;
        }
        v30 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v5, v11);
LABEL_58:
        uint64_t v5 = v30;
LABEL_59:
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_60;
      }

- (BOOL)isFinished
{
  values = self->_values;
  uint64_t completed = values->_selfFraction.completed;
  int64_t total = values->_selfFraction.total;
  BOOL v7 = completed > 0 && total == 0;
  BOOL v10 = completed >= 1 && completed >= total && total > 0 || v7;
  -[NSLock unlock](self->_lock, "unlock");
  return v10;
}

- (void)setCancellable:(BOOL)cancellable
{
  BOOL v3 = cancellable;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__NSProgress_setCancellable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v8 = cancellable;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __29__NSProgress_setCancellable___block_invoke_2;
  _OWORD v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v6 = cancellable;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v5);
  [objc_loadWeak((id *)&self->_parent) _setCancellable:v3 fromChild:1];
}

void *__29__NSProgress_setCancellable___block_invoke(uint64_t a1, uint64_t a2)
{
  else {
    return &unk_189D1EF30;
  }
}

uint64_t __29__NSProgress_setCancellable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 104) = *(_BYTE *)(result + 32);
  return result;
}

- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!v4 || (self->_flags & 2) != 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    [objc_loadWeak((id *)&self->_parent) _setCancellable:v5 fromChild:1];
  }

  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }

- (BOOL)isCancellable
{
  BOOL isCancellable = self->_values->_isCancellable;
  -[NSLock unlock](self->_lock, "unlock");
  return isCancellable;
}

- (void)setPausable:(BOOL)pausable
{
  BOOL v3 = pausable;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __26__NSProgress_setPausable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v8 = pausable;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __26__NSProgress_setPausable___block_invoke_2;
  _OWORD v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v6 = pausable;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v5);
  [objc_loadWeak((id *)&self->_parent) _setPausable:v3 fromChild:1];
}

void *__26__NSProgress_setPausable___block_invoke(uint64_t a1, uint64_t a2)
{
  else {
    return &unk_189D1EF48;
  }
}

uint64_t __26__NSProgress_setPausable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 105) = *(_BYTE *)(result + 32);
  return result;
}

- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!v4 || (self->_flags & 2) != 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    [objc_loadWeak((id *)&self->_parent) _setPausable:v5 fromChild:1];
  }

  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }

- (BOOL)isPausable
{
  BOOL isPausable = self->_values->_isPausable;
  -[NSLock unlock](self->_lock, "unlock");
  return isPausable;
}

- (BOOL)isCancelled
{
  BOOL isCancelled = self->_values->_isCancelled;
  -[NSLock unlock](self->_lock, "unlock");
  return isCancelled;
}

- (BOOL)isPaused
{
  BOOL isPaused = self->_values->_isPaused;
  -[NSLock unlock](self->_lock, "unlock");
  return isPaused;
}

- (void)setCancellationHandler:(void *)cancellationHandler
{
  id v5 = self->_cancellationHandler;
  if (v5 != cancellationHandler)
  {

    cancellationHandler = (void *)[cancellationHandler copy];
    self->_cancellationHandler = cancellationHandler;
  }

  if (self->_values->_isCancelled && cancellationHandler != 0LL)
  {
    qos_class_t v7 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v7, 0LL);
    dispatch_async(global_queue, self->_cancellationHandler);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)cancellationHandler
{
  id v3 = self->_cancellationHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setPausingHandler:(void *)pausingHandler
{
  id v5 = self->_pausingHandler;
  if (v5 != pausingHandler)
  {

    pausingHandler = (void *)[pausingHandler copy];
    self->_pausingHandler = pausingHandler;
  }

  if (self->_values->_isPaused && pausingHandler != 0LL)
  {
    qos_class_t v7 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v7, 0LL);
    dispatch_async(global_queue, self->_pausingHandler);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)pausingHandler
{
  id v3 = self->_pausingHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setResumingHandler:(void *)resumingHandler
{
  id v5 = self->_resumingHandler;
  if (v5 != resumingHandler)
  {

    self->_resumingHandler = (id)[resumingHandler copy];
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)resumingHandler
{
  id v3 = self->_resumingHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5
{
  BOOL v5 = a5;
  -[NSLock lock](self->_lock, "lock");
  if (v5 && (self->_flags & 2) == 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    return;
  }

  BOOL v12 = self->_userInfoProxy;
  -[NSLock unlock](self->_lock, "unlock");
  id v9 = a4;
  -[NSOwnedDictionaryProxy willChangeValueForKey:](v12, "willChangeValueForKey:", v9);
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    values->_userInfo = userInfo;
    if (a3) {
      goto LABEL_8;
    }
LABEL_10:
    -[NSMutableDictionary removeObjectForKey:](userInfo, "removeObjectForKey:", a4);
    goto LABEL_11;
  }

  if (!a3) {
    goto LABEL_10;
  }
LABEL_8:
  -[NSMutableDictionary setObject:forKey:](userInfo, "setObject:forKey:", a3, a4);
LABEL_11:
  -[NSProgress _notifyRemoteObserversOfUserInfoValueForKey:](self, "_notifyRemoteObserversOfUserInfoValueForKey:", a4);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(-[NSProgress _parent](self, "_parent"), "_setUserInfoValue:forKey:fromChild:", a3, a4, 1);
  -[NSOwnedDictionaryProxy didChangeValueForKey:](v12, "didChangeValueForKey:", v9);
}

- (void)setUserInfoObject:(id)objectOrNil forKey:(NSProgressUserInfoKey)key
{
}

- (id)_indentedDescription:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  BOOL v5 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      -[NSString appendString:](v5, "appendString:", @"  ");
      --v6;
    }

    while (v6);
  }

  values = self->_values;
  BOOL v8 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NSProgress;
  id v9 = -[NSProgress description](&v22, sel_description);
  id v10 = -[NSProgress _parent](self, "_parent");
  int64_t portionOfParent = values->_portionOfParent;
  -[NSProgressValues fractionCompleted](values, "fractionCompleted");
  if (values->_isCancelled) {
    int v13 = "CANCELLED";
  }
  else {
    int v13 = "";
  }
  if (values->_isPaused) {
    uint64_t v14 = "PAUSED";
  }
  else {
    uint64_t v14 = "";
  }
  -[NSString appendFormat:]( v8,  "appendFormat:",  @"%@%@ : Parent: %p (portion: %lld) / Fraction completed: %0.4f / Completed: %lld of %lld %s %s",  v5,  v9,  v10,  portionOfParent,  v12,  values->_selfFraction.completed,  values->_selfFraction.total,  v13,  v14);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  children = self->_children;
  uint64_t v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    unint64_t v19 = a3 + 1;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(children);
        }
        -[NSString appendFormat:]( v8,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v24 + 1) + 8 * i) _indentedDescription:v19]);
      }

      uint64_t v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
    }

    while (v17);
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)-[NSProgress _indentedDescription:](self, "_indentedDescription:", 0LL);
}

- (BOOL)isIndeterminate
{
  values = self->_values;
  int64_t completed = values->_selfFraction.completed;
  if (completed < 0)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t total = values->_selfFraction.total;
    BOOL v6 = (total | completed) == 0;
    BOOL v7 = total < 0 || v6;
  }

  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

- (double)fractionCompleted
{
  double v4 = v3;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)cancel
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[NSProgress _setValueForKeys:settingBlock:]( self,  "_setValueForKeys:settingBlock:",  &__block_literal_global_297,  &__block_literal_global_300_0);
  -[NSLock lock](self->_lock, "lock");
  id cancellationHandler = self->_cancellationHandler;
  if (cancellationHandler)
  {
    id v4 = cancellationHandler;
    qos_class_t v5 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v5, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __20__NSProgress_cancel__block_invoke_3;
    block[3] = &unk_189C9DCE8;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  children = self->_children;
  uint64_t v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) cancel];
      }

      uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    }

    while (v9);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

void *__20__NSProgress_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 106)) {
    return 0LL;
  }
  else {
    return &unk_189D1EF60;
  }
}

void __20__NSProgress_cancel__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 106) = 1;
}

void __20__NSProgress_cancel__block_invoke_3(uint64_t a1)
{
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NSProgress _setValueForKeys:settingBlock:]( self,  "_setValueForKeys:settingBlock:",  &__block_literal_global_301_0,  &__block_literal_global_304_0);
  -[NSLock lock](self->_lock, "lock");
  if (self->_pausingHandler)
  {
    qos_class_t v3 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v3, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __19__NSProgress_pause__block_invoke_3;
    block[3] = &unk_189C9A030;
    block[4] = self;
    dispatch_async(global_queue, block);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  children = self->_children;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) pause];
      }

      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v7);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

void *__19__NSProgress_pause__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 107)) {
    return 0LL;
  }
  else {
    return &unk_189D1EF78;
  }
}

void __19__NSProgress_pause__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 107) = 1;
}

uint64_t __19__NSProgress_pause__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40LL) + 16LL))();
}

- (void)resume
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NSProgress _setValueForKeys:settingBlock:]( self,  "_setValueForKeys:settingBlock:",  &__block_literal_global_305,  &__block_literal_global_308_0);
  -[NSLock lock](self->_lock, "lock");
  if (self->_resumingHandler)
  {
    qos_class_t v3 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v3, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __20__NSProgress_resume__block_invoke_3;
    block[3] = &unk_189C9A030;
    block[4] = self;
    dispatch_async(global_queue, block);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  children = self->_children;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) resume];
      }

      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v7);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

void *__20__NSProgress_resume__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 107)) {
    return &unk_189D1EF90;
  }
  else {
    return 0LL;
  }
}

void __20__NSProgress_resume__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 107) = 0;
}

uint64_t __20__NSProgress_resume__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 16LL))();
}

- (NSDictionary)userInfo
{
  userInfoProxy = self->_userInfoProxy;
  if (!userInfoProxy)
  {
    userInfoProxy = -[NSOwnedDictionaryProxy initWithOwner:]( objc_alloc(&OBJC_CLASS___NSOwnedDictionaryProxy),  "initWithOwner:",  self);
    self->_userInfoProxy = userInfoProxy;
  }

  id v4 = userInfoProxy;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (unint64_t)ownedDictionaryCount
{
  unint64_t v3 = -[NSMutableDictionary count](self->_values->_userInfo, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)ownedDictionaryKeyEnumerator
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    values->_userInfo = userInfo;
  }

  qos_class_t v5 = (void *)-[NSMutableDictionary allKeys](userInfo, "allKeys");
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  __int128 v14 = __Block_byref_object_copy__34;
  __int128 v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0LL;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke;
  _OWORD v10[3] = &unk_189C9E118;
  v10[4] = v5;
  v10[5] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v6 = (void *)v12[5];
  if (v6)
  {
    id v7 = (id)[v6 objectEnumerator];
  }

  else
  {
    id v7 = (id)-[NSMutableDictionary keyEnumerator](values->_userInfo, "keyEnumerator");
  }

  -[NSLock unlock](self->_lock, "unlock");
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  return v8;
}

void *__42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if ([a2 hasSuffix:@".data"])
  {
    id v4 = (void *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 5);
    uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!result)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 32),  "subarrayWithRange:",  0,  a3),  "mutableCopy");
      uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }
  }

  else
  {
    uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!result) {
      return result;
    }
  }

  return (void *)[result addObject:v4];
}

- (id)ownedDictionaryObjectForKey:(id)a3
{
  values = self->_values;
  id v6 = (id)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", a3);
  if (!v6)
  {
    if ([a3 isEqualToString:@"NSProgressPhysicalFileURLKey"])
    {
      id v7 = (id)-[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  @"NSProgressFileURLKey");
    }

    else
    {
      uint64_t v8 = -[NSMutableDictionary objectForKey:]( values->_userInfo,  "objectForKey:",  [a3 stringByAppendingString:@".data"]);
      if (!v8 || (uint64_t v9 = v8, !_NSIsNSData()))
      {
        id v6 = 0LL;
        goto LABEL_9;
      }

      id v7 = (id)[objc_alloc(objc_lookUpClass("NSImage")) performSelector:sel_initWithData_ withObject:v9];
    }

    id v6 = v7;
  }

- (NSNumber)estimatedTimeRemaining
{
  return (NSNumber *)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressEstimatedTimeRemainingKey");
}

- (void)setEstimatedTimeRemaining:(NSNumber *)estimatedTimeRemaining
{
}

- (NSNumber)throughput
{
  return (NSNumber *)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressThroughputKey");
}

- (void)setThroughput:(NSNumber *)throughput
{
}

- (NSProgressFileOperationKind)fileOperationKind
{
  return (NSProgressFileOperationKind)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressFileOperationKindKey");
}

- (void)setFileOperationKind:(NSProgressFileOperationKind)fileOperationKind
{
}

- (NSURL)fileURL
{
  return (NSURL *)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressFileURLKey");
}

- (void)setFileURL:(NSURL *)fileURL
{
}

- (NSNumber)fileTotalCount
{
  return (NSNumber *)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressFileTotalCountKey");
}

- (void)setFileTotalCount:(NSNumber *)fileTotalCount
{
}

- (NSNumber)fileCompletedCount
{
  return (NSNumber *)-[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressFileCompletedCountKey");
}

- (void)setFileCompletedCount:(NSNumber *)fileCompletedCount
{
}

- (id)byteTotalCount
{
  return -[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressByteTotalCountKey");
}

- (void)setByteTotalCount:(id)a3
{
}

- (id)byteCompletedCount
{
  return -[NSDictionary objectForKey:]( -[NSProgress userInfo](self, "userInfo"),  "objectForKey:",  @"NSProgressByteCompletedCountKey");
}

- (void)setByteCompletedCount:(id)a3
{
}

- (void)setKind:(NSProgressKind)kind
{
  v4[5] = *MEMORY[0x1895F89C0];
  v3[4] = kind;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __22__NSProgress_setKind___block_invoke;
  v4[3] = &unk_189CA63A8;
  v4[4] = kind;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __22__NSProgress_setKind___block_invoke_2;
  v3[3] = &unk_189CA63D0;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__22__NSProgress_setKind___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 88)) {
    return 0LL;
  }
  else {
    return &unk_189D1EFA8;
  }
}

uint64_t __22__NSProgress_setKind___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 88) = result;
  return result;
}

- (NSProgressKind)kind
{
  unint64_t v3 = self->_values->_kind;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)publish
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  if (self->_publisherID)
  {
    -[NSLock unlock](self->_lock, "unlock");
    uint64_t v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"-[%p publish]: this instance of NSProgress has already been published and can't be published again.",  self);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v16 userInfo:0]);
  }

  self->_publisherID = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  userInfo = self->_values->_userInfo;
  id v4 = (void *)-[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", @"NSProgressCategoryKey");
  uint64_t v5 = -[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", @"NSProgressFileURLKey");
  acknowledgementHandlersByLowercaseBundleID = self->_acknowledgementHandlersByLowercaseBundleID;
  if (acknowledgementHandlersByLowercaseBundleID) {
    uint64_t v7 = objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[NSMutableDictionary allKeys](acknowledgementHandlersByLowercaseBundleID, "allKeys"));
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (qword_18C496230 != -1) {
    dispatch_once(&qword_18C496230, &__block_literal_global_90);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = (os_log_s *)_MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      *(_DWORD *)buf = 134218755;
      unint64_t v19 = self;
      __int16 v20 = 2113;
      uint64_t v21 = v5;
      __int16 v22 = 2114;
      __int128 v23 = v4;
      __int16 v24 = 2114;
      __int128 v25 = publisherID;
      _os_log_debug_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEBUG,  "<NSProgress %p> Publishing for URL %{private}@ in category %{public}@ with ID %{public}@",  buf,  0x2Au);
    }
  }

  uint64_t v11 = (void *)objc_msgSend( +[NSProgress _serverConnection](NSProgress, "_serverConnection", v8, v9),  "remoteObjectProxy");
  __int128 v12 = self->_publisherID;
  uint64_t v13 = [v4 lowercaseString];
  values = self->_values;
  v17[1] = 3221225472LL;
  v17[2] = __21__NSProgress_publish__block_invoke;
  v17[3] = &unk_189CA6538;
  v17[4] = self;
  v17[0] = MEMORY[0x1895F87A8];
  [v11 addPublisher:self forID:v12 acknowledgementAppBundleIDs:v7 category:v13 fileURL:v5 initialValues:values completionHandler:v17];
  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __21__NSProgress_publish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) appWithBundleID:*(void *)(*((void *)&v9 + 1) + 8 * v7++) didAcknowledgeWithSuccess:0];
      }

      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v5 = result;
    }

    while (result);
  }

  return result;
}

- (void)unpublish
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  if (qword_18C496230 != -1) {
    dispatch_once(&qword_18C496230, &__block_literal_global_90);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v3 = (os_log_s *)_MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      int v5 = 134218242;
      uint64_t v6 = self;
      __int16 v7 = 2114;
      uint64_t v8 = publisherID;
      _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "<NSProgress %p> Unpublishing %{public}@",  (uint8_t *)&v5,  0x16u);
    }
  }

  -[NSProgress _notifyRemoteObserversOfValueForKeys:](self, "_notifyRemoteObserversOfValueForKeys:", &unk_189D1EFC0);
  objc_msgSend( (id)objc_msgSend( +[NSProgress _serverConnection](NSProgress, "_serverConnection"),  "remoteObjectProxy"),  "removePublisherForID:",  self->_publisherID);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setAcknowledgementHandler:(id)a3 forAppBundleIdentifier:(id)a4
{
  if (!self->_acknowledgementHandlersByLowercaseBundleID) {
    self->_acknowledgementHandlersByLowercaseBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  __int16 v7 = (void *)[a3 copy];
  -[NSMutableDictionary setObject:forKey:]( self->_acknowledgementHandlersByLowercaseBundleID,  "setObject:forKey:",  v7,  [a4 lowercaseString]);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)acknowledgementHandlerForAppBundleIdentifier:(id)a3
{
  id v5 = (id)-[NSMutableDictionary objectForKey:]( self->_acknowledgementHandlersByLowercaseBundleID,  "objectForKey:",  [a3 lowercaseString]);
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  uint64_t v7 = [a3 lowercaseString];
  uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_acknowledgementHandlersByLowercaseBundleID, "objectForKey:", v7);
  if (v8)
  {
    uint64_t v9 = v8;
    qos_class_t v10 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v10, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke;
    block[3] = &unk_189CA4700;
    block[4] = v9;
    BOOL v13 = a4;
    dispatch_async(global_queue, block);
    -[NSMutableDictionary removeObjectForKey:]( self->_acknowledgementHandlersByLowercaseBundleID,  "removeObjectForKey:",  v7);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

+ (id)addSubscriberForFileURL:(NSURL *)url withPublishingHandler:(NSProgressPublishingHandler)publishingHandler
{
  id v5 = -[_NSProgressSubscriber initWithPublishingHandler:]( objc_alloc(&OBJC_CLASS____NSProgressSubscriber),  "initWithPublishingHandler:",  publishingHandler);
  -[_NSProgressSubscriber startForFileURL:](v5, "startForFileURL:", url);
  return v5;
}

+ (void)removeSubscriber:(id)subscriber
{
}

- (BOOL)isOld
{
  return 0;
}

- (id)_publishingAppBundleIdentifier
{
  return 0LL;
}

+ (id)_addSubscriberForCategory:(id)a3 usingPublishingHandler:(id)a4
{
  id v5 = -[_NSProgressSubscriber initWithPublishingHandler:]( objc_alloc(&OBJC_CLASS____NSProgressSubscriber),  "initWithPublishingHandler:",  a4);
  -[_NSProgressSubscriber startForCategory:](v5, "startForCategory:", a3);
  return v5;
}

- (void)setPrioritizable:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31__NSProgress_setPrioritizable___block_invoke;
  _OWORD v5[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v6 = a3;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__NSProgress_setPrioritizable___block_invoke_2;
  v3[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v4 = a3;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v5, v3);
}

void *__31__NSProgress_setPrioritizable___block_invoke(uint64_t a1, uint64_t a2)
{
  else {
    return &unk_189D1EFD8;
  }
}

uint64_t __31__NSProgress_setPrioritizable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 109) = *(_BYTE *)(result + 32);
  return result;
}

- (BOOL)isPrioritizable
{
  BOOL isPrioritizable = self->_values->_isPrioritizable;
  -[NSLock unlock](self->_lock, "unlock");
  return isPrioritizable;
}

- (void)setPrioritizationHandler:(id)a3
{
  id prioritizationHandler = self->_prioritizationHandler;
  if (prioritizationHandler != a3)
  {

    self->_id prioritizationHandler = (id)[a3 copy];
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)prioritizationHandler
{
  id v3 = self->_prioritizationHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)prioritize
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NSLock lock](self->_lock, "lock");
  if (self->_prioritizationHandler)
  {
    qos_class_t v3 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v3, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __24__NSProgress_prioritize__block_invoke;
    block[3] = &unk_189C9A030;
    block[4] = self;
    dispatch_async(global_queue, block);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  children = self->_children;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) prioritize];
      }

      uint64_t v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( children,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v7);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __24__NSProgress_prioritize__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48LL) + 16LL))();
}

- (void)handleAcknowledgementByAppWithBundleIdentifier:(id)a3 usingBlock:(id)a4
{
}

+ (id)_publisherInterface
{
  if (qword_18C496258 != -1) {
    dispatch_once(&qword_18C496258, &__block_literal_global_325);
  }
  return (id)qword_18C496260;
}

NSXPCInterface *__33__NSProgress__publisherInterface__block_invoke()
{
  uint64_t result =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &unk_18C655E78);
  qword_18C496260 = (uint64_t)result;
  return result;
}

+ (id)_subscriberInterface
{
  void v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34__NSProgress__subscriberInterface__block_invoke;
  v3[3] = &unk_189C9A030;
  void v3[4] = a1;
  if (qword_18C496268 != -1) {
    dispatch_once(&qword_18C496268, v3);
  }
  return (id)qword_18C496270;
}

uint64_t __34__NSProgress__subscriberInterface__block_invoke(uint64_t a1)
{
  qword_18C496270 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &unk_18C6560F0);
  objc_msgSend( (id)qword_18C496270,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"),  sel_addPublisher_forID_withValues_isOld_,  0,  0);
  objc_msgSend( (id)qword_18C496270,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"),  sel_observePublisherForID_values_forKeys_,  1,  0);
  return objc_msgSend( (id)qword_18C496270,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"),  sel_observePublisherUserInfoForID_value_forKey_,  1,  0);
}

+ (id)_registrarInterface
{
  void v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__NSProgress__registrarInterface__block_invoke;
  v3[3] = &unk_189C9A030;
  void v3[4] = a1;
  if (qword_18C496278 != -1) {
    dispatch_once(&qword_18C496278, v3);
  }
  return (id)qword_18C496280;
}

uint64_t __33__NSProgress__registrarInterface__block_invoke(uint64_t a1)
{
  qword_18C496280 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &unk_18C6563B0);
  objc_msgSend( (id)qword_18C496280,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"),  sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_,  0,  0);
  v2 = (void *)qword_18C496280;
  qos_class_t v3 = (void *)MEMORY[0x189604010];
  uint64_t v4 = objc_opt_class();
  objc_msgSend( v2,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0),  sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_,  2,  0);
  id v5 = (void *)qword_18C496280;
  uint64_t v6 = (void *)MEMORY[0x189604010];
  uint64_t v7 = objc_opt_class();
  objc_msgSend( v5,  "setClasses:forSelector:argumentIndex:ofReply:",  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0),  sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_,  0,  1);
  objc_msgSend( (id)qword_18C496280,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"),  sel_observePublisherForID_values_forKeys_,  1,  0);
  objc_msgSend( (id)qword_18C496280,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"),  sel_observePublisherUserInfoForID_value_forKey_,  1,  0);
  objc_msgSend( (id)qword_18C496280,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_subscriberInterface"),  sel_addSubscriber_forID_appBundleID_category_completionHandler_,  0,  0);
  return objc_msgSend( (id)qword_18C496280,  "setInterface:forSelector:argumentIndex:ofReply:",  objc_msgSend(*(id *)(a1 + 32), "_subscriberInterface"),  sel_addSubscriber_forID_appBundleID_fileURL_completionHandler_,  0,  0);
}

- (id)_initWithValues:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSProgress;
  uint64_t v4 = -[NSProgress init](&v8, sel_init);
  if (v4)
  {
    id v5 = (NSProgressValues *)[a3 copy];
    v4->_values = v5;
    -[NSProgressValues fractionCompleted](v5, "fractionCompleted");
    v4->_values->_remoteFractionCompleted = v6;
  }

  return v4;
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 count];
  if ([a4 count] == v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke;
    _OWORD v10[3] = &unk_189CA6580;
    v10[5] = a4;
    void v10[6] = v7;
    v10[4] = a3;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke_2;
    v9[3] = &unk_189CA65A8;
    v9[5] = a4;
    v9[6] = v7;
    v9[4] = a3;
    -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v10, v9);
  }

  else
  {
    if (qword_18C496230 != -1) {
      dispatch_once(&qword_18C496230, &__block_literal_global_90);
    }
    objc_super v8 = (os_log_s *)_MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "mismatched count of values and keys from remote progress KVO update",  buf,  2u);
    }
  }

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x189603FA8] array];
  if (*(void *)(a1 + 48))
  {
    unint64_t v5 = 0LL;
    do
    {
      double v6 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
      uint64_t v7 = (__CFString *)[*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
      if (!-[__CFString isEqualToString:](v7, "isEqualToString:", @"fractionCompleted")
        || (double v8 = *(double *)(a2 + 64), [v6 doubleValue], v8 == v9))
      {
        qos_class_t v10 = (void *)v4;
        __int128 v11 = v7;
      }

      else
      {
        qos_class_t v10 = (void *)v4;
        __int128 v11 = @"fractionCompleted";
      }

      [v10 addObject:v11];
      ++v5;
    }

    while (v5 < *(void *)(a1 + 48));
  }

  return v4;
}

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke_2(uint64_t result, void *a2)
{
  if (*(void *)(result + 48))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    do
    {
      unint64_t v5 = (void *)[*(id *)(v3 + 32) objectAtIndexedSubscript:v4];
      double v6 = (void *)[*(id *)(v3 + 40) objectAtIndexedSubscript:v4];
      if ([v6 isEqualToString:@"fractionCompleted"])
      {
        uint64_t result = [v5 doubleValue];
        a2[8] = v7;
      }

      else
      {
        uint64_t result = [a2 setValue:v5 forKey:v6];
      }

      ++v4;
    }

    while (v4 < *(void *)(v3 + 48));
  }

  return result;
}

- (double)_remoteFractionCompleted
{
  return self->_values->_remoteFractionCompleted;
}

+ (id)_serverConnection
{
  if (qword_18C496290 != -1) {
    dispatch_once(&qword_18C496290, &__block_literal_global_399);
  }
  return (id)qword_18C496288;
}

uint64_t __31__NSProgress__serverConnection__block_invoke()
{
  qword_18C496288 = +[NSFileCoordinator _createConnectionToProgressRegistrar]( &OBJC_CLASS___NSFileCoordinator,  "_createConnectionToProgressRegistrar");
  objc_msgSend( (id)qword_18C496288,  "setRemoteObjectInterface:",  +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  [(id)qword_18C496288 setOptions:4096];
  return [(id)qword_18C496288 resume];
}

- (void).cxx_destruct
{
}

- (void)_receiveProgressMessage:(void *)a1 forSequence:(xpc_object_t)xdict
{
  if (a1)
  {
    if (!xpc_dictionary_get_BOOL(xdict, "isUserInfo"))
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "totalCount");
      objc_msgSend( a1,  "_setCompletedUnitCount:totalUnitCount:",  xpc_dictionary_get_uint64(xdict, "completedCount"),  uint64);
      return;
    }

    uint64_t v4 = xpc_dictionary_get_uint64(xdict, "userInfoKey");
    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) - 1 > 1)
    {
      if (v4 - 3 > 1)
      {
        if (v4 == 8)
        {
          objc_msgSend(a1, "setPausable:", xpc_dictionary_get_BOOL(xdict, "isPausable"));
        }

        else if (v4 == 7)
        {
          objc_msgSend(a1, "setCancellable:", xpc_dictionary_get_BOOL(xdict, "isCancellable"));
        }

        qos_class_t v10 = 0LL;
LABEL_28:

        return;
      }

      uint64_t v7 = @"_NSProgressRemoteLocalizedAdditionalDescriptionKey";
      if (v4 != 4) {
        uint64_t v7 = 0LL;
      }
      if (v4 == 3) {
        unint64_t v5 = @"_NSProgressRemoteLocalizedDescriptionKey";
      }
      else {
        unint64_t v5 = v7;
      }
      string = xpc_dictionary_get_string(xdict, "userInfoVal");
      BOOL v9 = xpc_dictionary_get_BOOL(xdict, "userInfoValNil");
      qos_class_t v10 = 0LL;
      if (!string || v9)
      {
LABEL_24:
        if (v5)
        {
          uint64_t v12 = v10;
          [a1 setUserInfoObject:v10 forKey:v5];

          return;
        }

        goto LABEL_28;
      }

      __int128 v11 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
    }

    else
    {
      if (v4 - 1 > 5) {
        unint64_t v5 = 0LL;
      }
      else {
        unint64_t v5 = off_189CA6648[v4 - 1];
      }
      if (xpc_dictionary_get_BOOL(xdict, "userInfoValNil"))
      {
        qos_class_t v10 = 0LL;
        goto LABEL_24;
      }

      __int128 v11 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  xpc_dictionary_get_uint64(xdict, "userInfoVal"));
    }

    qos_class_t v10 = v11;
    goto LABEL_24;
  }

@end