@interface MPFaceDetector
- (BOOL)_pathIsInQueue:(id)a3;
- (BOOL)isCancelled;
- (BOOL)suspended;
- (MPDocument)document;
- (MPFaceDetector)init;
- (MRMarimbaPlayback)renderer;
- (void)_addPathToQueue:(id)a3;
- (void)_checkPlayingSlides;
- (void)_removePathToQueue:(id)a3;
- (void)_setupTimer;
- (void)_start;
- (void)checkPlayingSlides;
- (void)dealloc;
- (void)detectFaces:(id)a3;
- (void)resume;
- (void)setDocument:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setRenderer:(id)a3;
- (void)start;
- (void)stop;
- (void)suspend;
@end

@implementation MPFaceDetector

- (MPFaceDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MPFaceDetector;
  v2 = -[MPFaceDetector init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v2->mDetectionQueue = v3;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3, "setMaxConcurrentOperationCount:", 1LL);
    v2->mPathsInQueue = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v2->mPlayingSlides = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v4 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v2->mPathQueueLock = v4;
    -[NSLock setName:](v4, "setName:", @"MPFaceDetector.pathQueueLock");
    v5 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v2->mPlayingSlidesLock = v5;
    -[NSLock setName:](v5, "setName:", @"MPFaceDetector.playingSlidesLock");
    v6 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v2->mStartStopLock = v6;
    -[NSLock setName:](v6, "setName:", @"MPFaceDetector.startStopLock");
    v2->mCheckTimer = 0LL;
    v2->mIsCancelled = 0;
  }

  return v2;
}

- (void)dealloc
{
  self->mCheckTimer = 0LL;
  self->mDetectionQueue = 0LL;

  self->mDocument = 0LL;
  self->mRenderer = 0LL;

  self->mPathsInQueue = 0LL;
  self->mPathQueueLock = 0LL;

  self->mPlayingSlides = 0LL;
  self->mPlayingSlidesLock = 0LL;

  self->mStartStopLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPFaceDetector;
  -[MPFaceDetector dealloc](&v3, "dealloc");
}

- (void)start
{
  if (!self->mIsCancelled) {
    +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "_start",  self,  0LL);
  }
}

- (void)_addPathToQueue:(id)a3
{
}

- (void)_removePathToQueue:(id)a3
{
}

- (BOOL)_pathIsInQueue:(id)a3
{
  LOBYTE(a3) = -[NSMutableSet containsObject:](self->mPathsInQueue, "containsObject:", a3);
  -[NSLock unlock](self->mPathQueueLock, "unlock");
  return (char)a3;
}

- (void)_start
{
  context = objc_autoreleasePoolPush();
  -[NSLock lock](self->mStartStopLock, "lock");
  id v3 = -[MPDocument allSlides](self->mDocument, "allSlides");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      if (self->mIsCancelled) {
        break;
      }
      objc_super v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      if (!-[MPFaceDetector _pathIsInQueue:](self, "_pathIsInQueue:", [v8 path])
        && !-[MPDocument regionsOfInterestForPath:]( self->mDocument,  "regionsOfInterestForPath:",  [v8 path]))
      {
        v9 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v8,  @"slide",  0LL);
        v10 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  self,  "detectFaces:",  v9);
        -[NSInvocationOperation setQualityOfService:](v10, "setQualityOfService:", 9LL);
        -[NSInvocationOperation setQueuePriority:](v10, "setQueuePriority:", -8LL);

        -[MPFaceDetector _addPathToQueue:](self, "_addPathToQueue:", [v8 path]);
        -[NSOperationQueue addOperation:](self->mDetectionQueue, "addOperation:", v10);
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[NSLock unlock](self->mStartStopLock, "unlock");
  objc_autoreleasePoolPop(context);
}

- (void)suspend
{
}

- (void)resume
{
}

- (BOOL)suspended
{
  return -[NSOperationQueue isSuspended](self->mDetectionQueue, "isSuspended");
}

