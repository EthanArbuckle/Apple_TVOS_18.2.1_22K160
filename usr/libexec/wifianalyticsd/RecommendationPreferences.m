@interface RecommendationPreferences
+ (id)sharedObject;
- (BOOL)disable_dps_wd;
- (BOOL)disable_fast_dps_validation_for_test;
- (BOOL)disable_fast_dps_wd;
- (BOOL)disable_recommendation_engine;
- (BOOL)disable_slow_wifi_dps_is_priority_network;
- (BOOL)disable_slow_wifi_wd;
- (BOOL)force_dps_recommend_always;
- (BOOL)work_report_logs_enabled;
- (RecommendationPreferences)init;
- (int64_t)reset_pd_rssi_threshold;
- (unint64_t)dns_symptoms_duration_between_samples_after_trap;
- (unint64_t)dns_symptoms_duration_between_samples_before_trap;
- (unint64_t)dns_symptoms_interrogation_sample_count;
- (unint64_t)dns_symptoms_trap_evaluated_at_sample;
- (unint64_t)dps_capture_evaluated_at_sample;
- (unint64_t)dps_duration_between_samples;
- (unint64_t)dps_interrogation_sample_count;
- (unint64_t)dps_report_sent_after;
- (unint64_t)dps_stall_dur_for_wd;
- (unint64_t)dps_symptoms_average_cca_threshold;
- (unint64_t)dps_trap_evaluated_at_sample;
- (unint64_t)dps_wd_cca;
- (unint64_t)ior_persist_delay_seconds;
- (unint64_t)ior_rescan_budget_exploratory_seconds;
- (unint64_t)ior_rescan_budget_less_than_previous_max_channels_seconds;
- (unint64_t)ior_rescan_new_phy_delay_seconds;
- (unint64_t)minutes_between_dps_wd;
- (unint64_t)minutes_between_fast_dps_wd_screen_off;
- (unint64_t)minutes_between_fast_dps_wd_screen_on;
- (unint64_t)minutes_between_peer_diagnostics_trigger_for_dns_stall;
- (unint64_t)minutes_between_peer_diagnostics_trigger_for_other_issues;
- (unint64_t)minutes_between_slow_wifi_wd;
- (unint64_t)minutes_between_symptoms_dps_wd_screen_off;
- (unint64_t)minutes_between_symptoms_dps_wd_screen_on;
- (unint64_t)prediction_probability_threshold;
- (unint64_t)prediction_probability_threshold_macos;
- (unint64_t)reset_awdl_activity_threshold;
- (unint64_t)reset_cca_bin_threshold;
- (unint64_t)reset_legacy_chipset_cca_bin_threshold;
- (unint64_t)reset_pd_cca_threshold;
- (unint64_t)reset_rssi_bin_threshold;
- (unint64_t)reset_score_threshold;
- (unint64_t)slow_wifi_duration_between_samples;
- (unint64_t)slow_wifi_interrogation_sample_count;
- (unint64_t)slow_wifi_report_sent_after;
- (unint64_t)work_report_seconds;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisable_dps_wd:(BOOL)a3;
- (void)setDisable_fast_dps_validation_for_test:(BOOL)a3;
- (void)setDisable_fast_dps_wd:(BOOL)a3;
- (void)setDisable_recommendation_engine:(BOOL)a3;
- (void)setDisable_slow_wifi_dps_is_priority_network:(BOOL)a3;
- (void)setDisable_slow_wifi_wd:(BOOL)a3;
- (void)setDns_symptoms_duration_between_samples_after_trap:(unint64_t)a3;
- (void)setDns_symptoms_duration_between_samples_before_trap:(unint64_t)a3;
- (void)setDns_symptoms_interrogation_sample_count:(unint64_t)a3;
- (void)setDns_symptoms_trap_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_capture_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_duration_between_samples:(unint64_t)a3;
- (void)setDps_interrogation_sample_count:(unint64_t)a3;
- (void)setDps_report_sent_after:(unint64_t)a3;
- (void)setDps_stall_dur_for_wd:(unint64_t)a3;
- (void)setDps_symptoms_average_cca_threshold:(unint64_t)a3;
- (void)setDps_trap_evaluated_at_sample:(unint64_t)a3;
- (void)setDps_wd_cca:(unint64_t)a3;
- (void)setForce_dps_recommend_always:(BOOL)a3;
- (void)setIor_persist_delay_seconds:(unint64_t)a3;
- (void)setIor_rescan_budget_exploratory_seconds:(unint64_t)a3;
- (void)setIor_rescan_budget_less_than_previous_max_channels_seconds:(unint64_t)a3;
- (void)setIor_rescan_new_phy_delay_seconds:(unint64_t)a3;
- (void)setMinutes_between_dps_wd:(unint64_t)a3;
- (void)setMinutes_between_fast_dps_wd_screen_off:(unint64_t)a3;
- (void)setMinutes_between_fast_dps_wd_screen_on:(unint64_t)a3;
- (void)setMinutes_between_peer_diagnostics_trigger_for_dns_stall:(unint64_t)a3;
- (void)setMinutes_between_peer_diagnostics_trigger_for_other_issues:(unint64_t)a3;
- (void)setMinutes_between_slow_wifi_wd:(unint64_t)a3;
- (void)setMinutes_between_symptoms_dps_wd_screen_off:(unint64_t)a3;
- (void)setMinutes_between_symptoms_dps_wd_screen_on:(unint64_t)a3;
- (void)setPrediction_probability_threshold:(unint64_t)a3;
- (void)setPrediction_probability_threshold_macos:(unint64_t)a3;
- (void)setReset_awdl_activity_threshold:(unint64_t)a3;
- (void)setReset_cca_bin_threshold:(unint64_t)a3;
- (void)setReset_legacy_chipset_cca_bin_threshold:(unint64_t)a3;
- (void)setReset_pd_cca_threshold:(unint64_t)a3;
- (void)setReset_pd_rssi_threshold:(int64_t)a3;
- (void)setReset_rssi_bin_threshold:(unint64_t)a3;
- (void)setReset_score_threshold:(unint64_t)a3;
- (void)setSlow_wifi_duration_between_samples:(unint64_t)a3;
- (void)setSlow_wifi_interrogation_sample_count:(unint64_t)a3;
- (void)setSlow_wifi_report_sent_after:(unint64_t)a3;
- (void)setWork_report_logs_enabled:(BOOL)a3;
- (void)setWork_report_seconds:(unint64_t)a3;
@end

