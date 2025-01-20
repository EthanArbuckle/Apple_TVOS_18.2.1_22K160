@interface MediaLibraryHelper
- (BOOL)iTunesRadioEnabled;
- (BOOL)showAudioBooks;
- (BOOL)showMusic;
- (BOOL)showPodcasts;
- (BOOL)showiTunesU;
- (MediaLibraryHelper)init;
- (int)getFilteredMediaTypesMask:(int)a3;
- (void)_updateITunesRadioEnabled;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)handleAppInstall:(id)a3;
- (void)handleAppUninstall:(id)a3;
@end

@implementation MediaLibraryHelper

- (void)_updateITunesRadioEnabled
{
  int AppIntegerValue = dword_10011BA30;
  if (dword_10011BA30 == -1)
  {
    int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0LL);
    dword_10011BA30 = AppIntegerValue;
    if (AppIntegerValue) {
      goto LABEL_3;
    }
  }

  else if (dword_10011BA30)
  {
LABEL_3:
    if (AppIntegerValue == -1)
    {
      int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"overrideRadioEnabled", @"com.apple.iapd", 0LL);
      dword_10011BA30 = AppIntegerValue;
    }

    unsigned __int8 v4 = AppIntegerValue == 1;
    goto LABEL_11;
  }

  if (self->_showMusic < 2u)
  {
    if (self->_showMusic) {
      unsigned __int8 v4 = objc_msgSend( +[MPRadioLibrary defaultRadioLibrary](MPRadioLibrary, "defaultRadioLibrary"),  "isEnabled");
    }
    else {
      unsigned __int8 v4 = 0;
    }
LABEL_11:
    self->_iTunesRadioEnabled = v4;
    return;
  }

  __break(0x550Au);
}

- (BOOL)iTunesRadioEnabled
{
  BOOL result = -[MediaLibraryHelper _updateITunesRadioEnabled](self, "_updateITunesRadioEnabled");
  unsigned int iTunesRadioEnabled = self->_iTunesRadioEnabled;
  if (iTunesRadioEnabled < 2) {
    return iTunesRadioEnabled != 0;
  }
  __break(0x550Au);
  return result;
}

- (MediaLibraryHelper)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MediaLibraryHelper;
  v2 = -[MediaLibraryHelper init](&v11, "init");
  if (!v2) {
    return v2;
  }
  char v3 = dword_10011BA34;
  if (dword_10011BA34 == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0LL);
    char v3 = AppBooleanValue;
    dword_10011BA34 = AppBooleanValue;
    if ((AppBooleanValue & 1) == 0) {
      goto LABEL_4;
    }
  }

  else if ((dword_10011BA34 & 1) == 0)
  {
LABEL_4:
    unsigned __int8 v4 = sub_1000D1C50((uint64_t)"com.apple.Music");
    goto LABEL_7;
  }

  unsigned __int8 v4 = 1;
LABEL_7:
  v2->_showMusic = v4;
  if ((v3 & 2) != 0) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = sub_1000D1C50((uint64_t)"com.apple.podcasts");
  }
  v2->_BOOL showPodcasts = v6;
  if ((v3 & 4) != 0) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = sub_1000D1C50((uint64_t)"com.apple.iBooks");
  }
  v2->_BOOL showAudioBooks = v7;
  if ((v3 & 8) != 0) {
    BOOL result = (MediaLibraryHelper *)1;
  }
  else {
    BOOL result = (MediaLibraryHelper *)sub_1000D1C50((uint64_t)"com.apple.itunesu");
  }
  v2->_showiTunesU = (char)result;
  if (v2->_showMusic >= 2u
    || (BOOL showPodcasts = v2->_showPodcasts, showPodcasts > 1)
    || (BOOL showAudioBooks = v2->_showAudioBooks, showAudioBooks > 1))
  {
    __break(0x550Au);
  }

  else
  {
    NSLog( @"MediaLibraryHelper init: M=%d P=%d B=%d U=%d",  v2->_showMusic,  showPodcasts,  showAudioBooks,  result);
    -[MediaLibraryHelper _updateITunesRadioEnabled](v2, "_updateITunesRadioEnabled");
    BOOL result = objc_alloc_init(&OBJC_CLASS___IAPWorkspaceObserver);
    if ((((int)v2 + 8) & 7LL) == 0)
    {
      v2->_workspaceObserver = (IAPWorkspaceObserver *)result;
      -[MediaLibraryHelper setDelegate:](result, "setDelegate:", v2);
      -[IAPWorkspaceObserver startObserving](v2->_workspaceObserver, "startObserving");
      return v2;
    }
  }

  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((int)self + 8) & 7LL) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    -[IAPWorkspaceObserver stopObserving](self->_workspaceObserver, "stopObserving");
    -[IAPWorkspaceObserver setDelegate:](self->_workspaceObserver, "setDelegate:", 0LL);

    self->_workspaceObserver = 0LL;
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___MediaLibraryHelper;
    -[MediaLibraryHelper dealloc](&v3, "dealloc");
  }

