@interface TVPABluetoothRemoteUsage
- (BOOL)isEqual:(id)a3;
- (BOOL)recordBatteryLevel:(unint64_t)a3;
- (NSArray)batterySnapshots;
- (NSString)identifier;
- (NSString)remoteIdentifier;
- (NSString)remoteSerialNumber;
- (TVPABluetoothRemoteUsage)init;
- (TVPABluetoothRemoteUsage)initWithBluetoothRemoteInfo:(id)a3;
- (TVPABluetoothRemoteUsage)initWithDictionaryRepresentation:(id)a3;
- (TVPABluetoothRemoteUsage)initWithIdentifier:(id)a3 remoteIdentifier:(id)a4 remoteSerialNumber:(id)a5 remoteType:(int64_t)a6;
- (TVPABluetoothRemoteUsage)initWithRemoteIdentifier:(id)a3 remoteSerialNumber:(id)a4 remoteType:(int64_t)a5;
- (id)_snapshotWithBatteryLevel:(unint64_t)a3 timestamp:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)remoteType;
- (unint64_t)hash;
- (void)clearBatterySnapshots;
@end

@implementation TVPABluetoothRemoteUsage

- (TVPABluetoothRemoteUsage)init
{
  v3 = self;
  -[TVPABluetoothRemoteUsage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  objc_storeStrong((id *)&v3, 0LL);
  return 0LL;
}

- (TVPABluetoothRemoteUsage)initWithIdentifier:(id)a3 remoteIdentifier:(id)a4 remoteSerialNumber:(id)a5 remoteType:(int64_t)a6
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v23 = 0LL;
  objc_storeStrong(&v23, a4);
  id v22 = 0LL;
  objc_storeStrong(&v22, a5);
  int64_t v21 = a6;
  v6 = v25;
  v25 = 0LL;
  v20.receiver = v6;
  v20.super_class = (Class)&OBJC_CLASS___TVPABluetoothRemoteUsage;
  v25 = -[TVPABluetoothRemoteUsage init](&v20, "init");
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    v7 = (NSString *)[location[0] copy];
    identifier = v25->_identifier;
    v25->_identifier = v7;

    v9 = (NSString *)[v23 copy];
    remoteIdentifier = v25->_remoteIdentifier;
    v25->_remoteIdentifier = v9;

    v11 = (NSString *)[v22 copy];
    remoteSerialNumber = v25->_remoteSerialNumber;
    v25->_remoteSerialNumber = v11;

    v25->_remoteType = v21;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    batterySnapshots = v25->_batterySnapshots;
    v25->_batterySnapshots = v13;
  }

  v16 = v25;
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  return v16;
}

- (TVPABluetoothRemoteUsage)initWithRemoteIdentifier:(id)a3 remoteSerialNumber:(id)a4 remoteType:(int64_t)a5
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v7 = v13;
  v9 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  v8 = -[NSUUID UUIDString](v9, "UUIDString");
  v13 = 0LL;
  v13 = -[TVPABluetoothRemoteUsage initWithIdentifier:remoteIdentifier:remoteSerialNumber:remoteType:]( v7,  "initWithIdentifier:remoteIdentifier:remoteSerialNumber:remoteType:");
  v10 = v13;

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v10;
}

- (TVPABluetoothRemoteUsage)initWithBluetoothRemoteInfo:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = v10;
  id v7 = [location[0] identifier];
  id v6 = [location[0] name];
  id v3 = [location[0] remoteType];
  v10 = 0LL;
  v10 = -[TVPABluetoothRemoteUsage initWithRemoteIdentifier:remoteSerialNumber:remoteType:]( v5,  "initWithRemoteIdentifier:remoteSerialNumber:remoteType:",  v7,  v6,  v3);
  v8 = v10;

  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v8;
}

