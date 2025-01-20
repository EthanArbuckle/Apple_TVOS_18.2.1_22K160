@interface AKPushMessage
- (AKPushMessage)initWithMessage:(id)a3;
- (APSIncomingMessage)message;
- (BOOL)isSilent;
- (BOOL)isValidMessage;
- (BOOL)piggybackingAcceptorSupportsPresence;
- (BOOL)piggybackingIDMSFallbackApproved;
- (BOOL)piggybackingRequestorUsesPresence;
- (BOOL)requiresPasscode;
- (NSDictionary)alertInfo;
- (NSDictionary)eventDetails;
- (NSDictionary)serverContext;
- (NSDictionary)userInfo;
- (NSDictionary)walrusWebAccessInfo;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)timestamp;
- (NSNumber)ttlInMinutes;
- (NSString)alertBody;
- (NSString)alertTitle;
- (NSString)altDSID;
- (NSString)alternateButtonTitle;
- (NSString)appName;
- (NSString)defaultButtonTitle;
- (NSString)deviceClass;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)idmsData;
- (NSString)lockScreenBody;
- (NSString)lockScreenTitle;
- (NSString)messageId;
- (NSString)previousMessageId;
- (NSString)secondaryBody;
- (NSString)secondaryBodyCDP;
- (NSString)secondaryFooter;
- (NSString)secondaryTitle;
- (NSString)secondaryTitleCDP;
- (NSString)serverMachineId;
- (NSString)webSessionUUID;
- (NSUUID)piggybackingRequestorPresenceSID;
- (id)description;
- (int64_t)piggybackingPresenceMode;
- (unint64_t)command;
- (unint64_t)piggybackingContext;
- (void)setAlertBody:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCommand:(unint64_t)a3;
- (void)setLockScreenBody:(id)a3;
- (void)setLockScreenTitle:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setSecondaryBodyCDP:(id)a3;
- (void)setSecondaryFooter:(id)a3;
- (void)setSecondaryTitleCDP:(id)a3;
@end

@implementation AKPushMessage

