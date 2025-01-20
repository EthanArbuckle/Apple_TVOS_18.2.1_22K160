@interface NSUnitFormatter
+ (BOOL)supportsSecureCoding;
- (NSLocale)locale;
- (NSNumberFormatter)numberFormatter;
- (NSUnitFormatter)init;
- (NSUnitFormatter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForValue1:(double)a3 unit1:(unint64_t)a4 value2:(double)a5 unit2:(unint64_t)a6;
- (id)stringForValue:(double)a3 unit:(unint64_t)a4;
- (id)stringFromUnit:(id)a3;
- (id)unitStringFromValue:(double)a3 unit:(unint64_t)a4;
- (int)_determineUnitsToFormat:(int *)a3 fromMeasurement:(id)a4;
- (int64_t)unitStyle;
- (unint64_t)unitOptions;
- (void)checkIfModified;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setUnitOptions:(unint64_t)a3;
- (void)setUnitStyle:(int64_t)a3;
@end

@implementation NSUnitFormatter

- (NSUnitFormatter)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUnitFormatter;
  result = -[NSUnitFormatter init](&v3, sel_init);
  if (result)
  {
    result->_unitStyle = 2LL;
    result->_unitOptions = 0LL;
    result->_modified = 0;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  -[NSUnitFormatter setNumberFormatter:](self, "setNumberFormatter:", 0LL);
  if (self->_formatter) {
    uameasfmt_close();
  }
  if (self->_prules) {
    uplrules_close();
  }
  locale = self->_locale;
  if (locale) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSUnitFormatter;
  -[NSUnitFormatter dealloc](&v4, sel_dealloc);
}

- (void)setNumberFormatter:(id)a3
{
  numberFormatter = self->_numberFormatter;
  if (numberFormatter != a3)
  {
    -[NSNumberFormatter clearPropertyBit](numberFormatter, "clearPropertyBit");

    v6 = (NSNumberFormatter *)[a3 copyWithZone:0];
    self->_numberFormatter = v6;
    -[NSNumberFormatter setPropertyBit](v6, "setPropertyBit");
    self->_modified = 1;
  }

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    self->_numberFormatter = v4;
    -[NSNumberFormatter setNumberStyle:](v4, "setNumberStyle:", 1LL);
    -[NSNumberFormatter setPropertyBit](self->_numberFormatter, "setPropertyBit");
    -[NSNumberFormatter setLocale:](self->_numberFormatter, "setLocale:", self->_locale);
    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (void)setUnitOptions:(unint64_t)a3
{
  if (self->_unitOptions != a3)
  {
    self->_unitOptions = a3;
    self->_modified = 1;
  }

- (unint64_t)unitOptions
{
  return self->_unitOptions;
}

- (void)setUnitStyle:(int64_t)a3
{
  if (self->_unitStyle != a3)
  {
    self->_unitStyle = a3;
    self->_modified = 1;
  }

- (int64_t)unitStyle
{
  return self->_unitStyle;
}

- (void)setLocale:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x189603F90] currentLocale];
  }
  if ((-[NSLocale isEqual:](self->_locale, "isEqual:", v3) & 1) == 0)
  {
    locale = self->_locale;
    self->_locale = (NSLocale *)v3;

    -[NSUnitFormatter setNumberFormatter:](self, "setNumberFormatter:", 0LL);
    self->_modified = 1;
  }

- (NSLocale)locale
{
  locale = self->_locale;
  if (!locale)
  {
    locale = (NSLocale *)[MEMORY[0x189603F90] currentLocale];
    self->_locale = locale;
  }

  return locale;
}

- (int)_determineUnitsToFormat:(int *)a3 fromMeasurement:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t unitOptions = self->_unitOptions;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "unit"), "specifier");
  uint64_t v9 = [MEMORY[0x189603F90] _preferredTemperatureUnit];
  if ((unint64_t)(v8 - 2560) > 2)
  {
    if ((unitOptions & 1) != 0) {
      goto LABEL_38;
    }
  }

  else
  {
    unint64_t v10 = self->_unitOptions;
    if (v10 & 4 | unitOptions & 1)
    {
      if ((v10 & 4) != 0)
      {
        int v11 = 2563;
LABEL_25:
        *a3 = v11;
        return 1;
      }

- (void)checkIfModified
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (self->_modified
    || -[NSNumberFormatter checkModify](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "checkModify")
    || !self->_formatter)
  {
    if (self->_formatter) {
      uameasfmt_close();
    }
    id v3 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
    if (!-[NSNumberFormatter getFormatter](v3, "getFormatter")
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = 0LL;
      _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** [nf getFormatter] failed in NSUnitFormatter: %p",  buf,  0xCu);
    }

    uint64_t v4 = unum_clone();
    if (!v4 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      v23 = v5;
      __int16 v24 = 2048;
      uint64_t v25 = v4;
      _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** unum_clone() failed in NSUnitFormatter: %s, icuNF: %p",  buf,  0x16u);
    }

    -[NSString getCString:maxLength:encoding:]( -[NSLocale localeIdentifier](-[NSNumberFormatter locale](v3, "locale"), "localeIdentifier"),  "getCString:maxLength:encoding:",  buf,  100LL,  4LL);
    int64_t unitStyle = self->_unitStyle;
    if (unitStyle == 2) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    if (unitStyle == 3) {
      int v8 = 0;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = (UAMeasureFormat *)uameasfmt_open();
    self->_formatter = v9;
    if (!v9 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = u_errorName(U_ZERO_ERROR);
      formatter = self->_formatter;
      *(_DWORD *)v12 = 136316162;
      v13 = v10;
      __int16 v14 = 2048;
      int v15 = formatter;
      __int16 v16 = 2080;
      v17 = buf;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v4;
      _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** uameasfmt_open() failed in NSUnitFormatter: %s, _formatter: %p, localeID: %s, width: %u, icuNF: %p",  v12,  0x30u);
    }

    self->_modified = 0;
    -[NSNumberFormatter resetCheckModify]( -[NSUnitFormatter numberFormatter](self, "numberFormatter"),  "resetCheckModify");
  }

- (id)stringForObjectValue:(id)a3
{
  v32[92] = *MEMORY[0x1895F89C0];
  [a3 doubleValue];
  double v6 = v5;
  int v7 = (void *)[a3 unit];
  if (_unitHasSpecifierAndIsDimensional(v7))
  {
    *(void *)&__int128 v8 = -1LL;
    *((void *)&v8 + 1) = -1LL;
    v30[0] = v8;
    v30[1] = v8;
    if (-[NSUnitFormatter _determineUnitsToFormat:fromMeasurement:]( self,  "_determineUnitsToFormat:fromMeasurement:",  v30,  a3) != 1)
    {
      v17 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
      [a3 doubleValue];
      return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ %@",  -[NSNumberFormatter stringFromNumber:]( v17,  "stringFromNumber:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")),  objc_msgSend((id)objc_msgSend(a3, "unit"), "symbol"));
    }

    uint64_t v9 = LODWORD(v30[0]);
    if (LODWORD(v30[0]) != -1)
    {
      if (LODWORD(v30[0]) == 2563)
      {
        uint64_t v10 = [v7 specifier];
        if ((self->_unitOptions & 1) == 0)
        {
          uint64_t v11 = v10;
          uint64_t v12 = [MEMORY[0x189603F90] _preferredTemperatureUnit];
          if (v11 == 2561 && v12 == *MEMORY[0x189603B18])
          {
            unsigned int v13 = 2560;
          }

          else
          {
            if (v11 != 2560 || v12 != *MEMORY[0x189603B20]) {
              return -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", 2563LL, v6);
            }
            unsigned int v13 = 2561;
          }

          objc_msgSend( (id)objc_msgSend(a3, "measurementByConvertingToUnit:", getDimensionUnitFromUnitSpecifier(v13)),  "doubleValue");
          double v6 = v25;
        }

        return -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", 2563LL, v6);
      }

      __int16 v20 = -[NSMeasurement initWithDoubleValue:unit:]( objc_alloc(&OBJC_CLASS___NSMeasurement),  "initWithDoubleValue:unit:",  v7,  v6);
      unint64_t unitOptions = self->_unitOptions;
      uint64_t v22 = v20;
      if (getDimensionUnitFromUnitSpecifier(v9)) {
        uint64_t v22 = -[NSMeasurement measurementByConvertingToUnit:](v20, "measurementByConvertingToUnit:");
      }
      if ((unitOptions & 2) != 0)
      {
        v31[0] = &off_189D0E2A0;
        v31[1] = &off_189D0E2D0;
        v32[0] = &off_189D0E2B8;
        v32[1] = &off_189D0E2B8;
        v31[2] = &off_189D0E2E8;
        v31[3] = &off_189D0E300;
        v32[2] = &off_189D0E2B8;
        v32[3] = &off_189D0E318;
        v31[4] = &off_189D0E330;
        v31[5] = &off_189D0E348;
        v32[4] = &off_189D0E318;
        v32[5] = &off_189D0E318;
        v31[6] = &off_189D0E360;
        v31[7] = &off_189D0E378;
        v32[6] = &off_189D0E2B8;
        v32[7] = &off_189D0E318;
        v31[8] = &off_189D0E390;
        v31[9] = &off_189D0E3A8;
        v32[8] = &off_189D0E318;
        v32[9] = &off_189D0E2B8;
        v31[10] = &off_189D0E3C0;
        v31[11] = &off_189D0E3D8;
        v32[10] = &off_189D0E2B8;
        v32[11] = &off_189D0E2B8;
        v31[12] = &off_189D0E3F0;
        v31[13] = &off_189D0E408;
        v32[12] = &off_189D0E2B8;
        v32[13] = &off_189D0E2B8;
        v31[14] = &off_189D0E420;
        v31[15] = &off_189D0E438;
        v32[14] = &off_189D0E2B8;
        v32[15] = &off_189D0E2B8;
        v31[16] = &off_189D0E450;
        v31[17] = &off_189D0E468;
        v32[16] = &off_189D0E2B8;
        v32[17] = &off_189D0E318;
        v31[18] = &off_189D0E480;
        v31[19] = &off_189D0E498;
        v32[18] = &off_189D0E318;
        v32[19] = &off_189D0E318;
        v31[20] = &off_189D0E4B0;
        v31[21] = &off_189D0E4C8;
        v32[20] = &off_189D0E318;
        v32[21] = &off_189D0E318;
        v31[22] = &off_189D0E4E0;
        v31[23] = &off_189D0E4F8;
        v32[22] = &off_189D0E318;
        v32[23] = &off_189D0E318;
        v31[24] = &off_189D0E510;
        v31[25] = &off_189D0E528;
        v32[24] = &off_189D0E2B8;
        v32[25] = &off_189D0E2B8;
        v31[26] = &off_189D0E540;
        v31[27] = &off_189D0E558;
        v32[26] = &off_189D0E318;
        v32[27] = &off_189D0E318;
        v31[28] = &off_189D0E570;
        v31[29] = &off_189D0E5A0;
        v32[28] = &off_189D0E588;
        v32[29] = &off_189D0E2B8;
        v31[30] = &off_189D0E5B8;
        v31[31] = &off_189D0E5D0;
        v32[30] = &off_189D0E2B8;
        v32[31] = &off_189D0E2B8;
        v31[32] = &off_189D0E5E8;
        v31[33] = &off_189D0E600;
        v32[32] = &off_189D0E318;
        v32[33] = &off_189D0E2B8;
        v31[34] = &off_189D0E618;
        v31[35] = &off_189D0E630;
        v32[34] = &off_189D0E588;
        v32[35] = &off_189D0E2B8;
        v31[36] = &off_189D0E648;
        v31[37] = &off_189D0E660;
        v32[36] = &off_189D0E2B8;
        v32[37] = &off_189D0E318;
        v31[38] = &off_189D0E678;
        v31[39] = &off_189D0E690;
        v32[38] = &off_189D0E2B8;
        v32[39] = &off_189D0E2B8;
        v31[40] = &off_189D0E6A8;
        v31[41] = &off_189D0E6C0;
        v32[40] = &off_189D0E2B8;
        v32[41] = &off_189D0E2B8;
        v31[42] = &off_189D0E6D8;
        v31[43] = &off_189D0E6F0;
        v32[42] = &off_189D0E2B8;
        v32[43] = &off_189D0E318;
        v31[44] = &off_189D0E708;
        v31[45] = &off_189D0E720;
        v32[44] = &off_189D0E2B8;
        v32[45] = &off_189D0E2B8;
        v31[46] = &off_189D0E738;
        v31[47] = &off_189D0E750;
        v32[46] = &off_189D0E2B8;
        v32[47] = &off_189D0E318;
        v31[48] = &off_189D0E768;
        v31[49] = &off_189D0E780;
        v32[48] = &off_189D0E2B8;
        v32[49] = &off_189D0E2B8;
        v31[50] = &off_189D0E798;
        v31[51] = &off_189D0E7B0;
        v32[50] = &off_189D0E318;
        v32[51] = &off_189D0E2B8;
        v31[52] = &off_189D0E7C8;
        v31[53] = &off_189D0E7E0;
        v32[52] = &off_189D0E2B8;
        v32[53] = &off_189D0E2B8;
        v31[54] = &off_189D0E7F8;
        v31[55] = &off_189D0E810;
        v32[54] = &off_189D0E2B8;
        v32[55] = &off_189D0E2B8;
        v31[56] = &off_189D0E828;
        v31[57] = &off_189D0E840;
        v32[56] = &off_189D0E2B8;
        v32[57] = &off_189D0E2B8;
        v31[58] = &off_189D0E858;
        v31[59] = &off_189D0E870;
        v32[58] = &off_189D0E2B8;
        v32[59] = &off_189D0E2B8;
        v31[60] = &off_189D0E888;
        v31[61] = &off_189D0E8A0;
        v32[60] = &off_189D0E2B8;
        v32[61] = &off_189D0E318;
        v31[62] = &off_189D0E8B8;
        v31[63] = &off_189D0E8D0;
        v32[62] = &off_189D0E318;
        v32[63] = &off_189D0E318;
        v31[64] = &off_189D0E8E8;
        v32[64] = &off_189D0E318;
        v31[65] = &off_189D0E900;
        v32[65] = &off_189D0E318;
        v31[66] = &off_189D0E918;
        v32[66] = &off_189D0E318;
        v31[67] = &off_189D0E930;
        v32[67] = &off_189D0E318;
        v31[68] = &off_189D0E948;
        v32[68] = &off_189D0E318;
        v31[69] = &off_189D0E960;
        v32[69] = &off_189D0E318;
        v31[70] = &off_189D0E978;
        v32[70] = &off_189D0E318;
        v31[71] = &off_189D0E990;
        v32[71] = &off_189D0E318;
        v31[72] = &off_189D0E9A8;
        v32[72] = &off_189D0E318;
        v31[73] = &off_189D0E9C0;
        v32[73] = &off_189D0E588;
        v31[74] = &off_189D0E9D8;
        v32[74] = &off_189D0E2B8;
        v31[75] = &off_189D0E9F0;
        v32[75] = &off_189D0E2B8;
        v31[76] = &off_189D0EA08;
        v32[76] = &off_189D0E318;
        v31[77] = &off_189D0EA20;
        v32[77] = &off_189D0E318;
        v31[78] = &off_189D0EA38;
        v32[78] = &off_189D0E318;
        v31[79] = &off_189D0EA50;
        v32[79] = &off_189D0E2B8;
        v31[80] = &off_189D0EA68;
        v32[80] = &off_189D0E318;
        v31[81] = &off_189D0EA80;
        v32[81] = &off_189D0E588;
        v31[82] = &off_189D0EA98;
        v32[82] = &off_189D0E2B8;
        v31[83] = &off_189D0EAB0;
        v32[83] = &off_189D0E2B8;
        v31[84] = &off_189D0EAC8;
        v32[84] = &off_189D0E2B8;
        v31[85] = &off_189D0EAE0;
        v32[85] = &off_189D0E2B8;
        v31[86] = &off_189D0EAF8;
        v32[86] = &off_189D0E2B8;
        v31[87] = &off_189D0EB10;
        v32[87] = &off_189D0E2B8;
        v31[88] = &off_189D0EB28;
        v32[88] = &off_189D0E2B8;
        v31[89] = &off_189D0EB40;
        v32[89] = &off_189D0E2B8;
        v31[90] = &off_189D0EB58;
        v32[90] = &off_189D0E2B8;
        v31[91] = &off_189D0EB70;
        v32[91] = &off_189D0E2B8;
        v23 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v32, v31, 92),  "objectForKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        if (v23) {
          uint64_t v24 = [v23 unsignedIntegerValue];
        }
        else {
          uint64_t v24 = 3LL;
        }
        -[NSMeasurement unit](v22, "unit");
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          uint64_t v22 = (NSMeasurement *)[(id)objc_opt_class() _measurementWithNaturalScale:v22 system:v24];
        }
      }

      if (_unitHasSpecifierAndIsDimensional(-[NSMeasurement unit](v22, "unit")))
      {
        uint64_t v26 = objc_msgSend(-[NSMeasurement unit](v22, "unit"), "specifier");
        if (v26 == -1)
        {
          int v19 = 0LL;
          goto LABEL_36;
        }

        uint64_t v27 = v26;
        -[NSMeasurement doubleValue](v22, "doubleValue");
        v28 = -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", v27);
      }

      else
      {
        v29 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
        -[NSMeasurement doubleValue](v22, "doubleValue");
        v28 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ %@",  -[NSNumberFormatter stringFromNumber:]( v29,  "stringFromNumber:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")),  objc_msgSend(-[NSMeasurement unit](v22, "unit"), "symbol"));
      }

      int v19 = v28;
LABEL_36:

      return v19;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((-[NSUnitFormatter unitOptions](self, "unitOptions") & 1) != 0 || (isKindOfClass & 1) == 0) {
      return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ %@",  -[NSNumberFormatter stringFromNumber:]( -[NSUnitFormatter numberFormatter](self, "numberFormatter"),  "stringFromNumber:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6)),  [v7 symbol]);
    }
    int v15 = (void *)[(id)objc_opt_class() baseUnit];
    if (_unitHasSpecifierAndIsDimensional(v15)) {
      return -[NSUnitFormatter stringForObjectValue:]( self,  "stringForObjectValue:",  [a3 measurementByConvertingToUnit:v15]);
    }
  }

  return 0LL;
}

