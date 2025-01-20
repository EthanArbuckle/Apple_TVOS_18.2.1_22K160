@interface TableDrivenLowTempController
- (BOOL)populateIntArray:(int *)a3 params:(id)a4 key:(id)a5 expectedCount:(unint64_t)a6 assertArraySorting:(BOOL)a7;
- (BOOL)populateTableValues:(id)a3 expectedCount:(unint64_t)a4 assertArraySorting:(BOOL)a5;
- (TableDrivenLowTempController)initWithParams:(id)a3;
- (int)mitigationIndexForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5;
- (int)outputForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5;
@end

@implementation TableDrivenLowTempController

- (TableDrivenLowTempController)initWithParams:(id)a3
{
  *(void *)&self->_tempThresholdHysteresis = 0xFFFFFFFF00000000LL;
  sub_100020FE0((CFDictionaryRef)a3, @"tempLimitHysteresis", kCFNumberIntType, &self->_tempThresholdHysteresis);
  id v5 = [a3 valueForKey:@"tempLimits"];
  id v6 = [a3 valueForKey:@"chargeLimits"];
  if (v5)
  {
    v7 = v6;
    if (v6)
    {
      int v8 = [v5 count];
      self->_int temperatureThresholdCount = v8;
      if (v8 >= 16)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003BBC0();
        }
        self->_int temperatureThresholdCount = 0;
      }

      int v9 = [v7 count];
      self->_int chargeThresholdCount = v9;
      if (v9 >= 19)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003BB58();
        }
        self->_int chargeThresholdCount = 0;
      }
    }
  }

  int temperatureThresholdCount = self->_temperatureThresholdCount;
  if (temperatureThresholdCount >= 1)
  {
    int chargeThresholdCount = self->_chargeThresholdCount;
    if (chargeThresholdCount >= 1)
    {
      self->_responseTableCellCount = temperatureThresholdCount
                                    + 1
                                    + (temperatureThresholdCount + 1) * chargeThresholdCount;
      -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:]( self,  "populateIntArray:params:key:expectedCount:assertArraySorting:",  self->_temperatureThresholds,  a3,  @"tempLimits");
      -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:]( self,  "populateIntArray:params:key:expectedCount:assertArraySorting:",  self->_chargeThresholds,  a3,  @"chargeLimits",  self->_chargeThresholdCount,  1LL);
      -[TableDrivenLowTempController populateTableValues:expectedCount:assertArraySorting:]( self,  "populateTableValues:expectedCount:assertArraySorting:",  a3,  self->_responseTableCellCount,  0LL);
    }
  }

  id v12 = [a3 valueForKey:@"RaLimits"];
  if (v12)
  {
    int v13 = [v12 count];
    self->_int batteryRaThresholdCount = v13;
    if (v13 < 7)
    {
      if (v13 >= 1)
      {
        -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:]( self,  "populateIntArray:params:key:expectedCount:assertArraySorting:",  self->_batteryRaThresholds,  a3,  @"RaLimits",  v13,  1LL);
        if (byte_10007CB30)
        {
          v14 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int batteryRaThresholdCount = self->_batteryRaThresholdCount;
            int v16 = self->_batteryRaThresholds[0];
            int v17 = self->_batteryRaThresholds[1];
            v19[0] = 67109632;
            v19[1] = batteryRaThresholdCount;
            __int16 v20 = 1024;
            int v21 = v16;
            __int16 v22 = 1024;
            int v23 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<Notice> Clamp: Ra thresholds (%d) %d %d",  (uint8_t *)v19,  0x14u);
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003BAF0();
      }
      self->_int batteryRaThresholdCount = 0;
    }
  }

  return self;
}

- (BOOL)populateIntArray:(int *)a3 params:(id)a4 key:(id)a5 expectedCount:(unint64_t)a6 assertArraySorting:(BOOL)a7
{
  if (!a3 || !a4 || !a5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003BC28();
    }
    return 0;
  }

  BOOL v7 = a7;
  int v9 = a3;
  id v10 = [a4 valueForKey:a5];
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003BC54();
    }
    return 0;
  }

  v11 = v10;
  if ([v10 count] != (id)a6)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003BCAC();
    }
    return 0;
  }

  if (!a6) {
    return 1;
  }
  BOOL v12 = 0;
  uint64_t v13 = 0LL;
  int v14 = -32768;
  while (1)
  {
    id v15 = [v11 objectAtIndex:v13];
    if (v15) {
      break;
    }
LABEL_12:
    BOOL v12 = ++v13 >= a6;
    if (a6 == v13) {
      return 1;
    }
  }

  signed int v16 = [v15 intValue];
  if (!v7 || (BOOL v17 = v16 <= v14, v14 = v16, !v17))
  {
    *v9++ = v16;
    goto LABEL_12;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003BC80();
  }
  return v12;
}

- (BOOL)populateTableValues:(id)a3 expectedCount:(unint64_t)a4 assertArraySorting:(BOOL)a5
{
  return -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:]( self,  "populateIntArray:params:key:expectedCount:assertArraySorting:",  self->_tableValues,  a3,  @"tableValues",  a4,  a5);
}

- (int)mitigationIndexForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5
{
  uint64_t temperatureThresholdCount = self->_temperatureThresholdCount;
  if ((int)temperatureThresholdCount <= 0)
  {
LABEL_7:
    LODWORD(v6) = self->_temperatureThresholdCount;
  }

  else
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      int v7 = self->_temperatureThresholds[v6];
      if (v6 >= self->_temperatureRow) {
        v7 += self->_tempThresholdHysteresis;
      }
      if (v7 > a3) {
        break;
      }
      if (temperatureThresholdCount == ++v6) {
        goto LABEL_7;
      }
    }
  }

  uint64_t batteryRaThresholdCount = self->_batteryRaThresholdCount;
  if ((int)batteryRaThresholdCount < 1)
  {
    LODWORD(v9) = 0;
  }

  else
  {
    uint64_t v9 = 0LL;
    while (self->_batteryRaThresholds[v9] <= a5)
    {
      if (batteryRaThresholdCount == ++v9)
      {
        LODWORD(v9) = self->_batteryRaThresholdCount;
        break;
      }
    }
  }

  int v10 = (v6 - v9) & ~(((int)v6 - (int)v9) >> 31);
  self->_temperatureRow = temperatureThresholdCount;
  uint64_t chargeThresholdCount = self->_chargeThresholdCount;
  if ((int)chargeThresholdCount <= 0)
  {
LABEL_20:
    LODWORD(v12) = self->_chargeThresholdCount;
  }

  else
  {
    uint64_t v12 = 0LL;
    while (self->_chargeThresholds[v12] <= a4)
    {
    }
  }

  return v12 + temperatureThresholdCount + temperatureThresholdCount * chargeThresholdCount;
}

- (int)outputForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5
{
  return self->_tableValues[-[TableDrivenLowTempController mitigationIndexForBatteryTemperature:stateOfCharge:batteryRaValue:]( self,  "mitigationIndexForBatteryTemperature:stateOfCharge:batteryRaValue:",  *(void *)&a3,  *(void *)&a4,  *(void *)&a5)];
}

@end