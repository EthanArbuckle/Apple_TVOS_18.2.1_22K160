@interface SharingChannelEndpoint
+ (BOOL)deleteEndpoint:(id)a3 inDatabase:(id)a4;
+ (BOOL)deleteEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (BOOL)insert:(id)a3 inDatabase:(id)a4;
+ (id)_endpointForProperties:(id)a3 values:(const void *)a4;
+ (id)_predicateForHasOutstandingMessages;
+ (id)_predicateForSharingTransportIdentifier:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_properties;
+ (id)_propertySettersForIDSChannelEndpoint;
+ (id)_propertySettersForLocalOnDeviceChannelEndpoint;
+ (id)_propertySettersForRelayChannelEndpoint;
+ (id)databaseTable;
+ (id)endpointsInDatabase:(id)a3;
+ (id)endpointsInDatabase:(id)a3 ofType:(unint64_t)a4;
+ (id)endpointsWithOutstandingMessagesInDatabase:(id)a3;
+ (id)sharingEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (SharingChannelEndpoint)initWithSharingChannelEndpoint:(id)a3 inDatabase:(id)a4;
- (id)idsChannelEndpoint;
- (id)localOnDeviceChannelEndpoint;
- (id)relayChannelEndpoint;
@end

@implementation SharingChannelEndpoint

- (SharingChannelEndpoint)initWithSharingChannelEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100295514;
  v22 = sub_100295524;
  id v23 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10029552C;
  v13[3] = &unk_100645680;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  v17 = &v18;
  v10 = self;
  v16 = v10;
  sub_1002CCC5C((uint64_t)v9, v13);
  v11 = (SharingChannelEndpoint *)(id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)databaseTable
{
  return @"jabuticaba";
}

- (BOOL)deleteFromDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingChannelEndpoint relayChannelEndpoint](self, "relayChannelEndpoint"));
  [v3 deleteFromDatabase];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingChannelEndpoint idsChannelEndpoint](self, "idsChannelEndpoint"));
  [v4 deleteFromDatabase];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharingChannelEndpoint localOnDeviceChannelEndpoint](self, "localOnDeviceChannelEndpoint"));
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SharingChannelEndpoint;
  return -[SQLiteEntity deleteFromDatabase](&v7, "deleteFromDatabase");
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"mangosteen.ra"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rb"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rc"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rd"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rf"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rg"] & 1) != 0
    || ([v6 isEqualToString:@"mangosteen.rh"] & 1) != 0
    || [v6 isEqualToString:@"mangosteen.ri"])
  {
    [v5 addObject:@"LEFT JOIN mangosteen ON jabuticaba.a = mangosteen.pid"];
  }

  if (([v6 isEqualToString:@"breakfast_burrito.ia"] & 1) != 0
    || ([v6 isEqualToString:@"breakfast_burrito.ib"] & 1) != 0
    || [v6 isEqualToString:@"breakfast_burrito.ic"])
  {
    [v5 addObject:@"LEFT JOIN breakfast_burrito ON jabuticaba.a = breakfast_burrito.pid"];
  }

  if (([v6 isEqualToString:@"green_eggs_ham.la"] & 1) != 0
    || [v6 isEqualToString:@"green_eggs_ham.lb"])
  {
    [v5 addObject:@"LEFT JOIN green_eggs_ham ON jabuticaba.a = green_eggs_ham.pid"];
  }
}

+ (BOOL)insert:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 deleteEndpoint:v7 inDatabase:v6];
  id v8 = -[SharingChannelEndpoint initWithSharingChannelEndpoint:inDatabase:]( objc_alloc(&OBJC_CLASS___SharingChannelEndpoint),  "initWithSharingChannelEndpoint:inDatabase:",  v7,  v6);

  return v8 != 0LL;
}