- (id)stringForValue:(double)a3 unit:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  uint64_t v26 = 0LL;
  memset(v25, 0, sizeof(v25));
  if (!self->_formatter && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** [NSUnitFormatter stringForValue:unit:] _formatter is nil",  buf,  2u);
  }

  unsigned int v7 = uameasfmt_format();
  unsigned int v8 = v7;
  if ((int)v7 >= 1)
  {
    if (v7 < 0x65) {
      return +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v25, v7);
    }
    __int16 v14 = malloc(2LL * v7);
    if (v14)
    {
      int v15 = v14;
      uameasfmt_format();
      unsigned int v13 = +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v15, v8);
      free(v15);
      return v13;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = 2LL * v8;
      uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v11 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = u_errorName(U_ZERO_ERROR);
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = (uint64_t)v9;
    __int16 v19 = 1024;
    unsigned int v20 = v8;
    __int16 v21 = 2048;
    double v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    uint64_t v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v11 = "*** uameasfmt_format() failed in NSUnitFormatter: %s, len = %d, value = %f, unit = %lu";
    uint32_t v12 = 38;
LABEL_7:
    _os_log_impl(&dword_182EB1000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
  }

  return 0LL;
}

- (id)stringForValue1:(double)a3 unit1:(unint64_t)a4 value2:(double)a5 unit2:(unint64_t)a6
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  uint64_t v20 = 0LL;
  memset(v19, 0, sizeof(v19));
  unsigned int v6 = uameasfmt_formatMultiple();
  unsigned int v7 = v6;
  if ((int)v6 >= 1)
  {
    if (v6 < 0x65) {
      return +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v19, v6);
    }
    uint32_t v12 = malloc(2LL * v6);
    if (v12)
    {
      unsigned int v13 = v12;
      uameasfmt_formatMultiple();
      uint64_t v11 = +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v13, v7);
      free(v13);
      return v11;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v16 = (const char *)(2LL * v7);
      unsigned int v8 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v9 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      uint32_t v10 = 12;
      goto LABEL_4;
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = u_errorName(U_ZERO_ERROR);
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    unsigned int v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v9 = "*** uameasfmt_formatMultiple() failed in NSUnitFormatter: %s, len = %d";
    uint32_t v10 = 18;
