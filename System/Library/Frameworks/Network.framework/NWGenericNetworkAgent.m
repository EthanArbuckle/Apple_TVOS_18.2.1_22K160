@interface NWGenericNetworkAgent
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isNexusProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requiresAssert;
- (BOOL)supportsBrowse;
- (BOOL)supportsGroups;
- (BOOL)supportsResolve;
- (NSString)agentDescription;
- (NSString)agentDomain;
- (NSString)agentType;
- (NSString)privateDescription;
- (NSUUID)agentUUID;
- (NWGenericNetworkAgent)initWithKernelAgent:(const netagent *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (netagent)internalNetagent;
- (void)dealloc;
- (void)setInternalNetagent:(netagent *)a3;
@end

@implementation NWGenericNetworkAgent

- (NWGenericNetworkAgent)initWithKernelAgent:(const netagent *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWGenericNetworkAgent;
  v4 = -[NWGenericNetworkAgent init](&v9, sel_init);
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      size_t v6 = a3->var5 + 216LL;
      v7 = (netagent *)malloc(v6);
      v5->_internalNetagent = v7;
      if (v7) {
        memcpy(v7, a3, v6);
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  if (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"))
  {
    free(-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"));
    -[NWGenericNetworkAgent setInternalNetagent:](self, "setInternalNetagent:", 0LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWGenericNetworkAgent;
  -[NWGenericNetworkAgent dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  v8 = -[NWGenericNetworkAgent agentDomain](self, "agentDomain");
  [v7 appendPrettyObject:v8 withName:@"domain" indent:v5 showFullContent:1];

  -[NWGenericNetworkAgent agentType](self, "agentType");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"type" indent:v5 showFullContent:1];

  if (!v4)
  {
    v14 = -[NWGenericNetworkAgent agentDescription](self, "agentDescription");
    [v7 appendPrettyObject:v14 withName:@"description" indent:v5 showFullContent:1];

    BOOL v12 = -[NWGenericNetworkAgent isActive](self, "isActive");
    v13 = @"isActive";
    goto LABEL_19;
  }
  v10 = -[NWGenericNetworkAgent agentUUID](self, "agentUUID");
  [v7 appendPrettyObject:v10 withName:@"UUID" indent:v5 showFullContent:1];
  v11 = -[NWGenericNetworkAgent agentDescription](self, "agentDescription");
  [v7 appendPrettyObject:v11 withName:@"description" indent:v5 showFullContent:1];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isActive](self, "isActive"),  @"isActive",  v5);
  if (-[NWGenericNetworkAgent isKernelActivated](self, "isKernelActivated")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isKernelActivated](self, "isKernelActivated"),  @"isKernelActivated",  v5);
  }
  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isUserActivated](self, "isUserActivated"),  @"isUserActivated",  v5);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isVoluntary](self, "isVoluntary"),  @"isVoluntary",  v5);
  if (-[NWGenericNetworkAgent isSpecificUseOnly](self, "isSpecificUseOnly")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isSpecificUseOnly](self, "isSpecificUseOnly"),  @"isSpecificUseOnly",  v5);
  }
  if (-[NWGenericNetworkAgent isNetworkProvider](self, "isNetworkProvider")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isNetworkProvider](self, "isNetworkProvider"),  @"isNetworkProvider",  v5);
  }
  if (-[NWGenericNetworkAgent isNexusProvider](self, "isNexusProvider")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent isNexusProvider](self, "isNexusProvider"),  @"isNexusProvider",  v5);
  }
  if (-[NWGenericNetworkAgent supportsBrowse](self, "supportsBrowse")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent supportsBrowse](self, "supportsBrowse"),  @"supportsBrowse",  v5);
  }
  if (-[NWGenericNetworkAgent supportsResolve](self, "supportsResolve")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent supportsResolve](self, "supportsResolve"),  @"supportsResolve",  v5);
  }
  if (-[NWGenericNetworkAgent supportsGroups](self, "supportsGroups")) {
    objc_msgSend( v7,  "appendPrettyBOOL:withName:indent:",  -[NWGenericNetworkAgent supportsGroups](self, "supportsGroups"),  @"supportsGroups",  v5);
  }
  if (-[NWGenericNetworkAgent requiresAssert](self, "requiresAssert"))
  {
    BOOL v12 = -[NWGenericNetworkAgent requiresAssert](self, "requiresAssert");
    v13 = @"requiresAssert";
LABEL_19:
    [v7 appendPrettyBOOL:v12 withName:v13 indent:v5];
  }

  return v7;
}

- (id)description
{
  return  -[NWGenericNetworkAgent descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  0LL);
}

- (NSString)privateDescription
{
  return (NSString *) -[NWGenericNetworkAgent descriptionWithIndent:showFullContent:]( self,  "descriptionWithIndent:showFullContent:",  0LL,  1LL);
}

- (NSString)agentDomain
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend( NSString,  "stringWithUTF8String:",  -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 16);
    objc_super v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)agentType
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend( NSString,  "stringWithUTF8String:",  -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 48);
    objc_super v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)agentDescription
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3)
  {
    objc_msgSend( NSString,  "stringWithUTF8String:",  -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent") + 80);
    objc_super v3 = (netagent *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSUUID)agentUUID
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    objc_super v3 = (netagent *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]),  "initWithUUIDBytes:",  -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent"));
  }
  return (NSUUID *)v3;
}

- (BOOL)isActive
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 1) & 1;
  }
  return (char)v3;
}

- (BOOL)isKernelActivated
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 2) & 1;
  }
  return (char)v3;
}

- (BOOL)isUserActivated
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 3) & 1;
  }
  return (char)v3;
}

- (BOOL)isVoluntary
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 4) & 1;
  }
  return (char)v3;
}

- (BOOL)isSpecificUseOnly
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 5) & 1;
  }
  return (char)v3;
}

- (BOOL)isNetworkProvider
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 6) & 1;
  }
  return (char)v3;
}

- (BOOL)isNexusProvider
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[208] >> 7;
  }
  return (char)v3;
}

- (BOOL)supportsBrowse
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LOBYTE(v3) = (_BYTE)-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[209] & 1;
  }
  return (char)v3;
}

- (BOOL)requiresAssert
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[209] >> 1) & 1;
  }
  return (char)v3;
}

- (BOOL)supportsResolve
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LOBYTE(v3) = (_BYTE)-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[210] & 1;
  }
  return (char)v3;
}

- (BOOL)supportsGroups
{
  objc_super v3 = -[NWGenericNetworkAgent internalNetagent](self, "internalNetagent");
  if (v3) {
    LODWORD(v3) = (-[NWGenericNetworkAgent internalNetagent](self, "internalNetagent")[210] >> 1) & 1;
  }
  return (char)v3;
}

- (netagent)internalNetagent
{
  return self->_internalNetagent;
}

- (void)setInternalNetagent:(netagent *)a3
{
  self->_internalNetagent = a3;
}

@end