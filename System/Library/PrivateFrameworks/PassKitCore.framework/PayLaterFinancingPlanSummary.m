@interface PayLaterFinancingPlanSummary
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlan;
+ (id)_propertyValuesForPayLaterFinancingPlanSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanSummary)initWithPayLaterFinancingPlan:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_currentBalance;
- (id)_initialAmount;
- (id)_installmentAmount;
- (id)_interestPaidToDate;
- (id)_pastDueAmount;
- (id)_paymentAmountToDate;
- (id)_payoffAmount;
- (id)_principalPaidToDate;
- (id)_totalAdjustments;
- (id)_totalAmount;
- (id)_totalInterest;
- (id)_totalPrincipal;
- (id)planSummary;
- (void)updateWithPayLaterFinancingPlanSummary:(id)a3;
@end

@implementation PayLaterFinancingPlanSummary

+ (id)databaseTable
{
  return @"marionberry";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___PayLaterFinancingPlan, a2) == a3) {
    return @"a";
  }
  else {
    return 0LL;
  }
}

- (PayLaterFinancingPlanSummary)initWithPayLaterFinancingPlan:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_propertyValuesForPayLaterFinancingPlanSummary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
  [v13 setObjectOrNull:v14 forKey:@"a"];

  v15 = -[SQLiteEntity initWithPropertyValues:inDatabase:](self, "initWithPropertyValues:inDatabase:", v13, v8);
  return v15;
}

+ (id)insertOrUpdatePayLaterFinancingPlanSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v9 predicate:v10]);

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanSummary:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlan:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }

  return v11;
}

- (void)updateWithPayLaterFinancingPlanSummary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_propertyValuesForPayLaterFinancingPlanSummary:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[SQLiteEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v7);
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 anyInDatabase:v6 predicate:v7]);

  return v8;
}

+ (void)deletePayLaterFinancingPlanSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 _predicateForFinancingPlanPID:a3]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 queryWithDatabase:v6 predicate:v8]);

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PayLaterFinancingPlanSummary;
  return -[SQLiteEntity deleteFromDatabase](&v3, "deleteFromDatabase");
}

- (id)planSummary
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PKPayLaterFinancingPlanSummary);
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_propertySettersForPayLaterFinancingPlan");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10024509C;
  v13[3] = &unk_100638EF0;
  v13[4] = self;
  id v14 = v6;
  id v8 = v3;
  v15 = v8;
  id v9 = v6;
  -[SQLiteEntity getValuesForProperties:withApplier:](self, "getValuesForProperties:withApplier:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)_totalAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"g"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"gc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_currentBalance
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"i"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ic"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_installmentAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"y"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"yc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_totalPrincipal
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"z"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"zc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_paymentAmountToDate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"j"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"jc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_totalInterest
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"r"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"s"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_interestPaidToDate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"t"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"u"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_principalPaidToDate
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"aa"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"aac"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_payoffAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"w"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"x"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_pastDueAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"cc"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ccc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_initialAmount
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ee"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"eec"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

- (id)_totalAdjustments
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ff"));
  uint64_t v4 = PKCurrencyStorageNumberToCurrencyDecimal(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SQLiteEntity valueForProperty:](self, "valueForProperty:", @"ffc"));
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v9 = PKCurrencyAmountMake(v5, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"a",  v3));

  return v4;
}

