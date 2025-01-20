@interface TRANSITPbLocationFingerprints
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)locationFingerprints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationFingerprintAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationFingerprintsCount;
- (void)addLocationFingerprint:(id)a3;
- (void)clearLocationFingerprints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setLocationFingerprints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprints

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprints;
  -[TRANSITPbLocationFingerprints dealloc](&v3, "dealloc");
}

- (void)clearLocationFingerprints
{
}

- (void)addLocationFingerprint:(id)a3
{
  locationFingerprints = self->_locationFingerprints;
  if (!locationFingerprints)
  {
    locationFingerprints = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_locationFingerprints = locationFingerprints;
  }

  -[NSMutableArray addObject:](locationFingerprints, "addObject:", a3);
}

- (unint64_t)locationFingerprintsCount
{
  return (unint64_t)-[NSMutableArray count](self->_locationFingerprints, "count");
}

- (id)locationFingerprintAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_locationFingerprints, "objectAtIndex:", a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TRANSITPbLocationFingerprints;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[TRANSITPbLocationFingerprints description](&v3, "description"),  -[TRANSITPbLocationFingerprints dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_locationFingerprints, "count"))
  {
    v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_locationFingerprints, "count"));
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    locationFingerprints = self->_locationFingerprints;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(locationFingerprints);
          }
          -[NSMutableArray addObject:]( v4,  "addObject:",  [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) dictionaryRepresentation]);
          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"locationFingerprint"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1005B0F70(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  locationFingerprints = self->_locationFingerprints;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(locationFingerprints);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v9 + 1) + 8LL * (void)i), 1LL);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

- (void)copyTo:(id)a3
{
  if (-[TRANSITPbLocationFingerprints locationFingerprintsCount](self, "locationFingerprintsCount"))
  {
    [a3 clearLocationFingerprints];
    unint64_t v5 = -[TRANSITPbLocationFingerprints locationFingerprintsCount](self, "locationFingerprintsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend( a3,  "addLocationFingerprint:",  -[TRANSITPbLocationFingerprints locationFingerprintAtIndex:](self, "locationFingerprintAtIndex:", i));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  locationFingerprints = self->_locationFingerprints;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(locationFingerprints);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addLocationFingerprint:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationFingerprints,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    locationFingerprints = self->_locationFingerprints;
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_locationFingerprints, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = (void *)*((void *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TRANSITPbLocationFingerprints addLocationFingerprint:]( self,  "addLocationFingerprint:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (NSMutableArray)locationFingerprints
{
  return self->_locationFingerprints;
}

- (void)setLocationFingerprints:(id)a3
{
}

@end