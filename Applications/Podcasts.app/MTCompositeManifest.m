@interface MTCompositeManifest
- (BOOL)isIndexFromUpNext:(unint64_t)a3;
- (BOOL)isPlayingFromManifest:(id)a3;
- (BOOL)isPlayingFromUpNext;
- (BOOL)networkUPPEnabled;
- (MTCompositeManifest)initWithUpNextManifest:(id)a3 userManifest:(id)a4 loadQueue:(id)a5;
- (MTPlayerManifest)currentManifest;
- (MTPlayerManifest)upNextManifest;
- (MTPlayerManifest)userManifest;
- (OS_dispatch_queue)loadQueue;
- (id)activity;
- (id)currentItem;
- (id)identifier;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (unint64_t)determineCompositeIndexWithIndex:(unint64_t)a3 fromManifest:(id)a4;
- (void)_currentItemDidChange:(id)a3;
- (void)_determineManifest:(id *)a3 scalledIndex:(unint64_t *)a4 forIndex:(unint64_t)a5;
- (void)_load:(id)a3;
- (void)_setupManifestDefaults;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)notifyCurrentItemDidChange;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentManifest:(id)a3;
- (void)setLoadQueue:(id)a3;
- (void)setUpNextManifest:(id)a3;
- (void)setUserManifest:(id)a3;
@end

@implementation MTCompositeManifest

- (MTCompositeManifest)initWithUpNextManifest:(id)a3 userManifest:(id)a4 loadQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTCompositeManifest;
  v12 = -[MTPlayerManifest init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upNextManifest, a3);
    objc_storeStrong((id *)&v13->_userManifest, a4);
    objc_storeStrong((id *)&v13->_loadQueue, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v15 = IMPlayerManifestCurrentItemDidChange;
    [v14 addObserver:v13 selector:"_currentItemDidChange:" name:IMPlayerManifestCurrentItemDidChange object:v13->_upNextManifest];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v13 selector:"_currentItemDidChange:" name:v15 object:v13->_userManifest];
  }

  return v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTCompositeManifest;
  -[MTCompositeManifest dealloc](&v4, "dealloc");
}

- (id)identifier
{
  p_upNextManifest = &self->_upNextManifest;
  upNextManifest = self->_upNextManifest;
  if (!upNextManifest || !-[MTPlayerManifest count](upNextManifest, "count")) {
    p_upNextManifest = &self->_userManifest;
  }
  return (id)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest identifier](*p_upNextManifest, "identifier"));
}

- (BOOL)isPlayingFromManifest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  return v5 == v4;
}

- (BOOL)isIndexFromUpNext:(unint64_t)a3
{
  id v7 = 0LL;
  -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:]( self,  "_determineManifest:scalledIndex:forIndex:",  &v7,  v8,  a3);
  id v4 = v7;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));

  return v4 == v5;
}

- (BOOL)networkUPPEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  unsigned __int8 v3 = [v2 networkUPPEnabled];

  return v3;
}

- (void)_load:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_100122284;
  v5[3] = &unk_100240138;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___MTCompositeManifest;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[MTCompositeManifest _load:](&v4, "_load:", v5);
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v6 = 0LL;
  -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:]( self,  "_determineManifest:scalledIndex:forIndex:",  &v6,  &v7,  a3);
  id v3 = v6;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v7]);

  return v4;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || -[MTCompositeManifest count](self, "count") <= a3)
  {
    -[MTCompositeManifest setCurrentManifest:](self, "setCurrentManifest:", 0LL);
    -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMLogCategory player](&OBJC_CLASS___IMLogCategory, "player"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setCurrentIndex: %lu, not found", buf, 0xCu);
    }
  }

  else
  {
    id v20 = 0LL;
    -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:]( self,  "_determineManifest:scalledIndex:forIndex:",  &v20,  &v21,  a3);
    id v5 = (os_log_s *)v20;
    id v6 = -[os_log_s currentIndex](v5, "currentIndex");
    -[MTCompositeManifest setCurrentManifest:](self, "setCurrentManifest:", v5);
    id v7 = -[os_log_s setCurrentIndex:](v5, "setCurrentIndex:", v21);
    if (v21 == v6) {
      id v7 = -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");
    }
    if ((os_feature_enabled_red_sun(v7) & 1) == 0)
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
      unint64_t v9 = (unint64_t)v21;

      if (v5 == v8 && v9 > (unint64_t)v6)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 player]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 manifest]);
        unsigned int v13 = [v12 isEqual:self];

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 upNextController]);
          [v15 clear];
        }
      }
    }

    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMLogCategory player](&OBJC_CLASS___IMLogCategory, "player"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v21;
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentItem](v5, "currentItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 title]);
      *(_DWORD *)buf = 134218754;
      unint64_t v23 = a3;
      __int16 v24 = 2112;
      v25 = v5;
      __int16 v26 = 2048;
      id v27 = v17;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "setCurrentIndex: %lu, manifest: %@ scalled: %lu, item: %@",  buf,  0x2Au);
    }
  }
}