LABEL_4:
    _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
  }

  return 0LL;
}

- (id)unitStringFromValue:(double)a3 unit:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (qword_18C64E0C8 != -1) {
    dispatch_once(&qword_18C64E0C8, &__block_literal_global_71);
  }
  unsigned int v6 = -[NSUnitFormatter numberFormatter](self, "numberFormatter");
  unsigned int v7 = -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  if (self->_prules)
  {
    unsigned int v8 = v7;
    if (!-[NSNumberFormatter checkLocaleChange](v6, "checkLocaleChange")
      && -[NSString isEqualToString:]( v8,  "isEqualToString:",  -[NSLocale localeIdentifier](-[NSNumberFormatter locale](v6, "locale"), "localeIdentifier")))
    {
      goto LABEL_9;
    }

    if (self->_prules) {
      uplrules_close();
    }
  }

  -[NSString getCString:maxLength:encoding:]( -[NSLocale localeIdentifier]( -[NSNumberFormatter locale](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "locale"),  "localeIdentifier"),  "getCString:maxLength:encoding:",  v22,  100LL,  4LL);
  self->_prules = (UPluralRules *)uplrules_open();
  -[NSNumberFormatter resetCheckLocaleChange]( -[NSUnitFormatter numberFormatter](self, "numberFormatter"),  "resetCheckLocaleChange");
