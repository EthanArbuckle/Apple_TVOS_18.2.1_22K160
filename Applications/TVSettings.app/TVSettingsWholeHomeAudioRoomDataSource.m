@interface TVSettingsWholeHomeAudioRoomDataSource
+ (TVSettingsWholeHomeAudioRoomDataSource)new;
- (BOOL)canBeRemovedFromHome;
- (NSArray)existingRooms;
- (NSArray)suggestedRoomNames;
- (TVCSHome)home;
- (TVSettingsWholeHomeAudioRoomDataSource)init;
- (TVSettingsWholeHomeAudioRoomDataSource)initWithHome:(id)a3;
- (TVSettingsWholeHomeAudioRoomDataSourceDelegate)delegate;
- (void)_update;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setExistingRooms:(id)a3;
- (void)setHome:(id)a3;
- (void)setSuggestedRoomNames:(id)a3;
@end

@implementation TVSettingsWholeHomeAudioRoomDataSource

+ (TVSettingsWholeHomeAudioRoomDataSource)new
{
  return 0LL;
}

- (TVSettingsWholeHomeAudioRoomDataSource)init
{
  return 0LL;
}

- (TVSettingsWholeHomeAudioRoomDataSource)initWithHome:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioRoomDataSource;
  v6 = -[TVSettingsWholeHomeAudioRoomDataSource init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v8 addObserver:v7 forKeyPath:@"localAccessory" options:1 context:off_1001E0B08];
    [v8 addObserver:v7 forKeyPath:@"allOwnedHomes" options:1 context:off_1001E0B10];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"localAccessory" context:off_1001E0B08];
  [v3 removeObserver:self forKeyPath:@"allOwnedHomes" context:off_1001E0B10];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioRoomDataSource;
  -[TVSettingsWholeHomeAudioRoomDataSource dealloc](&v4, "dealloc");
}

- (BOOL)canBeRemovedFromHome
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v4 = [v3 homeConfigurationState];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource home](self, "home"));
  if (v5) {
    BOOL v6 = v4 == (id)4;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v6;

  return v7;
}

- (NSArray)existingRooms
{
  existingRooms = self->_existingRooms;
  if (!existingRooms)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource home](self, "home"));
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 rooms]);
    BOOL v6 = self->_existingRooms;
    self->_existingRooms = v5;

    BOOL v7 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSArray sortedArrayUsingComparator:]( self->_existingRooms,  "sortedArrayUsingComparator:",  &stru_100194A20));
    v8 = self->_existingRooms;
    self->_existingRooms = v7;

    existingRooms = self->_existingRooms;
  }

  return existingRooms;
}

- (NSArray)suggestedRoomNames
{
  suggestedRoomNames = self->_suggestedRoomNames;
  if (!suggestedRoomNames)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource home](self, "home"));
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource existingRooms](self, "existingRooms"));
      id v6 = [v5 count];
      else {
        uint64_t v7 = 6LL - (void)v6;
      }

      v8 = v4;
      uint64_t v9 = v7;
    }

    else
    {
      v8 = &OBJC_CLASS___TVCSHome;
      uint64_t v9 = 6LL;
    }

    objc_super v10 = (NSArray *)objc_claimAutoreleasedReturnValue([v8 suggestedRoomNames:v9]);
    v11 = self->_suggestedRoomNames;
    self->_suggestedRoomNames = v10;

    v12 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSArray sortedArrayUsingSelector:]( self->_suggestedRoomNames,  "sortedArrayUsingSelector:",  "compare:"));
    v13 = self->_suggestedRoomNames;
    self->_suggestedRoomNames = v12;

    suggestedRoomNames = self->_suggestedRoomNames;
  }

  return suggestedRoomNames;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0B08 == a6 || off_1001E0B10 == a6)
  {
    -[TVSettingsWholeHomeAudioRoomDataSource _update](self, "_update", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioRoomDataSource;
    -[TVSettingsWholeHomeAudioRoomDataSource observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_update
{
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource home](self, "home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allOwnedHomes]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D8E14;
  v12[3] = &unk_100194A48;
  id v13 = v3;
  id v6 = v3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_objectsPassingTest:", v12));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  -[TVSettingsWholeHomeAudioRoomDataSource setHome:](self, "setHome:", v8);
  -[TVSettingsWholeHomeAudioRoomDataSource setExistingRooms:](self, "setExistingRooms:", 0LL);
  -[TVSettingsWholeHomeAudioRoomDataSource setSuggestedRoomNames:](self, "setSuggestedRoomNames:", 0LL);
  if (v11)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource delegate](self, "delegate"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomDataSource home](self, "home"));

    if (!v10) {
      [v9 wholeHomeAudioRoomDataSourceHomeWasRemoved:self];
    }
    [v9 wholeHomeAudioRoomDataSourceDidUpdate:self];
  }
}

- (TVCSHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void)setExistingRooms:(id)a3
{
}

- (void)setSuggestedRoomNames:(id)a3
{
}

- (TVSettingsWholeHomeAudioRoomDataSourceDelegate)delegate
{
  return (TVSettingsWholeHomeAudioRoomDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end