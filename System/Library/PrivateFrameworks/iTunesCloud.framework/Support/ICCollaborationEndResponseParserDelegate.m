@interface ICCollaborationEndResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationEndResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationEndResponseParserDelegate

- (ICCollaborationEndResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = -[ICCollaborationEndResponseParserDelegate init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1835624803)
  {
    if (a4 == 1634354002) {
      return result;
    }
    int v5 = 1634357319;
    goto LABEL_7;
  }

  if (a4 != 1835624804 && a4 != 1835821428)
  {
    int v5 = 1836413042;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }

  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835821428 || a4 == 1836409964;
  return a4 == 1634354002 || v4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  switch(a4)
  {
    case 0x616A5047u:
      response = self->_response;
      id v15 = v10;
      v14 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      -[ICCollaborationEndResponse setConvertedPlaylistGlobalID:](response, "setConvertedPlaylistGlobalID:", v14);

      goto LABEL_10;
    case 0x6D757072u:
      id v15 = v10;
      -[ICCollaborationEndResponse setUpdateRequired:](self->_response, "setUpdateRequired:", *a5 != 0);
      goto LABEL_10;
    case 0x6D696964u:
      uint64_t v11 = bswap32(*(_DWORD *)a5);
      unsigned int currentContainerDAAPCode = self->_currentContainerDAAPCode;
      if (currentContainerDAAPCode == 1836409964)
      {
        id v15 = v10;
        -[ICCollaborationEndResponse setPlaylistCloudLibraryIDToDelete:]( self->_response,  "setPlaylistCloudLibraryIDToDelete:",  v11);
        goto LABEL_10;
      }

      if (currentContainerDAAPCode == 1835821428)
      {
        id v15 = v10;
        -[ICCollaborationEndResponse setConvertedPlaylistCloudLibraryID:]( self->_response,  "setConvertedPlaylistCloudLibraryID:",  v11);
LABEL_10:
        id v10 = v15;
      }

      break;
  }
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  self->_unsigned int currentContainerDAAPCode = a4;
}

- (void).cxx_destruct
{
}

@end