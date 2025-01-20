@interface SECC2MPGenericEvent
+ (Class)metricType;
- (BOOL)hasName;
- (BOOL)hasTimestampEnd;
- (BOOL)hasTimestampStart;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metrics;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)timestampEnd;
- (unint64_t)timestampStart;
- (void)addMetric:(id)a3;
- (void)clearMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestampEnd:(BOOL)a3;
- (void)setHasTimestampStart:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setName:(id)a3;
- (void)setTimestampEnd:(unint64_t)a3;
- (void)setTimestampStart:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEvent

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 200)
  {
    if (a3 == 201) {
      return @"cloudkit_client";
    }
    if (a3 == 301) {
      return @"server";
    }
    goto LABEL_10;
  }

  if (!a3) {
    return @"none";
  }
  if (a3 != 101)
  {
LABEL_10:
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
    return v3;
  }

  char v3 = @"cloudkit";
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"cloudkit"])
  {
    int v4 = 101;
  }

  else if ([v3 isEqualToString:@"cloudkit_client"])
  {
    int v4 = 201;
  }

  else if ([v3 isEqualToString:@"server"])
  {
    int v4 = 301;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (void)setTimestampStart:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestampStart = a3;
}

- (void)setHasTimestampStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestampStart
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestampEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampEnd = a3;
}

- (void)setHasTimestampEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMetrics
{
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }

  -[NSMutableArray addObject:](metrics, "addObject:", v4);
}

- (unint64_t)metricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_metrics, "count");
}

- (id)metricAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_metrics, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPGenericEvent;
  id v3 = -[SECC2MPGenericEvent description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    int type = self->_type;
    if (type > 200)
    {
      if (type == 201)
      {
        v5 = @"cloudkit_client";
        goto LABEL_12;
      }

      if (type == 301)
      {
        v5 = @"server";
        goto LABEL_12;
      }
    }

    else
    {
      if (!type)
      {
        v5 = @"none";
        goto LABEL_12;
      }

      if (type == 101)
      {
        v5 = @"cloudkit";
LABEL_12:
        [v3 setObject:v5 forKey:@"type"];

        goto LABEL_13;
      }
    }

    v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    goto LABEL_12;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_1000979CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
  }
  name = self->_name;
  if (name) {
    PBDataWriterWriteStringField(v5, name, 101LL);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestampStart, 201LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_timestampEnd, 202LL);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_super v8 = self->_metrics;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v13 + 1) + 8LL * (void)i), 301LL);
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 44) |= 4u;
  }

  id v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_timestampStart;
    *((_BYTE *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_timestampEnd;
    *((_BYTE *)v4 + 44) |= 1u;
  }

  if (-[SECC2MPGenericEvent metricsCount](self, "metricsCount"))
  {
    [v10 clearMetrics];
    unint64_t v6 = -[SECC2MPGenericEvent metricsCount](self, "metricsCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEvent metricAtIndex:](self, "metricAtIndex:", i));
        [v10 addMetric:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[10] = self->_type;
    *((_BYTE *)v5 + 44) |= 4u;
  }

  id v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6[2] = self->_timestampStart;
    *((_BYTE *)v6 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6[1] = self->_timestampEnd;
    *((_BYTE *)v6 + 44) |= 1u;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = self->_metrics;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v17);
        [v6 addMetric:v15];
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  char v7 = *((_BYTE *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }

  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_22:
      unsigned __int8 v10 = 0;
      goto LABEL_23;
    }

    char has = (char)self->_has;
    char v7 = *((_BYTE *)v4 + 44);
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_timestampStart != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_22;
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestampEnd != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_22;
  }

  metrics = self->_metrics;
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_timestampStart;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_metrics, "hash");
  }

  unint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_timestampEnd;
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_metrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_int type = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }

  if (*((void *)v4 + 4)) {
    -[SECC2MPGenericEvent setName:](self, "setName:");
  }
  char v6 = *((_BYTE *)v5 + 44);
  if ((v6 & 2) != 0)
  {
    self->_timestampStart = *((void *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v6 = *((_BYTE *)v5 + 44);
  }

  if ((v6 & 1) != 0)
  {
    self->_timestampEnd = *((void *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = *((id *)v5 + 3);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SECC2MPGenericEvent addMetric:]( self,  "addMetric:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)timestampStart
{
  return self->_timestampStart;
}

- (unint64_t)timestampEnd
{
  return self->_timestampEnd;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)metricType
{
  return (Class)objc_opt_class(&OBJC_CLASS___SECC2MPGenericEventMetric, a2);
}

@end