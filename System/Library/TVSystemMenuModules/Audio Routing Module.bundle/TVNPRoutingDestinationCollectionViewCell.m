@interface TVNPRoutingDestinationCollectionViewCell
- (TVNPRoutingDestination)destination;
- (void)_updateMusicBarState;
- (void)_updateNowPlayingInfo;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDestination:(id)a3;
@end

@implementation TVNPRoutingDestinationCollectionViewCell

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPRoutingDestinationCollectionViewCell setDestination:](self, "setDestination:", 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationCollectionViewCell;
  -[TVNPRoutingDestinationCollectionViewCell dealloc](&v2, "dealloc");
}

- (void)setDestination:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  -[TVNPRoutingDestination removeObserver:forKeyPath:context:]( v4->_destination,  "removeObserver:forKeyPath:context:",  v4);
  objc_storeStrong((id *)&v4->_destination, location[0]);
  objc_msgSend(location[0], "addObserver:forKeyPath:options:context:", v4, @"title");
  [location[0] addObserver:v4 forKeyPath:@"deviceImage" options:4 context:off_5ED68];
  [location[0] addObserver:v4 forKeyPath:@"subtitle" options:4 context:off_5ED70];
  [location[0] addObserver:v4 forKeyPath:@"artworkImage" options:4 context:off_5ED78];
  [location[0] addObserver:v4 forKeyPath:@"paired" options:4 context:off_5ED80];
  [location[0] addObserver:v4 forKeyPath:@"playbackState" options:4 context:off_5ED88];
  [location[0] addObserver:v4 forKeyPath:@"volumeLevel" options:4 context:off_5ED90];
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10 = a6;
  if (a6 == off_5ED60 || v10 == off_5ED68 || v10 == off_5ED70 || v10 == off_5ED78)
  {
LABEL_11:
    -[TVNPRoutingDestinationCollectionViewCell _updateNowPlayingInfo](v14, "_updateNowPlayingInfo");
    goto LABEL_13;
  }

  if (v10 != off_5ED80 && v10 != off_5ED88)
  {
    if (v10 != off_5ED90)
    {
      v9.receiver = v14;
      v9.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationCollectionViewCell;
      -[TVNPRoutingDestinationCollectionViewCell observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
      goto LABEL_13;
    }

    goto LABEL_11;
  }

  -[TVNPRoutingDestinationCollectionViewCell _updateMusicBarState](v14, "_updateMusicBarState");
  -[TVNPRoutingDestinationCollectionViewCell _updateNowPlayingInfo](v14, "_updateNowPlayingInfo");
LABEL_13:
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateMusicBarState
{
  unint64_t v2 = -[TVNPRoutingDestination playbackState](self->_destination, "playbackState");
  switch(v2)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      uint64_t v3 = 1LL;
      break;
    case 2uLL:
      uint64_t v3 = 2LL;
      break;
    default:
LABEL_7:
      uint64_t v3 = 0LL;
      break;
  }

  -[TVNPBaseRoutingDestinationCollectionViewCell setMusicBarState:](self, "setMusicBarState:", v3);
}

- (void)_updateNowPlayingInfo
{
  if (-[TVNPRoutingDestination playbackState](self->_destination, "playbackState"))
  {
    unint64_t v2 = -[TVNPRoutingDestination title](self->_destination, "title");
    -[TVNPBaseRoutingDestinationCollectionViewCell setTitleText:](self, "setTitleText:");

    uint64_t v3 = -[TVNPRoutingDestination subtitle](self->_destination, "subtitle");
    -[TVNPBaseRoutingDestinationCollectionViewCell setSubtitleText:](self, "setSubtitleText:");

    v4 = -[TVNPRoutingDestination artworkImage](self->_destination, "artworkImage");
    -[TVNPBaseRoutingDestinationCollectionViewCell setArtworkImage:](self, "setArtworkImage:");

    v5 = -[TVNPRoutingDestination deviceImage](self->_destination, "deviceImage");
    -[TVNPBaseRoutingDestinationCollectionViewCell setDeviceImage:](self, "setDeviceImage:");

    -[TVNPBaseRoutingDestinationCollectionViewCell setDeviceType:]( self,  "setDeviceType:",  -[TVNPRoutingDestination effectiveDeviceType](self->_destination, "effectiveDeviceType"));
    -[TVNPBaseRoutingDestinationCollectionViewCell setShowDeviceImage:](self, "setShowDeviceImage:", 0LL);
  }

  else
  {
    char v19 = 0;
    char v17 = 0;
    char v15 = 0;
    char v13 = 0;
    char v11 = 0;
    char v9 = 0;
    if (-[TVNPRoutingDestination isConnecting](self->_destination, "isConnecting"))
    {
      v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      char v19 = 1;
      v18 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"ConnectingTitle",  &stru_51CA0,  @"Localizable");
      char v17 = 1;
      v8 = v18;
    }

    else
    {
      if (-[TVNPRoutingDestination isConnected](self->_destination, "isConnected"))
      {
        v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
        char v15 = 1;
        v14 =  -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  @"ChooseMusicTitle",  &stru_51CA0,  @"Localizable");
        char v13 = 1;
        v7 = v14;
      }

      else
      {
        id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
        char v11 = 1;
        v10 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"SelectToConnectTitle",  &stru_51CA0,  @"Localizable");
        char v9 = 1;
        v7 = v10;
      }

      v8 = v7;
    }

    -[TVNPBaseRoutingDestinationCollectionViewCell setTitleText:](self, "setTitleText:", v8);
    if ((v9 & 1) != 0) {

    }
    if ((v11 & 1) != 0) {
    if ((v13 & 1) != 0)
    }

    if ((v15 & 1) != 0) {
    if ((v17 & 1) != 0)
    }

    if ((v19 & 1) != 0) {
    -[TVNPBaseRoutingDestinationCollectionViewCell setSubtitleText:](self, "setSubtitleText:");
    }
    -[TVNPBaseRoutingDestinationCollectionViewCell setArtworkImage:](self, "setArtworkImage:", 0LL);
    v6 = -[TVNPRoutingDestination deviceImage](self->_destination, "deviceImage");
    -[TVNPBaseRoutingDestinationCollectionViewCell setDeviceImage:](self, "setDeviceImage:");

    -[TVNPBaseRoutingDestinationCollectionViewCell setDeviceType:]( self,  "setDeviceType:",  -[TVNPRoutingDestination effectiveDeviceType](self->_destination, "effectiveDeviceType"));
    -[TVNPBaseRoutingDestinationCollectionViewCell setShowDeviceImage:](self, "setShowDeviceImage:", 1LL);
  }

- (TVNPRoutingDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
}

@end