- (AKPushMessage)initWithMessage:(id)a3
{
  id v5 = a3;
  v205.receiver = self;
  v205.super_class = (Class)&OBJC_CLASS___AKPushMessage;
  v6 = -[AKPushMessage init](&v205, "init");

  if (!v6) {
    goto LABEL_139;
  }
  objc_storeStrong((id *)&v6->_message, a3);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    v10 = (NSDictionary *)v9;
  }
  else {
    v10 = 0LL;
  }

  p_userInfo = (id *)&v6->_userInfo;
  userInfo = v6->_userInfo;
  v6->_userInfo = v10;

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"cmd"));
  if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (v16)
  {
    id v18 = [v16 unsignedIntegerValue];
  }

  else
  {
    uint64_t v20 = _AKLogSystem(v17);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100132110((id *)&v6->_userInfo, v21);
    }

    id v18 = 0LL;
  }

  v6->_command = (unint64_t)v18;
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v19);
  id v23 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"txnid"));
  if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0) {
    v24 = (NSString *)v23;
  }
  else {
    v24 = 0LL;
  }

  messageId = v6->_messageId;
  v6->_messageId = v24;

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString, v26);
  id v28 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"prevtxnid"));
  if ((objc_opt_isKindOfClass(v28, v27) & 1) != 0) {
    v29 = (NSString *)v28;
  }
  else {
    v29 = 0LL;
  }

  previousMessageId = v6->_previousMessageId;
  v6->_previousMessageId = v29;

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v31);
  id v33 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"adsid"));
  if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0) {
    v34 = (NSString *)v33;
  }
  else {
    v34 = 0LL;
  }

  altDSID = v6->_altDSID;
  v6->_altDSID = v34;

  uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString, v36);
  id v38 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"mid"));
  if ((objc_opt_isKindOfClass(v38, v37) & 1) != 0) {
    v39 = (NSString *)v38;
  }
  else {
    v39 = 0LL;
  }

  serverMachineId = v6->_serverMachineId;
  v6->_serverMachineId = v39;

  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString, v41);
  id v43 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"idmsdata"));
  if ((objc_opt_isKindOfClass(v43, v42) & 1) != 0) {
    v44 = (NSString *)v43;
  }
  else {
    v44 = 0LL;
  }

  idmsData = v6->_idmsData;
  v6->_idmsData = v44;

  uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber, v46);
  id v48 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"pbv2"));
  if ((objc_opt_isKindOfClass(v48, v47) & 1) != 0) {
    id v49 = v48;
  }
  else {
    id v49 = 0LL;
  }

  v6->_piggybackingAcceptorSupportsPresence = [v49 BOOLValue];
  uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSNumber, v50);
  id v52 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"pbp"));
  if ((objc_opt_isKindOfClass(v52, v51) & 1) != 0) {
    id v53 = v52;
  }
  else {
    id v53 = 0LL;
  }

  v6->_piggybackingRequestorUsesPresence = [v53 BOOLValue];
  uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSNumber, v54);
  id v56 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"pbc"));
  if ((objc_opt_isKindOfClass(v56, v55) & 1) != 0) {
    id v57 = v56;
  }
  else {
    id v57 = 0LL;
  }

  v6->_unint64_t piggybackingContext = (unint64_t)[v57 integerValue];
  uint64_t v59 = _AKLogSystem(v58);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t piggybackingContext = v6->_piggybackingContext;
    *(_DWORD *)buf = 134217984;
    unint64_t v207 = piggybackingContext;
    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Received Piggybacking context as %lu",  buf,  0xCu);
  }

  uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSNumber, v62);
  id v64 = (id)objc_claimAutoreleasedReturnValue([*p_userInfo objectForKeyedSubscript:@"idmsapproved"]);
  if ((objc_opt_isKindOfClass(v64, v63) & 1) != 0) {
    id v65 = v64;
  }
  else {
    id v65 = 0LL;
  }

  v6->_piggybackingIDMSFallbackApproved = [v65 BOOLValue];
  uint64_t v67 = objc_opt_class(&OBJC_CLASS___NSNumber, v66);
  id v68 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"pbv2m"));
  if ((objc_opt_isKindOfClass(v68, v67) & 1) != 0) {
    id v69 = v68;
  }
  else {
    id v69 = 0LL;
  }

  id v70 = [v69 integerValue];
  uint64_t v71 = v70 == (id)1;
  if (v70 == (id)2) {
    uint64_t v71 = 2LL;
  }
  v6->_piggybackingPresenceMode = v71;

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6->_userInfo, "objectForKeyedSubscript:", @"sid"));
  uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSString, v73);
  v75 = v72;
  if ((objc_opt_isKindOfClass(v75, v74) & 1) == 0)
  {
    v76 = 0LL;
    piggybackingRequestorPresenceSID = v75;
    goto LABEL_51;
  }

  v76 = v75;

  if (v76)
  {
    v79 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v76);
    piggybackingRequestorPresenceSID = v6->_piggybackingRequestorPresenceSID;
    v6->_piggybackingRequestorPresenceSID = v79;
