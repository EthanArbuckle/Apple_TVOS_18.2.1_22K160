@interface ADCommunalDeviceUserAttributes
+ (id)saCopy:(id)a3;
- (ADCommunalDeviceUserAttributes)initWithAttribute:(unint64_t)a3;
- (id)attributes;
- (void)addAttribute:(unint64_t)a3;
- (void)deleteAttribute:(unint64_t)a3;
@end

@implementation ADCommunalDeviceUserAttributes

- (ADCommunalDeviceUserAttributes)initWithAttribute:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADCommunalDeviceUserAttributes;
  v4 = -[ADCommunalDeviceUserAttributes init](&v10, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    attributes = v4->_attributes;
    v4->_attributes = v5;

    v7 = v4->_attributes;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableArray addObject:](v7, "addObject:", v8);
  }

  return v4;
}

- (void)addAttribute:(unint64_t)a3
{
  attributes = self->_attributes;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray addObject:](attributes, "addObject:", v4);
}

- (void)deleteAttribute:(unint64_t)a3
{
  attributes = self->_attributes;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray removeObject:](attributes, "removeObject:", v4);
}

- (id)attributes
{
  return -[NSMutableArray copy](self->_attributes, "copy");
}

- (void).cxx_destruct
{
}

+ (id)saCopy:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a3 attributes]);
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      uint64_t v9 = SAHomeMemberInfoAttributeOWNERValue;
      uint64_t v10 = SAHomeMemberInfoAttributeDEBUGValue;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        }

        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }

    if (-[NSMutableArray count](v4, "count")) {
      v13 = v4;
    }
    else {
      v13 = 0LL;
    }
    v14 = v13;

    return v14;
  }

  else
  {
    uint64_t v21 = SAHomeMemberInfoAttributeUNKNOWNValue;
    return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v21,  1LL));
  }

@end