- (TVPABluetoothRemoteUsage)initWithDictionaryRepresentation:(id)a3
{
  id v50 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v48 = objc_msgSend(location[0], "bs_safeStringForKey:", @"Identifier");
  id v47 = objc_msgSend(location[0], "bs_safeStringForKey:", @"RemoteIdentifier");
  id v46 = objc_msgSend(location[0], "bs_safeStringForKey:", @"RemoteSerialNumber");
  id v21 = objc_msgSend(location[0], "bs_safeNumberForKey:", @"RemoteType");
  id v22 = [v21 unsignedIntegerValue];

  id v45 = v22;
  if (v48 && v47 && v46)
  {
    id v3 = v50;
    id v50 = 0LL;
    id v50 = [v3 initWithIdentifier:v48 remoteIdentifier:v47 remoteSerialNumber:v46 remoteType:v45];
    objc_storeStrong(&v50, v50);
    if (v50)
    {
      id v43 = 0LL;
      id v42 = objc_msgSend(location[0], "bs_safeArrayForKey:", @"BatterySnapshots");
      memset(__b, 0, sizeof(__b));
      id obj = v42;
      id v20 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
      if (v20)
      {
        uint64_t v16 = *(void *)__b[2];
        uint64_t v17 = 0LL;
        id v18 = v20;
        while (1)
        {
          uint64_t v15 = v17;
          if (*(void *)__b[2] != v16) {
            objc_enumerationMutation(obj);
          }
          v41 = *(void **)(__b[1] + 8 * v17);
          v14 = v41;
          uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          id v38 = sub_10000E67C(v14, v4);
          id v39 = v38;
          if (!v38) {
            goto LABEL_36;
          }
          id v37 = objc_msgSend(v39, "bs_safeNumberForKey:", @"Level");
          id v36 = [v37 unsignedIntegerValue];
          id v35 =  objc_msgSend( v39,  "bs_safeObjectForKey:ofType:",  @"Timestamp",  objc_opt_class(NSDate));
          if (v37 && (unint64_t)v36 <= 0x64 && v35)
          {
            id v34 = [v50 _snapshotWithBatteryLevel:v36 timestamp:v35];
            [*((id *)v50 + 1) addObject:v34];
            if (!v43) {
              goto LABEL_29;
            }
            id v12 = [v34 batteryRange];
            BOOL v5 = v12 <= [v43 batteryRange];
            char v32 = 0;
            char v30 = 0;
            char v28 = 0;
            char v26 = 0;
            BOOL v13 = 1;
            if (!v5)
            {
              id v10 = [v34 timestamp];
              id v33 = v10;
              char v32 = 1;
              id v31 = [v43 timestamp];
              char v30 = 1;
              id v11 = objc_msgSend(v10, "earlierDate:");
              id v29 = v11;
              char v28 = 1;
              id v27 = [v43 timestamp];
              char v26 = 1;
              BOOL v13 = v11 == v27;
            }

            if ((v26 & 1) != 0) {

            }
            if ((v28 & 1) != 0) {
            if ((v30 & 1) != 0)
            }

            if ((v32 & 1) != 0) {
            if (v13)
            }
            {
              os_log_t oslog = (os_log_t)sub_10000ABA4();
              os_log_type_t type = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                log = oslog;
                os_log_type_t v9 = type;
                sub_10000AA38((uint64_t)v53, (uint64_t)v34, (uint64_t)v43);
                _os_log_error_impl( (void *)&_mh_execute_header,  log,  v9,  "Detected badly ordered snapshots in dictionary representation. All battery snapshots will be ignored. snapshot=%@, previousSnapshot=%@",  v53,  0x16u);
              }

              objc_storeStrong((id *)&oslog, 0LL);
              [*((id *)v50 + 1) removeAllObjects];
              int v44 = 2;
            }

            else
            {
LABEL_29:
              objc_storeStrong(&v43, v34);
              int v44 = 0;
            }

            objc_storeStrong(&v34, 0LL);
            if (!v44) {
              int v44 = 0;
            }
          }

          else
          {
            os_log_t v23 = (os_log_t)sub_10000ABA4();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v7 = v23;
              sub_10000AA38((uint64_t)v52, (uint64_t)v37, (uint64_t)v35);
              _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Detected bad battery level or timestamp data in dictionary representation. All battery snapshots will be ignored. batteryLevel=%@, timestamp=%@",  v52,  0x16u);
            }

            objc_storeStrong((id *)&v23, 0LL);
            [*((id *)v50 + 1) removeAllObjects];
            int v44 = 2;
          }

          objc_storeStrong(&v35, 0LL);
          objc_storeStrong(&v37, 0LL);
          if (!v44) {
LABEL_36:
          }
            int v44 = 0;
          objc_storeStrong(&v39, 0LL);
          if (v44) {
            break;
          }
          ++v17;
          if (v15 + 1 >= (unint64_t)v18)
          {
            uint64_t v17 = 0LL;
            id v18 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
            if (!v18) {
              goto LABEL_40;
            }
          }
        }
      }

      else
      {
LABEL_40:
        int v44 = 0;
      }

      objc_storeStrong(&v42, 0LL);
      objc_storeStrong(&v43, 0LL);
    }

    v51 = (TVPABluetoothRemoteUsage *)v50;
    int v44 = 1;
  }

  else
  {
    v51 = 0LL;
    int v44 = 1;
  }

  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v50, 0LL);
  return v51;
}

