@interface INPersonHandle
- (id)tu_initUnlabledPersonHandleWithTUHandle:(id)a3 isoCountryCodes:(id)a4;
- (id)tu_normalizedHandleForISOCountryCode:(id)a3;
@end

@implementation INPersonHandle

- (id)tu_initUnlabledPersonHandleWithTUHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  if (v7 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    unsigned __int8 v10 = [v9 _appearsToBePhoneNumber];

    if ((v10 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
      LODWORD(v8) = [v15 _appearsToBeEmail];

      uint64_t v8 = v8;
      goto LABEL_7;
    }
  }

  else if (v7 != (id)2)
  {
    uint64_t v8 = v7 == (id)3;
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    goto LABEL_8;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  uint64_t v13 = TUFormattedPhoneNumber(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  uint64_t v8 = 2LL;
LABEL_8:
  v16 = -[INPersonHandle initWithValue:type:label:]( objc_alloc(&OBJC_CLASS___INPersonHandle),  "initWithValue:type:label:",  v14,  v8,  0LL);

  return v16;
}

- (id)tu_normalizedHandleForISOCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[INPersonHandle value](self, "value"));
  INPersonHandleType v6 = -[INPersonHandle type](self, "type");
  if (v6 == INPersonHandleTypePhoneNumber)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v5,  v4));
  }

  else if (v6 == INPersonHandleTypeEmailAddress)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v5));
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v5));
  }

  uint64_t v8 = (void *)v7;

  return v8;
}

@end