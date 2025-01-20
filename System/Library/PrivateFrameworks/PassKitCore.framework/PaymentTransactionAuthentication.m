@interface PaymentTransactionAuthentication
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 withPaymentTransactionPID:(int64_t)a4;
+ (id)createIfNotExistInDatabase:(id)a3 withPaymentTransactionPID:(int64_t)a4;
+ (id)databaseTable;
- (BOOL)addDataCollectedAuthenticationMechanisms:(unint64_t)a3;
- (BOOL)addProcessedAuthenticationMechanisms:(unint64_t)a3;
- (BOOL)reset;
- (BOOL)updateAuthenticationComplete:(BOOL)a3;
- (BOOL)updateWithPaymentPINData:(id)a3;
- (BOOL)updateWithTransactionSignatureData:(id)a3;
- (BOOL)updateWithUserConfirmationData:(id)a3;
@end

@implementation PaymentTransactionAuthentication

+ (id)databaseTable
{
  return @"payment_transaction_authentication";
}

+ (id)anyInDatabase:(id)a3 withPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForPaymentTransactionPID:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (id)createIfNotExistInDatabase:(id)a3 withPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  v7 = (PaymentTransactionAuthentication *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 withPaymentTransactionPID:a4]);
  if (!v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setLongLong:forKey:](v8, "setLongLong:forKey:", a4, @"payment_transaction_pid");
    v9 = objc_alloc(&OBJC_CLASS___PaymentTransactionAuthentication);
    id v10 = -[NSMutableDictionary copy](v8, "copy");
    v7 = -[SQLiteEntity initWithPropertyValues:inDatabase:](v9, "initWithPropertyValues:inDatabase:", v10, v6);
  }

  return v7;
}

- (BOOL)updateWithPaymentPINData:(id)a3
{
  return -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", a3, @"auth_data_payment_pin");
}

- (BOOL)updateWithTransactionSignatureData:(id)a3
{
  return -[SQLiteEntity setValue:forProperty:]( self,  "setValue:forProperty:",  a3,  @"auth_data_transaction_signature");
}

- (BOOL)updateWithUserConfirmationData:(id)a3
{
  return -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", a3, @"auth_data_user_confirmation");
}

- (BOOL)addProcessedAuthenticationMechanisms:(unint64_t)a3
{
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"processed_auth_mechanisms"));
  unint64_t v6 = (unint64_t)[v5 integerValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6 | a3));
  LOBYTE(v4) = -[SQLiteEntity setValue:forProperty:]( v4,  "setValue:forProperty:",  v7,  @"processed_auth_mechanisms");

  return (char)v4;
}

- (BOOL)addDataCollectedAuthenticationMechanisms:(unint64_t)a3
{
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"data_collected_auth_mechanisms"));
  unint64_t v6 = (unint64_t)[v5 integerValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6 | a3));
  LOBYTE(v4) = -[SQLiteEntity setValue:forProperty:]( v4,  "setValue:forProperty:",  v7,  @"data_collected_auth_mechanisms");

  return (char)v4;
}

- (BOOL)updateAuthenticationComplete:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  LOBYTE(self) = -[SQLiteEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"complete");

  return (char)self;
}

- (BOOL)reset
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  database = self->super._database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003D4AC;
  v5[3] = &unk_10063BB78;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002CCC5C((uint64_t)database, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"payment_transaction_pid",  v3));

  return v4;
}

@end