LABEL_51:
  }

  if ((v6->_piggybackingAcceptorSupportsPresence || v6->_piggybackingRequestorUsesPresence)
    && !v6->_piggybackingRequestorPresenceSID)
  {
    uint64_t v81 = _AKLogSystem(v77);
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_1001320A4((uint64_t)v75, v82, v83);
    }
  }

  uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSNumber, v78);
  id v85 = (id)objc_claimAutoreleasedReturnValue([*p_userInfo objectForKeyedSubscript:@"pedr"]);
  if ((objc_opt_isKindOfClass(v85, v84) & 1) != 0) {
    id v86 = v85;
  }
  else {
    id v86 = 0LL;
  }

  if (v86) {
    v6->_requiresPasscode = [v86 BOOLValue];
  }
  uint64_t v88 = objc_opt_class(&OBJC_CLASS___NSDictionary, v87);
  id v89 = (id)objc_claimAutoreleasedReturnValue([*p_userInfo objectForKeyedSubscript:@"aps"]);
  if ((objc_opt_isKindOfClass(v89, v88) & 1) != 0) {
    id v90 = v89;
  }
  else {
    id v90 = 0LL;
  }

  uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSDictionary, v91);
  id v93 = (id)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"alert"]);
  if ((objc_opt_isKindOfClass(v93, v92) & 1) != 0) {
    v94 = (NSDictionary *)v93;
  }
  else {
    v94 = 0LL;
  }

  alertInfo = v6->_alertInfo;
  v6->_alertInfo = v94;

  if (!v6->_alertInfo)
  {
    uint64_t v98 = _AKLogSystem(v96);
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
      sub_100132014((id *)&v6->_userInfo, v99);
    }
  }

  uint64_t v100 = objc_opt_class(&OBJC_CLASS___NSString, v97);
  id v101 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"title"));
  if ((objc_opt_isKindOfClass(v101, v100) & 1) != 0) {
    v102 = (NSString *)v101;
  }
  else {
    v102 = 0LL;
  }

  alertTitle = v6->_alertTitle;
  v6->_alertTitle = v102;

  uint64_t v105 = objc_opt_class(&OBJC_CLASS___NSString, v104);
  id v106 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"body"));
  if ((objc_opt_isKindOfClass(v106, v105) & 1) != 0) {
    v107 = (NSString *)v106;
  }
  else {
    v107 = 0LL;
  }

  alertBody = v6->_alertBody;
  v6->_alertBody = v107;

  uint64_t v110 = objc_opt_class(&OBJC_CLASS___NSString, v109);
  id v111 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"defbtn"));
  if ((objc_opt_isKindOfClass(v111, v110) & 1) != 0) {
    v112 = (NSString *)v111;
  }
  else {
    v112 = 0LL;
  }

  defaultButtonTitle = v6->_defaultButtonTitle;
  v6->_defaultButtonTitle = v112;

  uint64_t v115 = objc_opt_class(&OBJC_CLASS___NSString, v114);
  id v116 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"albtn"));
  if ((objc_opt_isKindOfClass(v116, v115) & 1) != 0) {
    v117 = (NSString *)v116;
  }
  else {
    v117 = 0LL;
  }

  alternateButtonTitle = v6->_alternateButtonTitle;
  v6->_alternateButtonTitle = v117;

  uint64_t v120 = objc_opt_class(&OBJC_CLASS___NSString, v119);
  id v121 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"stitle"));
  if ((objc_opt_isKindOfClass(v121, v120) & 1) != 0) {
    v122 = (NSString *)v121;
  }
  else {
    v122 = 0LL;
  }

  secondaryTitle = v6->_secondaryTitle;
  v6->_secondaryTitle = v122;

  uint64_t v125 = objc_opt_class(&OBJC_CLASS___NSString, v124);
  id v126 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"sbdy"));
  if ((objc_opt_isKindOfClass(v126, v125) & 1) != 0) {
    v127 = (NSString *)v126;
  }
  else {
    v127 = 0LL;
  }

  secondaryBody = v6->_secondaryBody;
  v6->_secondaryBody = v127;

  uint64_t v130 = objc_opt_class(&OBJC_CLASS___NSString, v129);
  id v131 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"sftr"));
  if ((objc_opt_isKindOfClass(v131, v130) & 1) != 0) {
    v132 = (NSString *)v131;
  }
  else {
    v132 = 0LL;
  }

  secondaryFooter = v6->_secondaryFooter;
  v6->_secondaryFooter = v132;

  uint64_t v135 = objc_opt_class(&OBJC_CLASS___NSNumber, v134);
  id v136 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_alertInfo,  "objectForKeyedSubscript:",  @"silent"));
  if ((objc_opt_isKindOfClass(v136, v135) & 1) != 0) {
    id v137 = v136;
  }
  else {
    id v137 = 0LL;
  }

  if (v137) {
    v6->_isSilent = [v137 BOOLValue];
  }
  uint64_t v139 = objc_opt_class(&OBJC_CLASS___NSDictionary, v138);
  id v140 = (id)objc_claimAutoreleasedReturnValue([*p_userInfo objectForKeyedSubscript:@"akdata"]);
  if ((objc_opt_isKindOfClass(v140, v139) & 1) != 0) {
    v141 = (NSDictionary *)v140;
  }
  else {
    v141 = 0LL;
  }

  eventDetails = v6->_eventDetails;
  v6->_eventDetails = v141;

  uint64_t v144 = objc_opt_class(&OBJC_CLASS___NSNumber, v143);
  id v145 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_eventDetails,  "objectForKeyedSubscript:",  @"lat"));
  if ((objc_opt_isKindOfClass(v145, v144) & 1) != 0) {
    v146 = (NSNumber *)v145;
  }
  else {
    v146 = 0LL;
  }

  latitude = v6->_latitude;
  v6->_latitude = v146;

  uint64_t v149 = objc_opt_class(&OBJC_CLASS___NSNumber, v148);
  id v150 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_eventDetails,  "objectForKeyedSubscript:",  @"lng"));
  if ((objc_opt_isKindOfClass(v150, v149) & 1) != 0) {
    v151 = (NSNumber *)v150;
  }
  else {
    v151 = 0LL;
  }

  longitude = v6->_longitude;
  v6->_longitude = v151;

  uint64_t v154 = objc_opt_class(&OBJC_CLASS___NSString, v153);
  id v155 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_eventDetails,  "objectForKeyedSubscript:",  @"cls"));
  if ((objc_opt_isKindOfClass(v155, v154) & 1) != 0) {
    v156 = (NSString *)v155;
  }
  else {
    v156 = 0LL;
  }

  deviceClass = v6->_deviceClass;
  v6->_deviceClass = v156;

  uint64_t v159 = objc_opt_class(&OBJC_CLASS___NSString, v158);
  id v160 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_eventDetails,  "objectForKeyedSubscript:",  @"dc"));
  if ((objc_opt_isKindOfClass(v160, v159) & 1) != 0) {
    v161 = (NSString *)v160;
  }
  else {
    v161 = 0LL;
  }

  deviceColor = v6->_deviceColor;
  v6->_deviceColor = v161;

  uint64_t v164 = objc_opt_class(&OBJC_CLASS___NSString, v163);
  id v165 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_eventDetails,  "objectForKeyedSubscript:",  @"dec"));
  if ((objc_opt_isKindOfClass(v165, v164) & 1) != 0) {
    v166 = (NSString *)v165;
  }
  else {
    v166 = 0LL;
  }

  deviceEnclosureColor = v6->_deviceEnclosureColor;
  v6->_deviceEnclosureColor = v166;

  uint64_t v169 = objc_opt_class(&OBJC_CLASS___NSDictionary, v168);
  id v170 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_userInfo,  "objectForKeyedSubscript:",  @"srdwa"));
  if ((objc_opt_isKindOfClass(v170, v169) & 1) != 0) {
    v171 = (NSDictionary *)v170;
  }
  else {
    v171 = 0LL;
  }

  walrusWebAccessInfo = v6->_walrusWebAccessInfo;
  v6->_walrusWebAccessInfo = v171;

  uint64_t v174 = objc_opt_class(&OBJC_CLASS___NSString, v173);
  id v175 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"wscUUID"));
  if ((objc_opt_isKindOfClass(v175, v174) & 1) != 0) {
    v176 = (NSString *)v175;
  }
  else {
    v176 = 0LL;
  }

  webSessionUUID = v6->_webSessionUUID;
  v6->_webSessionUUID = v176;

  uint64_t v179 = objc_opt_class(&OBJC_CLASS___NSNumber, v178);
  id v180 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"ttlMin"));
  if ((objc_opt_isKindOfClass(v180, v179) & 1) != 0) {
    v181 = (NSNumber *)v180;
  }
  else {
    v181 = 0LL;
  }

  ttlInMinutes = v6->_ttlInMinutes;
  v6->_ttlInMinutes = v181;

  uint64_t v184 = objc_opt_class(&OBJC_CLASS___NSNumber, v183);
  id v185 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"ts"));
  if ((objc_opt_isKindOfClass(v185, v184) & 1) != 0) {
    v186 = (NSNumber *)v185;
  }
  else {
    v186 = 0LL;
  }

  timestamp = v6->_timestamp;
  v6->_timestamp = v186;

  uint64_t v189 = objc_opt_class(&OBJC_CLASS___NSString, v188);
  id v190 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"app"));
  if ((objc_opt_isKindOfClass(v190, v189) & 1) != 0) {
    v191 = (NSString *)v190;
  }
  else {
    v191 = 0LL;
  }

  appName = v6->_appName;
  v6->_appName = v191;

  uint64_t v194 = objc_opt_class(&OBJC_CLASS___NSString, v193);
  id v195 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"stitleCDP"));
  if ((objc_opt_isKindOfClass(v195, v194) & 1) != 0) {
    v196 = (NSString *)v195;
  }
  else {
    v196 = 0LL;
  }

  secondaryTitleCDP = v6->_secondaryTitleCDP;
  v6->_secondaryTitleCDP = v196;

  uint64_t v199 = objc_opt_class(&OBJC_CLASS___NSString, v198);
  id v200 = (id)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v6->_walrusWebAccessInfo,  "objectForKeyedSubscript:",  @"sbdyCDP"));
  if ((objc_opt_isKindOfClass(v200, v199) & 1) != 0) {
    v201 = (NSString *)v200;
  }
  else {
    v201 = 0LL;
  }

  secondaryBodyCDP = v6->_secondaryBodyCDP;
  v6->_secondaryBodyCDP = v201;