- (unint64_t)currentIndex
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));

  if (v3 == v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    id v9 = [v8 currentIndex];

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
      id v12 = [v11 currentIndex];
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
      id v7 = (char *)[v13 currentIndex] + (void)v12 + 1;

      goto LABEL_9;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
LABEL_7:
    id v11 = v10;
    id v7 = (char *)[v10 currentIndex];
LABEL_9:

    return (unint64_t)v7;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));

  if (v5 == v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    goto LABEL_7;
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)currentItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unint64_t)count
{
  id v3 = -[MTPlayerManifest count](self->_userManifest, "count");
  return (unint64_t)v3 + (void)-[MTPlayerManifest count](self->_upNextManifest, "count");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_100122A44;
  id v11 = &unk_100245758;
  id v4 = a3;
  id v12 = v4;
  unsigned int v13 = &v14;
  id v5 = objc_retainBlock(&v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest", v8, v9, v10, v11));
  [v6 enumerateObjectsUsingBlock:v5];

  if (!*((_BYTE *)v15 + 24))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    [v7 enumerateObjectsUsingBlock:v4];
  }

  _Block_object_dispose(&v14, 8);
}

- (id)activity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 activity]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    BOOL v6 = -[MTCompositeManifest isPlayingFromManifest:](self, "isPlayingFromManifest:", v5);

    if (v6)
    {
      [v3 setEligibleForHandoff:0];
      [v3 setEligibleForSearch:0];
      [v3 setEligibleForPublicIndexing:0];
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    [v3 setValue:v7 forKey:@"MTCompositeManifestIsPlayingFromUpNext"];
  }

  return v3;
}

- (unint64_t)determineCompositeIndexWithIndex:(unint64_t)a3 fromManifest:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    unsigned int v11 = [v6 isEqual:v10];

    if (!v11)
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_8;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    a3 += (unint64_t)[v9 currentIndex] + 1;
    goto LABEL_6;
  }

  if ((unint64_t)[v6 currentIndex] < a3)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    a3 += (unint64_t)[v9 count];
LABEL_6:
  }

- (void)_determineManifest:(id *)a3 scalledIndex:(unint64_t *)a4 forIndex:(unint64_t)a5
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  id v10 = [v9 count];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  id v12 = v11;
  if (!v10) {
    goto LABEL_11;
  }
  id v13 = [v11 count];

  if (!v13)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
LABEL_11:
    *a3 = v11;
    *a4 = a5;
    return;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  int64_t v15 = (int64_t)[v14 currentIndex];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v15 = -1LL;
  }
  if (v15 >= (uint64_t)a5)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    goto LABEL_11;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  char v17 = (char *)[v16 count] + v15;

  if ((unint64_t)v17 >= a5)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    *a4 = ~v15 + a5;
  }

  else
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    *a4 = a5 - (void)[v18 count];
  }

- (void)_setupManifestDefaults
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  id v4 = [v3 count];

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  }
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  }
  id v6 = v5;
  -[MTCompositeManifest setCurrentIndex:](self, "setCurrentIndex:", [v5 currentIndex]);
}

- (void)_currentItemDidChange:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (!v4) {
    -[MTCompositeManifest _setupManifestDefaults](self, "_setupManifestDefaults");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v5 == v6) {
    -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");
  }
}

- (void)notifyCurrentItemDidChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:IMPlayerManifestCurrentItemDidChange object:self];
}

- (id)metricsContentIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metricsContentIdentifier]);

  return v3;
}

- (id)metricsAdditionalData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metricsAdditionalData]);

  return v3;
}

- (MTPlayerManifest)currentManifest
{
  return self->_currentManifest;
}

- (void)setCurrentManifest:(id)a3
{
}

- (BOOL)isPlayingFromUpNext
{
  return self->_isPlayingFromUpNext;
}

- (MTPlayerManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)setUpNextManifest:(id)a3
{
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (void)setUserManifest:(id)a3
{
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void)setLoadQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end