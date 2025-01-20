@interface NRAnalyticsDataStall
- (void)submit;
@end

@implementation NRAnalyticsDataStall

- (void)submit
{
  if (self)
  {
    if (self->_stalledNexusVOOutput)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v3,  @"stalledNexusVOOutput");
    }

    if (self->_stalledNexusVIOutput)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v4,  @"stalledNexusVIOutput");
    }

    if (self->_stalledNexusOutput)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v5,  @"stalledNexusOutput");
    }

    if (self->_stalledNexusBKOutput)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v6,  @"stalledNexusBKOutput");
    }

    if (self->_stalledLinkOutput)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v7,  @"stalledLinkOutput");
    }

    if (self->_stalledUrgentLinkOutput)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v8,  @"stalledUrgentLinkOutput");
    }

    if (self->_stalledDatagramLinkOutput)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v9,  @"stalledDatagramLinkOutput");
    }

    if (self->_remediatedDataStall)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._eventDictionary,  "setObject:forKeyedSubscript:",  v10,  @"remediatedDataStall");
    }
  }

  sub_100119D38((uint64_t)self, @"com.apple.networkrelay.analytics.dataStall");
}

@end