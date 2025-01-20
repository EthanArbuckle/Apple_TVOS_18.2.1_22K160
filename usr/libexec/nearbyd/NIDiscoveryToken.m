@interface NIDiscoveryToken
+ (BOOL)supportsSecureCoding;
+ (id)_identifyingSequenceFromBytes:(id)a3;
+ (id)deserialize:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3;
+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4;
+ (id)serialize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)initWithBytes:(id)a3;
- (NIDiscoveryToken)initWithCoder:(id)a3;
- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3;
- (NSData)rawToken;
- (NSString)rawTokenAsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)deviceCapabilities;
- (id)getIRK;
- (id)getSessionIdentifier;
- (id)objectInRawTokenOPACKDictForKey:(id)a3;
- (id)shortDeviceAddress;
- (int64_t)tokenVariant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIDiscoveryToken

- (NIDiscoveryToken)initWithBytes:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 58, @"Invalid parameter not satisfying: %@", @"bytes" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIDiscoveryToken;
  v7 = -[NIDiscoveryToken init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rawToken, a3);
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NIDiscoveryToken _identifyingSequenceFromBytes:]( &OBJC_CLASS___NIDiscoveryToken,  "_identifyingSequenceFromBytes:",  v6));
    identifyingSequence = v8->_identifyingSequence;
    v8->_identifyingSequence = (NSData *)v9;
  }

  return v8;
}

+ (id)_identifyingSequenceFromBytes:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    __assert_rtn("+[NIDiscoveryToken _identifyingSequenceFromBytes:]", "NIConfiguration.mm", 68, "bytes");
  }
  id v5 = [v3 copy];
  v7 = (void *)OPACKDecodeData(v4, 8LL, 0LL);
  if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
  {
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    v19 = sub_10017E114;
    v20 = sub_10017E124;
    v21 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10017E12C;
    v13[3] = &unk_1007B2BB0;
    id v14 = v7;
    v15 = &v16;
    [&off_1007D21C0 enumerateObjectsUsingBlock:v13];
    id v9 = [(id)v17[5] length];
    v10 = v5;
    if (v9) {
      v10 = (void *)v17[5];
    }
    id v11 = v10;

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    id v11 = v5;
  }

  return v11;
}

- (id)objectInRawTokenOPACKDictForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 111, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }

  v7 = (void *)OPACKDecodeData(self->_rawToken, 8LL, 0LL);
  if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (int64_t)tokenVariant
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NIDiscoveryToken objectInRawTokenOPACKDictForKey:]( self,  "objectInRawTokenOPACKDictForKey:",  &off_1007D2418));
  if (v3
    && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && (unint64_t)[v3 integerValue] <= 1)
  {
    id v5 = [v3 integerValue];
  }

  else
  {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (id)deviceCapabilities
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NIDiscoveryToken objectInRawTokenOPACKDictForKey:]( self,  "objectInRawTokenOPACKDictForKey:",  &off_1007D2430));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = -[NIDeviceCapabilities initWithBitmap:]( [NIDeviceCapabilities alloc],  "initWithBitmap:",  [v3 unsignedCharValue]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)getIRK
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken rawToken](self, "rawToken"));
  id v3 = (void *)OPACKDecodeData(v2, 8LL, v10);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:&off_1007D23B8]);
    v7 = v6;
    if (v6 && [v6 length] == (id)16) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)getSessionIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken rawToken](self, "rawToken"));
  id v3 = (void *)OPACKDecodeData(v2, 8LL, v10);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:&off_1007D23A0]);
    v7 = v6;
    if (v6 && [v6 length] == (id)3) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)serialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0x3E8)
  {
    uint64_t v7 = 0LL;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    v10 = sub_10017E114;
    id v11 = sub_10017E124;
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10017E6B8;
    v6[3] = &unk_1007B2BD8;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)deserialize:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0xF4240)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    unint64_t v5 = 0LL;
    do
    {
      id v6 = v3;
      uint64_t v7 = [v6 bytes];
      uint64_t v8 = v7[v5];
      unint64_t v9 = v5 + 1;
      if (v7[v5])
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v5 + 1, v8));
        id v11 = -[NIDiscoveryToken initWithBytes:](objc_alloc(&OBJC_CLASS___NIDiscoveryToken), "initWithBytes:", v10);
        -[NSMutableSet addObject:](v4, "addObject:", v11);
        v9 += v8;
      }

      unint64_t v5 = v9;
    }

    while (v9 < 0xF4240);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (NSString)rawTokenAsString
{
  return (NSString *)sub_100023D80(self->_rawToken, 0);
}

- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3
{
  unsigned __int16 v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v9, 2LL));
  unint64_t v5 = -[NIDiscoveryToken initWithBytes:](objc_alloc(&OBJC_CLASS___NIDiscoveryToken), "initWithBytes:", v4);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v9));
    shortDeviceAddress = v5->_shortDeviceAddress;
    v5->_shortDeviceAddress = (NSNumber *)v6;
  }

  return v5;
}

- (id)shortDeviceAddress
{
  return self->_shortDeviceAddress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  shortDeviceAddress = self->_shortDeviceAddress;
  id v5 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  if (shortDeviceAddress) {
    return objc_msgSend( v5,  "initWithDeviceAddress:",  (unsigned __int16)-[NSNumber intValue](self->_shortDeviceAddress, "intValue"));
  }
  else {
    return [v5 initWithBytes:self->_rawToken];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_rawToken forKey:@"rawToken"];
  [v4 encodeObject:self->_shortDeviceAddress forKey:@"shortDeviceAddress"];
}

- (NIDiscoveryToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"rawToken");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"shortDeviceAddress");
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v13)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          uint64_t v16 = 0LL;
          goto LABEL_10;
        }

        v15 = -[NIDiscoveryToken initWithDeviceAddress:]( self,  "initWithDeviceAddress:",  (unsigned __int16)[v13 intValue]);
      }

      else
      {
        v15 = -[NIDiscoveryToken initWithBytes:](self, "initWithBytes:", v8);
      }

      self = v15;
      uint64_t v16 = self;
LABEL_10:

      goto LABEL_11;
    }
  }

  uint64_t v16 = 0LL;
LABEL_11:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (NIDiscoveryToken *)a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    if (v5 == self) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = -[NSData isEqualToData:](self->_identifyingSequence, "isEqualToData:", v5->_identifyingSequence);
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_identifyingSequence, "hash");
}

- (id)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return (id)CUPrintNSObjectMasked(self->_identifyingSequence, a2);
}

- (NSData)rawToken
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)generateFindingTokenWithIRK:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 29, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }

  if ([v5 length] != (id)16)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 30, @"Invalid parameter not satisfying: %@", @"IRK.length == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }

  v14[0] = &off_1007D2730;
  v14[1] = &off_1007D2760;
  v15[0] = &off_1007D2748;
  v15[1] = v5;
  v14[2] = &off_1007D2778;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_10042CDB4, 3LL));
  v15[2] = v6;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));

  Data = (void *)OPACKEncoderCreateData(v7, 8LL, 0LL);
  if (!Data)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, a1, @"NIFindingSupport.mm", 38, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }

  uint64_t v9 = -[NIDiscoveryToken initWithBytes:](objc_alloc(&OBJC_CLASS___NIDiscoveryToken), "initWithBytes:", Data);

  return v9;
}

+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue( +[NIDiscoveryToken generateFindingTokenWithIRK:]( &OBJC_CLASS___NIDiscoveryToken,  "generateFindingTokenWithIRK:",  a3,  a4));
}

@end