LABEL_139:
  v203 = v6;

  return v203;
}

- (BOOL)isValidMessage
{
  if (!self->_command)
  {
    uint64_t v6 = _AKLogSystem(self);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001321C8(v5);
    }
    goto LABEL_7;
  }

  NSUInteger v2 = -[NSString length](self->_messageId, "length");
  BOOL v3 = v2 != 0;
  if (!v2)
  {
    uint64_t v4 = _AKLogSystem(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100132258(v5);
    }
LABEL_7:

    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> command: %lu, identifier: %@",  objc_opt_class(self, a2),  self,  self->_command,  self->_messageId);
}

- (APSIncomingMessage)message
{
  return self->_message;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)previousMessageId
{
  return self->_previousMessageId;
}

- (NSString)serverMachineId
{
  return self->_serverMachineId;
}

- (NSString)idmsData
{
  return self->_idmsData;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDictionary)alertInfo
{
  return self->_alertInfo;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (void)setAlertBody:(id)a3
{
}

- (NSString)lockScreenTitle
{
  return self->_lockScreenTitle;
}

- (void)setLockScreenTitle:(id)a3
{
}

- (NSString)lockScreenBody
{
  return self->_lockScreenBody;
}

- (void)setLockScreenBody:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)secondaryBody
{
  return self->_secondaryBody;
}

