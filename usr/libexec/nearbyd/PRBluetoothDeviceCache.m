@interface PRBluetoothDeviceCache
- (BOOL)isCached:(id)a3;
- (BOOL)isCachedByTokenData:(id)a3;
- (BOOL)uncacheDeviceByTokenData:(id)a3;
- (PRBluetoothDeviceCache)init;
- (id)cachedDevices;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForIdentifier:(unint64_t)a3;
- (id)deviceForTokenData:(id)a3;
- (void)cacheDevice:(id)a3;
- (void)reset;
- (void)uncacheDevice:(id)a3;
@end

@implementation PRBluetoothDeviceCache

- (PRBluetoothDeviceCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PRBluetoothDeviceCache;
  v2 = -[PRBluetoothDeviceCache init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    u64IdentifierToBluetoothDeviceMap = v3->_u64IdentifierToBluetoothDeviceMap;
    v3->_u64IdentifierToBluetoothDeviceMap = v4;

    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    tokenDataToBluetoothDeviceMap = v3->_tokenDataToBluetoothDeviceMap;
    v3->_tokenDataToBluetoothDeviceMap = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    idsIdentifierToBluetoothDeviceMap = v3->_idsIdentifierToBluetoothDeviceMap;
    v3->_idsIdentifierToBluetoothDeviceMap = v8;
  }

  return v3;
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_u64IdentifierToBluetoothDeviceMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_tokenDataToBluetoothDeviceMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_idsIdentifierToBluetoothDeviceMap, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)cachedDevices
{
  v3 = objc_opt_new(&OBJC_CLASS___NSArray);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_u64IdentifierToBluetoothDeviceMap, "allValues"));

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)cacheDevice:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Caching device with address: 0x%llx",  (uint8_t *)&v16,  0xCu);
    }

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( u64IdentifierToBluetoothDeviceMap,  "setObject:forKeyedSubscript:",  v5,  v10);

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 discoveryTokenData]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( tokenDataToBluetoothDeviceMap,  "setObject:forKeyedSubscript:",  v5,  v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
    LOBYTE(v12) = v13 == 0LL;

    if ((v12 & 1) == 0)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( idsIdentifierToBluetoothDeviceMap,  "setObject:forKeyedSubscript:",  v5,  v15);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)uncacheDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    id v5 = [v4 u64Identifier];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
    -[NSMutableDictionary removeObjectForKey:](u64IdentifierToBluetoothDeviceMap, "removeObjectForKey:", v8);

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v14 discoveryTokenData]);
    -[NSMutableDictionary removeObjectForKey:](tokenDataToBluetoothDeviceMap, "removeObjectForKey:", v10);

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceID]);
    if (v11)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceID]);
      -[NSMutableDictionary removeObjectForKey:](idsIdentifierToBluetoothDeviceMap, "removeObjectForKey:", v13);
    }

    os_unfair_lock_unlock(p_lock);
    id v4 = v14;
  }
}

- (BOOL)uncacheDeviceByTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenDataToBluetoothDeviceMap, "objectForKey:", v4));
    os_unfair_lock_unlock(&self->_lock);
    BOOL v6 = v5 != 0LL;
    if (v5) {
      -[PRBluetoothDeviceCache uncacheDevice:](self, "uncacheDevice:", v5);
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isCached:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryTokenData]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](self, "deviceForTokenData:", v6));
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isCachedByTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](self, "deviceForTokenData:", v4));
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)deviceForIdentifier:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( u64IdentifierToBluetoothDeviceMap,  "objectForKeyedSubscript:",  v7));

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)deviceForTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tokenDataToBluetoothDeviceMap,  "objectForKeyedSubscript:",  v4));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_idsIdentifierToBluetoothDeviceMap,  "objectForKeyedSubscript:",  v4));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end