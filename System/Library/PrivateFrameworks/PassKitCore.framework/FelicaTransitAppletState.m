@interface FelicaTransitAppletState
+ (id)_predicateForPaymentApplicationPID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)felicaTransitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6;
+ (id)insertFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4;
- (FelicaTransitAppletState)initWithFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForAppletState:(id)a3;
- (id)paymentTransactionIdentifier;
- (id)transitAppletState;
- (void)setPaymentTransactionIdentifier:(id)a3;
- (void)updateWithAppletState:(id)a3;
@end

@implementation FelicaTransitAppletState

+ (id)databaseTable
{
  return @"felica_transit_applet_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 isEqualToString:@"payment_application.pid"]) {
    [v5 addObject:@"JOIN payment_application ON felica_transit_applet_state.payment_application_pid = payment_application.pid"];
  }
}

+ (id)insertFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithFelicaTransitAppletState:v9 forPaymentApplicationPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteEntitiesForPaymentApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 withPaymentApplicationPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentApplicationPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)felicaTransitAppletStateInDatabase:(id)a3 withPassUniqueIdentifier:(id)a4 secureElementIdentifier:(id)a5 paymentApplicationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"pass.unique_id",  v13));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.seid",  v12));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application.aid",  v11));

  v32[0] = v15;
  v32[1] = v16;
  v32[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteEntity queryWithDatabase:predicate:]( &OBJC_CLASS___FelicaTransitAppletState,  "queryWithDatabase:predicate:",  v10,  v19));

  v31[0] = @"payment_application.pid";
  v31[1] = @"pass.pid";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100251A38;
  v27[3] = &unk_100639BF0;
  id v30 = a1;
  id v28 = v10;
  v22 = v14;
  v29 = v22;
  id v23 = v10;
  [v20 enumeratePersistentIDsAndProperties:v21 usingBlock:v27];

  v24 = v29;
  v25 = v22;

  return v25;
}

- (FelicaTransitAppletState)initWithFelicaTransitAppletState:(id)a3 forPaymentApplicationPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[FelicaTransitAppletState _valuesDictionaryForAppletState:]( self,  "_valuesDictionaryForAppletState:",  a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  [v9 setObject:v10 forKeyedSubscript:@"payment_application_pid"];

  id v11 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v9, v8);
  return v11;
}

- (void)updateWithAppletState:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FelicaTransitAppletState _valuesDictionaryForAppletState:](self, "_valuesDictionaryForAppletState:", a3));
  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

