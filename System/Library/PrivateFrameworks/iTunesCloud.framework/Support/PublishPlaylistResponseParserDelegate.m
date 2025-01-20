@interface PublishPlaylistResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (NSString)playlistGlobalID;
- (NSString)playlistShareURL;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
@end

@implementation PublishPlaylistResponseParserDelegate

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835624803)
  {
    if (a4 != 1835624804 && a4 != 1835819884)
    {
      int v5 = 1835821428;
LABEL_8:
      if (a4 != v5) {
        return 0;
      }
    }
  }

  else if (a4 != 1634357319 && a4 != 1634358101)
  {
    int v5 = 1835360880;
    goto LABEL_8;
  }

  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1835360880 || v4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if (a4 == 1634358101)
  {
    id v14 = v10;
    v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    playlistShareURL = self->_playlistShareURL;
    self->_playlistShareURL = v13;
    goto LABEL_5;
  }

  if (a4 == 1634357319)
  {
    id v14 = v10;
    v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    playlistShareURL = self->_playlistGlobalID;
    self->_playlistGlobalID = v11;
LABEL_5:

    id v10 = v14;
  }
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (NSString)playlistShareURL
{
  return self->_playlistShareURL;
}

- (void).cxx_destruct
{
}

@end