LABEL_9:
  uint64_t v9 = objc_msgSend( (id)_MergedGlobals_8,  "objectForKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  unint64_t v10 = self->_unitStyle - 1;
  if (v10 > 2) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = off_189CA2A00[v10];
  }
  uint64_t v23 = 0LL;
  memset(v22, 0, sizeof(v22));
  int v12 = uplrules_select();
  if (v12 < 1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      int v21 = v12;
      _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** uplrules_select() failed in NSUnitFormatter: %s, len = %d",  buf,  0x12u);
    }

    return 0LL;
  }

  else
  {
    unsigned int v13 = -[NSString uppercaseString]( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v22,  v12),  "uppercaseString");
    NSFormattingContext v14 = -[NSNumberFormatter formattingContext]( -[NSUnitFormatter numberFormatter](self, "numberFormatter"),  "formattingContext");
    else {
      int v15 = off_189CA2A18[v14];
    }
    return (id)[(id)_NSFoundationBundle() localizedStringForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@_%@_%@_%@", v9, v11, v13, v15), &stru_189CA6A28, @"UnitFormatting" value table];
  }

- (id)stringFromUnit:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!_unitHasSpecifierAndIsDimensional(a3)) {
    return (id)[a3 symbol];
  }
  -[NSUnitFormatter checkIfModified](self, "checkIfModified");
  [a3 specifier];
  uint64_t v20 = 0LL;
  memset(v19, 0, sizeof(v19));
  unsigned int UnitName = uameasfmt_getUnitName();
  unsigned int v6 = UnitName;
  if ((int)UnitName >= 1)
  {
    if (UnitName < 0x65) {
      return +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v19,  UnitName);
    }
    int v12 = malloc(2LL * UnitName);
    if (v12)
    {
      unsigned int v13 = v12;
      int v14 = uameasfmt_getUnitName();
      if (v14 >= 1)
      {
        unint64_t v10 = +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v13,  v14);
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v16 = u_errorName(U_ZERO_ERROR);
          __int16 v17 = 1024;
          int v18 = v14;
          _os_log_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d",  buf,  0x12u);
        }

        unint64_t v10 = 0LL;
      }

      free(v13);
      return v10;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v16 = (const char *)(2LL * v6);
      unsigned int v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      unsigned int v8 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      uint32_t v9 = 12;
      goto LABEL_5;
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = u_errorName(U_ZERO_ERROR);
    __int16 v17 = 1024;
    int v18 = v6;
    unsigned int v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    unsigned int v8 = "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d";
    uint32_t v9 = 18;
