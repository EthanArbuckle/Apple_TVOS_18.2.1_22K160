@interface UARPPersonalizationRequest
- (BOOL)effectiveProductionMode;
- (BOOL)effectiveSecurityMode;
- (BOOL)executeWithResponse:(id)a3;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)supportsImg4;
- (BOOL)useSingleSignOn;
- (NSArray)manifestEntries;
- (NSData)nonce;
- (NSNumber)ecid;
- (NSString)chipName;
- (NSURL)serverURL;
- (UARPPersonalizationRequest)initWithChipName:(id)a3 boardID:(id)a4 chipID:(id)a5 securityDomain:(id)a6 productionMode:(BOOL)a7 securityMode:(BOOL)a8 nonce:(id)a9 manifestEntries:(id)a10;
- (id)description;
- (id)keyForFieldName:(id)a3 default:(__CFString *)a4;
- (id)personalizationParameterDict;
- (id)personalizationRequestDict;
- (id)requestTicketName;
- (id)responseTicketName;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)securityDomain;
- (void)convertManifestEntries:(id)a3 productionMode:(BOOL)a4 securityMode:(BOOL)a5;
- (void)dealloc;
- (void)setECID:(unint64_t)a3;
- (void)setEffectiveProductionMode:(BOOL)a3;
- (void)setEffectiveSecurityMode:(BOOL)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(BOOL)a3;
- (void)setSecurityMode:(BOOL)a3;
- (void)setServerURL:(id)a3;
- (void)setUseSingleSignOn:(BOOL)a3;
@end

@implementation UARPPersonalizationRequest

- (UARPPersonalizationRequest)initWithChipName:(id)a3 boardID:(id)a4 chipID:(id)a5 securityDomain:(id)a6 productionMode:(BOOL)a7 securityMode:(BOOL)a8 nonce:(id)a9 manifestEntries:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UARPPersonalizationRequest;
  v16 = -[UARPPersonalizationRequest init](&v18, "init");
  if (v16)
  {
    v16->_chipName = (NSString *)[a3 copy];
    v16->_boardID = (UARPPersonalizationNumberTuple32 *)a4;
    v16->_chipID = (UARPPersonalizationNumberTuple32 *)a5;
    v16->_securityDomain = (UARPPersonalizationNumberTuple32 *)a6;
    -[UARPPersonalizationRequest setProductionMode:](v16, "setProductionMode:", v11);
    -[UARPPersonalizationRequest setSecurityMode:](v16, "setSecurityMode:", v10);
    -[UARPPersonalizationRequest setNonce:](v16, "setNonce:", a9);
    -[UARPPersonalizationRequest convertManifestEntries:productionMode:securityMode:]( v16,  "convertManifestEntries:productionMode:securityMode:",  a10,  v11,  v10);
    v16->_authInstallRef = (__AMAuthInstall *)AMAuthInstallCreate(kCFAllocatorDefault);
    v16->_serverURL = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gs.apple.com:443");
  }

  return v16;
}

- (void)dealloc
{
  authInstallRef = self->_authInstallRef;
  if (authInstallRef) {
    CFRelease(authInstallRef);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPPersonalizationRequest;
  -[UARPPersonalizationRequest dealloc](&v4, "dealloc");
}

- (unsigned)boardID
{
  return -[UARPPersonalizationNumberTuple32 value](self->_boardID, "value");
}

- (unsigned)chipID
{
  return -[UARPPersonalizationNumberTuple32 value](self->_chipID, "value");
}

- (unsigned)securityDomain
{
  return -[UARPPersonalizationNumberTuple32 value](self->_securityDomain, "value");
}

- (NSData)nonce
{
  return -[UARPPersonalizationDataTuple value](self->_nonce, "value");
}

- (id)keyForFieldName:(id)a3 default:(__CFString *)a4
{
  else {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,%@",  self->_chipName,  a3);
  }
}

- (void)setECID:(unint64_t)a3
{
  self->_ecid = -[UARPPersonalizationNumberTuple64 initWithKey:value:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationNumberTuple64),  "initWithKey:value:",  -[UARPPersonalizationRequest keyForFieldName:default:]( self,  "keyForFieldName:default:",  @"ECID",  kAMAuthInstallTagApEcid),  a3);
}

