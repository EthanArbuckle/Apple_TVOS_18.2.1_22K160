@interface ICCollaborationResetInvitationURLResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationResetInvitationURLResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationResetInvitationURLResponseParserDelegate

- (ICCollaborationResetInvitationURLResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = -[ICCollaborationResetInvitationURLResponseParserDelegate init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1634354002;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  switch(a4)
  {
    case 0x616A4369u:
      id v14 = v10;
      v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      response = self->_response;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
      -[ICCollaborationResetInvitationURLResponse setUpdatedInvitationURL:](response, "setUpdatedInvitationURL:", v13);

      goto LABEL_7;
    case 0x616A4378u:
      id v14 = v10;
      -[ICCollaborationResetInvitationURLResponse setUpdatedInviteURLExpirationDate:]( self->_response,  "setUpdatedInviteURLExpirationDate:",  bswap32(*(_DWORD *)a5));
      goto LABEL_7;
    case 0x6D757072u:
      id v14 = v10;
      -[ICCollaborationResetInvitationURLResponse setUpdateRequired:](self->_response, "setUpdateRequired:", *a5 != 0);
LABEL_7:
      id v10 = v14;
      break;
  }
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  self->_currentContainerDAAPCode = a4;
}

- (void).cxx_destruct
{
}

@end