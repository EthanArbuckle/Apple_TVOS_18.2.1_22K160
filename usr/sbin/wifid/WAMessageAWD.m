@interface WAMessageAWD
- (id)_valuesForRepeatedField:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation WAMessageAWD

- (id)_valuesForRepeatedField:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (objc_msgSend(objc_msgSend(a3, "repeatableValues"), "count"))
  {
    unint64_t v5 = 0LL;
    do
      objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(a3, "repeatableValues"), "objectAtIndex:", v5++));
    while (v5 < (unint64_t)objc_msgSend(objc_msgSend(a3, "repeatableValues"), "count"));
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  context = objc_autoreleasePoolPush();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v4 = [[self mutableFields] allValues];
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = "-[WAMessageAWD(WiFi) dictionaryRepresentation]";
    uint64_t v8 = *(void *)v23;
    id v21 = v4;
LABEL_3:
    uint64_t v9 = 0LL;
    while (2)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
      switch((unint64_t)[v10 type])
      {
        case 1uLL:
          [v10 doubleValue];
          v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
          goto LABEL_23;
        case 2uLL:
          [v10 floatValue];
          v11 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
          goto LABEL_23;
        case 3uLL:
          v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 int32Value]);
          goto LABEL_23;
        case 4uLL:
          v11 = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 int64Value]);
          goto LABEL_23;
        case 5uLL:
          v11 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 uint32Value]);
          goto LABEL_23;
        case 6uLL:
          v11 = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 uint64Value]);
          goto LABEL_23;
        case 7uLL:
          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
          goto LABEL_23;
        case 8uLL:
          if ([v10 isRepeatable]) {
LABEL_22:
          }
            v11 = -[WAMessageAWD _valuesForRepeatedField:](self, "_valuesForRepeatedField:", v10);
          else {
            v11 = (NSNumber *)[v10 stringValue];
          }
          goto LABEL_23;
        case 0xAuLL:
          if ([v10 isRepeatable])
          {
            v12 = v7;
            v13 = self;
            id v14 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            if (objc_msgSend(objc_msgSend(v10, "repeatableValues"), "count"))
            {
              unint64_t v15 = 0LL;
              do
              {
                id v16 = objc_msgSend(objc_msgSend(v10, "repeatableValues"), "objectAtIndex:", v15);
                uint64_t v17 = objc_opt_class(&OBJC_CLASS___WAMessageAWD);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
                  [v14 addObject:[v16 dictionaryRepresentation]];
                }
                ++v15;
              }

              while (v15 < (unint64_t)objc_msgSend(objc_msgSend(v10, "repeatableValues"), "count"));
            }

            [v3 setValue:v14 forKey:[v10 key]];
            self = v13;
            v7 = v12;
            id v4 = v21;
          }

          else
          {
            v11 = (NSNumber *)objc_msgSend(objc_msgSend(v10, "subMessageValue"), "dictionaryRepresentation");
LABEL_23:
            [v3 setValue:v11 forKey:[v10 key]];
          }

@end