pingHeartbeatMon()
{
    integer simPop = llGetRegionAgentCount();
    string heartbeatLink = "LINK-GOES-HERE.COM"; //Add Hearbeat Monitor for sites like Cronitor
    string simName = llGetRegionName();
    llHTTPRequest((string)heartbeatLink + "?msg=" + simName + " | FPS: " + (string)llGetRegionFPS() + ". Time Dilation: " + (string)llGetRegionTimeDilation() + ". Population: " + (string)simPop + ". ",[HTTP_METHOD,"GET"],"");
}

default {
    state_entry() {
        pingHeartbeatMon(); //Initial ping.
        llSetTimerEvent(60.0); //How often to send a 'heartbeat'
    }
    
    timer() {
        pingHeartbeatMon();
    }
    
}
