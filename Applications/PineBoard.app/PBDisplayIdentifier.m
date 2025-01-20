@interface PBDisplayIdentifier
+ (BOOL)parseIdentifierString:(id)a3 intoHardwareID:(id *)a4 capabilityMask:(id *)a5;
+ (id)mainDisplayIdentifier;
- (BOOL)matchesIdentifierString:(id)a3;
- (NSData)displayEDID;
- (NSString)hardwareID;
- (NSString)identifierString;
- (NSString)legacyEDIDDigest;
- (PBDisplayAttributes)attributes;
- (PBDisplayCapabilities)capabilities;
- (PBDisplayIdentifier)initWithCADisplay:(id)a3;
- (PBDisplayIdentifier)initWithEncodedString:(id)a3;
- (id)debugDescription;
@end

@implementation PBDisplayIdentifier

+ (id)mainDisplayIdentifier
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  id v4 = [v2 initWithCADisplay:v3];

  return v4;
}

- (PBDisplayIdentifier)initWithCADisplay:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBDisplayIdentifier;
  v5 = -[PBDisplayIdentifier init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueId]);
    v7 = (NSString *)[v6 copy];
    hardwareID = v5->_hardwareID;
    v5->_hardwareID = v7;

    if (!-[NSString length](v5->_hardwareID, "length"))
    {
      v9 = v5->_hardwareID;
      v5->_hardwareID = (NSString *)@"4ead1e55-1111-2222-3333-445566778899";
    }

    v10 = objc_alloc(&OBJC_CLASS___PBDisplayCapabilities);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 availableModes]);
    v12 = -[PBDisplayCapabilities initWithAvailableModes:forDisplay:]( v10,  "initWithAvailableModes:forDisplay:",  v11,  v4);
    capabilities = v5->_capabilities;
    v5->_capabilities = v12;

    v14 = v5;
  }

  return v5;
}

- (PBDisplayAttributes)attributes
{
  if (!self->_attributes)
  {
    v3 = (const __CFDictionary *)__IOAVClassMatching("IOAVService", 0LL, 0LL, 0xFFFFFFFFLL);
    if (v3 && (uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3), (_DWORD)MatchingService))
    {
      io_object_t v5 = MatchingService;
      v6 = (const void *)IOAVServiceCreateWithService(kCFAllocatorDefault, MatchingService);
      IOObjectRelease(v5);
    }

    else
    {
      v6 = 0LL;
    }

    v7 = (const __CFDictionary *)__IOAVClassMatching("IOAVVideoInterface", 0LL, 0LL, 0xFFFFFFFFLL);
    if (v7 && (uint64_t v8 = IOServiceGetMatchingService(kIOMainPortDefault, v7), (_DWORD)v8))
    {
      io_object_t v9 = v8;
      v10 = (const void *)IOAVVideoInterfaceCreateWithService(kCFAllocatorDefault, v8);
      IOObjectRelease(v9);
    }

    else
    {
      v10 = 0LL;
    }

    v11 = -[PBDisplayAttributes initWithService:interface:]( objc_alloc(&OBJC_CLASS___PBDisplayAttributes),  "initWithService:interface:",  v6,  v10);
    attributes = self->_attributes;
    self->_attributes = v11;

    if (v6) {
      CFRelease(v6);
    }
    if (v10) {
      CFRelease(v10);
    }
  }

  return self->_attributes;
}

- (id)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayIdentifier description](self, "description"));
  hardwareID = self->_hardwareID;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayCapabilities debugDescription](self->_capabilities, "debugDescription"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ (id: %@, capabilities: %@)", v4, hardwareID, v6);

  return v7;
}

- (NSData)displayEDID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayIdentifier attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 displayEDID]);

  return (NSData *)v3;
}

- (NSString)legacyEDIDDigest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueId]);

  if ([v4 length])
  {
    io_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayIdentifier attributes](self, "attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayEDID]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_SHA1Digest"));
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvs_lowercaseHexString"));
    }

    else
    {
      id v9 = sub_100082A9C();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100285340((uint64_t)v4, v10, v11);
      }

      uint64_t v8 = @"_unknown_";
    }
  }

  else
  {
    uint64_t v8 = @"_unknown_";
  }

  return (NSString *)v8;
}

- (NSString)identifierString
{
  if (-[NSString length](self->_hardwareID, "length"))
  {
    v3 = -[NSMutableString initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithCapacity:",  (char *)-[NSString length](self->_hardwareID, "length") + 10);
    -[NSMutableString appendString:](v3, "appendString:", self->_hardwareID);
    -[NSMutableString appendString:](v3, "appendString:", @"~::~");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayCapabilities dataRepresentation](self->_capabilities, "dataRepresentation"));
    io_object_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
    -[NSMutableString appendString:](v3, "appendString:", v5);

    v6 = (__CFString *)-[NSMutableString copy](v3, "copy");
  }

  else
  {
    v6 = @"_unknown_";
  }

  return (NSString *)v6;
}

