@interface TVHAppSettingsFacade
+ (BOOL)automaticallyNotifiesObserversOfDiscoveringDAAPServers;
+ (id)sharedInstance;
- (BOOL)allowDAAPServerDiscovery;
- (BOOL)discoveringDAAPServers;
- (BOOL)discoveringHomeShareServers;
- (NSString)homeSharingAccountName;
- (TVHAppSettingsFacade)init;
- (unint64_t)movieCoverArtShape;
- (unint64_t)showCoverArtShape;
- (void)_setDiscoveringDAAPServers:(BOOL)a3;
- (void)_setMovieCoverArtShape:(unint64_t)a3;
- (void)_setShowCoverArtShape:(unint64_t)a3;
- (void)_startObservingAppSettings;
- (void)_startObservingMediaServerDiscoverySettings;
- (void)_stopObservingAppSettings;
- (void)_stopObservingMediaServerDiscoverySettings;
- (void)_updateWithAllowDAAPServerDiscovery:(BOOL)a3;
- (void)_updateWithMediaServerDiscoveryConfiguration:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowDAAPServerDiscovery:(BOOL)a3;
- (void)setDiscoveringDAAPServers:(BOOL)a3;
- (void)setDiscoveringHomeShareServers:(BOOL)a3;
- (void)setHomeSharingAccountName:(id)a3;
- (void)setMovieCoverArtShape:(unint64_t)a3;
- (void)setShowCoverArtShape:(unint64_t)a3;
@end

@implementation TVHAppSettingsFacade

+ (id)sharedInstance
{
  if (qword_CE80 != -1) {
    dispatch_once(&qword_CE80, &stru_8438);
  }
  return (id)qword_CE78;
}

- (TVHAppSettingsFacade)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHAppSettingsFacade;
  v2 = -[TVHAppSettingsFacade init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TVHAppSettingsFacade _startObservingMediaServerDiscoverySettings]( v2,  "_startObservingMediaServerDiscoverySettings");
    -[TVHAppSettingsFacade _startObservingAppSettings](v3, "_startObservingAppSettings");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHAppSettingsFacade;
  -[TVHAppSettingsFacade dealloc](&v3, "dealloc");
}

- (void)setMovieCoverArtShape:(unint64_t)a3
{
  if (self->_movieCoverArtShape != a3)
  {
    -[TVHAppSettingsFacade _setMovieCoverArtShape:](self, "_setMovieCoverArtShape:");
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    [v4 setMovieCoverArtShape:a3];
  }

- (void)setShowCoverArtShape:(unint64_t)a3
{
  if (self->_showCoverArtShape != a3)
  {
    -[TVHAppSettingsFacade _setShowCoverArtShape:](self, "_setShowCoverArtShape:");
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    [v4 setShowCoverArtShape:a3];
  }

- (void)setDiscoveringDAAPServers:(BOOL)a3
{
  if (self->_discoveringDAAPServers != a3)
  {
    -[TVHAppSettingsFacade _setDiscoveringDAAPServers:](self, "_setDiscoveringDAAPServers:");
    uint64_t v4 = 2LL * self->_discoveringDAAPServers;
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
    [v5 setMediaServerDiscoveryConfigurationWithMode:v4 homeSharingAccountName:0 homeSharingPassword:0 completionHandler:0];
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_CD08 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    -[TVHAppSettingsFacade _updateWithMediaServerDiscoveryConfiguration:]( self,  "_updateWithMediaServerDiscoveryConfiguration:",  v14);
LABEL_10:

    goto LABEL_11;
  }

  if (off_CD10 == a6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    id v16 = [v15 BOOLValue];

    -[TVHAppSettingsFacade _updateWithAllowDAAPServerDiscovery:](self, "_updateWithAllowDAAPServerDiscovery:", v16);
    goto LABEL_11;
  }

  if (off_CD18 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    -[TVHAppSettingsFacade _updateWithMovieCoverArtShape:]( self,  "_updateWithMovieCoverArtShape:",  [v14 unsignedIntegerValue]);
    goto LABEL_10;
  }

  if (off_CD20 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    -[TVHAppSettingsFacade _updateWithShowCoverArtShape:]( self,  "_updateWithShowCoverArtShape:",  [v14 unsignedIntegerValue]);
    goto LABEL_10;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHAppSettingsFacade;
  -[TVHAppSettingsFacade observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_11:
}

+ (BOOL)automaticallyNotifiesObserversOfDiscoveringDAAPServers
{
  return 0;
}

- (void)_startObservingMediaServerDiscoverySettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" options:5 context:off_CD08];
}

- (void)_stopObservingMediaServerDiscoverySettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" context:off_CD08];
}

- (void)_startObservingAppSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"allowDAAPServerDiscovery" options:5 context:off_CD10];
  [v3 addObserver:self forKeyPath:@"movieCoverArtShape" options:5 context:off_CD18];
  [v3 addObserver:self forKeyPath:@"showCoverArtShape" options:5 context:off_CD20];
}