- (void)setNonce:(id)a3
{
  self->_nonce = -[UARPPersonalizationDataTuple initWithKey:value:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationDataTuple),  "initWithKey:value:",  -[UARPPersonalizationRequest keyForFieldName:default:]( self,  "keyForFieldName:default:",  @"Nonce",  kAMAuthInstallTagApNonce),  a3);
}

- (void)setProductionMode:(BOOL)a3
{
  self->_productionMode = -[UARPPersonalizationNumberTupleBool initWithKey:value:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationNumberTupleBool),  "initWithKey:value:",  -[UARPPersonalizationRequest keyForFieldName:default:]( self,  "keyForFieldName:default:",  @"ProductionMode",  kAMAuthInstallTagApProductionMode),  a3);
}

- (BOOL)productionMode
{
  return -[UARPPersonalizationNumberTupleBool value](self->_productionMode, "value");
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_securityMode = -[UARPPersonalizationNumberTupleBool initWithKey:value:]( objc_alloc(&OBJC_CLASS___UARPPersonalizationNumberTupleBool),  "initWithKey:value:",  -[UARPPersonalizationRequest keyForFieldName:default:]( self,  "keyForFieldName:default:",  @"SecurityMode",  kAMAuthInstallTagApSecurityMode),  a3);
}

- (BOOL)securityMode
{
  return -[UARPPersonalizationNumberTupleBool value](self->_securityMode, "value");
}

- (NSNumber)ecid
{
  result = (NSNumber *)self->_ecid;
  if (result) {
    return +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[NSNumber value](result, "value"));
  }
  return result;
}

- (id)personalizationParameterDict
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_super v4 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_boardID, "value"));
  [v3 setObject:v4 forKeyedSubscript:kAMAuthInstallApParameterBoardID];
  v5 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_chipID, "value"));
  [v3 setObject:v5 forKeyedSubscript:kAMAuthInstallApParameterChipID];
  v6 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_securityDomain, "value"));
  [v3 setObject:v6 forKeyedSubscript:kAMAuthInstallApParameterSecurityDomain];
  v7 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UARPPersonalizationNumberTupleBool value](self->_securityMode, "value"));
  [v3 setObject:v7 forKeyedSubscript:kAMAuthInstallApParameterSecurityMode];
  v8 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UARPPersonalizationNumberTupleBool value](self->_productionMode, "value"));
  [v3 setObject:v8 forKeyedSubscript:kAMAuthInstallApParameterProductionMode];
  ecid = self->_ecid;
  if (ecid)
  {
    BOOL v10 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARPPersonalizationNumberTuple64 value](ecid, "value"));
    [v3 setObject:v10 forKeyedSubscript:kAMAuthInstallApParameterECID];
  }

  BOOL v11 = -[UARPPersonalizationDataTuple value](self->_nonce, "value");
  [v3 setObject:v11 forKeyedSubscript:kAMAuthInstallApParameterApNonce];
  v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_effectiveProductionMode);
  [v3 setObject:v12 forKeyedSubscript:kAMAuthInstallApParameterEffectiveProductionMode];
  v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_effectiveSecurityMode);
  [v3 setObject:v13 forKeyedSubscript:kAMAuthInstallApParameterEffectiveSecurityMode];
  v14 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UARPPersonalizationRequest supportsImg4](self, "supportsImg4"));
  [v3 setObject:v14 forKeyedSubscript:kAMAuthInstallApParameterSupportsImg4];
  return +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3);
}

- (id)personalizationRequestDict
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_boardID, "value")),  -[UARPPersonalizationNumberTuple32 key](self->_boardID, "key"));
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_chipID, "value")),  -[UARPPersonalizationNumberTuple32 key](self->_chipID, "key"));
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  -[UARPPersonalizationNumberTuple32 value](self->_securityDomain, "value")),  -[UARPPersonalizationNumberTuple32 key](self->_securityDomain, "key"));
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  -[UARPPersonalizationNumberTupleBool value](self->_securityMode, "value")),  -[UARPPersonalizationNumberTupleBool key](self->_securityMode, "key"));
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  -[UARPPersonalizationNumberTupleBool value](self->_productionMode, "value")),  -[UARPPersonalizationNumberTupleBool key](self->_productionMode, "key"));
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  -[UARPPersonalizationDataTuple value](self->_nonce, "value"),  -[UARPPersonalizationDataTuple key](self->_nonce, "key"));
  ecid = self->_ecid;
  if (ecid) {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  -[UARPPersonalizationNumberTuple64 value](ecid, "value")),  -[UARPPersonalizationNumberTuple64 key](self->_ecid, "key"));
  }
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  -[UARPPersonalizationRequest requestTicketName](self, "requestTicketName"));
  return +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3);
}