+ (BOOL)parseIdentifierString:(id)a3 intoHardwareID:(id *)a4 capabilityMask:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", v7);
  if (-[NSScanner scanUpToString:intoString:](v8, "scanUpToString:intoString:", @"~::~", a4)
    && (id v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", *a4),
        v9,
        v9)
    && -[NSScanner scanString:intoString:](v8, "scanString:intoString:", @"~::~", 0LL))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", -[NSScanner scanLocation](v8, "scanLocation")));
    uint64_t v11 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v10,  0LL);
    v12 = v11;
    BOOL v13 = v11 != 0LL;
    if (v11) {
      *a5 = v11;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)matchesIdentifierString:(id)a3
{
  id v4 = a3;
  id v33 = 0LL;
  id v34 = 0LL;
  unsigned __int8 v5 = +[PBDisplayIdentifier parseIdentifierString:intoHardwareID:capabilityMask:]( &OBJC_CLASS___PBDisplayIdentifier,  "parseIdentifierString:intoHardwareID:capabilityMask:",  v4,  &v34,  &v33);
  id v6 = v34;
  id v7 = v33;
  if ((v5 & 1) == 0)
  {
    id v20 = sub_100082A9C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002854EC((uint64_t)v4, v10, v21);
    }
    goto LABEL_28;
  }

  p_hardwareID = &self->_hardwareID;
  unsigned __int8 v9 = -[NSString isEqualToString:](self->_hardwareID, "isEqualToString:", v6);
  if ((v9 & 1) != 0) {
    goto LABEL_8;
  }
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", 4, 4, @"0000"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingCharactersInRange:withString:]( *p_hardwareID,  "stringByReplacingCharactersInRange:withString:",  4LL,  4LL,  @"0000"));
  if ((-[os_log_s isEqualToString:](v10, "isEqualToString:", v11) & 1) == 0)
  {
LABEL_27:

LABEL_28:
    unsigned __int8 v19 = 0;
    goto LABEL_29;
  }

  v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", *p_hardwareID);
  BOOL v13 = v12;
  if (!v12)
  {
    id v27 = sub_100082A9C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_100285478((uint64_t *)p_hardwareID, v28);
    }

    goto LABEL_27;
  }

  v43[0] = 0LL;
  v43[1] = 0LL;
  -[NSUUID getUUIDBytes:](v12, "getUUIDBytes:", v43);
  unsigned int v14 = bswap32(LOWORD(v43[0]));
  __int16 v32 = BYTE2(v14) & 0x1F | 0x40;
  v31[1] = (v14 >> 21) & 0x1F | 0x40;
  v31[0] = (v14 >> 26) & 0x1F | 0x40;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 4, 4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](*p_hardwareID, "substringWithRange:", 4LL, 4LL));
  id v16 = sub_100082A9C();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    int v36 = 3;
    __int16 v37 = 2082;
    v38 = v31;
    __int16 v39 = 2114;
    v40 = v30;
    __int16 v41 = 2114;
    v42 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Product ID portion of display's EDID UUID changed while everything else remained the same. ManufacturerID = %{publ ic}.3s, product ID was: %{public}@, is now: %{public}@",  buf,  0x26u);
  }

LABEL_8:
  v18 = -[PBDisplayCapabilities initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___PBDisplayCapabilities),  "initWithDataRepresentation:",  v7);
  v10 = (os_log_s *)v18;
  if (!v18)
  {
    id v22 = sub_100082A9C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1002853A8(v7, v23);
    }
    unsigned __int8 v19 = 0;
    goto LABEL_23;
  }

  if (-[PBDisplayCapabilities isEqual:](v18, "isEqual:", self->_capabilities))
  {
    unsigned __int8 v19 = 1;
    if ((v9 & 1) != 0) {
      goto LABEL_29;
    }
    goto LABEL_21;
  }

  if ([v7 length] == (id)6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayCapabilities dataRepresentation](self->_capabilities, "dataRepresentation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subdataWithRange:", 0, 6));

    unsigned __int8 v19 = [v25 isEqualToData:v7];
    if ((v9 & 1) != 0) {
      goto LABEL_29;
    }
    goto LABEL_21;
  }

  unsigned __int8 v19 = 0;
  if ((v9 & 1) == 0)
  {
LABEL_21:
    id v26 = sub_100082A9C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100285438(v23);
    }
LABEL_23:
  }

- (NSString)hardwareID
{
  return self->_hardwareID;
}

- (PBDisplayCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
}

- (PBDisplayIdentifier)initWithEncodedString:(id)a3
{
  id v13 = 0LL;
  id v14 = 0LL;
  unsigned int v4 = +[PBDisplayIdentifier parseIdentifierString:intoHardwareID:capabilityMask:]( &OBJC_CLASS___PBDisplayIdentifier,  "parseIdentifierString:intoHardwareID:capabilityMask:",  a3,  &v14,  &v13);
  id v5 = v14;
  id v6 = v14;
  id v7 = v13;
  if (v4)
  {
    uint64_t v8 = -[PBDisplayCapabilities initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___PBDisplayCapabilities),  "initWithDataRepresentation:",  v7);
    if (v8
      && (v12.receiver = self,
          v12.super_class = (Class)&OBJC_CLASS___PBDisplayIdentifier,
          unsigned __int8 v9 = -[PBDisplayIdentifier init](&v12, "init"),
          (self = v9) != 0LL))
    {
      objc_storeStrong((id *)&v9->_hardwareID, v5);
      objc_storeStrong((id *)&self->_capabilities, v8);
      self = self;
      v10 = self;
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end