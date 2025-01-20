@interface PBBluetoothDeviceStatistics
- (PBBluetoothDeviceStatistics)initWithDevices:(id)a3;
- (id)description;
- (unint64_t)audioDeviceCount;
- (unint64_t)gameControllerCount;
- (unint64_t)genericDeviceCount;
- (unint64_t)keyboardCount;
- (unint64_t)remoteCount;
- (unint64_t)totalDeviceCount;
@end

@implementation PBBluetoothDeviceStatistics

- (PBBluetoothDeviceStatistics)initWithDevices:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBBluetoothDeviceStatistics;
  v5 = -[PBBluetoothDeviceStatistics init](&v21, "init");
  v6 = v5;
  if (v5)
  {
    id v15 = v4;
    v16 = v5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "type", v15);
          p_audioDeviceCount = &v16->_audioDeviceCount;
          switch((unint64_t)v12)
          {
            case 0uLL:
              p_audioDeviceCount = &v16->_genericDeviceCount;
              goto LABEL_12;
            case 1uLL:
              p_audioDeviceCount = &v16->_remoteCount;
              goto LABEL_12;
            case 2uLL:
              p_audioDeviceCount = &v16->_keyboardCount;
              goto LABEL_12;
            case 3uLL:
              goto LABEL_12;
            case 4uLL:
              p_audioDeviceCount = &v16->_gameControllerCount;
LABEL_12:
              ++*p_audioDeviceCount;
              break;
            default:
              continue;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v9);
    }

    id v4 = v15;
    v6 = v16;
  }

  return v6;
}

- (unint64_t)totalDeviceCount
{
  unint64_t v3 = -[PBBluetoothDeviceStatistics remoteCount](self, "remoteCount");
  id v4 = (char *)-[PBBluetoothDeviceStatistics keyboardCount](self, "keyboardCount") + v3;
  unint64_t v5 = -[PBBluetoothDeviceStatistics audioDeviceCount](self, "audioDeviceCount");
  v6 = (char *)-[PBBluetoothDeviceStatistics gameControllerCount](self, "gameControllerCount") + v5 + (void)v4;
  return -[PBBluetoothDeviceStatistics genericDeviceCount](self, "genericDeviceCount") + (void)v6;
}

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendUnsignedInteger:withName:",  -[PBBluetoothDeviceStatistics totalDeviceCount](self, "totalDeviceCount"),  @"totalDeviceCount");
  id v5 = [v3 appendUnsignedInteger:self->_remoteCount withName:@"remoteCount"];
  id v6 = [v3 appendUnsignedInteger:self->_keyboardCount withName:@"keyboardCount"];
  id v7 = [v3 appendUnsignedInteger:self->_audioDeviceCount withName:@"audioDeviceCount"];
  id v8 = [v3 appendUnsignedInteger:self->_gameControllerCount withName:@"gameControllerCount"];
  id v9 = [v3 appendUnsignedInteger:self->_genericDeviceCount withName:@"genericDeviceCount"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v10;
}

- (unint64_t)remoteCount
{
  return self->_remoteCount;
}

- (unint64_t)keyboardCount
{
  return self->_keyboardCount;
}

- (unint64_t)audioDeviceCount
{
  return self->_audioDeviceCount;
}

- (unint64_t)gameControllerCount
{
  return self->_gameControllerCount;
}

- (unint64_t)genericDeviceCount
{
  return self->_genericDeviceCount;
}

@end