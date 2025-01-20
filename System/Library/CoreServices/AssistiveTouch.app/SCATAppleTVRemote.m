@interface SCATAppleTVRemote
- (BOOL)_isGroupingEnabled;
- (BOOL)canBeActiveElementManager;
- (BOOL)containsElement:(id)a3;
- (BOOL)providesElements;
- (NSArray)remoteElements;
- (NSArray)remoteGroups;
- (SCATAppleTVRemote)init;
- (SCATAppleTVRemoteDelegate)delegate;
- (SCATAppleTVRemoteViewController)appleTVRemoteViewController;
- (id)_groupForElement:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)visualProvider;
- (void)setAppleTVRemoteViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteElements:(id)a3;
- (void)setRemoteGroups:(id)a3;
@end

@implementation SCATAppleTVRemote

- (SCATAppleTVRemote)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemote;
  return -[SCATAppleTVRemote init](&v3, "init");
}

- (BOOL)_isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (NSArray)remoteGroups
{
  remoteGroups = self->_remoteGroups;
  if (!remoteGroups)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote visualProvider](self, "visualProvider"));
    v5 = objc_alloc(&OBJC_CLASS___AXElementGroup);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 upArrowButton]);
    v36[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 leftArrowButton]);
    v36[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 selectButton]);
    v36[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rightArrowButton]);
    v36[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 downArrowButton]);
    v36[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 5LL));
    v12 = -[AXElementGroup initWithElements:label:](v5, "initWithElements:label:", v11, 0LL);

    id v13 = sub_10002B014(@"Remote-NavigationGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[AXElementGroup setAccessibilityLabel:](v12, "setAccessibilityLabel:", v14);

    v15 = objc_alloc(&OBJC_CLASS___AXElementGroup);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 menuButton]);
    v35[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 homeButton]);
    v35[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
    v19 = -[AXElementGroup initWithElements:label:](v15, "initWithElements:label:", v18, 0LL);

    v20 = objc_alloc(&OBJC_CLASS___AXElementGroup);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeButton]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 increaseVolumeView]);
    v34[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeButton]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 decreaseVolumeView]);
    v34[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    v26 = -[AXElementGroup initWithElements:label:](v20, "initWithElements:label:", v25, 0LL);

    id v27 = sub_10002B014(@"Remote-VolumeGroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[AXElementGroup setAccessibilityLabel:](v26, "setAccessibilityLabel:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 playPauseButton]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v4 exitingView]);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v12,  v19,  v29,  v26,  v30,  0LL));
    v32 = self->_remoteGroups;
    self->_remoteGroups = v31;

    remoteGroups = self->_remoteGroups;
  }

  return remoteGroups;
}

- (NSArray)remoteElements
{
  remoteElements = self->_remoteElements;
  if (!remoteElements)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote visualProvider](self, "visualProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 exitingView]);
    v21[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 upArrowButton]);
    v21[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 leftArrowButton]);
    v21[2] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 selectButton]);
    v21[3] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 rightArrowButton]);
    v21[4] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 downArrowButton]);
    v21[5] = v15;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 menuButton]);
    v21[6] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 homeButton]);
    v21[7] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playPauseButton]);
    v21[8] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeButton]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 increaseVolumeView]);
    v21[9] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeButton]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 decreaseVolumeView]);
    v21[10] = v11;
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 11LL));
    id v13 = self->_remoteElements;
    self->_remoteElements = v12;

    remoteElements = self->_remoteElements;
  }

  return remoteElements;
}

- (id)_groupForElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups"));
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ([v13 isGroup]
            && ([v13 containsObject:v4] & 1) != 0)
          {
            id v7 = v13;

            goto LABEL_14;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0LL;
  }

- (id)visualProvider
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote appleTVRemoteViewController](self, "appleTVRemoteViewController"));

  if (!v3)
  {
    id v4 = -[SCATAppleTVRemoteViewController initWithElementManager:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteViewController),  "initWithElementManager:",  self);
    -[SCATAppleTVRemote setAppleTVRemoteViewController:](self, "setAppleTVRemoteViewController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote appleTVRemoteViewController](self, "appleTVRemoteViewController"));
    id v6 = [v5 view];

    objc_initWeak(&location, self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote appleTVRemoteViewController](self, "appleTVRemoteViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 exitingView]);
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_10002E468;
    id v13 = &unk_100121EE8;
    objc_copyWeak(&v14, &location);
    [v8 setActivateActionHandler:&v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[SCATAppleTVRemote appleTVRemoteViewController]( self,  "appleTVRemoteViewController",  v10,  v11,  v12,  v13));
}

- (id)identifier
{
  return off_100157170;
}

- (BOOL)canBeActiveElementManager
{
  return 1;
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  if (-[SCATAppleTVRemote _isGroupingEnabled](self, "_isGroupingEnabled", a3)) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups"));
  }
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteElements](self, "remoteElements"));
  }
  v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v6;
}

- (id)lastElementWithOptions:(int *)a3
{
  if (-[SCATAppleTVRemote _isGroupingEnabled](self, "_isGroupingEnabled", a3)) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups"));
  }
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteElements](self, "remoteElements"));
  }
  v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  return v6;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if (-[SCATAppleTVRemote _isGroupingEnabled](self, "_isGroupingEnabled")) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote _groupForElement:](self, "_groupForElement:", v7));
  }
  else {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteElements](self, "remoteElements"));
  }
  id v9 = v8;
  if (v8 && (id v10 = (char *)[v8 indexOfObject:v7], v10 != (char *)0x7FFFFFFFFFFFFFFFLL))
  {
    id v14 = v10;
    __int128 v15 = (char *)[v9 count];
    BOOL v12 = v14 == 0LL;
    if (v14) {
      __int128 v16 = v14;
    }
    else {
      __int128 v16 = v15;
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v16 - 1]);
    if (a4) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    BOOL v12 = 0;
    if (a4) {
LABEL_7:
    }
      *a4 = v12;
  }

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if (-[SCATAppleTVRemote _isGroupingEnabled](self, "_isGroupingEnabled")) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote _groupForElement:](self, "_groupForElement:", v7));
  }
  else {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteElements](self, "remoteElements"));
  }
  id v9 = v8;
  id v10 = (char *)[v8 indexOfObject:v7];

  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0LL;
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  id v13 = (char *)[v9 count] - 1;
  BOOL v12 = v10 == v13;
  if (v10 == v13) {
    id v14 = 0LL;
  }
  else {
    id v14 = v10 + 1;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v14]);
  if (a4) {
LABEL_11:
  }
    *a4 = v12;
LABEL_12:

  return v11;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  if (-[SCATAppleTVRemote _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteGroups](self, "remoteGroups", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsObject:v4])
          {

            unsigned __int8 v10 = 1;
            goto LABEL_13;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemote remoteElements](self, "remoteElements"));
    unsigned __int8 v10 = [v11 containsObject:v4];
  }

- (SCATAppleTVRemoteDelegate)delegate
{
  return (SCATAppleTVRemoteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATAppleTVRemoteViewController)appleTVRemoteViewController
{
  return self->_appleTVRemoteViewController;
}

- (void)setAppleTVRemoteViewController:(id)a3
{
}

- (void)setRemoteGroups:(id)a3
{
}

- (void)setRemoteElements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end