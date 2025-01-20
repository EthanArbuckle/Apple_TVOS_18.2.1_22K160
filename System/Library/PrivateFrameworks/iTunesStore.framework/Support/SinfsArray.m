@interface SinfsArray
- (BOOL)_isRecognizedProperty:(id)a3;
- (NSArray)sinfs;
- (SinfsArray)init;
- (SinfsArray)initWithSINFs:(id)a3;
- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5;
- (id)copyValueForField:(int64_t)a3 error:(id *)a4;
- (id)copyValueForProperty:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation SinfsArray

- (SinfsArray)init
{
  return -[SinfsArray initWithSINFs:](self, "initWithSINFs:", 0LL);
}

- (SinfsArray)initWithSINFs:(id)a3
{
  if (![a3 count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"FairPlayUtility.m",  497LL,  @"Must have at least one sinf");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SinfsArray;
  v6 = -[SinfsArray init](&v8, "init");
  if (v6) {
    v6->_sinfs = (NSArray *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SinfsArray;
  -[SinfsArray dealloc](&v3, "dealloc");
}

- (id)copyValueForField:(int64_t)a3 error:(id *)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  sinfs = self->_sinfs;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (!v7)
  {
LABEL_13:
    v15 = (void *)SSError(@"FairPlayErrorDomain", 3LL, 0LL, 0LL);
    id result = 0LL;
    if (!a4) {
      return result;
    }
    goto LABEL_14;
  }

  id v8 = v7;
  uint64_t v9 = *(void *)v18;
LABEL_3:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v18 != v9) {
      objc_enumerationMutation(sinfs);
    }
    v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
    uint64_t v16 = 0LL;
    sub_1000231EC(v11, a3, &v16);
    if (!v12) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }

  v13 = objc_alloc(&OBJC_CLASS___NSNumber);
  id result = -[NSNumber initWithUnsignedLongLong:](v13, "initWithUnsignedLongLong:", v16);
  if (!result) {
    goto LABEL_13;
  }
  v15 = 0LL;
  if (a4) {
LABEL_14:
  }
    *a4 = v15;
  return result;
}

- (id)copyValueForProperty:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0LL;
  if (!-[SinfsArray _isRecognizedProperty:](self, "_isRecognizedProperty:"))
  {
    uint64_t v13 = 2LL;
LABEL_15:
    uint64_t v12 = SSError(@"FairPlayErrorDomain", v13, 0LL, 0LL);
    id result = 0LL;
    goto LABEL_16;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  sinfs = self->_sinfs;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
  if (result)
  {
    id v9 = result;
    uint64_t v10 = *(void *)v15;
LABEL_4:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(sinfs);
      }
      id result = -[SinfsArray _copyValueForSINF:property:error:]( self,  "_copyValueForSINF:property:error:",  *(void *)(*((void *)&v14 + 1) + 8 * v11),  a3,  &v18);
      uint64_t v12 = v18;
      if (v9 == (id)++v11)
      {
        id result = -[NSArray countByEnumeratingWithState:objects:count:]( sinfs,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
        id v9 = result;
        if (result) {
          goto LABEL_4;
        }
        uint64_t v12 = v18;
        break;
      }
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (!((unint64_t)result | v12))
  {
    uint64_t v13 = 3LL;
    goto LABEL_15;
  }

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5
{
  if ([a4 isEqualToString:@"SinfPropertyAccountIdentifier"])
  {
    uint64_t v17 = 0LL;
    id v8 = a3;
    unint64_t v9 = 2LL;
  }

  else
  {
    if (![a4 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"])
    {
      if (![a3 length]) {
        return 0LL;
      }
      uint64_t v14 = sub_100023C8C();
      sub_1002493F0(v14, (uint64_t)[a3 bytes], (uint64_t)objc_msgSend(a3, "length"), (uint64_t)&v17);
      if (v15) {
        return 0LL;
      }
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___ISFairPlayRentalInfo);
      -[ISFairPlayRentalInfo setPlaybackDuration:](v12, "setPlaybackDuration:", v19);
      -[ISFairPlayRentalInfo setPlaybackStartTime:](v12, "setPlaybackStartTime:", v18);
      -[ISFairPlayRentalInfo setRentalDuration:](v12, "setRentalDuration:", HIDWORD(v17));
      -[ISFairPlayRentalInfo setRentalStartTime:](v12, "setRentalStartTime:", v17);
      return v12;
    }

    uint64_t v17 = 0LL;
    id v8 = a3;
    unint64_t v9 = 5LL;
  }

  sub_1000231EC(v8, v9, &v17);
  int v11 = v10;
  uint64_t v12 = 0LL;
  if (!v10)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSNumber);
    uint64_t v12 = -[NSNumber initWithUnsignedLongLong:](v13, "initWithUnsignedLongLong:", v17);
  }

  if (a5 && v11) {
    *a5 = (id)SSError(@"FairPlayErrorDomain", v11, 0LL, 0LL);
  }
  return v12;
}

- (BOOL)_isRecognizedProperty:(id)a3
{
  if (([a3 isEqualToString:@"SinfPropertyAccountIdentifier"] & 1) != 0
    || ([a3 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"] & 1) != 0)
  {
    return 1;
  }

  else
  {
    return [a3 isEqualToString:@"SinfPropertyRentalInformation"];
  }

@end