- (NSArray)batterySnapshots
{
  return (NSArray *)-[NSMutableArray copy](self->_batterySnapshots, "copy", a2, self);
}

- (BOOL)recordBatteryLevel:(unint64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  if (a3 <= 0x64)
  {
    BOOL v9 = 0;
    id v8 = -[NSMutableArray firstObject](v12->_batterySnapshots, "firstObject");
    if (v8)
    {
      if (v10 <= (unint64_t)[v8 batteryLevel])
      {
        unint64_t v5 = sub_10000CF10(v10);
        BOOL v9 = v5 < (unint64_t)[v8 batteryRange];
      }

      else
      {
        id location = sub_10000ABA4();
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
        {
          sub_10000E9E8( (uint64_t)v14,  (uint64_t)"-[TVPABluetoothRemoteUsage recordBatteryLevel:]",  v10,  (uint64_t)[v8 batteryLevel]);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v6,  "%s: Battery level has unexpectedly increased. Clearing battery snapshots. batteryLevel=%lu, previousBatteryLevel=%lu",  v14,  0x20u);
        }

        objc_storeStrong(&location, 0LL);
        -[TVPABluetoothRemoteUsage clearBatterySnapshots](v12, "clearBatterySnapshots");
        BOOL v9 = 1;
      }
    }

    else
    {
      BOOL v9 = 1;
    }

    if (v9)
    {
      id v4 =  -[TVPABluetoothRemoteUsage _snapshotWithBatteryLevel:timestamp:]( v12,  "_snapshotWithBatteryLevel:timestamp:",  v10);
      -[NSMutableArray insertObject:atIndex:](v12->_batterySnapshots, "insertObject:atIndex:", v4, 0LL);
      objc_storeStrong(&v4, 0LL);
    }

    BOOL v13 = v9;
    objc_storeStrong(&v8, 0LL);
  }

  else
  {
    return 0;
  }

  return v13;
}

- (void)clearBatterySnapshots
{
}

- (id)dictionaryRepresentation
{
  os_log_t v23 = self;
  v22[1] = (id)a2;
  v22[0] = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = -[TVPABluetoothRemoteUsage identifier](v23, "identifier");
  objc_msgSend(v22[0], "setObject:forKey:");

  BOOL v13 = -[TVPABluetoothRemoteUsage remoteIdentifier](v23, "remoteIdentifier");
  objc_msgSend(v22[0], "setObject:forKey:");

  v14 = -[TVPABluetoothRemoteUsage remoteSerialNumber](v23, "remoteSerialNumber");
  objc_msgSend(v22[0], "setObject:forKey:");

  uint64_t v15 =  +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[TVPABluetoothRemoteUsage remoteType](v23, "remoteType"));
  objc_msgSend(v22[0], "setObject:forKey:");

  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v23->_batterySnapshots;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v24,  16LL);
  if (v17)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v17;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v10);
      id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v4 = v18;
      unint64_t v5 =  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v20 batteryLevel]);
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:");

      os_log_type_t v6 = v18;
      id v7 = [v20 timestamp];
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:");

      -[NSMutableArray addObject:](v21, "addObject:", v18);
      objc_storeStrong((id *)&v18, 0LL);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v24,  16LL);
        if (!v11) {
          break;
        }
      }
    }
  }

  [v22[0] setObject:v21 forKey:@"BatterySnapshots"];
  id v3 = [v22[0] copy];
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(v22, 0LL);
  return v3;
}

- (id)_snapshotWithBatteryLevel:(unint64_t)a3 timestamp:(id)a4
{
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (!location)
  {
    id v4 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
    id v5 = location;
    id location = v4;
  }

  os_log_type_t v6 = objc_alloc(&OBJC_CLASS___TVPABluetoothRemoteBatterySnapshot);
  uint64_t v8 = -[TVPABluetoothRemoteBatterySnapshot initWithBatteryLevel:timestamp:]( v6,  "initWithBatteryLevel:timestamp:",  v10,  location);
  objc_storeStrong(&location, 0LL);
  return v8;
}

