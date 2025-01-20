@interface SKNotificationsCache
- (NSMutableArray)appearedDisks;
- (NSMutableArray)changedDisks;
- (NSMutableArray)disappearedDisks;
- (NSMutableArray)disksToProcess;
- (OS_dispatch_group)processingGroup;
- (SKDisk)processedDisk;
- (SKNotificationsCache)initWithDiskOperationMap:(id)a3;
- (void)prepareWithDiskOperationMap:(id)a3;
- (void)setProcessedDisk:(id)a3;
@end

@implementation SKNotificationsCache

- (void)prepareWithDiskOperationMap:(id)a3
{
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = a3;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v38)
  {
    uint64_t v4 = *(void *)v41;
    p_cache = &OBJC_CLASS___SKFSTaskPair.cache;
    uint64_t v36 = *(void *)v41;
    v37 = self;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v41 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue( [obj objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * (void)i)]);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", p_cache[344]));
        if ([v8 isEqualToString:off_100051AE8])
        {

LABEL_8:
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
          v10 = -[SKDiskOperations initWithWholeDiskOperation:]( objc_alloc(&OBJC_CLASS___SKDiskOperations),  "initWithWholeDiskOperation:",  v7);
          [v9 addObject:v10];
          goto LABEL_34;
        }

        v11 = p_cache;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", p_cache[344]));
        if ([v12 isEqualToString:off_100051AE0])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", off_100051AF0));
          unsigned __int8 v14 = sub_1000124CC(v13);

          self = v37;
          p_cache = v11;
          if ((v14 & 1) == 0) {
            goto LABEL_8;
          }
        }

        else
        {

          p_cache = v11;
        }

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKey:](v7, "objectForKey:", off_100051AF8));
        v10 = (SKDiskOperations *)DADiskCopyDescription((DADiskRef)v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[SKDiskOperations objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumeNetworkKey));
        if (sub_100012488(v15))
        {
          id v16 = sub_10000E2BC();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v47 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
            __int16 v48 = 2112;
            v49 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s: %@ is a network disk, ignoring",  buf,  0x16u);
          }
        }

        else
        {
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SKDiskOperations objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  kDADiskDescriptionMediaWholeKey));
          if ((sub_100012488(v17) & 1) != 0
            || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:]( &OBJC_CLASS___SKAPFSDisk,  "isLIFSAPFSWithDiskDescription:",  v10))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
            id v19 = [v18 indexOfObject:v9];

            self = v37;
            v20 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
            DADiskRef v21 = v20;
            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = -[SKDiskOperations initWithWholeDiskOperation:]( objc_alloc(&OBJC_CLASS___SKDiskOperations),  "initWithWholeDiskOperation:",  v7);
              -[__DADisk addObject:](v21, "addObject:", v22);
            }

            else
            {
              v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[__DADisk objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", v19));
              -[SKDiskOperations setWholeDiskOperation:](v22, "setWholeDiskOperation:", v7);
            }
          }

          else
          {
            DADiskRef v21 = DADiskCopyWholeDisk((DADiskRef)v9);
            if (v21)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
              id v24 = [v23 indexOfObject:v21];

              if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v25 = v11[344];
                v44[0] = off_100051AF8;
                v44[1] = v25;
                v45[0] = v21;
                v45[1] = off_100051AD0;
                v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
                v35 = -[SKDiskOperations initWithWholeDiskOperation:]( objc_alloc(&OBJC_CLASS___SKDiskOperations),  "initWithWholeDiskOperation:",  v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations childrenOperations](v35, "childrenOperations"));
                [v26 addObject:v7];

                v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
                v28 = v27;
                v29 = v35;
              }

              else
              {
                v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
                v35 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue( -[SKDiskOperations objectAtIndexedSubscript:]( v22,  "objectAtIndexedSubscript:",  v24));
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations childrenOperations](v35, "childrenOperations"));
                v28 = v27;
                v29 = v7;
              }

              [v27 addObject:v29];

              self = v37;
            }

            else
            {
              id v30 = sub_10000E2BC();
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v47 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
                __int16 v48 = 2112;
                v49 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get whole disk for %@",  buf,  0x16u);
              }

              v22 = -[SKDiskOperations initWithWholeDiskOperation:]( objc_alloc(&OBJC_CLASS___SKDiskOperations),  "initWithWholeDiskOperation:",  v7);
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
              id v34 = [v32 indexOfObject:v9];

              self = v37;
              v33 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
              v35 = v33;
              if (v34 == (id)0x7FFFFFFFFFFFFFFFLL) {
                -[SKDiskOperations addObject:](v33, "addObject:", v22);
              }
              else {
                -[SKDiskOperations setObject:atIndexedSubscript:](v33, "setObject:atIndexedSubscript:", v22);
              }
            }
          }

          p_cache = v11;
        }

        uint64_t v4 = v36;
LABEL_34:
      }

      id v38 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    }

    while (v38);
  }
}

- (SKNotificationsCache)initWithDiskOperationMap:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SKNotificationsCache;
  v5 = -[SKNotificationsCache init](&v17, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    appearedDisks = v5->_appearedDisks;
    v5->_appearedDisks = (NSMutableArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    changedDisks = v5->_changedDisks;
    v5->_changedDisks = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    disappearedDisks = v5->_disappearedDisks;
    v5->_disappearedDisks = (NSMutableArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    disksToProcess = v5->_disksToProcess;
    v5->_disksToProcess = (NSMutableArray *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    processingGroup = v5->_processingGroup;
    v5->_processingGroup = (OS_dispatch_group *)v14;

    -[SKNotificationsCache prepareWithDiskOperationMap:](v5, "prepareWithDiskOperationMap:", v4);
  }

  return v5;
}

- (NSMutableArray)appearedDisks
{
  return self->_appearedDisks;
}

- (NSMutableArray)changedDisks
{
  return self->_changedDisks;
}

- (NSMutableArray)disappearedDisks
{
  return self->_disappearedDisks;
}

- (OS_dispatch_group)processingGroup
{
  return self->_processingGroup;
}

- (NSMutableArray)disksToProcess
{
  return self->_disksToProcess;
}

- (SKDisk)processedDisk
{
  return self->_processedDisk;
}

- (void)setProcessedDisk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end