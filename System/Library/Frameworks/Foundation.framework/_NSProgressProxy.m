@interface _NSProgressProxy
- (BOOL)isOld;
- (id)_initWithForwarder:(id)a3 values:(id)a4 isOld:(BOOL)a5;
- (id)byteCompletedCount;
- (id)byteTotalCount;
- (id)estimatedTimeRemaining;
- (id)fileCompletedCount;
- (id)fileOperationKind;
- (id)fileTotalCount;
- (id)fileURL;
- (id)throughput;
- (void)_invokePublishingHandler:(id)a3;
- (void)_invokeUnpublishingHandler;
- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4;
- (void)_setRemoteValues:(id)a3 forKeys:(id)a4;
- (void)acknowledgeWithSuccess:(BOOL)a3;
- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3;
- (void)cancel;
- (void)dealloc;
- (void)pause;
- (void)prioritize;
- (void)publish;
- (void)resignCurrent;
- (void)resume;
- (void)setByteCompletedCount:(id)a3;
- (void)setByteTotalCount:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setEstimatedTimeRemaining:(id)a3;
- (void)setFileCompletedCount:(id)a3;
- (void)setFileOperationKind:(id)a3;
- (void)setFileTotalCount:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setKind:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPausable:(BOOL)a3;
- (void)setPausingHandler:(id)a3;
- (void)setPrioritizable:(BOOL)a3;
- (void)setPrioritizationHandler:(id)a3;
- (void)setThroughput:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation _NSProgressProxy

- (id)_initWithForwarder:(id)a3 values:(id)a4 isOld:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSProgressProxy;
  v7 = -[NSProgress _initWithValues:](&v9, sel__initWithValues_, a4);
  if (v7)
  {
    v7[15] = a3;
    *((_BYTE *)v7 + 128) = a5;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSProgressProxy;
  -[NSProgress dealloc](&v3, sel_dealloc);
}

- (void)_invokePublishingHandler:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  Main = CFRunLoopGetMain();
  v6 = (const void *)*MEMORY[0x1896051A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45___NSProgressProxy__invokePublishingHandler___block_invoke;
  block[3] = &unk_189C9E898;
  block[4] = self;
  block[5] = a3;
  CFRunLoopPerformBlock(Main, v6, block);
  v7 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v7);
}

- (void)_invokeUnpublishingHandler
{
  v6[5] = *MEMORY[0x1895F89C0];
  Main = CFRunLoopGetMain();
  uint64_t v4 = (const void *)*MEMORY[0x1896051A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46___NSProgressProxy__invokeUnpublishingHandler__block_invoke;
  v6[3] = &unk_189C9A030;
  v6[4] = self;
  CFRunLoopPerformBlock(Main, v4, v6);
  v5 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v5);
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
  v10[7] = *MEMORY[0x1895F89C0];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1896051A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __51___NSProgressProxy__setRemoteUserInfoValue_forKey___block_invoke;
  v10[3] = &unk_189CA16F0;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  objc_super v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  v10[7] = *MEMORY[0x1895F89C0];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1896051A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __45___NSProgressProxy__setRemoteValues_forKeys___block_invoke;
  v10[3] = &unk_189CA16F0;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  objc_super v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't make an NSProgress published by another process the current one.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy resignCurrent](v4, v5);
}

- (void)resignCurrent
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't make an NSProgress published by another process the current one.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  -[_NSProgressProxy setTotalUnitCount:](v3, v4, v5);
}

- (void)setTotalUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setCompletedUnitCount:](v4, v5, v6);
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setLocalizedDescription:](v4, v5, v6);
}

- (void)setLocalizedDescription:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setCancellable:](v4, v5, v6);
}

- (void)setCancellable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setPausable:](v4, v5, v6);
}

- (void)setPausable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setCancellationHandler:](v4, v5, v6);
}

- (void)setCancellationHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setPausingHandler:](v4, v5, v6);
}

- (void)setPausingHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setPrioritizable:](v4, v5, v6);
}

- (void)setPrioritizable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setPrioritizationHandler:](v4, v5, v6);
}

- (void)setPrioritizationHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setUserInfoObject:forKey:](v4, v5, v6, v7);
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  SEL v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v4);
  -[_NSProgressProxy setKind:](v5, v6, v7);
}

- (void)setKind:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setEstimatedTimeRemaining:](v4, v5, v6);
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setThroughput:](v4, v5, v6);
}

- (void)setThroughput:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setFileOperationKind:](v4, v5, v6);
}

- (void)setFileOperationKind:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setFileURL:](v4, v5, v6);
}

- (void)setFileURL:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setFileTotalCount:](v4, v5, v6);
}

- (void)setFileTotalCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setFileCompletedCount:](v4, v5, v6);
}

- (void)setFileCompletedCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setByteTotalCount:](v4, v5, v6);
}

- (void)setByteTotalCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy setByteCompletedCount:](v4, v5, v6);
}

- (void)setByteCompletedCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
  -[_NSProgressProxy estimatedTimeRemaining](v4, v5);
}

- (id)estimatedTimeRemaining
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressEstimatedTimeRemainingKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)throughput
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressThroughputKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileOperationKind
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressFileOperationKindKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileURL
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressFileURLKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileTotalCount
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressFileTotalCountKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileCompletedCount
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressFileCompletedCountKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)byteTotalCount
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressByteTotalCountKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)byteCompletedCount
{
  id v3 = -[NSOwnedDictionaryProxy objectForKey:]( self->super._userInfoProxy,  "objectForKey:",  @"NSProgressByteCompletedCountKey");
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (void)publish
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't republish an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  JUMPOUT(0x1836F34F8LL);
}

- (void)cancel
{
}

- (void)pause
{
}

- (void)prioritize
{
}

- (void)resume
{
}

- (void)acknowledgeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  SEL v5 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"), "bundleIdentifier");
  if (v5) {
    -[NSProgressPublisher appWithBundleID:didAcknowledgeWithSuccess:]( self->_forwarder,  "appWithBundleID:didAcknowledgeWithSuccess:",  v5,  v3);
  }
}

- (BOOL)isOld
{
  return self->_isOld;
}

@end