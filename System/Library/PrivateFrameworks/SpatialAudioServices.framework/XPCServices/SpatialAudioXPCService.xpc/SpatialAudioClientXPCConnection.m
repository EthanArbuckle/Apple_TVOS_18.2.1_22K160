@interface SpatialAudioClientXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (SpatialAudioClient)spatialAudioClient;
- (SpatialAudioXPCService)xpcService;
- (void)fetchSpatialSoundProfileRecordForClient:(id)a3 WithCompletion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setSpatialAudioClient:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcService:(id)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation SpatialAudioClientXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.SpatialAudioServices"));
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.developer.spatial-audio.profile-access"));
  unsigned int v9 = [v8 isEqual:&__kCFBooleanTrue];

  if ((v7 & 1) != 0 || v9)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_1000089F8 <= 90)
    {
      if (dword_1000089F8 != -1 || _LogCategory_Initialize(&dword_1000089F8, 90LL)) {
        LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.SpatialAudioServices");
      }
      if (dword_1000089F8 <= 90
        && (dword_1000089F8 != -1 || _LogCategory_Initialize(&dword_1000089F8, 90LL)))
      {
        LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.developer.spatial-audio.profile-access");
      }
    }

    if (a3)
    {
      uint64_t v10 = NSErrorF( NSOSStatusErrorDomain,  4294896128LL,  "Missing entitlement '%@' or '%@'",  @"com.apple.SpatialAudioServices",  @"com.apple.developer.spatial-audio.profile-access");
      id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      BOOL result = 0;
      *a3 = v11;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)xpcConnectionInvalidated
{
  v6 = self->_spatialAudioClient;
  spatialAudioClient = self->_spatialAudioClient;
  self->_spatialAudioClient = 0LL;

  v4 = v6;
  if (v6)
  {
    if (dword_1000089F8 <= 30)
    {
      if (dword_1000089F8 != -1 || (int v5 = _LogCategory_Initialize(&dword_1000089F8, 30LL), v4 = v6, v5))
      {
        LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection xpcConnectionInvalidated]",  30LL,  "Invalidate: %@",  v4);
        v4 = v6;
      }
    }

    -[SpatialAudioClient invalidate](v4, "invalidate");
    v4 = v6;
  }
}

- (void)fetchSpatialSoundProfileRecordForClient:(id)a3 WithCompletion:(id)a4
{
  id v7 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10000281C;
  v25 = sub_10000282C;
  id v26 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100002834;
  v18[3] = &unk_100004208;
  v20 = &v21;
  id v8 = a4;
  id v19 = v8;
  unsigned int v9 = objc_retainBlock(v18);
  if (dword_1000089F8 <= 30 && (dword_1000089F8 != -1 || _LogCategory_Initialize(&dword_1000089F8, 30LL))) {
    LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection fetchSpatialSoundProfileRecordForClient:WithCompletion:]",  30LL,  "Fetching spatial sound profile for client: %@",  v7);
  }
  uint64_t v10 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v11 = -[SpatialAudioClientXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_spatialAudioClient, a3);
    if (v8)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___BTCloudServicesClient);
      [v12 setDispatchQueue:self->_dispatchQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000028F8;
      v15[3] = &unk_100004230;
      id v16 = v8;
      [v12 fetchSoundProfileRecordWithCompletion:v15];
    }

    else
    {
      uint64_t v13 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "No completion provided");
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      id v12 = (id)v22[5];
      v22[5] = v14;
    }
  }

  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v21, 8);
}

- (SpatialAudioClient)spatialAudioClient
{
  return self->_spatialAudioClient;
}

- (void)setSpatialAudioClient:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (SpatialAudioXPCService)xpcService
{
  return self->_xpcService;
}

- (void)setXpcService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end