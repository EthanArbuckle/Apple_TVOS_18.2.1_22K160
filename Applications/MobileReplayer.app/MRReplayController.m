@interface MRReplayController
+ (id)sharedController;
+ (void)initialize;
- (DYCounterSupport)shaderProfiler;
- (MRReplayControllerDelegate)delegate;
- (MRReplayControllerDelegate)strongDelegate;
- (id)_replayerControllerSupportForCaptureStore:(id)a3;
- (id)experiments;
- (id)playbackEngine;
- (id)queue;
- (id)replayControllerSupport;
- (void)_displayPlaybackEngine;
- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5;
- (void)_processMessage:(id)a3;
- (void)_updateBackgroundImage:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setExperiments:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplayControllerSupport:(id)a3;
- (void)setShaderProfiler:(id)a3;
@end

@implementation MRReplayController

- (MRReplayControllerDelegate)strongDelegate
{
  return (MRReplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)sharedController
{
  if (qword_10000D428 != -1) {
    dispatch_once(&qword_10000D428, &stru_1000082F0);
  }
  return (id)qword_10000D420;
}

- (void)dealloc
{
  shaderProfiler = self->_shaderProfiler;
  self->_shaderProfiler = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRReplayController;
  -[MRReplayController dealloc](&v4, "dealloc");
}

- (void)_displayPlaybackEngine
{
  if (!pthread_main_np()) {
    __assert_rtn("-[MRReplayController _displayPlaybackEngine]", (const char *)&unk_1000055D9, 0, "pthread_main_np()");
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
  if ([v7 shouldCreateViewController])
  {
    backgroundImageViewController = self->_backgroundImageViewController;

    if (backgroundImageViewController) {
      return;
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllerForPlaybackEngine:v5]);
    [v4 setViewController:v6];
  }
}

- (id)_replayerControllerSupportForCaptureStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DYExtensionRegistry sharedExtensionRegistry]( &OBJC_CLASS___DYExtensionRegistry,  "sharedExtensionRegistry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 extensionsForSlot:@"com.apple.mobileReplayer.replayControllerSupport"]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", @"class", (void)v19));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundle]);
          v14 = (objc_class *)[v13 classNamed:v12];

          if (v14)
          {
            id v15 = [[v14 alloc] initWithCaptureStore:v4];
            v16 = v15;
            if (v15)
            {
              if ((objc_opt_respondsToSelector(v15, "setShouldCreateViewController:") & 1) != 0)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
                objc_msgSend(v16, "setShouldCreateViewController:", objc_msgSend(v17, "shouldCreateViewController"));
              }

              goto LABEL_15;
            }
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v16 = 0LL;
LABEL_15:

  return v16;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRReplayController, a2) == a1)
  {
    id v2 = objc_alloc(&OBJC_CLASS___DYStandardPluginDirectoryProvider);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = [v2 initWithBundle:v3 includeDeveloperDirectory:0 includeBundleDirectory:0];

    id v4 =  +[DYPluginLoader loadPluginsWithProvider:pathExtension:]( &OBJC_CLASS___DYPluginLoader,  "loadPluginsWithProvider:pathExtension:",  v5,  @"mrplugin");
  }

