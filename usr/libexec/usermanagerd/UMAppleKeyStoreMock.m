@interface UMAppleKeyStoreMock
- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5;
- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7;
- (BOOL)deleteIdentity:(id)a3 error:(id *)a4;
- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)ignoreIdentityMethods;
- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3;
- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6;
- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4;
- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5;
- (BOOL)unmapVolume:(id)a3 error:(id *)a4;
- (UMAppleKeyStoreMock)init;
- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (void)setIgnoreIdentityMethods:(BOOL)a3;
@end

@implementation UMAppleKeyStoreMock

- (UMAppleKeyStoreMock)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UMAppleKeyStoreMock;
  v2 = -[UMAppleKeyStoreMock init](&v13, "init");
  if (!v2) {
    sub_1000A9AD0();
  }
  v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  bootstrappedVolumes = v3->_bootstrappedVolumes;
  v3->_bootstrappedVolumes = (NSMutableDictionary *)v4;

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  personas = v3->_personas;
  v3->_personas = (NSMutableDictionary *)v6;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  mappedVolumes = v3->_mappedVolumes;
  v3->_mappedVolumes = (NSMutableDictionary *)v8;

  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  mappedVolumePersonas = v3->_mappedVolumePersonas;
  v3->_mappedVolumePersonas = (NSMutableDictionary *)v10;

  return v3;
}

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods")) {
    goto LABEL_12;
  }
  if (!self || !self->_bootstrapVolumeErrorOverride)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    if (self) {
      bootstrappedVolumes = self->_bootstrappedVolumes;
    }
    else {
      bootstrappedVolumes = 0LL;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bootstrappedVolumes, "setObject:forKeyedSubscript:", v11, v8);

LABEL_12:
    BOOL v10 = 1;
    goto LABEL_13;
  }

  if (a5)
  {
    v9 = self->_bootstrapVolumeErrorOverride;
    BOOL v10 = 0;
    *a5 = v9;
  }

  else
  {
    BOOL v10 = 0;
  }

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (self && self->_dataWrappingDataErrorOverride)
  {
    if (a4)
    {
      id v8 = self->_dataWrappingDataErrorOverride;
      v9 = 0LL;
      *a4 = v8;
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    if (a4) {
      *a4 = 0LL;
    }
    if (self && self->_dataWrappingDataReturnOverride)
    {
      BOOL v10 = self->_dataWrappingDataReturnOverride;
    }

    else
    {
      id v11 = sub_100018C20((uint64_t)v6);
      BOOL v10 = (NSData *)objc_claimAutoreleasedReturnValue(v11);
    }

    v9 = v10;
  }

  return v9;
}

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (self && self->_dataUnwrappingDataErrorOverride)
  {
    if (a4)
    {
      id v8 = self->_dataUnwrappingDataErrorOverride;
      v9 = 0LL;
      *a4 = v8;
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    if (a4) {
      *a4 = 0LL;
    }
    if (self && self->_dataUnwrappingDataReturnOverride)
    {
      BOOL v10 = self->_dataUnwrappingDataReturnOverride;
    }

    else
    {
      id v11 = sub_100018C84(v6);
      BOOL v10 = (NSData *)objc_claimAutoreleasedReturnValue(v11);
    }

    v9 = v10;
  }

  return v9;
}

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0LL;
  }
  if (self)
  {
    createIdentityWithUUIDErrorOverride = self->_createIdentityWithUUIDErrorOverride;
    if (!a7) {
      return createIdentityWithUUIDErrorOverride == 0LL;
    }
  }

  else
  {
    createIdentityWithUUIDErrorOverride = 0LL;
    if (!a7) {
      return createIdentityWithUUIDErrorOverride == 0LL;
    }
  }

  if (createIdentityWithUUIDErrorOverride)
  {
    if (self) {
      self = self->_createIdentityWithUUIDErrorOverride;
    }
    *a7 = self;
  }

  return createIdentityWithUUIDErrorOverride == 0LL;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  if (self)
  {
    deleteIdentityErrorOverride = self->_deleteIdentityErrorOverride;
    if (!a4) {
      return deleteIdentityErrorOverride == 0LL;
    }
  }

  else
  {
    deleteIdentityErrorOverride = 0LL;
    if (!a4) {
      return deleteIdentityErrorOverride == 0LL;
    }
  }

  if (deleteIdentityErrorOverride)
  {
    if (self) {
      self = self->_deleteIdentityErrorOverride;
    }
    *a4 = self;
  }

  return deleteIdentityErrorOverride == 0LL;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  if (self) {
    LOBYTE(self) = self->_isIdentityLoadedForSessionReturnOverride;
  }
  return (char)self;
}

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  if (self)
  {
    loadIdentityErrorOverride = self->_loadIdentityErrorOverride;
    if (!a5) {
      return loadIdentityErrorOverride == 0LL;
    }
  }

  else
  {
    loadIdentityErrorOverride = 0LL;
    if (!a5) {
      return loadIdentityErrorOverride == 0LL;
    }
  }

  if (loadIdentityErrorOverride)
  {
    if (self) {
      self = self->_loadIdentityErrorOverride;
    }
    *a5 = self;
  }

  return loadIdentityErrorOverride == 0LL;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  if (self)
  {
    unloadIdentityErrorOverride = self->_unloadIdentityErrorOverride;
    if (!a4) {
      return unloadIdentityErrorOverride == 0LL;
    }
  }

  else
  {
    unloadIdentityErrorOverride = 0LL;
    if (!a4) {
      return unloadIdentityErrorOverride == 0LL;
    }
  }

  if (unloadIdentityErrorOverride)
  {
    if (self) {
      self = self->_unloadIdentityErrorOverride;
    }
    *a4 = self;
  }

  return unloadIdentityErrorOverride == 0LL;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  if (self)
  {
    unlockIdentityErrorOverride = self->_unlockIdentityErrorOverride;
    if (!a5) {
      return unlockIdentityErrorOverride == 0LL;
    }
  }

  else
  {
    unlockIdentityErrorOverride = 0LL;
    if (!a5) {
      return unlockIdentityErrorOverride == 0LL;
    }
  }

  if (unlockIdentityErrorOverride)
  {
    if (self) {
      self = self->_unlockIdentityErrorOverride;
    }
    *a5 = self;
  }

  return unlockIdentityErrorOverride == 0LL;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0LL;
  }
  if (self)
  {
    loginIdentityErrorOverride = self->_loginIdentityErrorOverride;
    if (!a6) {
      return loginIdentityErrorOverride == 0LL;
    }
  }

  else
  {
    loginIdentityErrorOverride = 0LL;
    if (!a6) {
      return loginIdentityErrorOverride == 0LL;
    }
  }

  if (loginIdentityErrorOverride)
  {
    if (self) {
      self = self->_loginIdentityErrorOverride;
    }
    *a6 = self;
  }

  return loginIdentityErrorOverride == 0LL;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a3;
  if (a6) {
    *a6 = 0LL;
  }
  if (self)
  {
    addPersonaToSessionErrorOverride = self->_addPersonaToSessionErrorOverride;
    if (addPersonaToSessionErrorOverride)
    {
      if (a6) {
        *a6 = self->_addPersonaToSessionErrorOverride;
      }
      goto LABEL_15;
    }
  }

  else
  {
    addPersonaToSessionErrorOverride = 0LL;
  }

  if (self) {
    personas = self->_personas;
  }
  else {
    personas = 0LL;
  }
  v12 = personas;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));

  if (!v14) {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }
  [v14 addObject:v9];
  if (self) {
    v15 = self->_personas;
  }
  else {
    v15 = 0LL;
  }
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v14, v17);

