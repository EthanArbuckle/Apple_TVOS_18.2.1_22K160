@interface RTEntitlementProvider
+ (id)daemonProtocolEntitlementProvider;
+ (id)helperServiceProtocolEntitlementProvider;
+ (id)internalDaemonProtocolEntitlementProvider;
+ (id)safetyMonitorDaemonProtocolEntitlementProvider;
+ (id)selectorsForProtocol:(id)a3;
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4;
- (NSDictionary)entitlementsDictionary;
- (Protocol)protocol;
- (RTEntitlementProvider)init;
- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4;
- (void)setEntitlementsDictionary:(id)a3;
@end

@implementation RTEntitlementProvider

- (RTEntitlementProvider)init
{
  uint64_t v3 = objc_opt_class(self);
  sub_10000A2A8(v3, "initWithProtocol:entitlementsDictionary:");

  return 0LL;
}

- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    id v15 = sub_10000B294(&qword_10002D0A0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0LL;
      goto LABEL_10;
    }

    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: protocol";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_9;
  }

  if (!v8)
  {
    id v18 = sub_10000B294(&qword_10002D0A0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: entitlementsDictionary";
    goto LABEL_12;
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RTEntitlementProvider;
  v10 = -[RTEntitlementProvider init](&v20, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_protocol, a3);
    v12 = (NSDictionary *)[v9 copy];
    entitlementsDictionary = v11->_entitlementsDictionary;
    v11->_entitlementsDictionary = v12;
  }

  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

+ (id)daemonProtocolEntitlementProvider
{
  v255 = &OBJC_PROTOCOL___RTDaemonProtocol;
  v2 = NSStringFromSelector("setRoutineEnabled:reply:");
  v254 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v338[0] = v254;
  v337 = @"com.apple.CoreRoutine.preferences";
  v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v337, 1LL));
  v339[0] = v253;
  uint64_t v3 = NSStringFromSelector("clearRoutineWithReply:");
  v252 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v338[1] = v252;
  v336 = @"com.apple.CoreRoutine.preferences";
  v251 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v336, 1LL));
  v339[1] = v251;
  v4 = NSStringFromSelector("fetchPathToDiagnosticFilesWithOptions:reply:");
  v250 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v338[2] = v250;
  v335 = @"com.apple.CoreRoutine.preferences";
  v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v335, 1LL));
  v339[2] = v249;
  v5 = NSStringFromSelector("fetchRoutineEnabledWithReply:");
  v248 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v338[3] = v248;
  v339[3] = &__NSArray0__struct;
  v6 = NSStringFromSelector("setRestorationIdentifier:");
  v247 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v338[4] = v247;
  v339[4] = &__NSArray0__struct;
  id v7 = NSStringFromSelector("setTargetUserSession:");
  v246 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v338[5] = v246;
  v334 = @"com.apple.private.xpc.launchd.per-user-lookup";
  v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v334, 1LL));
  v339[5] = v245;
  id v8 = NSStringFromSelector("startMonitoringPlaceInferencesWithOptions:reply:");
  v244 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v338[6] = v244;
  v333 = @"com.apple.CoreRoutine.LocationOfInterest";
  v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v333, 1LL));
  v339[6] = v243;
  v9 = NSStringFromSelector("stopMonitoringPlaceInferencesWithReply:");
  v242 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v338[7] = v242;
  v332 = @"com.apple.CoreRoutine.LocationOfInterest";
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v332, 1LL));
  v339[7] = v241;
  v10 = NSStringFromSelector("fetchFamiliarityIndexResultsWithOptions:reply:");
  v240 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v338[8] = v240;
  v331 = @"com.apple.CoreRoutine.LocationOfInterest";
  v239 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v331, 1LL));
  v339[8] = v239;
  v11 = NSStringFromSelector("fetchLocationsOfInterestWithinDistance:ofLocation:reply:");
  v238 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v338[9] = v238;
  v330 = @"com.apple.CoreRoutine.LocationOfInterest";
  v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v330, 1LL));
  v339[9] = v237;
  v12 = NSStringFromSelector("fetchLocationsOfInterestOfType:reply:");
  v236 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v338[10] = v236;
  v329 = @"com.apple.CoreRoutine.LocationOfInterest";
  v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v329, 1LL));
  v339[10] = v235;
  v13 = NSStringFromSelector("fetchAllLocationsOfInterestForSettingsWithReply:");
  v234 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v338[11] = v234;
  v328[0] = @"com.apple.CoreRoutine.LocationOfInterest";
  v328[1] = @"com.apple.CoreRoutine.preferences";
  v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v328, 2LL));
  v339[11] = v233;
  v14 = NSStringFromSelector("fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:reply:");
  v232 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v338[12] = v232;
  v327 = @"com.apple.CoreRoutine.LocationOfInterest";
  v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v327, 1LL));
  v339[12] = v231;
  id v15 = NSStringFromSelector("fetchPlaceInferencesWithOptions:reply:");
  v230 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v338[13] = v230;
  v326 = @"com.apple.CoreRoutine.LocationOfInterest";
  v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v326, 1LL));
  v339[13] = v229;
  v16 = NSStringFromSelector("fetchFormattedPostalAddressesFromMeCard:");
  v228 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v338[14] = v228;
  v325 = @"com.apple.CoreRoutine.LocationOfInterest";
  v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v325, 1LL));
  v339[14] = v227;
  v17 = NSStringFromSelector("fetchRoutineModeFromLocation:reply:");
  v226 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v338[15] = v226;
  v324 = @"com.apple.CoreRoutine.LocationOfInterest";
  v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v324, 1LL));
  v339[15] = v225;
  id v18 = NSStringFromSelector("fetchLocationsOfInterestAssociatedToIdentifier:reply:");
  v224 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v338[16] = v224;
  v323 = @"com.apple.CoreRoutine.LocationOfInterest";
  v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v323, 1LL));
  v339[16] = v223;
  v19 = NSStringFromSelector("fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:reply:");
  v222 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v338[17] = v222;
  v322 = @"com.apple.CoreRoutine.LocationOfInterest";
  v221 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v322, 1LL));
  v339[17] = v221;
  objc_super v20 = NSStringFromSelector("fetchPredictedLocationsOfInterestOnDate:reply:");
  v220 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v338[18] = v220;
  v321 = @"com.apple.CoreRoutine.LocationOfInterest";
  v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v321, 1LL));
  v339[18] = v219;
  v21 = NSStringFromSelector("fetchCurrentPredictedLocationsOfInterestLookingBack:lookingAhead:reply:");
  v218 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v338[19] = v218;
  v320 = @"com.apple.CoreRoutine.LocationOfInterest";
  v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v320, 1LL));
  v339[19] = v217;
  v22 = NSStringFromSelector("performBluePOIQueryLookingBack:lookingAhead:reply:");
  v216 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v338[20] = v216;
  v319 = @"com.apple.CoreRoutine.LocationOfInterest";
  v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v319, 1LL));
  v339[20] = v215;
  v23 = NSStringFromSelector("fetchLocationOfInterestWithIdentifier:reply:");
  v214 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v338[21] = v214;
  v318 = @"com.apple.CoreRoutine.LocationOfInterest";
  v213 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v318, 1LL));
  v339[21] = v213;
  v24 = NSStringFromSelector("fetchLocationsOfInterestVisitedBetweenStartDate:endDate:reply:");
  v212 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v338[22] = v212;
  v317 = @"com.apple.CoreRoutine.LocationOfInterest";
  v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v317, 1LL));
  v339[22] = v211;
  v25 = NSStringFromSelector("fetchLocationOfInterestAtLocation:reply:");
  v210 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v338[23] = v210;
  v316 = @"com.apple.CoreRoutine.LocationOfInterest";
  v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v316, 1LL));
  v339[23] = v209;
  v26 = NSStringFromSelector("fetchLocationOfInterestForRegion:reply:");
  v208 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v338[24] = v208;
  v315 = @"com.apple.CoreRoutine.LocationOfInterest";
  v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v315, 1LL));
  v339[24] = v207;
  v27 = NSStringFromSelector("addLocationOfInterestOfType:mapItemStorage:customLabel:reply:");
  v206 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v338[25] = v206;
  v314 = @"com.apple.CoreRoutine.LocationOfInterest";
  v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v314, 1LL));
  v339[25] = v205;
  v28 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:reply:");
  v204 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v338[26] = v204;
  v313 = @"com.apple.CoreRoutine.LocationOfInterest";
  v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v313, 1LL));
  v339[26] = v203;
  v29 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:customLabel:reply:");
  v202 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v338[27] = v202;
  v312 = @"com.apple.CoreRoutine.LocationOfInterest";
  v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v312, 1LL));
  v339[27] = v201;
  v30 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:mapItemStorage:reply:");
  v200 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v338[28] = v200;
  v311 = @"com.apple.CoreRoutine.LocationOfInterest";
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v311, 1LL));
  v339[28] = v199;
  v31 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:customLabel:reply:");
  v198 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v338[29] = v198;
  v310 = @"com.apple.CoreRoutine.LocationOfInterest";
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v310, 1LL));
  v339[29] = v197;
  v32 = NSStringFromSelector("updateLocationOfInterestWithIdentifier:type:mapItemStorage:customLabel:reply:");
  v196 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v338[30] = v196;
  v309 = @"com.apple.CoreRoutine.LocationOfInterest";
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v309, 1LL));
  v339[30] = v195;
  v33 = NSStringFromSelector("fetchTransitionsBetweenStartDate:endDate:reply:");
  v194 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v338[31] = v194;
  v308 = @"com.apple.CoreRoutine.LocationOfInterest";
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v308, 1LL));
  v339[31] = v193;
  v34 = NSStringFromSelector("fetchDedupedLocationOfInterestIdentifiersWithIdentifier:reply:");
  v192 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v338[32] = v192;
  v307 = @"com.apple.CoreRoutine.LocationOfInterest";
  v191 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v307, 1LL));
  v339[32] = v191;
  v35 = NSStringFromSelector("fetchAuthorizedLocationStatus:");
  v190 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v338[33] = v190;
  v306 = @"com.apple.CoreRoutine.AuthorizedLocation";
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v306, 1LL));
  v339[33] = v189;
  v36 = NSStringFromSelector("setHintForRegionState:significantRegion:reply:");
  v188 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v338[34] = v188;
  v305 = @"com.apple.CoreRoutine.LocationOfInterest";
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v305, 1LL));
  v339[34] = v187;
  v37 = NSStringFromSelector("fetchPredictedExitDatesFromLocation:onDate:reply:");
  v186 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v338[35] = v186;
  v304 = @"com.apple.CoreRoutine.Prediction";
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v304, 1LL));
  v339[35] = v185;
  v38 = NSStringFromSelector("fetchPredictedLocationsOfInterestBetweenStartDate:endDate:reply:");
  v184 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v338[36] = v184;
  v303 = @"com.apple.CoreRoutine.Prediction";
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v303, 1LL));
  v339[36] = v183;
  v39 = NSStringFromSelector("userInteractionWithPredictedLocationOfInterest:interaction:feedback:geoMapItem:reply:");
  v182 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v338[37] = v182;
  v302 = @"com.apple.CoreRoutine.Prediction";
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v302, 1LL));
  v339[37] = v181;
  v40 = NSStringFromSelector("startMonitoringVehicleEventsWithReply:");
  v180 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v338[38] = v180;
  v301 = @"com.apple.CoreRoutine.VehicleLocation";
  v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v301, 1LL));
  v339[38] = v179;
  v41 = NSStringFromSelector("stopMonitoringVehicleEventsWithReply:");
  v178 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v338[39] = v178;
  v300 = @"com.apple.CoreRoutine.VehicleLocation";
  v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v300, 1LL));
  v339[39] = v177;
  v42 = NSStringFromSelector("fetchLastVehicleEventsWithReply:");
  v176 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v338[40] = v176;
  v299 = @"com.apple.CoreRoutine.VehicleLocation";
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v299, 1LL));
  v339[40] = v175;
  v43 = NSStringFromSelector("vehicleEventAtLocation:notes:reply:");
  v174 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v338[41] = v174;
  v298 = @"com.apple.CoreRoutine.VehicleLocation";
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v298, 1LL));
  v339[41] = v173;
  v44 = NSStringFromSelector("clearAllVehicleEventsWithReply:");
  v172 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v338[42] = v172;
  v297 = @"com.apple.CoreRoutine.VehicleLocation";
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v297, 1LL));
  v339[42] = v171;
  v45 = NSStringFromSelector("updateVehicleEventWithIdentifier:notes:reply:");
  v170 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v338[43] = v170;
  v296 = @"com.apple.CoreRoutine.VehicleLocation";
  v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v296, 1LL));
  v339[43] = v169;
  v46 = NSStringFromSelector("updateVehicleEventWithIdentifier:photo:reply:");
  v168 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v338[44] = v168;
  v295 = @"com.apple.CoreRoutine.VehicleLocation";
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v295, 1LL));
  v339[44] = v167;
  v47 = NSStringFromSelector("updateVehicleEventWithIdentifier:geoMapItem:reply:");
  v166 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v338[45] = v166;
  v294 = @"com.apple.CoreRoutine.VehicleLocation";
  v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v294, 1LL));
  v339[45] = v165;
  v48 = NSStringFromSelector("updateVehicleEventWithIdentifier:location:reply:");
  v164 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v338[46] = v164;
  v293 = @"com.apple.CoreRoutine.VehicleLocation";
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v293, 1LL));
  v339[46] = v163;
  v49 = NSStringFromSelector("engageInVehicleEventWithIdentifier:reply:");
  v162 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v338[47] = v162;
  v292 = @"com.apple.CoreRoutine.VehicleLocation";
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v292, 1LL));
  v339[47] = v161;
  v50 = NSStringFromSelector("fetchAutomaticVehicleEventDetectionSupportedWithReply:");
  v160 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v338[48] = v160;
  v291 = @"com.apple.CoreRoutine.VehicleLocation";
  v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v291, 1LL));
  v339[48] = v159;
  v51 = NSStringFromSelector("removeLocationOfInterestWithIdentifier:reply:");
  v158 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v338[49] = v158;
  v290 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v290, 1LL));
  v339[49] = v157;
  v52 = NSStringFromSelector("removeVisitWithIdentifier:reply:");
  v156 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v338[50] = v156;
  v289 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v289, 1LL));
  v339[50] = v155;
  v53 = NSStringFromSelector("extendLifetimeOfVisitsWithIdentifiers:reply:");
  v154 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v338[51] = v154;
  v288 = @"com.apple.CoreRoutine.LocationOfInterest.ExtendLifetime";
  v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v288, 1LL));
  v339[51] = v153;
  v54 = NSStringFromSelector("fetchCloudSyncAuthorizationStateWithReply:");
  v152 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v338[52] = v152;
  v287 = @"com.apple.CoreRoutine.CloudSync";
  v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v287, 1LL));
  v339[52] = v151;
  v55 = NSStringFromSelector("updateCloudSyncProvisionedForAccount:reply:");
  v150 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v338[53] = v150;
  v286 = @"com.apple.CoreRoutine.CloudSync";
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v286, 1LL));
  v339[53] = v149;
  v56 = NSStringFromSelector("fetchLookbackWindowStartDateWithLocation:reply:");
  v148 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v338[54] = v148;
  v285 = @"com.apple.CoreRoutine.StoredLocation";
  v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v285, 1LL));
  v339[54] = v147;
  v57 = NSStringFromSelector("fetchStoredLocationsWithContext:reply:");
  v146 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v338[55] = v146;
  v284 = @"com.apple.CoreRoutine.StoredLocation";
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v284, 1LL));
  v339[55] = v145;
  v58 = NSStringFromSelector("fetchEstimatedLocationAtDate:options:reply:");
  v144 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v338[56] = v144;
  v283 = @"com.apple.CoreRoutine.StoredLocation";
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v283, 1LL));
  v339[56] = v143;
  v59 = NSStringFromSelector("startMonitoringVisitsWithReply:");
  v142 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v338[57] = v142;
  v282 = @"com.apple.CoreRoutine.Visit";
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v282, 1LL));
  v339[57] = v141;
  v60 = NSStringFromSelector("stopMonitoringVisitsWithReply:");
  v140 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v338[58] = v140;
  v281 = @"com.apple.CoreRoutine.Visit";
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v281, 1LL));
  v339[58] = v139;
  v61 = NSStringFromSelector("startLeechingVisitsWithReply:");
  v138 = (void *)objc_claimAutoreleasedReturnValue(v61);
  v338[59] = v138;
  v280 = @"com.apple.CoreRoutine.Visit";
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v280, 1LL));
  v339[59] = v136;
  v62 = NSStringFromSelector("stopLeechingVisitsWithReply:");
  v135 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v338[60] = v135;
  v279 = @"com.apple.CoreRoutine.Visit";
  v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v279, 1LL));
  v339[60] = v134;
  v63 = NSStringFromSelector("startLeechingLowConfidenceVisitsWithReply:");
  v133 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v338[61] = v133;
  v278 = @"com.apple.CoreRoutine.Visit";
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v278, 1LL));
  v339[61] = v132;
  v64 = NSStringFromSelector("stopLeechingLowConfidenceVisitsWithReply:");
  v131 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v338[62] = v131;
  v277 = @"com.apple.CoreRoutine.Visit";
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v277, 1LL));
  v339[62] = v130;
  v65 = NSStringFromSelector("fetchStoredVisitsWithOptions:reply:");
  v129 = (void *)objc_claimAutoreleasedReturnValue(v65);
  v338[63] = v129;
  v276 = @"com.apple.CoreRoutine.Visit";
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v276, 1LL));
  v339[63] = v128;
  v66 = NSStringFromSelector("processHindsightVisitsWithReply:");
  v127 = (void *)objc_claimAutoreleasedReturnValue(v66);
  v338[64] = v127;
  v275 = @"com.apple.CoreRoutine.Visit";
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v275, 1LL));
  v339[64] = v126;
  v67 = NSStringFromSelector("fetchTripSegmentsWithOptions:reply:");
  v125 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v338[65] = v125;
  v274 = @"com.apple.CoreRoutine.TripSegment";
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v274, 1LL));
  v339[65] = v124;
  v68 = NSStringFromSelector("fetchLocationsCountForTripSegmentWithOptions:reply:");
  v123 = (void *)objc_claimAutoreleasedReturnValue(v68);
  v338[66] = v123;
  v273 = @"com.apple.CoreRoutine.TripSegment";
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v273, 1LL));
  v339[66] = v122;
  v69 = NSStringFromSelector("fetchLocationsForTripSegmentWithOptions:reply:");
  v121 = (void *)objc_claimAutoreleasedReturnValue(v69);
  v338[67] = v121;
  v272 = @"com.apple.CoreRoutine.TripSegment";
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v272, 1LL));
  v339[67] = v120;
  v70 = NSStringFromSelector("deleteTripSegmentWithUUID:reply:");
  v119 = (void *)objc_claimAutoreleasedReturnValue(v70);
  v338[68] = v119;
  v271 = @"com.apple.CoreRoutine.TripSegment";
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v271, 1LL));
  v339[68] = v118;
  v71 = NSStringFromSelector("fetchVehiclesWithOptions:reply:");
  v117 = (void *)objc_claimAutoreleasedReturnValue(v71);
  v338[69] = v117;
  v270 = @"com.apple.CoreRoutine.TripSegment";
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v270, 1LL));
  v339[69] = v116;
  v72 = NSStringFromSelector("fetchTripSegmentMetadataWithOptions:reply:");
  v115 = (void *)objc_claimAutoreleasedReturnValue(v72);
  v338[70] = v115;
  v269 = @"com.apple.CoreRoutine.TripSegment";
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v269, 1LL));
  v339[70] = v114;
  v73 = NSStringFromSelector("fetchBackgroundInertialOdometrySamplesWithOptions:reply:");
  v113 = (void *)objc_claimAutoreleasedReturnValue(v73);
  v338[71] = v113;
  v268 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v268, 1LL));
  v339[71] = v112;
  v74 = NSStringFromSelector("addBackgroundInertialOdometrySamples:reply:");
  v111 = (void *)objc_claimAutoreleasedReturnValue(v74);
  v338[72] = v111;
  v267 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v267, 1LL));
  v339[72] = v110;
  v75 = NSStringFromSelector("startMonitoringScenarioTriggerOfType:reply:");
  v109 = (void *)objc_claimAutoreleasedReturnValue(v75);
  v338[73] = v109;
  v266 = @"com.apple.CoreRoutine.ScenarioTrigger";
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v266, 1LL));
  v339[73] = v108;
  v76 = NSStringFromSelector("stopMonitoringScenarioTriggerOfType:reply:");
  v107 = (void *)objc_claimAutoreleasedReturnValue(v76);
  v338[74] = v107;
  v265 = @"com.apple.CoreRoutine.ScenarioTrigger";
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v265, 1LL));
  v339[74] = v106;
  v77 = NSStringFromSelector("fetchMonitoredScenarioTriggerTypesWithReply:");
  v105 = (void *)objc_claimAutoreleasedReturnValue(v77);
  v338[75] = v105;
  v264 = @"com.apple.CoreRoutine.ScenarioTrigger";
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v264, 1LL));
  v339[75] = v104;
  v78 = NSStringFromSelector("fetchEnumerableObjectsWithOptions:offset:reply:");
  v103 = (void *)objc_claimAutoreleasedReturnValue(v78);
  v338[76] = v103;
  v79 = (objc_class *)objc_opt_class(&OBJC_CLASS___RTLocationOfInterestEnumerationOptions);
  v80 = NSStringFromClass(v79);
  v102 = (void *)objc_claimAutoreleasedReturnValue(v80);
  v262[0] = v102;
  v261 = @"com.apple.CoreRoutine.LocationOfInterest";
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v261, 1LL));
  v263[0] = v101;
  v81 = (objc_class *)objc_opt_class(&OBJC_CLASS___RTStoredHintEnumerationOptions);
  v82 = NSStringFromClass(v81);
  v100 = (void *)objc_claimAutoreleasedReturnValue(v82);
  v262[1] = v100;
  v260 = @"com.apple.CoreRoutine.Hint";
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v260, 1LL));
  v263[1] = v83;
  v84 = (objc_class *)objc_opt_class(&OBJC_CLASS___RTStoredLocationEnumerationOptions);
  v85 = NSStringFromClass(v84);
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  v262[2] = v86;
  v259 = @"com.apple.CoreRoutine.StoredLocation";
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v259, 1LL));
  v263[2] = v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v263,  v262,  3LL));
  v339[76] = v88;
  v89 = NSStringFromSelector("fetchElevationsWithOptions:reply:");
  v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
  v338[77] = v90;
  v258 = @"com.apple.CoreRoutine.StoredElevation";
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v258, 1LL));
  v339[77] = v91;
  v92 = NSStringFromSelector("addElevations:handler:");
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  v338[78] = v93;
  v257 = @"com.apple.CoreRoutine.StoredElevation";
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v257, 1LL));
  v339[78] = v94;
  v95 = NSStringFromSelector("fetchRemoteStatusWithReply:");
  v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
  v338[79] = v96;
  v256 = @"com.apple.CoreRoutine.RemoteStatus";
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v256, 1LL));
  v339[79] = v97;
  v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v339,  v338,  80LL));

  v98 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]( objc_alloc(&OBJC_CLASS___RTEntitlementProvider),  "initWithProtocol:entitlementsDictionary:",  v255,  v137);
  return v98;
}