- (void)_processMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 kind];
  if (v5 - 4117 < 2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    unsigned __int8 v9 = [v7 isDebugPlaybackEngine:v8];

    if ((v9 & 1) != 0)
    {
      if ([v4 kind] != 4117)
      {
        v46 = v7;
        if (!self->_shaderProfiler)
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
          __int128 v21 = (DYCounterSupport *)[v7 newShaderProfilerWithPlaybackEngine:v19 payload:v20];
          shaderProfiler = self->_shaderProfiler;
          self->_shaderProfiler = v21;
        }

        objc_initWeak(&from, self);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
        BOOL v24 = v23 == 0LL;

        if (v24)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController shaderProfiler](self, "shaderProfiler"));
          v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
          [v41 updatePayload:v42];

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_100003378;
          v48[3] = &unk_100008318;
          objc_copyWeak(&v52, &from);
          id v49 = v7;
          v50 = self;
          id v51 = v4;
          [v43 pushBlock:v48];

          objc_destroyWeak(&v52);
        }

        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"collectInBackground"]);
          BOOL v27 = v26 == 0LL;

          if (v27)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472LL;
            v53[2] = sub_100003140;
            v53[3] = &unk_100008318;
            objc_copyWeak(&v57, &from);
            id v54 = v7;
            id v55 = v4;
            v56 = self;
            [v44 pushBlock:v53];

            objc_destroyWeak(&v57);
          }

          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController shaderProfiler](self, "shaderProfiler"));
            v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
            [v28 updatePayload:v29];

            v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"maxDrawsInAnyEncoder"]);

            if (v45)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController transport](self, "transport"));
              id v32 = [v4 kind];
              v33 = objc_opt_new(&OBJC_CLASS___NSDictionary);
              v34 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  v32,  v33));
              [v31 send:v34 inReplyTo:v4 error:0];

              v35 = (char *)[v45 unsignedIntegerValue];
              if (v35)
              {
                v36 = 0LL;
                do
                {
                  location[0] = 0LL;
                  location[1] = location;
                  location[2] = (id)0x3032000000LL;
                  location[3] = sub_100002F58;
                  location[4] = sub_100002F68;
                  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  ++v36));
                  v71[0] = v37;
                  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v35));
                  v71[1] = v38;
                  id v64 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v71,  2LL));

                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockBackgroundQueue](self, "profileBlockBackgroundQueue"));
                  v58[0] = _NSConcreteStackBlock;
                  v58[1] = 3221225472LL;
                  v58[2] = sub_100002F70;
                  v58[3] = &unk_100008368;
                  objc_copyWeak(&v62, &from);
                  id v40 = v46;
                  v60 = self;
                  v61 = location;
                  id v59 = v40;
                  [v39 pushBlock:v58];

                  objc_destroyWeak(&v62);
                  _Block_object_dispose(location, 8);
                }

                while (v35 != v36);
              }
            }
          }
        }

        objc_destroyWeak(&from);
        goto LABEL_26;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
      v12 = (DYCounterSupport *)[v7 newShaderProfilerWithPlaybackEngine:v10 payload:v11];
      v13 = self->_shaderProfiler;
      self->_shaderProfiler = v12;

      if (self->_shaderProfiler)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
        v46 = v7;
        [v14 clear];

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockBackgroundQueue](self, "profileBlockBackgroundQueue"));
        [v15 clear];

        objc_initWeak(location, self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472LL;
        v66[2] = sub_100002E24;
        v66[3] = &unk_100008318;
        objc_copyWeak(&v70, location);
        id v67 = v7;
        v68 = self;
        id v69 = v4;
        [v16 pushBlock:v66];

        objc_destroyWeak(&v70);
        objc_destroyWeak(location);
LABEL_26:
        id v7 = v46;
        goto LABEL_27;
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController transport](self, "transport"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:]( DYTransportMessage,  "messageWithKind:",  [v4 kind]));
    [v17 send:v18 inReplyTo:v4 error:0];

LABEL_27:
    goto LABEL_28;
  }

  if (v5 == 4101)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectPayload]);
    -[MRReplayController _updateBackgroundImage:](self, "_updateBackgroundImage:", v6);
  }

  else
  {
    if (v5 != 4113)
    {
      v47.receiver = self;
      v47.super_class = (Class)&OBJC_CLASS___MRReplayController;
      -[MRReplayController _processMessage:](&v47, "_processMessage:", v4);
      goto LABEL_28;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
    -[MRReplayController _updateBackgroundImage:](self, "_updateBackgroundImage:", v6);
  }

LABEL_28:
}

- (void)_updateBackgroundImage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
  unsigned __int8 v6 = [v5 shouldCreateViewController];

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v4));
      id v8 = v7;
      if (v7)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000036C8;
        v12[3] = &unk_1000083B8;
        v12[4] = self;
        id v8 = v7;
        id v13 = v8;
        dispatch_async(&_dispatch_main_q, v12);
      }

      else
      {
        _DYOLog(self, kDYLoggingLevelError, @"failed to load background image data");
      }
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 viewControllerForPlaybackEngine:v9]);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000366C;
      block[3] = &unk_1000083B8;
      block[4] = self;
      id v15 = v10;
      id v11 = v10;
      dispatch_async(&_dispatch_main_q, block);
    }
  }
}

- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController archiveStack](self, "archiveStack"));
  if ([v10 empty]) {
    __assert_rtn( "-[MRReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]",  (const char *)&unk_1000055D9,  0,  "![self.archiveStack empty]");
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
  id v12 = [v11 count];

  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003B08;
    block[3] = &unk_1000083E0;
    block[4] = self;
    dispatch_sync(&_dispatch_main_q, block);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    id v15 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    id v16 = [v13 newShaderProfilerWithPlaybackEngine:v14 payload:v15];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kDYQueryAvailableCounters]);

    if (v18)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 availableCountersForFrameProfiler:v16]);
    }

    else
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kDYDerivedCounterData]);

      if (!v22)
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v19 profilerCounters:v24 withFrameProfiler:v16]);

        goto LABEL_9;
      }

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 derivedCounterDataForFrameProfiler:v16]);
    }

    v23 = (void *)v20;
LABEL_9:

    [v9 resolveWithFuture:v23];
    goto LABEL_10;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MRReplayController;
  -[MRReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]( &v26,  "_playbackArchiveWithExperiment:passingFuture:resolvingFuture:",  v8,  v9,  v5);
LABEL_10:
}

- (id)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
}

- (id)playbackEngine
{
  return self->playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (id)replayControllerSupport
{
  return self->replayControllerSupport;
}

- (void)setReplayControllerSupport:(id)a3
{
}

- (id)experiments
{
  return self->experiments;
}

- (void)setExperiments:(id)a3
{
}

- (MRReplayControllerDelegate)delegate
{
  return (MRReplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DYCounterSupport)shaderProfiler
{
  return self->_shaderProfiler;
}

- (void)setShaderProfiler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end