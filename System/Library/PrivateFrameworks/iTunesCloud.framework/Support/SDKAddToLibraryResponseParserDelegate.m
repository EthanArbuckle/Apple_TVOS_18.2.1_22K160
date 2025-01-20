@interface SDKAddToLibraryResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (NSMutableDictionary)addedItems;
- (NSString)currentGlobalID;
- (SDKAddToLibraryResponseParserDelegate)init;
- (unint64_t)currentAdamID;
- (unint64_t)currentCloudID;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation SDKAddToLibraryResponseParserDelegate

- (SDKAddToLibraryResponseParserDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDKAddToLibraryResponseParserDelegate;
  v2 = -[SDKAddToLibraryResponseParserDelegate init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    addedItems = v2->_addedItems;
    v2->_addedItems = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835624803)
  {
    if ((int)a4 > 1835821427)
    {
      if (a4 == 1835821428) {
        return result;
      }
      int v6 = 1836413042;
    }

    else
    {
      if (a4 == 1835624804) {
        return result;
      }
      int v6 = 1835819884;
    }
  }

  else
  {
    if ((int)a4 > 1634353992)
    {
      if (a4 == 1634353993) {
        return result;
      }
      unsigned __int16 v5 = 20551;
    }

    else
    {
      if (a4 == 1634025833) {
        return result;
      }
      unsigned __int16 v5 = 17221;
    }

    int v6 = v5 | 0x616A0000;
  }

  if (a4 != v6) {
    return 0;
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1634353989 || v4;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_currentCloudID = 0LL;
    self->_currentAdamID = 0LL;
    currentGlobalID = self->_currentGlobalID;
    self->_currentGlobalID = 0LL;
  }

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 > 1835624803)
  {
    if (a4 == 1836413042)
    {
      self->_updateRequired = *a5 != 0;
      goto LABEL_14;
    }

    if (a4 == 1835624804)
    {
      if (a6 == 8)
      {
      }

      else
      {
        if (a6 != 4) {
          goto LABEL_14;
        }
        unint64_t v13 = bswap32(*(_DWORD *)a5);
      }

      self->_currentCloudID = v13;
    }
  }

  else if (a4 == 1634025833)
  {
  }

  else if (a4 == 1634357319)
  {
    id v14 = v10;
    v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    currentGlobalID = self->_currentGlobalID;
    self->_currentGlobalID = v11;

    id v10 = v14;
  }

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 1835821428 && self->_currentCloudID)
  {
    id v13 = v6;
    if (self->_currentAdamID)
    {
      addedItems = self->_addedItems;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentAdamID));
      -[NSMutableDictionary setObject:forKey:](addedItems, "setObject:forKey:", v9, v10);

LABEL_7:
      v7 = v13;
      goto LABEL_8;
    }

    NSUInteger v11 = -[NSString length](self->_currentGlobalID, "length");
    v7 = v13;
    if (v11)
    {
      v12 = self->_addedItems;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_currentCloudID));
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, self->_currentGlobalID);
      goto LABEL_7;
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

- (NSString)currentGlobalID
{
  return self->_currentGlobalID;
}

- (void).cxx_destruct
{
}

@end