+ (id)internalDaemonProtocolEntitlementProvider
{
  uint64_t v3 = &OBJC_PROTOCOL___RTDaemonInternalProtocol;
  id v4 = [(id)objc_opt_class(a1) selectorsForProtocol:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
        objc_super v20 = @"com.apple.CoreRoutine.Internal";
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL,  (void)v16));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v13, v12);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v9);
  }

  v14 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]( objc_alloc(&OBJC_CLASS___RTEntitlementProvider),  "initWithProtocol:entitlementsDictionary:",  v3,  v6);
  return v14;
}

+ (id)helperServiceProtocolEntitlementProvider
{
  uint64_t v3 = &OBJC_PROTOCOL___RTHelperServiceProtocol;
  id v4 = [(id)objc_opt_class(a1) selectorsForProtocol:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
        objc_super v20 = @"com.apple.CoreRoutine.MapItemService";
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL,  (void)v16));
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v13, v12);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v9);
  }

  v14 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]( objc_alloc(&OBJC_CLASS___RTEntitlementProvider),  "initWithProtocol:entitlementsDictionary:",  v3,  v6);
  return v14;
}

+ (id)safetyMonitorDaemonProtocolEntitlementProvider
{
  v32[0] = &OBJC_PROTOCOL___SMDaemonProtocol;
  v32[1] = &OBJC_PROTOCOL___SMDeviceConfigurationProtocol;
  v32[2] = &OBJC_PROTOCOL___SMEligibilityProtocol;
  v32[3] = &OBJC_PROTOCOL___SMIDSMessengerProtocolPrivate;
  v32[4] = &OBJC_PROTOCOL___SMInitiatorCacheProtocol;
  v32[5] = &OBJC_PROTOCOL___SMInitiatorDestinationBoundSessionProtocol;
  v32[6] = &OBJC_PROTOCOL___SMInitiatorGroupChatProtocol;
  v32[7] = &OBJC_PROTOCOL___SMInitiatorProtocol;
  v32[8] = &OBJC_PROTOCOL___SMInitiatorSafetyCacheMonitoringProtocol;
  v32[9] = &OBJC_PROTOCOL___SMInitiatorSessionConfigurationProtocol;
  v32[10] = &OBJC_PROTOCOL___SMInitiatorSessionMonitorProtocol;
  v32[11] = &OBJC_PROTOCOL___SMMadridMessengerProtocol;
  v32[12] = &OBJC_PROTOCOL___SMMadridMessengerProtocolPrivate;
  v32[13] = &OBJC_PROTOCOL___SMReceiverMonitorProtocol;
  v32[14] = &OBJC_PROTOCOL___SMReceiverProtocol;
  v32[15] = &OBJC_PROTOCOL___SMSessionStoreProtocol;
  v32[16] = &OBJC_PROTOCOL___SMSuggestionsProtocol;
  v32[17] = &OBJC_PROTOCOL___SMSuggestionsHelperProtocol;
  v32[18] = &OBJC_PROTOCOL___SMSuggestionsStoreProtocol;
  v32[19] = &OBJC_PROTOCOL___SMUserNotificationProtocol;
  v32[20] = &OBJC_PROTOCOL___SMWorkoutSnapshotProtocol;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 21LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v3;
  id v20 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = [(id)objc_opt_class(a1) selectorsForProtocol:*(void *)(*((void *)&v25 + 1) + 8 * (void)i)];
        id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (j = 0LL; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12));

              if (!v13)
              {
                v29 = @"com.apple.CoreRoutine.SafetyMonitor";
                v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL));
                -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v12);
              }
            }

            id v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
          }

          while (v9);
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v20);
  }

  id v15 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]( objc_alloc(&OBJC_CLASS___RTEntitlementProvider),  "initWithProtocol:entitlementsDictionary:",  &OBJC_PROTOCOL___SMDaemonProtocol,  v4);
  return v15;
}