- (void)_stopObservingAppSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"allowDAAPServerDiscovery" context:off_CD10];
  [v3 removeObserver:self forKeyPath:@"movieCoverArtShape" context:off_CD18];
  [v3 removeObserver:self forKeyPath:@"showCoverArtShape" context:off_CD20];
}

- (void)_updateWithMediaServerDiscoveryConfiguration:(id)a3
{
  id v4 = a3;
  -[TVHAppSettingsFacade setDiscoveringHomeShareServers:]( self,  "setDiscoveringHomeShareServers:",  [v4 isDiscoveringHomeShareServers]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homeSharingAccountName]);
  -[TVHAppSettingsFacade setHomeSharingAccountName:](self, "setHomeSharingAccountName:", v5);

  id v6 = [v4 isDiscoveringDAAPServers];
  -[TVHAppSettingsFacade _setDiscoveringDAAPServers:](self, "_setDiscoveringDAAPServers:", v6);
}

- (void)_updateWithAllowDAAPServerDiscovery:(BOOL)a3
{
}

- (void)_setMovieCoverArtShape:(unint64_t)a3
{
  if (self->_movieCoverArtShape != a3)
  {
    -[TVHAppSettingsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"movieCoverArtShape");
    self->_movieCoverArtShape = a3;
    -[TVHAppSettingsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"movieCoverArtShape");
  }

- (void)_setShowCoverArtShape:(unint64_t)a3
{
  if (self->_showCoverArtShape != a3)
  {
    -[TVHAppSettingsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"showCoverArtShape");
    self->_showCoverArtShape = a3;
    -[TVHAppSettingsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"showCoverArtShape");
  }

- (void)_setDiscoveringDAAPServers:(BOOL)a3
{
  if (self->_discoveringDAAPServers != a3)
  {
    -[TVHAppSettingsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"discoveringDAAPServers");
    self->_discoveringDAAPServers = a3;
    -[TVHAppSettingsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"discoveringDAAPServers");
  }

- (BOOL)allowDAAPServerDiscovery
{
  return self->_allowDAAPServerDiscovery;
}

- (void)setAllowDAAPServerDiscovery:(BOOL)a3
{
  self->_allowDAAPServerDiscovery = a3;
}

- (BOOL)discoveringDAAPServers
{
  return self->_discoveringDAAPServers;
}

- (BOOL)discoveringHomeShareServers
{
  return self->_discoveringHomeShareServers;
}

- (void)setDiscoveringHomeShareServers:(BOOL)a3
{
  self->_discoveringHomeShareServers = a3;
}

- (NSString)homeSharingAccountName
{
  return self->_homeSharingAccountName;
}

- (void)setHomeSharingAccountName:(id)a3
{
}

- (unint64_t)movieCoverArtShape
{
  return self->_movieCoverArtShape;
}

- (unint64_t)showCoverArtShape
{
  return self->_showCoverArtShape;
}

- (void).cxx_destruct
{
}

@end