- (BOOL)supportsImg4
{
  return -[NSString isEqual:](self->_chipName, "isEqual:", @"Ap");
}

- (id)requestTicketName
{
  if (-[UARPPersonalizationRequest supportsImg4](self, "supportsImg4")) {
    return (id)kAMAuthInstallTagApRequestImg4Ticket;
  }
  else {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@%@,Ticket",  self->_chipName);
  }
}

- (id)responseTicketName
{
  if (-[UARPPersonalizationRequest supportsImg4](self, "supportsImg4")) {
    return (id)kAMAuthInstallTagApImg4Ticket;
  }
  else {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,Ticket",  self->_chipName);
  }
}

- (void)convertManifestEntries:(id)a3 productionMode:(BOOL)a4 securityMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = a3;
  id v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = -[UARPManifestEntry initWithName:digest:trusted:productionMode:securityMode:]( [UARPManifestEntry alloc],  "initWithName:digest:trusted:productionMode:securityMode:",  [*(id *)(*((void *)&v16 + 1) + 8 * (void)v12) name],  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v12), "digest"),  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v12), "trusted"),  v6,  v5);
        [v8 addObject:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  self->_manifestEntries = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v8);
}

- (BOOL)executeWithResponse:(id)a3
{
  if (AMAuthInstallSetSigningServerURL(self->_authInstallRef, self->_serverURL)
    || self->_useSingleSignOn
    && (AMAuthInstallSsoInitialize(0LL) || AMAuthInstallSsoEnable(self->_authInstallRef))
    || AMAuthInstallApSetParameters( self->_authInstallRef,  -[UARPPersonalizationRequest personalizationParameterDict](self, "personalizationParameterDict")))
  {
    return 0;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002DBF8;
  v7[3] = &unk_100075B10;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(global_queue, v7);
  return 1;
}

- (id)description
{
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  objc_super v4 = (objc_class *)objc_opt_class(self);
  [v3 appendFormat:@"%@\n{\n", NSStringFromClass(v4)];
  [v3 appendFormat:@"\tChip name: %@\n", self->_chipName];
  [v3 appendFormat:@"\t%@\n", self->_boardID];
  [v3 appendFormat:@"\t%@\n", self->_chipID];
  [v3 appendFormat:@"\t%@\n", self->_securityDomain];
  [v3 appendFormat:@"\t%@\n", self->_productionMode];
  [v3 appendFormat:@"\t%@\n", self->_securityMode];
  [v3 appendFormat:@"\t%@\n", self->_nonce];
  if (self->_ecid) {
    [v3 appendFormat:@"\t%@\n", self->_ecid];
  }
  if (self->_useSingleSignOn) {
    BOOL v5 = "YES";
  }
  else {
    BOOL v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"\tSSO: %s\n", v5);
  [v3 appendFormat:@"\tServer: %@\n", self->_serverURL];
  [v3 appendString:@"\tManifest\n\t{\n"];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  manifestEntries = self->_manifestEntries;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( manifestEntries,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(manifestEntries);
        }
        [v3 appendFormat:@"%@\n", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "descriptionWithTabDepth:", 2)];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( manifestEntries,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  [v3 appendString:@"\t}\n"];
  [v3 appendFormat:@"}"];
  return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3);
}

- (NSString)chipName
{
  return self->_chipName;
}

- (NSArray)manifestEntries
{
  return self->_manifestEntries;
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setServerURL:(id)a3
{
}

- (BOOL)useSingleSignOn
{
  return self->_useSingleSignOn;
}

- (void)setUseSingleSignOn:(BOOL)a3
{
  self->_useSingleSignOn = a3;
}

- (BOOL)effectiveProductionMode
{
  return self->_effectiveProductionMode;
}

- (void)setEffectiveProductionMode:(BOOL)a3
{
  self->_effectiveProductionMode = a3;
}

- (BOOL)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(BOOL)a3
{
  self->_effectiveSecurityMode = a3;
}

@end