+ (id)selectorsForProtocol:(id)a3
{
  uint64_t v3 = (Protocol *)a3;
  id v4 = v3;
  if (v3)
  {
    v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
    id v6 = protocol_copyMethodDescriptionList(v4, 0, 1, &v22);
    id v7 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v8 = -[NSMutableSet initWithCapacity:](v7, "initWithCapacity:", outCount);
    if (outCount)
    {
      unint64_t v9 = 0LL;
      p_name = &v5->name;
      do
      {
        v11 = *p_name;
        p_name += 2;
        uint64_t v12 = NSStringFromSelector(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        -[NSMutableSet addObject:](v8, "addObject:", v13);

        ++v9;
      }

      while (v9 < outCount);
    }

    if (v22)
    {
      unint64_t v14 = 0LL;
      id v15 = &v6->name;
      do
      {
        __int128 v16 = *v15;
        v15 += 2;
        __int128 v17 = NSStringFromSelector(v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        -[NSMutableSet addObject:](v8, "addObject:", v18);

        ++v14;
      }

      while (v14 < v22);
    }

    free(v5);
    free(v6);
  }

  else
  {
    id v19 = sub_10000B294(&qword_10002D0A0);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: protocol",  buf,  2u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v24 = sub_10000B294(&qword_10002D0A0);
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int128 v25 = "Invalid parameter not satisfying: connection";
LABEL_13:
      __int128 v27 = buf;
LABEL_14:
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v25, v27, 2u);
    }

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v11 = sub_10000B294(&qword_10002D0A0);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      unsigned __int8 v10 = 0;
      goto LABEL_11;
    }

    __int16 v18 = 0;
    v13 = "Invalid parameter not satisfying: connection";
    unint64_t v14 = (uint8_t *)&v18;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    goto LABEL_8;
  }

  if (!v6)
  {
    id v15 = sub_10000B294(&qword_10002D0A0);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v17 = 0;
    v13 = "Invalid parameter not satisfying: entitlement";
    unint64_t v14 = (uint8_t *)&v17;
    goto LABEL_13;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v6]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    unsigned __int8 v10 = [v8 BOOLValue];
  }
  else {
    unsigned __int8 v10 = 0;
  }

LABEL_11:
  return v10;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSDictionary)entitlementsDictionary
{
  return self->_entitlementsDictionary;
}

- (void)setEntitlementsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end