@interface MRDTelevisionSiriContext
- (BOOL)didStartRecording;
- (BOOL)valid;
- (MRDExternalDeviceServerClientConnection)client;
- (MRDTelevisionSiriContext)initWithClient:(id)a3;
- (NSDate)timeBegan;
- (PBSMediaRemoteSiriContext)pineboardContext;
- (id)description;
- (void)setDidStartRecording:(BOOL)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation MRDTelevisionSiriContext

- (MRDTelevisionSiriContext)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRDTelevisionSiriContext;
  v6 = -[MRDTelevisionSiriContext init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSDate);
    timeBegan = v7->_timeBegan;
    v7->_timeBegan = v8;

    *(_WORD *)&v7->_valid = 1;
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection deviceInfo](self->_client, "deviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p clientID=%@, timeBegan=%@>",  v5,  self,  v6,  self->_timeBegan));

  return v7;
}

- (PBSMediaRemoteSiriContext)pineboardContext
{
  pineboardContext = self->_pineboardContext;
  if (!pineboardContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection registeredVirtualVoiceInputDevices]( self->_client,  "registeredVirtualVoiceInputDevices"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v6 = [v5 unsignedIntValue];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v6));
    v8 = (PBSMediaRemoteSiriContext *)objc_alloc_init((Class)MSVWeakLinkClass( @"PBSMediaRemoteSiriContext",  @"PineBoardServices"));
    v9 = self->_pineboardContext;
    self->_pineboardContext = v8;

    -[PBSMediaRemoteSiriContext setDeviceID:](self->_pineboardContext, "setDeviceID:", v7);
    pineboardContext = self->_pineboardContext;
  }

  return pineboardContext;
}

- (MRDExternalDeviceServerClientConnection)client
{
  return self->_client;
}

- (NSDate)timeBegan
{
  return self->_timeBegan;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)didStartRecording
{
  return self->_didStartRecording;
}

- (void)setDidStartRecording:(BOOL)a3
{
  self->_didStartRecording = a3;
}

- (void).cxx_destruct
{
}

@end