LABEL_5:
    _os_log_impl(&dword_182EB1000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
  }

  return 0LL;
}

- (NSUnitFormatter)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  uint64_t v5 = [a3 decodeIntegerForKey:@"NS.unitOptions"];
  else {
    uint64_t v6 = 2LL;
  }
  if ([a3 containsValueForKey:@"NS.locale"])
  {
    unsigned int v7 = (void *)[a3 decodeObjectOfClass:MEMORY[0x189603F90] forKey:@"NS.locale"];
    if (!v7)
    {

      int v18 = @"NSLocalizedDescription";
      v19[0] = @"Locale has been corrupted!";
      unsigned int v8 = (void *)MEMORY[0x189603F68];
      uint32_t v9 = (const __CFString **)v19;
      unint64_t v10 = &v18;
LABEL_18:
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1)));
      return 0LL;
    }
  }

  else
  {
    unsigned int v7 = 0LL;
  }

  if ([a3 containsValueForKey:@"NS.numberFormatter"])
  {
    uint64_t v11 = (void *)[a3 decodeObjectOfClass:NSNumberFormatter forKey:@"NS.numberFormatter"];
    if (!v11)
    {

      __int16 v16 = @"NSLocalizedDescription";
      __int16 v17 = @"Number formatter has been corrupted!";
      unsigned int v8 = (void *)MEMORY[0x189603F68];
      uint32_t v9 = &v17;
      unint64_t v10 = &v16;
      goto LABEL_18;
    }

    int v12 = v11;
    [v11 setPropertyBit];
  }

  else
  {
    int v12 = 0LL;
  }

  unsigned int v13 = -[NSUnitFormatter init](self, "init");
  int v14 = v13;
  if (v13)
  {
    if (v6 != 2) {
      v13->_int64_t unitStyle = v6;
    }
    v13->_unint64_t unitOptions = v5;
    v13->_locale = (NSLocale *)[v7 copy];
    v14->_numberFormatter = (NSNumberFormatter *)[v12 copy];
    v14->_modified = 1;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_unitOptions forKey:@"NS.unitOptions"];
    int64_t unitStyle = self->_unitStyle;
    if (unitStyle != 2) {
      [a3 encodeInteger:unitStyle forKey:@"NS.unitStyle"];
    }
    locale = self->_locale;
    if (locale) {
      [a3 encodeObject:locale forKey:@"NS.locale"];
    }
    numberFormatter = self->_numberFormatter;
    if (numberFormatter) {
      [a3 encodeObject:numberFormatter forKey:@"NS.numberFormatter"];
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSUnitFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
    +[NSUnitFormatter supportsSecureCoding](v8, v9);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUnitStyle:self->_unitStyle];
  [v4 setNumberFormatter:self->_numberFormatter];
  [v4 setLocale:self->_locale];
  return v4;
}

@end