+ (id)sharingEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SharingChannelEndpoint _predicateForSharingTransportIdentifier:]( &OBJC_CLASS___SharingChannelEndpoint,  "_predicateForSharingTransportIdentifier:",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___SharingChannelEndpoint,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v7,  v8,  0LL,  0LL,  1LL));

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_100295514;
  uint64_t v18 = sub_100295524;
  id v19 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100295AF4;
  v13[3] = &unk_100651DB0;
  void v13[4] = &v14;
  v13[5] = a1;
  [v9 enumerateProperties:v10 usingBlock:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

+ (id)endpointsInDatabase:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___SharingChannelEndpoint,  "queryWithDatabase:predicate:",  a3,  0LL));
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100295C20;
  uint64_t v14 = &unk_100651DD8;
  id v15 = v5;
  id v16 = a1;
  id v7 = v5;
  [v4 enumerateProperties:v6 usingBlock:&v11];

  if (-[NSMutableArray count](v7, "count", v11, v12, v13, v14)) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

+ (id)endpointsInDatabase:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForType:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___SharingChannelEndpoint,  "queryWithDatabase:predicate:",  v6,  v7));

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100295D7C;
  uint64_t v18 = &unk_100651DD8;
  id v19 = v9;
  id v20 = a1;
  id v11 = v9;
  [v8 enumerateProperties:v10 usingBlock:&v15];

  if (-[NSMutableArray count](v11, "count", v15, v16, v17, v18)) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0LL;
  }
  v13 = v12;

  return v13;
}

+ (id)endpointsWithOutstandingMessagesInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForHasOutstandingMessages]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___SharingChannelEndpoint,  "queryWithDatabase:predicate:",  v4,  v5));

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _properties]);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100295EC8;
  uint64_t v16 = &unk_100651DD8;
  v17 = v7;
  id v18 = a1;
  id v9 = v7;
  [v6 enumerateProperties:v8 usingBlock:&v13];

  if (-[NSMutableArray count](v9, "count", v13, v14, v15, v16)) {
    v10 = v9;
  }
  else {
    v10 = 0LL;
  }
  id v11 = v10;

  return v11;
}

+ (id)_endpointForProperties:(id)a3 values:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100295FF4((void *)a4[2]);
  switch(v7)
  {
    case 3LL:
      id v8 = objc_alloc_init(&OBJC_CLASS___PDSharingLocalOnDeviceEndpoint);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _propertySettersForLocalOnDeviceChannelEndpoint]);
      break;
    case 2LL:
      id v8 = objc_alloc_init(&OBJC_CLASS___PDSharingIDSEndpoint);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _propertySettersForIDSChannelEndpoint]);
      break;
    case 1LL:
      id v8 = objc_alloc_init(&OBJC_CLASS___PDSharingRelayServerEndpoint);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([a1 _propertySettersForRelayChannelEndpoint]);
      break;
    default:
      id v8 = 0LL;
      goto LABEL_9;
  }

  v10 = (void *)v9;
  [a1 applyPropertySetters:v9 toObject:v8 withProperties:v6 values:a4];

LABEL_9:
  return v8;
}

+ (BOOL)deleteEndpoint:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 transportIdentifier]);
  LOBYTE(a1) = [a1 deleteEndpointForTransportIdentifier:v7 inDatabase:v6];

  return (char)a1;
}

+ (BOOL)deleteEndpointForTransportIdentifier:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SharingChannelEndpoint _predicateForSharingTransportIdentifier:]( &OBJC_CLASS___SharingChannelEndpoint,  "_predicateForSharingTransportIdentifier:",  v5));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:]( &OBJC_CLASS___SharingChannelEndpoint,  "queryWithDatabase:predicate:orderingProperties:orderingDirections:limit:",  v6,  v7,  0LL,  0LL,  1LL));

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10029625C;
  v11[3] = &unk_100651E00;
  id v9 = v6;
  id v12 = v9;
  v13 = &v14;
  [v8 enumeratePersistentIDsUsingBlock:v11];
  LOBYTE(v7) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