- (id)_valuesDictionaryForAppletState:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isBlacklisted]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"blacklisted");

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 historySequenceNumber]);
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v9,  @"history_sequence_number");

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isShinkansenTicketActive]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  @"shinkansen_ticket_active");

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isBalanceAllowedForCommute]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v11,  @"balance_allowed_for_commute");

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isLowBalanceNotificationEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v12,  @"low_balance_notification_enabled");

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isGreenCarTicketUsed]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v13,  @"green_car_ticket_used");

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 balance]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 balance]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v15 unsignedLongLongValue]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, @"balance");
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, @"balance");
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v3 shinkansenValidityStartDate]);
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v19,  @"shinkansen_validity_start_date");

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v3 shinkansenValidityTerm]);
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v22,  @"shinkansen_validity_term");

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v3 shinkansenOriginStationCode]);
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v25,  @"shinkansen_origin_station_code");

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v3 shinkansenDestinationStationCode]);
  v27 = (void *)v26;
  if (v26) {
    id v28 = (void *)v26;
  }
  else {
    id v28 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v28,  @"shinkansen_destination_station_code");

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v3 shinkansenOriginStationString]);
  id v30 = (void *)v29;
  if (v29) {
    v31 = (void *)v29;
  }
  else {
    v31 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v31,  @"shinkansen_origin_station_string");

  uint64_t v32 = objc_claimAutoreleasedReturnValue([v3 shinkansenDestinationStationString]);
  v33 = (void *)v32;
  if (v32) {
    v34 = (void *)v32;
  }
  else {
    v34 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v34,  @"shinkansen_destination_station_string");

  uint64_t v35 = objc_claimAutoreleasedReturnValue([v3 shinkansenDepartureTime]);
  v36 = (void *)v35;
  if (v35) {
    v37 = (void *)v35;
  }
  else {
    v37 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v37,  @"shinkansen_departure_time");

  uint64_t v38 = objc_claimAutoreleasedReturnValue([v3 shinkansenArrivalTime]);
  v39 = (void *)v38;
  if (v38) {
    v40 = (void *)v38;
  }
  else {
    v40 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v40,  @"shinkansen_arrival_time");

  uint64_t v41 = objc_claimAutoreleasedReturnValue([v3 shinkansenTrainName]);
  v42 = (void *)v41;
  if (v41) {
    v43 = (void *)v41;
  }
  else {
    v43 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v43,  @"shinkansen_train_name");

  uint64_t v44 = objc_claimAutoreleasedReturnValue([v3 shinkansenCarNumber]);
  v45 = (void *)v44;
  if (v44) {
    v46 = (void *)v44;
  }
  else {
    v46 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v46,  @"shinkansen_car_number");

  uint64_t v47 = objc_claimAutoreleasedReturnValue([v3 shinkansenSeatRow]);
  v48 = (void *)v47;
  if (v47) {
    v49 = (void *)v47;
  }
  else {
    v49 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v49,  @"shinkansen_seat_row");

  uint64_t v50 = objc_claimAutoreleasedReturnValue([v3 shinkansenSeatNumber]);
  v51 = (void *)v50;
  if (v50) {
    v52 = (void *)v50;
  }
  else {
    v52 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v52,  @"shinkansen_seat_number");

  uint64_t v53 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryOriginStationCode]);
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v55,  @"shinkansen_secondary_origin_station_code");

  uint64_t v56 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryDestinationStationCode]);
  v57 = (void *)v56;
  if (v56) {
    v58 = (void *)v56;
  }
  else {
    v58 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v58,  @"shinkansen_secondary_destination_station_code");

  uint64_t v59 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryOriginStationString]);
  v60 = (void *)v59;
  if (v59) {
    v61 = (void *)v59;
  }
  else {
    v61 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v61,  @"shinkansen_secondary_origin_station_string");

  uint64_t v62 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryDestinationStationString]);
  v63 = (void *)v62;
  if (v62) {
    v64 = (void *)v62;
  }
  else {
    v64 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v64,  @"shinkansen_secondary_destination_station_string");

  uint64_t v65 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryDepartureTime]);
  v66 = (void *)v65;
  if (v65) {
    v67 = (void *)v65;
  }
  else {
    v67 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v67,  @"shinkansen_secondary_departure_time");

  uint64_t v68 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryArrivalTime]);
  v69 = (void *)v68;
  if (v68) {
    v70 = (void *)v68;
  }
  else {
    v70 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v70,  @"shinkansen_secondary_arrival_time");

  uint64_t v71 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryTrainName]);
  v72 = (void *)v71;
  if (v71) {
    v73 = (void *)v71;
  }
  else {
    v73 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v73,  @"shinkansen_secondary_train_name");

  uint64_t v74 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondaryCarNumber]);
  v75 = (void *)v74;
  if (v74) {
    v76 = (void *)v74;
  }
  else {
    v76 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v76,  @"shinkansen_secondary_car_number");

  uint64_t v77 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondarySeatRow]);
  v78 = (void *)v77;
  if (v77) {
    v79 = (void *)v77;
  }
  else {
    v79 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v79,  @"shinkansen_secondary_seat_row");

  uint64_t v80 = objc_claimAutoreleasedReturnValue([v3 shinkansenSecondarySeatNumber]);
  v81 = (void *)v80;
  if (v80) {
    v82 = (void *)v80;
  }
  else {
    v82 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v82,  @"shinkansen_secondary_seat_number");

  uint64_t v83 = objc_claimAutoreleasedReturnValue([v3 greenCarOriginStationCode]);
  v84 = (void *)v83;
  if (v83) {
    v85 = (void *)v83;
  }
  else {
    v85 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v85,  @"green_car_origin_station_code");

  uint64_t v86 = objc_claimAutoreleasedReturnValue([v3 greenCarDestinationStationCode]);
  v87 = (void *)v86;
  if (v86) {
    v88 = (void *)v86;
  }
  else {
    v88 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v88,  @"green_car_destination_station_code");

  uint64_t v89 = objc_claimAutoreleasedReturnValue([v3 greenCarOriginStationString]);
  v90 = (void *)v89;
  if (v89) {
    v91 = (void *)v89;
  }
  else {
    v91 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v91,  @"green_car_origin_station_string");

  uint64_t v92 = objc_claimAutoreleasedReturnValue([v3 greenCarDestinationStationString]);
  v93 = (void *)v92;
  if (v92) {
    v94 = (void *)v92;
  }
  else {
    v94 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v94,  @"green_car_destination_station_string");

  uint64_t v95 = objc_claimAutoreleasedReturnValue([v3 greenCarValidityStartDate]);
  v96 = (void *)v95;
  if (v95) {
    v97 = (void *)v95;
  }
  else {
    v97 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v97,  @"green_car_validity_start_date");

  v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 hasGreenCarTicket]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v98,  @"has_green_car_ticket");

  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 hasShinkansenTicket]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v99,  @"has_shinkansen_ticket");

  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 needsStationProcessing]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v100,  @"needs_station_processing");

  v101 = (void *)objc_claimAutoreleasedReturnValue([v3 enrouteTransitTypes]);
  if (v101) {
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v101,  1LL,  0LL));
  }
  else {
    v102 = 0LL;
  }
  if (v102) {
    v103 = v102;
  }
  else {
    v103 = v5;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v103, @"en_route_flags");

  return v4;
}

