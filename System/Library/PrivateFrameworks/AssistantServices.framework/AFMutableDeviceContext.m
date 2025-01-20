@interface AFMutableDeviceContext
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)removeContextSnapshotForType:(id)a3;
- (void)removeHistoricalContextForType:(id)a3;
- (void)setContextSnapshot:(id)a3 withMetadata:(id)a4;
- (void)setDeviceInfo:(id)a3;
- (void)setFromLocalDevice:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrivacyClass:(int64_t)a3;
- (void)setSerializedContextSnapshot:(id)a3 withMetadata:(id)a4;
@end

@implementation AFMutableDeviceContext

- (void)setFromLocalDevice:(BOOL)a3
{
  self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__fromLocalDevice] = a3;
}

- (void)setIdentifier:(id)a3
{
  id v4 = [a3 copy];
  v5 = *(void **)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__identifier];
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__identifier] = v4;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = [a3 copy];
  v5 = *(void **)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__deviceInfo];
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__deviceInfo] = v4;

  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__dirtyFlags] |= 1uLL;
}

- (void)setPrivacyClass:(int64_t)a3
{
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__privacyClass] = a3;
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__dirtyFlags] |= 2uLL;
}

- (void)setContextSnapshot:(id)a3 withMetadata:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 serializedBackingStore]);
  -[AFMutableDeviceContext setSerializedContextSnapshot:withMetadata:]( self,  "setSerializedContextSnapshot:withMetadata:",  v7,  v6);
}

- (void)setSerializedContextSnapshot:(id)a3 withMetadata:(id)a4
{
  id v32 = a4;
  uint64_t v6 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
  id v7 = *(void **)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore];
  uint64_t v8 = AFDeviceContextKeyContexts;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
  v11 = (NSMutableDictionary *)[v10 mutableCopy];

  if (!v11) {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v32 type]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12));
  v14 = (NSMutableDictionary *)[v13 mutableCopy];

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v32 historyConfiguration]);
    if ([v15 keepsHistory])
    {
      uint64_t v30 = v6;
      v31 = self;
      uint64_t v29 = AFDeviceContextKeyHistoricalData;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:"));
      uint64_t v17 = AFNonNilMutableCopyOfArray();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", AFDeviceContextKeyData));
      uint64_t v27 = AFDeviceContextKeyHistoricalMetadata;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:"));
      uint64_t v20 = AFNonNilMutableCopyOfArray();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", AFDeviceContextKeyMetadata));
      v23 = [v15 historyBufferSize];
      v24 = (char *)((_BYTE *)[v18 count] - v23);
      if ((uint64_t)v24 >= 0)
      {
        v25 = v24 + 1;
        objc_msgSend(v18, "removeObjectsInRange:", 0, v24 + 1);
        objc_msgSend(v21, "removeObjectsInRange:", 0, v25);
      }

      [v18 addObject:v28];
      [v21 addObject:v22];
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v18, v29);
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v21, v27);

      uint64_t v6 = v30;
      self = v31;
    }
  }

  else
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v9, AFDeviceContextKeyData);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v32 backingStore]);
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v26, AFDeviceContextKeyMetadata);

  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, v12);
  [*(id *)&self->AFDeviceContext_opaque[v6] setObject:v11 forKey:v8];
}

- (void)removeContextSnapshotForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
    uint64_t v6 = AFDeviceContextKeyContexts;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore] objectForKey:AFDeviceContextKeyContexts]);
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v11]);
      id v10 = [v9 mutableCopy];

      if (v10)
      {
        [v10 removeObjectForKey:AFDeviceContextKeyData];
        [v10 removeObjectForKey:AFDeviceContextKeyMetadata];
        [v8 setObject:v10 forKey:v11];
        [*(id *)&self->AFDeviceContext_opaque[v5] setObject:v8 forKey:v6];
      }
    }

    id v4 = v11;
  }
}

- (void)removeHistoricalContextForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
    uint64_t v6 = AFDeviceContextKeyContexts;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore] objectForKey:AFDeviceContextKeyContexts]);
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v11]);
      id v10 = [v9 mutableCopy];

      if (v10)
      {
        [v10 removeObjectForKey:AFDeviceContextKeyHistoricalData];
        [v10 removeObjectForKey:AFDeviceContextKeyHistoricalMetadata];
        [*(id *)&self->AFDeviceContext_opaque[v5] setObject:v8 forKey:v6];
      }
    }

    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[AFDeviceContext allocWithZone:](&OBJC_CLASS___AFDeviceContext, "allocWithZone:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFMutableDeviceContext serializedBackingStore](self, "serializedBackingStore"));
  id v6 = -[AFMutableDeviceContext fromLocalDevice](self, "fromLocalDevice");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFMutableDeviceContext contextCollectorSource](self, "contextCollectorSource"));
  id v8 = -[AFDeviceContext initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:]( v4,  "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:",  v5,  v6,  v7);

  return v8;
}

- (id)description
{
  return -[AFMutableDeviceContext buildDescription](self, "buildDescription");
}

@end