- (id)relayChannelEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v4 = sub_100295FF4(v3);

  if (v4 == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [SharingRelayChannelEndpoint alloc],  "initWithPersistentID:inDatabase:",  [v5 longLongValue],  self->super._database);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)idsChannelEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v4 = sub_100295FF4(v3);

  if (v4 == 2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [SharingIDSChannelEndpoint alloc],  "initWithPersistentID:inDatabase:",  [v5 longLongValue],  self->super._database);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)localOnDeviceChannelEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"b"));
  uint64_t v4 = sub_100295FF4(v3);

  if (v4 == 3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"a"));
    if (v5) {
      id v6 = -[SQLiteEntity initWithPersistentID:inDatabase:]( [SharingLocalOnDeviceChannelEndpoint alloc],  "initWithPersistentID:inDatabase:",  [v5 longLongValue],  self->super._database);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)_predicateForSharingTransportIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"identifier",  a3);
}

+ (id)_predicateForType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    v3 = @"unknown";
  }
  else {
    v3 = *(&off_100652200 + a3 - 1);
  }
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"b",  v3);
}

+ (id)_predicateForHasOutstandingMessages
{
  return +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"mangosteen.rd",  &__kCFBooleanTrue);
}

+ (id)_properties
{
  v3[0] = @"a";
  v3[1] = @"identifier";
  v3[2] = @"b";
  v3[3] = @"c";
  v3[4] = @"d";
  v3[5] = @"e";
  v3[6] = @"mangosteen.ra";
  v3[7] = @"mangosteen.rb";
  v3[8] = @"mangosteen.rc";
  v3[9] = @"mangosteen.rd";
  v3[10] = @"mangosteen.rf";
  v3[11] = @"mangosteen.rg";
  v3[12] = @"mangosteen.rh";
  v3[13] = @"mangosteen.ri";
  v3[14] = @"breakfast_burrito.ia";
  v3[15] = @"breakfast_burrito.ib";
  v3[16] = @"breakfast_burrito.ic";
  v3[17] = @"green_eggs_ham.la";
  v3[18] = @"green_eggs_ham.lb";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  19LL));
}

+ (id)_propertySettersForRelayChannelEndpoint
{
  v3[0] = @"identifier";
  v3[1] = @"b";
  v4[0] = &stru_100651E40;
  v4[1] = &stru_100651E60;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100651E80;
  v4[3] = &stru_100651EA0;
  v3[4] = @"e";
  v3[5] = @"mangosteen.ra";
  v4[4] = &stru_100651EC0;
  v4[5] = &stru_100651EE0;
  v3[6] = @"mangosteen.rb";
  v3[7] = @"mangosteen.rc";
  v4[6] = &stru_100651F00;
  v4[7] = &stru_100651F20;
  v3[8] = @"mangosteen.rd";
  v3[9] = @"mangosteen.rf";
  v4[8] = &stru_100651F40;
  v4[9] = &stru_100651F60;
  v3[10] = @"mangosteen.rg";
  v3[11] = @"mangosteen.rh";
  v4[10] = &stru_100651F80;
  v4[11] = &stru_100651FA0;
  v3[12] = @"mangosteen.ri";
  v4[12] = &stru_100651FC0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  13LL));
}

+ (id)_propertySettersForIDSChannelEndpoint
{
  v3[0] = @"identifier";
  v3[1] = @"b";
  v4[0] = &stru_100652000;
  v4[1] = &stru_100652020;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100652040;
  v4[3] = &stru_100652060;
  v3[4] = @"e";
  v3[5] = @"breakfast_burrito.ia";
  v4[4] = &stru_100652080;
  v4[5] = &stru_1006520A0;
  v3[6] = @"breakfast_burrito.ib";
  v3[7] = @"breakfast_burrito.ic";
  v4[6] = &stru_1006520C0;
  v4[7] = &stru_1006520E0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
}

+ (id)_propertySettersForLocalOnDeviceChannelEndpoint
{
  v3[0] = @"identifier";
  v3[1] = @"b";
  v4[0] = &stru_100652120;
  v4[1] = &stru_100652140;
  v3[2] = @"c";
  v3[3] = @"d";
  v4[2] = &stru_100652160;
  v4[3] = &stru_100652180;
  v3[4] = @"e";
  v3[5] = @"green_eggs_ham.la";
  v4[4] = &stru_1006521A0;
  v4[5] = &stru_1006521C0;
  v3[6] = @"green_eggs_ham.lb";
  v4[6] = &stru_1006521E0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

@end