- (NSString)secondaryFooter
{
  return self->_secondaryFooter;
}

- (void)setSecondaryFooter:(id)a3
{
}

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (BOOL)requiresPasscode
{
  return self->_requiresPasscode;
}

- (NSDictionary)eventDetails
{
  return self->_eventDetails;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (BOOL)piggybackingRequestorUsesPresence
{
  return self->_piggybackingRequestorUsesPresence;
}

- (NSUUID)piggybackingRequestorPresenceSID
{
  return self->_piggybackingRequestorPresenceSID;
}

- (BOOL)piggybackingAcceptorSupportsPresence
{
  return self->_piggybackingAcceptorSupportsPresence;
}

- (BOOL)piggybackingIDMSFallbackApproved
{
  return self->_piggybackingIDMSFallbackApproved;
}

- (int64_t)piggybackingPresenceMode
{
  return self->_piggybackingPresenceMode;
}

- (unint64_t)piggybackingContext
{
  return self->_piggybackingContext;
}

- (NSDictionary)walrusWebAccessInfo
{
  return self->_walrusWebAccessInfo;
}

- (NSString)webSessionUUID
{
  return self->_webSessionUUID;
}

- (NSNumber)ttlInMinutes
{
  return self->_ttlInMinutes;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)secondaryTitleCDP
{
  return self->_secondaryTitleCDP;
}

- (void)setSecondaryTitleCDP:(id)a3
{
}

- (NSString)secondaryBodyCDP
{
  return self->_secondaryBodyCDP;
}

- (void)setSecondaryBodyCDP:(id)a3
{
}

- (NSDictionary)serverContext
{
  return self->_serverContext;
}

- (void).cxx_destruct
{
}

@end