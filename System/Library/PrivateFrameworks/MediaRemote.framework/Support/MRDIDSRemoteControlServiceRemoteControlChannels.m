@interface MRDIDSRemoteControlServiceRemoteControlChannels
- (id)channelForDestination:(id)a3 session:(id)a4;
- (id)debugDescription;
- (void)addChannel:(id)a3 forDestination:(id)a4 session:(id)a5;
- (void)removeChannelForDestination:(id)a3;
@end

@implementation MRDIDSRemoteControlServiceRemoteControlChannels

- (id)debugDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_channels, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_compactMap:", &stru_10039C188));

  uint64_t v4 = MRCreateIndentedDebugDescriptionFromArray(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)addChannel:(id)a3 forDestination:(id)a4 session:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_channels,  "objectForKeyedSubscript:",  v8));
  if (!v10)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    channels = self->_channels;
    if (!channels)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v13 = self->_channels;
      self->_channels = v12;

      channels = self->_channels;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](channels, "setObject:forKeyedSubscript:", v10, v8);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, v9);
}

- (void)removeChannelForDestination:(id)a3
{
  id v4 = a3;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_1000602C4;
  v13[4] = sub_1000602D4;
  id v14 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_channels, "objectForKeyedSubscript:", v4));
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1000602DC;
  v10 = &unk_10039C1B0;
  v12 = v13;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v7];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_channels,  "setObject:forKeyedSubscript:",  0LL,  v6,  v7,  v8,  v9,  v10);

  _Block_object_dispose(v13, 8);
}

- (id)channelForDestination:(id)a3 session:(id)a4
{
  channels = self->_channels;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](channels, "objectForKeyedSubscript:", a3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  return v8;
}

- (void).cxx_destruct
{
}

@end