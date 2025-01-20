@interface MCConferenceRoomDisplayPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_removeConferenceRoomDisplayConfiguration;
- (void)_saveConferenceRoomDisplayConfiguration;
- (void)remove;
- (void)setAside;
@end

@implementation MCConferenceRoomDisplayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCConferenceRoomDisplayPayloadHandler _removeConferenceRoomDisplayConfiguration]( self,  "_removeConferenceRoomDisplayConfiguration");
  }
}

- (void)setAside
{
}

- (void)_saveConferenceRoomDisplayConfiguration
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v2 = [(id)MCPBSConferenceRoomDisplaySettingsClass() sharedInstance];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v5 customMessage]);
  [v3 setConferenceRoomDisplayMessage:v4];

  [v3 setMode:3];
}

- (void)_removeConferenceRoomDisplayConfiguration
{
  id v2 = objc_msgSend((id)MCPBSConferenceRoomDisplaySettingsClass(self, a2), "sharedInstance");
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  [v3 setConferenceRoomDisplayMessage:0];
  [v3 setMode:0];
}

@end