@interface NIServerClientPublisher
+ (id)publisherForClient:(id)a3;
- (NIServerClientPublisher)initWithClient:(id)a3;
- (void)addObservers:(id)a3;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)relayDCKMessage:(id)a3;
- (void)removeObservers:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerClientPublisher

- (NIServerClientPublisher)initWithClient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIServerClientPublisher.mm", 18, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerClientPublisher;
  v7 = -[NIServerClientPublisher init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    v7->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_client, a3);
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    observers = v8->_observers;
    v8->_observers = v9;
  }

  return v8;
}

+ (id)publisherForClient:(id)a3
{
  id v3 = a3;
  v4 = -[NIServerClientPublisher initWithClient:]( objc_alloc(&OBJC_CLASS___NIServerClientPublisher),  "initWithClient:",  v3);

  return v4;
}

- (void)addObservers:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet addObjectsFromArray:](self->_observers, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObservers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableSet removeObject:]( self->_observers,  "removeObject:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8),  (void)v9);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  -[NIServerClient didDiscoverNearbyObject:](self->_client, "didDiscoverNearbyObject:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didDiscoverNearbyObject:", v4, (void)v10);
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  -[NIServerClient didRemoveNearbyObjects:withReason:](self->_client, "didRemoveNearbyObjects:withReason:", v6, a4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "didRemoveNearbyObjects:withReason:",  v6,  a4,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didUpdateHealthStatus:", a3, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NIServerClient didGenerateShareableConfigurationData:forObject:]( self->_client,  "didGenerateShareableConfigurationData:forObject:",  v6,  v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didGenerateShareableConfigurationData:forObject:",  v6,  v7,  (void)v13);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4 = a3;
  -[NIServerClient didUpdateLocalDiscoveryToken:](self->_client, "didUpdateLocalDiscoveryToken:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "didUpdateLocalDiscoveryToken:",  v4,  (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[NIServerClient didReceiveRangingAuthRecommendation:forObject:]( self->_client,  "didReceiveRangingAuthRecommendation:forObject:",  v4,  v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "didReceiveRangingAuthRecommendation:forObject:",  v4,  v6,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  -[NIServerClient didUpdateNearbyObjects:](self->_client, "didUpdateNearbyObjects:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didUpdateNearbyObjects:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[NIServerClient object:didUpdateRegion:previousRegion:]( self->_client,  "object:didUpdateRegion:previousRegion:",  v8,  v9,  v10);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v12 = self->_observers;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)v15),  "object:didUpdateRegion:previousRegion:",  v8,  v9,  v10,  (void)v16);
        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v13);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateMotionState:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didUpdateMotionState:", a3, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)relayDCKMessage:(id)a3
{
  id v4 = a3;
  -[NIServerClient relayDCKMessage:](self->_client, "relayDCKMessage:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "relayDCKMessage:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  -[NIServerClient uwbSessionDidFailWithError:](self->_client, "uwbSessionDidFailWithError:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "uwbSessionDidFailWithError:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  -[NIServerClient uwbSessionDidInvalidateWithError:](self->_client, "uwbSessionDidInvalidateWithError:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "uwbSessionDidInvalidateWithError:",  v4,  (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "uwbSessionInterruptedWithReason:timestamp:",  a3,  a4,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "uwbSessionInterruptionReasonEnded:timestamp:",  a3,  a4,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NIServerClient didUpdateAlgorithmState:forObject:](self->_client, "didUpdateAlgorithmState:forObject:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didUpdateAlgorithmState:forObject:",  v6,  v7,  (void)v13);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  -[NIServerClient didUpdateHomeDeviceUWBRangingAvailability:]( self->_client,  "didUpdateHomeDeviceUWBRangingAvailability:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "didUpdateHomeDeviceUWBRangingAvailability:",  v3,  (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NIServerClient didProcessAcwgM1MsgWithResponse:error:]( self->_client,  "didProcessAcwgM1MsgWithResponse:error:",  v6,  v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didProcessAcwgM1MsgWithResponse:error:",  v6,  v7,  (void)v13);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NIServerClient didProcessAcwgM3MsgWithResponse:error:]( self->_client,  "didProcessAcwgM3MsgWithResponse:error:",  v6,  v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didProcessAcwgM3MsgWithResponse:error:",  v6,  v7,  (void)v13);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NIServerClient didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:]( self->_client,  "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:",  v6,  v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:",  v6,  v7,  (void)v13);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  -[NIServerClient requestAcwgRangingSessionSuspend:withSuspendTriggerReason:]( self->_client,  "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:",  v5,  a4,  (void)v12);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didStartAcwgRanging:", a3, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "didSuspendAcwgRanging:", a3, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  -[NIServerClient didPrefetchAcwgUrsk:error:](self->_client, "didPrefetchAcwgUrsk:error:", v4, v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "didPrefetchAcwgUrsk:error:",  v4,  v6,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  -[NIServerClient systemDidUpdateState:](self->_client, "systemDidUpdateState:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "systemDidUpdateState:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[NIServerClient systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:]( self->_client,  "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:",  v4,  v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:",  v4,  v6,  (void)v12);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void).cxx_destruct
{
}

@end