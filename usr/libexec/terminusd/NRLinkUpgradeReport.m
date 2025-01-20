@interface NRLinkUpgradeReport
- (BOOL)isEqual:(id)a3;
- (double)timeSinceLastAdvice;
- (id)description;
- (unint64_t)endAdvice;
- (unint64_t)endReason;
- (unint64_t)rateOfAdvicePerHour;
- (void)setAdvice:(unint64_t)a3;
- (void)setBattery:(unsigned __int8)a3;
- (void)setEndAdvice:(unint64_t)a3;
- (void)setEndReason:(unint64_t)a3;
- (void)setRateOfAdvicePerHour:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setThermalLevel:(unsigned __int8)a3;
- (void)setTimeSinceLastAdvice:(double)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation NRLinkUpgradeReport

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t advice = self->_advice;
  v5 = @"None";
  switch(advice)
  {
    case 0uLL:
      break;
    case 1uLL:
      v5 = @"BluetoothDefault";
      break;
    case 2uLL:
      v5 = @"BluetoothClassic";
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v5 = @"WiFi";
      break;
    default:
      if (advice == 128) {
        v5 = @"NoUpgrade";
      }
      else {
LABEL_5:
      }
        v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%llu)",  advice);
      break;
  }

  unint64_t reason = self->_reason;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = v7;
  if ((reason & 0x100) != 0)
  {
    -[NSMutableArray addObject:](v7, "addObject:", @"TransferSizeSmall");
    if ((reason & 0x200) == 0)
    {
LABEL_10:
      if ((reason & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }

  else if ((reason & 0x200) == 0)
  {
    goto LABEL_10;
  }

  -[NSMutableArray addObject:](v8, "addObject:", @"TransferSizeMedium");
  if ((reason & 0x400) == 0)
  {
LABEL_11:
    if ((reason & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }

- (BOOL)isEqual:(id)a3
{
  v4 = (NRLinkUpgradeReport *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRLinkUpgradeReport);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      unint64_t advice = self->_advice;
      if (v6)
      {
        if (advice == v6->_advice)
        {
          unint64_t advice = v6->_reason;
LABEL_6:
          BOOL v8 = self->_reason == advice;
LABEL_11:

          goto LABEL_12;
        }
      }

      else if (!advice)
      {
        goto LABEL_6;
      }

      BOOL v8 = 0;
      goto LABEL_11;
    }

    BOOL v8 = 0;
  }

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void)setAdvice:(unint64_t)a3
{
  self->_unint64_t advice = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

- (void)setThermalLevel:(unsigned __int8)a3
{
  self->_thermalLevel = a3;
}

- (void)setBattery:(unsigned __int8)a3
{
  self->_battery = a3;
}

- (unint64_t)endAdvice
{
  return self->_endAdvice;
}

- (void)setEndAdvice:(unint64_t)a3
{
  self->_endAdvice = a3;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(unint64_t)a3
{
  self->_endReason = a3;
}

- (double)timeSinceLastAdvice
{
  return self->_timeSinceLastAdvice;
}

- (void)setTimeSinceLastAdvice:(double)a3
{
  self->_timeSinceLastAdvice = a3;
}

- (unint64_t)rateOfAdvicePerHour
{
  return self->_rateOfAdvicePerHour;
}

- (void)setRateOfAdvicePerHour:(unint64_t)a3
{
  self->_rateOfAdvicePerHour = a3;
}

@end