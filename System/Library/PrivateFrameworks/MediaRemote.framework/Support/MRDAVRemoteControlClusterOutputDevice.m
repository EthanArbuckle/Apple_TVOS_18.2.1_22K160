@interface MRDAVRemoteControlClusterOutputDevice
- (BOOL)isLocalDevice;
- (MRDAVRemoteControlClusterOutputDevice)initWithDevices:(id)a3;
- (MRDAVRemoteControlClusterOutputDevice)initWithPrimaryOutputDevice:(id)a3 members:(id)a4;
- (NSArray)memberOutputDevices;
- (id)_calculateHierarchy:(id)a3;
- (id)_createStereoPairRepresentationFrom:(id)a3;
- (id)allClusterMembers;
- (id)clusterComposition;
- (id)descriptor;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRDAVRemoteControlClusterOutputDevice

- (MRDAVRemoteControlClusterOutputDevice)initWithDevices:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  unsigned int v6 = [v5 clusterType];

  if (v6 == 2)
  {
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x3032000000LL;
    v47 = sub_100071B28;
    v48 = sub_100071B38;
    id v49 = 0LL;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100071B40;
    v41[3] = &unk_10039CBF8;
    id v7 = [v4 mutableCopy];
    id v42 = v7;
    v43 = &v44;
    [v4 enumerateObjectsUsingBlock:v41];
    uint64_t v9 = v45[5];
    if (v9)
    {
      v10 = (os_log_s *)[v7 copy];
      self =  -[MRDAVRemoteControlClusterOutputDevice initWithPrimaryOutputDevice:members:]( self,  "initWithPrimaryOutputDevice:members:",  v9,  v10);
      v11 = self;
    }

    else
    {
      uint64_t v34 = _MRLogForCategory(0LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002B6654((uint64_t)v4, v10);
      }
      v11 = 0LL;
    }

    _Block_object_dispose(&v44, 8);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_firstWhere:", &stru_10039CC18));

    if (v12)
    {
      v13 = NSStringFromSelector("isAirPlayReceiverSessionActive");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v38,  1LL));
      v51[0] = v14;
      v15 = NSStringFromSelector("isClusterLeader");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v16,  0LL));
      v51[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
    }

    else
    {
      v19 = NSStringFromSelector("isGroupLeader");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v38,  0LL));
      v50[0] = v14;
      v20 = NSStringFromSelector("groupContextID");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v16,  0LL));
      v50[1] = v17;
      v21 = NSStringFromSelector("isAirPlayReceiverSessionActive");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v37,  1LL));
      v50[2] = v36;
      v22 = NSStringFromSelector("isProxyGroupPlayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v23,  0LL));
      v50[3] = v24;
      v25 = NSStringFromSelector("uid");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v26,  1LL));
      v50[4] = v27;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 5LL));
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v18]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);
    if ((([v29 clusterType] - 1) & 0xFFFFFFFD) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mr_first:", &stru_10039CC38));
      if (v30 && (MRMediaRemoteGetParentGroupContainsDiscoverableGroupLeader() & 1) == 0)
      {
        id v31 = v30;

        v29 = v31;
      }
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100071BC4;
    v39[3] = &unk_10039AC00;
    id v40 = v29;
    id v32 = v29;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mr_filter:", v39));
    self =  -[MRDAVRemoteControlClusterOutputDevice initWithPrimaryOutputDevice:members:]( self,  "initWithPrimaryOutputDevice:members:",  v32,  v33);

    v11 = self;
  }

  return v11;
}

- (MRDAVRemoteControlClusterOutputDevice)initWithPrimaryOutputDevice:(id)a3 members:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptor]);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MRDAVRemoteControlClusterOutputDevice;
  uint64_t v9 = -[MRDAVRemoteControlClusterOutputDevice initWithDescriptor:](&v15, "initWithDescriptor:", v8);

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 arrayByAddingObject:v6]);
    memberOutputDevices = v9->_memberOutputDevices;
    v9->_memberOutputDevices = (NSArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[MRDAVRemoteControlClusterOutputDevice _calculateHierarchy:]( v9,  "_calculateHierarchy:",  v9->_memberOutputDevices));
    allClusterMembers = v9->_allClusterMembers;
    v9->_allClusterMembers = (NSArray *)v12;
  }

  return v9;
}

- (unsigned)deviceType
{
  return 1;
}

- (unsigned)deviceSubtype
{
  return 15;
}

- (id)clusterComposition
{
  return -[NSArray mr_map:](self->_memberOutputDevices, "mr_map:", &stru_10039CC58);
}

- (id)allClusterMembers
{
  return -[NSArray mr_map:](self->_allClusterMembers, "mr_map:", &stru_10039CC78);
}

- (BOOL)isLocalDevice
{
  return -[NSArray mr_any:](self->_memberOutputDevices, "mr_any:", &stru_10039CC98);
}

- (id)descriptor
{
  return -[MRDAVRemoteControlClusterOutputDevice generateDescriptor](self, "generateDescriptor");
}

- (id)_calculateHierarchy:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    id v6 = [v4 mutableCopy];
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v18 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tightSyncID]);
          if (v14)
          {
            objc_super v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v7,  "objectForKeyedSubscript:",  v14));
            if (!v15)
            {
              objc_super v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v14);
            }

            -[NSMutableArray addObject:](v15, "addObject:", v13);
            [v6 removeObject:v13];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v10);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007203C;
    v19[3] = &unk_10039CCC0;
    id v16 = v6;
    id v20 = v16;
    v21 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v19);
    id v5 = v16;

    id v4 = v18;
  }

  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_createStereoPairRepresentationFrom:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mr_first:", &stru_10039CCE0));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  }
  id v5 = objc_alloc_init(&OBJC_CLASS____MRAVOutputDeviceDescriptorProtobuf);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tightSyncID]);
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v5, "setUniqueIdentifier:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v5, "setName:", v7);

  -[_MRAVOutputDeviceDescriptorProtobuf setClusterType:](v5, "setClusterType:", 1LL);
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v5, "setDeviceType:", 1LL);
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v5, "setDeviceSubType:", 15LL);
  id v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 modelID]);
  id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@-%@", v9, @"TightSyncCluster");
  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v5, "setModelID:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mr_map:", &stru_10039CD00));
  id v12 = [v11 mutableCopy];
  -[_MRAVOutputDeviceDescriptorProtobuf setAllClusterMembers:](v5, "setAllClusterMembers:", v12);

  v13 = -[MRAVDistantOutputDevice initWithDescriptor:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithDescriptor:",  v5);
  return v13;
}

- (NSArray)memberOutputDevices
{
  return self->_memberOutputDevices;
}

- (void).cxx_destruct
{
}

@end