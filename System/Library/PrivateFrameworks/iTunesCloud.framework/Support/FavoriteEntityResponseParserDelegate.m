@interface FavoriteEntityResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (FavoriteEntityResponseParserDelegate)initWithEntityType:(int64_t)a3;
- (NSMutableDictionary)addedItems;
- (NSString)currentAlbumCloudLibraryID;
- (NSString)currentArtistCloudLibraryID;
- (NSString)currentGlobalPlaylistID;
- (int64_t)entityType;
- (unint64_t)currentAdamID;
- (unint64_t)currentCloudID;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation FavoriteEntityResponseParserDelegate

- (FavoriteEntityResponseParserDelegate)initWithEntityType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___FavoriteEntityResponseParserDelegate;
  v4 = -[FavoriteEntityResponseParserDelegate init](&v8, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    addedItems = v4->_addedItems;
    v4->_addedItems = (NSMutableDictionary *)v5;

    v4->_entityType = a3;
  }

  return v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634888035)
  {
    if ((int)a4 > 1634353988)
    {
      if (a4 == 1634353989) {
        return result;
      }
      unsigned __int16 v6 = 20551;
    }

    else
    {
      if (a4 == 1634025833) {
        return result;
      }
      unsigned __int16 v6 = 16745;
    }

    int v5 = v6 | 0x616A0000;
    goto LABEL_14;
  }

  if ((int)a4 <= 1835819883)
  {
    if (a4 == 1634888036) {
      return result;
    }
    int v5 = 1835624804;
    goto LABEL_14;
  }

  if (a4 != 1835819884 && a4 != 1835821428)
  {
    int v5 = 1836413042;
LABEL_14:
    if (a4 != v5) {
      return 0;
    }
  }

  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1634353989 || a4 == 1835821428 || a4 == 1835819884;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_currentCloudID = 0LL;
    self->_currentAdamID = 0LL;
    currentArtistCloudLibraryID = self->_currentArtistCloudLibraryID;
    self->_currentArtistCloudLibraryID = 0LL;

    currentAlbumCloudLibraryID = self->_currentAlbumCloudLibraryID;
    self->_currentAlbumCloudLibraryID = 0LL;

    currentGlobalPlaylistID = self->_currentGlobalPlaylistID;
    self->_currentGlobalPlaylistID = 0LL;
  }

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 > 1634888035)
  {
    switch(a4)
    {
      case 0x61726964u:
        if (self->_entityType == 2)
        {
          id v16 = v10;
          v14 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          currentArtistCloudLibraryID = self->_currentArtistCloudLibraryID;
          self->_currentArtistCloudLibraryID = v14;
          goto LABEL_17;
        }

        break;
      case 0x6D757072u:
        self->_updateRequired = *a5 != 0;
        break;
      case 0x6D696964u:
        if (a6 == 8)
        {
        }

        else
        {
          if (a6 != 4) {
            break;
          }
          unint64_t v13 = bswap32(*(_DWORD *)a5);
        }

        self->_currentCloudID = v13;
        break;
    }
  }

  else
  {
    switch(a4)
    {
      case 0x61654169u:
        break;
      case 0x616A4169u:
        if (self->_entityType == 3)
        {
          id v16 = v10;
          v15 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          currentArtistCloudLibraryID = self->_currentAlbumCloudLibraryID;
          self->_currentAlbumCloudLibraryID = v15;
          goto LABEL_17;
        }

        break;
      case 0x616A5047u:
        id v16 = v10;
        v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        currentArtistCloudLibraryID = self->_currentGlobalPlaylistID;
        self->_currentGlobalPlaylistID = v11;
LABEL_17:

        id v10 = v16;
        break;
    }
  }
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 1835821428)
  {
    id v18 = v6;
    if (self->_currentCloudID)
    {
      if (self->_currentAdamID)
      {
        addedItems = self->_addedItems;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentAdamID));
        -[NSMutableDictionary setObject:forKey:](addedItems, "setObject:forKey:", v9, v10);

LABEL_11:
        v7 = v18;
        goto LABEL_12;
      }

      NSUInteger v16 = -[NSString length](self->_currentGlobalPlaylistID, "length");
      v7 = v18;
      if (v16)
      {
        v17 = self->_addedItems;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentCloudID));
        currentGlobalPlaylistID = self->_currentGlobalPlaylistID;
        unint64_t v13 = v17;
        v14 = (NSString *)v9;
        goto LABEL_10;
      }
    }

    else
    {
      currentAlbumCloudLibraryID = self->_currentAlbumCloudLibraryID;
      if (currentAlbumCloudLibraryID || (currentAlbumCloudLibraryID = self->_currentArtistCloudLibraryID) != 0LL)
      {
        v12 = self->_addedItems;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentAdamID));
        unint64_t v13 = v12;
        v14 = currentAlbumCloudLibraryID;
        currentGlobalPlaylistID = (NSString *)v9;
LABEL_10:
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, currentGlobalPlaylistID);
        goto LABEL_11;
      }
    }
  }

- (NSMutableDictionary)addedItems
{
  return self->_addedItems;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (unint64_t)currentCloudID
{
  return self->_currentCloudID;
}

- (unint64_t)currentAdamID
{
  return self->_currentAdamID;
}

- (NSString)currentGlobalPlaylistID
{
  return self->_currentGlobalPlaylistID;
}

- (NSString)currentAlbumCloudLibraryID
{
  return self->_currentAlbumCloudLibraryID;
}

- (NSString)currentArtistCloudLibraryID
{
  return self->_currentArtistCloudLibraryID;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
}

@end