@implementation RecommendationPreferences

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D3B8;
  block[3] = &unk_1000CCCE0;
  block[4] = a1;
  if (qword_1000ECFF0 != -1) {
    dispatch_once(&qword_1000ECFF0, block);
  }
  return (id)qword_1000ECFE8;
}

- (RecommendationPreferences)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RecommendationPreferences;
  v2 = -[RecommendationPreferences init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentDomainForName:@"com.apple.wifianalyticsd"]);
    id v5 = WALogCategoryDefaultHandle();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RecommendationPreferences init]";
      __int16 v14 = 1024;
      int v15 = 167;
      __int16 v16 = 2112;
      v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:RecommendationPreferences defaults %@",  buf,  0x1Cu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_recommendation_engine"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_dps_wd"];
    [v7 setObject:&off_1000E0090 forKey:@"minutes_between_dps_wd"];
    [v7 setObject:&off_1000E00A8 forKey:@"dps_wd_cca"];
    [v7 setObject:&off_1000E00C0 forKey:@"dps_stall_dur_for_wd"];
    [v7 setObject:&off_1000E00D8 forKey:@"dps_capture_evaluated_at_sample"];
    [v7 setObject:&off_1000E00F0 forKey:@"dps_trap_evaluated_at_sample"];
    [v7 setObject:&off_1000E00F0 forKey:@"dps_interrogation_sample_count"];
    [v7 setObject:&off_1000E0108 forKey:@"dps_duration_between_samples"];
    [v7 setObject:&off_1000E0120 forKey:@"dps_report_sent_after"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"force_dps_recommend_always"];
    [v7 setObject:&off_1000E00F0 forKey:@"dns_symptoms_trap_evaluated_at_sample"];
    [v7 setObject:&off_1000E0138 forKey:@"dns_symptoms_interrogation_sample_count"];
    [v7 setObject:&off_1000E0108 forKey:@"dns_symptoms_duration_between_samples_before_trap"];
    [v7 setObject:&off_1000E0150 forKey:@"dns_symptoms_duration_between_samples_after_trap"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_fast_dps_wd"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_fast_dps_validation_for_test"];
    [v7 setObject:&off_1000E0168 forKey:@"minutes_between_fast_dps_wd_screen_on"];
    [v7 setObject:&off_1000E0168 forKey:@"minutes_between_fast_dps_wd_screen_off"];
    [v7 setObject:&off_1000E0180 forKey:@"prediction_probability_threshold"];
    [v7 setObject:&off_1000E00A8 forKey:@"prediction_probability_threshold_macos"];
    [v7 setObject:&off_1000E0198 forKey:@"reset_cca_bin_threshold"];
    [v7 setObject:&off_1000E01B0 forKey:@"minutes_between_symptoms_dps_wd_screen_on"];
    [v7 setObject:&off_1000E01B0 forKey:@"minutes_between_symptoms_dps_wd_screen_off"];
    [v7 setObject:&off_1000E01C8 forKey:@"minutes_between_peer_diagnostics_trigger_for_dns_stall"];
    [v7 setObject:&off_1000E01C8 forKey:@"minutes_between_peer_diagnostics_trigger_for_other_issues"];
    [v7 setObject:&off_1000E01E0 forKey:@"reset_score_threshold"];
    [v7 setObject:&off_1000E01F8 forKey:@"dps_symptoms_average_cca_threshold"];
    [v7 setObject:&off_1000E0210 forKey:@"reset_pd_rssi_threshold"];
    [v7 setObject:&off_1000E00A8 forKey:@"reset_pd_cca_threshold"];
    [v7 setObject:&off_1000E0228 forKey:@"reset_legacy_chipset_cca_bin_threshold"];
    [v7 setObject:&off_1000E0240 forKey:@"reset_rssi_bin_threshold"];
    [v7 setObject:&off_1000E0258 forKey:@"reset_awdl_activity_threshold"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_slow_wifi_wd"];
    [v7 setObject:&off_1000E01C8 forKey:@"minutes_between_slow_wifi_wd"];
    [v7 setObject:&off_1000E0270 forKey:@"slow_wifi_interrogation_sample_count"];
    [v7 setObject:&off_1000E0288 forKey:@"slow_wifi_duration_between_samples"];
    [v7 setObject:&off_1000E02A0 forKey:@"slow_wifi_report_sent_after"];
    [v7 setObject:&__kCFBooleanFalse forKey:@"disable_slow_wifi_dps_is_priority_network"];
    [v7 setObject:&off_1000E02B8 forKey:@"ior_rescan_budget_less_than_previous_max_channels_seconds"];
    [v7 setObject:&off_1000E02D0 forKey:@"ior_rescan_budget_exploratory_seconds"];
    [v7 setObject:&off_1000E01C8 forKey:@"ior_rescan_new_phy_delay_seconds"];
    [v7 setObject:&off_1000E02E8 forKey:@"ior_persist_delay_seconds"];
    [v7 setObject:&off_1000E02D0 forKey:@"work_report_seconds"];
    [v7 setObject:&__kCFBooleanTrue forKey:@"work_report_logs_enabled"];
    [v3 setPersistentDomain:v4 forName:@"com.apple.wifianalyticsd"];
    [v3 registerDefaults:v7];
    [v3 addObserver:v2 forKeyPath:@"disable_recommendation_engine" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_wd_cca" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_stall_dur_for_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_capture_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_trap_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_duration_between_samples" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_report_sent_after" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"force_dps_recommend_always" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_trap_evaluated_at_sample" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_duration_between_samples_before_trap" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dns_symptoms_duration_between_samples_after_trap" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_fast_dps_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_fast_dps_validation_for_test" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_fast_dps_wd_screen_on" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_fast_dps_wd_screen_off" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"prediction_probability_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"prediction_probability_threshold_macos" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_cca_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_score_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"dps_symptoms_average_cca_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_pd_rssi_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_pd_cca_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_symptoms_dps_wd_screen_on" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_symptoms_dps_wd_screen_off" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_dns_stall" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_other_issues" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_legacy_chipset_cca_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_rssi_bin_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"reset_awdl_activity_threshold" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_slow_wifi_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"minutes_between_slow_wifi_wd" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_interrogation_sample_count" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_duration_between_samples" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"slow_wifi_report_sent_after" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"disable_slow_wifi_dps_is_priority_network" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_budget_less_than_previous_max_channels_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_budget_exploratory_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_rescan_new_phy_delay_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"ior_persist_delay_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"work_report_seconds" options:5 context:0];
    [v3 addObserver:v2 forKeyPath:@"work_report_logs_enabled" options:5 context:0];
    v8 = v2;
  }

  else
  {
    id v10 = WALogCategoryDefaultHandle();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[RecommendationPreferences init]";
      __int16 v14 = 1024;
      int v15 = 163;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error super init",  buf,  0x12u);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"disable_recommendation_engine"];
  [v3 removeObserver:self forKeyPath:@"disable_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"dps_wd_cca"];
  [v3 removeObserver:self forKeyPath:@"dps_stall_dur_for_wd"];
  [v3 removeObserver:self forKeyPath:@"dps_capture_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dps_trap_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dps_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"dps_duration_between_samples"];
  [v3 removeObserver:self forKeyPath:@"dps_report_sent_after"];
  [v3 removeObserver:self forKeyPath:@"force_dps_recommend_always"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_trap_evaluated_at_sample"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_duration_between_samples_before_trap"];
  [v3 removeObserver:self forKeyPath:@"dns_symptoms_duration_between_samples_after_trap"];
  [v3 removeObserver:self forKeyPath:@"disable_fast_dps_wd"];
  [v3 removeObserver:self forKeyPath:@"disable_fast_dps_validation_for_test"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_fast_dps_wd_screen_on"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_fast_dps_wd_screen_off"];
  [v3 removeObserver:self forKeyPath:@"prediction_probability_threshold"];
  [v3 removeObserver:self forKeyPath:@"prediction_probability_threshold_macos"];
  [v3 removeObserver:self forKeyPath:@"reset_cca_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_symptoms_dps_wd_screen_on"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_symptoms_dps_wd_screen_off"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_dns_stall"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_peer_diagnostics_trigger_for_other_issues"];
  [v3 removeObserver:self forKeyPath:@"reset_score_threshold"];
  [v3 removeObserver:self forKeyPath:@"dps_symptoms_average_cca_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_pd_rssi_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_pd_cca_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_legacy_chipset_cca_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_rssi_bin_threshold"];
  [v3 removeObserver:self forKeyPath:@"reset_awdl_activity_threshold"];
  [v3 removeObserver:self forKeyPath:@"disable_slow_wifi_wd"];
  [v3 removeObserver:self forKeyPath:@"minutes_between_slow_wifi_wd"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_interrogation_sample_count"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_duration_between_samples"];
  [v3 removeObserver:self forKeyPath:@"slow_wifi_report_sent_after"];
  [v3 removeObserver:self forKeyPath:@"disable_slow_wifi_dps_is_priority_network"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_budget_less_than_previous_max_channels_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_budget_exploratory_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_rescan_new_phy_delay_seconds"];
  [v3 removeObserver:self forKeyPath:@"ior_persist_delay_seconds"];
  [v3 removeObserver:self forKeyPath:@"work_report_seconds"];
  [v3 removeObserver:self forKeyPath:@"work_report_logs_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RecommendationPreferences;
  -[RecommendationPreferences dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
    int v15 = v13;
  }
  else {
    int v15 = 0LL;
  }
  id v16 = v15;
  if ([v10 isEqualToString:@"disable_recommendation_engine"])
  {
    if (v16)
    {
      -[RecommendationPreferences setDisable_recommendation_engine:]( self,  "setDisable_recommendation_engine:",  [v16 BOOLValue]);
      id v17 = WALogCategoryDefaultHandle();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = -[RecommendationPreferences disable_recommendation_engine](self, "disable_recommendation_engine");
        v20 = "NO";
        v84 = "-[RecommendationPreferences observeValueForKeyPath:ofObject:change:context:]";
        *(_DWORD *)buf = 136446722;
        if (v19) {
          v20 = "YES";
        }
        __int16 v85 = 1024;
        int v86 = 484;
        __int16 v87 = 2080;
        int64_t v88 = (int64_t)v20;
        v21 = "%{public}s::%d:disable_recommendation_engine Preference is %s";
        goto LABEL_200;
      }

- (BOOL)disable_recommendation_engine
{
  return self->_disable_recommendation_engine;
}

- (void)setDisable_recommendation_engine:(BOOL)a3
{
  self->_disable_recommendation_engine = a3;
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (void)setDisable_dps_wd:(BOOL)a3
{
  self->_disable_dps_wd = a3;
}

- (unint64_t)minutes_between_dps_wd
{
  return self->_minutes_between_dps_wd;
}

- (void)setMinutes_between_dps_wd:(unint64_t)a3
{
  self->_minutes_between_dps_wd = a3;
}

- (unint64_t)dps_wd_cca
{
  return self->_dps_wd_cca;
}

- (void)setDps_wd_cca:(unint64_t)a3
{
  self->_dps_wd_cca = a3;
}

- (unint64_t)dps_stall_dur_for_wd
{
  return self->_dps_stall_dur_for_wd;
}

- (void)setDps_stall_dur_for_wd:(unint64_t)a3
{
  self->_dps_stall_dur_for_wd = a3;
}

- (unint64_t)dps_capture_evaluated_at_sample
{
  return self->_dps_capture_evaluated_at_sample;
}

- (void)setDps_capture_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_capture_evaluated_at_sample = a3;
}

- (unint64_t)dps_trap_evaluated_at_sample
{
  return self->_dps_trap_evaluated_at_sample;
}

- (void)setDps_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dps_trap_evaluated_at_sample = a3;
}

- (unint64_t)dps_interrogation_sample_count
{
  return self->_dps_interrogation_sample_count;
}

- (void)setDps_interrogation_sample_count:(unint64_t)a3
{
  self->_dps_interrogation_sample_count = a3;
}

- (unint64_t)dps_duration_between_samples
{
  return self->_dps_duration_between_samples;
}

- (void)setDps_duration_between_samples:(unint64_t)a3
{
  self->_dps_duration_between_samples = a3;
}

- (unint64_t)dps_report_sent_after
{
  return self->_dps_report_sent_after;
}

- (void)setDps_report_sent_after:(unint64_t)a3
{
  self->_dps_report_sent_after = a3;
}

- (BOOL)force_dps_recommend_always
{
  return self->_force_dps_recommend_always;
}

- (void)setForce_dps_recommend_always:(BOOL)a3
{
  self->_force_dps_recommend_always = a3;
}

- (unint64_t)dns_symptoms_trap_evaluated_at_sample
{
  return self->_dns_symptoms_trap_evaluated_at_sample;
}

- (void)setDns_symptoms_trap_evaluated_at_sample:(unint64_t)a3
{
  self->_dns_symptoms_trap_evaluated_at_sample = a3;
}

- (unint64_t)dns_symptoms_interrogation_sample_count
{
  return self->_dns_symptoms_interrogation_sample_count;
}

- (void)setDns_symptoms_interrogation_sample_count:(unint64_t)a3
{
  self->_dns_symptoms_interrogation_sample_count = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_before_trap
{
  return self->_dns_symptoms_duration_between_samples_before_trap;
}

- (void)setDns_symptoms_duration_between_samples_before_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_before_trap = a3;
}

- (unint64_t)dns_symptoms_duration_between_samples_after_trap
{
  return self->_dns_symptoms_duration_between_samples_after_trap;
}

- (void)setDns_symptoms_duration_between_samples_after_trap:(unint64_t)a3
{
  self->_dns_symptoms_duration_between_samples_after_trap = a3;
}

- (BOOL)disable_fast_dps_wd
{
  return self->_disable_fast_dps_wd;
}

- (void)setDisable_fast_dps_wd:(BOOL)a3
{
  self->_disable_fast_dps_wd = a3;
}

- (BOOL)disable_fast_dps_validation_for_test
{
  return self->_disable_fast_dps_validation_for_test;
}

- (void)setDisable_fast_dps_validation_for_test:(BOOL)a3
{
  self->_disable_fast_dps_validation_for_test = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_on
{
  return self->_minutes_between_fast_dps_wd_screen_on;
}

- (void)setMinutes_between_fast_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_fast_dps_wd_screen_off
{
  return self->_minutes_between_fast_dps_wd_screen_off;
}

- (void)setMinutes_between_fast_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_fast_dps_wd_screen_off = a3;
}

- (unint64_t)prediction_probability_threshold
{
  return self->_prediction_probability_threshold;
}

- (void)setPrediction_probability_threshold:(unint64_t)a3
{
  self->_prediction_probability_threshold = a3;
}

- (unint64_t)prediction_probability_threshold_macos
{
  return self->_prediction_probability_threshold_macos;
}

- (void)setPrediction_probability_threshold_macos:(unint64_t)a3
{
  self->_prediction_probability_threshold_macos = a3;
}

- (unint64_t)reset_cca_bin_threshold
{
  return self->_reset_cca_bin_threshold;
}

- (void)setReset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_cca_bin_threshold = a3;
}

- (unint64_t)reset_legacy_chipset_cca_bin_threshold
{
  return self->_reset_legacy_chipset_cca_bin_threshold;
}

- (void)setReset_legacy_chipset_cca_bin_threshold:(unint64_t)a3
{
  self->_reset_legacy_chipset_cca_bin_threshold = a3;
}

- (unint64_t)reset_rssi_bin_threshold
{
  return self->_reset_rssi_bin_threshold;
}

- (void)setReset_rssi_bin_threshold:(unint64_t)a3
{
  self->_reset_rssi_bin_threshold = a3;
}

- (unint64_t)reset_awdl_activity_threshold
{
  return self->_reset_awdl_activity_threshold;
}

- (void)setReset_awdl_activity_threshold:(unint64_t)a3
{
  self->_reset_awdl_activity_threshold = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_on
{
  return self->_minutes_between_symptoms_dps_wd_screen_on;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_on:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_on = a3;
}

- (unint64_t)minutes_between_symptoms_dps_wd_screen_off
{
  return self->_minutes_between_symptoms_dps_wd_screen_off;
}

- (void)setMinutes_between_symptoms_dps_wd_screen_off:(unint64_t)a3
{
  self->_minutes_between_symptoms_dps_wd_screen_off = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_dns_stall
{
  return self->_minutes_between_peer_diagnostics_trigger_for_dns_stall;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_dns_stall:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_dns_stall = a3;
}

- (unint64_t)minutes_between_peer_diagnostics_trigger_for_other_issues
{
  return self->_minutes_between_peer_diagnostics_trigger_for_other_issues;
}

- (void)setMinutes_between_peer_diagnostics_trigger_for_other_issues:(unint64_t)a3
{
  self->_minutes_between_peer_diagnostics_trigger_for_other_issues = a3;
}

- (unint64_t)reset_score_threshold
{
  return self->_reset_score_threshold;
}

- (void)setReset_score_threshold:(unint64_t)a3
{
  self->_reset_score_threshold = a3;
}

- (int64_t)reset_pd_rssi_threshold
{
  return self->_reset_pd_rssi_threshold;
}

- (void)setReset_pd_rssi_threshold:(int64_t)a3
{
  self->_reset_pd_rssi_threshold = a3;
}

- (unint64_t)reset_pd_cca_threshold
{
  return self->_reset_pd_cca_threshold;
}

- (void)setReset_pd_cca_threshold:(unint64_t)a3
{
  self->_reset_pd_cca_threshold = a3;
}

- (unint64_t)dps_symptoms_average_cca_threshold
{
  return self->_dps_symptoms_average_cca_threshold;
}

- (void)setDps_symptoms_average_cca_threshold:(unint64_t)a3
{
  self->_dps_symptoms_average_cca_threshold = a3;
}

- (BOOL)disable_slow_wifi_wd
{
  return self->_disable_slow_wifi_wd;
}

- (void)setDisable_slow_wifi_wd:(BOOL)a3
{
  self->_disable_slow_wifi_wd = a3;
}

- (unint64_t)minutes_between_slow_wifi_wd
{
  return self->_minutes_between_slow_wifi_wd;
}

- (void)setMinutes_between_slow_wifi_wd:(unint64_t)a3
{
  self->_minutes_between_slow_wifi_wd = a3;
}

- (unint64_t)slow_wifi_interrogation_sample_count
{
  return self->_slow_wifi_interrogation_sample_count;
}

- (void)setSlow_wifi_interrogation_sample_count:(unint64_t)a3
{
  self->_slow_wifi_interrogation_sample_count = a3;
}

- (unint64_t)slow_wifi_duration_between_samples
{
  return self->_slow_wifi_duration_between_samples;
}

- (void)setSlow_wifi_duration_between_samples:(unint64_t)a3
{
  self->_slow_wifi_duration_between_samples = a3;
}

- (unint64_t)slow_wifi_report_sent_after
{
  return self->_slow_wifi_report_sent_after;
}

- (void)setSlow_wifi_report_sent_after:(unint64_t)a3
{
  self->_slow_wifi_report_sent_after = a3;
}

- (BOOL)disable_slow_wifi_dps_is_priority_network
{
  return self->_disable_slow_wifi_dps_is_priority_network;
}

- (void)setDisable_slow_wifi_dps_is_priority_network:(BOOL)a3
{
  self->_disable_slow_wifi_dps_is_priority_network = a3;
}

- (unint64_t)ior_rescan_budget_less_than_previous_max_channels_seconds
{
  return self->_ior_rescan_budget_less_than_previous_max_channels_seconds;
}

- (void)setIor_rescan_budget_less_than_previous_max_channels_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_less_than_previous_max_channels_seconds = a3;
}

- (unint64_t)ior_rescan_budget_exploratory_seconds
{
  return self->_ior_rescan_budget_exploratory_seconds;
}

- (void)setIor_rescan_budget_exploratory_seconds:(unint64_t)a3
{
  self->_ior_rescan_budget_exploratory_seconds = a3;
}

- (unint64_t)ior_rescan_new_phy_delay_seconds
{
  return self->_ior_rescan_new_phy_delay_seconds;
}

- (void)setIor_rescan_new_phy_delay_seconds:(unint64_t)a3
{
  self->_ior_rescan_new_phy_delay_seconds = a3;
}

- (unint64_t)ior_persist_delay_seconds
{
  return self->_ior_persist_delay_seconds;
}

- (void)setIor_persist_delay_seconds:(unint64_t)a3
{
  self->_ior_persist_delay_seconds = a3;
}

- (unint64_t)work_report_seconds
{
  return self->_work_report_seconds;
}

- (void)setWork_report_seconds:(unint64_t)a3
{
  self->_work_report_seconds = a3;
}

- (BOOL)work_report_logs_enabled
{
  return self->_work_report_logs_enabled;
}

- (void)setWork_report_logs_enabled:(BOOL)a3
{
  self->_work_report_logs_enabled = a3;
}

@end