LABEL_15:
  return addPersonaToSessionErrorOverride == 0LL;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  if (self)
  {
    deletePersonaFromSessionErrorOverride = self->_deletePersonaFromSessionErrorOverride;
    if (deletePersonaFromSessionErrorOverride)
    {
      if (a5) {
        *a5 = self->_deletePersonaFromSessionErrorOverride;
      }
      goto LABEL_15;
    }
  }

  else
  {
    deletePersonaFromSessionErrorOverride = 0LL;
  }

  if (self) {
    personas = self->_personas;
  }
  else {
    personas = 0LL;
  }
  id v11 = personas;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));

  if (!v13) {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }
  [v13 removeObject:v8];
  if (self) {
    v14 = self->_personas;
  }
  else {
    v14 = 0LL;
  }
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v16);

LABEL_15:
  return deletePersonaFromSessionErrorOverride == 0LL;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  if (a6) {
    *a6 = 0LL;
  }
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods")) {
    goto LABEL_4;
  }
  if (self && self->_mapVolumeErrorOverride)
  {
    if (a6)
    {
      objc_super v13 = self->_mapVolumeErrorOverride;
      BOOL v12 = 0;
      *a6 = v13;
      goto LABEL_23;
    }

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods")) {
    goto LABEL_12;
  }
  if (!self || !self->_unmapVolumeErrorOverride)
  {
    if (self)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mappedVolumes, "setObject:forKeyedSubscript:", 0LL, v6);
      mappedVolumePersonas = self->_mappedVolumePersonas;
    }

    else
    {
      [0 setObject:0 forKeyedSubscript:v6];
      mappedVolumePersonas = 0LL;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](mappedVolumePersonas, "setObject:forKeyedSubscript:", 0LL, v6);
LABEL_12:
    BOOL v8 = 1;
    goto LABEL_13;
  }

  if (a4)
  {
    uint64_t v7 = self->_unmapVolumeErrorOverride;
    BOOL v8 = 0;
    *a4 = v7;
  }

  else
  {
    BOOL v8 = 0;
  }

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

- (void).cxx_destruct
{
}

@end