+ (id)_propertyValuesForPayLaterFinancingPlanSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 apr]);
  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  PKPercentageDecimalToStorageInteger(v5),  @"b");

  -[NSMutableDictionary setBool:forKey:](v4, "setBool:forKey:", [v3 hasAPR], @"c");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 daysPastDue], @"dd");
  -[NSMutableDictionary setInteger:forKey:](v4, "setInteger:forKey:", [v3 installmentCount], @"q");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 amount]);
  uint64_t v8 = PKCurrencyDecimalToStorageNumber(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v9, @"g");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAmount]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v11, @"gc");

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 amount]);
  uint64_t v14 = PKCurrencyDecimalToStorageNumber(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v15, @"i");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 currentBalance]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v17, @"ic");

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentAmount]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 amount]);
  uint64_t v20 = PKCurrencyDecimalToStorageNumber(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v21, @"y");

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 installmentAmount]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v23, @"yc");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 totalPrincipal]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 amount]);
  uint64_t v26 = PKCurrencyDecimalToStorageNumber(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v27, @"z");

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 totalPrincipal]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v29, @"zc");

  v30 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentAmountToDate]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 amount]);
  uint64_t v32 = PKCurrencyDecimalToStorageNumber(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v33, @"j");

  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 paymentAmountToDate]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v35, @"jc");

  v36 = (void *)objc_claimAutoreleasedReturnValue([v3 totalInterest]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 amount]);
  uint64_t v38 = PKCurrencyDecimalToStorageNumber(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v39, @"r");

  v40 = (void *)objc_claimAutoreleasedReturnValue([v3 totalInterest]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v41, @"s");

  v42 = (void *)objc_claimAutoreleasedReturnValue([v3 interestPaidToDate]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 amount]);
  uint64_t v44 = PKCurrencyDecimalToStorageNumber(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v45, @"t");

  v46 = (void *)objc_claimAutoreleasedReturnValue([v3 interestPaidToDate]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v47, @"u");

  v48 = (void *)objc_claimAutoreleasedReturnValue([v3 principalPaidToDate]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 amount]);
  uint64_t v50 = PKCurrencyDecimalToStorageNumber(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v51, @"aa");

  v52 = (void *)objc_claimAutoreleasedReturnValue([v3 principalPaidToDate]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v52 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v53, @"aac");

  v54 = (void *)objc_claimAutoreleasedReturnValue([v3 payoffAmount]);
  v55 = (void *)objc_claimAutoreleasedReturnValue([v54 amount]);
  uint64_t v56 = PKCurrencyDecimalToStorageNumber(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v57, @"w");

  v58 = (void *)objc_claimAutoreleasedReturnValue([v3 payoffAmount]);
  v59 = (void *)objc_claimAutoreleasedReturnValue([v58 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v59, @"x");

  v60 = (void *)objc_claimAutoreleasedReturnValue([v3 pastDueAmount]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v60 amount]);
  uint64_t v62 = PKCurrencyDecimalToStorageNumber(v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v63, @"cc");

  v64 = (void *)objc_claimAutoreleasedReturnValue([v3 pastDueAmount]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v65, @"ccc");

  v66 = (void *)objc_claimAutoreleasedReturnValue([v3 transactionDate]);
  v67 = (void *)_SQLValueForDate(v66);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v67, @"m");

  v68 = (void *)objc_claimAutoreleasedReturnValue([v3 startInstallmentDate]);
  v69 = (void *)_SQLValueForDate(v68);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v69, @"n");

  v70 = (void *)objc_claimAutoreleasedReturnValue([v3 endInstallmentDate]);
  v71 = (void *)_SQLValueForDate(v70);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v71, @"o");

  v72 = (void *)objc_claimAutoreleasedReturnValue([v3 cancellationDate]);
  v73 = (void *)_SQLValueForDate(v72);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v73, @"bb");

  v74 = (void *)objc_claimAutoreleasedReturnValue([v3 nextInstallmentDueDate]);
  v75 = (void *)_SQLValueForDate(v74);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v75, @"p");

  v76 = (void *)objc_claimAutoreleasedReturnValue([v3 panSuffix]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v76, @"v");

  -[NSMutableDictionary setInteger:forKey:]( v4,  "setInteger:forKey:",  [v3 cancellationReason],  @"cr");
  v77 = (void *)objc_claimAutoreleasedReturnValue([v3 initialAmount]);
  v78 = (void *)objc_claimAutoreleasedReturnValue([v77 amount]);
  uint64_t v79 = PKCurrencyDecimalToStorageNumber(v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v80, @"ee");

  v81 = (void *)objc_claimAutoreleasedReturnValue([v3 initialAmount]);
  v82 = (void *)objc_claimAutoreleasedReturnValue([v81 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v82, @"eec");

  v83 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAdjustments]);
  v84 = (void *)objc_claimAutoreleasedReturnValue([v83 amount]);
  uint64_t v85 = PKCurrencyDecimalToStorageNumber(v84);
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v86, @"ff");

  v87 = (void *)objc_claimAutoreleasedReturnValue([v3 totalAdjustments]);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 currency]);
  -[NSMutableDictionary setObjectOrNull:forKey:](v4, "setObjectOrNull:forKey:", v88, @"ffc");

  id v89 = -[NSMutableDictionary copy](v4, "copy");
  return v89;
}

+ (id)_propertySettersForPayLaterFinancingPlan
{
  v3[0] = @"b";
  v3[1] = @"c";
  v4[0] = &stru_10064EE58;
  v4[1] = &stru_10064EE78;
  v3[2] = @"dd";
  v3[3] = @"q";
  v4[2] = &stru_10064EE98;
  v4[3] = &stru_10064EEB8;
  v3[4] = @"m";
  v3[5] = @"n";
  v4[4] = &stru_10064EED8;
  v4[5] = &stru_10064EEF8;
  v3[6] = @"p";
  v3[7] = @"o";
  v4[6] = &stru_10064EF18;
  v4[7] = &stru_10064EF38;
  v3[8] = @"bb";
  v3[9] = @"v";
  v4[8] = &stru_10064EF58;
  v4[9] = &stru_10064EF78;
  v3[10] = @"cr";
  v4[10] = &stru_10064EF98;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
}

@end