- (void)handleAppInstall:(id)a3
{
  if (!objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.Music"))
  {
    if (objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.podcasts"))
    {
      unsigned int showPodcasts = self->_showPodcasts;
      if (showPodcasts > 1) {
        goto LABEL_24;
      }
      BOOL v7 = 0;
      self->_unsigned int showPodcasts = 1;
    }

    else if (objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.iBooks"))
    {
      unsigned int showPodcasts = self->_showAudioBooks;
      if (showPodcasts > 1) {
        goto LABEL_24;
      }
      BOOL v7 = 0;
      self->_BOOL showAudioBooks = 1;
    }

    else
    {
      if (!objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.itunesu"))
      {
        BOOL v6 = 0;
        BOOL v7 = 0;
        goto LABEL_14;
      }

      unsigned int showPodcasts = self->_showiTunesU;
      if (showPodcasts > 1)
      {
LABEL_24:
        __break(0x550Au);
        return;
      }

      BOOL v7 = 0;
      self->_BOOL showiTunesU = 1;
    }

    BOOL v6 = showPodcasts == 0;
    goto LABEL_14;
  }

  unsigned int showMusic = self->_showMusic;
  if (showMusic >= 2) {
    goto LABEL_24;
  }
  self->_unsigned int showMusic = 1;
  BOOL v6 = showMusic == 0;
  BOOL v7 = v6;
LABEL_14:
  BOOL v9 = self->_showMusic;
  BOOL v10 = self->_showPodcasts;
  BOOL showiTunesU = self->_showiTunesU;
  NSLog( @"MediaLibraryHelper handleAppInstall: M=%d P=%d B=%d U=%d sendMusicNotification=%d sendNotification=%d",  v9,  v10,  self->_showAudioBooks,  showiTunesU,  v7,  v6);
  if (v7)
  {
    v12 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v12, "postNotificationName:object:", off_10011B9C0, 0LL);
  }

  if (v6)
  {
    v13 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v13, "postNotificationName:object:", off_10011B9B8, 0LL);
  }

- (void)handleAppUninstall:(id)a3
{
  unsigned int AppBooleanValue = dword_10011BA34;
  if (dword_10011BA34 == -1)
  {
    unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryAccessOverride", @"com.apple.iapd", 0LL);
    dword_10011BA34 = AppBooleanValue;
  }

  if (!objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.Music"))
  {
    if (objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.podcasts"))
    {
      unsigned int showPodcasts = self->_showPodcasts;
      if (showPodcasts > 1) {
        goto LABEL_26;
      }
      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 1) & 1;
      self->_unsigned int showPodcasts = (AppBooleanValue & 2) != 0;
    }

    else if (objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.iBooks"))
    {
      unsigned int showPodcasts = self->_showAudioBooks;
      if (showPodcasts > 1) {
        goto LABEL_26;
      }
      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 2) & 1;
      self->_BOOL showAudioBooks = (AppBooleanValue & 4) != 0;
    }

    else
    {
      if (!objc_msgSend( objc_msgSend(a3, "applicationIdentifier"),  "isEqualToString:",  @"com.apple.itunesu"))
      {
        BOOL v8 = 0;
        BOOL v9 = 0;
        goto LABEL_16;
      }

      unsigned int showPodcasts = self->_showiTunesU;
      if (showPodcasts > 1)
      {
LABEL_26:
        __break(0x550Au);
        return;
      }

      BOOL v9 = 0;
      int v11 = (AppBooleanValue >> 3) & 1;
      self->_BOOL showiTunesU = (AppBooleanValue & 8) != 0;
    }

    BOOL v8 = v11 != showPodcasts;
    goto LABEL_16;
  }

  unsigned int showMusic = self->_showMusic;
  if (showMusic >= 2) {
    goto LABEL_26;
  }
  int v7 = AppBooleanValue & 1;
  self->_unsigned int showMusic = AppBooleanValue & 1;
  BOOL v8 = v7 != showMusic;
  BOOL v9 = v8;
LABEL_16:
  BOOL v12 = self->_showMusic;
  BOOL v13 = self->_showPodcasts;
  BOOL showiTunesU = self->_showiTunesU;
  NSLog( @"MediaLibraryHelper handleAppUninstall: M=%d P=%d B=%d U=%d sendMusicNotification=%d sendNotification=%d",  v12,  v13,  self->_showAudioBooks,  showiTunesU,  v9,  v8);
  if (v9)
  {
    v15 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v15, "postNotificationName:object:", off_10011B9C8, 0LL);
  }

  if (v8)
  {
    v16 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v16, "postNotificationName:object:", off_10011B9B8, 0LL);
  }

- (int)getFilteredMediaTypesMask:(int)a3
{
  if (self->_showMusic >= 2u
    || self->_showPodcasts > 1u
    || self->_showAudioBooks > 1u
    || self->_showiTunesU > 1u)
  {
    __break(0x550Au);
  }

  else
  {
    if (a3) {
      int v3 = a3;
    }
    else {
      int v3 = 7423;
    }
    if (self->_showMusic) {
      unsigned int v4 = v3;
    }
    else {
      unsigned int v4 = v3 & 0xFFFFF7FE;
    }
    if (!self->_showPodcasts) {
      v4 &= 0xFFFFFBFD;
    }
    if (!self->_showAudioBooks) {
      v4 &= ~4u;
    }
    if (self->_showiTunesU) {
      LODWORD(self) = v4;
    }
    else {
      LODWORD(self) = v4 & 0xFFFFEFF7;
    }
  }

  return (int)self;
}

- (void)applicationsDidInstall:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[MediaLibraryHelper handleAppInstall:]( self,  "handleAppInstall:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        BOOL v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (void)applicationsWillUninstall:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[MediaLibraryHelper handleAppUninstall:]( self,  "handleAppUninstall:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        BOOL v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (void)applicationsDidUninstall:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      BOOL v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[MediaLibraryHelper handleAppUninstall:]( self,  "handleAppUninstall:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        BOOL v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (BOOL)showMusic
{
  return self->_showMusic;
}

- (BOOL)showPodcasts
{
  return self->_showPodcasts;
}

- (BOOL)showAudioBooks
{
  return self->_showAudioBooks;
}

- (BOOL)showiTunesU
{
  return self->_showiTunesU;
}

@end