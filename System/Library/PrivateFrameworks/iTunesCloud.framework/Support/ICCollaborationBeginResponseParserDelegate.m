@interface ICCollaborationBeginResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationBeginResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationBeginResponseParserDelegate

- (ICCollaborationBeginResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = -[ICCollaborationBeginResponseParserDelegate init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634357318)
  {
    return 0;
  }

  if ((int)a4 > 1835821427)
  {
    if (a4 == 1835821428) {
      return result;
    }
    int v5 = 1836413042;
  }

  else
  {
    if (a4 == 1634357319) {
      return result;
    }
    int v5 = 1835624804;
  }

  if (a4 != v5) {
    return 0;
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
  if ((int)a4 <= 1634354039)
  {
    switch(a4)
    {
      case 0x616A434Fu:
        id v16 = v10;
        -[ICCollaborationBeginResponse setCollaborationMode:]( self->_response,  "setCollaborationMode:",  bswap32(*(_DWORD *)a5));
        goto LABEL_21;
      case 0x616A4365u:
        id v16 = v10;
        -[ICCollaborationBeginResponse setIsCollaborative:](self->_response, "setIsCollaborative:", *a5 != 0);
        goto LABEL_21;
      case 0x616A4369u:
        response = self->_response;
        id v16 = v10;
        v12 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        -[ICCollaborationBeginResponse setCollaborationInviteURL:](response, "setCollaborationInviteURL:", v12);
        goto LABEL_10;
    }
  }

  else if ((int)a4 > 1835624803)
  {
    if (a4 == 1836413042)
    {
      id v16 = v10;
      -[ICCollaborationBeginResponse setUpdateRequired:](self->_response, "setUpdateRequired:", *a5 != 0);
      goto LABEL_21;
    }

    if (a4 == 1835624804)
    {
      uint64_t v14 = bswap32(*(_DWORD *)a5);
      unsigned int currentContainerDAAPCode = self->_currentContainerDAAPCode;
      if (currentContainerDAAPCode == 1836409964)
      {
        id v16 = v10;
        -[ICCollaborationBeginResponse setPlaylistCloudLibraryIDToDelete:]( self->_response,  "setPlaylistCloudLibraryIDToDelete:",  v14);
        goto LABEL_21;
      }

      if (currentContainerDAAPCode == 1835821428)
      {
        id v16 = v10;
        -[ICCollaborationBeginResponse setCollaborationCloudLibraryID:]( self->_response,  "setCollaborationCloudLibraryID:",  v14);
        goto LABEL_21;
      }
    }
  }

  else
  {
    if (a4 == 1634354040)
    {
      id v16 = v10;
      -[ICCollaborationBeginResponse setCollaborationInviteURLExpirationDate:]( self->_response,  "setCollaborationInviteURLExpirationDate:",  bswap32(*(_DWORD *)a5));
      goto LABEL_21;
    }

    if (a4 == 1634357319)
    {
      v11 = self->_response;
      id v16 = v10;
      v12 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      -[ICCollaborationBeginResponse setCollaborationGlobalID:](v11, "setCollaborationGlobalID:", v12);
LABEL_10:

LABEL_21:
      id v10 = v16;
    }
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