- (id)description
{
  uint64_t v16 = self;
  v15[1] = (id)a2;
  v15[0] = [[BSDescriptionBuilder alloc] initWithObject:self];
  id v4 = v15[0];
  id v5 = -[TVPABluetoothRemoteUsage identifier](v16, "identifier");
  objc_msgSend(v4, "appendString:withName:");

  id v6 = v15[0];
  id v7 = -[TVPABluetoothRemoteUsage remoteIdentifier](v16, "remoteIdentifier");
  objc_msgSend(v6, "appendString:withName:");

  id v8 = v15[0];
  uint64_t v9 = -[TVPABluetoothRemoteUsage remoteSerialNumber](v16, "remoteSerialNumber");
  objc_msgSend(v8, "appendString:withName:");

  id v10 = v15[0];
  id v11 = (id)TVSBluetoothRemoteTypeLogString(-[TVPABluetoothRemoteUsage remoteType](v16, "remoteType"));
  objc_msgSend(v10, "appendString:withName:");

  id v12 = v15[0];
  BOOL v13 = -[TVPABluetoothRemoteUsage batterySnapshots](v16, "batterySnapshots");
  id v2 = objc_msgSend(v12, "appendObject:withName:");

  id v14 = [v15[0] build];
  objc_storeStrong(v15, 0LL);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v43 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v41 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVPABluetoothRemoteUsage));
  uint64_t v9 = v41;
  id v10 = -[TVPABluetoothRemoteUsage identifier](v43, "identifier");
  v35[1] = _NSConcreteStackBlock;
  int v36 = -1073741824;
  int v37 = 0;
  id v38 = sub_10000F4AC;
  id v39 = &unk_100038838;
  id v40 = location[0];
  id v3 = -[BSEqualsBuilder appendString:counterpart:](v9, "appendString:counterpart:", v10);

  id v11 = v41;
  id v12 = -[TVPABluetoothRemoteUsage remoteIdentifier](v43, "remoteIdentifier");
  v30[1] = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  id v33 = sub_10000F4DC;
  id v34 = &unk_100038838;
  v35[0] = location[0];
  id v4 = -[BSEqualsBuilder appendString:counterpart:](v11, "appendString:counterpart:", v12);

  BOOL v13 = v41;
  id v14 = -[TVPABluetoothRemoteUsage remoteSerialNumber](v43, "remoteSerialNumber");
  v25[1] = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  char v28 = sub_10000F50C;
  id v29 = &unk_100038838;
  v30[0] = location[0];
  id v5 = -[BSEqualsBuilder appendString:counterpart:](v13, "appendString:counterpart:", v14);

  uint64_t v16 = v41;
  id v15 = -[TVPABluetoothRemoteUsage remoteType](v43, "remoteType");
  v20[1] = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  os_log_t v23 = sub_10000F53C;
  v24 = &unk_1000387B0;
  v25[0] = location[0];
  id v6 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v16, "appendUnsignedInteger:counterpart:", v15);
  id v17 = v41;
  id v18 = -[TVPABluetoothRemoteUsage batterySnapshots](v43, "batterySnapshots");
  v20[0] = location[0];
  id v7 = -[BSEqualsBuilder appendObject:counterpart:](v17, "appendObject:counterpart:", v18);

  unsigned __int8 v19 = -[BSEqualsBuilder isEqual](v41, "isEqual");
  objc_storeStrong(v20, 0LL);
  objc_storeStrong(v25, 0LL);
  objc_storeStrong(v30, 0LL);
  objc_storeStrong(v35, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong((id *)&v41, 0LL);
  objc_storeStrong(location, 0LL);
  return v19 & 1;
}

- (unint64_t)hash
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v4 = v7[0];
  id v5 = -[TVPABluetoothRemoteUsage identifier](v8, "identifier");
  id v2 = objc_msgSend(v4, "appendString:");

  id v6 = [v7[0] hash];
  objc_storeStrong(v7, 0LL);
  return (unint64_t)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)remoteIdentifier
{
  return self->_remoteIdentifier;
}

- (NSString)remoteSerialNumber
{
  return self->_remoteSerialNumber;
}

- (int64_t)remoteType
{
  return self->_remoteType;
}

- (void).cxx_destruct
{
}

@end