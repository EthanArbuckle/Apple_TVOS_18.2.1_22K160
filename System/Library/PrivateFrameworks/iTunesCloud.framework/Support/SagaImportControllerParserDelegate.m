@interface SagaImportControllerParserDelegate
- (BOOL)includesBookmarkable;
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldRestart;
- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap;
- (NSString)currentLyricsToken;
- (NSString)currentPaginationToken;
- (SagaImportControllerParserDelegate)init;
- (int64_t)currentCloudID;
- (unsigned)currentItemCount;
- (unsigned)processedItemCount;
- (unsigned)totalItemCount;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidStart:(id)a3;
- (void)setMutableCloudIDToLyricsTokenMap:(id)a3;
@end

@implementation SagaImportControllerParserDelegate

- (SagaImportControllerParserDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SagaImportControllerParserDelegate;
  v2 = -[SagaImportControllerParserDelegate init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableCloudIDToLyricsTokenMap = v2->_mutableCloudIDToLyricsTokenMap;
    v2->_mutableCloudIDToLyricsTokenMap = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)parserDidStart:(id)a3
{
  self->_shouldRestart = 0;
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = 0LL;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  id v6 = a3;
  if (self->_shouldRestart) {
    goto LABEL_2;
  }
  char v7 = 1;
  if ((int)a4 > 1835819883)
  {
    if ((int)a4 > 1836213102)
    {
      if (a4 == 1836213103 || a4 == 1836344175) {
        goto LABEL_3;
      }
      int v9 = 1836413554;
    }

    else
    {
      if (a4 == 1835819884 || a4 == 1835821428) {
        goto LABEL_3;
      }
      int v9 = 1836081511;
    }

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835819883)
  {
    if (a4 != 1835819884 && a4 != 1835821428 && a4 != 1836413554) {
      return 0;
    }
  }

  else if (a4 != 1633968755)
  {
    if (a4 == 1634165100 || a4 == 1634165106) {
      return _os_feature_enabled_impl("MediaPlayer", "Favoriting");
    }
    return 0;
  }

  return result;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    currentLyricsToken = self->_currentLyricsToken;
    self->_currentCloudID = 0LL;
    self->_currentLyricsToken = 0LL;
  }

  else if (a4 == 1836413554)
  {
    self->_shouldRestart = 1;
  }

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 <= 1836081510)
  {
    if (a4 != 1634026356)
    {
      if (a4 == 1634951787)
      {
        self->_includesBookmarkable = bswap32(*(_DWORD *)a5) != 0;
      }

      else if (a4 == 1835624804)
      {
        self->_currentCloudID = bswap32(*(_DWORD *)a5);
      }

      goto LABEL_15;
    }

    id v14 = v10;
    v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    currentLyricsToken = self->_currentLyricsToken;
    self->_currentLyricsToken = v11;
LABEL_13:

    id v10 = v14;
    goto LABEL_15;
  }

  switch(a4)
  {
    case 0x6D706167u:
      id v14 = v10;
      v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      currentLyricsToken = self->_currentPaginationToken;
      self->_currentPaginationToken = v13;
      goto LABEL_13;
    case 0x6D72636Fu:
      self->_currentItemCount = bswap32(*(_DWORD *)a5);
      break;
    case 0x6D74636Fu:
      self->_totalItemCount = bswap32(*(_DWORD *)a5);
      break;
  }

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428 && self->_currentCloudID >= 1)
  {
    id v11 = v6;
    NSUInteger v7 = -[NSString length](self->_currentLyricsToken, "length");
    id v6 = v11;
    if (v7)
    {
      currentLyricsToken = self->_currentLyricsToken;
      mutableCloudIDToLyricsTokenMap = self->_mutableCloudIDToLyricsTokenMap;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_currentCloudID));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( mutableCloudIDToLyricsTokenMap,  "setObject:forKeyedSubscript:",  currentLyricsToken,  v10);

      id v6 = v11;
    }
  }
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (BOOL)includesBookmarkable
{
  return self->_includesBookmarkable;
}

- (unsigned)totalItemCount
{
  return self->_totalItemCount;
}

- (unsigned)currentItemCount
{
  return self->_currentItemCount;
}

- (unsigned)processedItemCount
{
  return self->_processedItemCount;
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (int64_t)currentCloudID
{
  return self->_currentCloudID;
}

- (NSString)currentLyricsToken
{
  return self->_currentLyricsToken;
}

- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap
{
  return self->_mutableCloudIDToLyricsTokenMap;
}

- (void)setMutableCloudIDToLyricsTokenMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end