- (void)detectFaces:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  if (!self->mIsCancelled)
  {
    id v6 = [a3 objectForKey:@"slide"];
    id v7 = [v6 path];
    id v8 = -[MPDocument regionsOfInterestForPath:](self->mDocument, "regionsOfInterestForPath:", v7);
    id v9 = v8;
    if (!v8) {
      id v8 = -[MPDocument regionsOfInterestForPath:detect:](self->mDocument, "regionsOfInterestForPath:detect:", v7, 1LL);
    }
    if (!self->mIsCancelled)
    {
      if (v8)
      {
        id v10 = [v8 count];
        if (!v9)
        {
          if (v10)
          {
            if (objc_msgSend( -[MRMarimbaPlayback currentSlides](self->mRenderer, "currentSlides"),  "containsObject:",  v6))
            {
              -[NSLock lock](self->mPlayingSlidesLock, "lock");
              -[NSMutableSet addObject:](self->mPlayingSlides, "addObject:", v6);
              if (!self->mCheckTimer) {
                -[MPFaceDetector performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_setupTimer",  0LL,  0LL);
              }
              -[NSLock unlock](self->mPlayingSlidesLock, "unlock");
            }

            else
            {
              objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlide:inDocument:withOptions:",  v6,  self->mDocument,  0);
              objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:",  objc_msgSend(v6, "parentEffect"),  self->mDocument,  objc_msgSend(v6, "index"),  1,  -1);
            }
          }
        }
      }

      -[MPFaceDetector _removePathToQueue:](self, "_removePathToQueue:", [v6 path]);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_setupTimer
{
  if (!self->mCheckTimer) {
    self->mCheckTimer =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_checkPlayingSlides",  0LL,  0LL,  5.0);
  }
}

- (void)_checkPlayingSlides
{
  self->mCheckTimer = 0LL;
  +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "checkPlayingSlides",  self,  0LL);
}

- (void)checkPlayingSlides
{
  id v3 = objc_autoreleasePoolPush();
  if (!self->mIsCancelled)
  {
    +[NSThread setThreadPriority:](&OBJC_CLASS___NSThread, "setThreadPriority:", 0.2);
    -[NSLock lock](self->mPlayingSlidesLock, "lock");
    if (-[NSMutableSet count](self->mPlayingSlides, "count"))
    {
      id v4 = -[NSMutableSet copy](self->mPlayingSlides, "copy");
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
            if ((objc_msgSend( -[MRMarimbaPlayback currentSlides](self->mRenderer, "currentSlides"),  "containsObject:",  v9) & 1) == 0)
            {
              objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlide:inDocument:withOptions:",  v9,  self->mDocument,  0);
              objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:",  objc_msgSend(v9, "parentEffect"),  self->mDocument,  objc_msgSend(v9, "index"),  1,  -1);
              -[NSMutableSet removeObject:](self->mPlayingSlides, "removeObject:", v9);
            }
          }

          id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v6);
      }

      if (-[NSMutableSet count](self->mPlayingSlides, "count") && !self->mCheckTimer) {
        -[MPFaceDetector performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_setupTimer",  0LL,  0LL);
      }
    }

    -[NSLock unlock](self->mPlayingSlidesLock, "unlock");
  }

  objc_autoreleasePoolPop(v3);
}

- (void)stop
{
  self->mIsCancelled = 1;
  -[NSTimer invalidate](self->mCheckTimer, "invalidate");

  self->mCheckTimer = 0LL;
  -[NSOperationQueue setSuspended:](self->mDetectionQueue, "setSuspended:", 0LL);
  -[NSOperationQueue cancelAllOperations](self->mDetectionQueue, "cancelAllOperations");
  -[NSMutableSet removeAllObjects](self->mPathsInQueue, "removeAllObjects");
  -[NSLock unlock](self->mStartStopLock, "unlock");
}

- (MPDocument)document
{
  return self->mDocument;
}

- (void)setDocument:(id)a3
{
}

- (MRMarimbaPlayback)renderer
{
  return self->mRenderer;
}

- (void)setRenderer:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->mIsCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->mIsCancelled = a3;
}

@end