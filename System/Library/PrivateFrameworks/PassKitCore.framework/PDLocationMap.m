@interface PDLocationMap
- (PDLocationMap)init;
- (id)description;
- (id)locationsForUniqueID:(id)a3;
- (void)insertLocation:(id)a3 forUniqueID:(id)a4;
@end

@implementation PDLocationMap

- (PDLocationMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDLocationMap;
  v2 = -[PDLocationMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    locationsByUniqueID = v2->_locationsByUniqueID;
    v2->_locationsByUniqueID = v3;
  }

  return v2;
}

- (void)insertLocation:(id)a3 forUniqueID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_locationsByUniqueID,  "objectForKeyedSubscript:",  v6));
  if (!v7)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_locationsByUniqueID,  "setObject:forKeyedSubscript:",  v7,  v6);
  }

  -[NSMutableArray addObject:](v7, "addObject:", v8);
}

- (id)locationsForUniqueID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_locationsByUniqueID, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  return -[NSMutableDictionary description](self->_locationsByUniqueID, "description");
}

- (void).cxx_destruct
{
}

@end