+ (id)_predicateForPaymentApplicationPID:(int64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_application_pid",  v3));

  return v4;
}

- (id)paymentTransactionIdentifier
{
  return -[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"payment_transaction_identifier");
}

- (void)setPaymentTransactionIdentifier:(id)a3
{
  if (a3)
  {
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", a3, @"payment_transaction_identifier");
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"payment_transaction_identifier");
  }

+ (id)_propertySetters
{
  v3[0] = @"shinkansen_ticket_active";
  v3[1] = @"balance_allowed_for_commute";
  v4[0] = &stru_10064F748;
  v4[1] = &stru_10064F768;
  v3[2] = @"low_balance_notification_enabled";
  v3[3] = @"green_car_ticket_used";
  v4[2] = &stru_10064F788;
  v4[3] = &stru_10064F7A8;
  v3[4] = @"history_sequence_number";
  v3[5] = @"balance";
  v4[4] = &stru_10064F7C8;
  v4[5] = &stru_10064F7E8;
  v3[6] = @"blacklisted";
  v3[7] = @"shinkansen_validity_start_date";
  v4[6] = &stru_10064F808;
  v4[7] = &stru_10064F828;
  v3[8] = @"shinkansen_validity_term";
  v3[9] = @"shinkansen_origin_station_code";
  v4[8] = &stru_10064F848;
  v4[9] = &stru_10064F868;
  v3[10] = @"shinkansen_origin_station_string";
  v3[11] = @"shinkansen_destination_station_code";
  v4[10] = &stru_10064F888;
  v4[11] = &stru_10064F8A8;
  v3[12] = @"shinkansen_destination_station_string";
  v3[13] = @"shinkansen_departure_time";
  v4[12] = &stru_10064F8C8;
  v4[13] = &stru_10064F8E8;
  v3[14] = @"shinkansen_arrival_time";
  v3[15] = @"shinkansen_train_name";
  v4[14] = &stru_10064F908;
  v4[15] = &stru_10064F928;
  v3[16] = @"shinkansen_car_number";
  v3[17] = @"shinkansen_seat_row";
  v4[16] = &stru_10064F948;
  v4[17] = &stru_10064F968;
  v3[18] = @"shinkansen_seat_number";
  v3[19] = @"shinkansen_secondary_origin_station_code";
  v4[18] = &stru_10064F988;
  v4[19] = &stru_10064F9A8;
  v3[20] = @"shinkansen_secondary_origin_station_string";
  v3[21] = @"shinkansen_secondary_destination_station_code";
  v4[20] = &stru_10064F9C8;
  v4[21] = &stru_10064F9E8;
  v3[22] = @"shinkansen_secondary_destination_station_string";
  v3[23] = @"shinkansen_secondary_departure_time";
  v4[22] = &stru_10064FA08;
  v4[23] = &stru_10064FA28;
  v3[24] = @"shinkansen_secondary_arrival_time";
  v3[25] = @"shinkansen_secondary_train_name";
  v4[24] = &stru_10064FA48;
  v4[25] = &stru_10064FA68;
  v3[26] = @"shinkansen_secondary_car_number";
  v3[27] = @"shinkansen_secondary_seat_row";
  v4[26] = &stru_10064FA88;
  v4[27] = &stru_10064FAA8;
  v3[28] = @"shinkansen_secondary_seat_number";
  v3[29] = @"green_car_origin_station_code";
  v4[28] = &stru_10064FAC8;
  v4[29] = &stru_10064FAE8;
  v3[30] = @"green_car_destination_station_code";
  v3[31] = @"green_car_origin_station_string";
  v4[30] = &stru_10064FB08;
  v4[31] = &stru_10064FB28;
  v3[32] = @"green_car_destination_station_string";
  v3[33] = @"green_car_validity_start_date";
  v4[32] = &stru_10064FB48;
  v4[33] = &stru_10064FB68;
  v3[34] = @"has_green_car_ticket";
  v3[35] = @"has_shinkansen_ticket";
  v4[34] = &stru_10064FB88;
  v4[35] = &stru_10064FBA8;
  v3[36] = @"needs_station_processing";
  v3[37] = @"en_route_flags";
  v4[36] = &stru_10064FBC8;
  v4[37] = &stru_10064FBE8;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  38LL));
}

- (id)transitAppletState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PKFelicaTransitAppletState);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[FelicaTransitAppletState _propertySetters]( &OBJC_CLASS___FelicaTransitAppletState,  "_propertySetters"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100252CD8;
  v11[3] = &unk_100639EE8;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

@end